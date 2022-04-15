<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, java.text.SimpleDateFormat" errorPage="" %>
<%@ page import="java.util.List"%>
<%@ page import="Bean.DescuentoBean"%>

 
 <%
 
    String vlagregar   = request.getParameter("agr");
    String vlmodificar = request.getParameter("mod");
    String vlmostrar   = request.getParameter("mos");
    
    String idsolicitantepagina = request.getParameter("idempleado");
    idsolicitantepagina = idsolicitantepagina == null ? "0" : idsolicitantepagina;

    DescuentoBean descuento=(DescuentoBean) session.getAttribute("DescuentoActualizar");
    descuento = descuento == null ? new DescuentoBean() : descuento;
    int id= descuento.getIdDescuento();
    int idempleado= descuento.getIdEmpleado();
    int idtipodescuento= descuento.getIdTipoDescuento();
    SimpleDateFormat formatoFecha = new java.text.SimpleDateFormat("dd/MM/yyyy");
    java.sql.Date fechaDesde=null;    
    String fechaDesdeString=null;
    if (descuento.getFechaDesde()!= null)
        {
        fechaDesdeString=formatoFecha.format(descuento.getFechaDesde());
        fechaDesde =  new java.sql.Date(formatoFecha.parse(fechaDesdeString).getTime());    
       }
    java.sql.Date fechaHasta=null;    
    String fechaHastaString=null;
    if (descuento.getFechaHasta()!= null)
        {
        fechaHastaString=formatoFecha.format(descuento.getFechaHasta());
        fechaHasta =  new java.sql.Date(formatoFecha.parse(fechaHastaString).getTime());    
       }
    double valor= descuento.getValor();    
    String observacion=descuento.getObservacion() == null ? "": descuento.getObservacion();
          
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
                $("#cmbTipoDescuento").val("-1");
                $("#txtFechaDesde").val("");
                $("#txtFechaHasta").val("");
                $("#txtValor").val("");
                $("#txtObservacion").val("");
                
            }
            
            function insertar(){
                var idsolicitante =  <%= idsolicitantepagina %>;
                var idtipodescuento =  $("#cmbTipoDescuento").val();
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
                    document.Generalesfrm.action = "./DescuentoServlet?accion=insertar" + 
                        "&idempleado=" + idsolicitante +
                        "&idtipodescuento=" + idtipodescuento + "&fechadesde=" + fechadesde + "&fechahasta=" + fechahasta +
                        "&valor=" + valor + "&observacion=" + observacion;                         
                    document.Generalesfrm.submit();                    
                }
            }
            
            
            function actualizar(id){                
               var idsolicitante =  <%= idsolicitantepagina %>;
                var idtipodescuento =  $("#cmbTipoDescuento").val();
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
                    document.Generalesfrm.action = "./DescuentoServlet?accion=actualizar&id=" + id +
                        "&idempleado=" + idsolicitante +
                        "&idtipodescuento=" + idtipodescuento + "&fechadesde=" + fechadesde + "&fechahasta=" + fechahasta +
                        "&valor=" + valor + "&observacion=" + observacion;      
                    document.Generalesfrm.submit();
                }
            }
            
             function cancelar(){
                document.location = "descuento.jsp";
            }
                    
             var listarTipoDescuentos = function() {
                url = "./TipoDescuentoServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbTipoDescuento').html('');
                    $('#cmbTipoDescuento').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbTipoDescuento').append('<option value='+ item.idTipoDescuento+'>'+ item.nombre+'</option>');	                         
                         $("#cmbTipoDescuento").val(<%= idtipodescuento %>);
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
       
    listarTipoDescuentos();
    
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
    <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Agregar Descuentos</strong></td>
  </tr>
  <tr>
    <td width="81%"><iframe src="DescuentoServlet?accion=buscar&idempleado=<%=idsolicitantepagina%>" name="listado" width="600" height="350" marginheight="0" frameborder="0" class="borde"></iframe></td>
    <td width="19%" align="center" valign="bottom">[ <a href="./formularios/refrescar.jsp?cat=95&id=<%=idsolicitantepagina%>&mos=1" onclick="" class="menu">Agregar</a> ] </td>
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
                <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Detalles de Descuentos</strong></td>
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
                    <td>Tipo de Descuento:</td>
                    <td> 
                        <select name="cmbTipoDescuento" class="fuente11" id="cmbTipoDescuento">   
                        <option></option>
                        </select>
                    </td>
                </tr> 
                <tr>
                    <td>Fecha Desde:</td>
                    <td><input type="text" id="txtFechaDesde" class="fuente11" value="<%= descuento.getFechaDesde() == null ? "" : fechaDesdeString%>" /></td>
                </tr>
                <tr>
                    <td>Fecha Hasta:</td>
                    <td><input type="text" id="txtFechaHasta" class="fuente11" value="<%= descuento.getFechaHasta() == null ? "" : fechaHastaString%>" /></td>
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
                        <%if(session.getAttribute("DescuentoActualizar") == null){%>
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


    
    
       


