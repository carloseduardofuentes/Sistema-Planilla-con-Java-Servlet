<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, java.text.SimpleDateFormat" errorPage="" %>
<%@ page import="java.util.List"%>
<%@ page import="Bean.PermisoBean"%>

 
 <%
 
    String vlagregar   = request.getParameter("agr");
    String vlmodificar = request.getParameter("mod");
    String vlmostrar   = request.getParameter("mos");
    String hoja = request.getParameter("hoja") == null ? "0" : request.getParameter("hoja");
    
    String idsolicitantepagina = request.getParameter("idempleado");
    idsolicitantepagina = idsolicitantepagina == null ? "0" : idsolicitantepagina;

    PermisoBean permiso=(PermisoBean) session.getAttribute("PermisoActualizar");
    permiso = permiso == null ? new PermisoBean() : permiso;
    int id= permiso.getIdPermiso();
    int idempleado= permiso.getIdEmpleado();
    int idtipopermiso= permiso.getIdTipoPemiso();
    boolean justificado= permiso.isJustificado();
    boolean gocesueldo= permiso.isGoceSueldo();
    int numerohoras= permiso.getNumeroHoras();
    
    SimpleDateFormat formatoFecha = new java.text.SimpleDateFormat("dd/MM/yyyy");
    java.sql.Date fechaSalida=null;    
    String fechaSalidaString=null;
    if (permiso.getFechaSalida()!= null)
        {
        fechaSalidaString=formatoFecha.format(permiso.getFechaSalida());
        fechaSalida =  new java.sql.Date(formatoFecha.parse(fechaSalidaString).getTime());    
       }
    
    java.sql.Date fechaLlegada=null;    
    String fechaLlegadaString=null;
    if (permiso.getFechaSalida()!= null)
        {
        fechaLlegadaString=formatoFecha.format(permiso.getFechaLlegada());
        fechaLlegada =  new java.sql.Date(formatoFecha.parse(fechaLlegadaString).getTime());    
       }
    String observacion=permiso.getObservacion() == null ? "" : permiso.getObservacion();
       
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
            
            function getRadioButtonSelectedValue(ctrl)
                {
                    for(i=0;i<ctrl.length;i++)
                        if(ctrl[i].checked) return ctrl[i].value;
                }
            
            function insertar(){
                var idempleado =  $("#cmbEmpleado").val();
                var idtipopermiso =  $("#cmbTipoPermiso").val();
                 var justificado = "false";
                 if($("input[name='rdoJustificado']:checked").val()=="Si")                 
                     justificado="true";
                var gocesueldo = "false";
                if($("input[name='rdoGoceSueldo']:checked").val()=="Si")
                    gocesueldo="true";
                var fechasalida = document.getElementById("txtFechaSalida").value;     
                var fechallegada = document.getElementById("txtFechaLlegada").value;     
                var numerohoras = document.getElementById("txtNumeroHoras").value;     
                var observacion = document.getElementById("txtObservacion").value; 
                                
                if(numerohoras == ""){
                    alert("El numero de horas es obligatorio. Debe digitarlo.")
                }
                
                else if (fechasalida==""){
                    alert("Debe digitar la fecha de salida.")
                }
                
                else if (fechallegada==""){
                    alert("Debe digitar la fecha de llegada.")
                }
                
                else{
                    document.Generalesfrm.action = "./PermisoServlet?accion=insertar" + 
                        "&idempleado=" + idempleado +
                        "&idtipopermiso=" + idtipopermiso + "&justificado=" + justificado + "&gocesueldo=" + gocesueldo+
                        "&fechasalida=" + fechasalida + "&fechallegada=" + fechallegada + "&numerohoras=" + numerohoras + "&observacion=" + observacion;                         
                    document.Generalesfrm.submit();                    
                }
            }
            
            
            function actualizar(id){                
                var idempleado =  $("#cmbEmpleado").val();
                var idtipopermiso =  $("#cmbTipoPermiso").val();
             var justificado = "false";
                 if($("input[name='rdoJustificado']:checked").val()=="Si")                 
                     justificado="true";
                var gocesueldo = "false";
                if($("input[name='rdoGoceSueldo']:checked").val()=="Si")
                    gocesueldo="true";
                var fechasalida = document.getElementById("txtFechaSalida").value;     
                var fechallegada = document.getElementById("txtFechaLlegada").value;     
                var numerohoras = document.getElementById("txtNumeroHoras").value;     
                var observacion = document.getElementById("txtObservacion").value; 
                                
                if(numerohoras == ""){
                    alert("El numero de horas es obligatorio. Debe digitarlo.")
                }
                
                else if (fechasalida==""){
                    alert("Debe digitar la fecha de salida.")
                }
                
                else if (fechallegada==""){
                    alert("Debe digitar la fecha de llegada.")
                }
                else{
                    document.Generalesfrm.action = "./PermisoServlet?accion=actualizar&id=" + id +
                        "&idempleado=" + idempleado +
                        "&idtipopermiso=" + idtipopermiso + "&justificado=" + justificado + "&gocesueldo=" + gocesueldo+
                        "&fechasalida=" + fechasalida + "&fechallegada=" + fechallegada + "&numerohoras=" + numerohoras + "&observacion=" + observacion;                         
                    document.Generalesfrm.submit();
                }
            }
            
             function cancelar(){
                document.location = "permiso.jsp";
            }
            
                var listarSolicitantes = function() {
                url = "./PersonaServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbEmpleado').html('');
                    $('#cmbEmpleado').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbEmpleado').append('<option value='+ item.idPersona+'>'+ item.nombres+'</option>');	                         
                        $("#cmbEmpleado").val(<%= idempleado %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
                        
            var listarTipoPermiso = function() {
                url = "./TipoPermisoServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbTipoPermiso').html('');
                    $('#cmbTipoPermiso').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbTipoPermiso').append('<option value='+ item.idTipoPermiso+'>'+ item.nombre+'</option>');	                         
                        $("#cmbTipoPermiso").val(<%= idtipopermiso %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
                        
            
    $(function() {
    $( "#tabs" ).tabs();
    
    $('#tabs').tabs('select', <%=hoja%>);
    
    $("[id$=txtFechaSalida]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
                
     $("[id$=txtFechaLlegada]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
    
    listarSolicitantes();
    listarTipoPermiso();
   
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
        <td align="center" bgcolor="#CCD8E6"><strong>Agregando Permiso</strong></td>
    </tr>        
    <tr>
      <td>              
      <div id="tabs">
  <ul>
    <li><a href="#tabs-0">Buscar Empleados</a></li>
    <li><a href="#tabs-1">Seleccionar Permiso</a></li>
    <li><a href="#tabs-2">Datos de Permiso</a></li>    
    
  </ul>
  <div id="tabs-0">          
    
    <table width="100%" border="0">  
    <tr>
        <td width="81%"><iframe src="PersonaServlet?accion=buscarPermiso" name="listado" width="600" height="500" marginheight="0" frameborder="0" class="borde"></iframe></td>        
    </tr>  
    </table>
  </div>
  <div id="tabs-1">          
    
    <table width="100%" border="0">  
    <tr>
        <td width="81%"><iframe src="PermisoServlet?accion=buscar&idempleado=<%=idsolicitantepagina%>" name="listado2" width="600" height="500" marginheight="0" frameborder="0" class="borde"></iframe></td>
        <td width="19%" align="center" valign="bottom">[ <a href="permiso.jsp?agr=1&idempleado=<%=idsolicitantepagina%>&hoja=2" class="menu">Agregar Permiso</a> ] </td>
    </tr>  
    </table>
  </div>
  <div id="tabs-2">
      <form id="Generalesfrm" name="Generalesfrm" method="post" style="margin:0px;" onSubmit="return valida6(this);">
      <table width="100%" border="0" align="center" class="borde">
        <tr>
          <td>&nbsp;</td>
          <td align="center" bgcolor="#CCD8E6">Datos de Permisos</td>
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
          <td width="20%">Nombres del Empleado</td>
          <td colspan="4">
               <select name="cmbEmpleado" class="fuente11" id="cmbEmpleado">   
               <option></option>
               </select>
          </td>          
          <td width="2%">&nbsp;</td>
        </tr>
         <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Tipo de Permiso</td>
          <td colspan="4">
            <select name="cmbTipoPermiso" class="fuente11" id="cmbTipoPermiso">
                <option></option>                             
            </select>
          </td>          
          <td width="2%">&nbsp;</td>
        </tr>
        
        <tr>
          <td>&nbsp;</td>
          <td>Fecha de Salida</td>
          <td><input name="txtFechaSalida" type="text" class="fuente11der" id="txtFechaSalida" size="12" value="<%= permiso.getFechaSalida() == null ? "" : fechaSalidaString%>"/>
              </td>
          <td>&nbsp;</td>         
           <td>&nbsp;</td>      
           <td>&nbsp;</td>      
           <td>&nbsp;</td>
        </tr>
              
        <tr>
          <td>&nbsp;</td>
          <td>Fecha de Regreso</td>
          <td><input name="txtFechaLlegada" type="text" class="fuente11der" id="txtFechaLlegada" size="12" value="<%= permiso.getFechaLlegada() == null ? "" : fechaLlegadaString%>"/>
              </td>
          <td>&nbsp;</td>         
           <td>&nbsp;</td>      
           <td>&nbsp;</td>      
           <td>&nbsp;</td>
        </tr>
              
         <tr>
          <td>&nbsp;</td>
          <td>Numero de horas</td>
          <td><input name="txtNumeroHoras" type="text" class="fuente11der" id="txtNumeroHoras" size="12" value="<%= permiso.getNumeroHoras()%>"/>
              </td>
          <td>&nbsp;</td>         
           <td>&nbsp;</td>      
           <td>&nbsp;</td>      
           <td>&nbsp;</td>
        </tr>
              
         <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Justificado?:</td>
          <td colspan="4">
              <%if (permiso.isJustificado()==true) 
                {                  
                %>
               <input name="rdoJustificado" type="radio" class="fuente11der" id="rdoJustificado" value="Si" checked/>Si               
               <input name="rdoJustificado" type="radio" class="fuente11der" id="rdoJustificado" value="No"/>No
               <%
               }
               else if (permiso.isJustificado()==false)
                 {
               %>
               <input name="rdoJustificado" type="radio" class="fuente11der" id="rdoJustificado" value="Si" />Si               
               <input name="rdoJustificado" type="radio" class="fuente11der" id="rdoJustificado" value="No" checked/>No
               <%}%>
               
          </td>          
          <td width="2%">&nbsp;</td>
        </tr>
        <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Con goce de Sueldo?:</td>
          <td colspan="4">
              <%if (permiso.isGoceSueldo()==true) 
                {                  
                %>
               <input name="rdoGoceSueldo" type="radio" class="fuente11der" id="rdoGoceSueldo" size="12" value="Si" checked/>Si
               <input name="rdoGoceSueldo" type="radio" class="fuente11der" id="rdoGoceSueldo" size="12" value="No"/>No
                <%
               }
               else if (permiso.isGoceSueldo()==false)
                 {
               %>
               <input name="rdoGoceSueldo" type="radio" class="fuente11der" id="rdoGoceSueldo" size="12" value="Si"/>Si
               <input name="rdoGoceSueldo" type="radio" class="fuente11der" id="rdoGoceSueldo" size="12" value="No" checked/>No
               
               <%}%>
          </td>          
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
            
                <%if(session.getAttribute("PermisoActualizar") == null){%>
                        ${clienteActualizar}
                                          
                        <input type="button" value="Agregar" onclick="insertar()" id="btnInsertar" />                         
                   
                        <%}else{%>
                   
                        <input type="button" value="Actualizar" onclick="actualizar(<%=permiso.getIdPermiso()%>)" 
                               id="btnActualizar" />                        
                   
                <%}%>
            
             <input name="tipo" type="hidden" id="tipo" value="1" />
          </td>
            
          <td>&nbsp;</td>
        </tr>
      </table>
      </form>
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
