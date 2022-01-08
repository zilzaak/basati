<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>get result</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap431.css" /> " rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="<c:url value="/static/theme/jquery340.js" />" > </script> 
<script src="<c:url value="/static/theme/angular1.8.2.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap431.js" />" > </script>

<script>
var module=angular.module("sellapp",[]);
module.controller("sellcontrol",function($scope,$http){
	
$scope.sch=["2010-11","2011-12","2012-13",'2013-14','2014-15','2015-16','2016-17','2017-18','2018-19','2019-20','2020-21',
	'2021-22','2022-23','2023-24','2024-25','2025-26'];
	
$scope.khan1=['1st','2nd','3rd','4th','5th','6th','7th','8th'];

$scope.khan2=['66 - Computer Technology','64 - Civil Technology','67 - Electrical Technology',"any"];

$scope.p={"dept":"","semester":"","session":"","subcode":null,"subname":"","fullmark":null};
$scope.p2={"dept":"","semester":"","session":"","subcode":""};
$scope.p3={"dept":"","semester":"","rollno":""};

$scope.dps=[];
$scope.gotresult=null;

$scope.findresult=function(){
	
	$http({ 
		method:"POST" , 
		url:"${pageContext.request.contextPath}/findresult", 
		data:angular.toJson($scope.p3),
	    headers:{"Content-Type":"application/json"}	
		
	        }).then(function(response){
	      
	     $scope.gotresult=response.data.rst;
	     $scope.dps=response.data.dps;
  
	        	})		
		
	}
	
	
	
	

	        	
	        	
})
</script>




<style>
body{
box-sizing:border-box;
background-image:url("/static/theme/sea.jpg");
background-size:1400px 500px;
}
.contain1{
display:grid;
grid-template-columns: 30% 30% 10%;
column-gap:20px;
padding-bottom:30px;
}
span:hover{
color:red;
background-color:skyblue;
}
table td:hover{
background-color:silver; color:green;
}
input:hover{
background-color:maroon; color:white;
}
table{
overflow-x:scroll;
}
table th{
wrap-word:break-word;
background-color:black;
color:white;
padding:8px;
}
table td{
wrap-word:break-word;
background-color:white;
color:black;
text-align:center;
}
a:hover{
background-color:steelblue;
}
.dropdown-menu a:hover{
background-color:steelblue;
}
</style>

</head>
<body  ng-controller="sellcontrol"  ng-app="sellapp">



<div  style="margin-left:8%;background-color:ghostwhite;width:85%;font-size:0.80em;" id="3">
<h2 style="text-align:center;color:green;background-color:white;padding:5px;">get result</h2>

<table border="1" align="center" >
<tr>
<th>Department</th>
<th>Semester</th>
<th>rollno</th>
</tr>
<tr>
<td><select  ng-model="p3.dept" ng-options="c for c in khan2"></select></td>
<td><select  ng-model="p3.semester" ng-options="d for d in khan1"></select></td>
<td><input type="text"  ng-model="p3.rollno" /></td>
</tr>
</table> 
<br/>
<button style="margin-left:50%;" class="btn btn-success btn-sm" ng-click="findresult()">submit</button>
<br/>
<br/>


<div style="background-color:black;color:white;padding:10px;" align="center" ng-if="gotresult!=null">
<h4 style="color:green;">note::{{gotresult.sms}}</h4>
<ul style="list-style-type:none;">
<li>Technology::{{p3.dept}}</li>
<li>roll no::{{p3.rollno}}</li>
<li>Session::{{gotresult.session}}</li>
<li>reg no::{{gotresult.regno}}</li>
<li>Result::{{gotresult.gpa}} (out of 4)</li>
<li></li>
</ul>
</div>

<div style="background-color:skyblue;color:darkslategrey;padding:10px;" align="center">
<table border="1" align="center" >
<tr ng-if="dps.length!=0">
<th>subject</th>
<th>full mark</th>
<th>marks obtained</th>
<th>letter grade</th>
<th> grade point</th>
</tr>

<tr ng-repeat="x in dps">
<td>{{x.subcode}}</td>
<td>{{x.fullmark}}</td>
<td>{{x.total}}</td>
<td>{{x.grade}}</td>
<td>{{x.gradepoint}}</td>
</tr>

</table> 

<div ng-if="dps.length==0" style="background-color:skyblue;" >
<b>no record exist related to roll: {{p3.rollno}}, department::{{p3.dept}}, semester::{{p3.semester}}</b><br/>
<b>insert the mark of the student whos roll is {{p3.rollno}} </b><br/>
</div>

<br/>
<br/>


</div>



</div>
</body>
</html>
