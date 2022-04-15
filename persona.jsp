<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, java.text.SimpleDateFormat" errorPage="" %>
<%@ page import="java.util.List"%>
<%@ page import="Bean.PersonaBean"%>
<%@ page import="Bean.EmpleadoBean"%>
<%@ page import="Bean.EstudioBean"%>
<%@ page import="Bean.ExperienciaLaboralBean"%>
 
 <%
    String vlagregar   = request.getParameter("agr");
    String vlmodificar = request.getParameter("mod");
    String vlmostrar   = request.getParameter("mos");    
    String hoja = request.getParameter("hoja") == null ? "0" : request.getParameter("hoja");

    PersonaBean persona = (PersonaBean) session.getAttribute("PersonaActualizar");
    persona = persona == null ? new PersonaBean() : persona;
    int id= persona.getIdPersona();  
    String nombres = persona.getNombres() == null ? "" : persona.getNombres();   
    String apellidos = persona.getApellidos() == null ? "" : persona.getApellidos();       
    String sexo = persona.getSexo() == null ? "" : persona.getSexo();
    SimpleDateFormat formatoFecha = new java.text.SimpleDateFormat("dd/MM/yyyy");
    java.sql.Date fechanacimiento=null;    
    String fechanacimientoString=null;
    if (persona.getFechaNacimiento()!= null)
        {
        fechanacimientoString=formatoFecha.format(persona.getFechaNacimiento());
        fechanacimiento =  new java.sql.Date(formatoFecha.parse(fechanacimientoString).getTime());    
       }
    int idestadocivil = persona.getIdEstadocivil();
    int idpaisnacimiento = persona.getIdPaisNacimiento();
    int idpais = persona.getIdPais();
    int iddepartamentogeografico = persona.getIdDepartamentoGeografico();
    int idafp = persona.getIdAfp();
    String ciudad = persona.getCiudad() == null ? "" : persona.getCiudad();        
    String direccion = persona.getDireccion() == null ? "" : persona.getDireccion();
    String telefono = persona.getTelefono() == null ? "" : persona.getTelefono();
    String email = persona.getEmail() == null ? "" : persona.getEmail();
    String dui = persona.getDui() == null ? "" : persona.getDui();
    String nit = persona.getNit() == null ? "" : persona.getNit();
    String isss = persona.getIsss() == null ? "" : persona.getIsss();
    String nup = persona.getNup() == null ? "" : persona.getNup();
    String tiposanguineo = persona.getTipoSanguineo() == null ? "" : persona.getTipoSanguineo();
    String observacion = persona.getObservacion() == null ? "" : persona.getObservacion();
    
    
    //Empleado
    EmpleadoBean empleado = (EmpleadoBean) session.getAttribute("EmpleadoActualizar");
    empleado = empleado == null ? new EmpleadoBean() : empleado;
    int idempleado= empleado.getIdEmpleado();
    int idtipoempleado=empleado.getIdTipoEmpleado();
    int idpuesto = empleado.getIdPuesto();
    int iddepartamento = empleado.getIdDepartamento();
    int idhorario=empleado.getIdHorario();
    String habilitado=empleado.getHabilitado();    
    java.sql.Date fechaingreso=null;    
    java.sql.Date fechasalida=null;    
    String fechaingresoString=null;
    String fechasalidaString=null;
    if (empleado.getFechaIngreso()!= null)
        {
        fechaingresoString=formatoFecha.format(empleado.getFechaIngreso());
        fechaingreso = new java.sql.Date(formatoFecha.parse(fechaingresoString).getTime());    
       }
    
    if (empleado.getFechaSalida()!= null)
        {
        fechasalidaString=formatoFecha.format(empleado.getFechaSalida());
        fechasalida = new java.sql.Date(formatoFecha.parse(fechasalidaString).getTime());    
       }
             
    String motivosalida= empleado.getMotivoSalida() == null ? "" : empleado.getMotivoSalida();
    Double salario = empleado.getSalario();
    int reloj=empleado.getRelojMarcador();
    int idbanco=empleado.getIdBanco();
    String cuentabancaria=empleado.getCuentaBancaria() == null ? "" : empleado.getCuentaBancaria();
        
    //Estudio
    EstudioBean estudio2= (EstudioBean) session.getAttribute("EstudioActualizar");
    estudio2 = estudio2 == null ? new EstudioBean() : estudio2;
    int idestudio2= estudio2.getIdEstudio();
    int idnivel2=estudio2.getIdNivelEstudio();
    String institucion2=estudio2.getInstitucion() == null ? "" : estudio2.getInstitucion();
    String titulo2=estudio2.getTitulo() == null ? "" : estudio2.getTitulo();
    java.sql.Date fechainicio2=null;    
    java.sql.Date fechafinal2=null;  
    String fechainicioString2=null;
    String fechafinalString2=null;
     if (estudio2.getFechaInicio()!= null)
        {
        fechainicioString2=formatoFecha.format(estudio2.getFechaInicio());
        fechainicio2 = new java.sql.Date(formatoFecha.parse(fechainicioString2).getTime());    
       }

    if (estudio2.getFechaFinal()!= null)
        {
        fechafinalString2=formatoFecha.format(estudio2.getFechaFinal());
        fechafinal2= new java.sql.Date(formatoFecha.parse(fechafinalString2).getTime());    
       }
    
    //Experiencia Laboral
    ExperienciaLaboralBean experiencia2= (ExperienciaLaboralBean) session.getAttribute("ExperienciaLaboralActualizar");
    experiencia2 = experiencia2 == null ? new ExperienciaLaboralBean() : experiencia2;
    int idexperiencia2= experiencia2.getIdExperienciaLaboral();    
    String empresa2=experiencia2.getEmpresa();
    String puesto2=experiencia2.getPuesto();
    java.sql.Date fechainicio4=null;    
    java.sql.Date fechafinal4=null;  
    String fechainicioString4=null;
    String fechafinalString4=null;
     if (experiencia2.getFechaInicio()!= null)
        {
        fechainicioString4=formatoFecha.format(experiencia2.getFechaInicio());
        fechainicio4 = new java.sql.Date(formatoFecha.parse(fechainicioString4).getTime());    
       }

    if (experiencia2.getFechaFinal()!= null)
        {
        fechafinalString4=formatoFecha.format(experiencia2.getFechaFinal());
        fechafinal4= new java.sql.Date(formatoFecha.parse(fechafinalString4).getTime());    
       }
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
      function insertar(){
                var nombres = document.getElementById("txtNombres").value;                     
                var apellidos = document.getElementById("txtApellidos").value;     
                var sexo = $("#cmbSexo").val();
                var fechanacimiento = document.getElementById("txtFechaNacimiento").value; 
                var idestadocivil = $("#cmbEstadoCivil").val();
                var idpaisnacimiento = $("#cmbPaisNacimiento").val();
                var idpais = $("#cmbPais").val();
                var iddepartamentogeografico = $("#cmbDepartamentoGeografico").val();
                var idafp = $("#cmbAfp").val();
                var ciudad = document.getElementById("txtCiudad").value; 
                var direccion = document.getElementById("txtDireccion").value; 
                var telefono = document.getElementById("txtTelefono").value; 
                var email = document.getElementById("txtEmail").value; 
                var dui = document.getElementById("txtDui").value; 
                var nit = document.getElementById("txtNit").value; 
                var isss = document.getElementById("txtIsss").value; 
                var nup = document.getElementById("txtNup").value; 
                var tiposanguineo = document.getElementById("txtTipoSanguineo").value;
                var observacion = document.getElementById("txtObservacion").value;
                
                if(nombres == ""){
                    alert("Campos Nombre es obligatorio.")
                }
                else if (apellidos==""){
                    alert("Campos Apellido es obligatorio.")
                }
                else if (sexo=="-1"){
                    alert("Debe seleccionar el sexo del empleado")
                }
                else{
                    document.Generalesfrm.action = "./PersonaServlet?accion=insertar&nombres=" + nombres +
                        "&apellidos=" + apellidos + "&sexo=" + sexo + "&fechanacimiento=" + fechanacimiento+
                        "&idestadocivil=" + idestadocivil + "&idpaisnacimiento=" + idpaisnacimiento + "&idpais=" + idpais +
                        "&iddepartamentogeografico=" + iddepartamentogeografico + "&ciudad=" + ciudad + "&direccion=" + direccion +
                        "&telefono=" + telefono + "&email=" + email + "&dui=" + dui + 
                        "&nit=" + nit + "&isss=" + isss + "&nup=" + nup + "&idafp=" + idafp + "&tiposanguineo=" + tiposanguineo + "&observacion=" + observacion;                         
                    document.Generalesfrm.submit();                    
                }
            }
            
      function insertarEmpleado()
            {
              var idpersona = document.getElementById("txtId").value; 
              var idtipoempleado=$("#cmbTipoEmpleado").val(); 
              var idpuesto = $("#cmbPuesto").val();
              var iddepartamento = $("#cmbDepartamento").val();
              var idhorario = $("#cmbHorario").val();
              var habilitado = $("#cmbHabilitado").val();
              var fechaingreso = document.getElementById("txtFechaIngreso").value;
              var fechasalida = document.getElementById("txtFechaSalida").value;
              var motivosalida = document.getElementById("txtMotivoSalida").value;
              var salario = document.getElementById("txtSalario").value;
              var reloj = document.getElementById("txtReloj").value;
              var idbanco=$("#cmbBanco").val();
              var cuentabancaria=document.getElementById("txtCuentaBancaria").value;
              
               if (habilitado=="-1"){
                    alert("Debe seleccionar el estado Habilitado del empleado")
                }               
                else{
                    document.agregarEmpleado.action = "./EmpleadoServlet?accion=insertar&idpersona=" + idpersona +
                        "&idpuesto=" + idpuesto+ "&iddepartamento=" + iddepartamento + "&idhorario=" + idhorario +
                        "&habilitado=" + habilitado + "&fechaingreso=" + fechaingreso + "&fechasalida=" + fechasalida +
                        "&motivosalida=" + motivosalida + "&salario=" + salario + "&relojmarcador=" + reloj + "&idbanco=" + idbanco + "&cuentabancaria=" + cuentabancaria + "&idtipoempleado=" + idtipoempleado;                         
                    document.agregarEmpleado.submit();                    
                }
            }
            
            function actualizar(id){
                var nombres = document.getElementById("txtNombres").value;                     
                var apellidos = document.getElementById("txtApellidos").value;     
                var sexo = $("#cmbSexo").val();
                var fechanacimiento = document.getElementById("txtFechaNacimiento").value; 
                var idestadocivil = $("#cmbEstadoCivil").val();
                var idpaisnacimiento = $("#cmbPaisNacimiento").val();
                var idpais = $("#cmbPais").val();
                var iddepartamentogeografico = $("#cmbDepartamento").val();
                var idafp = $("#cmbAfp").val();
                var ciudad = document.getElementById("txtCiudad").value; 
                var direccion = document.getElementById("txtDireccion").value; 
                var telefono = document.getElementById("txtTelefono").value; 
                var email = document.getElementById("txtEmail").value; 
                var dui = document.getElementById("txtDui").value; 
                var nit = document.getElementById("txtNit").value; 
                var isss = document.getElementById("txtIsss").value; 
                var nup = document.getElementById("txtNup").value; 
                var tiposanguineo = document.getElementById("txtTipoSanguineo").value;
                var observacion = document.getElementById("txtObservacion").value;
                
                if(nombres == ""){
                    alert("Campos Nombre es obligatorio.")
                }
                else if (apellidos==""){
                    alert("Campos Apellido es obligatorio.")
                }
                else if (sexo=="-1"){
                    alert("Debe seleccionar el sexo del empleado")
                }
                else{
                    document.Generalesfrm.action = "./PersonaServlet?accion=actualizar&id=" + id +
                        "&nombres=" + nombres +
                        "&apellidos=" + apellidos + "&sexo=" + sexo + "&fechanacimiento=" + fechanacimiento +
                        "&idestadocivil=" + idestadocivil + "&idpaisnacimiento=" + idpaisnacimiento + "&idpais=" + idpais +
                        "&iddepartamentogeografico=" + iddepartamentogeografico + "&ciudad=" + ciudad + "&direccion=" + direccion +
                        "&telefono=" + telefono + "&email=" + email + "&dui=" + dui + 
                        "&nit=" + nit + "&isss=" + isss + "&nup=" + nup + "&idafp=" + idafp + "&tiposanguineo=" + tiposanguineo + "&observacion=" + observacion;                         
                    document.Generalesfrm.submit();
                }
            }
            
            
            function actualizarEmpleado(id)
            {
              var idpersona = document.getElementById("txtId").value; 
              var idtipoempleado=$("#cmbTipoEmpleado").val(); 
              var idpuesto = $("#cmbPuesto").val();
              var iddepartamento = $("#cmbDepartamento").val();
              var idhorario = $("#cmbHorario").val();
              var habilitado = $("#cmbHabilitado").val();
              var fechaingreso = document.getElementById("txtFechaIngreso").value;
              var fechasalida = document.getElementById("txtFechaSalida").value;
              var motivosalida = document.getElementById("txtMotivoSalida").value;
              var salario = document.getElementById("txtSalario").value;
              var reloj = document.getElementById("txtReloj").value;
              var idbanco=$("#cmbBanco").val();
              var cuentabancaria=document.getElementById("txtCuentaBancaria").value;
              
               if (habilitado=="-1"){
                    alert("Debe seleccionar el estado Habilitado del empleado")
                }               
                else{
                    document.agregarEmpleado.action = "./EmpleadoServlet?accion=actualizar&id=" + id + "&idpersona=" + idpersona +
                        "&idpuesto=" + idpuesto+ "&iddepartamento=" + iddepartamento + "&idhorario=" + idhorario +
                        "&habilitado=" + habilitado + "&fechaingreso=" + fechaingreso + "&fechasalida=" + fechasalida +                        
                        "&motivosalida=" + motivosalida + "&salario=" + salario + "&relojmarcador=" + reloj + "&idbanco=" + idbanco + "&cuentabancaria=" + cuentabancaria + "&idtipoempleado=" + idtipoempleado;                         
                    document.agregarEmpleado.submit();                    
                }
            }
            
            function insertarEstudio()
            {
              var idpersona = document.getElementById("txtId").value; 
              var idnivel = $("#cmbNivel").val();
              var institucion=document.getElementById("txtInstitucion").value;
              var titulo=document.getElementById("txtTitulo").value;
              var fechainicio=document.getElementById("txtFechaInicioEstudio").value;    
              var fechafinal=document.getElementById("txtFechaFinEstudio").value;
              
               document.agregarEstudio.action = "./EstudioServlet?accion=insertar&idpersona=" + idpersona +
                        "&idnivel=" + idnivel+ "&institucion=" + institucion + "&titulo=" + titulo +
                        "&fechainicio=" + fechainicio + "&fechafinal=" + fechafinal;                        
                    document.agregarEstudio.submit();       
            }
            
            function actualizarEstudio()
            {
              var idestudio=document.getElementById("txtIdEstudio").value; 
              var idpersona = document.getElementById("txtId").value; 
              var idnivel = $("#cmbNivel").val();
              var institucion=document.getElementById("txtInstitucion").value;
              var titulo=document.getElementById("txtTitulo").value;
              var fechainicio=document.getElementById("txtFechaInicioEstudio").value;    
              var fechafinal=document.getElementById("txtFechaFinEstudio").value;
                            
               document.agregarEstudio.action = "./EstudioServlet?accion=actualizar&id=" + idestudio + "&idpersona=" + idpersona +
                        "&idnivel=" + idnivel+ "&institucion=" + institucion + "&titulo=" + titulo +
                        "&fechainicio=" + fechainicio + "&fechafinal=" + fechafinal;                        
                    document.agregarEstudio.submit(); 
                            
            }
            
            function agregarNuevoEstudio()
            {
               $("#txtIdEstudio").val("");
               $("#cmbNivel").val("");
               $("#txtInstitucion").val("");
               $("#txtTitulo").val("");
               $("#txtFechaInicioEstudio").val("");
               $("#txtFechaFinEstudio").val("");
               $("#btnInsertarEstudio").val("Agregar");
            }
            
            function modificarEstudio(id, idestudio, idnivel, institucion, titulo, fechainicio, fechafinal)
            {  
               $("#txtIdEstudio").val(idestudio);
               $("#cmbNivel").val(idnivel);
               $("#txtInstitucion").val(institucion);
               $("#txtTitulo").val(titulo);
               $("#txtFechaInicioEstudio").val(fechainicio);
               $("#txtFechaFinEstudio").val(fechafinal);
               $("#btnInsertarEstudio").val("Actualizar");               
               //session.setAttribute("BanderaEstudio","1");
               
            }
            
            function accionEstudio()
            {
              if( $("#btnInsertarEstudio").val()=="Agregar")
                  {
                    insertarEstudio();  
                  }
                
              else if( $("#btnInsertarEstudio").val()=="Actualizar")
                    {
                      actualizarEstudio();  
                    }
            }
            
            function obtenerEstudio(id, ide)
            {
                document.agregarEstudio.action = "EstudioServlet?accion=obtenerPorId&id=" + id + "&ide=" + ide;
                document.agregarEstudio.submit();                
            }
            
            function eliminarEstudio(id, ide){
                document.agregarEstudio.action = "EstudioServlet?accion=eliminar&id=" + id + "&ide=" + ide;
                document.agregarEstudio.submit();
            }
            
            function insertarExperiencia()
            {
              var idpersona = document.getElementById("txtId").value; 
              var empresa = document.getElementById("txtEmpresa").value; 
              var puesto=document.getElementById("txtPuesto").value;              
              var fechainicio=document.getElementById("txtFechaInicioTrabajo").value;    
              var fechafinal=document.getElementById("txtFechaFinTrabajo").value;
              var salario=document.getElementById("txtSalarioTrabajo").value;
              var observacion=document.getElementById("txtObservacionTrabajo").value;
              
               document.agregarExperienciaLaboral.action = "./ExperienciaLaboralServlet?accion=insertar&idpersona=" + idpersona +
                        "&empresa=" + empresa + "&puesto=" + puesto + 
                        "&fechainicio=" + fechainicio + "&fechafinal=" + fechafinal +
                        "&salario=" + salario + "&observacion=" + observacion;                        
                    document.agregarExperienciaLaboral.submit();  
                                      
            }
            
            function actualizarExperiencia()
            {
              var idexperiencia=document.getElementById("txtIdExperienciaLaboral").value; 
              var idpersona = document.getElementById("txtId").value;
              var empresa = document.getElementById("txtEmpresa").value; 
              var puesto=document.getElementById("txtPuesto").value;              
              var fechainicio=document.getElementById("txtFechaInicioTrabajo").value;    
              var fechafinal=document.getElementById("txtFechaFinTrabajo").value;
              var salario=document.getElementById("txtSalarioTrabajo").value;
              var observacion=document.getElementById("txtObservacionTrabajo").value;
                            
               document.agregarExperienciaLaboral.action = "./ExperienciaLaboralServlet?accion=actualizar&id=" + idexperiencia + "&idpersona=" + idpersona +
                         "&empresa=" + empresa + "&puesto=" + puesto + 
                        "&fechainicio=" + fechainicio + "&fechafinal=" + fechafinal +
                        "&salario=" + salario + "&observacion=" + observacion;                            
                    document.agregarExperienciaLaboral.submit(); 
                            
            }
            
            function agregarNuevaExperiencia()
            {
              $("#txtIdExperienciaLaboral").val("");              
               $("#txtEmpresa").val("");
               $("#txtPuesto").val("");
               $("#txtFechaInicioTrabajo").val("");
               $("#txtFechaFinTrabajo").val("");
               $("#txtSalarioTrabajo").val("");
               $("#txtObservacionTrabajo").val("");
               $("#btnInsertarExperiencia").val("Agregar");
            }
            
            function modificarExperiencia(id, idexperiencia, empresa, puesto, fechainicio, fechafinal, salario, observacion)
            {  
               $("#txtIdExperienciaLaboral").val(idexperiencia);              
               $("#txtEmpresa").val(empresa);
               $("#txtPuesto").val(puesto);
               $("#txtFechaInicioTrabajo").val(fechainicio);
               $("#txtFechaFinTrabajo").val(fechafinal);
               $("#txtSalarioTrabajo").val(salario);
               $("#txtObservacionTrabajo").val(observacion);
               $("#btnInsertarExperiencia").val("Actualizar");
               //session.setAttribute("BanderaEstudio","1");
               
            }
            
             function accionExperiencia()
            {
              if( $("#btnInsertarExperiencia").val()=="Agregar")
                  {
                    insertarExperiencia();  
                  }
                
              else if( $("#btnInsertarExperiencia").val()=="Actualizar")
                    {
                      actualizarExperiencia();  
                    }
            }
            
            function obtenerExperiencia(id, ide)
            {
                document.agregarExperienciaLaboral.action = "ExperienciaLaboralServlet?accion=obtenerPorId&id=" + id + "&ide=" + ide;
                document.agregarExperienciaLaboral.submit();                
            }
            
            function eliminarExperiencia(id, ide){
                document.agregarExperienciaLaboral.action = "ExperienciaLaboralServlet?accion=eliminar&id=" + id + "&ide=" + ide;
                document.agregarExperienciaLaboral.submit();
            }
            
            function cancelar(){
                document.location = "persona.jsp";
            }
     
  $(function() {
    $( "#tabs" ).tabs();
    
     $('#tabs').tabs('select', <%=hoja%>);
    
    //$( "#tabs" ).tabs({ disabled: [ 5 ] });
    
     $("[id$=txtFechaNacimiento]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
                
       $("[id$=txtFechaInicioEstudio]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
                
       $("[id$=txtFechaFinEstudio]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
                
        $("[id$=txtFechaInicioEstudio]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
                
       $("[id$=txtFechaFinEstudio]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
                
       $("[id$=txtFechaInicioTrabajo]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
                
       $("[id$=txtFechaFinTrabajo]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
                
         $("[id$=txtFechaIngreso]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
                
         $("[id$=txtFechaSalida]").datepicker(
                {
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1
                });
  });
  
  
       var listarDepartamentosGeografico = function() {
                url = "./DepartamentoGeograficoServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbDepartamentoGeografico').html('');
                    $('#cmbDepartamentoGeografico').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbDepartamentoGeografico').append('<option value='+ item.idDepartamentoGeografico +'>'+ item.nombre+'</option>');	                         
                        $("#cmbDepartamentoGeografico").val(<%=iddepartamentogeografico %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
           var listarPaises = function() {
                url = "./PaisServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbPais').html('');
                    $('#cmbPais').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbPais').append('<option value='+ item.idPais +'>'+ item.nombre+'</option>');	                         
                        $("#cmbPais").val(<%= idpaisnacimiento %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
           
           var listarPaisesNacimiento = function() {
                url = "./PaisServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbPaisNacimiento').html('');
                    $('#cmbPaisNacimiento').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbPaisNacimiento').append('<option value='+ item.idPais +'>'+ item.nombre+'</option>');	                         
                         $("#cmbPaisNacimiento").val(<%= idpais %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
             var listarEstadoCivil = function() {
                url = "./EstadoCivilServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbEstadoCivil').html('');
                    $('#cmbEstadoCivil').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbEstadoCivil').append('<option value='+ item.idEstadoCivil +'>'+ item.nombre+'</option>');	                         
                        $("#cmbEstadoCivil").val(<%= idestadocivil %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
             var listarAfp = function() {
                url = "./AfpServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbAfp').html('');
                    $('#cmbAfp').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbAfp').append('<option value='+ item.idafp +'>'+ item.nombre+'</option>');	                         
                        $("#cmbAfp").val(<%= idafp %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
            var listarBanco = function() {
                url = "./BancoServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbBanco').html('');
                    $('#cmbBanco').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbBanco').append('<option value='+ item.idBanco +'>'+ item.nombre+'</option>');	                         
                        $("#cmbBanco").val(<%= idbanco %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
             var listarPuesto = function() {
                url = "./PuestoServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbPuesto').html('');
                    $('#cmbPuesto').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbPuesto').append('<option value='+ item.idPuesto +'>'+ item.nombre+'</option>');	                         
                        $("#cmbPuesto").val(<%= idpuesto %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
             var listarDepartamento = function() {
                url = "./DepartamentoServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbDepartamento').html('');
                    $('#cmbDepartamento').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbDepartamento').append('<option value='+ item.idDepartamento +'>'+ item.nombre+'</option>');	                         
                        $("#cmbDepartamento").val(<%= iddepartamento %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
              var listarNivel = function() {
                url = "./NivelServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbNivel').html('');
                    $('#cmbNivel').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbNivel').append('<option value='+ item.idNivel+'>'+ item.nombre+'</option>');	                         
                         $("#cmbNivel").val(<%= idnivel2 %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
            var listarTipoEmpleado = function() {
                url = "./TipoEmpleadoServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbTipoEmpleado').html('');
                    $('#cmbTipoEmpleado').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbTipoEmpleado').append('<option value='+ item.idTipoEmpleado+'>'+ item.nombre+'</option>');	                         
                        $('#cmbTipoEmpleado').val(<%= idtipoempleado %>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
            
            //documento cargado
            $(document).ready(function() {
               
                listarDepartamentosGeografico();
                listarPaises(); 
                listarPaisesNacimiento(); 
                listarEstadoCivil();
                listarAfp();
                listarBanco();
                listarPuesto();
                listarDepartamento();
                listarNivel();
                listarTipoEmpleado();
                 $("#cmbSexo").val("<%= sexo %>");
                 $("#cmbHorario").val("<%= idhorario %>");
                 $("#cmbHabilitado").val("<%= habilitado %>");
              
            });
            
             function numbersonly(e) {
                var unicode = e.charCode ? e.charCode : e.keyCode
                if (unicode != 8 && unicode != 44 && unicode !=46) {
                    if (unicode < 48 || unicode > 57)
                    { return false }
                }
            }
                        
  </script>
</head>

<body>
<div id="encabezado">Control de Personal y Planilla</div>
<div id="menu"><jsp:include page="menu.jsp"/></div>
<div id="titulo">Administraci&oacute;n de Personal<img src="imgs/separador.gif" width="750" height="15" /></div>
<div id="contenido">

<table width="100%" border="0">
    <tr>
        <td align="center" bgcolor="#CCD8E6"><strong>Agregando Empleado</strong></td>
    </tr>        
    <tr>
      <td>              
      <div id="tabs">
  <ul>
    <li><a href="#tabs-0">Buscar Empleados</a></li>
    <li><a href="#tabs-1">Datos Generales</a></li>
    <li><a href="#tabs-11">Datos Empleado</a></li>
    <li><a href="#tabs-2">Estudios Realizados</a></li>
    <li><a href="#tabs-3">Experiencia Laboral</a></li>
    <!--li><a href="#tabs-4">Referencias</a></li-->
  </ul>
  <div id="tabs-0">          
    
    <table width="100%" border="0">  
    <tr>
        <td width="81%"><iframe src="PersonaServlet?accion=buscar" name="listado" width="600" height="500" marginheight="0" frameborder="0" class="borde"></iframe></td>
        <td width="19%" align="center" valign="bottom">[ <a href="persona.jsp?agr=1&hoja=1" class="menu">Agregar</a> ] </td>
    </tr>  
    </table>
  </div>
  <div id="tabs-1">
      <form id="agregar" name="Generalesfrm" method="post" style="margin:0px;" onSubmit="return valida6(this);">
      <table width="100%" border="0" align="center" class="borde">
        <tr>
          <td>&nbsp;</td>
          <td align="center" bgcolor="#CCD8E6">Generales</td>
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
          <td width="20%">Nombres</td>
          <td width="26%"><input name="txtNombres" type="text" class="fuente11" id="txtNombres" value="<%=nombres%>" />
          *</td>
          <td width="2%">&nbsp;</td>
          <td width="20%">Apellidos</td>
          <td width="28%"><input name="txtApellidos" type="text" class="fuente11" id="txtApellidos" value="<%=apellidos%>" />
          *</td>
          <td width="2%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Sexo</td>
          <td><select name="cmbSexo" class="fuente11" id="cmbSexo">
            <option value="-1" selected="selected">Seleccionar</option>             
            <option value="F">Femenino</option>
            <option value="M">Masculino</option>
          </select>
          *</td>
          <td>&nbsp;</td>
          <td>Estado Civil</td>
          <td>
          <select name="cmbEstadoCivil" class="fuente11" id="cmbEstadoCivil">   
             <option></option>
          </select>
          </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Fecha Nac.</td>
          <td><input name="txtFechaNacimiento" type="text" class="fuente11der" id="txtFechaNacimiento" size="12" value="<%= persona.getFechaNacimiento() == null ? "" : fechanacimientoString%>"/>
              *</td>
          <td>&nbsp;</td>         
           <td>País de nacimiento</td>
           <td>
              <select id="cmbPaisNacimiento" name="cmbPaisNacimiento" class="fuente11">
                <option></option>
             </select>
          </td>
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
          <td align="center" bgcolor="#CCD8E6">Direcci&oacute;n</td>
          <td colspan="4" class="bordeinferior">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
         <tr>
          <td colspan="7">&nbsp;</td>          
        </tr>
          <tr>
          <td>&nbsp;</td>
           <td>País Domicilio</td>
           <td>
              <select id="cmbPais" name="cmbPais" class="fuente11">
                <option></option>
             </select>
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
          <tr>
          <td>&nbsp;</td>
           <td>Departamento</td>
          <td>
              <select id="cmbDepartamentoGeografico" name="cmbDepartamentoGeografico" class="fuente11">
                <option></option>
             </select>
          *</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>        
        <tr>
          <td>&nbsp;</td>
          <td>Ciudad</td>
          <td><input name="txtCiudad" type="text" class="fuente11" id="txtCiudad" value="<%=ciudad%>" />
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td> 
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Direcci&oacute;n</td>          
          <td colspan="3">
              <textarea cols="40" rows="3" class="fuente11" name="txtDireccion" id="txtDireccion"><%=direccion%></textarea>
          </td>
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
          <td align="center" bgcolor="#CCD8E6">Contacto</td>
          <td colspan="4" class="bordeinferior">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td colspan="7">&nbsp;</td>          
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Tel&eacute;fono</td>
          <td><input name="txtTelefono" type="text" class="fuente11" id="txtTelefono" value="<%=telefono%>" />
          *</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>e-mail</td>
          <td><input name="txtEmail" type="text" class="fuente11" id="txtEmail" value="<%=email%>" /></td>
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
          <td align="center" bgcolor="#CCD8E6">Documentos</td>
          <td colspan="4" class="bordeinferior">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td colspan="7">&nbsp;</td>          
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>DUI</td>
          <td><input name="txtDui" type="text" class="fuente11" id="txtDui" value="<%=dui%>" />
          *</td>
          <td>&nbsp;</td>
          <td>NIT</td>
          <td><input name="txtNit" type="text" class="fuente11" id="txtNit" value="<%=nit%>" /></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>ISSS</td>
          <td><input name="txtIsss" type="text" class="fuente11" id="txtIsss" value="<%=isss%>" /></td>
          <td>&nbsp;</td>
          <td>NUP</td>
          <td><input name="txtNup" type="text" class="fuente11" id="txtNup" value="<%=nup%>" /></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>AFP</td>
          <td>
          <select name="cmbAfp" class="fuente11" id="cmbAfp"> 
               <option></option>
          </select>          
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Tipo Sangre </td>
          <td><input name="txtTipoSanguineo" type="text" class="fuente11" id="txtTipoSanguineo" value="<%=tiposanguineo%>" /></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
       <tr>
          <td colspan="7">&nbsp;</td>          
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
            
                <%if(session.getAttribute("PersonaActualizar") == null){%>
                        ${clienteActualizar}
                                          
                        <input type="button" value="Agregar" onclick="insertar()" id="btnInsertar" />                         
                   
                        <%}else{%>
                   
                        <input type="button" value="Actualizar" onclick="actualizar(<%=persona.getIdPersona()%>)" 
                               id="btnActualizar" />                        
                   
                <%}%>
            
             <input name="tipo" type="hidden" id="tipo" value="1" />
          </td>
            
          <td>&nbsp;</td>
        </tr>
      </table>
      </form>
  </div>

 <div id="tabs-11">
      <form id="agregarEmpleado" name="agregarEmpleado" method="post" style="margin:0px;" onSubmit="return valida6(this);">
      <table width="100%" border="0" align="center" class="borde">
        <tr>
          <td>&nbsp;</td>
          <td align="center" bgcolor="#CCD8E6">Informaci&oacute;n de Empleado</td>
          <td colspan="4" align="right" class="bordeinferior">[ <a href="personas.jsp" class="menu">Regresar</a> ]</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td colspan="7">&nbsp;</td>          
        </tr>
        <tr>          
          <td width="2%">&nbsp;</td>
          <td width="20%">Codigo Empleado</td>
          <td colspan="4"><input name="txtIdEmpleado" type="text" class="fuente11" id="txtId" value="<%=idempleado%>" /></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>         
          <td>Tipo Planilla</td>
          <td>
          <select name="cmbTipoEmpleado" class="fuente11" id="cmbTipoEmpleado">   
             <option></option>
          </select>
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>  
        <tr>
          <td>&nbsp;</td>         
          <td>Puesto</td>
          <td>
          <select name="cmbPuesto" class="fuente11" id="cmbPuesto">   
             <option></option>
          </select>
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>         
          <td>Departamento</td>
          <td>
          <select name="cmbDepartamento" class="fuente11" id="cmbDepartamento">   
             <option></option>
          </select>
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>  
          <tr>
          <td>&nbsp;</td>         
          <td>Horario</td>
          <td>
          <select name="cmbHorario" class="fuente11" id="cmbHorario">
            <option value="-1" selected="selected">Seleccionar</option>             
            <option value="1">Tiempo Completo</option>
            <option value="2">Medio Tiempo</option>
          </select>     
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>  
          <tr>
          <td>&nbsp;</td>         
          <td>Habilitado</td>
          <td>
          <select name="cmbHabilitado" class="fuente11" id="cmbHabilitado">
            <option value="-1" selected="selected">Seleccionar</option>             
            <option value="A">Empleado Activo</option>
            <option value="I">Empleado Inactivo</option>
          </select>          
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>  
        <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Fecha de ingreso</td>
          <td><input name="txtFechaIngreso" type="text" class="fuente11der" id="txtFechaIngreso" size="12" value="<%= empleado.getFechaIngreso() == null ? "" : fechaingresoString%>"/>
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Fecha de salida</td>
          <td><input name="txtFechaSalida" type="text" class="fuente11der" id="txtFechaSalida" size="12" value="<%= empleado.getFechaSalida() == null ? "" : fechasalidaString%>"/>
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Motivo</td>          
           <td colspan="4">
              <textarea cols="40" rows="3" class="fuente11" name="txtMotivoSalida" id="txtMotivoSalida"><%=motivosalida%></textarea>
           </td>
          <td>&nbsp;</td>
        </tr> 
        <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Salario</td>
          <td><input name="txtSalario" type="text" class="fuente11der" id="txtSalario" size="12" value="<%=salario%>"/>
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>  
        <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Reloj Marcador</td>
          <td><input name="txtReloj" type="text" class="fuente11der" id="txtReloj" size="12" value="<%=reloj%>"/>
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>            
         <tr>
          <td>&nbsp;</td>         
          <td>Banco</td>
          <td>
          <select name="cmbBanco" class="fuente11" id="cmbBanco">   
             <option></option>
          </select>
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>  
           <tr>
          <td width="2%">&nbsp;</td>
          <td width="20%">Cuenta Bancaria</td>
          <td><input name="txtCuentaBancaria" type="text" class="fuente11der" id="txtCuentaBancaria" size="12" value="<%=cuentabancaria%>"/>
          </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>      
         <tr>
          <td>&nbsp;</td>
          <td colspan="5" align="center" bgcolor="#CCD8E6">
            
                <%if(session.getAttribute("EmpleadoActualizar") == null){%>
                        ${clienteActualizar}
                                          
                        <input type="button" value="Agregar" onclick="insertarEmpleado()" id="btnInsertarEmpleado" />                         
                   
                        <%}else{%>
                   
                        <input type="button" value="Actualizar" onclick="actualizarEmpleado(<%=empleado.getIdEmpleado()%>)" 
                               id="btnActualizarEmpleado" />                        
                   
                <%}%>
            
             <input name="tipo" type="hidden" id="tipo" value="1" />
          </td>
            
          <td>&nbsp;</td>
        </tr>
        </table>
      </form>
  </div>
          
                  
  <div id="tabs-2">
      <table width="100%" border="0">
    <tr>
      <td align="center" bgcolor="#CCD8E6"><strong>Agregando Estudios Realizados</strong></td>
    </tr>
    
    <tr>
      <td><form id="agregarEstudio" name="agregarEstudio" method="post" action="procesos/personaes.jsp" style="margin:0px;" onSubmit="return valida7(this);">
        <table width="60%" border="0" align="center" class="borde">
         
           <tr>
            <td width="2%">&nbsp;</td>
            <td width="35%">Codigo</td>
            <td width="61%"><input name="txtIdEstudio" type="text" class="fuente11" id="txtIdEstudio" size="40" value="<%=idestudio2%>" /></td>
            <td width="2%">&nbsp;</td>
          </tr> 
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="35%">Instituci&oacute;n</td>
            <td width="61%"><input name="txtInstitucion" type="text" class="fuente11" id="txtInstitucion" size="40" value="<%=institucion2%>" /></td>
            <td width="2%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Nivel de Estudio</td>
            <td><select name="cmbNivel" class="fuente11" id="cmbNivel">
               <option></option>              
            </select>                        
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Fecha de inicio</td>
            <td><input name="txtFechaInicioEstudio" type="text" class="fuente11der" id="txtFechaInicioEstudio" size="12" value="<%= fechainicio2 == null ? "" : fechainicio2%>"/></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Fecha de finalizaci&oacute;n</td>
            <td><input name="txtFechaFinEstudio" type="text" class="fuente11der" id="txtFechaFinEstudio" size="12" value="<%= fechafinal2 == null ? "" : fechafinal2%>"/></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>T&iacute;tulo Obtenido</td>
            <td><input name="txtTitulo" type="text" class="fuente11" id="txtTitulo" size="40" value="<%=titulo2%>" /></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4" align="center" bgcolor="#CCD8E6"> 
               
                 <input type="button" value="Agregar" onclick="accionEstudio()" id="btnInsertarEstudio" /> 
                
               <%if(session.getAttribute("EstudioActualizar") == null){%>
                        ${clienteActualizar}                                         
                                               
                   
                        <%}else{%>
                   
                        <!--input type="button" value="Actualizar" onclick="actualizarEstudio()" 
                               id="btnActualizarEstudio" /-->                        
                   
                <%}%>                
                              
              <input name="tipo" type="hidden" id="tipo" value="1" />
              <input name="id" type="hidden" id="id" value="<%//= vlid %>" /></td>
            </tr>
        </table>
        </form>
      </td>
    </tr>
    <tr>
      <td align="right">[ <a href="#" class="menu" onclick="agregarNuevoEstudio()">Agregar nuevo Estudio</a> ] </td>
    </tr>
    <tr>
      <td>
	  <table width="100%" border="0" class="borde">
        <tr>
          <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Estudios Realizados</strong></td>
          <td colspan="5" class="bordeinferior">&nbsp;</td>
          </tr>
        <%if(session.getAttribute("listaEstudios") != null){
           List<EstudioBean> lstEstudios = (List<EstudioBean>)session.getAttribute("listaEstudios");
           for(int i=0; i < lstEstudios.size(); i++){
               EstudioBean estudio = lstEstudios.get(i);

                //EstudioBean estudio = (EstudioBean) session.getAttribute("EstudioActualizar");
                estudio = estudio == null ? new EstudioBean() : estudio;
                int idestudio= estudio.getIdEstudio();
                int idnivel=estudio.getIdNivelEstudio();
                String institucion=estudio.getInstitucion();
                String titulo=estudio.getTitulo();
                java.sql.Date fechainicio=null;    
                java.sql.Date fechafinal=null;  
                String fechainicioString=null;
                String fechafinalString=null;
                 if (estudio.getFechaInicio()!= null)
                    {
                    fechainicioString=formatoFecha.format(estudio.getFechaInicio());
                    fechainicio = new java.sql.Date(formatoFecha.parse(fechainicioString).getTime());    
                   }

                if (estudio.getFechaFinal()!= null)
                    {
                    fechafinalString=formatoFecha.format(estudio.getFechaFinal());
                    fechafinal= new java.sql.Date(formatoFecha.parse(fechafinalString).getTime());    
                   }

       %>

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
          <td width="2%">&nbsp;</td>
          <td width="19%">Codigo</td>
          <td width="30%" class="borde"><%=idestudio %></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td width="2%">&nbsp;</td>
          <td width="19%">Instituci&oacute;n</td>
          <td width="30%" class="borde"><%=institucion %></td>
          <td width="2%">&nbsp;</td>
          <td width="10%">Nivel</td>
          <td width="35%" class="borde"><%=idnivel %></td>
          <td width="2%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Per&iacute;odo</td>
          <td class="borde"><%=estudio.getFechaInicio() == null ? "" : fechainicioString %> --- <%=estudio.getFechaFinal() == null ? "" : fechafinalString %></td>
          <td>&nbsp;</td>
          <td>T&iacute;tulo</td>
          <td class="borde"><%=titulo %></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td colspan="2" align="center" bgcolor="#f0f0f0" class="borde">[ <a onclick="modificarEstudio(<%=id%>,<%=idestudio%>,<%=idnivel %>,'<%=institucion %>', '<%=titulo %>','<%=fechainicioString %>','<%=fechafinalString %>')" href="#">Modificar</a> ] | [ <a onclick="eliminarEstudio(<%=id%>,<%=idestudio%>)" href="#">Eliminar</a>]</td>                    
          <td>&nbsp;</td>
        </tr>
  <%
       }
                     }
  %>
        <tr>
          <td colspan="7" class="bordeinferior">&nbsp;</td>
          </tr>
      </table></td>
    </tr>
  </table>
  </div>
  <div id="tabs-3">
   <table width="100%" border="0">
    <tr>
      <td align="center" bgcolor="#CCD8E6"><strong>Agregando Experiencia Laboral</strong></td>
    </tr>
    
    <tr>
      <td><form id="agregarExperienciaLaboral" name="agregarExperienciaLaboral" method="post" action="procesos/personae.jsp" style="margin:0px;" onSubmit="return valida8(this);">
        <table width="60%" border="0" align="center" class="borde">
          <tr>
            <td colspan="4" align="center" bgcolor="#F0F0F0"><strong><%//= rs.getString(1) %></strong></td>
            </tr>
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="35%">Codigo</td>
            <td width="61%"><input name="txtIdExperienciaLaboral" type="text" class="fuente11" id="txtIdExperienciaLaboral" size="40" /></td>
            <td width="2%">&nbsp;</td>
          </tr>
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="35%">Empresa</td>
            <td width="61%"><input name="txtEmpresa" type="text" class="fuente11" id="txtEmpresa" size="40" /></td>
            <td width="2%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Puesto</td>
            <td><input name="txtPuesto" type="text" class="fuente11" id="txtPuesto" size="40" /></td></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Fecha de inicio</td>
           <td><input name="txtFechaInicioTrabajo" type="text" class="fuente11der" id="txtFechaInicioTrabajo" size="12"/></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Fecha de finalizaci&oacute;n</td>
            <td><input name="txtFechaFinTrabajo" type="text" class="fuente11der" id="txtFechaFinTrabajo" size="12"/></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Salario mensual</td>
            <td><input name="txtSalarioTrabajo" type="text" class="fuente11der" id="txtSalarioTrabajo" size="12" /></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Observacion</td>
            <td>
                <textarea cols="40" rows="2" class="fuente11" name="txtObservacionTrabajo" id="txtObservacionTrabajo"></textarea>
            </td>
            <td>&nbsp;</td>
          </tr> 
            <tr>
            <td colspan="4" align="center" bgcolor="#CCD8E6"> 
                
                 <input type="button" value="Agregar" onclick="accionExperiencia()" id="btnInsertarExperiencia" />
               
                 
               <%if(session.getAttribute("ExperienciaLaboralActualizar") == null){%>
                        ${clienteActualizar}                                         
                                           
                   
                        <%}else{%>
                   
                        <!--input type="button" value="Actualizar" onclick="actualizarExperiencia()" 
                               id="btnActualizarExperiencia" /-->                        
                   
                <%}%> 
                
              
              <input name="tipo" type="hidden" id="tipo" value="1" />
              <input name="id" type="hidden" id="id" value="<%//= vlid %>" /></td>
            </tr>
        </table>
            </form>      </td>
    </tr>
    <tr>
       <td align="right">[ <a href="#" class="menu" onclick="agregarNuevaExperiencia()">Agregar nuevo Experiencia Laboral</a> ] </td>
    </tr>
    <tr>
      <td>
	  <table width="100%" border="0" class="borde">
        <tr>
          <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Experiencia Laboral</strong></td>
          <td colspan="6" class="bordeinferior">&nbsp;</td>
          </tr>
    <%if(session.getAttribute("listaExperienciaLaboral") != null){
           List<ExperienciaLaboralBean> lstExperienciaLaboral = (List<ExperienciaLaboralBean>)session.getAttribute("listaExperienciaLaboral");
           for(int i=0; i < lstExperienciaLaboral.size(); i++){
               ExperienciaLaboralBean experiencia = lstExperienciaLaboral.get(i);
               
                experiencia = experiencia == null ? new ExperienciaLaboralBean() : experiencia;
                int idexperiencia= experiencia.getIdExperienciaLaboral();    
                String empresa=experiencia.getEmpresa();
                String puesto=experiencia.getPuesto();
                java.sql.Date fechainicio3=null;    
                java.sql.Date fechafinal3=null;  
                String fechainicioString3=null;
                String fechafinalString3=null;
                 if (experiencia.getFechaInicio()!= null)
                    {
                    fechainicioString3=formatoFecha.format(experiencia.getFechaInicio());
                    fechainicio3 = new java.sql.Date(formatoFecha.parse(fechainicioString3).getTime());    
                   }

                if (experiencia.getFechaFinal()!= null)
                    {
                    fechafinalString3=formatoFecha.format(experiencia.getFechaFinal());
                    fechafinal3= new java.sql.Date(formatoFecha.parse(fechafinalString3).getTime());    
                   }
                   
                Double salariotrabajo=experiencia.getSalario();
                String observaciontrabajo=experiencia.getObservacion();
        %>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td width="4%">&nbsp;</td>
          <td width="16%">Empresa</td>
          <td width="31%" class="borde"><%=empresa %></td>
          <td width="2%">&nbsp;</td>
          <td width="10%">Puesto</td>
          <td colspan="2" class="borde"><%=puesto %></td>
          <td width="2%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Per&iacute;odo</td>
          <td class="borde"><%=experiencia.getFechaInicio() == null ? "" : fechainicioString3 %> --- <%=experiencia.getFechaFinal() == null ? "" : fechafinalString3%></td>
          <td>&nbsp;</td>
          <td>Salario</td>
          <td width="17%" align="center" class="borde"><%=salariotrabajo %></td>
          <td width="18%">($ Mensuales) </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td width="4%">&nbsp;</td>
          <td width="16%">Observacion</td>
          <td colspan="5" class="borde"><%=observaciontrabajo %></td>         
          <td>&nbsp;</td>
        </tr>  
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td colspan="2" align="center" bgcolor="#f0f0f0" class="borde">[ <a onclick="modificarExperiencia(<%=id%>,<%=idexperiencia%>,'<%=empresa%>','<%=puesto%>', '<%=fechainicioString3 %>','<%=fechafinalString3 %>','<%=salariotrabajo %>','<%=observaciontrabajo%>')" href="#">Modificar</a> ] | [ <a onclick="eliminarExperiencia(<%=id%>,<%=idexperiencia%>)" href="#">Eliminar</a>]</td>                    
          <td>&nbsp;</td>
        </tr>
  <%
       }
                     }
  %>
        <tr>
          <td colspan="7" class="bordeinferior">&nbsp;</td>
          </tr>

      </table>
	  </td>
    </tr>
  </table>
  </div>
          
  <div id="tabs-4" style="display:none;">
   <table width="100%" border="0">
    <tr>
      <td align="center" bgcolor="#CCD8E6"><strong>Agregando Referencias Personales</strong></td>
    </tr>
   <tr>
      <td><form id="agregar" name="agregar" method="post" action="procesos/personar.jsp" style="margin:0px;" onSubmit="return valida9(this);">
        <table width="60%" border="0" align="center" class="borde">
          <tr>
            <td colspan="4" align="center" bgcolor="#F0F0F0"><strong><%//= rs.getString(1) %></strong></td>
            </tr>
          <tr>
            <td width="3%">&nbsp;</td>
            <td width="25%">Nombres</td>
            <td width="69%"><input name="nombres" type="text" class="fuente11" id="nombres" size="30" />
            *</td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Apellidos</td>
            <td><input name="apellidos" type="text" class="fuente11" id="apellidos" size="30" />
            *</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Referencia</td>
            <td><input name="referencia" type="text" class="fuente11" id="referencia" size="40" />
            *</td>
            <td>&nbsp;</td>
          </tr>
          
          <tr>
            <td>&nbsp;</td>
            <td>Direcci&oacute;n</td>
            <td><input name="direccion1" type="text" class="fuente11" id="direccion1" size="40" />
            *</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><input name="direccion2" type="text" class="fuente11" id="direccion2" size="40" /></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Tel&eacute;fono</td>
            <td><input name="telefono" type="text" class="fuente11" id="telefono" size="25" />
            *</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>email</td>
            <td><input name="email" type="text" class="fuente11" id="email" size="30" /></td>
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
          <td width="16%">Nombre</td>
          <td colspan="3" class="borde"><%//= rsr.getString(4) + ", " + rsr.getString(3) %></td>
          <td colspan="2">&nbsp;</td>
          <td width="2%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Referencia</td>
          <td class="borde"><%//= rsr.getString(5) %></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td width="17%" align="center">&nbsp;</td>
          <td width="18%">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Direcci&oacute;n</td>
          <td colspan="4" class="borde"><%//= rsr.getString(6) %></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td colspan="4" class="borde"><%//= rsr.getString(7) %></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>Tel&eacute;fono</td>
          <td class="borde"><%//= rsr.getString(8) %></td>
          <td>&nbsp;</td>
          <td>email</td>
          <td colspan="2" class="borde"><%//= rsr.getString(9) %></td>
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
<div id="pie">ACOPES DE R.L.</div>
</body>
</html>
