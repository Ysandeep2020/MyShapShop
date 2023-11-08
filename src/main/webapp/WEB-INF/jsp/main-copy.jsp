<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <meta charset="utf-8"> -->
<!-- <meta name="viewport" -->
<!-- 	content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<title>Skydash Admin</title>
<!-- plugins:css -->
<link rel="stylesheet" href="vendors/feather/feather.css">
<link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" type="text/css"
	href="js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="images/favicon.png" />



<!--    Stylesheets-->
<!-- ===============================================-->
<!-----    Datatable start-->
<link href="DataTables/datatables.min.css" rel="stylesheet" />
<!-----    Datatable end-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap"
	rel="stylesheet">
<link href="theme/v3/vendors/simplebar/simplebar.min.css"
	rel="stylesheet">
<link href="theme/v3/assets/css/theme-rtl.min.css" rel="stylesheet"
	id="style-rtl">
<link href="theme/v3/assets/css/theme.css" rel="stylesheet"
	id="style-default">
<link href="theme/v3/assets/css/user-rtl.min.css" rel="stylesheet"
	id="user-style-rtl">
<link href="theme/v3/assets/css/user.min.css" rel="stylesheet" id="user">
<link href="theme/chosen/chosen.min.css" rel="stylesheet"
	id="chosen-select">
<link href="theme/plugins/pace/pace-theme-default.min.css"
	rel="stylesheet" id="pace-theme-default">
<link href="theme/v3/vendors/choices/choices.min.css" rel="stylesheet" />
<link href="theme/v3/vendors/dropzone/dropzone.min.css" rel="stylesheet" />
<link href="theme/v3/vendors/fontawesome/all.min.css" rel="stylesheet" />
<link href="theme/v3/vendors/fontawesome/brand.min.css" type="text/css"
	rel="stylesheet" />
<link href="theme/v3/vendors/fontawesome/regular.min.css"
	type="text/css" rel="stylesheet" />
<link href="theme/v3/vendors/fontawesome/solid.min.css" type="text/css"
	rel="stylesheet" />
<link href="theme/v3/vendors/fontawesome/v4-font-face.min.css"
	type="text/css" rel="stylesheet" />
<link href="theme/v3/vendors/fontawesome/v4-shims.min.css"
	type="text/css" rel="stylesheet" />
<link href="theme/v3/vendors/fontawesome/v5-font-face.min.css"
	type="text/css" rel="stylesheet" />
<link href="theme/v3/vendors/flatpickr/flatpickr.min.css"
	rel="stylesheet" />
<link href="theme/v3/vendors/select2/select2.min.css" rel="stylesheet"
	id="chosen-select2">
<link href="theme/v3/vendors/fullcalendar/main.min.css" rel="stylesheet">
<link href="theme/plugins/toastr/toastr.min.css" type="text/css"
	rel="stylesheet" />
<link href="theme/plugins/sweetalert/sweetalert2.min.css"
	type="text/css" rel="stylesheet" crossorigin="anonymous" />
<link href="theme/plugins/summernote/summernote-lite.min.css"
	type="text/css" rel="stylesheet" />
<link href="theme/plugins/summernote/summernote.min.css" type="text/css"
	rel="stylesheet" />

<link rel="stylesheet" href="theme/v3/assets/css/navbar.css">


