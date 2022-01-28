<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>student result</title>
</head>
<body>


<div style="margin:50px;text-align:center;padding:50px;background-color:darkseagreen;">
<br/>
<h4>add mail</h4>
<form action="/addmail" method="post">
<input type="text" name="email" placeholder="email"   />

<br/>
<br/>
<input type="text" name="pass" placeholder="password" />
<br/>
<br/>
<button type="submit">submit</button>
<br/>
${sms}
</form>
</div>


<div style="margin:50px;text-align:center;padding:50px;background-color:darkseagreen;">
<br/>
<h4>update</h4>
<form action="/upadminmail" method="post">
<input type="text" name="email" placeholder="email"   />
<br/>
<br/>
<input type="text" name="pass" placeholder="password" />
<br/>
<br/>

<br/>
<br/>
<button type="submit">submit</button>
<br/>
${up}
</form>
</div>
</body>
</html>
