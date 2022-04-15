<%-- 
    Document   : index
    Created on : 25-jul-2012, 15:06:33
    Author     : GC
--%>

<%@page import="Bean.PersonaBean"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/default.css">
        <title>Empleados</title>
        <script language="javascript" src="scripts/default.js"></script>
        <script type="text/javascript">
            function nuevo(){
                document.location = "../catalogos.jsp?cat=2&amp;agr=1";
            }
            
            function buscar(){
                var nombres = document.getElementById("txtNombres").value;
                var apellidos = document.getElementById("txtApellidos").value;
                var dui = document.getElementById("txtDui").value;
                document.frmLst.action = "PersonaServlet?accion=buscarPrestamo&nombres=" + nombres + "&apellidos=" + apellidos + "&dui=" + dui;
                document.frmLst.submit();
            }
            
            function obtenerPorId(id){
                //document.frmLst.action = "PrestamoServlet?accion=buscar&idsolicitante=" + id;
                document.frmLst.action = "./formularios/refrescar.jsp?cat=98&id=" + id + "&hoja=1";
                document.frmLst.submit();
            }
                        
        </script>
    </head>
    <body>
        <form name="frmLst" method="post">
            <table width="95%" border="0">
                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td>Nombres:</td>
                    <td colspan="2"><input type="text" id="txtNombres" size="50" /></td>
                </tr>
                <tr>
                    <td>Apellidos:</td>
                    <td colspan="2"><input type="text" id="txtApellidos" size="50" /></td>
                </tr>
                <tr>
                    <td>DUI:</td>
                    <td colspan="2"><input type="text" id="txtDui" size="25" /></td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <input type="button" value="Buscar" onclick="buscar()" id="btnBuscar" />                        
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        ${msgListado}
                        ${msgPostOperacion}
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <table width="95%" border="0">
                            <tr>                
                            <td width="10%" bgcolor="#EBEBEB">Id</td>    
                            <td width="25%" bgcolor="#EBEBEB">Nombres</td>                            
                            <td width="25%" bgcolor="#EBEBEB">Apellidos</td>                            
                            <td width="15%" bgcolor="#EBEBEB">DUI</td>                            
                            <td width="10%" align="center" bgcolor="#EBEBEB">Modificar</td>
                            <td width="10%" align="center" bgcolor="#EBEBEB"></td>
                          </tr>
                            <%if(session.getAttribute("listaPersonas") != null){
                                List<PersonaBean> lstPersonas = (List<PersonaBean>)session.
                                        getAttribute("listaPersonas");
                                for(int i=0; i < lstPersonas.size(); i++){
                                    PersonaBean persona = lstPersonas.get(i);
                            %>
                            <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
                                <td><%=persona.getIdPersona()%></td>
                                <td><%=persona.getNombres()%></td>                                                           
                                <td><%=persona.getApellidos()%></td>                                                           
                                <td><%=persona.getDui()%></td>                                                           
                                <td>                                    
                                    <a onclick="obtenerPorId(<%=persona.getIdPersona()%>)" href="#">A</a>                                     
                                    <!--<a href="../catalogos.jsp?cat=1&mos=1&id=<%//= persona.getIdGerencia() %>" target="_top">Actualizar</a> -->
                                </td>
                                <td>                                    
                                                                       
                                </td>
                                
                            </tr>
                            <%  }
                            }%>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