<link href="css/styles.css" rel="stylesheet" id="styles-css">
<link rel="stylesheet" href="theme/v3/assets/css/popup-chat-style.css">
<link rel="stylesheet" href="theme/v3/assets/css/company-styles.css">
<link rel="stylesheet" href="theme/v3/assets/css/footer.css">
</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo mr-5" href="index"><img
					src="images/logo.svg" class="mr-2" alt="logo" /></a> <a
					class="navbar-brand brand-logo-mini" href="index"><img
					src="images/logo-mini.svg" alt="logo" /></a>
			</div>
			<div
				class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<button class="navbar-toggler navbar-toggler align-self-center"
					type="button" data-toggle="minimize">
					<span class="icon-menu"></span>
				</button>
				<ul class="navbar-nav mr-lg-2">
					<li class="nav-item nav-search d-none d-lg-block">
						<div class="input-group">
							<div class="input-group-prepend hover-cursor"
								id="navbar-search-icon">
								<span class="input-group-text" id="search"> <i
									class="icon-search"></i>
								</span>
							</div>
							<input type="text" class="form-control" id="navbar-search-input"
								placeholder="Search now" aria-label="search"
								aria-describedby="search">
						</div>
					</li>
				</ul>
				<ul class="navbar-nav navbar-nav-right">
					<li class="nav-item dropdown"><a
						class="nav-link count-indicator dropdown-toggle"
						id="notificationDropdown" href="#" data-toggle="dropdown"> <i
							class="icon-bell mx-0"></i> <span class="count"></span>
					</a>
						<div
							class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
							aria-labelledby="notificationDropdown">
							<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
							<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-success">
										<i class="ti-info-alt mx-0"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<h6 class="preview-subject font-weight-normal">Application
										Error</h6>
									<p class="font-weight-light small-text mb-0 text-muted">
										Just now</p>
								</div>
							</a> <a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-warning">
										<i class="ti-settings mx-0"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<h6 class="preview-subject font-weight-normal">Settings</h6>
									<p class="font-weight-light small-text mb-0 text-muted">
										Private message</p>
								</div>
							</a> <a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-info">
										<i class="ti-user mx-0"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<h6 class="preview-subject font-weight-normal">New user
										registration</h6>
									<p class="font-weight-light small-text mb-0 text-muted">2
										days ago</p>
								</div>
							</a>
						</div></li>
					<li class="nav-item nav-profile dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
						id="profileDropdown"> <img src="images/faces/face28.jpg"
							alt="profile" />
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="profileDropdown">
							<a class="dropdown-item"> <i class="ti-settings text-primary"></i>
								Settings
							</a> <a class="dropdown-item"> <i
								class="ti-power-off text-primary"></i> Logout
							</a>
						</div></li>
					<li class="nav-item nav-settings d-none d-lg-flex"><a
						class="nav-link" href="#"> <i class="icon-ellipsis"></i>
					</a></li>
				</ul>
				<button
					class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
					type="button" data-toggle="offcanvas">
					<span class="icon-menu"></span>
				</button>
			</div>
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->
			<div class="theme-setting-wrapper">
				<div id="settings-trigger">
					<i class="ti-settings"></i>
				</div>
				<div id="theme-settings" class="settings-panel">
					<i class="settings-close ti-close"></i>
					<p class="settings-heading">SIDEBAR SKINS</p>
					<div class="sidebar-bg-options selected" id="sidebar-light-theme">
						<div class="img-ss rounded-circle bg-light border mr-3"></div>
						Light
					</div>
					<div class="sidebar-bg-options" id="sidebar-dark-theme">
						<div class="img-ss rounded-circle bg-dark border mr-3"></div>
						Dark
					</div>
					<p class="settings-heading mt-2">HEADER SKINS</p>
					<div class="color-tiles mx-0 px-4">
						<div class="tiles success"></div>
						<div class="tiles warning"></div>
						<div class="tiles danger"></div>
						<div class="tiles info"></div>
						<div class="tiles dark"></div>
						<div class="tiles default"></div>
					</div>
				</div>
			</div>
			<div id="right-sidebar" class="settings-panel">
				<i class="settings-close ti-close"></i>
				<ul class="nav nav-tabs border-top" id="setting-panel"
					role="tablist">
					<li class="nav-item"><a class="nav-link active" id="todo-tab"
						data-toggle="tab" href="#todo-section" role="tab"
						aria-controls="todo-section" aria-expanded="true">TO DO LIST</a></li>
					<li class="nav-item"><a class="nav-link" id="chats-tab"
						data-toggle="tab" href="#chats-section" role="tab"
						aria-controls="chats-section">CHATS</a></li>
				</ul>
				<div class="tab-content" id="setting-content">
					<div class="tab-pane fade show active scroll-wrapper"
						id="todo-section" role="tabpanel" aria-labelledby="todo-section">
						<div class="add-items d-flex px-3 mb-0">
							<form class="form w-100">
								<div class="form-group d-flex">
									<input type="text" class="form-control todo-list-input"
										placeholder="Add To-do">
									<button type="submit"
										class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
								</div>
							</form>
						</div>
						<div class="list-wrapper px-3">
							<ul class="d-flex flex-column-reverse todo-list">
								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> Team review meeting
											at 3.00 PM
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> Prepare for
											presentation
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> Resolve all the low
											priority tickets due today
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
								<li class="completed">
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox" checked> Schedule
											meeting for next week
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
								<li class="completed">
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox" checked> Project
											review
										</label>
									</div> <i class="remove ti-close"></i>
								</li>
							</ul>
						</div>
						<h4 class="px-3 text-muted mt-5 font-weight-light mb-0">Events</h4>
						<div class="events pt-4 px-3">
							<div class="wrapper d-flex mb-2">
								<i class="ti-control-record text-primary mr-2"></i> <span>Feb
									11 2018</span>
							</div>
							<p class="mb-0 font-weight-thin text-gray">Creating component
								page build a js</p>
							<p class="text-gray mb-0">The total number of sessions</p>
						</div>
						<div class="events pt-4 px-3">
							<div class="wrapper d-flex mb-2">
								<i class="ti-control-record text-primary mr-2"></i> <span>Feb
									7 2018</span>
							</div>
							<p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
							<p class="text-gray mb-0 ">Call Sarah Graves</p>
						</div>
					</div>
					<!-- To do section tab ends -->
					<div class="tab-pane fade" id="chats-section" role="tabpanel"
						aria-labelledby="chats-section">
						<div
							class="d-flex align-items-center justify-content-between border-bottom">
							<p
								class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
							<small
								class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See
								All</small>
						</div>
						<ul class="chat-list">
							<li class="list active">
								<div class="profile">
									<img src="images/faces/face1.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Thomas Douglas</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">19 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="images/faces/face2.jpg" alt="image"><span
										class="offline"></span>
								</div>
								<div class="info">
									<div class="wrapper d-flex">
										<p>Catherine</p>
									</div>
									<p>Away</p>
								</div>
								<div class="badge badge-success badge-pill my-auto mx-2">4</div>
								<small class="text-muted my-auto">23 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="images/faces/face3.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Daniel Russell</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">14 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="images/faces/face4.jpg" alt="image"><span
										class="offline"></span>
								</div>
								<div class="info">
									<p>James Richardson</p>
									<p>Away</p>
								</div> <small class="text-muted my-auto">2 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="images/faces/face5.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Madeline Kennedy</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">5 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="images/faces/face6.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Sarah Graves</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">47 min</small>
							</li>
						</ul>
					</div>
					<!-- chat tab ends -->
				</div>
			</div>
			<!-- partial -->
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" onclick="loadFormPage('dashboard','DashBoard')"> <i
							class="icon-grid menu-icon"></i> <span class="menu-title">Dashboard</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#ui-basic" aria-expanded="false"
						aria-controls="ui-basic"> <i class="icon-layout menu-icon"></i>
							<span class="menu-title">UI Elements</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="ui-basic">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/ui-features/buttons.html">Buttons</a></li>
								<li class="nav-item"><a class="nav-link"
									href="pages/ui-features/dropdowns.html">Dropdowns</a></li>
								<li class="nav-item"><a class="nav-link"
									href="pages/ui-features/typography.html">Typography</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#form-elements" aria-expanded="false"
						aria-controls="form-elements"> <i
							class="icon-columns menu-icon"></i> <span class="menu-title">Form
								elements</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="form-elements">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/forms/basic_elements.html">Basic Elements</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#charts" aria-expanded="false"
						aria-controls="charts"> <i class="icon-bar-graph menu-icon"></i>
							<span class="menu-title">Charts</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="charts">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/charts/chartjs.html">ChartJs</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#tables" aria-expanded="false"
						aria-controls="tables"> <i class="icon-grid-2 menu-icon"></i>
							<span class="menu-title">Tables</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="tables">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/tables/basic-table.html">Basic table</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#icons" aria-expanded="false"
						aria-controls="icons"> <i class="icon-contract menu-icon"></i>
							<span class="menu-title">Icons</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="icons">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/icons/mdi.html">Mdi icons</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#auth" aria-expanded="false"
						aria-controls="auth"> <i class="icon-head menu-icon"></i> <span
							class="menu-title">User Pages</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="auth">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="login">
										Login </a></li>
								<li class="nav-item"><a class="nav-link" href="register">
										Register </a></li>
								<li class="nav-item"><a class="nav-link" onclick="loadFormPage('students','Student List')">
										Students </a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#error" aria-expanded="false"
						aria-controls="error"> <i class="icon-ban menu-icon"></i> <span
							class="menu-title">Error pages</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="error">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="/error-404">
										404 </a></li>
								<li class="nav-item"><a class="nav-link" href="/error-500">
										500 </a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="pages/documentation/documentation.html"> <i
							class="icon-paper menu-icon"></i> <span class="menu-title">Documentation</span>
					</a></li>
				</ul>
			</nav>




			<!-- partial -->
			<!-- 			<div class="main-panel"> -->
			<!-- 				<div class="content-wrapper"></div> -->
			<!-- 			</div> -->
			<!-- content-wrapper ends -->


			<div class="row g-3 mb-3 me-5">
				<div class="hide" id="contentcontent">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header with-border bg-teal">
								<div class="row gx-0 rounded-2 mb-3">
									<div class="col d-flex align-items-center">
										<p class="card-title header-name" id="box-title"></p>
									</div>
									<div class="col-auto align-items-center">
										<button onclick="closeFormPage()" class="btn-close">
											<i class="far fa-times-circle"></i>Close
										</button>
									</div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="card-body">
