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
<style type="text/css">

.img-fluid1, .img-thumbnail {
    max-width: 70%;
    height: auto;
    margin-left: 20%;
}

.parent{
    width: 90%;
    margin: 10px auto;
}

.first {
    border: 1px solid black;
    float: left;
    width:30%;
    box-sizing: border-box;
}

.second{
    border: 1px solid black;
    float: left;
    margin-left: 5%;
    width:30%;
    box-sizing: border-box;
}

.third{
    border: 1px solid black;
    float: right;
    width:30%;
    box-sizing: border-box;
}


</style>
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
										<h3>${space.name }
											<a href="#" class="btn btn-danger"
												onclick="favorite(${space.num},${space.membernum})">찜하기</a>
												<!-- tag 넣기  시작-->
											${st.tag}	
												
												<!-- tag 넣기  끝-->
												
										</h3>
									</div>
									<div class="col-12 col-md-6 order-md-2 order-first">
										<nav aria-label="breadcrumb"
											class="breadcrumb-header float-start float-lg-end"></nav>
									</div>
								</div>
							</div>
							<section class="section">
								<div class="card">

									<div class="card-body">
										<!-- 기본 틀 -->

										<!-- 	사진 test 1 -->

										<div class="card">
											<div class="col-12 col-md-4, parent" >
												<img  src="<%=request.getContextPath()%>/resources/spaceimage/${space.mainimage}"
													class="img-fluid1, first" alt="singleminded" >
													
												<img  src="<%=request.getContextPath()%>/resources/spaceimage/${space.mainimage}"
													class="img-fluid1, second" alt="singleminded" >
												<img  src="<%=request.getContextPath()%>/resources/spaceimage/${space.mainimage}"
													class="img-fluid1, third" alt="singleminded" >	
												<div class="card-body">
													
												</div>
											</div>
											<ul class="list-group list-group-flush">
																						
											</ul>
										</div>

										<!-- 	사진 test 1 -->

										<!-- 설명 시작1 -->
										<div class="card-header" style="width: 50%; float: left;">
											<h4 class="card-title"></h4>
											${space.contentssim}
											<h4 class="card-title">공간소개</h4>
											${space.contentscom}
											<h4 class="card-title">지도</h4>
											<h4 class="card-title">사용자 후기</h4>

										</div>
										<!-- 설명 끝1 -->


										<!-- 	  접히는거 시작 -->

										<div class="card-header"
											style="width: auto; align-content: center;">
											<div class="accordion" id="cardAccordion" style="width: auto">
												<div class="card" style="width: auto">
													<div class="card-header" id="headingOne"
														data-bs-toggle="collapse" data-bs-target="#collapseOne"
														aria-expanded="false" aria-controls="collapseOne"
														role="button">
														<span class="collapsed collapse-title">예약 정보</span>
													</div>
													<div id="collapseOne" class="collapse pt-1"
														aria-labelledby="headingOne" data-parent="#cardAccordion">
														<div class="card-body">
															<!-- reservation 넘어가기 -->

															<div class="card-body" style="width: auto">
																<!-- Table with outer spacing -->
																<div class="table-responsive">
																	<form action="/reserv.rv">
																		<table class="table table-lg" style="width: auto;">

																			<tbody>
																				<tr>
																					<td class="text-bold-500">세부공간 선택</td>
																					<td align="center">$15/hr</td>

																				</tr>
																				<tr>
																					<td class="text-bold-500">시간선택</td>
																					<td align="center"><div class="col-md-6 mb-4">

																							<fieldset class="form-group"
																								class="text-bold-500">
																								<select class="form-select" id="basicSelect"
																									name="time"
																									style="width: 160px; margin-top: 22px;">
																									<!-- 이름 확인해봐야됨 -->
																									<option>10~12</option>
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
																					<td colspan="2" class="text-bold-500"
																						align="center"><input type="submit"
																						class="btn btn-secondary" value="예약하기"></td>
																				</tr>

																			</tbody>
																		</table>
																	</form>
																</div>
															</div>

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
		//alert(spaceNum ,memberNum);
		location.href="favorite.sp?spaceNum="+spaceNum+"&memberNum="+memberNum;
	}
	
	</script>

		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>