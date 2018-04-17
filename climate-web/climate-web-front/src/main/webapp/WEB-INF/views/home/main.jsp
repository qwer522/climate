<!doctype html>
<html>
	<head>
		<title>UMASS CMIP5 TOOL</title>
		<!-- <script type="text/javascript" src="script.js"></script> -->
		<link rel="stylesheet" type="text/css" href="/resources/styles/main/style.css">
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
			<meta charset="utf-8">

			<style>
				/* Always set the map height explicitly to define the size of the div
				 * element that contains the map. */
				#map {
					height: 100%;
				}
				/* Optional: Makes the sample page fill the window. */
				html, body {
					height: 500px;
					margin: 0;
					padding: 0;
					/*background-color: green; */
					min-width: 1250px;
					background-color: #ecf0f1;
				}

			/*	#floating-panel {
					position: relative;
					top: 10px;
					left: 25%;
					z-index: 5;
					background-color: #fff;
					padding: 5px;
					border: 1px solid #999;
					text-align: center;
					font-family: 'Roboto','sans-serif';
					line-height: 30px;
					padding-left: 10px;
				}*/
			</style>

	</head>

	<body>
		<div class="header"> </div>
		<div id="title1" class="header"> CMIP5 ANALYSIS TOOL </div>
		<div id="title2" class="header"> Hydrosystems Research Group </div>
		<div id="title3" class="header"> The University of Massachusetts Amherst </div>
		<div id="title4" class="header"> 
			<button onclick="panel_main_func()" type="Button" id="main">Main</button>
			<button onclick="panel_climatol_func()" type="Button" id="climatol" >Climatology</button>
	 	</div>

	 	<div id="panel_master">
			
			<form ref="uploadForm" id="uploadForm" action="/upload/input_main" method="post" encType="multipart/form-data">

		 	<div id="panel_main">

				<div id="panel_selareamap">	
					<span style="font-weight: bold; font-size: 18px; margin-left: 5px;">Selected Area Map</span>
					<br />

					<div id="map" style="width:98%;height:385px;margin-left: 1%; margin-top: 2.5px"></div>

					<div id="floating_panel">	
							<input onclick="removePoly();" type=button value="Remove Polygon" id="remove_button">
						</div>				
				</div>

				<div id="panel_gcmselection">
					<span style="font-weight: bold; font-size: 18px; margin-left: 5px;">GCMs Selection</span>	 
					<br />
					<!-- <input type="button" name="Historical" value="Hist" id="hist_button"> -->
					<button onclick="hist_button_func()" type="Button" id="hist_button">Historical</button>
					<button onclick="rcp26_button_func()" type="Button" id="rcp26_button" style="color: #7f8c8d">RCP2.6</button>
					<button onclick="rcp45_button_func()" type="Button" id="rcp45_button" style="color: #7f8c8d">RCP4.5</button>
					<button onclick="rcp60_button_func()" type="Button" id="rcp60_button" style="color: #7f8c8d">RCP6.0</button>
					<button onclick="rcp85_button_func()" type="Button" id="rcp85_button" style="color: #7f8c8d">RCP8.5</button>
					<br />

					<div id="panel_rcp26">
						<input type="checkbox" id="rcp26_all" onclick="if(this.checked){select_all_rcp26()} else {unselect_all_rcp26()}"> All RCP2.6(<span id="All_RCP26_num">0</span>) 
						<br />

						<div id="panel_rcp26_1">
							<input type="checkbox" value="access1_0_rcp26" disabled> <font color="#95a5a6">ACCESS1.0</font>
							<br />
							<input type="checkbox" value="access1_3_rcp26" disabled> <font color="#95a5a6">ACCESS1.3</font>
							<br />
							<input type="checkbox" value="bcc_csm1_1_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> BCC-CSM1.1
							<br />
							<input type="checkbox" value="bcc_csm1_1_m_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> BCC-CSM1.1(m)
							<br />
							<input type="checkbox" value="bnu_esm_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> BNU-ESM
							<br />
							<input type="checkbox" value="cancm4_rcp26" disabled> <font color="#95a5a6">CanCM4</font>
							<br />
							<input type="checkbox" value="canesm2_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> CanESM2
							<br />
							<input type="checkbox" value="ccsm4_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> CCSM4
							<br />
							<input type="checkbox" value="cesm1_bgc_rcp26" disabled> <font color="#95a5a6">CESM1(BGC)</font>
							<br />
							<input type="checkbox" value="bcesm1_cam5_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> CESM1(CAM5)
							<br />
							<input type="checkbox" value="bcesm1_fastchem_rcp26" disabled> <font color="#95a5a6">CESM1(FASTCHEM)</font>
							<br />
							<input type="checkbox" value="bcesm1_waccm_rcp26" disabled> <font color="#95a5a6">CESM1(WACCM)</font>
							<br />
							<input type="checkbox" value="cmcc_cesm_rcp26" disabled> <font color="#95a5a6">CMCC-CESM</font>
							<br />
							<input type="checkbox" value="cmcc_cm_rcp26" disabled> <font color="#95a5a6">CMCC-CM</font>
							<br />
							<input type="checkbox" value="cmcc_cms_rcp26" disabled> <font color="#95a5a6">CMCC-CMS</font>
							<br />
							<input type="checkbox" value="cnrm_cm5_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> CNRM-CM5
							<br />
							<input type="checkbox" value="cnrm_cm5_2_rcp26" disabled> <font color="#95a5a6">CNRM-CM5-2</font>
							<br />
							<input type="checkbox" value="csiro_mk3_6_0_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> CSIRO-Mk3.6.0
							<br />
							<input type="checkbox" value="ec_earth_rcp26" disabled> <font color="#95a5a6">EC-EARTH</font>
							<br />
							<input type="checkbox" value="fgoals_g2_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> FGOALS-g2
							<br />
							<input type="checkbox" value="fio_esm_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> FIO-ESM
							<br />
							<input type="checkbox" value="gfdl_cm2_1_rcp26" disabled> <font color="#95a5a6">GFDL-CM2.1</font>
							<br />
							<input type="checkbox" value="gfdl_cm3_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> GFDL-CM3
							<br />
							<input type="checkbox" value="gfdl_esm2g_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> GFDL-ESM2G
						</div>

						<div id="panel_rcp26_2">
							<input type="checkbox" value="gfdl_esm2m_rcp26" disabled> <font color="#95a5a6">GFDL-ESM2M</font>
							<br />
							<input type="checkbox" value="giss_e2_h_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> GISS-E2-H
							<br />
							<input type="checkbox" value="giss_e2_h_cc_rcp26" disabled> <font color="#95a5a6">GISS-E2-H-CC</font>
							<br />
							<input type="checkbox" value="giss_e2_r_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> GISS-E2-R
							<br />
							<input type="checkbox" value="giss_e2_r_cc_rcp26" disabled> <font color="#95a5a6">GISS-E2-R-CC</font>
							<br />
							<input type="checkbox" value="hadcm3_rcp26" disabled> <font color="#95a5a6">HadCM3</font>
							<br />
							<input type="checkbox" value="hadgem2_ao_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> HadGEM2-AO
							<br />
							<input type="checkbox" value="hadgem2_cc_rcp26" disabled> <font color="#95a5a6">HadGEM2-CC</font>
							<br />
							<input type="checkbox" value="hadgem2_es_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> HadGEM2-ES
							<br />
							<input type="checkbox" value="inmcm4_rcp26" disabled> <font color="#95a5a6">INM-CM4</font>
							<br />
							<input type="checkbox" value="ipsl_cm5a_lr_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> IPSL-CM5A-LR
							<br />
							<input type="checkbox" value="ipsl_cm5a_mr_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1}else{num_rcp26=num_rcp26-1};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> IPSL-CM5A-MR
							<br />
							<input type="checkbox" value="ipsl_cm5b_lr_rcp26" disabled> <font color="#95a5a6">IPSL-CM5B-LR</font>
							<br />
							<input type="checkbox" value="miroc_esm_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> MIROC-ESM
							<br />
							<input type="checkbox" value="miroc_esm_chem_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> MIROC-ESM-CHEM
							<br />
							<input type="checkbox" value="miroc4r_rcp26" disabled> <font color="#95a5a6">MIROC4h</font>
							<br />
							<input type="checkbox" value="miroc5_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> MIROC5
							<br />
							<input type="checkbox" value="mpi_esm_lr_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> MPI-ESM-LR
							<br />
							<input type="checkbox" value="mpi_esm_mr_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> MPI-ESM-MR
							<br />
							<input type="checkbox" value="mpi_esm_p_rcp26" disabled> <font color="#95a5a6">MPI-ESM-P</font>
							<br />
							<input type="checkbox" value="mpi_cgcm3_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> MPI-CGCM3
							<br />
							<input type="checkbox" value="mri_esm1_rcp26" disabled> <font color="#95a5a6">MRI-ESM1</font>
							<br />
							<input type="checkbox" value="noresm1_m_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> NorESM1-M
							<br />
							<input type="checkbox" value="noresm1_me_rcp26" name="valid_gcm_rcp26" onclick="if(this.checked){num_rcp26=num_rcp26+1; if(num_rcp26==26){rcp26_all.checked=true}}else{num_rcp26=num_rcp26-1; rcp26_all.checked=false};document.getElementById(&quot;All_RCP26_num&quot;).innerHTML = num_rcp26;"> NorESM1-ME

						</div>
		
					</div>

					<div id="panel_rcp45">
						<input type="checkbox" id="rcp45_all" onclick="if(this.checked){select_all_rcp45()} else {unselect_all_rcp45()}"> All RCP4.5(<span id="All_RCP45_num">0</span>) 
						<br />

						<div id="panel_rcp45_1">
							<input type="checkbox" value="access1_0_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> ACCESS1.0
							<br />
							<input type="checkbox" value="access1_3_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> ACCESS1.3
							<br />
							<input type="checkbox" value="bcc_csm1_1_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> BCC-CSM1.1
							<br />
							<input type="checkbox" value="bcc_csm1_1_m_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> BCC-CSM1.1(m)
							<br />
							<input type="checkbox" value="bnu_esm_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> BNU-ESM
							<br />
							<input type="checkbox" value="cancm4_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> CanCM4
							<br />
							<input type="checkbox" value="canesm2_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> CanESM2
							<br />
							<input type="checkbox" value="ccsm4_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> CCSM4
							<br />
							<input type="checkbox" value="cesm1_bgc_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> CESM1(BGC)
							<br />
							<input type="checkbox" value="bcesm1_cam5_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> CESM1(CAM5)
							<br />
							<input type="checkbox" value="bcesm1_fastchem_rcp45" disabled> <font color="#95a5a6">CESM1(FASTCHEM)</font>
							<br />
							<input type="checkbox" value="bcesm1_waccm_rcp45" disabled> <font color="#95a5a6">CESM1(WACCM)</font>
							<br />
							<input type="checkbox" value="cmcc_cesm_rcp45" disabled> <font color="#95a5a6">CMCC-CESM</font>
							<br />
							<input type="checkbox" value="cmcc_cm_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> CMCC-CM
							<br />
							<input type="checkbox" value="cmcc_cms_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> CMCC-CMS
							<br />
							<input type="checkbox" value="cnrm_cm5_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> CNRM-CM5
							<br />
							<input type="checkbox" value="cnrm_cm5_2_rcp45" disabled> <font color="#95a5a6">CNRM-CM5-2</font>
							<br />
							<input type="checkbox" value="csiro_mk3_6_0_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> CSIRO-Mk3.6.0
							<br />
							<input type="checkbox" value="ec_earth_rcp45" disabled> <font color="#95a5a6">EC-EARTH</font>
							<br />
							<input type="checkbox" value="fgoals_g2_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> FGOALS-g2
							<br />
							<input type="checkbox" value="fio_esm_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> FIO-ESM
							<br />
							<input type="checkbox" value="gfdl_cm2_1_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> GFDL-CM2.1
							<br />
							<input type="checkbox" value="gfdl_cm3_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> GFDL-CM3
							<br />
							<input type="checkbox" value="gfdl_esm2g_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> GFDL-ESM2G
						</div>

						<div id="panel_rcp45_2">
							<input type="checkbox" value="gfdl_esm2m_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> GFDL-ESM2M
							<br />
							<input type="checkbox" value="giss_e2_h_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> GISS-E2-H
							<br />
							<input type="checkbox" value="giss_e2_h_cc_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> GISS-E2-H-CC
							<br />
							<input type="checkbox" value="giss_e2_r_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> GISS-E2-R
							<br />
							<input type="checkbox" value="giss_e2_r_cc_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> GISS-E2-R-CC
							<br />
							<input type="checkbox" value="hadcm3_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> HadCM3
							<br />
							<input type="checkbox" value="hadgem2_ao_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> HadGEM2-AO
							<br />
							<input type="checkbox" value="hadgem2_cc_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> HadGEM2-CC
							<br />
							<input type="checkbox" value="hadgem2_es_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> HadGEM2-ES
							<br />
							<input type="checkbox" value="inmcm4_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> INM-CM4
							<br />
							<input type="checkbox" value="ipsl_cm5a_lr_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> IPSL-CM5A-LR
							<br />
							<input type="checkbox" value="ipsl_cm5a_mr_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> IPSL-CM5A-MR
							<br />
							<input type="checkbox" value="ipsl_cm5b_lr_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> IPSL-CM5B-LR
							<br />
							<input type="checkbox" value="miroc_esm_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> MIROC-ESM
							<br />
							<input type="checkbox" value="miroc_esm_chem_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> MIROC-ESM-CHEM
							<br />
							<input type="checkbox" value="miroc4r_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> MIROC4h
							<br />
							<input type="checkbox" value="miroc5_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> MIROC5
							<br />
							<input type="checkbox" value="mpi_esm_lr_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> MPI-ESM-LR
							<br />
							<input type="checkbox" value="mpi_esm_mr_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> MPI-ESM-MR
							<br />
							<input type="checkbox" value="mpi_esm_p_rcp45" disabled> <font color="#95a5a6">MPI-ESM-P</font>
							<br />
							<input type="checkbox" value="mpi_cgcm3_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> MPI-CGCM3
							<br />
							<input type="checkbox" value="mri_esm1_rcp45" disabled> <font color="#95a5a6">MRI-ESM1</font>
							<br />
							<input type="checkbox" value="noresm1_m_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> NorESM1-M
							<br />
							<input type="checkbox" value="noresm1_me_rcp45" name="valid_gcm_rcp45" onclick="if(this.checked){num_rcp45=num_rcp45+1;if(num_rcp45==41){rcp45_all.checked=true}}else{num_rcp45=num_rcp45-1;rcp45_all.checked=false};document.getElementById(&quot;All_RCP45_num&quot;).innerHTML = num_rcp45;"> NorESM1-ME

						</div>
		
					</div>

					<div id="panel_rcp60">
						<input type="checkbox" id="rcp60_all" onclick="if(this.checked){select_all_rcp60()} else {unselect_all_rcp60()}"> All RCP6.0(<span id="All_RCP60_num">0</span>) 
						<br />

						<div id="panel_rcp60_1">
							<input type="checkbox" value="access1_0_rcp60" disabled> <font color="#95a5a6">ACCESS1.0</font>
							<br />
							<input type="checkbox" value="access1_3_rcp60" disabled> <font color="#95a5a6">ACCESS1.3</font>
							<br />
							<input type="checkbox" value="bcc_csm1_1_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> BCC-CSM1.1
							<br />
							<input type="checkbox" value="bcc_csm1_1_m_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> BCC-CSM1.1(m)
							<br />
							<input type="checkbox" value="bnu_esm_rcp60" disabled> <font color="#95a5a6">BNU-ESM</font>
							<br />
							<input type="checkbox" value="cancm4_rcp60" disabled> <font color="#95a5a6">CanCM4</font>
							<br />
							<input type="checkbox" value="canesm2_rcp60" disabled> <font color="#95a5a6">CanESM2</font>
							<br />
							<input type="checkbox" value="ccsm4_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> CCSM4
							<br />
							<input type="checkbox" value="cesm1_bgc_rcp60" disabled> <font color="#95a5a6">CESM1(BGC)</font>
							<br />
							<input type="checkbox" value="bcesm1_cam5_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> CESM1(CAM5)
							<br />
							<input type="checkbox" value="bcesm1_fastchem_rcp60" disabled> <font color="#95a5a6">CESM1(FASTCHEM)</font>
							<br />
							<input type="checkbox" value="bcesm1_waccm_rcp60" disabled> <font color="#95a5a6">CESM1(WACCM)</font>
							<br />
							<input type="checkbox" value="cmcc_cesm_rcp60" disabled> <font color="#95a5a6">CMCC-CESM</font>
							<br />
							<input type="checkbox" value="cmcc_cm_rcp60" disabled> <font color="#95a5a6">CMCC-CM</font>
							<br />
							<input type="checkbox" value="cmcc_cms_rcp60" disabled> <font color="#95a5a6">CMCC-CMS</font>
							<br />
							<input type="checkbox" value="cnrm_cm5_rcp60" disabled> <font color="#95a5a6">CNRM-CM5</font>
							<br />
							<input type="checkbox" value="cnrm_cm5_2_rcp60" disabled> <font color="#95a5a6">CNRM-CM5-2</font>
							<br />
							<input type="checkbox" value="csiro_mk3_6_0_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> CSIRO-Mk3.6.0
							<br />
							<input type="checkbox" value="ec_earth_rcp60" disabled> <font color="#95a5a6">EC-EARTH</font>
							<br />
							<input type="checkbox" value="fgoals_g2_rcp60" disabled> <font color="#95a5a6">FGOALS-g2</font>
							<br />
							<input type="checkbox" value="fio_esm_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> FIO-ESM
							<br />
							<input type="checkbox" value="gfdl_cm2_1_rcp60" disabled> <font color="#95a5a6">GFDL-CM2.1</font>
							<br />
							<input type="checkbox" value="gfdl_cm3_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> GFDL-CM3
							<br />
							<input type="checkbox" value="gfdl_esm2g_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> GFDL-ESM2G
						</div>

						<div id="panel_rcp60_2">
							<input type="checkbox" value="gfdl_esm2m_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> GFDL-ESM2M
							<br />
							<input type="checkbox" value="giss_e2_h_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> GISS-E2-H
							<br />
							<input type="checkbox" value="giss_e2_h_cc_rcp60" disabled> <font color="#95a5a6">GISS-E2-H-CC</font>
							<br />
							<input type="checkbox" value="giss_e2_r_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> GISS-E2-R
							<br />
							<input type="checkbox" value="giss_e2_r_cc_rcp60" disabled> <font color="#95a5a6">GISS-E2-R-CC</font>
							<br />
							<input type="checkbox" value="hadcm3_rcp60" disabled> <font color="#95a5a6">HadCM3</font>
							<br />
							<input type="checkbox" value="hadgem2_ao_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> HadGEM2-AO
							<br />
							<input type="checkbox" value="hadgem2_cc_rcp60" disabled> <font color="#95a5a6">HadGEM2-CC</font>
							<br />
							<input type="checkbox" value="hadgem2_es_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> HadGEM2-ES
							<br />
							<input type="checkbox" value="inmcm4_rcp60" disabled> <font color="#95a5a6">INM-CM4</font>
							<br />
							<input type="checkbox" value="ipsl_cm5a_lr_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> IPSL-CM5A-LR
							<br />
							<input type="checkbox" value="ipsl_cm5a_mr_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> IPSL-CM5A-MR
							<br />
							<input type="checkbox" value="ipsl_cm5b_lr_rcp60" disabled> <font color="#95a5a6">IPSL-CM5B-LR</font>
							<br />
							<input type="checkbox" value="miroc_esm_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> MIROC-ESM
							<br />
							<input type="checkbox" value="miroc_esm_chem_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> MIROC-ESM-CHEM
							<br />
							<input type="checkbox" value="miroc4r_rcp60" disabled> <font color="#95a5a6">MIROC4h</font>
							<br />
							<input type="checkbox" value="miroc5_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> MIROC5
							<br />
							<input type="checkbox" value="mpi_esm_lr_rcp60" disabled> <font color="#95a5a6">MPI-ESM-LR</font>
							<br />
							<input type="checkbox" value="mpi_esm_mr_rcp60" disabled> <font color="#95a5a6">MPI-ESM-MR</font>
							<br />
							<input type="checkbox" value="mpi_esm_p_rcp60" disabled> <font color="#95a5a6">MPI-ESM-P</font>
							<br />
							<input type="checkbox" value="mpi_cgcm3_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> MPI-CGCM3
							<br />
							<input type="checkbox" value="mri_esm1_rcp60" disabled> <font color="#95a5a6">MRI-ESM1</font>
							<br />
							<input type="checkbox" value="noresm1_m_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> NorESM1-M
							<br />
							<input type="checkbox" value="noresm1_me_rcp60" name="valid_gcm_rcp60" onclick="if(this.checked){num_rcp60=num_rcp60+1;if(num_rcp60==21){rcp60_all.checked=true}}else{num_rcp60=num_rcp60-1;rcp60_all.checked=false};document.getElementById(&quot;All_RCP60_num&quot;).innerHTML = num_rcp60;"> NorESM1-ME

						</div>
		
					</div>

					<div id="panel_rcp85">
						<input type="checkbox" id="rcp85_all" onclick="if(this.checked){select_all_rcp85()} else {unselect_all_rcp85()}"> All RCP8.5(<span id="All_RCP85_num">0</span>) 
						<br />

						<div id="panel_rcp85_1">
							<input type="checkbox" value="access1_0_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> ACCESS1.0
							<br />
							<input type="checkbox" value="access1_3_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> ACCESS1.3
							<br />
							<input type="checkbox" value="bcc_csm1_1_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> BCC-CSM1.1
							<br />
							<input type="checkbox" value="bcc_csm1_1_m_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> BCC-CSM1.1(m)
							<br />
							<input type="checkbox" value="bnu_esm_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> BNU-ESM
							<br />
							<input type="checkbox" value="cancm4_rcp85" disabled> <font color="#95a5a6">CanCM4</font>
							<br />
							<input type="checkbox" value="canesm2_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> CanESM2
							<br />
							<input type="checkbox" value="ccsm4_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> CCSM4
							<br />
							<input type="checkbox" value="cesm1_bgc_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> CESM1(BGC)
							<br />
							<input type="checkbox" value="bcesm1_cam5_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> CESM1(CAM5)
							<br />
							<input type="checkbox" value="bcesm1_fastchem_rcp85" disabled> <font color="#95a5a6">CESM1(FASTCHEM)</font>
							<br />
							<input type="checkbox" value="bcesm1_waccm_rcp85" disabled> <font color="#95a5a6">CESM1(WACCM)</font>
							<br />
							<input type="checkbox" value="cmcc_cesm_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> CMCC-CESM
							<br />
							<input type="checkbox" value="cmcc_cm_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> CMCC-CM
							<br />
							<input type="checkbox" value="cmcc_cms_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> CMCC-CMS
							<br />
							<input type="checkbox" value="cnrm_cm5_rcp85" disabled> <font color="#95a5a6">CNRM-CM5</font>
							<br />
							<input type="checkbox" value="cnrm_cm5_2_rcp85" disabled> <font color="#95a5a6">CNRM-CM5-2</font>
							<br />
							<input type="checkbox" value="csiro_mk3_6_0_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> CSIRO-Mk3.6.0
							<br />
							<input type="checkbox" value="ec_earth_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> EC-EARTH
							<br />
							<input type="checkbox" value="fgoals_g2_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> FGOALS-g2
							<br />
							<input type="checkbox" value="fio_esm_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> FIO-ESM
							<br />
							<input type="checkbox" value="gfdl_cm2_1_rcp85" disabled> <font color="#95a5a6">GFDL-CM2.1</font>
							<br />
							<input type="checkbox" value="gfdl_cm3_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> GFDL-CM3
							<br />
							<input type="checkbox" value="gfdl_esm2g_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> GFDL-ESM2G
						</div>

						<div id="panel_rcp85_2">
							<input type="checkbox" value="gfdl_esm2m_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> GFDL-ESM2M
							<br />
							<input type="checkbox" value="giss_e2_h_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> GISS-E2-H
							<br />
							<input type="checkbox" value="giss_e2_h_cc_rcp85" disabled> <font color="#95a5a6">GISS-E2-H-CC</font>
							<br />
							<input type="checkbox" value="giss_e2_r_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> GISS-E2-R
							<br />
							<input type="checkbox" value="giss_e2_r_cc_rcp85" disabled> <font color="#95a5a6">GISS-E2-R-CC</font>
							<br />
							<input type="checkbox" value="hadcm3_rcp85" disabled> <font color="#95a5a6">HadCM3</font>
							<br />
							<input type="checkbox" value="hadgem2_ao_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> HadGEM2-AO
							<br />
							<input type="checkbox" value="hadgem2_cc_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> HadGEM2-CC
							<br />
							<input type="checkbox" value="hadgem2_es_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> HadGEM2-ES
							<br />
							<input type="checkbox" value="inmcm4_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> INM-CM4
							<br />
							<input type="checkbox" value="ipsl_cm5a_lr_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> IPSL-CM5A-LR
							<br />
							<input type="checkbox" value="ipsl_cm5a_mr_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> IPSL-CM5A-MR
							<br />
							<input type="checkbox" value="ipsl_cm5b_lr_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> IPSL-CM5B-LR
							<br />
							<input type="checkbox" value="miroc_esm_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> MIROC-ESM
							<br />
							<input type="checkbox" value="miroc_esm_chem_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> MIROC-ESM-CHEM
							<br />
							<input type="checkbox" value="miroc4r_rcp85" disabled> <font color="#95a5a6">MIROC4h</font>
							<br />
							<input type="checkbox" value="miroc5_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> MIROC5
							<br />
							<input type="checkbox" value="mpi_esm_lr_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> MPI-ESM-LR
							<br />
							<input type="checkbox" value="mpi_esm_mr_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> MPI-ESM-MR
							<br />
							<input type="checkbox" value="mpi_esm_p_rcp85" disabled> <font color="#95a5a6">MPI-ESM-P</font>
							<br />
							<input type="checkbox" value="mpi_cgcm3_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> MPI-CGCM3
							<br />
							<input type="checkbox" value="mri_esm1_rcp85" disabled> <font color="#95a5a6">MRI-ESM1</font>
							<br />
							<input type="checkbox" value="noresm1_m_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> NorESM1-M
							<br />
							<input type="checkbox" value="noresm1_me_rcp85" name="valid_gcm_rcp85" onclick="if(this.checked){num_rcp85=num_rcp85+1;if(num_rcp85==36){rcp85_all.checked=true}}else{num_rcp85=num_rcp85-1;rcp85_all.checked=false};document.getElementById(&quot;All_RCP85_num&quot;).innerHTML = num_rcp85;"> NorESM1-ME

						</div>
		
					</div>

					<div id="panel_hist">
						<input type="checkbox" id="hist_all" onclick="if(this.checked){select_all_hist()} else {unselect_all_hist()}"> All Historical (<span id="All_Historical_num">0</span>) 					
						<br />

						<div id="panel_hist_1">
							<input type="checkbox" value="access1_0_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> ACCESS1.0
							<br />
							<input type="checkbox" value="access1_3_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> ACCESS1.3
							<br />
							<input type="checkbox" value="bcc_csm1_1_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> BCC-CSM1.1
							<br />
							<input type="checkbox" value="bcc_csm1_1_m_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> BCC-CSM1.1(m)
							<br />
							<input type="checkbox" value="bnu_esm_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> BNU-ESM
							<br />
							<input type="checkbox" value="cancm4_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> CanCM4
							<br />
							<input type="checkbox" value="canesm2_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> CanESM2
							<br />
							<input type="checkbox" value="ccsm4_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> CCSM4
							<br />
							<input type="checkbox" value="cesm1_bgc_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> CESM1(BGC)
							<br />
							<input type="checkbox" value="bcesm1_cam5_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> CESM1(CAM5)
							<br />
							<input type="checkbox" value="bcesm1_fastchem_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> CESM1(FASTCHEM)
							<br />
							<input type="checkbox" value="bcesm1_waccm_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> CESM1(WACCM)
							<br />
							<input type="checkbox" value="cmcc_cesm_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> CMCC-CESM
							<br />
							<input type="checkbox" value="cmcc_cm_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> CMCC-CM
							<br />
							<input type="checkbox" value="cmcc_cms_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> CMCC-CMS
							<br />
							<input type="checkbox" value="cnrm_cm5_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> CNRM-CM5
							<br />
							<input type="checkbox" value="cnrm_cm5_2_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> CNRM-CM5-2
							<br />
							<input type="checkbox" value="csiro_mk3_6_0_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> CSIRO-Mk3.6.0
							<br />
							<input type="checkbox" value="ec_earth_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> EC-EARTH
							<br />
							<input type="checkbox" value="fgoals_g2_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> FGOALS-g2
							<br />
							<input type="checkbox" value="fio_esm_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> FIO-ESM
							<br />
							<input type="checkbox" value="gfdl_cm2_1_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> GFDL-CM2.1
							<br />
							<input type="checkbox" value="gfdl_cm3_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> GFDL-CM3
							<br />
							<input type="checkbox" value="gfdl_esm2g_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> GFDL-ESM2G
						</div>

						<div id="panel_hist_2">
							<input type="checkbox" value="gfdl_esm2m_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> GFDL-ESM2M
							<br />
							<input type="checkbox" value="giss_e2_h_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> GISS-E2-H
							<br />
							<input type="checkbox" value="giss_e2_h_cc_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> GISS-E2-H-CC
							<br />
							<input type="checkbox" value="giss_e2_r_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> GISS-E2-R
							<br />
							<input type="checkbox" value="giss_e2_r_cc_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> GISS-E2-R-CC
							<br />
							<input type="checkbox" value="hadcm3_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> HadCM3
							<br />
							<input type="checkbox" value="hadgem2_ao_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> HadGEM2-AO
							<br />
							<input type="checkbox" value="hadgem2_cc_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> HadGEM2-CC
							<br />
							<input type="checkbox" value="hadgem2_es_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> HadGEM2-ES
							<br />
							<input type="checkbox" value="inmcm4_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> INM-CM4
							<br />
							<input type="checkbox" value="ipsl_cm5a_lr_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> IPSL-CM5A-LR
							<br />
							<input type="checkbox" value="ipsl_cm5a_mr_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> IPSL-CM5A-MR
							<br />
							<input type="checkbox" value="ipsl_cm5b_lr_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> IPSL-CM5B-LR
							<br />
							<input type="checkbox" value="miroc_esm_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> MIROC-ESM
							<br />
							<input type="checkbox" value="miroc_esm_chem_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> MIROC-ESM-CHEM
							<br />
							<input type="checkbox" value="miroc4r_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> MIROC4h
							<br />
							<input type="checkbox" value="miroc5_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> MIROC5
							<br />
							<input type="checkbox" value="mpi_esm_lr_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> MPI-ESM-LR
							<br />
							<input type="checkbox" value="mpi_esm_mr_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> MPI-ESM-MR
							<br />
							<input type="checkbox" value="mpi_esm_p_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> MPI-ESM-P
							<br />
							<input type="checkbox" value="mpi_cgcm3_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> MPI-CGCM3
							<br />
							<input type="checkbox" value="mri_esm1_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> MRI-ESM1
							<br />
							<input type="checkbox" value="noresm1_m_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> NorESM1-M
							<br />
							<input type="checkbox" value="noresm1_me_hist" name="valid_gcm_hist" onclick="if(this.checked){num_hist=num_hist+1; if(num_hist==48){hist_all.checked=true}}else{num_hist=num_hist-1; hist_all.checked=false};document.getElementById(&quot;All_Historical_num&quot;).innerHTML = num_hist;"> NorESM1-ME

						</div>
		
					</div>								
				</div>

				

				<div id="panel_areadefine">

					<span style="font-weight: bold; font-size: 18px; margin-left: 5px;">Area Definition</span> 
					<br/>
					<span id="text_Name">Name</span>	
					<input type="text" id="areaname" name="areaname" placeholder="Enter Region Name"	/>
					<br />			
					
					<input type="checkbox" id="check_rectangle" onclick="if(this.checked){activate_rectanglebox()} else {deactivate_rectanglebox()}"/> 
					<label id="text_Rectanble">Rectangle</label> 
					<br />
					<span id="text_Top">Top</span> <br/>
					<span id="text_Bottom">Bottom</span> <br/>
					<span id="text_Left">Left</span>
					<span id="text_Right">Right</span> 
					<br />
					<input type="text" id="input_Top" placeholder="Lat" disabled="" onchange="{draw_rectanglebox_Top()}"/> <br/>
					<input type="text" id="input_Bottom" placeholder="Lat" disabled="" onchange="{draw_rectanglebox_Bottom()}"/>
					<input type="text" id="input_Left" placeholder="Lon" disabled="" onchange="{draw_rectanglebox_Left()}"/>
					<input type="text" id="input_Right" placeholder="Lon" disabled="" onchange="{draw_rectanglebox_Right()}"/>
					<br />
					
					<input type="checkbox" id="check_kmzfile" onclick="if(this.checked){activate_kmzfilelebox()} else {deactivate_kmzfilelebox()}"/> 
					<span id="text_kmzfile">KMZ File</span> <br/>
					<!-- <input type="file" id="kmzfile_button" disabled="" onclick="add_kmz()"	/> -->


					<!-- <input type="file" id="kmzfile_button" disabled="" onchange="read_kmz()" /> -->
					<!-- <form id="uploadbanner" enctype="multipart/form-data" method="post" action="#">
						 <input id="kmzfile_button" name="myfile" type="file" disabled="" />
						 <input type="submit" value="submit" id="submit" />
					</form> -->
					<!-- <form enctype="multipart/form-data" action="action.php" method="POST">
						<input type="hidden" name="MAX_FILE_SIZE" value="1000000" />
						<input name="userfile" type="file" />
						<input type="submit" value="Go" />
					</form> -->
					

					<!-- <button	onclick="add_kmz()">test</button> -->

					
						<!-- <input type="file" name="sampleFile" id="kmzfile_button" disabled="" /> -->
						
						
						
				
					<!-- <button	onclick="add_kmz()" id="view_button">View</button> -->
										 
		
				</div>

				
				

				<div id="panel_monthvar">
					<span style="font-weight: bold; font-size: 18px; margin-left: 5px;">Monthly Variable</span> 				
					<br />
					<input type="checkbox" id="precip" class="monvar" > Precipitation
					<!-- <input type="checkbox" id="hist_all" onclick="initMap()">	-->
					<br />
					<input type="checkbox" id="meantemp" class="monvar"> Mean Temperature
					<br />
					<input type="checkbox" id="maxtemp" class="monvar"> Max Temperature
					<br />
					<input type="checkbox" id="mintemp" class="monvar"> Min Temperature	
				</div>

				<div id="panel_extract">
						<input type="submit" id="extract_button" value="Extract">
						<span id="text_downlink" style="font-size: 18px;margin-left: 20px;">Download Link: </span>
				</div>
				
			</div>
			
			</form>

