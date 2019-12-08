<div class="col-md-3 left_col menu_fixed">
  <div class="left_col scroll-view">
    <div class="navbar nav_title" style="border: 0;">

      <a href="?page=dashboard" class="site_title"><img src="../assets/logo.png" width="60" height="40"> <span>PUDC</span></a>

    </div>

    <div class="clearfix"></div>

    <!-- menu profile quick info -->
    <div class="profile clearfix">
      <div class="profile_info">
      </div>
    </div>
    <!-- /menu profile quick info -->

    <br />

    <!-- sidebar menu -->
    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
      <div class="menu_section">
        <h3>General</h3>
        <ul class="nav side-menu">
          <li><a><i class="fa fa-home"></i> Main Menu <span class="fa fa-chevron-down"></span></a>
            <ul class="nav child_menu">
              <li><a href="?page=dashboard">Dashboard</a></li>
              <li><a href="?page=menu_file">Menu File</a></li>
            </ul>
          </li>
        </ul>
      </div>
      <?php
        if($_SESSION['level'] == 'Administrator'){
      ?>
       <div class="menu_section">
        <h3>Administrator</h3>
        <ul class="nav side-menu">
          <li><a><i class="fa fa-home"></i> Master <span class="fa fa-chevron-down"></span></a>
            <ul class="nav child_menu">
              <li><a href="?page=master_user">Data Account</a></li>
              <li><a href="?page=master_level">Data Level</a></li>
              <li><a href="?page=master_company">Data Perusahaan</a></li>
              <li><a href="?page=master_file">Data File</a></li>
              <li><a href="?page=master_transaction">Data Transaction</a></li>
            </ul>
          </li>
           <li><a><i class="fa fa-bug"></i> Personal <span class="fa fa-chevron-down"></span></a>
            <ul class="nav child_menu">    
              <li><a href="?page=my_transaction">My Transaction</a></li>
              <li><a href="?page=my_account">My Account</a></li>
            </ul>
          </li>
          <li><a><i class="fa fa-print"></i> Reporting <span class="fa fa-chevron-down"></span></a>
            <ul class="nav child_menu">    
              <li><a href="?page=master_report">Master Report</a></li>
              <li><a href="?page=report_view_file">Count Visit View Full File</a></li>
            </ul>
          </li>
          <li><a><i class="fa fa-print"></i> Documentation <span class="fa fa-chevron-down"></span></a>
            <ul class="nav child_menu">    
              <li><a href="?page=masterdatametode">Cara Kerja Shamir Secret Sharing</a></li>
               <li><a href="?page=testskill">Test Skill</a></li>
            </ul>
          </li>
        </ul>
      </div>
      <?php
        }elseif($_SESSION['level'] == 'Data Warehouse'){
      ?>
        <div class="menu_section">
            <h3>Data Warehouse</h3>
            <ul class="nav side-menu">
              <li><a><i class="fa fa-bug"></i> Master <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                  <li><a href="?page=w_master_file">Data File</a></li>
                  <li><a href="?page=w_master_transaction">Data Transaction</a></li>
                </ul>
              </li>
               <li><a><i class="fa fa-bug"></i> Personal <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">    
                  <li><a href="?page=my_transaction">My Transaction</a></li>
                  <li><a href="?page=my_account">My Account</a></li>
                </ul>
              </li>
            </ul>
          </div>
      <?php
        }elseif($_SESSION['level'] == 'Data Owner'){
      ?>
          <div class="menu_section">
            <h3>Data Owner</h3>
            <ul class="nav side-menu">
              <li><a><i class="fa fa-bug"></i> Master <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">    
                  <li><a href="?page=o_master_file">Data File</a></li>
                  <li><a href="?page=o_master_transaction">Data Transaction</a></li>
                </ul>
              </li>
              <li><a><i class="fa fa-bug"></i> Personal <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">    
                  <li><a href="?page=my_transaction">My Transaction</a></li>
                  <li><a href="?page=my_account">My Account</a></li>
                </ul>
              </li>
            </ul>
            
          </div>
      <?php
        }elseif($_SESSION['level'] == 'Guest'){
      ?>
           <div class="menu_section">
            <h3>Guest</h3>
            <ul class="nav side-menu">
              <li><a><i class="fa fa-bug"></i> Personal <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">    
                  <li><a href="?page=my_transaction">My Transaction</a></li>
                  <li><a href="?page=my_account">My Account</a></li>
                </ul>
              </li>
            </ul>
            
          </div>
      <?php
        }
      ?>

    </div>
    <!-- /sidebar menu -->
  </div>
</div>