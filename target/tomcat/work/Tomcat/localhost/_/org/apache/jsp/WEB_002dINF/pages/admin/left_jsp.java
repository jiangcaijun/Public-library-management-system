/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2016-03-29 02:34:35 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.pages.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class left_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>无标题文档</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"/static/css/admin/style.css\" />\r\n");
      out.write("<script language=\"JavaScript\" src=\"/static/js/jquery.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(function(){\t\r\n");
      out.write("\t//导航切换\r\n");
      out.write("\t$(\".menuson li\").click(function(){\r\n");
      out.write("\t\t$(\".menuson li.active\").removeClass(\"active\")\r\n");
      out.write("\t\t$(this).addClass(\"active\");\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t$('.title').click(function(){\r\n");
      out.write("\t\tvar $ul = $(this).next('ul');\r\n");
      out.write("\t\t$('dd').find('ul').slideUp();\r\n");
      out.write("\t\tif($ul.is(':visible')){\r\n");
      out.write("\t\t\t$(this).next('ul').slideUp();\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\t$(this).next('ul').slideDown();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("})\t\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body style=\"background:#f0f9fd;\">\r\n");
      out.write("\t<div class=\"lefttop\"><span></span>功能列表</div>\r\n");
      out.write("    \r\n");
      out.write("    <dl class=\"leftmenu\">\r\n");
      out.write("        \r\n");
      out.write("    <dd>\r\n");
      out.write("    <div class=\"title\">\r\n");
      out.write("    <span><img src=\"/static/img/admin/leftico01.png\" /></span>首页\r\n");
      out.write("    </div>\r\n");
      out.write("    \t<ul class=\"menuson\">\r\n");
      out.write("        <li><cite></cite><a href=\"index.html\" target=\"rightFrame\">首页</a><i></i></li>\r\n");
      out.write("        </ul>    \r\n");
      out.write("    </dd>\r\n");
      out.write("        \r\n");
      out.write("    \r\n");
      out.write("    <dd>\r\n");
      out.write("    <div class=\"title\">\r\n");
      out.write("    <span><img src=\"/static/img/admin/leftico02.png\" /></span>借还书管理\r\n");
      out.write("    </div>\r\n");
      out.write("    <ul class=\"menuson\">\r\n");
      out.write("   \t    <li><cite></cite><a href=\"/admin/borrow\" target=\"rightFrame\">借书管理</a><i></i></li>\r\n");
      out.write("        <li><cite></cite><a href=\"/admin/borrow2\" target=\"rightFrame\">还书管理</a><i></i></li>\r\n");
      out.write("        <li><cite></cite><a href=\"/admin/tabBorrow\" target=\"rightFrame\">借还书查询</a><i></i></li>\r\n");
      out.write("        \r\n");
      out.write("        </ul>     \r\n");
      out.write("    </dd> \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    <dd><div class=\"title\"><span><img src=\"/static/img/admin/leftico03.png\" /></span>上下架管理</div>\r\n");
      out.write("    <ul class=\"menuson\">\r\n");
      out.write("        <li><cite></cite><a href=\"/admin/newBook\" target=\"rightFrame\">新书上架</a><i></i></li>\r\n");
      out.write("        <li><cite></cite><a href=\"/admin/deleteBook\" target=\"rightFrame\">旧书下架</a><i></i></li>\r\n");
      out.write("        <li><cite></cite><a href=\"/admin/tabBook\" target=\"rightFrame\">图书查询</a><i></i></li>\r\n");
      out.write("    </ul>    \r\n");
      out.write("    </dd>  \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    <dd><div class=\"title\"><span><img src=\"/static/img/admin/leftico04.png\" /></span>日志查询</div>\r\n");
      out.write("    <ul class=\"menuson\">\r\n");
      out.write("        <li><cite></cite><a href=\"/admin/tabLog\" target=\"rightFrame\">日志查询</a><i></i></li>\r\n");
      out.write("    </ul>\r\n");
      out.write("    \r\n");
      out.write("    </dd>   \r\n");
      out.write("    \r\n");
      out.write("    </dl>\r\n");
      out.write("    \r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
