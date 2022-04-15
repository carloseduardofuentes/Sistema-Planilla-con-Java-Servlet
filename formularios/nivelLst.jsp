<%-- 
    Document   : index
    Created on : 25-jul-2012, 15:06:33
    Author     : GC
--%>

<%@page import="Bean.NivelBean"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/default.css">
        <title>AFP</title>
        <script language="javascript" src="../scripts/default.js"></script>
        <script type="text/javascript">
            function nuevo(){
                document.location = "../catalogos.jsp?cat=3&amp;agr=1";
            }
            
            function buscar(){
                var nombre = document.getElementById("txtNombre").value;
                document.frmLst.action = "../NivelServlet?accion=buscar&nombre=" + nombre;
                document.frmLst.submit();
            }
            
            function obtenerPorId(id){
                document.frmLst.action = "../NivelServlet?accion=obtenerPorId&id=" + id;
                document.frmLst.submit();
            }
            
            function eliminar(id){
                document.frmLst.action = "../NivelServlet?accion=eliminar&id=" + id;
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
                    <td>Nombre:</td>
                    <td colspan="2"><input type="text" id="txtNombre" size="50" /></td>
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
                            <td width="50%" bgcolor="#EBEBEB">Nombre</td>                            
                            <td width="10%" align="center" bgcolor="#EBEBEB">Modificar</td>
                            <td width="10%" align="center" bgcolor="#EBEBEB">Eliminar</td>
                          </tr>
                            <%if(session.getAttribute("listaNivel") != null){
                                List<NivelBean> lstNivel = (List<NivelBean>)session.
                                        getAttribute("listaNivel");
                                for(int i=0; i < lstNivel.size(); i++){
                                    NivelBean nivel = lstNivel.get(i);
                            %>
                            <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
                                <td><%=nivel.getIdNivel()%></td>
                                <td><%=nivel.getNombre()%></td>                                                           
                                <td>                                    
                                    <a onclick="obtenerPorId(<%=nivel.getIdNivel()%>)" href="#">A</a>                                     
                                    <!--<a href="../catalogos.jsp?cat=1&mos=1&id=<%//= nivel.getIdGerencia() %>" target="_top">Actualizar</a> -->
                                </td>
                                <td>                                    
                                    <a onclick="eliminar(<%=nivel.getIdNivel()%>)" href="#">E</a>                                    
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
