<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Enter Id :<input type="text" id="eid"><br><br>
Enter Name :<input type="text" id="ename"><br><br>
Enter Salary :<input type="text" id="sal"><br><br>
<input type="submit" value="Add Emp" onclick="save()">
<br><br>
<input type="button" value="display emp" onclick="display()">

<div id="tb"></div>
<!--js  -->
<script type="text/javascript">

function save()
{	/* fetch value from page */
	let eid=document.getElementById("eid").value;
	let ename=document.getElementById("ename").value;
	let sal=document.getElementById("sal").value;
	
	/* Query String  backend la mg requestParam use krayla lagt */
	/* let data="eid="+eid+"&ename="+ename+"&sal="+sal;
	 */
		/* jr json madhe data send kraycha asel tr */
	 	let emp={
			 eid:eid,
			ename:ename,	 		
	 		sal:sal,
	 }	
	/* 	
	jr  normal query string  ni data send kraycha asel tr
 	fetch("save",
 			{method:"POST" 
 			,headers: {
 	            "Content-Type": "application/x-www-form-urlencoded"
 	        },
 	        body:data})
 	.then((res)=>res.text())
 	.then((r)=>{
 		alert(r);
 	}); */
		/* json ni data send kraycha asel tr */
	 	fetch("save",
	 			{method:"POST" 
	 			,headers: {
	 	            "Content-Type": "application/json"
	 	        },
	 	        body:JSON.stringify(emp)})
	 	.then((res)=>res.text())
	 	.then((r)=>{
	 		alert(r);
	 	});
	
}

function display() {
    fetch("display")
        .then((res) => res.json())
        .then((data) => {

            let tb = document.getElementById("tb");
            tb.innerHTML = "";   // old data clear

            // ----- Create table head -----
            let thead = document.createElement("thead");
            let tr = document.createElement("tr");

            let tid = document.createElement("th");
            tid.innerText = "Eid";

            let tn = document.createElement("th");
            tn.innerText = "Emp Name";

            let ts = document.createElement("th");
            ts.innerText = "Emp Salary";

            tr.appendChild(tid);
            tr.appendChild(tn);
            tr.appendChild(ts);
            thead.appendChild(tr);
            tb.appendChild(thead);

            // ----- Create table body -----
            let tbody = document.createElement("tbody");

            data.forEach((ele) => {
                let tr = document.createElement("tr");

                let td1 = document.createElement("td");
                td1.innerText = ele.eid;

                let td2 = document.createElement("td");
                td2.innerText = ele.ename;

                let td3 = document.createElement("td");
                td3.innerText = ele.sal;

                tr.appendChild(td1);
                tr.appendChild(td2);
                tr.appendChild(td3);

                tbody.appendChild(tr);
            });

            tb.appendChild(tbody);
        })
        .catch((err) => {
            console.log("Error:", err);
        });
}

</script>
</body>
</html>