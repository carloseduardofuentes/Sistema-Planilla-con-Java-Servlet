<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="conexiones/personal.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Selecci&oacute;n y Contrataci&oacute;n de Personal</title>
<link rel="stylesheet" type="text/css" href="estilos/default.css">
<script language="javascript" src="scripts/validapuesto.js"></script>
</head>

<body>
<div id="encabezado">Selecci&oacute;n y Contrataci&oacute;n de Personal</div>
<div id="menu"><jsp:include page="menu.jsp"/></div>
<div id="titulo">Mantenimiento de Puestos<img src="imgs/separador.gif" width="750" height="15" /></div>
<div id="contenido">
  <table width="100%" border="0">
  	<tr>
      <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Puestos</strong></td>
  	</tr>
    <tr>
      <td width="81%"></td>
      <td width="19%"></td>
	</tr>
<%
// Leo los parámetros enviados
String vlagregar   = request.getParameter("agr");
String vlmodificar = request.getParameter("mod");
String vlmostrar   = request.getParameter("mos");
// Vemos si mostramos el listado de puestos
if ((vlagregar == null) && (vlmodificar == null)) {
%>
    <tr>
      <td><iframe src="formularios/listapuestos.jsp" name="listado" width="600" height="150" marginheight="0" frameborder="0" class="borde"></iframe></td>
      <td align="center" valign="bottom">[ <a href="puestos.jsp?agr=1" class="menu">Agregar</a> ]</td>
    </tr>
<%
} // fin de mostrar listado de puestos
%>
    <tr>
      <td colspan="2">
<%
// Vemos si mostramos el formulario de agregar
if (vlagregar != null) {
%>
	<form id="agregar" name="agregar" method="post" action="procesos/puestos.jsp" style="margin: 0px;" onSubmit="return valida5(this);">
	<table width="75%" border="0" align="center" class="borde">
      <tr>
        <td colspan="6" align="center" bgcolor="#CCD8E6"><strong>Agregando nuevo Puesto</strong></td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="2%">&nbsp;</td>
        <td width="21%">Nombre</td>
        <td colspan="3">
          <input name="nombre" type="text" class="fuente11" id="nombre" size="50" maxlength="40" />        </td>
        <td width="2%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Departamento</td>
        <td colspan="3"><select name="departamento" class="fuente11" id="departamento">
          <option value="0" selected="selected">Elegir Departamento</option>
<%
		// Preparo la sentencia para mostrar departamentos
		String sqld = "select * from DEPARTAMENTOS order by NOMBRE";
		PreparedStatement pstmd = con.prepareStatement(sqld);
		// Realizo la consulta
		ResultSet rsd = pstmd.executeQuery();
		// Muestro las gerencias si hay
		while (rsd.next()){
			int    vlid     = rsd.getInt(1);
			String vlnombre = rsd.getString(3);
%>
          <option value="<%= vlid %>"><%= vlnombre %></option>
<%
		} // fin de mostrar departamentos
%>
                </select></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Tipo</td>
        <td colspan="3"><select name="tipopuesto" class="fuente11" id="tipopuesto">
          <option value="0" selected="selected">Elegir Tipo de Puesto</option>
          <%
		// Preparo la sentencia para mostrar tipos de puestos
		String sqlt = "select * from TIPOPUESTO order by NOMBRE";
		PreparedStatement pstmt = con.prepareStatement(sqlt);
		// Realizo la consulta
		ResultSet rst = pstmt.executeQuery();
		// Muestro las gerencias si hay
		while (rst.next()){
			int    vlid     = rst.getInt(1);
			String vlnombre = rst.getString(2);
%>
          <option value="<%= vlid %>"><%= vlnombre %></option>
<%
		} // fin de mostrar tipos de puesto
%>
                </select></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Horario</td>
        <td colspan="3"><select name="horario" class="fuente11" id="horario">
          <option value="0" selected="selected">Elegir Horario</option>
<%
		// Preparo la sentencia para mostrar horarios
		String sqlh = "select * from HORARIOS order by NOMBRE";
		PreparedStatement pstmh = con.prepareStatement(sqlh);
		// Realizo la consulta
		ResultSet rsh = pstmh.executeQuery();
		// Muestro las gerencias si hay
		while (rsh.next()){
			int    vlid     = rsh.getInt(1);
			String vlnombre = rsh.getString(2);
%>
          <option value="<%= vlid %>"><%= vlnombre %></option>
<%
		} // fin de mostrar horarios
%>
                                </select></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Salario Base </td>
        <td width="18%"><input name="salariobase" type="text" class="fuente11der" id="salariobase" size="10" /></td>
        <td width="25%" align="center">Salario M&aacute;ximo</td>
        <td width="32%"><input name="salariomax" type="text" class="fuente11der" id="salariomax" size="10" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td align="center" valign="top" bgcolor="#CCD8E6"><strong>Perfil</strong></td>
        <td colspan="3" class="bordeinferior">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Nivel de Estudio </td>
        <td colspan="2"><select name="nivel" class="fuente11" id="nivel">
          <option value="0" selected="selected">Elegir Nivel de Estudio</option>
<%
		// Preparo la sentencia para mostrar niveles de estudio
		String sqln = "select * from NIVELESTUDIO order by NOMBRE";
		PreparedStatement pstmn = con.prepareStatement(sqln);
		// Realizo la consulta
		ResultSet rsn = pstmn.executeQuery();
		// Muestro las gerencias si hay
		while (rsn.next()){
			int    vlid     = rsn.getInt(1);
			String vlnombre = rsn.getString(2);
%>
          <option value="<%= vlid %>"><%= vlnombre %></option>
<%
		} // fin de mostrar niveles de estudio
%>
                </select>        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Experiencia</td>
        <td><input name="experiencia" type="text" class="fuente11der" id="experiencia" size="10" maxlength="2" /></td>
        <td>(a&ntilde;os)</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Edad m&iacute;nima </td>
        <td><input name="edadmin" type="text" class="fuente11der" id="edadmin" size="10" maxlength="2" /></td>
        <td align="center">Edad M&aacute;xima </td>
        <td><input name="edadmax" type="text" class="fuente11der" id="edadmax" size="10" maxlength="2" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Sexo</td>
        <td><select name="sexo" class="fuente11" id="sexo">
          <option value="Indiferente">Indiferente</option>
          <option value="Femenino">Femenino</option>
          <option value="Masculino">Masculino</option>
        </select>        </td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="6" align="center" bgcolor="#CCD8E6"><input name="Submit" type="submit" class="fuente11" value="Agregar" />
          <input name="tipo" type="hidden" id="tipo" value="1" /></td>
        </tr>
    </table>
	</form>
    <input name="regresar" type="submit" class="fuente11" id="regresar" value="Regresar" onclick="history.go(-1);" />
    <%
} // Fin de mostrar formulario de agregar
%></td>
    </tr>
    <tr>
      <td colspan="2">
