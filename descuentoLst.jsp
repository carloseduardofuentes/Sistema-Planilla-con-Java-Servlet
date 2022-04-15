<%-- 
    Document   : index
    Created on : 25-jul-2012, 15:06:33
    Author     : GC
--%>
<%   
    String idsolicitante = request.getParameter("idempleado");
    
    SimpleDateFormat formatoFecha = new java.text.SimpleDateFormat("dd/MM/yyyy");
 %>   
<%@page import="Bean.DescuentoBean"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/default.css">
        <title>Descuentos</title>
        <script language="javascript" src="scripts/default.js"></script>
        <%@include file="css-javascript.jsp"%>
        
        <script type="text/javascript">
            function nuevo(){
                document.location = "../catalogos.jsp?cat=2&amp;agr=1";
            }
            
            function buscar(){              
                var idempleado=$("#cmbEmpleado").val();                
                document.frmLst.action = "DescuentoServlet?accion=buscar2&idempleado=" + idempleado;
                document.frmLst.submit();
            }
            
            function obtenerPorId(id){
                 var idempleado=$("#cmbEmpleado").val();
                //document.frmLst.action = "PrestamoServlet?accion=buscar&idsolicitante=" + id;
                document.frmLst.action = "DescuentoServlet?accion=obtenerPorId&id=" + id + "&idempleado=" + idempleado;
                document.frmLst.submit();
            }
            
             function eliminar(id){
                var idempleado=$("#cmbEmpleado").val();
                document.frmLst.action = "DescuentoServlet?accion=eliminar&id=" + id + "&idempleado=" + idempleado;
                document.frmLst.submit();
            }
            
            var listarSolicitantes = function() {
                url = "./PersonaServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbEmpleado').html('');
                    $('#cmbEmpleado').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbEmpleado').append('<option value='+ item.idPersona+'>'+ item.nombres+'</option>');	                         
                        $("#cmbEmpleado").val(<%= idsolicitante %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
    $(function() {
    
    listarSolicitantes();
       
    });
                        
        </script>
    </head>
    <body>
        <form name="frmLst" method="post">
            <table width="95%" border="0">
                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>Empleado: </td>
                    <td>
                     <select name="cmbEmpleado" class="fuente11" id="cmbEmpleado">   
                    <option></option>
                    </select>
                    </td>
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
                            <td width="10%" bgcolor="#EBEBEB">TipoDescuento</td>    
                            <td width="25%" bgcolor="#EBEBEB">Desde Fecha</td>                            
                            <td width="25%" bgcolor="#EBEBEB">Hasta Fecha</td>                            
                            <td width="15%" bgcolor="#EBEBEB">Valor</td>                            
                            <td width="10%" align="center" bgcolor="#EBEBEB">Modificar</td>
                            <td width="10%" align="center" bgcolor="#EBEBEB">Eliminar</td>
                          </tr>
                            <%if(session.getAttribute("listaDescuentos") != null){
                                List<DescuentoBean> lstDescuentos = (List<DescuentoBean>)session.
                                        getAttribute("listaDescuentos");
                                for(int i=0; i < lstDescuentos.size(); i++){
                                    DescuentoBean descuento = lstDescuentos.get(i);
                            %>
                            <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">                                
                                <td><%=descuento.getTipoDescuento()%></td>                                                           
                                <td><%=formatoFecha.format(descuento.getFechaDesde())%></td>                                                           
                                <td><%=formatoFecha.format(descuento.getFechaHasta())%></td>                                                  
                                <td><%=descuento.getValor()%></td>
                                <td>                                    
                                    <a onclick="obtenerPorId(<%=descuento.getIdDescuento()%>)" href="#">A</a>                                     
                                    <!--<a href="../catalogos.jsp?cat=1&mos=1&id=<%//= descuento.getIdGerencia() %>" target="_top">Actualizar</a> -->
                                </td>
                                <td>                                    
                                    <a onclick="eliminar(<%=descuento.getIdDescuento()%>)" href="#">E</a>                                    
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
