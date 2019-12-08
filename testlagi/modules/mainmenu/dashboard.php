<div class="col-md-12 col-sm-12 col-xs-12"> 
  <div class="x_panel">
   <ol class="breadcrumb">
      <li class="breadcrumb-item">Main Menu</li>
      <li class="breadcrumb-item active">Dashboard</li>
    </ol>
      <?php
          require_once '../cores/db_function.php';
          $db = new Db_Function();
          $countCompany = $db->countCompany();
          $countUser = $db->countUser();
          $countFile = $db->countFile();
          $countTransaction = $db->countTransaction();

      ?>
      <div class="row top_tiles">
        <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
          <div class="tile-stats">
            <div class="icon"><i class="fa fa-building-o"></i></div>
            <div class="count"><?php echo $countCompany ?></div>
            <h3>Total Perusahaan</h3>
          </div>
        </div>
        <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
          <div class="tile-stats">
            <div class="icon"><i class="fa fa-users"></i></div>
            <div class="count"><?php echo $countUser ?></div>
            <h3>Total Account</h3>
          </div>
        </div>
        <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
          <div class="tile-stats">
            <div class="icon"><i class="fa fa-file-pdf-o"></i></div>
            <div class="count"><?php echo $countFile ?></div>
            <h3>Total File</h3>
          </div>
        </div>
        <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
          <div class="tile-stats">
            <div class="icon"><i class="fa fa-exchange"></i></div>
            <div class="count"><?php echo $countTransaction ?></div>
            <h3>Total Transaction</h3>
          </div>
        </div>
      </div>
      <?php include 'chartfilebycompany.php'; ?>
  </div>
</div>
