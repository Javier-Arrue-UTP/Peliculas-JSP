package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Procesos.Consultar;
import java.util.LinkedList;
import Entidades.Usuarios;
import Entidades.Usuarios;

public final class agregar_005fperfil_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Agregar perfil</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("            <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("     <!-- Compiled and minified CSS -->\n");
      out.write("     <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css\">\n");
      out.write("     <link href=\"CSS/esitlo_perfiles.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("        ");

            String email;
            email = request.getParameter("email");

        
      out.write("\n");
      out.write("        \n");
      out.write("<body class=\"grey darken-4 white-text\">\n");
      out.write("\n");
      out.write("    <section class=\"container center-align\">\n");
      out.write("        <img src=\"Imagenes/Logo.png\" alt=\"\" id=\"logo_inicio\">\n");
      out.write("        <hr>\n");
      out.write("        <h3>Agregar perfil</h3>\n");
      out.write("        <h6>Agrega un perfil para otra persona que ve geminy</h6>\n");
      out.write("\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <form method=\"get\" action=\"guarda_perfil.jsp\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    \n");
      out.write("                    <div class=\"input-field col s6 white-text\">\n");
      out.write("                      <input id=\"nombre\" type=\"text\" name=\"nombre\" class=\"validate white-text\" required>\n");
      out.write("                      <label for=\"nombre\">Nombre</label>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"input-field col s6 m6\">\n");
      out.write("                        <select class=\"icons\">\n");
      out.write("                            <option value=\"\" disabled selected>Escoge un color</option>\n");
      out.write("                            <option value=\"blue\" data-icon=\"Imagenes/blue.PNG\" class=\"left\">Azul</option>\n");
      out.write("                            <option value=\"\" data-icon=\"Imagenes/teal.PNG\" class=\"left\">Verde Azulado</option>\n");
      out.write("                            <option value=\"\" data-icon=\"Imagenes/yellow.PNG\" class=\"left\">Amarillo</option>\n");
      out.write("                        </select>\n");
      out.write("                        <label>Colores</label>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                 <button class=\"btn waves-effect waves-light  light-blue\" type=\"submit\" name=\"email\" value=\"");
      out.print(email);
      out.write("\">Continuar</button>\n");
      out.write("             </form>\n");
      out.write("                \n");
      out.write("\n");
      out.write("           \n");
      out.write("\n");
      out.write("                \n");
      out.write("                <a class=\"btn waves-effect waves-light  light-blue\" href=\"perfiles.jsp?email=");
      out.print(email);
      out.write("\">Cancelar</a>\n");
      out.write("                 \n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js\"></script>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    <script>\n");
      out.write("        document.addEventListener('DOMContentLoaded', function() {\n");
      out.write("            var elems = document.querySelectorAll('select');\n");
      out.write("            var instances = M.FormSelect.init(elems);\n");
      out.write("        });\n");
      out.write("\n");
      out.write("    </script>\n");
      out.write("</body>\n");
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
