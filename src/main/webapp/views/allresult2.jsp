<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<title>tabulation sheet</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/static/theme/bootstrap431.css" /> " rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<script src="<c:url value="/static/theme/jquery340.js" />" > </script> 
<script src="<c:url value="/static/theme/popper114.js" />" > </script>
<script src="<c:url value="/static/theme/angular1.8.2.js" />" > </script>
<script src="<c:url value="/static/theme/bootstrap431.js" />" > </script>
<script type="text/javascript">

var module=angular.module("arapp",[]);
module.controller("ar",function($scope,$http){
	
	$scope.sch=['2010-11','2011-12','2012-13','2013-14','2014-15','2015-16','2016-17','2017-18','2018-19','2019-20','2020-21',
		'2021-22','2022-23','2023-24','2024-25','2025-26','2026-27','2027-28','2028-29','2029-30','2030-31','2031-32','2032-33','2033-34'];
	
	$scope.khan1=['1st','2nd','3rd','4th','5th','6th','7th','8th'];
	$scope.sublist=[];

	$scope.khan2=['66 - Computer Technology','64 - Civil Technology','67 - Electrical Technology',"any"];

	$scope.p={"dept":"","semester":"","session":"","subcode":null,"subname":"","fullmark":null};
	var m1={"tc":"","tf":"","pc":"","pf":""};
	var m2={"tc":"","tf":"","pc":"","pf":""};
	var m3={"tc":"","tf":"","pc":"","pf":""};
	var m4={"tc":"","tf":"","pc":"","pf":""};
	var m5={"tc":"","tf":"","pc":"","pf":""};
	var m6={"tc":"","tf":"","pc":"","pf":""};
	var m7={"tc":"","tf":"","pc":"","pf":""};
	var m8={"tc":"","tf":"","pc":"","pf":""};
	var m9={"tc":"","tf":"","pc":"","pf":""};
	var m10={"tc":"","tf":"","pc":"","pf":""};
	$scope.sublist.push(m1); $scope.sublist.push(m2);$scope.sublist.push(m3);$scope.sublist.push(m4);
	$scope.sublist.push(m5); $scope.sublist.push(m6);$scope.sublist.push(m7);$scope.sublist.push(m8);
	$scope.sublist.push(m9);$scope.sublist.push(m10);
	$scope.fi=1;
	$scope.ti=null;
	$scope.tti=null;
	
	$scope.allres=[];
	$scope.allr=[];
	$scope.getall=function(){
     
		$http({ 
			method:"POST" , 
			url:"${pageContext.request.contextPath}/tabresult", 
		  	data:angular.toJson($scope.p),
		    headers:{"Content-Type":"application/json"}	
			
		        }).then(function(response){
		        	
		        	$scope.allr=response.data;
		        	$scope.allres=response.data;
		        	$scope.tti=response.data.length;
		        		        	})	
		
	
	}
	
	$scope.limitshow=function(){
		$scope.allres=[];
		    if(($scope.ti-$scope.fi)<10){
		    	angular.forEach($scope.allr,function(v,k){
		    		i=k+1;
		    		if($scope.fi<=i && i<=$scope.ti ){
		    		
		    			$scope.allres.push(v);
		    		}
		    	})
		    	
		    }

		    if(($scope.ti-$scope.fi)>=10){

		    	alert("please select maximum 10 records");
		    }	    
		    
		
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
#k{
    transform: rotate(-90deg);
    
  }
  
  table th{
wrap-word:break-word;
border-spacing:0px;
text-align:center;

}
table  td{
wrap-word:break-word;
  border-spacing: 0px;
text-align:center;
}

b{

font-size:1.2em;

}


</style>



</head>
<body ng-controller="ar" ng-app="arapp">

<%
if(session.getAttribute("user")==null && session.getAttribute("password")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
	}
	  %>
	   
	   
	   
	
<div id="k" style="background-color:ghostwhite;padding-left:15px;border:2px solid black;width:1570px;height:1090px;margin-left:-224px;margin-top:260px;" >
<br/>
<div style="text-align:center;" >
<b>Bangldesh Technical Education Board , Dhaka</b> <br/>
<b>Tabulation Sheet for Diploma-in-Engineering</b>
</div>
<div class="row" align="center">
<div class="col"><b>Technology :</b> <b ng-if="checkdept(allres[0].rst.dept)=='com'">Computer(66)</b><b ng-if="checkdept(allres[0].rst.dept)=='civ'">Civil(64)</b>
	<b ng-if="checkdept(allres[0].rst.dept)=='et'">Electrical(67)</b><br/>
<b>Institute Name: Badiul Alam Science and Technology Institute(64041)</b>
</div>
<div class="col">
<b>{{allres[0].rst.semester}} Semester Examination( {{allres[0].dps[0].duration}})</b> <br/>
<b>Session: {{allres[0].rst.session}}</b>
</div>
</div>
<br/>




<table border="1" style="font-weight:500;font-size:0.85em;">
<tr style="height:90px;">
<th>--</th><th>--</th><th style="width:5%;">Subject Name <br/>and Code</th>

<th ng-repeat="dp in allres[0].dps" style="width:10%;">  
<table>
<tr>
<th>
{{dp.subname}} ({{dp.subcode}}) 
</th>
</tr>
</table>
</th>
<th style="width:6%;text-align:center;">Result</th>

</tr>


<tr style="height:130px;">
<th style="width:1%;">SL <br/>NO</th>
<th style="width:4%;">
<table style="width:100%;">
<tr style="border-bottom:1px solid black;">
<th style="padding-bottom:15%;">
Roll No</th>
</tr>
<tr ><th><br/>Reg No</th></tr>
</table>
</th>
<th>Name of The<br/>
Students</th>

<th ng-repeat="dp in allres[0].dps" style="width:8%;height:130px;">  
<table border="1" style="height:100%;width:100%;">
<tr>
<th>TC-<br/>{{sublist[$index].tc}}</th><th>TF-<br/>{{sublist[$index].tf}}</th>


<th>
<table style="width:100%;">
<tr><th style="border-bottom:1px solid black;">Total<br/>{{dp.fullmark}}</th></tr>
<tr><th>GP</th></tr>
</table>
</th>


</tr>
<tr>
<th>PC-<br/>{{sublist[$index].pc}}</th><th>PF-<br/>{{sublist[$index].pf}}</th><th>LETTER<br/>GRADE</th>
</tr>
</table>
</th>

<th style="font-size:0.60em;height:130px;width:8%;">
<div class="row" style="height:100%;margin-left:0.25%;margin-right:0.25%;">
<div class="col-sm" style="border:1px solid black;">
<div class="row" style="border:1px solid black;height:50%;padding-left:20%;padding-top:20%;">
GPA <br/>
</div>
<div class="row" style="border:1px solid black;height:50%;padding-left:20%;padding-top:10%;">
LETTER<br/>
GRADE<br/>
</div>

</div>

<div class="col-sm" style="border:1px solid black;padding-left:20%;padding-top:35%;">
STATUS
</div>
</div>
</th>

</tr>





<tr style="height:130px;" ng-repeat="ps in allres">
<th style="width:1%;">{{$index+fi}}</th>
<th style="width:4%;">
<table style="width:100%;">
<tr style="border-bottom:1px solid black;">
<th style="padding-bottom:15%;">
{{ps.rst.roll}}</th>
</tr>
<tr ><th><br/>{{ps.rst.regno}}</th></tr>
</table>
</th>
<th>
{{ps.rst.name}}</th>

<th ng-repeat="dp1 in ps.dps" style="width:8%;height:130px;">  
<table border="1" style="height:100%;width:100%;">
<tr>
<th>TC-<br/>{{dp1.tc}}</th><th>TF-<br/>{{dp1.tf}}</th>


<th>
<table style="width:100%;">
<tr><th style="border-bottom:1px solid black;">{{dp1.total}}</th></tr>
<tr><th>{{dp1.gradepoint}}</th></tr>
</table>
</th>


</tr>
<tr>
<th>PC-<br/>{{dp1.pc}}</th><th>PF-<br/>{{dp1.pf}}</th><th>{{dp1.grade}}</th>
</tr>
</table>
</th>

<th style="font-size:0.60em;height:130px;width:8%;">
<div class="row" style="height:100%;margin-left:0.25%;margin-right:0.25%;">
<div class="col-sm" style="border:1px solid black;">
<div class="row" style="border:1px solid black;height:50%;padding-left:20%;padding-top:20%;">
{{ps.rst.gpa}} <br/>
</div>
<div class="row" style="border:1px solid black;height:50%;padding-left:20%;padding-top:10%;">
{{ps.rst.sms}} 
</div>

</div>

<div class="col-sm" style="border:1px solid black;padding-left:20%;padding-top:35%;">
STATUS
</div>
</div>
</th>

</tr>











</table>














<br/>
<br/>
	<div class="row"  style="margin-left:50px;">
<div class="col">
<b>.................................</b>
<br/>
      <p style="margin-left:35px;"> Prepared By</p>
</div>

<div class="col">
<b>................................</b><br/>
     <p style="margin-left:30px;"> Compared by</p>
</div>


<div class="col">
<b style="margin-left:12px;">..................................</b><br/>
<p style="margin-left:20px;">Head of the Department</p>
</div>
<div class="col">
<b style="margin-left:7px;">..............................</b><br/>
<p style="margin-left:17px;">Head of the Institute</p>
</div>
</div>	

</div> 

		
		
		
		





	
	
	<br/>
	<br/>
		<div id="sh" align="center" style="margin-top:1000px;background-color:skyblue;margin-left:50px;margin-right:50px;margin-bottom:200px;padding-bottom:50px;">
		<br/>
		<br/>
	<div align="center" class="row" style="background-color:ghostwhite;padding:15px;" >
		<div class="col">
			<b style="color:green;">total number of result record's={{tti}}</b> <br/>
	<b>show result record's</b> <br/>
	<br/>
	from SL NO:<input type="number" ng-model="fi" />  to SL NO::<input type="number" ng-model="ti" /> <button ng-click="limitshow();" class="btn btn-sm btn-dark">submit</button>
	</div>
	
</div>
	<br/>
	<br/>
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
	<div align="center" class="row" >
		<div class="col">
	<button class="btn btn-sm btn-dark" ng-click="hidesh()">hide unneccessary part</button>
	</div>
	<div class="col" style="text-align:left;">
	<button ng-click="getall();" class="btn btn-sm btn-success" style="margin-left:35%;">submit</button>
	</div>
	</div>
	<br/>
	
<table border="1">
<tr ng-if="allr.length>0">
<th>SL NO</th><th>subject name<th>tc</th><th>tf</th><th>pc</th><th>pf</th>
</tr>
<tr ng-if="allr.length>0" ng-repeat="x in allr[0].dps">
<td>{{$index+1}}</td>
<td>{{x.subname}}</td>
<td ><input style="width:80px;" type="text" ng-model="sublist[$index].tc"/></td>
<td><input style="width:80px;" type="text" ng-model="sublist[$index].tf"/></td>
<td><input style="width:80px;" type="text" ng-model="sublist[$index].pc"/></td>
<td><input style="width:80px;" type="text" ng-model="sublist[$index].pf"/></td>
</tr>
</table>	
	
	</div>

</body>
</html>
