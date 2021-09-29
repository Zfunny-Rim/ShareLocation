<header class='mb-3'>
	<nav class="navbar navbar-expand navbar-light bg-dark" id="navbar">
		<div class="logo-image" style="width: 200px; margin-right: 50px;">
			<a href="index.jsp"><img
				src="./resources/assets/images/logo/ips_logo.png" alt="Logo"
				width="100%"></a>
		</div>
		<a href="#" class="burger-btn d-block style="padding-top:10px;">
			<i class="bi bi-justify fs-3"></i>
		</a>
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-between"
				id="navbarSupportedContent">
				<div class="navbar-nav ms-auto mb-2 bg-lg-0">
					<form class="m-0 p-0">
						<div class="input-group ms-auto">
							<span class="input-group-text" id="basic-addon1"><i
								class="bi bi-search"></i></span> <input type="text"
								class="form-control" placeholder="공간을 검색하세요.">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2">검색</button>
						</div>
					</form>
				</div>
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				</ul>
				<div class="dropdown">
					<a href="#" data-bs-toggle="dropdown" aria-expanded="false">
						<div class="user-menu d-flex">
							<div class="user-name text-end me-3">
								<h6 class="mb-0 text-gray-600">Guest</h6>
								<p class="mb-0 text-sm text-gray-600">welcome</p>
							</div>
							<div class="user-img d-flex align-items-center">
								<div class="avatar avatar-md">
									<img src="./resources/assets/images/faces/none.jpg">
								</div>
							</div>
						</div>
					</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="dropdownMenuButton">
						<li>
							<h6 class="dropdown-header">로그인이 필요합니다.</h6>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="#"><i
								class="icon-mid bi bi-box-arrow-right me-2"></i> Login</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</header>