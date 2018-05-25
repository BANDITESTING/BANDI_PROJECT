<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*;"%>
   <% 
   		ArrayList<String> roomList = (ArrayList<String>)application.getAttribute("roomList"); 
   	%>
<!DOCTYPE html>
<html>
<head>
<style>
	.createRoom{
		display:none;;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src ="<%=request.getContextPath()%>/resources/jquery-3.3.1.min.js"></script>
</head>
<body>
	<form action ="<%=request.getContextPath()%>/multiChatRoom.do" method = "post">
		<h3>참여할 채팅방 : 
		<select id ="chatRoom" name ="chatRoom">
			<%for(String room : roomList){ %>
				<option value = "<%=room %>"><%=room%></option>
			<%}%>
			<option value ="newroom">새로 개설</option>
		</select></h3>
		
		<h3>사용할 이름 : <input type = "text" name = "chat_id" id = "chat_id" size = "10"/></h3>
		
		<h3 class = "createRoom">방 제목 : <input type = "text" name = "roomName" id ="roomName"/></h3>
		<button id ="startBtn">참여하기</button><br>
	</form>
	
	<script>
		$('#chatRoom').on('change', function(){
			if($(this).val() == "newRoom"){
				$('#startBtn').text("개설하기");
				$('.createRoom').each(function(index, value){
					$(this).css('display','block');
				});
			}else
			{
				$('#startBtn').text("참여하기");
				$('.createRoom').each(function(index, value){
					$(this).css('display','none');
				});
			}
		});
	</script>
</body>
</html>