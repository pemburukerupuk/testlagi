<div class="x_panel">
  <div class="x_title">
    <h2>Jumlah File Perusahaan</h2>
    <div class="clearfix"></div>
  </div>
  <div class="x_content">
<!-- Styles -->
<style>
#chartdiv {
  width   : 100%;
  height    : 500px;
  font-size : 11px;
}               
</style>

<!-- chart libraries -->
<script type="text/javascript" src="../tools/amc/amcharts/amcharts.js"></script>
<script type="text/javascript" src="../tools/amc/amcharts/pie.js"></script>
<script src="../tools/amc/amcharts/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="../tools/amc/amcharts/plugins/export/export.css" type="text/css" media="all" />
<script src="../tools/amc/amcharts/themes/light.js"></script>
<!-- include dataloader -->
<script type="text/javascript" src="../tools/amc/amcharts/plugins/dataloader/dataloader.min.js"></script>

<div id="chartdiv" style="width: 100%; height: 400px; background-color: #FFFFFF;" ></div>
<!-- amCharts javascript code -->
    <script type="text/javascript">
      var files = "Files";
      AmCharts.makeChart("chartdiv",{
        "type"    : "pie",
        "titleField"  : "namaperusahaan",
        "valueField"  : "jumlahfile",
        "dataProvider"  : [
          {
            "category": "titleField",
            "column-1": "valueField",
          }
        ],
          "dataLoader": {
              "url": "mainmenu/datachartfilebycompany.php"
          },
      });
    </script>
   
  </div>
</div>