package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Entidades.Comentarios;
import Procesos.Insertar;
import java.util.LinkedList;
import Entidades.Programa;
import Procesos.Consultar;

public final class ver_005fprograma_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Geminy</title>\n");
      out.write("        \n");
      out.write("        <!--Import Google Icon Font-->\n");
      out.write("        <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!-- Compiled and minified CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"CSS/estilo_visualizar.css\">\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("<body class=\"black\">\n");
      out.write("    ");

    String email,tipo;
    int codigo;
    codigo = Integer.parseInt(request.getParameter("codigo"));
    email = request.getParameter("email");
    tipo = request.getParameter("tipo");
    
    
    Consultar obj = new Consultar();
    LinkedList<Programa> programa = new LinkedList<Programa>();
    
    programa = obj.Busqueda("","", codigo);
    
    Insertar obj2 = new Insertar();
    
    
      out.write("\n");
      out.write("\n");
      out.write("    \n");
      out.write("    <header>\n");
      out.write("\n");
      out.write("        <!-- Dropdown Navegar -->\n");
      out.write("            <ul id=\"dropdown1\" class=\"dropdown-content\">\n");
      out.write("                <li><a href=\"programas.jsp?programa=Peliculas&email=");
      out.print(email);
      out.write("\">Películas</a></li>\n");
      out.write("                <li><a href=\"programas.jsp?programa=Series&email=");
      out.print(email);
      out.write("\">Series</a></li>\n");
      out.write("            </ul>\n");
      out.write("                <!-- Dropdown Cuenta -->\n");
      out.write("            <ul id=\"dropdown2\" class=\"dropdown-content\">\n");
      out.write("                <li><a href=\"perfiles.jsp?email=");
      out.print(email);
      out.write("\">Perfiles</a></li>\n");
      out.write("                <li><a href=\"#!\">Mi lista</a></li>\n");
      out.write("                <li><a href=\"#!\">Cambio de plan</a></li>\n");
      out.write("                <li><a href=\"#!\">Historial de pago</a></li>\n");
      out.write("                <li><a href=\"index.html\">Salir</a></li>\n");
      out.write("            </ul>\n");
      out.write("        <!--BARRA-->\n");
      out.write("            <div class=\"navbar-fixed\">\n");
      out.write("                <nav class=\"grey darken-4\">\n");
      out.write("                    <div class=\"nav-wrapper\" id=\"menu\">\n");
      out.write("                        <a href=\"Principal.jsp?email=");
      out.print(email);
      out.write("\" class=\"\">\n");
      out.write("                            <span>\n");
      out.write("                                <img src=\"Imagenes/Logo.png\" alt=\"\" class=\"logo\">\n");
      out.write("                            </span>\n");
      out.write("                        </a>\n");
      out.write("                        <ul class=\"right hide-on-med-and-down\">\n");
      out.write("                                      <!-- Dropdown Cuenta -->\n");
      out.write("                            <li><a class=\"dropdown-trigger\" href=\"#!\" data-target=\"dropdown1\">Navegar<i class=\"material-icons right\">arrow_drop_down</i></a></li>\n");
      out.write("                                      <!-- Dropdown Navegar -->\n");
      out.write("                            <li><a class=\"dropdown-trigger\" href=\"#!\" data-target=\"dropdown2\">Cuenta<i class=\"material-icons right\">arrow_drop_down</i></a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("        \n");
      out.write("                </nav>\n");
      out.write("        \n");
      out.write("            </div>\n");
      out.write("        \n");
      out.write("    </header>\n");
      out.write("<!-- Breadcrumbs MUESTRA LA UBICACION ACTUAL-->\n");
      out.write("    <section>\n");
      out.write("        <nav>\n");
      out.write("              <div class=\"nav-wrapper grey darken-4\">\n");
      out.write("                      <div class=\"col s12 container\">\n");
      out.write("                        <a href=\"Principal.jsp?email=");
      out.print(email);
      out.write("\" class=\"breadcrumb\">Inicio</a>\n");
      out.write("                        <a href=\"programas.jsp?programa=");
      out.print(tipo);
      out.write("&email=");
      out.print(email);
      out.write("\" class=\"breadcrumb\">");
      out.print(tipo);
      out.write("</a>\n");
      out.write("                        <a href=\"#!\" class=\"breadcrumb\">");
      out.print(programa.get(0).getNombre());
      out.write("</a>\n");
      out.write("                      </div>\n");
      out.write("                  </div>\n");
      out.write("        </nav>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("      <section style=\"background-image: url(");
      out.print(programa.get(0).getImagen_fondo());
      out.write(");  background-size: cover;\">\n");
      out.write("        \n");
      out.write("            <div class=\"\">\n");
      out.write("                    <div class=\"col s12 m12\">\n");
      out.write("                      <div class=\"card\" id=\"carta1\">\n");
      out.write("                        <div class=\"card-content white-text hoverable\">\n");
      out.write("\n");
      out.write("                            <div class=\"container\">\n");
      out.write("\n");
      out.write("                                <!--Imagen-->\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"col m4 s12\"> \n");
      out.write("                                        <div class=\"row\">\n");
      out.write("                                            <div class=\"col s12 m11\">\n");
      out.write("                                                <div class=\"card Medium\">  \n");
      out.write("                                                    <div class=\"card-image\">\n");
      out.write("                                                        <img src=\"");
      out.print(programa.get(0).getProg_imagen());
      out.write("\">         \n");
      out.write("                                                        <a class=\"btn-floating halfway-fab waves-effect waves-light red\"><i class=\"material-icons\">favorite_border</i></a>\n");
      out.write("                                                    </div>      \n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <!--Informacion de la pelicula--> \n");
      out.write("                                    <div class=\"col m8 s12\">\n");
      out.write("                                        <div class=\"row\">\n");
      out.write("                                            <div class=\"col s12\"><h2><b>");
      out.print(programa.get(0).getNombre());
      out.write("</b></h2></span>\n");
      out.write("                                                <p><h5>⏱ <b>Duracion: </b>");
      out.print(programa.get(0).getDuracion());
      out.write(" minutos.</h5></p>\n");
      out.write("                                                <div class=\"row\">\n");
      out.write("                                                    <div class=\"col s12 m12\">\n");
      out.write("                                                        <div class=\"card transparent\">\n");
      out.write("                                                            <div class=\"card-content white-text\">\n");
      out.write("                                                                <p><h5><b>📑 Descripcion</b></h5></p>\n");
      out.write("                                                                <p>");
      out.print(programa.get(0).getDescripcion());
      out.write("</p>\n");
      out.write("                                                            </div>\n");
      out.write("        \n");
      out.write("                                                        </div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                      </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        \n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("        <section class=\"center-align\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"col s12 hoverable\">\n");
      out.write("                \n");
      out.write("                <div class=\"card transparent\">\n");
      out.write("                    <div class=\"card-content\">\n");
      out.write("                        <iframe width=\"854 \" height=\"480\" src=\"https://www.youtube.com/embed/");
      out.print(programa.get(0).getVideo());
      out.write("\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen>\n");
      out.write("                        </iframe>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                   \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </section>\n");
      out.write("                        \n");
      out.write("                        <!--------------------- COMENTARIOS ------------------------>\n");
      out.write("        <section>\n");
      out.write("\n");
      out.write("                    <div class=\"container white-text\">\n");
      out.write("                        <hr>\n");
      out.write("                        <h5>Comentarios<h5>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <form  action=\"ver_programa.jsp\" class=\"col s12\"> <!----------------- FORMULARIO ---------------->\n");
      out.write("                                  <div class=\"row\">\n");
      out.write("                                    <div class=\"input-field col s12\">\n");
      out.write("                                      <i class=\"material-icons prefix\">insert_comment</i>\n");
      out.write("                                      \n");
      out.write("                                      <textarea id=\"icon_prefix2\" class=\"materialize-textarea white-text\" name=\"comentario\"></textarea>\n");
      out.write("                                      \n");
      out.write("                                      <label for=\"icon_prefix2\">Escribe un comentario...</label>\n");
      out.write("                                      <div class=\"right-align\">\n");
      out.write("                                          <button class=\"waves-effect waves-light btn\" id=\"enviar\">Enviar <i class=\"material-icons right\"> send</i></button>\n");
      out.write("                                      </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <input type=\"hidden\" name=\"email\" value=\"");
      out.print(email);
      out.write("\">\n");
      out.write("                                    <input type=\"hidden\" name=\"codigo\" value=\"");
      out.print(codigo);
      out.write("\">\n");
      out.write("                                    <input type=\"hidden\" name=\"tipo\" value=\"");
      out.print(tipo);
      out.write("\">\n");
      out.write("                                      \n");
      out.write("                                  </div>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                             ");

                                 String comentario = request.getParameter("comentario");
                                 if(comentario!=null){
                                 obj2.InsertarComentario(email, comentario,codigo);
                                 }
                                 LinkedList<Comentarios> coments = new LinkedList<Comentarios>();
                                 coments = obj.Consultar_comentario();
                                 
                                
                             
      out.write("\n");
      out.write("                                    \n");
      out.write("                                    \n");
      out.write("                          <div class=\"col l2 m12 s12\">                             \n");
      out.write("                            <div class=\"card transparent\" >\n");
      out.write("                                <div class=\"card-content white-text\">\n");
      out.write("                                    <hr>\n");
      out.write("                                    ");

                                        for(Comentarios c : coments){
                                                if(c.getCodigo_prog()==codigo){
                                    
      out.write("\n");
      out.write("                                    \n");
      out.write("                                    <div class=\"col s12\">                             \n");
      out.write("                                      <div class=\"card transparent hoverable\" >\n");
      out.write("                                          <div class=\"card-content \">\n");
      out.write("                                              <span class=\"card-title\">");
      out.print(c.getEmail());
      out.write("</span>\n");
      out.write("                                              <p style=\"font-size:18px;\">");
      out.print(c.getComentario());
      out.write("</p>\n");
      out.write("                                          </div>\n");
      out.write("                                      </div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <hr>\n");
      out.write("                                    \n");
      out.write("                                    ");
  }
                                        }
                                    
                                    
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                                          \n");
      out.write("                                          \n");
      out.write("                            </div>\n");
      out.write("                          </div>\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                            \n");
      out.write("        </section>\n");
      out.write("                        \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <footer class=\"page-footer grey darken-4\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                  <div class=\"row\">\n");
      out.write("                    <div class=\"col l6 s12\">\n");
      out.write("                      <h5 class=\"white-text\">Footer Content</h5>\n");
      out.write("                      <p class=\"grey-text text-lighten-4\">You can use rows and columns here to organize your footer content.</p>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col l4 offset-l2 s12\">\n");
      out.write("                      <h5 class=\"white-text\">Links</h5>\n");
      out.write("                      <ul>\n");
      out.write("                        <li><a class=\"grey-text text-lighten-3\" href=\"#!\">Link 1</a></li>\n");
      out.write("                        <li><a class=\"grey-text text-lighten-3\" href=\"#!\">Link 2</a></li>\n");
      out.write("                        <li><a class=\"grey-text text-lighten-3\" href=\"#!\">Link 3</a></li>\n");
      out.write("                        <li><a class=\"grey-text text-lighten-3\" href=\"#!\">Link 4</a></li>\n");
      out.write("                      </ul>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"footer-copyright\">\n");
      out.write("                  <div class=\"container\">\n");
      out.write("                  © 2014 Copyright Text\n");
      out.write("                  <a class=\"grey-text text-lighten-4 right\" href=\"#!\">More Links</a>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("              </footer>\n");
      out.write("\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js\"></script>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("          document.addEventListener('DOMContentLoaded', function() {\n");
      out.write("        var elems = document.querySelectorAll('.dropdown-trigger');\n");
      out.write("        var instances = M.Dropdown.init(elems,{\n");
      out.write("            coverTrigger:false\n");
      out.write("        });\n");
      out.write("      });\n");
      out.write("        </script>\n");
      out.write("    \n");
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
