<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<style type="text/css">
	td:first-child{
		text-align:center;
		font-weight: bold;
	}
.res-stat{
	font-size:15px;
}
</style>
<h4 class="card-title">예약 상세보기</h4>
<div class="row">
	<div class="col-8">
		<div class="table-responsive">
			<table class="table table-striped table-light table-lg">
				<thead>
					<tr class="table-primary">
						<th colspan="2" style="text-align:center; font-size:20px;">예약 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:25%;">신청일</td>
						<td>
							<fmt:parseDate var="appDate" value="${reservationBean.applicationdate}" pattern="yyyy-MM-dd HH:mm"/>
							<fmt:formatDate  value="${appDate}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
						</td>
					</tr>
					<tr>
						<td>예약공간</td>
						<td>${reservationBean.detailSpaceBean.name}</td>
					</tr>
					<tr>
						<td>예약 시간</td>
						<td>
							<fmt:parseDate var="ciDate" value="${reservationBean.checkin}" pattern="yyyy-MM-dd HH:mm"/>
							<fmt:formatDate  value="${ciDate}" pattern="yyyy년 MM월 dd일 HH시"/>
							~ 
							<fmt:parseDate var="coDate" value="${reservationBean.checkout }" pattern="yyyy-MM-dd HH:mm"/>
							<fmt:formatDate  value="${coDate}" pattern="yyyy년 MM월 dd일 HH시"/>
						</td>
					</tr>
					<tr>
						<td>예약 인원</td>
						<td>${reservationBean.person} 명</td>
					</tr>
					<tr>
						<td>요청사항</td>
						<c:if test = "${empty reservationBean.cusrequest}">
							<td>없음.</td>
   						</c:if>
   						<c:if test = "${not empty reservationBean.cusrequest}">
							<td>${reservationBean.cusrequest}</td>
   						</c:if>
					</tr>
				</tbody>
			</table>
			<table class="table table-striped table-light table-lg">
				<thead>
					<tr class="table-primary">
						<th colspan="2" style="text-align:center; font-size:20px;">예약자 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:25%;">예약자명</td>
						<td>${reservationBean.memberBean.nickname}</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>${reservationBean.memberBean.hp}</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${reservationBean.memberBean.email}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="col-4">
		<table class="table table-striped table-light table-lg">
			<thead>
				<tr class="table-primary">
					<th colspan="2" style="text-align:center; font-size:20px;">예약 상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width:35%;">
						예약 상태
					</td>
					<td>
						<c:if test="${reservationBean.status eq '예약대기' }">
							<span class="badge bg-warning res-stat">${reservationBean.status }</span>
						</c:if>
						<c:if test="${reservationBean.status eq '입금대기' }">
							<span class="badge bg-info res-stat">${reservationBean.status }</span>
						</c:if>
						<c:if test="${reservationBean.status eq '예약확정' }">
							<span class="badge bg-success res-stat">${reservationBean.status }</span>
						</c:if>
						<c:if test="${reservationBean.status eq '이용완료' }">
							<span class="badge bg-primary res-stat">${reservationBean.status }</span>
						</c:if>
						<c:if test="${reservationBean.status eq '예약취소' }">
							<span class="badge bg-danger">${reservationBean.status }</span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>예약 시간</td>
					<td>
						<fmt:parseDate var="ciDate" value="${reservationBean.checkin}" pattern="yyyy-MM-dd HH:mm"/>
						<fmt:formatDate  value="${ciDate}" pattern="MM월 dd일 HH시"/>
						~ 
						<fmt:parseDate var="coDate" value="${reservationBean.checkout }" pattern="yyyy-MM-dd HH:mm"/>
						<fmt:formatDate  value="${coDate}" pattern="dd일 HH시"/>
					</td>
				</tr>
				<tr>
					<td>예약 인원</td>
					<td>${reservationBean.person} 명</td>
				</tr>
				<tr>
					<td>예약 타입</td>
					<td>무통장입금</td>
				</tr>
				<tr>
					<td>예약 금액</td>
					<td><fmt:formatNumber value="${reservationBean.amounts }" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
						<button class="btn btn-outline-success" type="button"
						 onClick="goList('${spaceNum}', '${pageNumber }', '${whatColumn}', '${keyword }')">목록보기</button>
						<c:if test="${reservationBean.status eq '예약대기' }">
							<button class="btn btn-outline-primary" type="button"
								onClick="checkReservation('${spaceNum}','${pageNumber }','${whatColumn}','${keyword }','${reservationBean.num }')">
								예약확인</button>
							<button class="btn btn-outline-danger" type="button" 
								onClick="cancelReservation('${spaceNum}','${pageNumber }','${whatColumn}','${keyword }','${reservationBean.num }')">
								예약취소</button>
						</c:if>
						<c:if test="${reservationBean.status eq '입금대기' }">
							<button class="btn btn-outline-primary" type="button"
								onClick="confirmReservation('${spaceNum}','${pageNumber }','${whatColumn}','${keyword }','${reservationBean.num }')">
								예약확정</button> 
							<button class="btn btn-outline-danger" type="button" 
								onClick="cancelReservation('${spaceNum}','${pageNumber }','${whatColumn}','${keyword }','${reservationBean.num }')">
								예약취소</button>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">
	function goList(spaceNum, pageNum, whatColumn, keyword){
		if(keyword == ""){
			location.href="spaceManageReservation.ho?spaceNum="+spaceNum+"&pageNumber="+pageNum;
		}else{
			location.href="spaceManageReservation.ho?spaceNum="+spaceNum+"&pageNumber="+pageNum+
			"&whatColumn="+whatColumn+"&keyword="+keyword;
		}
	}
	function cancelReservation(spaceNum, pageNum, whatColumn, keyword, num){
		result = confirm("예약을 취소하시겠습니까?");
		if(result){
			if(keyword == ""){
				location.href="spaceManageReservationStatusUpdate.ho?spaceNum="+spaceNum+"&pageNumber="+pageNum+"&num="+num+"&status=예약취소";
			}else{
				location.href="spaceManageReservationStatusUpdate.ho?spaceNum="+spaceNum+"&pageNumber="+pageNum+"&num="+num+
				"&whatColumn="+whatColumn+"&keyword="+keyword+"&status=예약취소";
			}
		}
	}
	function checkReservation(spaceNum, pageNum, whatColumn, keyword, num){
		result = confirm("예약을 확인하시겠습니까? 예약자에게 입금요청을 하게 됩니다.");
		if(result){
			if(keyword == ""){
				location.href="spaceManageReservationStatusUpdate.ho?spaceNum="+spaceNum+"&pageNumber="+pageNum+"&num="+num+"&status=입금대기";
			}else{
				location.href="spaceManageReservationStatusUpdate.ho?spaceNum="+spaceNum+"&pageNumber="+pageNum+"&num="+num+
				"&whatColumn="+whatColumn+"&keyword="+keyword+"&status=입금대기";
			}
		}
	}
	function confirmReservation(spaceNum, pageNum, whatColumn, keyword, num){
		result = confirm("예약을 확정하시겠습니까? 예약자에게 입금을 확인한 이후에 확정하십시오.");
		if(result){
			if(keyword == ""){
				location.href="spaceManageReservationStatusUpdate.ho?spaceNum="+spaceNum+"&pageNumber="+pageNum+"&num="+num+"&status=예약확정";
			}else{
				location.href="spaceManageReservationStatusUpdate.ho?spaceNum="+spaceNum+"&pageNumber="+pageNum+"&num="+num+
				"&whatColumn="+whatColumn+"&keyword="+keyword+"&status=예약확정";
			}
		}
	}
</script>