<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<style type="text/css">
.link-class:hover{
	text-decoration: underline;
	cursor: pointer;
}
.clickable:hover{
	cursor: pointer;
}
</style>
<h3>${spaceBean.name }</h3>
<div class="card-text mb-2">
${spaceBean.contentssim }
</div>
<p class="card-text">
	<c:set var="tagList" value="${fn:split(spaceBean.tag, ',')}" />
	<c:forEach var="tagToken" items="${tagList }">
		<span class="badge bg-light-info"
			style="font-weight: normal; font-size: 14px;">#${tagToken }</span>
	</c:forEach>
</p>
<div class="row">
		<div class="col-7">
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
	            <div class="carousel-inner">
	                <div class="carousel-item active">
	                    <img src="<%=request.getContextPath() %>/resources/spaceimage/${spaceBean.mainimage}" class="d-block w-100" style="height:588px;">
	                </div>
	                <c:forEach var="spaceImageBean" items="${spImgList }">
	                 <div class="carousel-item">
	                     <img src="<%=request.getContextPath() %>/resources/spaceimage/${spaceImageBean.image}" class="d-block w-100" style="height:588px;">
	                 </div>
	                </c:forEach>
	            </div>
	            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-bs-slide="prev">
	                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                <span class="visually-hidden">Previous</span>
	            </a>
	            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-bs-slide="next">
	                <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                <span class="visually-hidden">Next</span>
	            </a>
	        </div>
		</div>
		<div class="col-5 py-2 border rounded-3 border-secondary">
			<div class="row mb-3">
				<div class="divider my-2"><div class="divider-text">?????? ??????</div></div>
				<div class="col-6">
					<h5>?????? ??????</h5>
					<p class="card-text">
						${spaceBean.status }
						<c:if test="${spaceBean.status eq '????????????' }">
							<small><span class="badge bg-success clickable" onclick="approval(${spaceBean.num})">????????????</span></small>
						</c:if>
						<c:if test="${spaceBean.status eq '????????????' }">
							<span class="badge bg-success clickable" onclick="approval(${spaceBean.num})">????????????</span>
						</c:if>
					</p>
					<h5>?????? ??????</h5>
					<p class="card-text">
					<c:set var="isAllTime" value="${false }"/>
					<c:if test="${(spaceBean.operatingtime eq 0) and (spaceBean.operatingendtime eq 24) }">
						<c:set var="isAllTime" value="${true }"/>
						24?????? ??????
					</c:if>
					<c:if test="${not isAllTime }">
						${spaceBean.operatingtime }??? ~ ${spaceBean.operatingendtime }???
					</c:if>
					</p>
					<h5>?????????</h5>
					<p class="card-text">
						<c:if test="${empty spaceBean.holiday}">
							????????? ??????
						</c:if>
						<c:if test="${not empty spaceBean.holiday }">
						 	?????? ${spaceBean.holiday }
						</c:if>
					</p>
				</div>
				<div class="col-6">
					<h5>??????</h5>
					<p class="card-text">${spaceBean.type }</p>
					<h5>?????????</h5>
					<p class="card-text">${spaceBean.hp }</p>
					<h5>?????????</h5>
					<p class="card-text">
					<fmt:parseDate var="parseRegDate" value="${spaceBean.regdate }" pattern="yyyy-MM-dd"/>
					<fmt:formatDate value="${parseRegDate }" pattern="yyyy/MM/dd"/>
					</p>
				</div>
			</div>
			<div class="divider my-2"><div class="divider-text">????????? ??????</div></div>
			<c:if test="${empty balanceBean }">
				<div class="w-100" style="text-align:center;">
					<p class="mb-2">?????? ????????? ????????????.</p>
					<button class="btn btn-outline-success" 
					onClick="location.href='spaceManageBalanceView.ho?spaceNum=${spaceNum}'">???????????? ????????????</button>
				</div>
			</c:if>
			<c:if test="${not empty balanceBean }">
			<div class="col-6">
				<h5>?????????</h5>
				<p class="card-text">${balanceBean.company }</p>
				<h5>?????????</h5>
				<p class="card-text">${balanceBean.email }</p>
			</div>
			<div class="col-6">
				<h5>????????????</h5>
				<p class="card-text">${balanceBean.name }</p>
				<h5>?????????</h5>
				<p class="card-text">${balanceBean.call }</p>
			</div>
			<h5 style="margin-top:16px;">????????? ??????</h5>
			<p class="card-text">${balanceBean.address }</p>
			</c:if>
		</div>
		<div class="col-7 my-2 py-2">
			<h4>?????? ??????</h4>
			<p class="card-text">${spaceBean.contentscom }</p>
			<h4>?????? ??????</h4>
			<c:forEach var="facBean" items="${spFacList }">
				<p class="card-text">${facBean.facility }</p>
			</c:forEach>
			<h4>?????? ??? ????????????</h4>
			<p class="card-text">${spaceBean.warning }</p>
			<h4>??????</h4>
			<p class="card-text">
				<c:set var="addrArr" value="${fn:split(spaceBean.address, ',') }"/>
				<c:set var="addr" value="${addrArr[0] }"/>
				<c:set var="addrDetail" value="${addrArr[1] }"/>
				${addr } ${addrDetail }
			</p>
			<div id="map" class="p-2" style="width:100%; height: 400px;"></div>
		</div>
		<div class="col-5 my-2 py-2 border rounded-3 border-secondary">
		<h5>???????????? ????????? (${dspList.size()}???)</h5>
		<c:if test="${empty dspList }">
			<p class="card-text text-center"><small class="text-muted">????????? ??????????????? ????????????.</small> </p> 
		</c:if>
		<c:if test="${not empty dspList }">
			<div class="accordion" id="accordionDSP">
			<c:forEach var="dspBean" items="${dspList }" varStatus="vs">
				<div class="accordion-item">
					<div class="list-title list-group-item list-group-item-success" data-bs-toggle="collapse" data-bs-target="#collapse${vs.count }">${dspBean.name }</div>
					<div id="collapse${vs.count }" class="accordion-collapse collapse" data-bs-parent="accordionDSP"
					 style="text-decoration: none; background-color:#fff; border: 1px solid rgba(0,0,0,0.125);">
						<div class="accordion-body p-3">
							<div class="dsp-title p-1">
								<img src="<%=request.getContextPath() %>/resources/spaceimage/${dspBean.mainimage}" class="d-block h-100 mx-auto" style="width:300px;">
							</div>
							<div class="dsp-body p-1">
								<div class="list-group">
									<div class="list-group-item" style="border:none; border-bottom: 1px solid #eee;">
										<b>????????????</b>&nbsp;&nbsp;&nbsp;&nbsp;?????? ${dspBean.mintime } ????????????
									</div>
									<div class="list-group-item" style="border:none; border-bottom: 1px solid #eee;">
										<b>????????????</b>&nbsp;&nbsp;&nbsp;&nbsp;?????? ${dspBean.minperson } ??? ~ ?????? ${dspBean.maxperson } ???
									</div>
									<div class="list-group-item" style="border:none; border-bottom: 1px solid #eee;">
										<b>??????</b>&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${dspBean.price }" pattern="#,###"/>??? / ${dspBean.priceunit }
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</c:if>
		</div>
	</div>
	
<script type="text/javascript">
	function approval(num){
		result = confirm("?????? ????????? ????????? ?????? ???????????????. ?????????????????????????");
		if(result){
			location.href="spaceManageApproval.ho?spaceNum="+num;
		}
	}
</script>