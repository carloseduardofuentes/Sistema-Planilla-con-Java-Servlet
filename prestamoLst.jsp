<%-- 
    Document   : index
    Created on : 25-jul-2012, 15:06:33
    Author     : GC
--%>
<%   
    String idsolicitante = request.getParameter("idsolicitante");
 %>   
<%@page import="Bean.PrestamoBean"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/default.css">
        <title>Prestamo</title>
        <script language="javascript" src="scripts/default.js"></script>
        <script type="text/javascript">
            function nuevo(){
                document.location = "../catalogos.jsp?cat=2&amp;agr=1";
            }
           /* 
            function buscar(){
                var nombres = document.getElementById("txtNombres").value;
                var apellidos = document.getElementById("txtApellidos").value;
                var dui = document.getElementById("txtDui").value;
                document.frmLst.action = "PrestamoServlet?accion=buscar&nombres=" + nombres + "&apellidos=" + apellidos + "&dui=" + dui;
                document.frmLst.submit();
            }
            */
            function obtenerPorId(id, idsolicitante){
                document.frmLst.action = "PrestamoServlet?accion=obtenerPorId&id=" + id + "&idsolicitante=" + idsolicitante;
                document.frmLst.submit();
            }
            
            function eliminar(id){
                document.frmLst.action = "PrestamoServlet?accion=eliminar&id=" + id;
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
                <!--tr>
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
                </tr-->
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
                            <td width="25%" bgcolor="#EBEBEB">Fecha Otorgamiento</td>                            
                            <td width="25%" bgcolor="#EBEBEB">Monto</td>                            
                            <td width="15%" bgcolor="#EBEBEB">Estado</td>                            
                            <td width="10%" align="center" bgcolor="#EBEBEB">Modificar</td>
                            <td width="10%" align="center" bgcolor="#EBEBEB">Eliminar</td>
                          </tr>
                            <%if(session.getAttribute("listaPrestamos") != null){
                                List<PrestamoBean> lstPrestamos = (List<PrestamoBean>)session.
                                        getAttribute("listaPrestamos");
                                for(int i=0; i < lstPrestamos.size(); i++){
                                    PrestamoBean prestamo = lstPrestamos.get(i);
                            %>
                            <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
                                <td><%=prestamo.getIdPrestamo()%></td>
                                <td><%=prestamo.getFecha()%></td>                                                           
                                <td><%=prestamo.getMonto()%></td>                                                           
                                <td><%=prestamo.getEstadoPrestamo()%></td>                                                           
                                <td>                                    
                                    <a onclick="obtenerPorId(<%=prestamo.getIdPrestamo()%>, <%=idsolicitante%>)" href="#">A</a>                                     
                                    <!--<a href="../catalogos.jsp?cat=1&mos=1&id=<%//= prestamo.getIdGerencia() %>" target="_top">Actualizar</a> -->
                                </td>
                                <td>                                    
                                    <a onclick="eliminar(<%=prestamo.getIdPrestamo()%>)" href="#">E</a>                                    
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
