<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNICAST</title>
<script src ="<%=request.getContextPath()%>/resources/jquery-3.3.1.min.js"></script>
<style>
 #messageWindow {
    background:LightSkyBlue;
    height:300px;
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
</style>
</head>
<body>
	<h1>UNICAST?</h1>
	사용할 ID : <input type ="text" id ="chat_id" size = "10"/><br>
	상대방 ID : <input type ="text" id ="recvUser" size ="10"/> &nbsp;
	<button type ="button" id ="startBtn">채팅하기</button> <br>
	
	<!-- Make Chat Area -->
	<div style ="display:none;" id ="chatbox">
		<fieldset>
			<div id ="messageWindow">
			
			</div><br>
			<input type ="text" id ="inputMessage" onkeyup="enterKey();"/>
			<input type ="submit" value ="보내기" onclick ="send();"/>
			<button type ="button" id ="endBtn">나가기</button>
		</fieldset>
	</div>
	
	<script>
		$('#startBtn').on('click', function(){
			$('#chatbox').css('display', 'block');
			$(this).css('display', 'none');
			connection();
		});

		$('#endBtn').on('click', function(){
			$('#chatbox').css('display', 'none');
			$('#startBtn').css('display', 'inline');
			webSocket.send($('#chat_id').val() + "|" + "님이 나가용!");
		});

		var $textarea = $('#messageWindow');
		var webSocket = null;

		var $inputMessage = $('#inputMessage');

		function connection(){
			webSocket = new WebSocket('ws://localhost:8088'+'<%=request.getContextPath()%>/unicast');

			webSocket.onopen = function(event)
			{
				$textarea.html("<p class = 'chat_content'>" + $('#chat_id').val()+ "님이 왔으요.</p><br>");

				webSocket.send($('#chat_id').val() + "|님이 왔으요.");
			}

			webSocket.onmessage =function(event){
				onMessage(event);
			}

			webSocket.onerror = function(event){
				onError(event);
			}

			webSocket.onclose = function(event){
				onclose(event);
			}
		}

		function enterKey()
		{
			if(window.event.keyCode == 13){
				send();
			}
		}
		
		// 서버로 메시지를 전달하는 메소드
		function send(){
			if($inputMessage.val() == "")
			{
				alert("메시지를 입력해주세요");
			}else
			{
				// 메시지가 입력 되었을 경우
				$textarea.html(
						$textarea.html() +
							"<p class ='chat_content'>나 :" +
							$inputMessage.val() + "</p><br>");

				webSocket.send($('#chat_id').val() + "|" + $inputMessage.val());
				$inputMessage.val("");
			}

			// Scroll Bar automatic Resize
			$textarea.scrollTop($textarea.height());
		}

		// 서버로부터 메시지를 받을 때 수행할 메시지
		function onMessage(event){
			var message = event.data.split("|");
			var sender = message[0];

			var content = message[1];

			if(content == "" || !sender.match($('#recvUser').val()))
			{
				// 안보여쥼
			}else
			{
				$textarea.html(
					$textarea.html() +
					"<p class ='chat_content other-side'>" +
					sender + " : " + content + "</p><br>"
				);

				$textarea.scrollTop($textarea.height());
			}
		}

		function onError(event){
			alert(event)
		}

		function onClose(event){
			alert(event)
		}
	</script>
</body>
</html>