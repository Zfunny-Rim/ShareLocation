<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>IPS partagé</title>
    <!--  offcanvas를 위한 bs v5.0.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="./resources/bootstrap/css/style.css" rel="stylesheet">
</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->


    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
<!--         <div class="nav-header"> -->
<!--             <a href="index.html" class="brand-logo"> -->
<!--                 <img class="logo-abbr" src="./resources/bootstrap/images/logo.png" alt=""> -->
<!--                 <img class="logo-compact" src="./resources/bootstrap/images/logo-text.png" alt=""> -->
<!--                 <img class="brand-title" src="./resources/bootstrap/images/logo-text.png" alt=""> -->
<!--             </a> -->

<!--             <div class="nav-control"> -->
<!--                 <div class="hamburger"> -->
<!--                     <span class="line"></span><span class="line"></span><span class="line"></span> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
		<div class="header p-0">
            <div class="header-content p-0">
                <nav class="navbar navbar-expand bg-dark">
					<div class="collapse navbar-collapse justify-content-between">
						<div class="ml-1">
							<a class="navbar-brand" href="#"> <img class="logo-abbr"
								src="./resources/bootstrap/images/logo.png" alt="" width="30"
								height="30"> <img class="brand-title"
								src="./resources/bootstrap/images/logo-text.png" alt="">
							</a>
						</div>
						<form class="m-0">
	                        <div class="header-left">
	                            <div class="search_bar">
	                                <span class="search_icon p-3 c-pointer">
	                                    <i class="mdi mdi-magnify"></i>
	                                </span>
									<div class="p-0 m-0">
										<input class="form-control" type="search" placeholder="Search" aria-label="Search">
									</div>
								</div>
								<button type="submit" class="btn btn-primary btn-rounded ml-2">검색</button>
	                        </div>
                        </form>
                        <div class="mr-2">
                        	<button class="btn btn-primary" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight">
                        		<font size="5"> <i class="ti-menu"></i> </font>
                        	</button>
                        </div>
                    </div>
                </nav>
            </div>
		</div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->
		<div class="offcanvas offcanvas-end" id="offcanvasRight">
		  <div class="offcanvas-header">
		    <h5 id="offcanvasRightLabel">Menu</h5>
		    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
		  </div>
		  <div class="offcanvas-body">
			<!-- login 되어있으면 회원정보가 나와야함 -->
				<div class="card bg-light">
					<div class="card-header">
						<h4 class="card-title">Login</h4>
					</div>
					<div class="card-body">
						<div class="basic-form">
							<form>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label">아이디</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" placeholder="ID">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label">비밀번호</label>
									<div class="col-sm-9">
										<input type="password" class="form-control"
											placeholder="Password">
									</div>
								</div>
								<div class="form-row d-flex justify-content-between mt-4 mb-2">
									<div class="form-group">
										<div class="form-check ml-2">
											<input class="form-check-input" type="checkbox" id="basic_checkbox_1">
											<label class="form-check-label" for="basic_checkbox_1">아이디 기억하기</label>
										</div>
									</div>
									<div class="form-group">
										<a href="#">아이디/비밀번호 찾기</a>
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
                             </div>
						</div>
					</div>
				</div>

				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action">
					홈</a>
					<a href="#"	class="list-group-item list-group-item-action list-group-item-primary">
					예약 리스트 보기</a>
					<a href="#" class="list-group-item list-group-item-action list-group-item-secondary">
					찜한 공간</a>
					<a href="#"	class="list-group-item list-group-item-action list-group-item-success">
					후기 관리하기</a>
					<a href="#" class="list-group-item list-group-item-action list-group-item-danger">
					공지사항</a>
					<a href="#"	class="list-group-item list-group-item-action list-group-item-warning">
					도움말</a>
					<a href="#"	class="list-group-item list-group-item-action list-group-item-info">
					Q&A</a>
				</div>
				
				<div class="col-sm-12 my-5 p-0">
					<button type="button" class="btn btn-secondary btn-square btn-block" style="height: 75px;">호스트 되기</button>
				</div>
			</div>
		</div>

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body mx-auto">
            <!-- row -->
            <div class="container-fluid">

				<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="https://a0.muscache.com/im/pictures/e09893fc-1d02-49b2-befa-c4be7a57ed18.jpg?im_w=720" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="https://blog.kakaocdn.net/dn/DXNNS/btqWBAL2l9e/f6jTKhMjVguGOnUUvWqdX0/img.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="..." class="d-block w-100" alt="...">
						</div>
					</div>
				</div>


				<div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>Hi, welcome back!</h4>
                            <span class="ml-1">Card</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Bootstrap</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Card</a></li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Card title</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text">He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff <br> sections. The bedding was hardly able to cover it and seemed ready to
                                    slide off any moment.
                                </p>
                            </div>
                            <div class="card-footer">
                                <p class="card-text d-inline">Card footer</p>
                                <a href="javascript:void()" class="card-link float-right">Card link</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6 ">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title">Card title</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text">This is a wider card with supporting text and below as a natural lead-in to the additional content. This content is a little <br> bit longer. Some quick example text to build the bulk</p>
                            </div>
                            <div class="card-footer d-sm-flex justify-content-between">
                                <div class="card-footer-link mb-4 mb-sm-0">
                                    <p class="card-text text-dark d-inline">Last updated 3 mins ago</p>
                                </div>

                                <a href="javascript:void()" class="btn btn-primary">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card text-center">
                            <div class="card-header">
                                <h5 class="card-title">Card Title</h5>
                            </div>
                            <div class="card-body">

                                <p class="card-text">This is a wider card with supporting text and below as a natural lead-in to the additional content. This content</p>
                                <a href="javascript:void()" class="btn btn-primary">Go somewhere</a>
                            </div>
                            <div class="card-footer">
                                <p class="card-text text-dark">Last updateed 3 min ago</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card text-center">
                            <div class="card-header">
                                <h5 class="card-title">Special title treatment</h5>
                            </div>
                            <div class="card-body">
                                <ul class="nav nav-tabs card-body-tabs">
                                    <li class="nav-item"><a class="nav-link active" href="javascript:void()">Active</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link" href="javascript:void()">Link</a>
                                    </li>
                                    <li class="nav-item"><a class="nav-link disabled" href="javascript:void()">Disabled</a>
                                    </li>
                                </ul>

                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p><a href="javascript:void()" class="btn btn-primary btn-card">Go somewhere</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card text-white bg-primary">
                            <div class="card-header">
                                <h5 class="card-title text-white">Primary card title</h5>
                            </div>
                            <div class="card-body mb-0">
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p><a href="javascript:void()" class="btn btn-dark btn-card">Go
                                    somewhere</a>
                            </div>
                            <div class="card-footer bg-transparent border-0 text-white">Last updateed 3 min ago
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card text-white bg-secondary">
                            <div class="card-header">
                                <h5 class="card-title text-white">Secondary card title</h5>
                            </div>
                            <div class="card-body mb-0">
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p><a href="javascript:void()" class="btn btn-dark btn-card">Go
                                    somewhere</a>
                            </div>
                            <div class="card-footer bg-transparent border-0 text-white">Last updateed 3 min ago
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card text-white bg-success">
                            <div class="card-header">
                                <h5 class="card-title text-white">Success card title</h5>
                            </div>
                            <div class="card-body mb-0">
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p><a href="javascript:void()" class="btn btn-dark btn-card">Go
                                    somewhere</a>
                            </div>
                            <div class="card-footer bg-transparent border-0 text-white">Last updateed 3 min ago
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card text-white bg-danger">
                            <div class="card-header">
                                <h5 class="card-title text-white">Danger card title</h5>
                            </div>
                            <div class="card-body mb-0">
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p><a href="javascript:void()" class="btn btn-dark btn-card">Go
                                    somewhere</a>
                            </div>
                            <div class="card-footer bg-transparent border-0 text-white">Last updateed 3 min ago
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card text-white bg-warning">
                            <div class="card-header">
                                <h5 class="card-title text-white">Warning card title</h5>
                            </div>
                            <div class="card-body mb-0">
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p><a href="javascript:void()" class="btn btn-dark btn-card">Go
                                    somewhere</a>
                            </div>
                            <div class="card-footer bg-transparent border-0 text-white">Last updateed 3 min ago
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card text-white bg-info">
                            <div class="card-header">
                                <h5 class="card-title text-white">Info card title</h5>
                            </div>
                            <div class="card-body mb-0">
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p><a href="javascript:void()" class="btn btn-dark btn-card">Go
                                    somewhere</a>
                            </div>
                            <div class="card-footer bg-transparent border-0 text-white">
                                Last updateed 3 min ago
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card bg-light">
                            <div class="card-header">
                                <h5 class="card-title">Light card title</h5>
                            </div>
                            <div class="card-body mb-0">
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p><a href="javascript:void()" class="btn btn-dark btn-card">Go
                                    somewhere</a>
                            </div>
                            <div class="card-footer bg-transparent border-0">Last updateed 3 min ago
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card text-white bg-dark">
                            <div class="card-header">
                                <h5 class="card-title text-white">Dark card title</h5>
                            </div>
                            <div class="card-body mb-0">
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="javascript:void()" class="btn btn-light btn-card text-dark">Go
                                    somewhere</a>
                            </div>
                            <div class="card-footer bg-transparent border-0 text-white">Last updateed 3 min ago
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card mb-3">
                            <img class="card-img-top img-fluid" src="./images/card/1.png" alt="Card image cap">
                            <div class="card-header">
                                <h5 class="card-title">Card title</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                <p class="card-text text-dark">Last updated 3 mins ago</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card mb-3">
                            <img class="card-img-top img-fluid" src="./images/card/2.png" alt="Card image cap">
                            <div class="card-header">
                                <h5 class="card-title">Card title</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text">He lay on his armour-like back, and if he lifted his head a little
                                </p>
                            </div>
                            <div class="card-footer">
                                <p class="card-text d-inline">Card footer</p>
                                <a href="javascript:void()" class="card-link float-right">Card link</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-xxl-6 col-lg-6 col-sm-6">
                        <div class="card mb-3">
                            <div class="card-header">
                                <h5 class="card-title">Card title</h5>
                            </div>
                            <div class="card-body">
                                <p class="card-text">This is a wider card with supporting text and below as a natural lead-in to the additional content. This content is a little</p>
                            </div>
                            <img class="card-img-bottom img-fluid" src="./images/card/3.png" alt="Card image cap">
                            <div class="card-footer">
                                <p class="card-text d-inline">Card footer</p>
                                <a href="javascript:void()" class="card-link float-right">Card link</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--  -->
			</div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->

        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a> 2019</p>
                <p>Distributed by <a href="https://themewagon.com/" target="_blank">Themewagon</a></p> 
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->

        <!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
        ***********************************-->

    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="./resources/bootstrap/vendor/global/global.min.js"></script>
    <script src="./resources/bootstrap/js/custom.min.js"></script>

    
    <!--  offcanvas를 위한 bs v5.0.2 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>