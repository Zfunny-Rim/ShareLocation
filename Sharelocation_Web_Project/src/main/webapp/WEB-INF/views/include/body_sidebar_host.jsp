<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="sidebar">
	<div class="sidebar-wrapper">
		<div class="sidebar-header">
			<div class="d-flex justify-content-between">
				<div class="logo">
					<a href="/sharelocation"><img
						src="./resources/assets/images/logo/ips_logo.png"
						style="width: 151px; height: 60px;"></a>
				</div>
				<div class="toggler">
					<a href="#" class="sidebar-hide d-block"><i
						class="bi bi-x bi-middle"></i></a>
				</div>
			</div>
		</div>
		<div class="sidebar-menu">
			<!-- ***** Login Card Start ***** -->
			<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
			<c:if test="${empty loginInfo }">
				<div class="card bg-light">
					<div class="card-header">
						<h4 class="card-title">Login</h4>
					</div>
					<div class="card-body">
						<div class="basic-form">
							<form action="login.member" method="post">
								<div class="form-group row">
									<label class="col-sm-4 col-form-label" id="id">아이디</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" placeholder="ID"
											name="id"> <input type="hidden" id="id"
											value="${id }">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-4 col-form-label">비밀번호</label>
									<div class="col-sm-8">
										<input type="password" class="form-control"
											placeholder="Password" name="password"> <input
											type="hidden" id="password" value="${password }">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-12">
										<button type="submit" class="btn btn-primary btn-block">로그인</button>
									</div>
								</div>
							</form>
							<div class="new-account mt-3">
								<p>
									계정이 없으신가요? <a class="text-primary" href="register.member">회원가입</a>
								</p>
								<small><a href="findIdPw.member">아이디/비밀번호 찾기</a></small>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${not empty loginInfo }">
				<div class="user-name text-end me-3">
					<c:if test="${loginInfo.type eq 'guest' }">
						<p class="mb-0 text-sm text-gray-600">guest</p>
					</c:if>
					<c:if test="${loginInfo.type eq 'host' }">
						<p class="mb-0 text-sm text-gray-600">host</p>
					</c:if>
					<c:if test="${loginInfo.type eq 'admin' }">
						<p class="mb-0 text-sm text-gray-600">admin</p>
					</c:if>
				</div>
				<div class="card bg-light">
					<div class="card-header">
						<h4 class="card-title">${loginInfo.nickname }</h4>
						<div class="user-img d-flex align-items-center">
							<div class="avatar avatar-md">
								<c:if test="${loginInfo.gender eq '남' }">
									<img src="./resources/assets/images/faces/1.jpg">
									<span class="avatar-status bg-success"></span>
								</c:if>
								<c:if test="${loginInfo.gender eq '여' }">
									<img src="./resources/assets/images/faces/3.jpg">
									<span class="avatar-status bg-success"></span>
								</c:if>
							</div>
						</div>
						<h4 class="card-title">
							<a href="logout.jsp">logout</a>
						</h4>
					</div>
					<div class="card-body">
						<div class="basic-form">
							<div class="form-group row">
								<div class="col-sm-12">
									<button type="button" class="btn btn-primary btn-block"
										onClick="location.href='mypage.member?id=${loginInfo.id}'">MyPage</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<!-- ***** Login Card END ***** -->
			<ul class="menu">
				<li class="sidebar-title">Menu</li>
				<li class="sidebar-item"><a href="main.ho" class='sidebar-link'>
						<i class="bi bi-house-door-fill"></i> <span>홈</span>
				</a></li>
				<li class="sidebar-item"><a href="insertSpace.ho"
					class='sidebar-link'> <i class="bi bi-journal-text"></i> <span>공간
							등록하기</span>
				</a></li>
				<li class="sidebar-item"><a href="spaceList.ho"
					class='sidebar-link'> <i class="bi bi-gear"></i> <span>내
							공간 관리하기</span>
				</a></li>
				<li class="sidebar-item"><a href="noticeBoardList.nb"
					class='sidebar-link'> <i class="bi bi-exclamation-diamond-fill"></i>
						<span>공지사항</span>
				</a></li>
				<li class="sidebar-item"><a href="helpBoardList.hb"
					class='sidebar-link'> <i class="bi bi-question-circle-fill"></i>
						<span>도움말</span>
				</a></li>
				<li class="sidebar-item"><a href="list.qnaBoard"
					class='sidebar-link'> <i class="bi bi-chat-right-text-fill"></i>
						<span>Q&A</span>
				</a></li>
				<li class="sidebar-title"></li>
				<li class="sidebar-item"><a href="/sharelocation"
					class='sidebar-link'> <i class="bi bi-cart"></i> <span>사용자
							페이지 보기</span>
				</a></li>
			</ul>
		</div>
		<button class="sidebar-toggler btn x">
			<i data-feather="x"></i>
		</button>
	</div>
</div>