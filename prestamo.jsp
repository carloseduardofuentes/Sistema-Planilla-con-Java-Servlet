<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, java.text.SimpleDateFormat" errorPage="" %>
<%@ page import="java.util.List"%>
<%@ page import="Bean.PrestamoBean"%>

 
 <%
 
    String vlagregar   = request.getParameter("agr");
    String vlmodificar = request.getParameter("mod");
    String vlmostrar   = request.getParameter("mos");
    String hoja = request.getParameter("hoja") == null ? "0" : request.getParameter("hoja");
    
    String idsolicitantepagina = request.getParameter("idsolicitante");
    idsolicitantepagina = idsolicitantepagina == null ? "0" : idsolicitantepagina;

    PrestamoBean prestamo=(PrestamoBean) session.getAttribute("PrestamoActualizar");
    prestamo = prestamo == null ? new PrestamoBean() : prestamo;
    int id= prestamo.getIdPrestamo();
    int idsolicitante= prestamo.getIdEmpleadoSolicitante();
    int idsocio= prestamo.getIdEmpleadoSocio();
    double monto= prestamo.getMonto();
    double cuota= prestamo.getCuota();
    int idestadoprestamo= prestamo.getIdEstadoPrestamo();
    double montopagado= prestamo.getMontoPagado();
    SimpleDateFormat formatoFecha = new java.text.SimpleDateFormat("dd/MM/yyyy");
    java.sql.Date fecha=null;    
    String fechaString=null;
    if (prestamo.getFecha()!= null)
        {
        fechaString=formatoFecha.format(prestamo.getFecha());
        fecha =  new java.sql.Date(formatoFecha.parse(fechaString).getTime());    
       }
    String observacion=prestamo.getObservacion() == null ? "": prestamo.getObservacion();
      
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Control de Personal y Planilla</title>
<script language="javascript" src="scripts/default.js"></script>
<script language="javascript" src="scripts/validapersona.js"></script>
<%@include file="css-javascript.jsp"%>
<script>             
             function numbersonly(e) {
                var unicode = e.charCode ? e.charCode : e.keyCode
                if (unicode != 8 && unicode != 44 && unicode !=46) {
                    if (unicode < 48 || unicode > 57)
                    { return false }
                }
            }
            
            function insertar(){
                var idsolicitante =  $("#cmbSolicitante").val();
                var idsocio =  $("#cmbSocio").val();
                var monto = document.getElementById("txtMonto").value;     
                var cuota = document.getElementById("txtCuota").value;     
                var fecha = document.getElementById("txtFecha").value;     
                var idestadoprestamo =  1;
                var montopagado=0;
                var observacion = document.getElementById("txtObservacion").value; 
                                
                if(monto == ""){
                    alert("El monto es obligatorio. Debe digitarlo.")
                }
                else if (cuota==""){
                    alert("La cuota es obligatoria. Debe digitarla.")
                }
                else if (fecha==""){
                    alert("Debe digitar la fecha de otorgamiento.")
                }
                else{
                    document.Generalesfrm.action = "./PrestamoServlet?accion=insertar" + 
                        "&idsolicitante=" + idsolicitante +
                        "&idsocio=" + idsocio + "&monto=" + monto + "&cuota=" + cuota+
                        "&fecha=" + fecha + "&idestadoprestamo=" + idestadoprestamo + "&montopagado=" + montopagado + "&observacion=" + observacion;                         
                    document.Generalesfrm.submit();                    
                }
            }
            
            
            function actualizar(id){                
                var idsolicitante =  $("#cmbSolicitante").val();
                var idsocio =  $("#cmbSocio").val();
                var monto = document.getElementById("txtMonto").value;     
                var cuota = document.getElementById("txtCuota").value;     
                var fecha = document.getElementById("txtFecha").value;  
                var idestadoprestamo =  $("#cmbEstadoPrestamo").val();
                var montopagado=document.getElementById("txtMontoPagado").value;
                var observacion = document.getElementById("txtObservacion").value;
                
                 if(monto == ""){
                    alert("El monto es obligatorio. Debe digitarlo.")
                }
                else if (cuota==""){
                    alert("La cuota es obligatoria. Debe digitarla.")
                }
                else if (fecha==""){
                    alert("Debe digitar la fecha de otorgamiento.")
                }
                else{
                    document.Generalesfrm.action = "./PrestamoServlet?accion=actualizar&id=" + id +
                        "&idsolicitante=" + idsolicitante +
                        "&idsocio=" + idsocio + "&monto=" + monto + "&cuota=" + cuota+
                        "&fecha=" + fecha + "&idestadoprestamo=" + idestadoprestamo + "&montopagado=" + montopagado + "&observacion=" + observacion;
                    document.Generalesfrm.submit();
                }
            }
            
             function cancelar(){
                document.location = "prestamo.jsp";
            }
            
                var listarSolicitantes = function() {
                url = "./PersonaServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbSolicitante').html('');
                    $('#cmbSolicitante').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbSolicitante').append('<option value='+ item.idPersona+'>'+ item.nombres+'</option>');	                         
                        $("#cmbSolicitante").val(<%= idsolicitante %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
            var listarSocios = function() {
                url = "./PersonaServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbSocio').html('');
                    $('#cmbSocio').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbSocio').append('<option value='+ item.idPersona+'>'+ item.nombres+'</option>');	                         
                         $("#cmbSocio").val(<%= idsocio %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
             var listarEstados = function() {
                url = "./EstadoPrestamoServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbEstadoPrestamo').html('');
                    $('#cmbEstadoPrestamo').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbEstadoPrestamo').append('<option value='+ item.idEstadoPrestamo+'>'+ item.nombre+'</option>');	                         
                         $("#cmbEstadoPrestamo").val(<%= idestadoprestamo %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
    $(function() {
    $( "#tabs" ).tabs();
    
    $('#tabs').tabs('select', <%=hoja%>);
    
    $("[id$=txtFecha]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
    
    listarSolicitantes();
    listarSocios();
    listarEstados();
    
            });
                        
  </script>
</head>

<body>
<div id="encabezado">Control de Personal y Planilla</div>
<div id="menu"><jsp:include page="menu.jsp"/></div>
<div id="titulo">Administraci&oacute;n de Personal<img src="imgs/separador.gif" width="750" height="15" /></div>
<div id="contenido">

<table width="100%" border="0">
    <tr>
        <td align="center" bgcolor="#CCD8E6"><strong>Agregando Prestamo</strong></td>
    </tr>        
    <tr>
      <td>              
  <div id="tabs">
  <ul>
    <li><a href="#tabs-0">Buscar Empleados</a></li>
    <li><a href="#tabs-1">Seleccionar Prestamo</a></li>
    <li><a href="#tabs-2">Datos de Prestamo</a></li>
    <li><a href="#tabs-3">Historial de Cuotas</a></li>
    
  </ul>
  <div id="tabs-0">          
    
    <table width="100%" border="0">  
    <tr>
        <td width="81%"><iframe src="PersonaServlet?accion=buscarPrestamo" name="listado" width="600" height="500" marginheight="0" frameborder="0" class="borde"></iframe></td>        
    </tr>  
    </table>
  </div>
  <div id="tabs-1">          
    
    <table width="100%" border="0">  
    <tr>
        <td width="81%"><iframe src="PrestamoServlet?accion=buscar&idsolicitante=<%=idsolicitantepagina%>" name="listado2" width="600" height="500" marginheight="0" frameborder="0" class="borde"></iframe></td>
        <td width="19%" align="center" valign="bottom">[ <a href="prestamo.jsp?agr=1&idsolicitante=<%=idsolicitantepagina%>&hoja=2" class="menu">Agregar Prestamo</a> ] </td>
    </tr>  
    </table>
  </div>
  <div id="tabs-2">
      <form id="agregar" name="Generalesfrm" method="post" style="margin:0px;" onSubmit="return valida6(this);">
      <table width="100%" border="0" align="center" class="borde">
        <tr>
          <td>&nbsp;</td>
          <td align="center" bgcolor="#CCD8E6">Datos de Prestamos</td>
          <td colspan="4" align="right" class="bordeinferior">[ <a href="personas.jsp" class="menu">Regresar</a> ]</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td colspan="7">&nbsp;</td>          
        </tr>
        <tr>          
          <td width="2%">&nbsp;</td>
          <td width="20%">Codigo</td>
          <td colspan="4"><input name="txtId" type="text" class="fuente11" id="txtId" value="<%=id%>" /></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Nombres del Solicitante</td>
          <td colspan="4">
               <select name="cmbSolicitante" class="fuente11" id="cmbSolicitante">   
               <option></option>
               </select>
          *</td>          
          <td width="2%">&nbsp;</td>
        </tr>
         <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Nombres del Socio</td>
          <td colspan="4">
               <select name="cmbSocio" class="fuente11" id="cmbSocio">   
               <option></option>
               </select>
          *</td>          
          <td width="2%">&nbsp;</td>
        </tr>
        
        <tr>
          <td>&nbsp;</td>
          <td>Fecha de Otorgamiento</td>
          <td><input name="txtFecha" type="text" class="fuente11der" id="txtFecha" size="12" value="<%= prestamo.getFecha() == null ? "" : fechaString%>"/>
              *</td>
          <td>&nbsp;</td>         
           <td>&nbsp;</td>      
           <td>&nbsp;</td>      
           <td>&nbsp;</td>
        </tr>
              
         <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Estado del Prestamo:</td>
          <td colspan="4">
               <select name="cmbEstadoPrestamo" class="fuente11" id="cmbEstadoPrestamo">   
               <option></option>
               </select>
          *</td>          
          <td width="2%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center" bgcolor="#CCD8E6">Información</td>
          <td colspan="4" class="bordeinferior">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
         <tr>
          <td colspan="7">&nbsp;</td>          
        </tr>
          <tr>
          <td>&nbsp;</td>
           <td>Monto Prestado ($)</td>
           <td>
              <input name="txtMonto" type="text" class="fuente11" id="txtMonto" value="<%=monto%>" />
             </select>
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
          <tr>
          <td>&nbsp;</td>
           <td>Cuota Mensual</td>
           <td>
              <input name="txtCuota" type="text" class="fuente11" id="txtCuota" value="<%=cuota%>" />
             </select>
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>       
       <tr>
          <td>&nbsp;</td>
           <td>Monto Pagado ($)</td>
           <td>
              <input name="txtMontoPagado" type="text" class="fuente11" id="txtMontoPagado" value="<%=montopagado%>" />
             </select>
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>       
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        
         <tr>
          <td>&nbsp;</td>
          <td>Observaci&oacute;n </td>          
           <td colspan="4">
              <textarea cols="40" rows="3" class="fuente11" name="txtObservacion" id="txtObservacion"><%=observacion%></textarea>
           </td>
          <td>&nbsp;</td>
        </tr> 
          <tr>
          <td colspan="7">&nbsp;</td>          
        </tr>
          
        <tr>
          <td>&nbsp;</td>
          <td colspan="5" align="center" bgcolor="#CCD8E6">
            
                <%if(session.getAttribute("PrestamoActualizar") == null){%>
                        ${clienteActualizar}
                                          
                        <input type="button" value="Agregar" onclick="insertar()" id="btnInsertar" />                         
                   
                        <%}else{%>
                   
                        <input type="button" value="Actualizar" onclick="actualizar(<%=prestamo.getIdPrestamo()%>)" 
                               id="btnActualizar" />                        
                   
                <%}%>
            
             <input name="tipo" type="hidden" id="tipo" value="1" />
          </td>
            
          <td>&nbsp;</td>
        </tr>
      </table>
      </form>
  </div>

   <div id="tabs-3">
   <table width="100%" border="0">
    <tr>
      <td align="center" bgcolor="#CCD8E6"><strong>Historial de Cuotas pagadas</strong></td>
    </tr>
   <tr>
      <td><form id="agregar" name="agregar" method="post" action="procesos/personar.jsp" style="margin:0px;" onSubmit="return valida9(this);">
        <table width="60%" border="0" align="center" class="borde">
          <tr>
            <td colspan="4" align="center" bgcolor="#F0F0F0"><strong><%//= rs.getString(1) %></strong></td>
            </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td width="25%">Codigo de Cuota</td>
            <td width="69%"><input name="nombres" type="text" class="fuente11" id="nombres" size="30" />
            *</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Fecha:</td>
            <td><input name="apellidos" type="text" class="fuente11" id="apellidos" size="30" />
            *</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Cuota ($) :</td>
            <td><input name="referencia" type="text" class="fuente11" id="referencia" size="40" />
            *</td>
            <td>&nbsp;</td>
          </tr>
          
          <tr>
            <td>&nbsp;</td>
            <td>Observacion:</td>
            <td><input name="direccion1" type="text" class="fuente11" id="direccion1" size="40" />
            *</td>
            <td>&nbsp;</td>
          </tr>
          
          <tr>
            <td colspan="4" align="center" bgcolor="#CCD8E6"><input name="Submit" type="submit" class="fuente11" value="Agregar" />
              <input name="tipo" type="hidden" id="tipo" value="1" />
              <input name="id" type="hidden" id="id" value="<%//= vlid %>" /></td>
            </tr>
        </table>
            </form></td>
    </tr>
    <tr>
      <td align="right">[ <a href="personas.jsp" class="menu">Terminar</a> ] | [ <a href="personap.jsp?id=<%//= vlid %>" class="menu">Seguir con Puestos Solicitados &gt;&gt;</a> ] </td>
    </tr>
    <tr>
      <td>
	  <table width="100%" border="0" class="borde">
        <tr>
          <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Referencias</strong></td>
          <td colspan="6" class="bordeinferior">&nbsp;</td>
          </tr>
<% 
/*
// Preparo la sentencia para mostrar referencias
String sqlr = "select * from REFERENCIAS where PERSONAID=? order by REFERENCIAID";
PreparedStatement pstmr = con.prepareStatement(sqlr);
pstmr.setInt(1, vlid);
// Realizo la consulta
ResultSet rsr = pstmr.executeQuery();
// Muestro los datos si hay
while (rsr.next()){
 */
%>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td width="31%">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="10%">&nbsp;</td>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td width="4%">&nbsp;</td>
          <td width="16%">Codigo de Cuota</td>
          <td colspan="3" class="borde"><%//= rsr.getString(4) + ", " + rsr.getString(3) %></td>
          <td colspan="2">&nbsp;</td>
          <td width="2%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Fecha</td>
          <td class="borde"><%//= rsr.getString(5) %></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td width="17%" align="center">&nbsp;</td>
          <td width="18%">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Cuota</td>
          <td colspan="4" class="borde"><%//= rsr.getString(6) %></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Observacion</td>
          <td class="borde"><%//= rsr.getString(8) %></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td colspan="3" align="center" bgcolor="#f0f0f0" class="borde">[ <a href="personar.jsp?mod=1&amp;id=<%//= vlid %>&amp;ide=<%//= rsr.getInt(1) %>" class="menu">Modificar</a> ] | [ <a href="procesos/eliminaper.jsp?id=<%//= vlid %>&amp;ide=<%//= rsr.getInt(1) %>" class="menu">Eliminar</a> ]</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td colspan="8" class="bordeinferior">&nbsp;</td>
          </tr>
<%
//} // fin de mostrar referencias
%>
      </table>
	  </td>
    </tr>
  </table>
  </div>
</div>
      </td>
    </tr>
  </table>

</div>
        
</div>
      </td>
    </tr>
  </table>

</div>
<div id="pie">ACOPES DE R.L.</div>
</body>
</html>
