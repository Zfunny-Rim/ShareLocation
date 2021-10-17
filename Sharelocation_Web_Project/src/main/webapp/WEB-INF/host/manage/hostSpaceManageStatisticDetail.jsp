<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp" %>
<style type="text/css">
table{
	text-align: center;
}
.accordion-toggle{
	background-color: #f2f7ff;
}
.accordion-toggle:hover{
	background-color: #f0f0f0;
	cursor: pointer;
}
</style>
<h4 class="card-title">월별 수입 및 지출 내역</h4>
<div class="row justify-content-center">
	<div class="col-6">
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
				<tr> 
					<td colspan="3" style="font-weight: bold; font-size:20px;">
					${idBean.year }년 ${idBean.month }월 수입 및 지출 현황
					</td>
				</tr>
				<tr>
					<th>구분</th>
					<th>항목</th>
					<th>금액</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td colspan="3" style="background-color: lightgray">수입 내역</td>
				</tr>
				<tr	data-bs-toggle="collapse" data-bs-target="#rentalList" class="accordion-toggle"
				style="font-weight: bold;">
					<td>대여</td>
					<td>총계</td>
					<td><fmt:formatNumber value="${idBean.totalRentalIncomePrice }" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td colspan="3">
						<div id="rentalList" class="accordion-collapse collapse">
							<table class="table table-bordered">
								<tbody>
									<c:forEach var="iBean" items="${idBean.rentalIncomeList }">
										<tr>
											<td>
												<fmt:parseDate var="iDate" value="${iBean.incomedate }" pattern="yyyy-MM-dd HH:mm"/>
												<fmt:formatDate  value="${iDate }" pattern="yyyy-MM-dd HH:mm"/>
											</td>
											<td>${iBean.note }</td>
											<td>
												<fmt:formatNumber value="${iBean.price }" pattern="#,###"/>원
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</td>
				</tr>
				
				<tr data-bs-toggle="collapse" data-bs-target="#etcIncomeList" class="accordion-toggle"
				style="font-weight: bold;">
					<td>기타</td>
					<td>총계</td>
					<td><fmt:formatNumber value="${idBean.totalEtcIncomePrice }" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td colspan="3">
						<div id="etcIncomeList" class="accordion-collapse collapse">
							<table class="table table-bordered">
								<c:forEach var="iBean" items="${idBean.etcIncomeList }">
								<tr>
									<td>
											<fmt:parseDate var="iDate" value="${iBean.incomedate }" pattern="yyyy-MM-dd HH:mm"/>
											<fmt:formatDate  value="${iDate }" pattern="yyyy-MM-dd HH:mm"/>
											</td>
											<td>${iBean.note }</td>
											<td>
												<fmt:formatNumber value="${iBean.price }" pattern="#,###"/>원
											</td>
								</tr>
								</c:forEach>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">수입 합계(A)</td>
					<td><fmt:formatNumber value="${idBean.totalIncomePrice }" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td colspan="3" style="background-color: lightgray">지출 내역</td>
				</tr>
				<tr style="font-weight: bold;">
					<td rowspan="5">고정 지출</td>
					<td>총계</td>
					<td><fmt:formatNumber value="${idBean.totalFixedExpensePrice }" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td>청소비</td>
					<td><fmt:formatNumber value="${idBean.cleanExpensePrice }" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td>시설유지비</td>
					<td><fmt:formatNumber value="${idBean.maintenanceExpensePrice }" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td>Tax</td>
					<td><fmt:formatNumber value="${idBean.taxExpensePrice }" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td>중개수수료</td>
					<td><fmt:formatNumber value="${idBean.feesExpensePrice }" pattern="#,###"/>원</td>
				</tr>
				<tr style="font-weight: bold;">
					<td>광고</td>
					<td>
						<c:if test="${empty idBean.advertiseBean }">
							<span class="text-muted">사용중이 아님</span>
						</c:if>
						<c:if test="${not empty idBean.advertiseBean }">
							${idBean.advertiseUseDay }일 사용
						</c:if>
					</td>
					<td>
						<c:if test="${empty idBean.advertiseBean }">
							0원
						</c:if>
						<c:if test="${not empty idBean.advertiseBean }">
							<fmt:formatNumber value="${idBean.advertiseExpensePrice }" pattern="#,###"/>원
						</c:if>
					</td>
				</tr>
				<tr data-bs-toggle="collapse" data-bs-target="#etcExpenseList" class="accordion-toggle"
				style="font-weight: bold;">
					<td>기타</td>
					<td>총계</td>
					<td><fmt:formatNumber value="${idBean.totalEtcExpensePrice }" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td colspan="3">
						<div id="etcExpenseList" class="accordion-collapse collapse">
							<table class="table table-bordered">
								<c:forEach var="iBean" items="${idBean.etcExpenseList }">
								<tr>
									<td>
										<fmt:parseDate var="iDate" value="${iBean.incomedate }" pattern="yyyy-MM-dd HH:mm"/>
										<fmt:formatDate  value="${iDate }" pattern="yyyy-MM-dd HH:mm"/>
										</td>
										<td>${iBean.note }</td>
										<td>
											<fmt:formatNumber value="${iBean.price }" pattern="#,###"/>원
										</td>
								</tr>
								</c:forEach>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="background-color: lightgray">총 합계</td>
				</tr>
				<tr>
					<td colspan="2">지출 합계(B)</td>
					<td><fmt:formatNumber value="${idBean.totalExpensePrice }" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td colspan="2">총 이율(A-B)</td>
					<td><fmt:formatNumber value="${idBean.totalProfit}" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td colspan="2">회차 별 이율</td>
					<td><fmt:formatNumber value="${idBean.profitPerRental }" pattern="#,###"/>원</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>