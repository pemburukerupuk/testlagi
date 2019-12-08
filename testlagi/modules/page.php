<?php
$page = !empty($_GET['page']) ? $_GET['page'] : '';
switch ($page){
    //General
    case '':
        include 'mainmenu/dashboard.php';
        break;
    case 'dashboard':
        include 'mainmenu/dashboard.php';
        break;
    case 'menu_file':
        include 'mainmenu/menu_file.php';
        break;
    case 'menu_requestfile':
        include 'mainmenu/menu_requestfile.php';
        break;
    //End General
    //Personal
    case 'my_transaction':
        include 'personal/transaction/my_transaction.php';
        break;
    case 'my_account':
        include 'personal/account/my_account.php';
        break;
    case 'my_account_edituser':
        include 'personal/account/my_account_edituser.php';
        break;
    case 'my_account_prosesedituser':
        include 'personal/account/my_account_prosesedituser.php';
        break;
    //End Personal
    

    //Administrator
    case 'master_level':
        include 'level/master_level.php';
        break;
    case 'log_level':
        include 'level/log_level.php';
        break;
    case 'tambah_level':
        include 'level/tambah_level.php';
        break;
    case 'prosestambah_level':
        include 'level/prosestambah_level.php';
        break;
    case 'edit_level':
        include 'level/edit_level.php';
        break;
    case 'prosesedit_level':
        include 'level/prosesedit_level.php';
        break;
    case 'prosesdelete_level':
        include 'level/prosesdelete_level.php';
        break;
        
    case 'master_company':
        include 'company/master_company.php';
        break;
    case 'log_company':
        include 'company/log_company.php';
        break;
    case 'tambah_company':
        include 'company/tambah_company.php';
        break;
    case 'prosestambah_company':
        include 'company/prosestambah_company.php';
        break;
    case 'edit_company':
        include 'company/edit_company.php';
        break;
    case 'prosesedit_company':
        include 'company/prosesedit_company.php';
        break;
    case 'prosesdelete_company':
        include 'company/prosesdelete_company.php';
        break;

    case 'master_user':
        include 'user/master_user.php';
        break;
    case 'log_user':
        include 'user/log_user.php';
        break;
    case 'tambah_user':
        include 'user/tambah_user.php';
        break;
    case 'prosestambah_user':
        include 'user/prosestambah_user.php';
        break;
    case 'edit_user':
        include 'user/edit_user.php';
        break;
    case 'prosesedit_user':
        include 'user/prosesedit_user.php';
        break;
    case 'prosesdelete_user':
        include 'user/prosesdelete_user.php';
        break;

    case 'open_file':
        include 'file/open_file.php';
        break;
     case 'master_file':
        include 'file/master_file.php';
        break;
    case 'detail_file':
        include 'file/detail_file.php';
        break;
    case 'log_file':
        include 'file/log_file.php';
        break;
    case 'tambah_file':
        include 'file/tambah_file.php';
        break;
    case 'prosestambah_file':
        include 'file/prosestambah_file.php';
        break; 
    case 'edit_file':
        include 'file/edit_file.php';
        break;
    case 'prosesedit_file':
        include 'file/prosesedit_file.php';
        break; 
    case 'prosesdelete_file':
        include 'file/prosesdelete_file.php';
        break;

    case 'master_share':
        include 'share/master_share.php';
        break;
    case 'log_share':
        include 'share/log_share.php';
        break;
    case 'tambah_share':
        include 'share/tambah_share.php';
        break;
    case 'prosestambah_share':
        include 'share/prosestambah_share.php';
        break; 
    case 'edit_share':
        include 'share/edit_share.php';
        break;
    case 'prosesedit_share':
        include 'share/prosesedit_share.php';
        break; 
    case 'prosesdelete_share':
        include 'share/prosesdelete_share.php';
        break;

    case 'master_transaction':
        include 'transaction/master_transaction.php';
        break;
    case 'log_transaction':
        include 'transaction/log_transaction.php';
        break;
    case 'tambah_transaction':
        include 'transaction/tambah_transaction.php';
        break;
    case 'prosestambah_transaction':
        include 'transaction/prosestambah_transaction.php';
        break;
    case 'prosesdelete_transaction':
        include 'transaction/prosesdelete_transaction.php';
        break;

    case 'master_recovery':
        include 'recovery/master_recovery.php';
        break;
    case 'log_recovery':
        include 'recovery/log_recovery.php';
        break;
    case 'edit_recovery':
        include 'recovery/edit_recovery.php';
        break;
    case 'prosesedit_recovery':
        include 'recovery/prosesedit_recovery.php';
        break;
    case 'tambah_recovery':
        include 'recovery/tambah_recovery.php';
        break;
    case 'prosestambah_recovery':
        include 'recovery/prosestambah_recovery.php';
        break;
    case 'prosesdelete_recovery':
        include 'recovery/prosesdelete_recovery.php';
        break;

    case 'master_report':
        include 'report/master_report.php';
        break;
    case 'report_user':
        include 'report/report_user.php';
        break;
    case 'report_file':
        include 'report/report_file.php';
        break;
    case 'report_view_file':
        include 'report/report_view_file.php';
        break;

     case 'counter_page':
        include 'report/counter_page.php';
        break;
    case 'masterdatametode':
        include 'metode/masterdatametode.php';
        break;
    case 'master_metode':
        include 'metode/master_metode.php';
        break;
     case 'recovery_metode':
        include 'metode/recovery_metode.php';
        break;

     case 'testskill':
        include 'metode/testskill.php';
        break;
    case 'prosestestskill':
        include 'metode/prosestestskill.php';
        break;
    // End Administrator
   
    //Data Warehouse
    case 'w_open_file':
        include 'warehouse/file/open_file.php';   
        break;
    case 'w_master_file':
        include 'warehouse/file/master_file.php';
        break;
    case 'w_detail_file':
        include 'warehouse/file/detail_file.php';
        break;
    case 'w_tambah_file':
        include 'warehouse/file/tambah_file.php';
        break;
    case 'w_prosestambah_file':
        include 'warehouse/file/prosestambah_file.php';
        break; 
    case 'w_edit_file':
        include 'warehouse/file/edit_file.php';
        break;
    case 'w_prosesedit_file':
        include 'warehouse/file/prosesedit_file.php';
        break; 
    case 'w_prosesdelete_file':
        include 'warehouse/file/prosesdelete_file.php';
        break;
    case 'w_master_share':
        include 'warehouse/share/master_share.php';
        break;
    case 'w_tambah_share':
        include 'warehouse/share/tambah_share.php';
        break;
    case 'w_prosestambah_share':
        include 'warehouse/share/prosestambah_share.php';
        break; 

    case 'w_master_transaction':
        include 'warehouse/transaction/master_transaction.php';
        break;
    case 'w_tambah_transaction':
        include 'warehouse/transaction/tambah_transaction.php';
        break;
    case 'w_prosestambah_transaction':
        include 'warehouse/transaction/prosestambah_transaction.php';
        break;
    case 'w_prosesdelete_transaction':
        include 'warehouse/transaction/prosesdelete_transaction.php';
        break;
    case 'w_master_recovery':
        include 'warehouse/recovery/master_recovery.php';
        break;
    //End Data Warehouse 
    
    //Data Owner
    case 'o_master_file':
        include 'owner/file/master_file.php';
        break;
    case 'o_setpassword_file':
        include 'owner/file/setpassword_file.php';
        break;
    case 'o_prosessetpassword_file':
        include 'owner/file/prosessetpassword_file.php';
        break;
    case 'o_detail_file':
        include 'owner/file/detail_file.php';
        break;
    case 'o_master_transaction':
        include 'owner/transaction/master_transaction.php';
        break;
    case 'o_master_recovery':
        include 'owner/recovery/master_recovery.php';
        break;
    case 'o_log_recovery':
        include 'owner/recovery/log_recovery.php';
        break;
    case 'o_tambah_recovery':
        include 'owner/recovery/tambah_recovery.php';
        break;
    case 'o_edit_recovery':
        include 'owner/recovery/edit_recovery.php';
        break;
    case 'o_prosestambah_recovery':
        include 'owner/recovery/prosestambah_recovery.php';
        break;
     case 'o_prosesedit_recovery':
        include 'owner/recovery/prosesedit_recovery.php';
        break;
    
}
?>