<!-- 			<form	action="/upload/input_kml" method="post" encType="multipart/form-data">	 -->
				<div id="panel_kmlform">
					<input type="file" name="kmzFile" id="kmzfile_button" onchange ="{kmlDraw()}" />
					<input type="button" value="Upload" id="upload_button" onclick="add_kmz()"/>
				</div>
<!-- 			</form> -->


		 	<div id="panel_climatol" style="visibility: hidden;" >

		 		<div id="panel_climatol_option">
		 			<!-- <br /> -->
					<span style="font-weight: bold; font-size: 18px; position: relative; top: 10px">CMIP5 Monthly Climatology</span>
					<br />
					<span style="font-weight: bold; font-size: 18px; position: relative; top: 10px">Hitorical vs. RCP</span>
					<br />
					<span style="font-size: 16px; position: relative; top: 25px">Area Name: </span>
					<span style="font-size: 16px; position: relative; top: 25px">Upper Colorado River Basin</span>
					<br/>

					<div id="panel_climatol_option_var">	
						<span style="font-size: 16px; ">Variables: </span>
						<input type="checkbox" id="precip_climatol" class="monvar" > pr
						<input type="checkbox" id="meantemp_climatol" class="monvar" > tas
						<input type="checkbox" id="maxtemp_climatol" class="monvar" > tasmax
						<input type="checkbox" id="mintemp_climatol" class="monvar" > tasmin
					</div>

					<div id="hist_period">
						<span style="font-size: 14px; ">Historical Period </span>
						<br/>
						<span style="font-size: 14px; position: relative; top: 2.5px">-</span>
						<br/>
						<div id="hist_period_ul" align="left">
							<input type="text" id="first_yr_hist_text" name="first_yr_hist_text" placeholder="First Year" readonly="true" >
							<input type="button" id="first_yr_hist_button" value="&#9661" onclick="first_yr_hist_select_visible()">
						</div>
						<div id="hist_period_ur" align="left">
							<input type="text" id="last_yr_hist_text" name="last_yr_hist_text" placeholder="Last Year" readonly="true">
							<input type="button" id="last_yr_hist_button" value="&#9661" onclick="last_yr_hist_select_visible()">
						</div>
						<div id="hist_period_ll" align="left">
							<form action="/action_page.php" >
								<select name="first_yr_hist" size="7" id="first_yr_hist_select" style="visibility: hidden" onclick="first_yr_hist_select_value()">
									<jsp:include page="./sub/first_select.jsp"></jsp:include>
								</select>
							</form>
						</div>
						<div id="hist_period_lr" align="left">
							<form action="/action_page.php" >								
								<select name="last_yr_hist" size="7" id="last_yr_hist_select"	style="visibility: hidden" onclick="last_yr_hist_select_value()">
									<jsp:include page="./sub/first_select.jsp"></jsp:include>
								</select>
							</form>
						</div>
					</div>

					<div id="rcp_period">
						<span style="font-size: 14px; ">RCP Period</span>
						<br/>
						<span style="font-size: 14px; position: relative; top: 2.5px">-</span>
						<br/>
						<div id="rcp_period_ul" align="left">
							<input type="text" id="first_yr_rcp_text" name="first_yr_rcp_text" placeholder="First Year" readonly="true">
							<input type="button" id="first_yr_rcp_button" value="&#9661" onclick="first_yr_rcp_select_visible()">
						</div>
						<div id="rcp_period_ur" align="left">
							<input type="text" id="last_yr_rcp_text" name="last_yr_rcp_text" placeholder="Last Year" readonly="true">
							<input type="button" id="last_yr_rcp_button" value="&#9661" onclick="last_yr_rcp_select_visible()">
						</div>
						<div id="rcp_period_ll" align="left">
							<form action="/action_page.php" >
								<select name="first_yr_rcp" size="7" id="first_yr_rcp_select"	style="visibility: hidden" onclick="first_yr_rcp_select_value()">
									<jsp:include page="./sub/last_select.jsp"></jsp:include>
								</select>
							</form>
						</div>
						<div id="rcp_period_lr" align="left">
							<form action="/action_page.php" >
								
								<select name="last_yr_rcp" size="7" id="last_yr_rcp_select"	style="visibility: hidden" onclick="last_yr_rcp_select_value()">
									<jsp:include page="./sub/last_select.jsp"></jsp:include>
								</select>
							</form>
						</div>
						
					</div>	

				<button onclick="calculate_climatol()" type="Button" id="calculate_button"	>Calculate</button>
					
				</div>

				<div id="boxplot_panel">

					<div id="prcpchange_panel">
						<div id="PrcpChange_title">
							<input type="checkbox" id="allpoint_pr" onclick="if(this.checked){allpoint_pr_checked_func()}else{allpoint_pr_not_checked_func()}"> 
							<label id="allpoint_pr_label" for="allpoint_pr">All Points</label>
							<button onclick="pr_all_button_func()" type="Button" id="pr_all_button" style="color: #7f8c8d">ALL</button>
							<button onclick="pr_rcp85_button_func()" type="Button" id="pr_rcp85_button" style="color: #7f8c8d">RCP8.5</button>
							<button onclick="pr_rcp60_button_func()" type="Button" id="pr_rcp60_button" style="color: #7f8c8d">RCP6.0</button>
							<button onclick="pr_rcp45_button_func()" type="Button" id="pr_rcp45_button" style="color: #7f8c8d">RCP4.5</button>
							<button onclick="pr_rcp26_button_func()" type="Button" id="pr_rcp26_button" >RCP2.6</button>
							<span style="font-weight: bold; font-size: 18px; position: relative; top: 10px; display: inline-block;">CMIP5 Precipitation Change Projection <br/> <span id="pr_climatol_title_hist_syr">xxxx</span>-<span id="pr_climatol_title_hist_eyr">xxxx</span> vs. <span id="pr_climatol_title_rcp_syr">xxxx</span>-<span id="pr_climatol_title_rcp_eyr">xxxx</span> </span>
						</div>
						
						<div id="prcpchange_all">
						</div>
						<div id="prcpchange_rcp45">
						</div>
						<div id="prcpchange_rcp60">
						</div>
						<div id="prcpchange_rcp85">
						</div>
						<div id="prcpchange_rcp26">
						</div>
						
					</div>

					<div id="taschange_panel">
						<div id="TasChange_title">
							<input type="checkbox" id="allpoint_tas" onclick="if(this.checked){allpoint_tas_checked_func()}else{allpoint_tas_not_checked_func()}"> 
							<label id="allpoint_tas_label" for="allpoint_tas">All Points</label>
							<button onclick="tas_all_button_func()" type="Button" id="tas_all_button" style="color: #7f8c8d">ALL</button>
							<button onclick="tas_rcp85_button_func()" type="Button" id="tas_rcp85_button" style="color: #7f8c8d">RCP8.5</button>
							<button onclick="tas_rcp60_button_func()" type="Button" id="tas_rcp60_button" style="color: #7f8c8d">RCP6.0</button>
							<button onclick="tas_rcp45_button_func()" type="Button" id="tas_rcp45_button" style="color: #7f8c8d">RCP4.5</button>
							<button onclick="tas_rcp26_button_func()" type="Button" id="tas_rcp26_button" >RCP2.6</button>

							<span style="font-weight: bold; font-size: 18px; position: relative; top: 10px; display: inline-block;">CMIP5 Temperature Change Projection <br/> <span id="tas_climatol_title_hist_syr">xxxx</span>-<span id="tas_climatol_title_hist_eyr">xxxx</span> vs. <span id="tas_climatol_title_rcp_syr">xxxx</span>-<span id="tas_climatol_title_rcp_eyr">xxxx</span> </span>

						</div>

						<div id="taschange_all">
						</div>
						<div id="taschange_rcp45">
						</div>
						<div id="taschange_rcp60">
						</div>
						<div id="taschange_rcp85">
						</div>
						<div id="taschange_rcp26">
						</div>

					</div>	

					<div id="tmaxchange_panel">
					</div>	

					<div id="tminchange_panel">
					</div>	
					
				</div>
		 		
		 	</div>

	 	</div>
	 	
	 	<script src="/resources/scripts/jquery/jquery-3.1.1.min.js"></script>
		<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
		<!-- <script src="plotly.min.js"></script> -->
		<script src="/resources/scripts/jquery/main/main.js"></script>
		<script	type="text/javascript" >
		
		</script>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/togeojson/0.16.0/togeojson.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDl2jzqCvXxmNfW6CG5eR1ZftAAJsY0QWQ&libraries=drawing&callback=initMap" async defer type="text/javascript"></script>
	 	<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.3.3/proj4.js"></script>
<!-- 		<script src="lib/jszip.js"></script> -->
<!-- 		<script src="lib/jszip-utils.js"></script> -->
<!-- 		<script type="text/javascript" src="lib/jszip-utils-ie.js"></script> -->
<!-- 		<script src="preprocess.js"></script> -->
<!-- 		<script src="preview.js"></script> -->
		<script src="https://unpkg.com/shpjs@latest/dist/shp.js"></script>		
		<script type="text/javascript">
			function add_kmz() {
				// $.ajax({
				// 	url: '/upload/input_kml',
				// 	complete:function(data){
				// 		console.log(data);
				// 	}
				// });
				// $.get('http://localhost:3000/app.js', function(data,status){
				// 	alert("Data: " + data + "\nStatus"+status);
				// });
				// map.data.loadGeoJson('geojson/google.json');
			}
		 </script>
	<!-- </form>	 -->
	</body>

</html>