<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, java.text.SimpleDateFormat" errorPage="" %>
<%@ page import="java.util.List"%>
<%@ page import="Bean.PermisoBean"%>

 
 <%
    int mes = Integer.parseInt(request.getParameter("mes") == null ? "0" : 
                request.getParameter("mes"));   
    int anio = Integer.parseInt(request.getParameter("anio") == null ? "0" : 
                request.getParameter("anio"));   
    int idtipoempleado=Integer.parseInt(request.getParameter("idtipoempleado") == null ? "0" : 
                request.getParameter("idtipoempleado"));   
    int periodo=Integer.parseInt(request.getParameter("periodo") == null ? "0" : 
                request.getParameter("periodo")); 
    
     int mes2 = Integer.parseInt(request.getParameter("mes2") == null ? "0" : 
                request.getParameter("mes2"));   
    int anio2 = Integer.parseInt(request.getParameter("anio2") == null ? "0" : 
                request.getParameter("anio2"));   
    int idtipoempleado2=Integer.parseInt(request.getParameter("idtipoempleado2") == null ? "0" : 
                request.getParameter("idtipoempleado2"));   
    int periodo2=Integer.parseInt(request.getParameter("periodo2") == null ? "0" : 
                request.getParameter("periodo2")); 
 
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
        
   function generar(){
                var mes = $("#cmbMes").val();
                var anio = $("#cmbAnio").val();
                var idtipoempleado = $("#cmbTipoEmpleado").val();
                document.planillafrm.action = "generarplanilla.jsp?mes=" + mes + "&anio=" + anio + "&idtipoempleado=" + idtipoempleado;
                document.planillafrm.submit();
            }
            
   function guardar(){
                var mes = $("#cmbMes").val();
                var anio = $("#cmbAnio").val();
                var idtipoempleado = $("#cmbTipoEmpleado").val();
                var observacion=$("#txtObservacion").val();
                document.planillafrm.action = "PlanillaServlet?accion=insertar&mes=" + mes + "&anio=" + anio + "&idtipoempleado=" + idtipoempleado + "&periodo=1" + "&observacion=" + observacion;
                document.planillafrm.submit();
            }
            
   function buscar(){              
                var mes = $("#cmbMes2").val();
                var anio = $("#cmbAnio2").val();
                var idtipoempleado = $("#cmbTipoEmpleado2").val();           
                document.planillafrm2.action =  "PlanillaServlet?accion=buscar&mes=" + mes + "&anio=" + anio + "&idtipoempleado=" + idtipoempleado + "&periodo=1";
                document.planillafrm2.submit();
            }
            
    var listarTipoEmpleado = function() {
                url = "./TipoEmpleadoServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbTipoEmpleado').html('');
                    $('#cmbTipoEmpleado').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbTipoEmpleado').append('<option value='+ item.idTipoEmpleado+'>'+ item.nombre+'</option>');	                                                 
                        $("#cmbTipoEmpleado").val(<%= idtipoempleado %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
    var listarTipoEmpleado2 = function() {
                url = "./TipoEmpleadoServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbTipoEmpleado2').html('');
                    $('#cmbTipoEmpleado2').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbTipoEmpleado2').append('<option value='+ item.idTipoEmpleado+'>'+ item.nombre+'</option>');	                                                 
                        $("#cmbTipoEmpleado2").val(<%= idtipoempleado2 %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
            
    $(function() {
    $( "#tabs" ).tabs();
    listarTipoEmpleado();
    listarTipoEmpleado2();
   
   
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
        <td align="center" bgcolor="#CCD8E6"><strong>Generar Planilla</strong></td>
    </tr>        
    <tr>
      <td>              
      <div id="tabs">
    <ul>
      <li><a href="#tabs-0">Buscar Planilla</a></li>
      <li><a href="#tabs-1">Generar Planilla</a></li>
    </ul>  
    <div id="tabs-0">  
   <form id="planillafrm2" name="planillafrm2" method="post" style="margin:0px;" >
   <table width="100%" border="0">  
    <tr>   
        <td>
      <table width="100%" border="0" align="center" class="borde">
        <tr>
          <td>&nbsp;</td>
          <td align="center" bgcolor="#CCD8E6">Buscar Planilla</td>
          <td colspan="4" align="right" class="bordeinferior"></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td colspan="7">&nbsp;</td>          
        </tr>       
          <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Tipo Planilla:</td>
          <td colspan="4">
          <select name="cmbTipoEmpleado2" class="fuente11" id="cmbTipoEmpleado2">   
             <option></option>
          </select>
          </td>
          <td width="2%">&nbsp;</td>
        </tr>  
         <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Mes:</td>
          <td colspan="4">
            <select name="cmbMes2" class="fuente11" id="cmbMes2">
                <option value="1">Enero</option>   
                <option value="2">Febrero</option>   
                <option value="3">Marzo</option>   
                <option value="4">Abril</option>   
                <option value="5">Mayo</option>   
                <option value="6">Junio</option>   
                <option value="7">Julio</option>   
                <option value="8">Agosto</option>   
                <option value="9">Septiembre</option>   
                <option value="10">Octubre</option>   
                <option value="11">Noviembre</option>   
                <option value="12">Diciembre</option>   
            </select>
          </td>          
          <td width="2%">&nbsp;</td>
        </tr>
          <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Año:</td>
          <td colspan="4">
            <select name="cmbAnio2" class="fuente11" id="cmbAnio2">
                <option value="2013">2013</option>                   
            </select>
          </td>          
          <td width="2%">&nbsp;</td>
        </tr>
        <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Observacion:</td>
          <td colspan="4">
            <textarea cols="40" rows="3" class="fuente11" name="txtObservacion2" id="txtObservacion2"><%//=observacion%></textarea>
          </td>          
          <td width="2%">&nbsp;</td>
        </tr>
          <tr>
              <td width="2%">&nbsp;</td>
              <td colspan="5">
                  <input type="button" value="Ver Planilla" onclick="buscar()" id="btnVerPlanilla" /> 
              </td>
              <td width="2%">&nbsp;</td>
          </tr>
      </table>  
      </td>
    </tr>
    <tr>
        <td width="81%">
            <iframe src="verplanillaLst.jsp?anio=<%=anio2%>&mes=<%=mes2%>&idtipoempleado=<%=idtipoempleado2%>&periodo=<%=periodo2%>" name="listado2" width="1200" height="600" marginheight="0" frameborder="0" class="borde"></iframe>
        </td>        
    </tr>          
   </table>
    </form>
  </div> 
  <div id="tabs-1">              
    <form id="planillafrm" name="planillafrm" method="post" style="margin:0px;" >
    <table width="100%" border="0">              
    <tr>  
        <td>
      <table width="100%" border="0" align="center" class="borde">
        <tr>
          <td>&nbsp;</td>
          <td align="center" bgcolor="#CCD8E6">Generar Planilla</td>
          <td colspan="4" align="right" class="bordeinferior"></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td colspan="7">&nbsp;</td>          
        </tr>       
          <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Tipo Planilla:</td>
          <td colspan="4">
          <select name="cmbTipoEmpleado" class="fuente11" id="cmbTipoEmpleado">   
             <option></option>
          </select>
          </td>
          <td width="2%">&nbsp;</td>
        </tr>  
         <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Mes:</td>
          <td colspan="4">
            <select name="cmbMes" class="fuente11" id="cmbMes">
                <option value="1">Enero</option>   
                <option value="2">Febrero</option>   
                <option value="3">Marzo</option>   
                <option value="4">Abril</option>   
                <option value="5">Mayo</option>   
                <option value="6">Junio</option>   
                <option value="7">Julio</option>   
                <option value="8">Agosto</option>   
                <option value="9">Septiembre</option>   
                <option value="10">Octubre</option>   
                <option value="11">Noviembre</option>   
                <option value="12">Diciembre</option>   
            </select>
          </td>          
          <td width="2%">&nbsp;</td>
        </tr>
          <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Año:</td>
          <td colspan="4">
            <select name="cmbAnio" class="fuente11" id="cmbAnio">
                <option value="2013">2013</option>                   
            </select>
          </td>          
          <td width="2%">&nbsp;</td>
        </tr>
          <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Observacion:</td>
          <td colspan="4">
            <textarea cols="40" rows="3" class="fuente11" name="txtObservacion" id="txtObservacion"><%//=observacion%></textarea>
          </td>          
          <td width="2%">&nbsp;</td>
        </tr>
          <tr>
              <td width="2%">&nbsp;</td>
              <td colspan="5">
                  <input type="button" value="Generar Planilla" onclick="generar()" id="btnGenerar" /> 
                  &nbsp;&nbsp;&nbsp;
                  <input type="button" value="Guardar Planilla" onclick="guardar()" id="btnGuardar" /> 
              </td>
              <td width="2%">&nbsp;</td>
          </tr>                         
      </table>  
        </td>
    </tr>     
        <tr>
            <td colspan="7" width="100%">
                <iframe src="generarplanillaLst.jsp?anio=<%=anio%>&mes=<%=mes%>&idtipoempleado=<%=idtipoempleado%>" name="listado" width="1200" height="600" marginheight="0" frameborder="0" class="borde"></iframe>
            </td>  
         </tr>    
    </table>
   </form>   
  </div>
      </div>
      </td>
    </tr>
  </table>

</div>

<div id="pie">ACOPES DE R.L.</div>
</body>
</html>
