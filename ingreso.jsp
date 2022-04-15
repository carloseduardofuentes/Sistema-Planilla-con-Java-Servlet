<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, java.text.SimpleDateFormat" errorPage="" %>
<%@ page import="java.util.List"%>
<%@ page import="Bean.IngresoBean"%>

 
 <%
 
    String vlagregar   = request.getParameter("agr");
    String vlmodificar = request.getParameter("mod");
    String vlmostrar   = request.getParameter("mos");
    
    String idsolicitantepagina = request.getParameter("idempleado");
    idsolicitantepagina = idsolicitantepagina == null ? "0" : idsolicitantepagina;

    IngresoBean ingreso=(IngresoBean) session.getAttribute("IngresoActualizar");
    ingreso = ingreso == null ? new IngresoBean() : ingreso;
    int id= ingreso.getIdIngreso();
    int idempleado= ingreso.getIdEmpleado();
    int idtipoingreso= ingreso.getIdTipoIngreso();
    SimpleDateFormat formatoFecha = new java.text.SimpleDateFormat("dd/MM/yyyy");
    java.sql.Date fechaDesde=null;    
    String fechaDesdeString=null;
    if (ingreso.getFechaDesde()!= null)
        {
        fechaDesdeString=formatoFecha.format(ingreso.getFechaDesde());
        fechaDesde =  new java.sql.Date(formatoFecha.parse(fechaDesdeString).getTime());    
       }
    java.sql.Date fechaHasta=null;    
    String fechaHastaString=null;
    if (ingreso.getFechaHasta()!= null)
        {
        fechaHastaString=formatoFecha.format(ingreso.getFechaHasta());
        fechaHasta =  new java.sql.Date(formatoFecha.parse(fechaHastaString).getTime());    
       }
    double valor= ingreso.getValor();    
    String observacion=ingreso.getObservacion() == null ? "": ingreso.getObservacion();
          
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
            
            function limpiarcampos()
            {
                $("#txtId").val("");
                $("#cmbTipoIngreso").val("-1");
                $("#txtFechaDesde").val("");
                $("#txtFechaHasta").val("");
                $("#txtValor").val("");
                $("#txtObservacion").val("");
                
            }
            
            function insertar(){
                var idsolicitante =  <%= idsolicitantepagina %>;
                var idtipoingreso =  $("#cmbTipoIngreso").val();
                var fechadesde = document.getElementById("txtFechaDesde").value;     
                var fechahasta = document.getElementById("txtFechaHasta").value;     
                var valor = document.getElementById("txtValor").value;   
                var observacion = document.getElementById("txtObservacion").value; 
                                
                if(valor == ""){
                    alert("El Valor es obligatorio. Debe digitarlo.")
                }                
                else if (fechadesde==""){
                    alert("Debe digitar las fechas.")
                }
                else if (fechahasta==""){
                    alert("Debe digitar las fechas.")
                }
                else{
                    document.Generalesfrm.action = "./IngresoServlet?accion=insertar" + 
                        "&idempleado=" + idsolicitante +
                        "&idtipoingreso=" + idtipoingreso + "&fechadesde=" + fechadesde + "&fechahasta=" + fechahasta +
                        "&valor=" + valor + "&observacion=" + observacion;                         
                    document.Generalesfrm.submit();                    
                }
            }
            
            
            function actualizar(id){                
               var idsolicitante =  <%= idsolicitantepagina %>;
                var idtipoingreso =  $("#cmbTipoIngreso").val();
                var fechadesde = document.getElementById("txtFechaDesde").value;     
                var fechahasta = document.getElementById("txtFechaHasta").value;     
                var valor = document.getElementById("txtValor").value;   
                var observacion = document.getElementById("txtObservacion").value; 
                                               
                if(valor == ""){
                    alert("El Valor es obligatorio. Debe digitarlo.")
                }                
                else if (fechadesde==""){
                    alert("Debe digitar las fechas.")
                }
                else if (fechahasta==""){
                    alert("Debe digitar las fechas.")
                }
                else{
                    document.Generalesfrm.action = "./IngresoServlet?accion=actualizar&id=" + id +
                        "&idempleado=" + idsolicitante +
                        "&idtipoingreso=" + idtipoingreso + "&fechadesde=" + fechadesde + "&fechahasta=" + fechahasta +
                        "&valor=" + valor + "&observacion=" + observacion;      
                    document.Generalesfrm.submit();
                }
            }
            
             function cancelar(){
                document.location = "ingreso.jsp";
            }
                    
             var listarTipoIngresos = function() {
                url = "./TipoIngresoServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbTipoIngreso').html('');
                    $('#cmbTipoIngreso').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbTipoIngreso').append('<option value='+ item.idTipoIngreso+'>'+ item.nombre+'</option>');	                         
                         $("#cmbTipoIngreso").val(<%= idtipoingreso %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
    $(function() {
        
    $("[id$=txtFechaDesde]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
                
     $("[id$=txtFechaHasta]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
       
    listarTipoIngresos();
    
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
    <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Agregar Ingresos</strong></td>
  </tr>
  <tr>
    <td width="81%"><iframe src="IngresoServlet?accion=buscar&idempleado=<%=idsolicitantepagina%>" name="listado" width="600" height="350" marginheight="0" frameborder="0" class="borde"></iframe></td>
    <td width="19%" align="center" valign="bottom">[ <a href="./formularios/refrescar.jsp?cat=96&id=<%=idsolicitantepagina%>&mos=1" onclick="" class="menu">Agregar</a> ] </td>
  </tr>  
  <%
// Vemos si mostramos el formulario de agregar
//if (vlagregar != null || vlmostrar != null) {
%>
<tr>
    <td colspan="2" width="81%">

         <hr size="1" />
        <form name="Generalesfrm" method="post" style="margin: 0px;" onSubmit="return valida2(this);">
            <table width="60%" border="0" align="center" class="borde">
                <tr>                
                <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Detalles de Ingresos</strong></td>
                </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>                
              </tr>
                <tr>
                    <td>Id:</td>
                    <td><input type="text" id="txtId" class="fuente11" value="<%=id%>" /></td>
                </tr>
                <tr>
                    <td>Tipo de Ingreso:</td>
                    <td> 
                        <select name="cmbTipoIngreso" class="fuente11" id="cmbTipoIngreso">   
                        <option></option>
                        </select>
                    </td>
                </tr> 
                <tr>
                    <td>Fecha Desde:</td>
                    <td><input type="text" id="txtFechaDesde" class="fuente11" value="<%= ingreso.getFechaDesde() == null ? "" : fechaDesdeString%>" /></td>
                </tr>
                <tr>
                    <td>Fecha Hasta:</td>
                    <td><input type="text" id="txtFechaHasta" class="fuente11" value="<%= ingreso.getFechaHasta() == null ? "" : fechaHastaString%>" /></td>
                </tr>
                 <tr>
                    <td>Valor:</td>
                    <td><input type="text" id="txtValor" class="fuente11" value="<%=valor%>" /></td>
                </tr>
                <tr>
                    <td>Observacion:</td>
                    <td colspan="4">
                        <textarea cols="40" rows="3" class="fuente11" name="txtObservacion" id="txtObservacion"><%=observacion%></textarea>
                     </td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="Cancelar" onclick="cancelar()" id="btnCancelar" />
                    </td>
                        <%if(session.getAttribute("IngresoActualizar") == null){%>
                        ${clienteActualizar}
                    <td>
                        <input type="button" value="Insertar" onclick="insertar()" id="btnInsertar" />                         
                    </td>
                        <%}else{%>
                    <td>
                        <input type="button" value="Actualizar" onclick="actualizar(<%=id%>)" 
                               id="btnActualizar" />                        
                    </td>
                        <%}%>
                </tr>
            </table>
        </form>
        
    </td>
    
  </tr>  

  <%
//} // Fin de mostrar formulario de agregar
%>

</table>
</div>
<div id="pie">ACOPES DE R.L.</div>
</body>
</html>


    
    
       


