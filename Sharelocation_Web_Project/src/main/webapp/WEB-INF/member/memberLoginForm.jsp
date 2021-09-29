<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<form action="login.member" method="post">
	<table>
		<tr align="left">
			<td>
				ID:<input type="text" name="id"><br>
				PW:<input type="text" name="password">
			</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="로근인">
				<input type="reset" value="취소"><br>
				<a href="register.member">회원가입</a>
				<a href="">ID</a>|
				<a href="">Password</a> 찾기
			</td>
		</tr>
	</table>
</form>