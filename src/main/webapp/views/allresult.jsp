<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<title>all result</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap431.css" /> " rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css
" rel="stylesheet">
<script src="<c:url value="/static/theme/jquery340.js" />" > </script> 
<script src="<c:url value="/static/theme/popper114.js" />" > </script>
<script src="<c:url value="/static/theme/angular1.8.2.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap431.js" />" > </script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script type="text/javascript">

var module=angular.module("arapp",[]);
module.controller("ar",function($scope,$http){
	
	$scope.sch=['2010-11','2011-12','2012-13','2013-14','2014-15','2015-16','2016-17','2017-18','2018-19','2019-20','2020-21',
		'2021-22','2022-23','2023-24','2024-25','2025-26','2026-27','2027-28','2028-29','2029-30','2030-31','2031-32','2032-33','2033-34'];
	
	$scope.khan1=['1st','2nd','3rd','4th','5th','6th','7th','8th'];

	$scope.khan2=['66 - Computer Technology','64 - Civil Technology','67 - Electrical Technology',"any"];

	$scope.p={"dept":"","semester":"","session":"","subcode":null,"subname":"","fullmark":null};
	
	$scope.allres=[];
	
	$scope.getall=function(){
     
		$http({ 
			method:"POST" , 
			url:"${pageContext.request.contextPath}/getallresult", 
		  	data:angular.toJson($scope.p),
		    headers:{"Content-Type":"application/json"}	
			
		        }).then(function(response){
		        	
		        	$scope.allres=response.data;
    	document.getElementById("sh").style.display="none";
	 
		        	})	
		
	
	}
	
	
	
	
	
});




	
</script>



<style>
table th,td{
padding:8px;
}
</style>



</head>
<body ng-controller="ar" ng-app="arapp" >

<%
if(session.getAttribute("user")==null && session.getAttribute("password")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
	}
	  %>
	   
	   

	<div class="container" style="background-color:ghostwhite;margin:50px;margin-left:30px;border:2px solid black;" align="center">
	
	<div id="sh">
	<table border="1" align="center" >
		<tr>
	<th>session</th>
	<th>department</th>
	<th>semseter</th>
	</tr>

	
	<tr>
	<td><select ng-model="p.session"   ng-options="c for c in sch"></select></td>
	<td><select ng-model="p.dept"      ng-options="c for c in khan2"></select></td>
	<td><select ng-model="p.semester"  ng-options="c for c in khan1"></select></td>
	</tr>
	
	</table>
		<br/>

	<button ng-click="getall();" class="btn btn-sm btn-success" style="margin-left:35%;">submit</button>
	</div>
	<br/>
	<br/>
	<h4>Badiul Alam Science And Technology Institute</h4>
	<h4>Kasba , Brahmanbaria</h4>
	<h4>Result of {{p.semester}} Semester , Session-{{p.session}}</h4>
	<h4>Technology : {{p.dept}}</h4>


	<div class="html-content" style="padding:50px;text-align:center;">
	

	<table border="1" align="center" ng-if="allres.length!=0" style="font-size:1.3em;font-weight:500;">
	
	<tr>
	<th>SL NO</th>
	<th>STUDENT NAME</th>
	<th>ROLL NO</th>
	<th>REG NO</th>
	<th>GPA</th>
	</tr>
	
	<tr ng-repeat="x in allres">
	<td>{{$index+1}}
	<td>{{x.name}}</td>
	<td>{{x.roll}}</td>
	<td>{{x.regno}}</td>
	<td>{{x.gpa}}</td>
	</tr>
	
	</table>


	</div>	
	
	
<div class="row">
<div class="col">
<b>.....................</b>
<br/>
Prepared By
</div>
<div class="col">
<b>....................</b><br/>
Head of the dept
</div>
<div class="col">
<b>...............</b><br/>
Principal
</div>
</div>	
	
<br/>
<br/>	
	
	
	
	
	
	</div>  

</body>
</html>
