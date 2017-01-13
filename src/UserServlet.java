

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		//tomcat 是以ISO8859-1为编码
//		byte[] buf = username.getBytes("ISO8859-1");
//		username = new String(buf,"UTF-8");
		System.out.println(username);
		String tip = "<font color = 'red'> 该用户已经存在</font>";
		if(!username.equals("amence")){
			tip = "<font color = 'green'> 通过</font>";
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.write(tip);
		writer.flush();
		writer.close();
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username  = request.getParameter("username");
		System.out.println(username);
		String tip = "images/MsgSent.gif";
		if("amence".equals(username)){
			tip = "images/MsgError.gif";
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.write(tip);
		pw.flush();
		pw.close();
	}

}
