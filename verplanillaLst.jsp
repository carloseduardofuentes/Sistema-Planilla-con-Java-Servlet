<%-- 
    Document   : index
    Created on : 25-jul-2012, 15:06:33
    Author     : GC
--%>
<%   
   int mes = Integer.parseInt(request.getParameter("mes") == null ? "0" : 
                request.getParameter("mes"));   
    int anio = Integer.parseInt(request.getParameter("anio") == null ? "0" : 
                request.getParameter("anio"));   
    int idtipoempleado=Integer.parseInt(request.getParameter("idtipoempleado") == null ? "0" : 
                request.getParameter("idtipoempleado"));   
    int periodo=Integer.parseInt(request.getParameter("periodo") == null ? "0" : 
                request.getParameter("periodo"));
    
    
 %>   
<%@page import="Bean.PlanillaBean"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/default.css">
        <title>Planilla</title>
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
                      
            
    $(function() {
    
    
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
                            <td width="10%" bgcolor="#EBEBEB">IDPERSONA</td>                                                                                   
                            <td width="10%" bgcolor="#EBEBEB">NOMBRES</td>                            
                            <td width="10%" bgcolor="#EBEBEB">APELLIDOS</td>                                                        
                            <td width="10%" bgcolor="#EBEBEB">DUI</td>                            
                            <td width="10%" bgcolor="#EBEBEB">CUENTA BANCARIA</td>                            
                            <td width="10%" bgcolor="#EBEBEB">FECHA DE INGRESO</td> 
                            <td width="10%" bgcolor="#EBEBEB">AFP</td>                            
                            <td width="10%" bgcolor="#EBEBEB">SALARIO</td>                            
                            <td width="10%" bgcolor="#EBEBEB">SALARIO DIARIO</td>                            
                            <td width="10%" bgcolor="#EBEBEB">HORAS LABORADAS</td>  
                            <td width="10%" bgcolor="#EBEBEB">DIAS DE PERMISOS</td>  
                            <td width="10%" bgcolor="#EBEBEB">TOTAL DIAS LABORADOS</td>                            
                            <td width="10%" bgcolor="#EBEBEB">SUELDO REAL</td>                           
                            <td width="10%" bgcolor="#EBEBEB">ISSS</td>                            
                            <td width="10%" bgcolor="#EBEBEB">AFP</td>                                                        
                            <td width="10%" bgcolor="#EBEBEB">CUOTA PRESTAMO</td>   
                            <td width="10%" bgcolor="#EBEBEB">OTROS DESCUENTOS</td>   
                            <td width="10%" bgcolor="#EBEBEB">TOTAL DESCUENTO</td>                            
                            <td width="10%" bgcolor="#EBEBEB">LIQUIDO</td>          
                          </tr>
                            <%if(session.getAttribute("listaPlanilla") != null){
                                List<PlanillaBean> lstPlanillas = (List<PlanillaBean>)session.
                                        getAttribute("listaPlanilla");
                                for(int i=0; i < lstPlanillas.size(); i++){
                                    PlanillaBean planilla = lstPlanillas.get(i);
                            %>
                            <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">                                
                                <td><%=planilla.getIdplanilla()%></td>                                                           
                                <td><%=planilla.getIdpersona()%></td>                                                           
                                <td><%=planilla.getNombres()%></td>                                                  
                                <td><%=planilla.getApellidos()%></td>
                                <!--td>                                    
                                    <a onclick="obtenerPorId(<%//=planilla.getIdDescuento()%>)" href="#">A</a>                                                                         
                                </td-->
                               
                                
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
