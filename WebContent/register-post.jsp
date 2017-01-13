<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基于HTML,以GET或POST方式，检查注册用户名是否在数据库中存在</title>
<script src="js/ajax.js"></script>

</head>
<body>
  用户名：<input id="usernameID" type="text" />
  
  <span id="resID"></span>
	<hr/>
	
	<script type="text/javascript">
		document.getElementById("usernameID").onblur = function(){
			var username = this.value;
			
			var ajax = createAJAX();
			
			var method = "POST";
			
			var url = "${pageContext.request.contextPath}/UserServlet?time="+new Date().getTime();
			ajax.open(method,url);
			//设置AJAX 请求头为POST，他会将请求体中的汉字自动进行UTF-8的编码
			ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
			var content = "username="+username;
			ajax.send(content);
			
			
			ajax.onreadystatechange = function(){
				if(ajax.readyState ==4){
					if(ajax.status == 200){
						var tip = ajax.responseText;
						var imageElement = document.createElement("img");
						imageElement.src = tip;
						imageElement.style.width = "12px";
						imageElement.style.height = "12px";
						var spanElement = document.getElementById("resID");
						spanElement.innerHTML = "";
						spanElement.appendChild(imageElement);
					}
				}
			}
			
			
			
			
			
			
			
			
			
		}
	
	
	</script>
</body>





</html>