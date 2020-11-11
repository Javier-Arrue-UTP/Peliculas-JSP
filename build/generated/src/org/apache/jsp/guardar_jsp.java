package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Procesos.Consultar;
import java.util.List;
import java.util.LinkedList;
import Entidades.Usuarios;
import Procesos.Insertar;

public final class guardar_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Guardar</title>\n");
      out.write("        \n");
      out.write("     <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\n");
      out.write("     \n");
      out.write("    <!-- Compiled and minified CSS -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"CSS/guardar.css\"> \n");
      out.write("    <style>\n");
      out.write("    </style>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    </head>\n");
      out.write("    <body class=\"white-text\">\n");
      out.write("        ");
  
                String num_tarjeta;
                
                int result = 0,result2 = 0;
                
                
                Insertar insert = new Insertar();
                Usuarios user = new Usuarios();
                
                
                user.setCli_nombre(request.getParameter("nombre"));
                user.setCli_apellido(request.getParameter("apellido"));
                user.setCli_id(request.getParameter("identificacion")); //Quitar
                user.setCli_contraseña(request.getParameter("contraseña"));
                user.setCli_tarjeta_tipo(request.getParameter("tarjeta_tipo"));
                user.setCli_num_tarjeta(request.getParameter("num_tarjeta"));
                user.setCli_email(request.getParameter("email"));
                user.setPlan_codigo(Integer.parseInt(request.getParameter("plan")));
                 
                result = insert.InsertarUsuario(user);
                


        
      out.write("\n");
      out.write("        <div class=\"container center-align\">\n");
      out.write("            <img src=\"Imagenes/Logo.png\" alt=\"\" id=\"logo_inicio\">\n");
      out.write("             <hr>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("                           \n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col s12\">\n");
      out.write("                 <div class=\"card\" id=\"carta_inicio\">\n");
      out.write("                    <div class=\"card-content white-text\">\n");
      out.write("                                      \n");
      out.write("                        <div class=\"container center-align\">\n");
      out.write("                             ");
            
                                 if(result == 1){ // Si el usuario es insertado correctamente
                                     
                                    LinkedList<Usuarios> codigo =  new LinkedList<Usuarios>();
                                    Consultar consulta = new Consultar();
                                    
                                    String email = request.getParameter("email");;
                                    codigo = consulta.ConsultarCodigo(email);
                                    
                                    int cod = codigo.get(0).getCli_codigo();
                                    insert.InsertarContrato(user,cod);
                             
      out.write("\n");
      out.write("                            <h5>Ya puedes empezar a ver tus programas favoritos</h5>\n");
      out.write("                            <a class=\"waves-effect waves-light btn  light-blue\" href=\"index.html\">Iniciar sesión</a> \n");
      out.write("                            ");

                                }
                                else{
                            
      out.write("\n");
      out.write("                            <h2>A ocurrido un error...</h2>\n");
      out.write("                            <a class=\"waves-effect waves-light btn  light-blue\" href=\"Registro2.html\">Volver</a>\n");
      out.write("                            <a class=\"waves-effect waves-light btn  light-blue\" href=\"index.html\">Ir al inicio</a> \n");
      out.write("                            ");
}
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>               \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    \n");
      out.write("        \n");
      out.write("        \n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js\"></script>\n");
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
