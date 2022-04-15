<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="Utilidades.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%    
    Conexion con;
    Connection cn;
    ResultSet rs;
    PreparedStatement ps;
    CallableStatement cs;
    String sql;
    int flgOperacion = 0;
        
   int mes = Integer.parseInt(request.getParameter("mes") == null ? "0" : 
                request.getParameter("mes"));   
    int anio = Integer.parseInt(request.getParameter("anio") == null ? "0" : 
                request.getParameter("anio"));   
    int idtipoempleado=Integer.parseInt(request.getParameter("idtipoempleado") == null ? "0" : 
                request.getParameter("idtipoempleado"));   
    int periodo=Integer.parseInt(request.getParameter("periodo") == null ? "0" : 
                request.getParameter("periodo"));
    
    %>
    
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/default.css">
        <title>Planilla</title>
        <script language="javascript" src="scripts/default.js"></script>
        <script type="text/javascript">         
           
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
                        <table width="95%" border="0">
                            <tr>                
                            <td width="10%" bgcolor="#EBEBEB">Id</td>    
                            <td width="10%" bgcolor="#EBEBEB">Cuenta Bancaria</td>                            
                            <td width="10%" bgcolor="#EBEBEB">Fecha Ingreso</td>                            
                            <td width="15%" bgcolor="#EBEBEB">Nombre Empleado</td>                            
                            <td width="15%" bgcolor="#EBEBEB">DUI</td>                            
                            <td width="15%" bgcolor="#EBEBEB">AFP</td>                            
                            <td width="15%" bgcolor="#EBEBEB">SALARIO</td>                            
                            <td width="15%" bgcolor="#EBEBEB">SALARIO DIARIO</td>                            
                            <td width="15%" bgcolor="#EBEBEB">HORAS LABORADAS</td>                            
                            <td width="15%" bgcolor="#EBEBEB">TOTAL DIAS LABORADOS</td>                            
                            <td width="15%" bgcolor="#EBEBEB">SUELDO QUINCENAL</td>                           
                            <td width="15%" bgcolor="#EBEBEB">ISSS</td>                            
                            <td width="15%" bgcolor="#EBEBEB">AFP</td>                            
                            <td width="15%" bgcolor="#EBEBEB">ORDEN DE DESCUENTO BANCO</td>                            
                            <td width="15%" bgcolor="#EBEBEB">PROCURADURIA</td>                            
                            <td width="15%" bgcolor="#EBEBEB">CUOTA PRESTAMO</td>                            
                            <td width="15%" bgcolor="#EBEBEB">TOTAL DESCUENTO</td>                            
                            <td width="15%" bgcolor="#EBEBEB">LIQUIDO</td>                                                        
                          </tr>
                            <%
                             //logger.info("buscar");
                    //        sql = "select idafp, nombre, "
                    //                + "porcentajelaboral, porcentajepatronal "
                    //                + "from afp "
                    //                + "where nombre like '%" + Nombre + "%'";  
                            sql = "EXEC SP_GENERAR_PLANILLA ?,?,?";

                           // try{
                                con = new Conexion();
                                cn = con.getConexion();
                                cn.setAutoCommit(false);
                                ps = cn.prepareStatement(sql);
                                ps.setInt(1, mes);            
                                ps.setInt(2, anio); 
                                ps.setInt(3, idtipoempleado); 
                                rs = ps.executeQuery();
                                
                                while(rs.next()){                                    
                                    int idpersona=rs.getInt("idpersona");
                                    String cuentabancaria=rs.getString("cuentabancaria");
                                    String fechaingreso= rs.getString("fechaingreso");
                                    String nombreempleado= rs.getString("nombreempleado");
                                    String dui= rs.getString("dui");
                                    String afpnombre= rs.getString("afpnombre");
                                    String salario= rs.getString("salario");
                                    String salariodiario= rs.getString("salariodiario");
                                    String horaslaborales= rs.getString("horaslaborales");
                                    String totaldiaslaborados= rs.getString("totaldiaslaborados");
                                    String sueldoquincenal= rs.getString("sueldoquincenal");
                                    String isss= rs.getString("isss");
                                    String afp= rs.getString("afp");
                                    String cuotaprestamo= rs.getString("cuotaprestamo");
                                    String ordendescuentobanco= rs.getString("Orden de descuento Banco");
                                    String procuraduria= rs.getString("Procuraduria");
                                    String totaldescuento= rs.getString("totaldescuento");
                                    String liquido= rs.getString("liquido");                                    
                                    
                            %>
                            <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
                                <td><%=idpersona%></td>
                                <td><%=cuentabancaria%></td>                                                           
                                <td><%=fechaingreso%></td>                                                           
                                <td><%=nombreempleado%></td> 
                                <td><%=dui%></td> 
                                <td><%=afpnombre%></td> 
                                <td><%=salario%></td> 
                                <td><%=salariodiario%></td> 
                                <td><%=horaslaborales%></td> 
                                <td><%=totaldiaslaborados%></td> 
                                <td><%=sueldoquincenal%></td> 
                                <td><%=isss%></td> 
                                <td><%=afp%></td> 
                                <td><%=ordendescuentobanco%></td> 
                                <td><%=procuraduria%></td> 
                                <td><%=cuotaprestamo%></td> 
                                <td><%=totaldescuento%></td> 
                                <td><%=liquido%></td> 
                                <td>                                    
                                   
                                </td>
                                <td>                                    
                                   
                                </td>
                                
                            </tr>
                            <%  
                                }
                                //catch(Exception e){
                                //System.out.print(e.toString());
                                //}
                            %>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
