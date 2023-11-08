<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- partial -->
<!--       <div class="main-panel"> -->
<!--         <div class="content-wrapper"> -->
<div class="row">
	<div class="col-md-12 grid-margin">
		<div class="row">
			<div class="col-12 col-xl-8 mb-4 mb-xl-0">
				WelCome
				<h6 class="font-weight-normal mb-0">
					All systems are running smoothly! You have <span
						class="text-primary">3 unread alerts!</span>
				</h6>
			</div>
			<div class="col-12 col-xl-4">
				<div class="justify-content-end d-flex">
					<div class="dropdown flex-md-grow-1 flex-xl-grow-0">
						<button class="btn btn-sm btn-light bg-white dropdown-toggle"
							type="button" id="dropdownMenuDate2" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="true">
							<i class="mdi mdi-calendar"></i> Today (10 Jan 2021)
						</button>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="dropdownMenuDate2">
							<a class="dropdown-item" href="#">January - March</a> <a
								class="dropdown-item" href="#">March - June</a> <a
								class="dropdown-item" href="#">June - August</a> <a
								class="dropdown-item" href="#">August - November</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-6 grid-margin stretch-card">
		<div class="card tale-bg">
			<div class="card-people mt-auto">
				<img src="images/dashboard/people.svg" alt="people">
				<div class="weather-info">
					<div class="d-flex">
						<div>
							<h2 class="mb-0 font-weight-normal">
								<i class="icon-sun mr-2"></i>31<sup>C</sup>
							</h2>
						</div>
						<div class="ml-2">
							<h4 class="location font-weight-normal">Bangalore</h4>
							<h6 class="font-weight-normal">India</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6 grid-margin transparent">
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h3 class="font-weight-light">Sign in to continue.</h3>
						<form class="pt-3" action="/validate-login" method="post">
							<div class="mb-3 card-padding">
								<c:if test="${authMessage != null}">
									<p class="text-danger">${authMessage}</p>
								</c:if>
							</div>
							<div class="form-group">
								<input type="email" class="form-control form-control-lg"
									id="exampleInputEmail1" name="username" placeholder="Username">
							</div>
							<div class="form-group">
								<input type="password" class="form-control form-control-lg"
									id="exampleInputPassword1" name="password"
									placeholder="Password">
							</div>
							<div class="mt-3">
								<!--                   <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" href="../../index.html">SIGN IN</a> -->

								<button
									class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
									type="submit" name="submit"
									style="background-color: #2c4e65; border: 1px solid #2c4e65;">
									Log in</button>
							</div>
							<div
								class="my-2 d-flex justify-content-between align-items-center">
								<div class="form-check">
									<label class="form-check-label text-muted"> <input
										type="checkbox" class="form-check-input"> Keep me
										signed in
									</label>
								</div>
								<a href="#" class="auth-link text-black">Forgot password?</a>
							</div>
							<div class="mb-2">
								<button type="button"
									class="btn btn-block btn-facebook auth-form-btn">
									<i class="ti-facebook mr-2"></i>Connect using facebook
								</button>
							</div>
							<div class="text-center mt-4 font-weight-light">
								Don't have an account? <a href="register" class="text-primary">Create</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


