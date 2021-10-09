<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
td:first-child{
	width:25%;
	font-weight: bold;
}
td:nth-child(2){
	text-align:center;
}
</style>
<h4 class="card-title">정산정보 보기</h4>
<div class="row justify-content-center">
	<div class="col-6">
		<div class="table-responsive">
			<table class="table table-striped table-light table-lg">
				<thead>
					<tr class="table-primary">
						<th colspan="2" style="text-align:center; font-size:20px;">호스트 정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>상호명</td>
						<td>${balanceBean.company}</td>
		
					</tr>
					<tr>
						<td>대표자명</td>
						<td>${balanceBean.name}</td>
		
					</tr>
					<tr>
						<td>상호 주소</td>
						<td>${balanceBean.address}</td>
		
					</tr>
					<tr>
						<td>이메일</td>
						<td>${balanceBean.email}</td>
		
					</tr>
					<tr>
						<td>전화번호</td>
						<td>${balanceBean.call}</td>
		
					</tr>
					<tr>
						<td>은행</td>
						<td>${balanceBean.bank}</td>
		
					</tr>
					<tr>
						<td>계좌번호</td>
						<td>${balanceBean.account}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-12 d-flex justify-content-center">
			<button class="btn btn-primary" onClick="goModify(${spaceNum})">수정</button>
		</div>
	</div>
</div>
<script type="text/javascript">
function goModify(spaceNum){
	location.href="spaceManageBalanceModify.ho?spaceNum="+spaceNum;
}
</script>