<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/ajax.js"></script>
</head>
<body>
	<form>
		用户名GET：<input id="usernameID" type="text" name="username" />
		光标移出后，立即检查结果

	</form>
	<hr />
	<span id="resID"></span>


	<script type="text/javascript">
		//定位文本框，同时提供焦点失去事件
		document.getElementById("usernameID").onblur = function() {
			//获取文本框中输入的值
			var username = this.value;
			//如果用户没有填内容
			if (username.length == 0) {
				//提示 
				document.getElementById("resID").innerHTML = "用户名必填";
			} else {
				//对汉字进行UTF-8(U8)的编码
				//username = encodeURI(username);
				//NO1)
				var ajax = createAJAX();
				//NO2)
				var method = "GET";
				var url = "${pageContext.request.contextPath}/UserServlet?time="
						+ new Date().getTime() + "&username=" + username;
				ajax.open(method, url);
				//NO3)
				ajax.send(null);

				//--------------------------------------------------------等待

				//NO4)
				ajax.onreadystatechange = function() {
					if (ajax.readyState == 4) {
						if (ajax.status == 200) {
							//NO5)
							var tip = ajax.responseText;
							//NO6)
							document.getElementById("resID").innerHTML = tip;
						}
					}
				}
			}
		}
	</script>








</body>
</html>