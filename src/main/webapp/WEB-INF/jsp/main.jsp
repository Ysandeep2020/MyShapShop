<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="libraries.jsp"%>

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
<style type="text/css">
.notification-count {
	position: absolute;
	top: 0;
	right: -15px;
	background-color: red; /* Background color for the count */
	color: white; /* Text color for the count */
	border-radius: 50%; /* Rounded shape for the background */
	padding: 3px 8px; /* Adjust the padding for the size of the count */
	font-size: 9px; /* Adjust the font size of the count */
}
</style>

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
							class="icon-bell mx-0"></i> <span class="notification-count">1</span>
					</a>
						<div
							class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
							aria-labelledby="notificationDropdown">
							<h4 style="text-align: center;"><b>Cart</b></h4>
							<a class="dropdown-item preview-item">
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
							</a> <a class="dropdown-item preview-item font-weight-bold">
							   <hr>
								<div class="row" style="width: 100%">
									<div class="col-md-6">
										<label>Total</label>
									</div>
									<div class="col-md-6" style="text-align: right;">
										<label>&#x20B9;12000</label>
									</div>
								</div>
							</a> <a class="dropdown-item preview-item">
								<div class="preview-item-content">
									<button class="btn btn-primary mr-2">View Cart</button>

								</div>
								<div class="preview-item-content">
									<button class="btn btn-primary mr-2">CheckOut</button>

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
							</a> <a class="dropdown-item" href="/logout"> <i
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


			<!-- 			<nav class="sidebar sidebar-offcanvas" id="sidebar"> -->
			<!-- 				<ul id="moduleNavbar" class="nav"> -->
			<%-- 					<c:forEach items="${moduleList}" var="module"> --%>

			<!-- 						<li class="nav-item"><a class="nav-link" -->
			<!-- 							data-toggle="collapse" href="#ui-basic" aria-expanded="false" -->
			<!-- 							aria-controls="ui-basic"> <i class="icon-layout menu-icon"></i> -->
			<%-- 								<span class="menu-title">${module.moduleName}</span> --%>
			<%-- 						</a> <c:forEach items="${menuList}" var="menu"> --%>
			<%-- 								<c:if test="${module.id==menu.moduleId}"> --%>
			<!-- 									<i class="menu-arrow"></i> -->
			<!-- 									<div class="collapse" id="ui-basic"> -->
			<!-- 										<ul class="nav flex-column sub-menu"> -->
			<!-- 											<li class="nav-item"><a class="nav-link" -->
			<%-- 												href="pages/ui-features/buttons.html">${menu.menuName}</a></li> --%>
			<!-- 										</ul> -->
			<!-- 									</div> -->
			<%-- 								</c:if> --%>
			<%-- 							</c:forEach></li> --%>
			<%-- 					</c:forEach> --%>
			<!-- 				</ul> -->
			<!-- 			</nav> -->

			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul id="moduleNavbar" class="nav">
					<c:forEach items="${realmoduleList}" var="module">
						<li class="nav-item"><a class="nav-link"
							data-toggle="collapse" href="#ui-basic-${module.id}"
							aria-expanded="false" aria-controls="ui-basic-${module.id}">
								<i class="icon-layout menu-icon"></i> <span class="menu-title">${module.moduleName}</span>
						</a> <c:forEach items="${menuList}" var="menu">
								<c:if test="${module.id == menu.moduleId}">
									<i class="menu-arrow"></i>
									<div class="collapse" id="ui-basic-${module.id}">
										<ul class="nav flex-column sub-menu">
											<!-- 										onclick="loadFormPage('users/edit/1','Update Profile')" -->
											<li class="nav-item"><a class="nav-link"
												href="javascript:loadFormPage('${menu.menuUrl}','')"
												style="cursor: pointer;">${menu.menuName}</a></li>
										</ul>
									</div>
								</c:if>
							</c:forEach></li>
					</c:forEach>
				</ul>
			</nav>

			<div class="hide" id="contentcontent">
				<div class="col-md-12">
					<div class="card-body">
						<div id="formcontent">
							<%@ include file="dashboard.jsp"%>
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

</body>

</html>

