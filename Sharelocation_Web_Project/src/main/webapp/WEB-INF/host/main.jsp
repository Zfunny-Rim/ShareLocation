<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IPS partagé</title>
    <%@ include file="/WEB-INF/views/include/head_css.jsp" %>
    <%-- ******* CUSTOM CSS Link HERE ******* --%>
    
    <%-- ******* CUSTOM CSS Link END ******* --%>
</head>

<body>
	<div id="app">
		<%@ include file="/WEB-INF/views/include/body_navbar.jsp" %>
		<%@ include file="/WEB-INF/views/include/body_sidebar.jsp" %>
        <div id="main" style="padding-top:0px;">
            <div id="main-content">
                <div class="page-heading">
                    <section class="section">
                    	<%-- ******* Main Code HERE ******* --%>
						<div class="page-heading">
							<div class="page-title">
								<div class="row">
									<div class="col-12 col-md-6 order-md-1 order-last">
										<h3>당신의 공간을 등록해보세요.</h3>
										<p class="text-subtitle text-muted">partagé의 호스트가 되어보세요. 저희가 도와드리겠습니다.</p>
									</div>
									<div class="col-12 col-md-6 order-md-2 order-first">
										<nav aria-label="breadcrumb"
											class="breadcrumb-header float-start float-lg-end">
											<ol class="breadcrumb">
												<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
												<li class="breadcrumb-item active" aria-current="page">Layout
													Vertical Navbar</li>
											</ol>
										</nav>
									</div>
								</div>
							</div>
							<section class="section">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Example Content</h4>
									</div>
									<div class="card-body">Lorem ipsum dolor sit amet
										consectetur adipisicing elit. Consectetur quas omnis
										laudantium tempore exercitationem, expedita aspernatur sed
										officia asperiores unde tempora maxime odio reprehenderit
										distinctio incidunt! Vel aspernatur dicta consequatur!</div>
								</div>
							</section>
						</div>
						<%-- ******* Main Code END ******* --%>
                    </section>
                </div>
            </div>
        </div>
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		<%@ include file="/WEB-INF/views/include/footer_script.jsp" %>
		<%-- ******* CUSTOM Script HERE ******* --%>
		
		<%-- ******* CUSTOM Script END ******* --%>
	</div>
</body>
</html>