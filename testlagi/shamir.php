<?php
/* Shamir's Secret Sharing class
 *
 * Provides an implementation of Shamir's Secret Sharing algorithm to 
 * securely share a secret between N people requiring Q people to recover
 * the original secret.
 *
 * Based on the perl implemetation by Charles Karney, found at:-
 * http://charles.karney.info/misc/secret.html
 * 
 * Copyright (C) 2010 Kenny Millington
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
class Shamir {
    /**
     * @var Q needs to be a prime > max(2^8, $number)
     */
    const Q = 257;
    
    /** 
     * @var $_invtab Cache of the inverse table.
     */
    private static $_invtab;

    private static function modq($number) {
        $mod = $number % self::Q;
        return ($mod < 0) ? $mod + self::Q : $mod;
    }    
 
    private static function invtab() {
        if(!isset(self::$_invtab)) {
            $x = $y = 1;
            self::$_invtab = array(0=>0);
            for($i=0; $i < self::Q; $i++) {
                self::$_invtab[$x] = $y;
                $x = self::modq(3 * $x);
                $y = self::modq(86 * $y);
            }
        }

        return  self::$_invtab;
    }

    private static function horner($x, $coeffs) {
        $val = 0;
        foreach($coeffs as $c)
            $val = self::modq($x * $val + $c);
        return $val;
    }
    
    private static function inv($i) {
        $invtab = self::invtab();
        return ($i < 0) ? self::modq(-$invtab[-$i]) : $invtab[$i];
    }

    private static function coeffs($quorum) {
        $coeffs = array();
        for($i=0; $i < $quorum - 1; $i++) 
            $coeffs[] = self::modq(mt_rand(0, 65535));
        return $coeffs;
    }

    private static function rcoeffs($key_x, $quorum) {
        $coeffs = array();

        for($i=0; $i < $quorum; $i++) {
            $temp = 1;
            for($j=0; $j < $quorum; $j++) {
                if($i != $j) {
                    $temp = self::modq(-$temp * $key_x[$j] * 
                             self::inv($key_x[$i]-$key_x[$j]));
                }
            }
            
            if($temp == 0) {
                /* Repeated share. */
                throw new Exception(
                    "Shamir->rcoeffs(): Repeated share detected - ".
                    "cannot compute reverse-coefficients!"
                );
            }
            
            $coeffs[] = $temp;
        }

        return $coeffs;
    }

    private static function thresh($byte, $number, $quorum) {
        $coeffs = self::coeffs($quorum);
        $coeffs[] = $byte;

        $result = array();
        for($i=0; $i < $number; $i++)
            $result[] = self::horner($i + 1, $coeffs);  
        
        return $result; 
    }

    public static function share($secret, $number, $quorum=NULL) {
        if($number > self::Q - 1 || $number < 0) { 
            throw new Exception(
                "Shamir->share(): number ($number) needs to be between 0 and ".
                (self::Q - 1) . "."
            );
        }

        if(is_null($quorum)) {
            $quorum = floor($number/2) + 1;
        } elseif($quorum > $number) {
            throw new Exception(
                "Shamir->share(): Quorum ($quorum) cannot exceed number ".
                "($number)."
            );
        }

        $result = array();
        
        foreach(unpack("C*", $secret) as $byte) {
            foreach(self::thresh($byte, $number, $quorum) as $sub_result)
                $result[] = $sub_result;
        }
        
        $keys = array();
        
        for($i = 0; $i < $number; $i++) {
            $key = sprintf("%02x%02x", $quorum, $i+1);
            for($j = 0; $j < strlen($secret); $j++) {
                $key .= ($result[$j * $number + $i] == 256) ? "g0" : 
                            sprintf("%02x", $result[$j * $number + $i]);
            }
            $keys[] = substr($key, 0);
        }

        return $keys;
    }
    
    public static function recover($keys) {
        $key_x = array();
        $key_y = array();

        foreach($keys as $key) {
            $quorum = intval(substr($key, 0, 2));
            $number = intval(substr($key, 2, 2));
            $key = substr($key, 4);
            $keylen = strlen($key);     
            $key_x[] = $number;
            for($i=0; $i < strlen($key); $i+=2) {
                $key_y[] = (substr($key, $i, 2) == "g0") ? 
                                256 : 
                                hexdec(substr($key, $i, 2));
            }
        }
        
        $keylen /= 2;

        $coeffs = self::rcoeffs($key_x, $quorum);
        
        $secret = "";
        for($i=0; $i < $keylen; $i++) {
            $temp = 0;
            for($j=0; $j < $quorum; $j++) {
                $temp = self::modq($temp + $key_y[$keylen * $j + $i] *
                                   $coeffs[$j]);
            }
            $secret .= chr($temp);
        }

        return $secret;
    }
}

/*
 * A simple test case if we're being run directly rather than being included
 * anywhere. 
 */
if(basename($_SERVER['PHP_SELF']) == basename(__FILE__)) {
    $secret = "aaaaa";
    $quorum = 2;
    $number = 4;
    $parts = Shamir::share($secret, $number, $quorum);
    print_r($parts);
    echo "Secret: " . Shamir::recover(array_slice($parts,0,$quorum)) . "\n";
}

?>