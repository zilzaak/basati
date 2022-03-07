<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<title>subjective marksheet</title>
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
	$scope.subval={"tc":null,"tf":null,"pc":null,"pf":null};
	
	$scope.sch=['2010-11','2011-12','2012-13','2013-14','2014-15','2015-16','2016-17','2017-18','2018-19','2019-20','2020-21',
		'2021-22','2022-23','2023-24','2024-25','2025-26','2026-27','2027-28','2028-29','2029-30','2030-31','2031-32','2032-33','2033-34'];
	
	$scope.khan1=['1st','2nd','3rd','4th','5th','6th','7th','8th'];

	$scope.khan2=['66 - Computer Technology','64 - Civil Technology','67 - Electrical Technology',"any"];

	$scope.p={"dept":"","semester":"","session":"","subcode":null,"subname":"","fullmark":null};
	
	$scope.allres=[];$scope.allr=[];
	$scope.tor=null;
	$scope.totalr=null;
	$scope.fromr=null;
	
	$scope.getall=function(){
     
		$http({ 
			method:"POST" , 
			url:"${pageContext.request.contextPath}/subtcpc", 
		  	data:angular.toJson($scope.p),
		    headers:{"Content-Type":"application/json"}	
			
		        }).then(function(response){
		        	
		        	$scope.allr=response.data;
		        	$scope.allres=response.data;
		        	$scope.tor=response.data.length;;
		        	$scope.totalr=response.data.length;
		        	$scope.fromr=1;
		        	
		        	})	
		
}
	
	
	
$scope.filtrecord=function(){
	     $scope.allres=[];
	angular.forEach($scope.allr,function(v,k){
		var ck=k+1;
		if($scope.fromr<=ck && ck<=$scope.tor){
			$scope.allres.push(v);
		}
		
	})
	
	$scope.totalr=$scope.allres.length;
	
		
}
	
	
$scope.hidesh=function(){
	
	document.getElementById("sh").style.display="none";
		
}	
	
	
$scope.checkdept=function(t){
	
	
	if(t.includes('mputer')){
		
		return 'com'
	}
	if(t.includes('ivil')){
		
		return 'civ'
	}

	if(t.includes('lectrical')){
		
		return 'et'
	}
	
	
}	
	
	
	
	
	
	
	
	
});




	
</script>



<style>
table th,td{
wrap-word:break-word;
}
</style>



</head>
<body ng-controller="ar" ng-app="arapp" >

<%
if(session.getAttribute("user")==null && session.getAttribute("password")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
	}
	  %>
	  
	 
	   

	<div class="container" style="background-color:ghostwhite;margin:50px;margin-left:30px;border:2px solid black;margin-top:20px;" align="center">
	<br/>
	<h1>Badiul Alam Science And Technology Institute</h1>
	<h4>Kasba , Brahmanbaria</h4>
	<h4>Institute Code : 64041</h4>
	<br/>
	
	<div style="border-radius:8px;border:2px solid black;width:42%;" align="center"><h2>TC,TF,PC,PF Marks Sheet</h2></div>
	<br/>
	<div class="row" style="padding:8px;margin-left:20px;margin-right:20px;">
	<div class="col" style="text-align:left;">
	<h4>Subject Name : {{allres[0].subname}}</h4>
	</div>
	
	<div class="col" style="text-align:right;">
	<h4>Subject Code :{{allres[0].subcode}} </h4>
	</div>
	</div>
	
		<div class="row" style="padding:8px;margin-left:20px;margin-right:20px;">
		
	<div class="col" style="text-align:left;">
	<h4>Technology:<b ng-if="checkdept(p.dept)=='com'">Computer</b><b ng-if="checkdept(p.dept)=='civ'">Civil</b><b ng-if="checkdept(p.dept)=='et'">Electrical</b></h4>
	</div>
	
	<div class="col">
	<h4>Semester : {{p.semester}}</h4>
	</div>
	
		<div class="col" style="text-align:right;">
	<h4>Session : {{p.session}}</h4>
	</div>
	
	</div>
	
	<div class="html-content" style="padding:50px;text-align:center;height:960px;">
	
<table border="1" align="center" ng-if="allres.length!=0" style="font-size:1em;font-weight:500;">
	
	<tr>
	<th style="width:15px;">SL NO</th>
	<th style="width:290px;">Name of the students</th>
	<th style="height:80px;">

<div class="col" style="border:1px solid black;margin-left:0.50px;margin-right:0.50px;height:100%;">
Board
<div class="row" style="height:50%;margin-top:17px;">
<div class="col" style="border:1px solid black;">Roll No</div>
<div class="col" style="border:1px solid black;">Reg.No</div>
</div>
</div>	
	</th>

