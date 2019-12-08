
 <div class="col-md-12 col-sm-12 col-xs-12">
  <div class="x_panel">
     <ol class="breadcrumb">
        <li class="breadcrumb-item">Main Menu</li>
        <li class="breadcrumb-item active">Menu File</li>
      </ol>
    <div class="x_title">
      <h2>Menu File</h2>
      <div class="clearfix"></div>
    </div>
    <div class="x_content">
      <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
        <thead>
          <tr>
            <th>No</th>
            <th>Barcode</th>
            <th>Title</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <?php
            require_once '../cores/db_function.php';
            $db = new Db_Function();
            $result = $db->showFile();
            $no = 1;
            while($data = $result->fetch_array()){
          ?>
          <tr>
            <td><?php echo $no++; ?></td>
            <td><?php echo $data['barcode'] ?></td>
            <td><?php echo $data['title'] ?></td>
            
            <td>
                <div class="btn-group  btn-group-xs">
                <a class="btn btn-info" type="button" href="?page=detail_file&id=<?php echo $data['idfile']; ?>">
                  <div class="btnTooltip" data-placement="top" title="View"> 
                    <i class="fa fa-arrows-alt"></i>
                  </div>
                </a>
              </div>
            </td>
          </tr>
          <?php
            }
          ?>
        </tbody>
      </table>
    </div>
  </div>
</div>
<!-- jQuery -->
<script src="../assets/vendors/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('.btnTooltip').tooltip({
    delay: { "show": 1, "hide": 300 },
    title:"<strong class='txt-highlight'>Title is from the JavaScript</strong> as given as the Tooltip options.",
    html:true,
  });   
});
</script>