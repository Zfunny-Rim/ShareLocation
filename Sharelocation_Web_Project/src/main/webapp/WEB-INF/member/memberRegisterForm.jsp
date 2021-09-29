<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<form action="" method="">
	<table border="1">
		<tr>
			<td align="left">
				아이디:<input type="text" name="id">
			</td>
		</tr>
		<tr>
			<td align="left">
				비밀번호:<input type="text" name="password">
			</td>
		</tr>
		<tr>
			<td align="left">
				닉네임:<input type="text" name="nickname">
			</td>
		</tr>
		<tr>
			<td align="left">
				이메일:<input type="text" name="email">
			</td>
		</tr>
		<tr>
			<td align="left">
				주소:<input type="text" name="address">
			</td>
		</tr>
		<tr>
			<td align="left">
				H.P:<input type="text" name="hp">
			</td>
		</tr>
		<tr>
			<td align="left">
				생일:<input type="text" name="birth">
			</td>
		</tr>
		<tr>
			<td align="left">
				성별:<input type="radio" name="gender" value="남">남
				    <input type="radio" name="gender" value="여">여
			</td>
		</tr>
		<tr>
			<td align="left">
				용도:<input type="checkbox" name="type" value="파티룸">파티룸
					<input type="checkbox" name="type" value="회의실">회의실
					<input type="checkbox" name="type" value="스터디룸">스터디룸
					<input type="checkbox" name="type" value="녹음식">녹음식
			</td>
		</tr>
		<tr>
			<td align="left">
				point:<input type="text" name="point" value="100">
			</td>
		</tr>
		<tr>
			<td align="left">
				가입일:<input type="text" name="joindate">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="가입">
				<input type="button" value="취소" onClick="">
			</td>
		</tr>
	</table>
</form>