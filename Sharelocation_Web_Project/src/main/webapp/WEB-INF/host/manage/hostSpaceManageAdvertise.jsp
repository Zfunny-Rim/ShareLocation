<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<h4 class="card-title">광고관리</h4>

<div class="row justify-content-center">
	<div class="col-12">
		<div class="card" style="background-color: #f0f0f0; border: 1px solid gray;">
			<div class="card-body">
				<div class="card-title" style="text-align: center;">
					<c:if test="${not empty advertiseBean}">
						<c:set var="btnText" value="추가 연장하기"/>
						<b>현재 POWER LINK를 사용중입니다.</b>
					</c:if>
					<c:if test="${empty advertiseBean }">
						<c:set var="btnText" value="신청하기"/>
						<b>현재 POWER LINK 사용 중이 아닙니다.</b>
					</c:if>
				</div>
				<div class="card-text" style="text-align: center;">
					<c:if test="${not empty advertiseBean}">
						만료일 : 
						<fmt:parseDate var="exDate" value="${advertiseBean.expiredate }" pattern="yyyy-MM-dd HH:mm"/> 
						<fmt:formatDate value="${exDate }" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
					</c:if>
					<c:if test="${empty advertiseBean }">
						POWER LINK 서비스를 신청해보세요!
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="pricing">
	<div class="row align-items-center">
		<div class="col-md-4 px-0">
			<div class="card bg-light">
				<div class="card-header text-center bg-light">
					<h4 class="card-title">1개월 PLAN</h4>
					<p class="text-center">기본적인 PLAN</p>
				</div>
				<h1 class="price">10,000원</h1>
				<ul>
					<li><i class="bi bi-check-circle"></i>당신의 공간을 최상단에 노출해보세요.</li>
					<li><i class="bi bi-check-circle"></i>서비스 등록 후 1개월 동안 검색 최상단에 노출됩니다.</li>
				</ul>
				<div class="card-footer bg-light">
					<button class="btn btn-primary btn-block" onClick="orderAd('${spaceNum}',1)">${btnText }</button>
				</div>
			</div>
		</div>
		<div class="col-md-4 px-0">
			<div class="card card-highlighted">
				<div class="card-header text-center">
					<h4 class="card-title">6개월 PLAN</h4>
					<p class="text-center">효율적인 PLAN</p>
					<p></p>
				</div>
				<h1 class="price text-white">51,000원</h1>
				<ul>
					<li><i class="bi bi-check-circle"></i>당신의 공간을 최상단에 노출해보세요.</li>
					<li><i class="bi bi-check-circle"></i>서비스 등록 후 6개월 동안 검색 최상단에 노출됩니다.</li>
					<li><i class="bi bi-check-circle"></i>1개월 플랜보다 15% 저렴합니다!</li>
					<li><i class="bi bi-check-circle"></i>많은 분들이 찾으시는 플랜입니다.</li>
				</ul>
				<div class="card-footer">
					<button class="btn btn-outline-white btn-block" onClick="orderAd('${spaceNum}',6)">${btnText }</button>
				</div>
			</div>
		</div>
		<div class="col-md-4 px-0">
			<div class="card bg-light">
				<div class="card-header text-center bg-light">
					<h4 class="card-title">3개월 PLAN</h4>
					<p class="text-center">표준적인 PLAN</p>
				</div>
				<h1 class="price">27,000원</h1>
				<ul>
					<li><i class="bi bi-check-circle"></i>당신의 공간을 최상단에 노출해보세요.</li>
					<li><i class="bi bi-check-circle"></i>서비스 등록 후 3개월 동안 검색 최상단에 노출됩니다.</li>
					<li><i class="bi bi-check-circle"></i>1개월 플랜보다 10% 저렴합니다.</li>
				</ul>
				<div class="card-footer bg-light">
					<button class="btn btn-primary btn-block" onClick="orderAd('${spaceNum}',3)">${btnText }</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function orderAd(spaceNum, plan){
		location.href='spaceManagerAdvertisePurchase.ho?spaceNum='+spaceNum+"&plan="+plan;
	}
</script>