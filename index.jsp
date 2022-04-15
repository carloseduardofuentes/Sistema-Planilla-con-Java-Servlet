<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Selecci&oacute;n y Contrataci&oacute;n de Personal</title>
<link rel="stylesheet" type="text/css" href="./css/default.css">
<script language="javascript" src="./scripts/default.js"></script>
</head>

<body>
<div id="encabezado">Control de Personal y Planilla</div>
<div id="menu"><jsp:include page="menu.jsp"/></div>
<div id="titulo">Control de Personal y Planilla<img src="imgs/separador.gif" width="750" height="15" /></div>
<div id="contenido">   
    
    <table width="331"  border="0" align="center" class="borde">
  <tr>
    <th width="61" rowspan="2" scope="row"><img src="imgs/support.png" width="50" height="50"></th>
    <th width="120" scope="row"><span class="Error style1">Codigo de Usuario </span></th>
    <td width="128"><span class="Error">&nbsp; 001</span></td>
  </tr>
  <tr>
    <th scope="row"><span class="Error style1">Fecha Actual </span></th>
    <td><span class="Error">&nbsp; 02/01/2013</span></td>
  </tr>
</table>
<table width="80%" border="0" align="center">
  <tr>
    <td height="26" colspan="4">&nbsp;</td>
  </tr>
  <tr>
    <td width="66" align="center">&nbsp;</td>
    <td width="134" height="150" align="center">
	<table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="persona.jsp"><img src="imgs/persona.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="./persona.jsp">Empleados</a></td>
        </tr>
      </table>	
	</td>
     <td width="142" align="center">
	 <table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="./prestamo.jsp"><img src="imgs/habilidad.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="./prestamo.jsp">Prestamos</a></td>
        </tr>
      </table>
	</td>
    
     <td width="142" align="center">
	 <table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="./permiso.jsp"><img src="imgs/habilidad.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="./permiso.jsp">Permisos</a></td>
        </tr>
      </table>
	</td>
   
  </tr>
  <tr>
      <td width="66" align="center">&nbsp;</td>  
      <td width="134" height="150" align="center">
	<table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="descuento.jsp"><img src="imgs/admin.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="./descuento.jsp">Agregar Descuentos</a></td>
        </tr>
      </table>	
	</td>
        <td width="142" align="center">
	  <table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="./ingreso.jsp"><img src="imgs/admin.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="./ingreso.jsp">Agregar Ingresos</a></td>
        </tr>
      </table>
	  </td>        
        <td width="142" align="center">
	  <table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="admin.jsp"><img src="imgs/admin.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="admin.jsp">Administraci&oacute;n</a></td>
        </tr>
      </table>
	  </td>      
           
  </tr>
  <tr>
    <td width="66" align="center">&nbsp;</td>  
    <td width="134" height="150" align="center">
	
    </td>
    <td width="134" height="150" align="center">
	<table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="generarplanilla.jsp"><img src="imgs/seleccion.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="./generarplanilla.jsp">Generar Planilla</a></td>
        </tr>
      </table>	
    </td>
    <td width="134" height="150" align="center">
	
    </td>
  </tr>
</table>
</div>
<div id="pie">ACOPES DE R.L.</div>
</body>
</html>
