import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProvinceCityServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String province = req.getParameter("province");
		System.out.println(province);
		// 通知AJAX异步对象，服务器响应的数据为xml格式的
		resp.setContentType("text/xml;charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		pw.write("<?xml version='1.0' encoding='UTF-8'?>");
		pw.write("<root>");
		if ("广东".equals(province)) {
			pw.write("<city>广州</city>");
			pw.write("<city>深圳</city>");
			pw.write("<city>中山</city>");
		} else if ("湖南".equals(province)) {
			pw.write("<city>长沙</city>");
			pw.write("<city>株洲</city>");
			pw.write("<city>湘潭</city>");
			pw.write("<city>岳阳</city>");
		}
		pw.write("</root>");
		pw.flush();
		pw.close();

	}

}
