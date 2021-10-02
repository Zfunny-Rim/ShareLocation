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
            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>${space.name } <a href="#" class="btn btn-danger" onclick=" favorite(${space.num},${space.memberNum})">찜하기</a></h3>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                             </nav>
                        </div>
                    </div>
                </div>
                <section class="section">
                    <div class="card">
              
                        <div class="card-body">
                     <!-- 기본 틀 -->
                     
                    <div>
                    
                    <!-- 사진시작 -->
							<div class="card">
								<div class="card-header">
								</div>
								<div class="card-body"
									style="height: auto; width: 400px; float: left;">
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
													<p>${space.contentsSim}</p>
												</div>
											</div>
											<div class="carousel-item">
												<img
													src="//live.staticflickr.com/2223/2344882021_38302e0b8d_n.jpg"
													class="d-block w-100" alt="...">
												<div class="carousel-caption d-none d-md-block">
													<h5>${space.name }Second</h5>
													<p>${space.contentsSim }</p>
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
						<div class="card-header" style="width: 50%; float: left;">
							<h4 class="card-title">${space.contentsSim}</h4>
							<h4 class="card-title">${space.contentsCom}</h4>
							<h4 class="card-title">지도</h4>
							<h4 class="card-title">사용자 후기</h4>
						    <h5></h5>
			
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
											<form action = "/reservation.rs" method="get"> <!-- reservation 넘어가기 -->
											
											<div class="card-body" style="width:auto" >
                                       <!-- Table with outer spacing -->
                                        <div class="table-responsive">
                                            <table class="table table-lg" style="width: auto;"> 

                                                <tbody>
                                                    <tr>
                                                        <td class="text-bold-500" >Michael Right</td>
                                                        <td align="center">$15/hr</td>

                                                    </tr>
                                                    <tr>
                                                        <td class="text-bold-500">시간선택</td>
                                                        <td align="center"><div class="col-md-6 mb-4">
                                                <fieldset class="form-group" class="text-bold-500">
                                                    <select class="form-select" id="basicSelect" name="time" style="width: 160px; margin-top: 22px;" > <!-- 이름 확인해봐야됨 -->
                                                        <option >10~12</option>
                                                        <option>12~14</option>
                                                        <option>14~16</option>
                                                    </select>
                                                </fieldset>
                                            </div></td>

                                                    </tr>
                                                    <tr>
                                                        <td class="text-bold-500">가격</td>
                                                        <td align="center">$15/hr</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"  class="text-bold-500" align="center">
                                                        <input type="submit" class="btn btn-secondary" value="예약하기"></td>
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
                     
                     
                     
                     
                     
                     
                     <!-- 기본 틀 -->
                        </div>
                    </div>
                </section>
            </div>
						





						<%-- ******* Main Code END ******* --%>
					</section>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp"%>
		<%-- ******* CUSTOM Script HERE ******* --%>
	
	<script type="text/javascript">
	
	function favorite(spaceNum,memberNum){
		//alert(memberNum ,num);
		location.href="favorite.sp?spaceNum="+spaceNum+"&memberNum="+memberNum;
	}
	
	function favorite reserve(){
		alert(1);
	}
	
	
	</script>



		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>