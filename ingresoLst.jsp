<%-- 
    Document   : index
    Created on : 25-jul-2012, 15:06:33
    Author     : GC
--%>
<%   
    String idsolicitante = request.getParameter("idempleado");
    
    SimpleDateFormat formatoFecha = new java.text.SimpleDateFormat("dd/MM/yyyy");
 %>   
<%@page import="Bean.IngresoBean"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/default.css">
        <title>Ingresos</title>
        <script language="javascript" src="scripts/default.js"></script>
        <%@include file="css-javascript.jsp"%>
        
        <script type="text/javascript">
            function nuevo(){
                document.location = "../catalogos.jsp?cat=2&amp;agr=1";
            }
            
            function buscar(){              
                var idempleado=$("#cmbEmpleado").val();                
                document.frmLst.action = "IngresoServlet?accion=buscar2&idempleado=" + idempleado;
                document.frmLst.submit();
            }
            
            function obtenerPorId(id){
                 var idempleado=$("#cmbEmpleado").val();
                //document.frmLst.action = "PrestamoServlet?accion=buscar&idsolicitante=" + id;
                document.frmLst.action = "IngresoServlet?accion=obtenerPorId&id=" + id + "&idempleado=" + idempleado;
                document.frmLst.submit();
            }
            
             function eliminar(id){
                var idempleado=$("#cmbEmpleado").val();
                document.frmLst.action = "IngresoServlet?accion=eliminar&id=" + id + "&idempleado=" + idempleado;
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
                            <td width="10%" bgcolor="#EBEBEB">TipoIngreso</td>    
                            <td width="25%" bgcolor="#EBEBEB">Desde Fecha</td>                            
                            <td width="25%" bgcolor="#EBEBEB">Hasta Fecha</td>                            
                            <td width="15%" bgcolor="#EBEBEB">Valor</td>                            
                            <td width="10%" align="center" bgcolor="#EBEBEB">Modificar</td>
                            <td width="10%" align="center" bgcolor="#EBEBEB">Eliminar</td>
                          </tr>
                            <%if(session.getAttribute("listaIngresos") != null){
                                List<IngresoBean> lstIngresos = (List<IngresoBean>)session.
                                        getAttribute("listaIngresos");
                                for(int i=0; i < lstIngresos.size(); i++){
                                    IngresoBean ingreso = lstIngresos.get(i);
                            %>
                            <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">                                
                                <td><%=ingreso.getTipoIngreso()%></td>                                                           
                                <td><%=formatoFecha.format(ingreso.getFechaDesde())%></td>                                                           
                                <td><%=formatoFecha.format(ingreso.getFechaHasta())%></td>                                                  
                                <td><%=ingreso.getValor()%></td>
                                <td>                                    
                                    <a onclick="obtenerPorId(<%=ingreso.getIdIngreso()%>)" href="#">A</a>                                     
                                    <!--<a href="../catalogos.jsp?cat=1&mos=1&id=<%//= ingreso.getIdGerencia() %>" target="_top">Actualizar</a> -->
                                </td>
                                <td>                                    
                                    <a onclick="eliminar(<%=ingreso.getIdIngreso()%>)" href="#">E</a>                                    
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
