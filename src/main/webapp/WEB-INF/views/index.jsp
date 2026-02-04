<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Enter Name :<input type="text" id="name"><br><br>
Enter Salary :<input type="text" id="salary"><br><br>
<input type="submit" value="Add Emp" onclick="save()">


<!--js  -->
<script type="text/javascript">

function save()
{
	let name=document.getElementById("name").value;
	let salary=document.getElementById("salary").value;
 	fetch("save?name="+name+"$salary="+salary)
 	.then()
 	.then();
}
</script>
</body>
</html>