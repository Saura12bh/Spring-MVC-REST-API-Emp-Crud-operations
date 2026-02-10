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

<br><br>
Enter Id :<input type="text" id="id"><br><br>
<input type="button" value="Search emp" onclick="search()">
<br><br>
<div id="tb1"></div>

<!-- update emp data -->
Enter  Id :<input type="text" id="neid"><br><br>
Enter new Name :<input type="text" id="nename"><br><br>
Enter new  Salary :<input type="text" id="nsal"><br><br>
<button onclick="update()">Update</button>

<br><br>

<!-- Delete emp using id  -->
<!--js  -->
Enter Id to delete emp:<input type="text" id="did"><br><br>
<input type="button" value="delete emp" onclick="del()">
<br><br>
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
       .then(res=>{
   if(!res.ok){
      return res.json().then(err=>{ throw err; });
   }
   return res.json();
})
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
          alert(err.message)
        });
}
function search() {
	let eid=document.getElementById("id").value;
    fetch("search?eid="+eid)
        .then((res) => res.json())
        .then((data) => {

            let tb1 = document.getElementById("tb1");
            tb1.innerHTML = "";   // old data clear

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
            tb1.appendChild(thead);

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

            tb1.appendChild(tbody);
        })
        .catch((err) => {
            console.log("Error:", err);
        });
}
//update emp using id
function update()
{
	let emp={
	 eid:document.getElementById("neid").value,
	 ename:document.getElementById("nename").value,
	 sal:document.getElementById("nsal").value,
	};
	
	fetch("update",
			{
		   method: "PUT",
		   headers: {
		     "Content-Type": "application/json"
		   },
		   body: JSON.stringify(emp)
			}
	).
	then((res)=>res.text()).
	then((data)=>{
		alert(data);
	}).
	catch((err)=>{
		alert(err.message);
	});
}
function del()
{
	let eid=document.getElementById("did").value;
	fetch("delete?eid="+eid,
			{
			method:"DELETE"
			}).
	then((res)=>{
		if(!res.ok)
			{
			return res.json().then((err)=>{
				throw err;
			});
			}
		return res.text();
	}).
	then((data)=>{
		alert(data);
	}).
	catch((err)=>{
		alert(err.message);
	});
}
</script>
</body>
</html>