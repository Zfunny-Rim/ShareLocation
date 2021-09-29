<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function lookList(){
	//alert(1);
	location.href="list.mem";
}

</script>


index start
    <%
    String insertMember = request.getContextPath()+"/register.mem";
    String list = request.getContextPath()+"/list.mem";
    %>

<form action="login.mem" method="post">
<Table border="1">
<tr>
<td>아이디</td>
<td><input type="text" name= "id"></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="text" name= "password"></td>
</tr>
<tr >
<td colspan ="2" align="center">
<input type="submit" value= "로그인">
<input type="reset" value= "취소">
</td>
</tr>
<tr >
<td colspan ="2" align="center">
 <a href="<%=insertMember%>">가입하기</a>
  <input type="button" value="가입자 리스트" onclick="lookList()">
</td>
</tr>



</Table>
</form>




    
    
   
     