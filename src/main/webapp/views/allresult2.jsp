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
}
table td{
wrap-word:break-word;
  border-spacing: 0px;
  padding:0px;
}





</style>



</head>
<body ng-controller="ar" ng-app="arapp">

<%
if(session.getAttribute("user")==null && session.getAttribute("password")==null){
	response.sendRedirect("${pageContext.request.contextPath}");
	}
	  %>
	   
	   
	   
	 <div id="k"> 
<div style="background-color:ghostwhite;margin-left:-340px;margin-top:120px;padding-left:15px;border:2px solid black;width:1500px;height:920px;border-bottom:0px;" >

<div style="text-align:center;">
<b>Bangldesh Technical Education Board , Dhaka</b> <br/>
<b>Tabulation Sheet for Diploma-in-Engineering</b>
</div>

<div class="row" align="center">
<div class="col"><b>Technology :</b> <b ng-if="checkdept(allres[0].rst.dept)=='com'">Computer(66)</b><b ng-if="checkdept(allres[0].rst.dept)=='civ'">Civil(64)</b>
	<b ng-if="checkdept(allres[0].rst.dept)=='et'">Electrical(67)</b><br/>
<b>Institute Name: Badiul Alam Science and Technology Institute</b>
</div>
<div class="col">
<b>{{allres[0].rst.semester}} Semester Examination( {{allres[0].dps[0].duration}})</b> <br/>
<b>Session: {{allres[0].rst.session}}</b>
</div>
</div>
<br/>

<table   border="1"   ng-if="allres.length!=0" style="font-weight:500;overflow-x:auto;width:1460px;font-size:0.85em;" >
	<tr ng-repeat="x in allres">
	<th ng-if="$index==0">--</th>
	<th ng-if="$index==0">--</th>
	<th ng-if="$index==0" style="width:81px;">Subject Name and code</th>
	
	<th ng-if="$index==0" style="padding-left:15px;padding-right:15px;" >
	
	<div class="row">
	<div style="border:1px solid black;" class="col" ng-repeat=" dp in x.dps" >
	{{dp.subname}}({{dp.subcode}}) 
	</div>
	</div>
</th>

	<th ng-if="$index==0" style="text-align:center;width:5%;">Result</th>
	</tr>
	
	
	
	
	
	
	
	<tr ng-repeat="x in allres">
	<td ng-if="$index==0">SL<br/>
	NO</td>
	<td ng-if="$index==0">
	<b>roll no</b> <br/>
	<b>reg no</b>
</td>
	<td ng-if="$index==0"><b>Name of</b><br/>
	<b>the students</b></td>

   <td ng-if="$index==0" style="padding-left:15px;padding-right:15px;">
	<div class="row">
	<div   class="col"  ng-repeat="dpk in allres[0].dps">
		<div class="row">
		<div class="col" style="border:1px solid black;">TC- <br/>{{sublist[$index].tc}}</div><div class="col" style="border:1px solid black;">TF- <br/>{{sublist[$index].tf}}</div>
		<div class="col">
			<div class="row">
		<div class="col" style="border:1px solid black;">Total <br/>{{dpk.fullmark}}</div>
		<div class="col" style="border:1px solid black;">GP</div>
			</div>
		</div>
		</div></div>
		</div>
	
		<div class="row">
	<div   class="col"  ng-repeat="dpk in allres[0].dps">
		<div class="row">
		<div class="col" style="border:1px solid black;">PC- <br/>{{sublist[$index].pc}}</div><div class="col" style="border:1px solid black;">PF- <br/>{{sublist[$index].pf}}</div>
		<div class="col">
			<div class="row">
		<div class="col" style="border:1px solid black;font-size:0.65em;">LETTER GRADE</div>
			</div>
		</div>
		</div></div>
		</div>
	
	</td>
		<td  ng-if="$index==0"  style="width:6%;">
	<div class="row" style="margin-left:2%;margin-right:2%;">
	<div class="col-sm-6" style="border:1px solid black;padding-left:0px;height:89px;">
	GPA
<br/> 
leter <br/>
grade
</div>
   <div class="col-sm-6" style="border:1px solid black;padding-left:0px;height:89px;"><br/>status</div>
	</div>
	</td>
	
	</tr>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<tr ng-repeat="ps in allres">
	<td style="text-align:center;">{{$index+fi}}</td>
	
	<td>
	<b>{{ps.rst.roll}}</b> <br/> <br/>
	<b>{{ps.rst.regno}}</b>
	</td>
	
	
	<td>
	{{ps.rst.name}}
	</td>

   <td style="padding-left:15px;padding-right:15px;">
   
	<div class="row">
	
	<div   class="col"  ng-repeat="dp1 in ps.dps">
		<div class="row">
		
		<div class="col" style="border:0.45px solid black;height:36px;">{{dp1.tc}}</div>
		<div class="col" style="border:0.45px solid black;height:36px;">{{dp1.tf}}</div>
		
		<div class="col" style="border:0.45px solid black;text-align:center;height:36px;">
	<div style="border:0.33px solid black;padding-left:10px;height:18px;" class="row">
	{{dp1.total}} 
	</div>	
	<div style="border:0.30px solid black;padding-left:10px;height:18px;" class="row">
	{{dp1.gradepoint}}
	</div>
	</div>
	
	</div>
	</div>
	
	</div>
	
	
		<div class="row">
		
	<div   class="col"  ng-repeat="dn in ps.dps">
		<div class="row">
		<div class="col" style="border:0.35px solid black;height:30px;">{{dn.pc}}</div>
		<div class="col" style="border:0.35px solid black;height:30px;">{{dn.pf}}</div>
		
				<div class="col" style="border:0.35px solid black;height:30px;">
				{{dn.grade}}
		
			</div>
		</div></div>
		
		</div>
		
		
	</td>
	
	
	
	
	<td  style="width:6%;">
	<div class="row" style="width:100%;margin-left:2%;margin-right:2%;">
	<div class="col-sm-6" style="height:100%;border:0.35px solid black;">
	
<div class="row" style="height:65px;">
<div class="col" style="border:0.35px solid black;">
	{{ps.rst.gpa}}
	</div>
	
	<div class="col" style="border:0.35px solid black;">
	{{ps.rst.sms}} 
	</div>
	</div>
	</div>
	<div class="col-sm-6" style="border:0.35px solid black;height:65px;">
	</div>
	</div>
	</td>
	
</tr>	
	
</table>

</div> 

		<div style="border:2px solid black;border-top:0px;margin-left:-340px;width:1500px;background-color:ghostwhite;">
			<br/>
	<br/>
	
<div class="row"  style="margin-left:50px;">
<div class="col">
<b>.................................</b>
<br/>
      <p style="margin-left:26px;"> Prepared By</p>
</div>

<div class="col">
<b>................................</b><br/>
     <p style="margin-left:20px;"> Compared by</p>
</div>


<div class="col">
<b style="margin-left:12px;">..................................</b><br/>
Head of the Department
</div>
<div class="col">
<b style="margin-left:7px;">..............................</b><br/>
Head of the Institute
</div>
</div>	</div>

 

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
