

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class CheckcodeAction extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String checkcode = (String) req.getAttribute("checkcode");
		String tip = "images/MsgError.gif";
		String checkcodeServer = (String) req.getSession().getAttribute("CHECKNUM");
		if (!checkcodeServer.equals(checkcode)) {
			tip = "images/MsgSent.gif";
		}
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		pw.write(tip);
		pw.flush();
		pw.close();
	}


}