<%
// Vemos si mostramos el formulario de modificar
if (vlmodificar != null) {
	// Tomo el id
	int vlid = Integer.parseInt(request.getParameter("id"));
	// Creo la sentencia SQL
	String sql = "select * from PUESTOS where PUESTOID=?";
	PreparedStatement pstm = con.prepareStatement(sql);
	pstm.setInt(1, vlid);
	// Realizo la consulta
	ResultSet rs = pstm.executeQuery();
	// Tomo los datos
	rs.next();
	int    vldepartamento = rs.getInt(2);
	int    vlhorario      = rs.getInt(3);
	int    vlnivel        = rs.getInt(4);
	int    vltipopuesto   = rs.getInt(5);
	String vlnombre       = rs.getString(6);
	double vlsalariobase  = rs.getDouble(7);
	double vlsalariomax   = rs.getDouble(8);
	int    vlexperiencia  = rs.getInt(9);
	int    vledadmin      = rs.getInt(10);
	int    vledadmax      = rs.getInt(11);
	String vlsexo         = rs.getString(12);
%>
	<form id="modificar" name="modificar" method="post" action="procesos/puestos.jsp" style="margin: 0px;" onSubmit="return valida5(this);">
	<table width="75%" border="0" align="center" class="borde">
      <tr>
        <td colspan="6" align="center" bgcolor="#CCD8E6"><strong>Modificando Puesto</strong></td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="2%">&nbsp;</td>
        <td width="21%">Nombre</td>
        <td colspan="3">
          <input name="nombre" type="text" class="fuente11" id="nombre" value="<%= vlnombre %>" size="50" maxlength="40" />        </td>
        <td width="2%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Departamento</td>
        <td colspan="3"><select name="departamento" class="fuente11" id="departamento">
<%
		// Preparo la sentencia para mostrar departamentos
		String sqlmd = "select * from DEPARTAMENTOS order by NOMBRE";
		PreparedStatement pstmmd = con.prepareStatement(sqlmd);
		// Realizo la consulta
		ResultSet rsmd = pstmmd.executeQuery();
		// Muestro las gerencias si hay
		while (rsmd.next()){
			int    vlidm     = rsmd.getInt(1);
			String vlnombrem = rsmd.getString(3);
%>
          <option value="<%= vlidm %>" <% if (vldepartamento==vlidm) { %>selected="selected"<% } %>><%= vlnombrem %></option>
<%
		} // fin de mostrar departamentos
%>
                </select></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Tipo</td>
        <td colspan="3"><select name="tipopuesto" class="fuente11" id="tipopuesto">
          <%
		// Preparo la sentencia para mostrar tipos de puestos
		String sqlmt = "select * from TIPOPUESTO order by NOMBRE";
		PreparedStatement pstmmt = con.prepareStatement(sqlmt);
		// Realizo la consulta
		ResultSet rsmt = pstmmt.executeQuery();
		// Muestro las gerencias si hay
		while (rsmt.next()){
			int    vlidm     = rsmt.getInt(1);
			String vlnombrem = rsmt.getString(2);
%>
          <option value="<%= vlidm %>" <% if (vltipopuesto==vlidm) { %>selected="selected"<% } %>><%= vlnombrem %></option>
<%
		} // fin de mostrar tipos de puesto
%>
                </select></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Horario</td>
        <td colspan="3"><select name="horario" class="fuente11" id="horario">
<%
		// Preparo la sentencia para mostrar horarios
		String sqlmh = "select * from HORARIOS order by NOMBRE";
		PreparedStatement pstmmh = con.prepareStatement(sqlmh);
		// Realizo la consulta
		ResultSet rsmh = pstmmh.executeQuery();
		// Muestro las gerencias si hay
		while (rsmh.next()){
			int    vlidm     = rsmh.getInt(1);
			String vlnombrem = rsmh.getString(2);
%>
          <option value="<%= vlidm %>" <% if (vlhorario==vlidm) { %>selected="selected"<% } %>><%= vlnombrem %></option>
<%
		} // fin de mostrar horarios
%>
                                </select></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Salario Base </td>
        <td width="18%"><input name="salariobase" type="text" class="fuente11der" id="salariobase" value="<%= vlsalariobase %>" size="10" /></td>
        <td width="25%" align="center">Salario M&aacute;ximo</td>
        <td width="32%"><input name="salariomax" type="text" class="fuente11der" id="salariomax" value="<%= vlsalariomax %>" size="10" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td align="center" valign="top" bgcolor="#CCD8E6"><strong>Perfil</strong></td>
        <td colspan="3" class="bordeinferior">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Nivel de Estudio </td>
        <td colspan="2"><select name="nivel" class="fuente11" id="nivel">
<%
		// Preparo la sentencia para mostrar niveles de estudio
		String sqlmn = "select * from NIVELESTUDIO order by NOMBRE";
		PreparedStatement pstmmn = con.prepareStatement(sqlmn);
		// Realizo la consulta
		ResultSet rsmn = pstmmn.executeQuery();
		// Muestro las gerencias si hay
		while (rsmn.next()){
			int    vlidm     = rsmn.getInt(1);
			String vlnombrem = rsmn.getString(2);
%>
          <option value="<%= vlidm %>" <% if (vlnivel==vlidm) { %>selected="selected"<% } %>><%= vlnombrem %></option>
<%
		} // fin de mostrar niveles de estudio
%>
                </select>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Experiencia</td>
        <td><input name="experiencia" type="text" class="fuente11der" id="experiencia" value="<%= vlexperiencia %>" size="10" maxlength="2" /></td>
        <td>(a&ntilde;os)</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Edad m&iacute;nima </td>
        <td><input name="edadmin" type="text" class="fuente11der" id="edadmin" value="<%= vledadmin %>" size="10" maxlength="2" /></td>
        <td align="center">Edad M&aacute;xima </td>
        <td><input name="edadmax" type="text" class="fuente11der" id="edadmax" value="<%= vledadmax %>" size="10" maxlength="2" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Sexo</td>
        <td><select name="sexo" class="fuente11" id="sexo">
          <option value="Indiferente" <% if (vlsexo.compareTo("Indiferente")==0) { %>selected="selected"<% } %>>Indiferente</option>
          <option value="Femenino" <% if (vlsexo.compareTo("Femenino")==0) { %>selected="selected"<% } %>>Femenino</option>
          <option value="Masculino" <% if (vlsexo.compareTo("Masculino")==0) { %>selected="selected"<% } %>>Masculino</option>
        </select>        </td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="6" align="center" bgcolor="#CCD8E6"><input name="Submit" type="submit" class="fuente11" value="Modificar" />
          <input name="tipo" type="hidden" id="tipo" value="2" />
          <input name="id" type="hidden" id="id" value="<%= vlid %>" /></td>
        </tr>
    </table>
	</form>
    <input name="regresar" type="submit" class="fuente11" id="regresar" value="Regresar" onclick="history.go(-1);" />
<%
} // Fin de mostrar formulario de modificar
%></td>
    </tr>
    <tr>
      <td colspan="2">
