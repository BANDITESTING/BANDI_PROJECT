<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<style>
 #messageWindow {
    background:LightSkyBlue;
    height:300px;
    overflow:auto;
 }
 #userWindow {
    background: #e0fee0;
    height:340px;
    overflow:auto;
 }
 .chat_content{
    background: white;
    padding: 10px;
    border-radius: 10px;
    display: inline-block;
    position: relative;
    margin: 10px;
    float: right;
    clear: both;
 }
 
 .chat_content:after{
    content: '';
   position: absolute;
   right: 0;
   top: 50%;
   width: 0;
   height: 0;
   border: 20px solid transparent;
   border-left-color: white;
   border-right: 0;
   border-top: 0;
   margin-top: -3.5px;
   margin-right: -10px;
 }
 
 .other-side {
    background: rgb(255, 255, 102);
    float:left;
    clear:both;
 }
 
 .other-side:after{
    content: '';
   position: absolute;
   left: 0;
   top: 50%;
   width: 0;
   height: 0;
   border: 20px solid transparent;
   border-right-color: rgb(255, 255, 102);
   border-left: 0;
   border-top: 0;
   margin-top: -3.5px;
   margin-left: -10px;
 }
 
 fieldset > button{
    width:60px; 
    height:50px; 
    margin-top:-50px; 
    vertical-align: middle;
 }
</style>
<meta charset="UTF-8">
<title>Broad Cast</title>
</head>
<body>
	<h1>Broadcast 란?</h1>
	
</body>
</html>