<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
    
<center>
	<h1>
		회원 리스트 화면<br>
	</h1>
	<form action="list.mem" method="get">
	
		<select name="whatColumn">
			<option value="all">전체 검색</option>
			<option value="id">id</option>
			<option value="성별">성별</option>
		</select><input type="text" name="keyword" value="">
		<input type="submit" value="검색">
	</form>
</center>
<center>
	<table border="1" width ="90%" >
		
		<tr>
			
			<th >num</th>
			<th >id</th>
			<th >password</th>
			<th >nickname</th>
			<th >email</th>
			<th >address</th>
			<th >hp</th>
			<th width="10%">birth</th>
			<th width="8%">gender</th>
			<th width="8%">type</th>
			<th >joindate</th>
			<th >수정</th>
			<th >삭제</th>
		</tr>
			<c:if test="${empty lists}">
		<tr align="center">
			<td colspan="11">데이터가 존재하지 않습니다.</td>
		</tr>
			<center>${pageInfo.pagingHtml}</center> 
	</c:if>
		
		<c:forEach var="member" items="${lists}">
			<Tr>
				<td align="center">${member.num}</td>
				<td>${member.id}</td>
				<td>${member.password}</td>
				<td>${member.nickname}</td>
				<td>${member.email}</td>
				<td>${member.adress}</td>
				<td>${member.hp}</td>
				<td>${member.birth}</td>
				<td>${member.gender}</td>
				<td>${member.type}</td>
				<td>${member.joindate}</td>
				<td>수정</td>
				<td>삭제</td>
		</c:forEach>
	</table>
</center>
<br>
<br>
<center>${pageInfo.pagingHtml}</center> 
<center><a href="javascript:history.go(-1)">돌아가기</a></center> 