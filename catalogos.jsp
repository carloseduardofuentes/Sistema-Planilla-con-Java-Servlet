<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Selecci&oacute;n y Contrataci&oacute;n de Personal</title>
<script language="javascript" src="scripts/validacat.js"></script>
<%@include file="css-javascript.jsp"%>
</head>

<body>
<div id="encabezado">Control de Personal y Planilla</div>
<div id="menu"><jsp:include page="menu.jsp"/></div>
<div id="titulo">Mantenimiento de Cat&aacute;logos<img src="imgs/separador.gif" width="750" height="15" /></div>
<div id="contenido">
<%
// Leo los parámetros enviados
String vlcatalogo  = request.getParameter("cat");
String vlagregar   = request.getParameter("agr");
String vlmodificar = request.getParameter("mod");
String vlmostrar   = request.getParameter("mos");

// Si no se ha elegido un catálogo, entonces no mostrar nada
if (vlcatalogo != null) {
	// Dependiendo del catálogo elegido, mostramos el formulario de agregar
    
    if(Integer.parseInt(vlcatalogo)==1)
       {
        %><%@ include file="formularios/afpFrm.jsp" %><%
       }

       else if(Integer.parseInt(vlcatalogo)==2)
       {
        %><%@ include file="formularios/puestoFrm.jsp" %><%
       }
       
        else if(Integer.parseInt(vlcatalogo)==3)
       {
        %><%@ include file="formularios/nivelFrm.jsp" %><%
       }
    
       else if(Integer.parseInt(vlcatalogo)==4)
       {
        %><%@ include file="formularios/bancoFrm.jsp" %><%
       }
    
       else if(Integer.parseInt(vlcatalogo)==6)
       {
        %><%@ include file="formularios/gerenciaFrm.jsp" %><%
       }
    
       else if(Integer.parseInt(vlcatalogo)==7)
       {
        %><%@ include file="formularios/departamentoFrm.jsp" %><%
       }
        else if(Integer.parseInt(vlcatalogo)==8)
       {
        %><%@ include file="formularios/paisFrm.jsp" %><%
       }
       else if(Integer.parseInt(vlcatalogo)==9)
       {
        %><%@ include file="formularios/tipopermisoFrm.jsp" %><%
       }
        else if(Integer.parseInt(vlcatalogo)==10)
       {
        %><%@ include file="formularios/tipoingresoFrm.jsp" %><%
       }
       else if(Integer.parseInt(vlcatalogo)==11)
       {
        %><%@ include file="formularios/tipodescuentoFrm.jsp" %><%
       }
    
	/*switch (Integer.parseInt(vlcatalogo)) {
				
                case 7:
				
	} // Fin de switch
        */
} // Fin de mostrar datos según el catálgo elegido
%>
</div>
<div id="pie">ACOPES DE R.L.</div>
</body>
</html>
