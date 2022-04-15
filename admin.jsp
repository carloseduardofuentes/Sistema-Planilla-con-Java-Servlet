<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Selecci&oacute;n y Contrataci&oacute;n de Personal</title>
<script language="javascript" src="scripts/default.js"></script>
<%@include file="css-javascript.jsp"%>
</head>

<body>
<div id="encabezado">Selecci&oacute;n y Contrataci&oacute;n de Personal</div>
<div id="menu"><jsp:include page="menu.jsp"/></div>
<div id="titulo">Administraci&oacute;n<img src="imgs/separador.gif" width="750" height="15" /></div>
<div id="contenido">
  <table width="80%" border="0" align="center" class="borde">
    <tr>
      <td width="25%" align="center" valign="top" bgcolor="#CCD8E6"><strong>Puestos</strong></td>
      <td colspan="3" valign="top" class="bordeinferior">&nbsp;</td>
    </tr>
    <tr>
      <td valign="top">&nbsp;</td>
      <td width="25%" valign="top">&nbsp;</td>
      <td width="25%" valign="top">&nbsp;</td>
      <td width="25%" valign="top">&nbsp;</td>
    </tr>

    <tr>
      <td>&nbsp;</td>
      <td colspan="2"><table width="100%" border="0" class="borde">
        <tr>
          <td width="50%" align="center" onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');"><a href="catalogos.jsp?cat=2"><img src="imgs/puestos.gif" width="48" height="48" border="0" /></a></td>
          <td width="50%" height="45" align="center" bgcolor="#f0f0f0"> <a href="catalogos.jsp?cat=2"> Administraci&oacute;n de Puestos</a></td>
        </tr>
      </table></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#CCD8E6"><strong>Cat&aacute;logos</strong></td>
      <td colspan="3" class="bordeinferior">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
      <tr>
      <td valign="top"><table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="catalogos.jsp?cat=3"><img src="imgs/estudio.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="catalogos.jsp?cat=3">Niveles de Estudio</a></td>
        </tr>
      </table></td>
      <td valign="top"><table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="catalogos.jsp?cat=6"><img src="imgs/gerencia.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="catalogos.jsp?cat=6">Gerencias </a></td>
        </tr>
      </table></td>
      <td valign="top"><table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="catalogos.jsp?cat=7"><img src="imgs/depto.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="catalogos.jsp?cat=7">Departamentos </a></td>
        </tr>
      </table></td>
      <td valign="top"><table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="catalogos.jsp?cat=8"><img src="imgs/habilidad.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="catalogos.jsp?cat=8">Pais</a></td>
        </tr>
      </table></td>
    </tr>
    <tr>  
      <td valign="top"><table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="catalogos.jsp?cat=1"><img src="imgs/psico.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="catalogos.jsp?cat=1">AFP</a></td>
        </tr>
      </table></td>
      <td valign="top"><table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="catalogos.jsp?cat=4"><img src="imgs/psico.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="catalogos.jsp?cat=4">Bancos</a></td>
        </tr>
      </table></td>
      <td valign="top"><table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="catalogos.jsp?cat=9"><img src="imgs/psico.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="catalogos.jsp?cat=9">Tipo Permiso</a></td>
        </tr>
      </table></td>
      <td valign="top"><table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="catalogos.jsp?cat=10"><img src="imgs/psico.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="catalogos.jsp?cat=10">Tipo Ingreso</a></td>
        </tr>
      </table></td>
    </tr>
      <tr>
          <td valign="top"><table width="100%" border="0" class="borde">
        <tr onmouseover="cambiacolor(this, '#ECE9D8');" onmouseout="cambiacolor(this, '#FFFFFF');">
          <td align="center"><a href="catalogos.jsp?cat=11"><img src="imgs/psico.gif" width="48" height="48" border="0" /></a></td>
        </tr>
        <tr>
          <td height="45" align="center" bgcolor="#F0F0F0"><a href="catalogos.jsp?cat=11">Tipo Descuento</a></td>
        </tr>
      </table></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</div>
<div id="pie">ACOPES DE R.L.</div>
</body>
</html>