<th style="width:450px;">
<div class="row" style="border:1px solid black;margin-left:0.50px;margin-right:0.50px;text-align:center;padding-left:110px;">
Marks
</div>


<div class="row" style="border:1px solid black;margin-left:0.50px;margin-right:0.50px;">
<div class="col-sm-5" style="border:1px solid black;">
Theory
<div class="row" style="border:1px solid black;">
<div style="border:1px solid black;width:50%;" >TC-{{subval.tc}}</div><div style="border:1px solid black;width:50%;">TF-{{subval.tf}}</div>
</div>

</div>

<div class="col-sm-5" style="border:1px solid black;">
Practical
<div class="row" style="border:1px solid black;">
<div style="border:1px solid black;width:50%;" >PC-{{subval.pc}}</div><div style="border:1px solid black;width:50%;">PF-{{subval.pf}}</div>
</div>

</div>
<div class="col-sm-2" style="border:1px solid black;">Total</div>
</div>


</th>
</tr>
	
<tr ng-repeat="x in allres">
	<td>{{$index+fromr}}</td>
	<td>{{x.name}}</td>
	
	<td style="width:345px;height:40px;">
	
<div class="row" style="height:100%;order:1px solid black;margin-left:0.50px;margin-right:0.50px;">
<div class="col" style="border:1px solid black;">{{x.rollno}}</div>
<div class="col" style="border:1px solid black;">{{x.regno}}</div>
</div>
	
</td>


	<td>
	
<div class="row" style="border:1px solid black;margin-left:0.50px;margin-right:0.50px;">
<div class="col-sm-5" style="border:1px solid black;">
<div class="row" style="border:1px solid black;">
<div style="border:1px solid black;width:50%;" >{{x.tc}}</div><div style="border:1px solid black;width:50%;">{{x.tf}}</div>
</div>

</div>

<div class="col-sm-5" style="border:1px solid black;">
<div class="row" style="border:1px solid black;">
<div style="border:1px solid black;width:50%;" >{{x.pc}}</div><div style="border:1px solid black;width:50%;">{{x.pf}}</div>
</div>

</div>
<div class="col-sm-2" style="border:1px solid black;">{{x.total}}</div>
</div>
	</td>
	</tr>
	
	</table>


	</div>	
	
<div class="row" style="margin-top:80px;">
<div class="col">
<b>...............................................</b>
<br/>
SUBJECT TEACHER NAME & SIG
</div>
<div class="col">
<b>................................</b><br/>
HEAD OF THE DEPT
</div>
<div class="col">
<b>...................</b><br/>
PRINCIPAL
</div>
</div>	

<br/>	
	
	</div>  
	
	
	
	
		  	<div id="sh"  style="margin-top:200px;padding:50px;background-color:skyblue;" class="row">
		  	
		  	<div class="col col-md-6" style="text-align:center;">
		  	<table border="1" align="center" >
		<tr>
	<th>session</th>
	<th>department</th>
	<th>semseter</th>
	<th>subject code</th>
	</tr>

	
	<tr>
	<td><select ng-model="p.session"   ng-options="c for c in sch"></select></td>
	<td><select ng-model="p.dept"      ng-options="c for c in khan2"></select></td>
	<td><select ng-model="p.semester"  ng-options="c for c in khan1"></select></td>
	<td><input type="number"  ng-model="p.subcode"/></td>
	</tr>
	
	</table>
	
			<br/>
<button ng-click="getall();" class="btn btn-sm btn-success" style="margin-left:2%;">submit</button> <button class="btn btn-sm btn-dark" style="margin-left:100px;"ng-click="hidesh()">hide this part</button>


		  	</div> 
		  	
		  	
		  	
		    	
		  	<div class="col col-md-6" style="background-color:white;padding:20px;">
		  	<h4>Total number of students: </h4><b>{{totalr}}</b>
		  	<br/>
		  <b>SL NO is from:</b> <input style="width:80px;" type="number" ng-model="fromr"/><b> 
		  to SL NO:</b><input style="width:80px;" type="number" ng-model="tor"/>  	<button class="btn btn-success btn-sm" ng-click="filtrecord()">submit</button>
		  
		  <br/>
		  <br/>
		  
<table border="1" style="margin-left:116px;">
<tr>
<th>TC</th><th>TF</th><th>PC</th><th>PF</th>
</tr>
<tr>
<td><input type="number" ng-model="subval.tc" style="width:80px;" /></td>
<td><input type="number" ng-model="subval.tf" style="width:80px;" /></td>
<td><input type="number" ng-model="subval.pc" style="width:80px;" /></td>
<td><input type="number" ng-model="subval.pf" style="width:80px;" /></td>
</tr>
</table>
		  	</div>
	

	</div> 

</body>
</html>
