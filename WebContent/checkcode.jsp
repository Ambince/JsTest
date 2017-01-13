<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>验证码检查</title>
<script src="js/ajax.js">
	
</script>
</head>
<body>

	<form>
		<table border="0" align="center">
			<tr>
				<th>验证码:</th>
				<td><input size="2" type="text" name="checkcode"
					id="checkcodeID" maxlength="4" /></td>
				<td><img src="image.jsp"></td>
				<td id="res"></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		//去掉两边的空格
		function trim(str){
			str = str.replace(/^\s*/,"");
			str = str.replace(/\s*$/,"");
			return str;
		}
	</script>
	
		<script type="text/javascript">
		document.getElementById("checkcodeID").onkeyup = function(){
			var checkcode = this.value;
			checkcode = trim(checkcode);//2525
			if(checkcode.length == 4){
				//NO1)
				var ajax = createAJAX();
				//NO2)
				var method = "POST";
				var url = "${pageContext.request.contextPath}/CheckcodeAction?time="+new Date().getTime();
				ajax.open(method,url);
				//NO3)
				ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
				//NO4)
				var content = "checkcode=" + checkcode;
				ajax.send(content);
			
				//--------------------------------------------------------等待
				
				//NO5)
				ajax.onreadystatechange = function(){
					if(ajax.readyState == 4){
						if(ajax.status == 200){
							//NO6)
							var tip = ajax.responseText;
							
							//NO7)
							var img = document.createElement("img");
							img.src = tip;
							img.style.width = "14px";
							img.style.height = "14px";
							var td = document.getElementById("res");
							td.innerHTML = "";
							td.appendChild(img);
						}
					}
				}
			}else{
				//清空图片
				var td = document.getElementById("res");
				td.innerHTML = "";
			}
		}
	</script>	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


</body>
</html>