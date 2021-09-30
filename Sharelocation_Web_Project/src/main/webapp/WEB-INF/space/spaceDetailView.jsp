<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IPS partagé</title>
<%@ include file="/WEB-INF/views/include/head_css.jsp"%>
<%-- ******* CUSTOM CSS Link HERE ******* --%>

<%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp"%>
		<%@ include file="/WEB-INF/views/include/body_sidebar.jsp"%>
		<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>
		<div id="main" style="padding-top: 0px;">
			<div id="main-content">
				<div class="page-heading">
					<section class="section">
						<%-- ******* Main Code HERE ******* --%>
						<div>
							<div class="card">
								<div class="card-header">
									<h4>${space.name }</h4>

								</div>
								<div class="card-body"
									style="height: 600px; width: 600px; float: left;">
									<div id="carouselExampleCaptions" class="carousel slide"
										data-bs-ride="carousel">
										<ol class="carousel-indicators">
											<li data-bs-target="#carouselExampleCaptions"
												data-bs-slide-to="0" class="active"></li>
											<li data-bs-target="#carouselExampleCaptions"
												data-bs-slide-to="1" class=""></li>
											<li data-bs-target="#carouselExampleCaptions"
												data-bs-slide-to="2"></li>
										</ol>
										<div class="carousel-inner">
											<div class="carousel-item active">
												<img
													src="//live.staticflickr.com/3229/2345709106_69cca5292f_h.jpg"
													class="d-block w-100" alt="...">
												<div class="carousel-caption d-none d-md-block">
													<h5>${space.name }first</h5>
													<p>Nulla vitae elit libero, a pharetra augue mollis
														interdum.</p>
												</div>
											</div>
											<div class="carousel-item">
												<img
													src="//live.staticflickr.com/2223/2344882021_38302e0b8d_n.jpg"
													class="d-block w-100" alt="...">
												<div class="carousel-caption d-none d-md-block">
													<h5>${space.name }Second</h5>
													<p>Nulla vitae elit libero, a pharetra augue mollis
														interdum.</p>
												</div>
											</div>
										</div>
										<a class="carousel-control-prev"
											href="#carouselExampleCaptions" role="button"
											data-bs-slide="prev"> <span
											class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</a> <a class="carousel-control-next"
											href="#carouselExampleCaptions" role="button"
											data-bs-slide="next"> <span
											class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</a>
									</div>
								</div>
							</div>
						</div>
						<!-- 설명 시작1 -->
						<div class="card-header" style="width: 65%; float: left;">
							<h4 class="card-title">${space.contents_sim}</h4>
							<h4 class="card-title">${space.contents_com}</h4>
							<h4 class="card-title">지도</h4>
							<h4 class="card-title">지도</h4>
							<h4 class="card-title">지도</h4>
							<h4 class="card-title">지도</h4>
							<h4 class="card-title">지도</h4>
							<h4 class="card-title">지도</h4>
							<h4 class="card-title">지도</h4>
						</div>
						<!-- 설명 끝1 -->


						<!-- 	  접히는거 시작 -->
						<div class="card-header" style="width:auto; align-content: center;" >
							<div class="accordion" id="cardAccordion" style="width:auto" >
								<div class="card" style="width:auto" >
									<div class="card-header" id="headingOne"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="false" aria-controls="collapseOne"
										role="button">
										<span class="collapsed collapse-title">예약 정보</span>
									</div>
									<div id="collapseOne" class="collapse pt-1"
										aria-labelledby="headingOne" data-parent="#cardAccordion">
										<div class="card-body" >
											<form>
											
											<div class="card-body">
                                       <!-- Table with outer spacing -->
                                        <div class="table-responsive">
                                            <table class="table table-lg">

                                                <tbody>
                                                    <tr>
                                                        <td class="text-bold-500">Michael Right</td>
                                                        <td>$15/hr</td>

                                                    </tr>
                                                    <tr>
                                                        <td class="text-bold-500" >시간선택</td>
                                                        <td><div class="col-md-6 mb-4">
                                                <fieldset class="form-group" class="text-bold-500">
                                                    <select class="form-select" id="basicSelect" name="time" style="width: 180px; margin-top: 22px;" > <!-- 이름 확인해봐야됨 -->
                                                        <option >10~12</option>
                                                        <option>12~14</option>
                                                        <option>14~16</option>
                                                    </select>
                                                </fieldset>
                                            </div></td>

                                                    </tr>
                                                    <tr>
                                                        <td class="text-bold-500">가격</td>
                                                        <td>$15/hr</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"  class="text-bold-500" align="center"><a class="btn btn-secondary">예약하기</a></td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
											
											
											</form>
									
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 	  접히는거 끝 -->





						<%-- ******* Main Code END ******* --%>
					</section>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<%-- ******* CUSTOM Script HERE ******* --%>




		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>