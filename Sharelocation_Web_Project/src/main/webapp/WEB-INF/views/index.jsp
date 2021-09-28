<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IPS partagé</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./resources/assets/css/bootstrap.css">
    <link rel="stylesheet" href="./resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="./resources/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="./resources/assets/css/app.css">
    <link rel="shortcut icon" href="./resources/assets/images/favicon.svg" type="image/x-icon">
</head>

<body>
	<div id="app">
		<header class='mb-3'>
			<nav class="navbar navbar-expand navbar-light bg-light" id="navbar">
<!-- 				<div class="logo-image" style="width: 295px;"> -->
<!-- 					<i class="bi bi-shop fs-3"></i> -->
<!-- 					<span class="text">IPS partagé</span> -->
<!-- 				</div> -->
				<div class="logo-image" style="width: 200px; margin-right:50px;">
					<a href="index.jsp"><img
						src="./resources/assets/images/logo/ips_logo.png" alt="Logo" width="100%"></a>
				</div>
				<a href="#" class="burger-btn d-block sytyle="padding-top:10px;"> <i
					class="bi bi-justify fs-3"></i>
				</a>
				<div class="container-fluid">
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
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
<!-- 								<li><a class="dropdown-item" href="#"><i -->
<!-- 										class="icon-mid bi bi-person me-2"></i> My Profile</a></li> -->
<!-- 								<li><a class="dropdown-item" href="#"><i -->
<!-- 										class="icon-mid bi bi-gear me-2"></i> Settings</a></li> -->
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

		<div id="sidebar">
            <div class="sidebar-wrapper">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="index.jsp"><img src="./resources/assets/images/logo/ips_logo.png"  style="width: 151px; height: 60px;"></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                	<!-- ***** Login Card 시작 ***** -->
                	<div class="card bg-light">
						<div class="card-header">
							<h4 class="card-title">Login</h4>
						</div>
						<div class="card-body">
							<div class="basic-form">
								<form>
									<div class="form-group row">
										<label class="col-sm-4 col-form-label">아이디</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" placeholder="ID">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-4 col-form-label">비밀번호</label>
										<div class="col-sm-8">
											<input type="password" class="form-control"
												placeholder="Password">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-12">
											<button type="submit" class="btn btn-primary btn-block">로그인</button>
										</div>
									</div>
								</form>
								<div class="new-account mt-3">
	                                       <p>계정이 없으신가요? <a class="text-primary" href="#">회원가입</a></p>
	                                       <small><a href="#">아이디/비밀번호 찾기</a></small>
	                             </div>
							</div>
						</div>
					</div>
					<!-- ***** Login Card 종료 ***** -->
                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>
                        <li class="sidebar-item">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-house-door-fill"></i>
                                <span>홈</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-journal-text"></i>
                                <span>예약리스트 보기</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-bookmark-star-fill"></i>
                                <span>찜한 공간</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-blockquote-left"></i>
                                <span>후기 관리하기</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-exclamation-diamond-fill"></i>
                                <span>공지사항</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-question-circle-fill"></i>
                                <span>도움말</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-chat-right-text-fill"></i>
                                <span>Q&A</span>
                            </a>
                        </li>
                        <li class="sidebar-title"></li>
                        <li class="sidebar-item">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-cart"></i>
                                <span>호스트 되기</span>
                            </a>
                        </li>
					</ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
        
        <div id="main" style="padding-top:0px;">
            <div id="main-content">
                <div class="page-heading">
                    <section class="section">
                    	<div class="card">
	                    	<div class="card-content">
		                    	<div class="main-image mx-auto">
			                        <img src="./resources/assets/images/bg/title01.jpg" class="card-img-top img-fluid">
		                    	</div>
	                    	</div>
                    	</div>
                    </section>
                </div>
            </div>
        </div>

		<footer class="bg-light w-100">
			<div class="footer clearfix mb-0 text-muted">
				<div class="float-start p-3">
					<p>2021 &copy; IPS partagé</p>
				</div>
				<div class="float-end p-3">
					<p class="text-muted">
					<font size="2px">
						<a href="#">블로그</a> |
						<a href="#">이용약관</a> |
						<a href="#">개인정보처리방침</a> |
						<a href="#">운영정책</a> |
						<a href="#">고객문의</a>
					</font>
					</p>
				</div>
			</div>
			<div class="footer clearfix mb-0 text-muted">
				<div class="float-start p-3">
					<font size="2px">
						상호명: IPS partagé | 대표: 임지훤 | 사업자등록번호: 105-91-95789 | 통신판매업신고번호: 제 2014-서울마포-1125호 <br>
						영업소재지: 서울특별시 마포구 신촌로 176 | 이메일: hardmix2@gmail.com | 대표전화: 010-4707-4706 <br>
					</font>
				</div>
				
				<div class="float-end p-3">
					<a href="#"><font size="6px"><i class="bi bi-facebook"></i></font></a>
					<a href="#"><font size="6px"><i class="bi bi-twitter"></i></font></a>
					<a href="#"><font size="6px"><i class="bi bi-instagram"></i></font></a>
					<a href="#"><font size="6px"><i class="bi bi-google"></i></font></a>
					<a href="#"><font size="6px"><i class="bi bi-twitch"></i></font></a>
				</div>
			</div>
		</footer>
	</div>
    <script src="./resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="./resources/assets/js/bootstrap.bundle.min.js"></script>

    <script src="./resources/assets/js/main.js"></script>
</body>

</html>