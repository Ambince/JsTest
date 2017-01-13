<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript" charset="utf-8">
		/**
		function mysum(num1,num2){
				return num1+num2;
			}
			var myresult = mysum(100,200);
			alert("100+200="+myresult);
			
			var result = new Function("num1","num2","return num1+num2");
			alert(result(1000,200));
			
			
			var result = function(num1,num2){
				return num1+num2;
			}
			alert(result(1000,20));
		 **/
		// document.write("急啊经济");
		var str = new Date().toLocaleDateString();
		window.document
				.write("<font size ='44' color='red'>" + str + "</font>");

		function Student(id, name, sal) {
			this.id = id;
			this.name = name;
			this.sal = sal;
		}
		var s = new Student(1, "Amence", 7000);
		document.write("<br/>" + "编号：" + s.id + "<br/>");
		document.write("姓名：" + s.name + "<br/>");
		document.write("薪水：" + s.sal + "<br/>");

		function myrefresh() {
			window.history.go(0);//刷新页面
		}
	</script>


	<h1>我的第一段 JavaScript</h1>

	<p>JavaSript 能够对事件做出反应，比如</p>

	<button type="button" onclick=" alert ('Weclome')">点击这里</button>

	<p id="demo">JavaScript 能够改变HTML元素内容</p>

	<script>
		function myFuntion() {
			x = document.getElementById("demo");//找到元素
			x.innerHTML = "Hello JavaScript"; //改变内容
		}
	</script>

	<button type="button" onClick="myFuntion()">点击这里</button>

	<script>
		function changeImage() {
			element = document.getElementById("myimage");
			if (element.src.match("bulbon")) {
				element.src = "G://eg_bulboff.gif";
			} else {
				element.src = "G://eg_bulbon.gif";
			}
		}
	</script>

	<img id="myimage" onclick="changeImage()" src="G://eg_bulboff.gif"">

	<p>点击灯泡来点亮或熄灭这盏灯</p>


	<p id="amence">JavaScript 能改变HTML元素的样式</p>


	<script>
		function myFunction() {
			x = document.getElementById("amence");
			x.style.color = "#ff0000";
		}
	</script>

	<button type="button" onclick="myFunction()">点击这里</button>

	<p>校验输入框</p>

	<input id="input" type="text">

	<script type="text/javascript">
		function inputFunction() {
			var x = document.getElementById("input").value;
			if (x == "" || isNaN(x)) {
				alert("输入不能为空");
			}
		}
	</script>

	<button type="button" onclick="inputFunction()">点击这里</button>

	<script type="text/javascript">
		var arrays = new Array();
		arrays[0] = 1;
		arrays[2] = 1;
		arrays[1] = 1;
		arrays[3] = 1;
		for (i = 0; i < arrays.length; i++) {
			if (i == 0) {
				document.write("<br/>" + arrays[i] + "<br/>");
			}
			document.write(arrays[i] + "<br/>");
		}
	</script>


	<script>
		function withParamers(name, job) {
			alert("Welcome " + name + ", the " + job);
		}
	</script>

	<button type="button" onclick="withParamers('Amence','Android')">点击这里
	</button>

	<p id="addValue"></p>

	<script type="text/javascript">
		function addValue(a, b) {
			return a * b;
		}

		document.getElementById("addValue").innerHTML = addValue(3, 4);
	</script>


	<form action="test.jsp" method="POST" id="submitToService">

		<input type="button" value="提交到服务器" onclick="doSubmit()" />

	</form>

	<script type="text/javascript">
		function doSubmit() {
			document.getElementById("submitToService").submit();
		}
	</script>


	当前时间：
	<span> ${requestScope.str }</span>
	<br />
	<input type="button" id="submit" value="同步方式提交" />

	<script type="text/javascript">
		document.getElementById("submit").onclick = function() {
			var url = "${pageContext.request.contextPath}/getTimeServlet?id="
					+ new Date().getTime();
			window.location.href = url;

		}
	</script>


	当前时间：
	<span> </span>
	<br />
	<input type="button" id="asynchronousSubmit" value="异步方式提交" />

	<script>
		var ajax = null;
		function createAJAX() {
			if (window.ActiveXObject) {
				ajax = new ActiveXObject("Microsoft.XMLHTTP"); // IE  
			} else if (window.XMLHttpRequest) {
				ajax = new XMLHttpRequest();
			}
		}

		document.getElementById("asynchronousSubmit").onclick = function() {

			//NO1)创建AJAX异步对象（每个浏览器内置的，无需第三方jar包）
			createAJAX()
			//NO2)AJAX异步对象准备发送请求
			var url = "${pageContext.request.contextPath}/getTimeServlet"
			var method = "GET";
			ajax.open(method, url);//1
			//NO3）AJAX异步对象真正发送请求体的数据到服务器，如果请求体无数据的话，用null表示  
			var content = null;
			ajax.send(content);

			ajax.onreadystatechange = function() {
				if (ajax.readyState == 4) {
					if (ajax.status == 200) {
						var str = ajax.responseText;
						document.getElementsByTagName("span")[1].innerHTML = str;

					}
				}
			}

		}
	</script>












</body>
</html>