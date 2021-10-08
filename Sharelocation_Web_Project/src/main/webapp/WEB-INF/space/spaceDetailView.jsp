<%@page import="detailspace.model.DetailSpaceBean"%>
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

.parent {
	width: 90%;
	margin: 10px auto;
}

.first {
	border: 1px solid black;
	float: left;
	width: 30%;
	box-sizing: border-box;
}

.second {
	border: 1px solid black;
	float: left;
	margin-left: 5%;
	width: 30%;
	box-sizing: border-box;
}

.third {
	border: 1px solid black;
	float: right;
	width: 30%;
	box-sizing: border-box;
}

/* 별 스타일 시작*/
element.style {
	width: 160px;
	height: 32px;
	background-size: 32px;
}

.star-rating {
	width: 0;
	position: relative;
	display: inline-block;
	background-image:
		url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDguOSIgaGVpZ2h0PSIxMDMuNiIgdmlld0JveD0iMCAwIDEwOC45IDEwMy42Ij48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6I2UzZTZlNjt9PC9zdHlsZT48L2RlZnM+PHRpdGxlPnN0YXJfMDwvdGl0bGU+PGcgaWQ9IkxheWVyXzIiIGRhdGEtbmFtZT0iTGF5ZXIgMiI+PGcgaWQ9IkxheWVyXzEtMiIgZGF0YS1uYW1lPSJMYXllciAxIj48cG9seWdvbiBjbGFzcz0iY2xzLTEiIHBvaW50cz0iMTA4LjkgMzkuNiA3MS4zIDM0LjEgNTQuNCAwIDM3LjYgMzQuMSAwIDM5LjYgMjcuMiA2Ni4xIDIwLjggMTAzLjYgNTQuNCA4NS45IDg4LjEgMTAzLjYgODEuNyA2Ni4xIDEwOC45IDM5LjYiLz48L2c+PC9nPjwvc3ZnPg0K);
	background-position: 0 0;
	background-repeat: repeat-x;
	cursor: pointer;
}

.star-rating {
	width: 0;
	position: relative;
	display: inline-block;
	background-image: url(star_0.svg);
	background-position: 0 0;
	background-repeat: repeat-x;
	cursor: pointer;
}

*, :after, :before {
	box-sizing: border-box;
}

.star-rating .star-value {
	position: absolute;
	height: 100%;
	width: 100%;
	background:
		url(data:image/svg+xml;base64,PHN2Zw0KCXhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwOC45IiBoZWlnaHQ9IjEwMy42IiB2aWV3Qm94PSIwIDAgMTA4LjkgMTAzLjYiPg0KCTxkZWZzPg0KCQk8c3R5bGU+LmNscy0xe2ZpbGw6I2YxYzk0Nzt9PC9zdHlsZT4NCgk8L2RlZnM+DQoJPHRpdGxlPnN0YXIxPC90aXRsZT4NCgk8ZyBpZD0iTGF5ZXJfMiIgZGF0YS1uYW1lPSJMYXllciAyIj4NCgkJPGcgaWQ9IkxheWVyXzEtMiIgZGF0YS1uYW1lPSJMYXllciAxIj4NCgkJCTxwb2x5Z29uIGNsYXNzPSJjbHMtMSIgcG9pbnRzPSI1NC40IDAgNzEuMyAzNC4xIDEwOC45IDM5LjYgODEuNyA2Ni4xIDg4LjEgMTAzLjYgNTQuNCA4NS45IDIwLjggMTAzLjYgMjcuMiA2Ni4xIDAgMzkuNiAzNy42IDM0LjEgNTQuNCAwIi8+DQoJCTwvZz4NCgk8L2c+DQo8L3N2Zz4NCg==);
	background-repeat: repeat-x;
}

/* 별 스타일 끝*/
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
											<br>
											<c:forEach var="tag" items="${space.tag }">
												${tag}										 
										 </c:forEach>

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
											<div class="col-12 col-md-4, parent">
												<img src="<%=request.getContextPath()%>/resources/spaceimage/${space.mainimage}"
													class="img-fluid1, first" alt="singleminded">

												<c:forEach items="${detailspace}" var="detail" begin="0"
													end="1">
													<a onclick="detailView(${detail.spacenum})">
													
													<img src="<%=request.getContextPath()%>/resources/spaceimage/${detail.mainimage}"
														class="img-fluid1, second" alt="singleminded"></a>

												</c:forEach>

												<div class="card-body"></div>
											</div>
											<ul class="list-group list-group-flush">

											</ul>
										</div>

										<!-- 	사진 test 1 -->

										<!-- 설명 시작1 -->

										<div class="container">
											<div class="row row-cols-2">

												<div class="col">
													<h4 class="card-title">한줄소개</h4>
													${space.contentssim}
													<h4 class="card-title">공간소개</h4>
													${space.contentscom}
													<h4 class="card-title">지도</h4>
													<h4 class="card-title">사용자 후기</h4>
													<!-- 후기	시작 -->

													<c:forEach var="review" items="${reviewBoard}">
														<div class="col-12">
															<div class="card">
																<div class="card-header" style="font:">
																	<h1 class="card-title" style="float: left;">${review.write}</h1>
																	<!-- 별점 별 그림 시작-->
																	<div id="step" class="star-rating"
																		style="width: 160px; height: 30px; background-size: 30px;"
																		data-rating="5" title="${review.totalrating/3}/5">
																		<div class="star-value"
																			style="background-size: 32px; width: ${review.totalrating/3/5*100}%;"></div>
																	</div>
																	<!-- 별점 별 그림 끝 -->

																</div>
																<div class="card-body">
																	<p>${review.content}</p>
																	<p>${review.regdate}</p>
																</div>
															</div>
														</div>

													</c:forEach>
													<!-- 후기	끝 -->
												</div>
												<!-- 설명 끝1 -->


												<!-- 	  접히는거 시작 -->

												<div class="col" style="align-content: center;">
													<!-- reservation 넘어가기 -->
													<form
														action="<%=request.getContextPath()%>/reserv.rv?&spacenum=1&membernum=1"
														method="post">
															<h4 class="card-title">예약하기</h4>
														<table class="table table-lg" style="border: thick; border-radius: 8px;  ">
															<tbody>
																<tr>
																	<td class="text-bold-500">장소 선택</td>
																	<td align="center"><c:forEach var="spacename"
																			items="${detailspace}">
																			<input type="radio" value="spacename" name="name"
																				onclick="selectUnit(${space.num},${spacename.num})">${spacename.name}
																					</c:forEach></td>
																</tr>

																<tr>
																	<td colspan="2" class="text-bold-500" align="center"><input
																		type="submit" class="btn btn-secondary" value="예약하기"></td>
																</tr>

															</tbody>
														</table>
													</form>

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
	
	function favorite(spacenum,membernum){
		location.href="favorite.sp?spacenum="+spacenum+"&membernum="+membernum;
	}
	
	function detailView(spacenum){
		alert("세부 사진 보기");
		window.open("spaceImage.sp?spacenum="+spacenum, "imageView", "width=400, height=300, left=100, top=50")
	}
	
	function selectUnit(num,spacenum){
		//alert(num,":",spacenum);
		location.href ="detailView.sp?num="+num+"&spacenum="+spacenum;
	}

	</script>

		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>