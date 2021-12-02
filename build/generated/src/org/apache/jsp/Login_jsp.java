package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <title>Food Menu</title>\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"login.css\">\n");
      out.write("        <!-- fontawesome icon -->\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css\" integrity=\"sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==\" crossorigin=\"anonymous\" />\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"form\">\n");
      out.write("            <div class=\"tab-header\">\n");
      out.write("                <div >Sign Up</div>\n");
      out.write("                <div class=\"active\">Sign In</div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"tab-content\">\n");
      out.write("                <div class=\"tab-body\">\n");
      out.write("                    <form class=\"form-signup\" action =\"signup\" method=\"post\">\n");
      out.write("                        <div class=\"form-element\">\n");
      out.write("                            <input type=\"text\" placeholder=\"Username\" name=\"user\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-element\">\n");
      out.write("                            <input type=\"password\" placeholder=\"Password\" name=\"pass\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-element\">\n");
      out.write("                            <input type=\"password\" placeholder=\"Repassword\" name=\"repass\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-element\">\n");
      out.write("                            <button type=\"submit\">Sign Up</button>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("    <div class=\"tab-body active\">\n");
      out.write("\n");
      out.write("                    <form class=\"form-signin\" action =\"login\" method=\"post\">\n");
      out.write("                        <div class=\"form-element\">\n");
      out.write("                            <input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${username}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" placeholder=\"Username\" name=\"user\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-element\">\n");
      out.write("                            <input type=\"password\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${password}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" placeholder=\"Password\" name=\"pass\">\n");
      out.write("                        </div>\n");
      out.write("<!--                     <div class=\"form-group form-check\">\n");
      out.write("                            <input name=\"remember\" value=\"1\" type=\"checkbox\" class=\"form-check-input\" id=\"exampleCheck1\">\n");
      out.write("                            <label class=\"form-check-label\" for=\"exampleCheck1\">Remember me</label>\n");
      out.write("                        </div>\n");
      out.write("            -->\n");
      out.write("                        <div class=\"form-element\">\n");
      out.write("                            <button type=\"submit\">Sign In</button>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script>\n");
      out.write("            let tabPanes = document.getElementsByClassName(\"tab-header\")[0].getElementsByTagName(\"div\");\n");
      out.write("\n");
      out.write("            for (let i = 0; i < tabPanes.length; i++) {\n");
      out.write("                tabPanes[i].addEventListener(\"click\", function () {\n");
      out.write("                    document.getElementsByClassName(\"tab-header\")[0].getElementsByClassName(\"active\")[0].classList.remove(\"active\");\n");
      out.write("                    tabPanes[i].classList.add(\"active\");\n");
      out.write("\n");
      out.write("                    document.getElementsByClassName(\"tab-content\")[0].getElementsByClassName(\"active\")[0].classList.remove(\"active\");\n");
      out.write("                    document.getElementsByClassName(\"tab-content\")[0].getElementsByClassName(\"tab-body\")[i].classList.add(\"active\");\n");
      out.write("                });\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
