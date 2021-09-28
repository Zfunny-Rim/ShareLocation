<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
UserMain.jsp
<br>


<center>
	<table border="1" action="/insert.user">

		<tr>
			<td>아이디: <input type="text" name="id">
			</td>
		</tr>

		<tr>
			<td>비밀번호: <input name="password" type="text">
			</td>
		</tr>
		<tr>
			<td>닉네임: <input name="nickname" type="text">
			</td>
		</tr>
		<tr>
			<td>이메일: <input name="email" type="text">
			</td>
		</tr>
		<tr>
			<td>주소: <input name="address" type="text">
			</td>
		</tr>
		<tr>
			<td>휴대전화: <input name="hp" type="text">
			</td>
		</tr>
		<tr>
			<td>생일: <input name="birth" type="date">
			</td>
		</tr>
		<tr>
			<td>휴대전화: <input name="genter" type="text">
			</td>
		</tr>
		<tr>
			<td>성별: <input name="gender" type="radio" value="남">남 <input
				name="gender" type="radio" value="여">여
			</td>
		</tr>
		<tr>
			<td>성별: <input name="type" type="text">
			</td>
		</tr>
		<tr>
			<td>성별: <input name="joindate" type="date">
			</td>
		</tr>
		<tr>
		<td>
		<input type="submit" value="전송">
		</td>
		</tr>
		
	</table>
</center>