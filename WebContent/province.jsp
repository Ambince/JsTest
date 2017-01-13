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
	<select id="provinceID" style="width: 111px">
		<option>选择省份</option>
		<option>湖南</option>
		<option>广东</option>
	</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<select id="cityID" style="width: 111px">
		<option>选择城市</option>
	</select>

	<script>
		document.getElementById("provinceID").onchange = function() {
			//清空城市下拉框的内容，除第一项外
			var cityElement = document.getElementById("cityID");
			cityElement.options.length = 1;
			//获取选中option标签的索引号，从0开始
			var index = this.selectedIndex;
			//定位选中的option标签
			var optionElement = this[index];
			//获取选中的option标签的内容
			var province = optionElement.innerHTML;
			if ("选择省份" != province) {
				var ajax = createAJAX();
				var method = "POST";
				var url = "${pageContext.request.contextPath}/ProvinceCityServlet?time="
						+ new Date().getTime();
				ajax.open(method, url);
				ajax.setRequestHeader("content-type",
						"application/x-www-form-urlencoded");
				var content = "province=" + province;
				ajax.send(content);

				ajax.onreadystatechange = function() {
					if (ajax.readyState == 4) {
						if (ajax.status == 200) {
							var xmlDocument = ajax.responseXML;
							var cityElementArray = xmlDocument
									.getElementsByTagName("city");
							var size = cityElementArray.length;
							alert(size);
							for (var i = 0; i < size; i++) {
								var city = cityElementArray[i].firstChild.nodeValue;
								var optionElement = document
										.createElement("option");
								optionElement.innerHTML = city;
								cityElement.appendChild(optionElement);

							}
						}
					}
				}
			}
		}
	</script>



</body>
</html>