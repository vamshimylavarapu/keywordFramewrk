/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2017-02-20 10:33:51 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.lang.*;

public final class Validate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 String user_id; 
 String pass_word; 
 int flag=0;  
  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/Header.html", Long.valueOf(1449461416000L));
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!--\r\n");
      out.write("     File : Validate.jsp\r\n");
      out.write("\r\n");
      out.write(" -->\r\n");
      out.write("\r\n");
      out.write("<HTML>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("\t<LINK href=\"styles.css\" type=\"text/css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<!--");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "MultiLevelmenu.htm", out, false);
      out.write("<br><br><br>-->\r\n");
      out.write("<body>\r\n");
      out.write("<!--\r\n");
      out.write("\t\tFile : Header.html\r\n");
      out.write("\t\tPurpose : Displaying header section\r\n");
      out.write("-->\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<HEAD>\r\n");
      out.write("\t<LINK href=\"styles.css\" type=\"text/css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("</HEAD>\r\n");
      out.write("<center>\r\n");
      out.write("\r\n");
      out.write("<font face=\"Times New Roman\" color=\"blue\" >\r\n");
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("\r\n");
      out.write("<Body class=SC>\r\n");
      out.write("<table width=\"100%\" border=\"0\">\r\n");
      out.write("<tr>\t\r\n");
      out.write("<td align=center valign=\"top\"><img src=\"Images/bike4.jpg\" border=0 alt=\"\"></td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</font>\r\n");
      out.write("</center>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("<BR><BR><BR>\r\n");
      out.write("<FONT FACE=\"Century Gothic\">\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");


/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
int flag=0;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
 user_id = request.getParameter("uid");
   pass_word = request.getParameter("pwd");
  
  System.out.println("user_id = "+user_id+"\t"+"pass_word = "+pass_word);

      out.write("\r\n");
      out.write("\r\n");


/*Checking for userid and password*/

if(pass_word.equals("") || user_id.equals(""))
{
	//System.out.println("Redirecting to login to fill all credentials..");

      out.write('\r');
      out.write('\n');
      out.write('	');
      if (true) {
        _jspx_page_context.forward("Login.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("error", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("blankfields", request.getCharacterEncoding()));
        return;
      }
      out.write('\r');
      out.write('\n');

}

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

try
{
	/*Connection to MS Acess database is made with JDBC class one driver*/
	
	//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	//con = DriverManager.getConnection("jdbc:odbc:scheme","root","");
	//con = DriverManager.getConnection("jdbc:odbc:MediTrack","","");
	Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/honda", "root", "");

	stmt =  con.createStatement();

	/*Retrives data from the database*/
	rs = stmt.executeQuery("SELECT * from Login ");
	System.out.println(rs);

	while(rs.next())
	{
	       	if(user_id.equals(rs.getString(1)) && pass_word.equals(rs.getString(2)))
	         { 
        	   System.out.println("User has successfully logged in...");

		    /*Puts the username and connection variable to session*/
		    session.setAttribute("userr",user_id);
		    session.setAttribute("connection",con);
			session.setAttribute("auth",new Integer(rs.getInt(3)));
			/*
			if(rs.getInt(3)==0){
				session.setAttribute("auth",new Integer(0));
			 }
			else{
				session.setAttribute("auth",new Integer(1));
			}
			*/
        	    flag=1;
			 }
		   
	}



          //stmt.close();
			//con.close();
		}catch(Exception e){
			//stmt.close();
			//con.close();
			
      out.print(e);

		}

      out.write("\r\n");
      out.write("\r\n");

	/*If username and password is validated, then the user is redirected to homepage*/
	if(flag==1)
	{
	//flag=0;

      out.write("\t \r\n");
      out.write("\t ");
      if (true) {
        _jspx_page_context.forward("Home.html");
        return;
      }
      out.write('\r');
      out.write('\n');

	}
	else
	{
		flag=0;
	/*If username and password is not valid, then the user is redirected back to Loginpage*/

      out.write("\r\n");
      out.write("\r\n");
      out.write("\t");
      if (true) {
        _jspx_page_context.forward("Login.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("error", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("invalid", request.getCharacterEncoding()));
        return;
      }
      out.write('\r');
      out.write('\n');

	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("</BODY>\r\n");
      out.write("</HTML>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