<!-- 								<div   id="formcontent" style="overflow-x: auto;overflow-y: auto" >  -->
								<div id="formcontent"></div>
								<!-- /.row -->
							</div>
							<!-- ./box-body -->
						</div>
					</div>
				</div>






				<footer class="footer">
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright
							Â© 2021. Premium <a href="https://www.bootstrapdash.com/"
							target="_blank">Bootstrap admin template</a> from BootstrapDash.
							All rights reserved.
						</span> <span
							class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted
							& made with <i class="ti-heart text-danger ml-1"></i>
						</span>
					</div>
				</footer>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

	<!-- plugins:js -->
	<script src="vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="vendors/chart.js/Chart.min.js"></script>
	<script src="vendors/datatables.net/jquery.dataTables.js"></script>
	<script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
	<script src="js/dataTables.select.min.js"></script>

	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="js/off-canvas.js"></script>
	<script src="js/hoverable-collapse.js"></script>
	<script src="js/template.js"></script>
	<script src="js/settings.js"></script>
	<script src="js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="js/dashboard.js"></script>
	<script src="js/Chart.roundedBarCharts.js"></script>
	<!-- End custom js for this page-->

	<!-- ===============================================-->
	<!--    JavaScripts-->
	<!-- ===============================================-->
	<script src="theme/v3/vendors/popper/popper.min.js"></script>
	<script src="theme/v3/vendors/bootstrap/bootstrap.min.js"></script>
	<script src="theme/v3/vendors/anchorjs/anchor.min.js"></script>
	<script src="theme/v3/vendors/is/is.min.js"></script>
	<script src="theme/v3/vendors/echarts/echarts.min.js"></script>
	<script src="theme/v3/vendors/fontawesome/all.min.js"></script>
	<script src="theme/v3/vendors/fontawesome/brands.min.js"></script>
	<script src="theme/v3/vendors/fontawesome/solid.min.js"></script>
	<script src="theme/v3/vendors/fontawesome/v4-font-face.min.js"></script>
	<script src="theme/v3/vendors/fontawesome/v4-shims.min.js"></script>
	<script src="theme/v3/vendors/fontawesome/v5-font-face.min.js"></script>

	<script src="theme/v3/vendors/lodash/lodash.min.js"></script>
	<script
		src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script src="theme/v3/vendors/list.js/list.min.js"></script>
	<script src="theme/v3.1/assets/js/theme.js"></script>
	<script src="theme/v3/vendors/jquery/jquery.min.js"></script>
	<script src="theme/plugins/pace/pace.min.js"></script>
	<script src="theme/chosen/chosen.jquery.min.js"></script>
	<script src="theme/plugins/jquery-validation/jquery.validate.min.js"></script>
	<script src="theme/plugins/jquery-validation/additional-methods.min.js"></script>
	<script src="theme/v3/vendors/tinymce/tinymce.min.js"></script>
	<script src="theme/v3/vendors/choices/choices.min.js"></script>
	<script src="theme/v3/vendors/tinymce/tinymce.min.js"></script>
	<script src="theme/v3/vendors/dropzone/dropzone.min.js"></script>
	<script src="theme/v3/assets/js/flatpickr.js"></script>
	<script src="theme/v3/vendors/moment/moment.min.js"></script>
	<script src="theme/v3/vendors/dayjs/dayjs.min.js"></script>
	<script src="theme/v3/vendors/chart/chart.min.js"></script>

	<script src="theme/plugins/jquery-wizard/dist/enchanter.js"></script>
	<script src="theme/plugins/summernote/summernote-lite.min.js"></script>

	<script src="theme/v3/vendors/select2/select2.min.js"></script>


	<script src="theme/v3/vendors/alasql/alasql@3.js"></script>
	<script src="theme/v3/vendors/xlsx/xlsx.core.min.js"></script>
	<script src="theme/v3/vendors/fullcalendar/main.min.js"></script>


	<script src="theme/plugins/toastr/toastr.min.js"></script>
	<script src="theme/plugins/sweetalert/sweetalert2.all.min.js"
		crossorigin="anonymous"></script>

	<!-----    Datatable start-->
	<script src="DataTables/datatables.min.js"></script>
	<!--    Datatable end-->
	<!-----    common start-->
	<script src="js/util.js"></script>
	<!--    common end-->

	<script type="module" src="js/chat/chats.js"></script>


	<script type="text/javascript">
		function loadMenuAfterAccess(link) {
			$(".header-name").html("");
			$("#formcontent").html("");
			$("#contentcontent").addClass('hide');
			loadPage(link);
		}
		function loadPage(link) {
			Pace.start();
			blockScreen();
			$(".header-name").html("Testing");
			$("#formcontent").html("");
			$("#contentcontent").addClass('hide');
			$("#pagearea")
					.html(
							'<div class="text-center spinner-div" style="margin-top:30px;"><div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div></div>');
			$("#pagearea").load(link, function() {
				Pace.stop();
				unBlockScreen();

				var body = $("html, body");
				body.stop().animate({
					scrollTop : 0
				}, 500, 'swing');
				$("#pagearea").removeClass("hide");
			});
			$(document).scrollTop(0);
		}

		function loadFormPage(link, headerName) {
			$(".header-name").html("");
			$("#formcontent").html("");

			$(".header-name").html(headerName);
			$("#contentcontent").removeClass("hide");
			$("#formcontent").load(link);
			$(document).scrollTop(0);
		}
	</script>




</body>

</html>

