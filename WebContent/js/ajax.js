	function createAJAX() {
			var ajax = null;
			try {
				ajax = new ActiveXObject("microsoft.xmlhttp");

			} catch (e1) {
				ajax = new XMLHttpRequest();
			} 
			return ajax;
		}