<%
// Vemos si mostramos detalles de un puesto
if (vlmostrar != null) {
	// Tomo el id
	int vlid = Integer.parseInt(request.getParameter("id"));
	// Creo la sentencia SQL
	String sql = "select * from PUESTOS where PUESTOID=?";
	PreparedStatement pstm = con.prepareStatement(sql);
	pstm.setInt(1, vlid);
	// Realizo la consulta
	ResultSet rs = pstm.executeQuery();
	// Tomo los datos
	rs.next();
	int    vldepartamento = rs.getInt(2);
	int    vlhorario      = rs.getInt(3);
	int    vlnivel        = rs.getInt(4);
	int    vltipopuesto   = rs.getInt(5);
	String vlnombre       = rs.getString(6);
	double vlsalariobase  = rs.getDouble(7);
	double vlsalariomax   = rs.getDouble(8);
	int    vlexperiencia  = rs.getInt(9);
	int    vledadmin      = rs.getInt(10);
	int    vledadmax      = rs.getInt(11);
	String vlsexo         = rs.getString(12);
%>
	<table width="75%" border="0" align="center" class="borde">
      <tr>
        <td colspan="6" align="center" bgcolor="#CCD8E6"><strong>Detalles de  Puesto</strong></td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="2%">&nbsp;</td>
        <td width="21%">Nombre</td>
        <td colspan="3" class="borde"><%= vlnombre %></td>
        <td width="2%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Departamento</td>
<%
		// Preparo la sentencia para mostrar departamentos
		String sqlvd = "select * from DEPARTAMENTOS where DEPARTAMENTOID=?";
		PreparedStatement pstmvd = con.prepareStatement(sqlvd);
		pstmvd.setInt(1, vldepartamento);
		// Realizo la consulta
		ResultSet rsvd = pstmvd.executeQuery();
		// Muestro las gerencias si hay
		rsvd.next();
%>
        <td colspan="3" class="borde"><%= rsvd.getString(3) %></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Tipo</td>
<%
		// Preparo la sentencia para mostrar tipos de puestos
		String sqlvt = "select * from TIPOPUESTO where TIPOPUESTOID=?";
		PreparedStatement pstmvt = con.prepareStatement(sqlvt);
		pstmvt.setInt(1, vltipopuesto);
		// Realizo la consulta
		ResultSet rsvt = pstmvt.executeQuery();
		// Muestro las gerencias si hay
		rsvt.next();
%>
        <td colspan="3" class="borde"><%= rsvt.getString(2) %></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Horario</td>
<%
		// Preparo la sentencia para mostrar horarios
		String sqlvh = "select * from HORARIOS where HORARIOID=?";
		PreparedStatement pstmvh = con.prepareStatement(sqlvh);
		pstmvh.setInt(1, vlhorario);
		// Realizo la consulta
		ResultSet rsvh = pstmvh.executeQuery();
		// Muestro las gerencias si hay
		rsvh.next();
%>
        <td colspan="3" class="borde"><%= rsvh.getString(2) %></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Salario Base </td>
        <td width="18%" align="right" class="borde"><%= vlsalariobase %></td>
        <td width="25%" align="center">Salario M&aacute;ximo</td>
        <td width="32%" align="center" class="borde"><%= vlsalariomax %></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td align="center" valign="top" bgcolor="#CCD8E6"><strong>Perfil</strong></td>
        <td colspan="3" class="bordeinferior">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Nivel de Estudio </td>
<%
		// Preparo la sentencia para mostrar niveles de estudio
		String sqlvn = "select * from NIVELESTUDIO where NIVELID=?";
		PreparedStatement pstmvn = con.prepareStatement(sqlvn);
		pstmvn.setInt(1, vlnivel);
		// Realizo la consulta
		ResultSet rsvn = pstmvn.executeQuery();
		// Muestro las gerencias si hay
		rsvn.next();
%>
        <td colspan="2" class="borde"><%= rsvn.getString(2) %></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Experiencia</td>
        <td align="right" class="borde"><%= vlexperiencia %></td>
        <td>(a&ntilde;os)</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Edad m&iacute;nima </td>
        <td align="right" class="borde"><%= vledadmin %></td>
        <td align="center">Edad M&aacute;xima </td>
        <td align="center" class="borde"><%= vledadmax %></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">Sexo</td>
        <td class="borde"><%= vlsexo %></td>
        <td align="center">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td colspan="2" align="center" bgcolor="#DBDBDB" class="borde">[ <a href="puestoshab.jsp?id=<%= vlid %>">Habilidades y Destrezas</a> ]</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="6" align="center" bgcolor="#CCD8E6">[ <a href="puestos.jsp?mod=1&amp;id=<%= vlid %>" class="menu">Modificar</a> ]</td>
      </tr>
    </table>
    <%
} // Fin de mostrar detalles de un puesto
%></td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
  </table>
</div>
<div id="pie">Universidad de El Salvador - 2006</div>
</body>
</html>
