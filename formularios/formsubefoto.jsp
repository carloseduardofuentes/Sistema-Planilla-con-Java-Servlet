<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="../conexiones/personal.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Selecci&oacute;n y Contrataci&oacute;n de Personal</title>
<link rel="stylesheet" type="text/css" href="../estilos/default.css">
</head>

<body>
<div id="encabezado">Selecci&oacute;n y Contrataci&oacute;n de Personal</div>
<div id="menu"><jsp:include page="../menu.jsp"/></div>
<div id="titulo">Administraci&oacute;n de Personal<img src="../imgs/separador.gif" width="750" height="15" /></div>
<div id="contenido">
<%
// Tomo el id de la persona
String vlidsesion  = request.getParameter("id");
session.setAttribute("id",vlidsesion);
int vlid = Integer.parseInt(request.getParameter("id"));
// Tomo el nombre de la persona
// Creo la sentencia SQL
String sql = "select APELLIDOS || ', ' || NOMBRES as NOMBRE from PERSONAS where PERSONAID=?";
PreparedStatement pstm = con.prepareStatement(sql);
pstm.setInt(1, vlid);
// Realizo la consulta
ResultSet rs = pstm.executeQuery();
// Tomo el valor del parámetro
rs.next();
%>
  <table width="100%" border="0">
    <tr>
      <td align="center" bgcolor="#CCD8E6"><strong>Subiendo / Modificando Fotograf&iacute;a e Imagen de Firma</strong></td>
    </tr>
    <tr>
      <td><table width="80%" border="0" align="center" class="borde">
        <tr>
          <td colspan="2" align="center" bgcolor="#F0F0F0"><strong><%= rs.getString(1) %></strong></td>
        </tr>
        <tr>
          <td width="50%">&nbsp;</td>
          <td width="50%">&nbsp;</td>
        </tr>
        <tr>
          <td><form action="../procesos/subefoto.jsp" method="post" enctype="multipart/form-data" name="foto" id="foto" style="margin:0px;">
            <table width="100%" border="0" class="borde">
              <tr>
                <td align="center" bgcolor="#F0F0F0">Fotograf&iacute;a</td>
              </tr>
              <tr>
                <td align="center"><input name="foto" type="file" class="fuente11" id="foto" size="30" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center"><input name="Submit" type="submit" class="fuente11" value="Subir Foto" /></td>
              </tr>
            </table>
            </form>          </td>
          <td><form action="../procesos/subefirma.jsp" method="post" enctype="multipart/form-data" name="firma" id="firma" style="margin:0px;">
            <table width="100%" border="0" class="borde">
              <tr>
                <td align="center" bgcolor="#F0F0F0">Firma</td>
              </tr>
              <tr>
                <td align="center"><input name="firma" type="file" class="fuente11" id="firma" size="30" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center"><input name="Submit2" type="submit" class="fuente11" value="Subir Firma" /></td>
              </tr>
            </table>
            </form>          </td>
        </tr>
        <tr>
          <td colspan="2" align="center"><input name="cancelar" type="submit" class="fuente11" id="cancelar" value="Cancelar" onclick="history.go(-1);" /></td>
          </tr>
      </table></td>
    </tr>
  </table>
</div>
<div id="pie">Universidad de El Salvador - 2006</div>
</body>
</html>
