<%@page import="Bean.DepartamentoBean"%>
 
 <%
    DepartamentoBean departamento = (DepartamentoBean) session.getAttribute("DepartamentoActualizar");
    departamento = departamento == null ? new DepartamentoBean() : departamento;
    int id= departamento.getIdDepartamento();     
    int idGerencia = departamento.getIdGerencia();
    String nombre = departamento.getNombre() == null ? "" : departamento.getNombre();   
    String encargado = departamento.getEncargado() == null ? "" : departamento.getEncargado();
    String telefono = departamento.getTelefono() == null ? "" : departamento.getTelefono();
    
    %>
    
        <script type="text/javascript">
            function insertar(){
                var nombre = document.getElementById("txtNombre").value;                
                if(nombre == ""){
                    alert("Campos Nombre es obligatorio.")
                }else{                    
                    var idGerencia=$("#cboGerencia").val();
                    var encargado = document.getElementById("txtEncargado").value;
                    var telefono = document.getElementById("txtTelefono").value;
                    document.gerenciaFrm.action = "./DepartamentoServlet?accion=insertar&nombre=" + nombre + 
                         "&idGerencia=" + idGerencia + "&encargado=" + encargado + "&telefono=" + telefono;
                    document.gerenciaFrm.submit();                    
                }
            }
            
            function actualizar(id){
                var nombre = document.getElementById("txtNombre").value;                
                if(nombre == ""){
                    alert("Campos Nombre es obligatorios.")
                }else{                    
                    var idGerencia=$("#cboGerencia").val();
                    var encargado = document.getElementById("txtEncargado").value;
                    var telefono = document.getElementById("txtTelefono").value;
                    document.gerenciaFrm.action = "./DepartamentoServlet?accion=actualizar&id=" + id +
                        "&nombre=" + nombre + "&idGerencia=" + idGerencia + "&encargado=" + encargado + "&telefono=" + telefono;
                    document.gerenciaFrm.submit();
                }
            }
            
            function cancelar(){
                document.location = "gerenciaFrm.jsp";
            }
            
            var listarGerencias = function() {
                url = "./GerenciaServlet?accion=listarGerencias";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cboGerencia').html('');
                    $('#cboGerencia').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cboGerencia').append('<option value='+ item.idGerencia+'>'+ item.nombre+'</option>');	                         
                        $("#cboGerencia").val(<%=idGerencia%>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
            //documento cargado
            $(document).ready(function() {
                //inicializando las variables
                /*frmFotoCliente = $("#frmFotoCliente");

                $(":button").button();
		
                $('#btnRetroceder').click(retroceder);*/
	
                listarGerencias();
                
                //$('#cboGerencia').val('<%=idGerencia%>');
                //$("#cboGerencia option[value="+<%=idGerencia%>+"]").attr("selected",true);

                
                /*
                //Al hacer submit al formulario se ejecuta este método
                frmFotoCliente.validate({
                    rules: {
                        //Indicamos los campos necesarios y que valores aceptan
                        fupFotografia: {
                            required: true,
                            accept  : 'JPEG|JPG|PNG|GIF|jpeg|jpg|gif|png'
                        }
                    },
                    messages: {
                        //Indicamos los mensajes en caso no se cumplan las reglas anteriores
                        fupFotografia: {
                            required: "Por favor, ingrese una imagen.",
                            accept  : "Solo ingrese imagenes en los formatos: JPEG, JPG, PNG, o, GIF."
                        }
                    },	
                    
                    submitHandler : function(form) {
                        if($('#cboCliente').find(':selected').val() == -1){
                            alert("Seleccione una empresa");
                        }else{
                            cargarFotografia();
                        }
                    } 
		
                });  
		*/
            });

        </script>

<table width="100%" border="0">
  <tr>
    <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Departamentos</strong></td>
  </tr>
  <tr>
    <td width="81%"><iframe src="DepartamentoServlet?accion=buscar" name="listado" width="600" height="350" marginheight="0" frameborder="0" class="borde"></iframe></td>
    <td width="19%" align="center" valign="bottom">[ <a href="catalogos.jsp?cat=7&amp;agr=1" class="menu">Agregar</a> ] </td>
  </tr>  
  <%
// Vemos si mostramos el formulario de agregar
if (vlagregar != null || vlmostrar != null) {
%>
<tr>
    <td colspan="2" width="81%">

         <hr size="1" />
        <form name="gerenciaFrm" method="post" style="margin: 0px;" onSubmit="return valida2(this);">
            <table width="60%" border="0" align="center" class="borde">
                <tr>                
                <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Detalles de Departamento</strong></td>
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
                    <td>Nombre:</td>
                    <td><input type="text" id="txtNombre" class="fuente11" value="<%=nombre%>" /></td>
                </tr>    
                <tr>
                    <td>Gerencia:</td>
                    <td>                     
                         <select id="cboGerencia" name="cboGerencia" class="fuente11">
                            <option></option>
                         </select>
                    </td>
                </tr>
                 <tr>
                    <td>Encargado:</td>
                    <td><input type="text" id="txtEncargado" class="fuente11" value="<%=encargado%>" /></td>
                </tr>
                <tr>
                    <td>Teléfono:</td>
                    <td><input type="text" id="txtTelefono" class="fuente11" value="<%=telefono%>" /></td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="Cancelar" onclick="cancelar()" id="btnCancelar" />
                    </td>
                        <%if(session.getAttribute("DepartamentoActualizar") == null){%>
                        ${clienteActualizar}
                    <td>
                        <input type="button" value="Insertar" onclick="insertar()" id="btnInsertar" />                         
                    </td>
                        <%}else{%>
                    <td>
                        <input type="button" value="Actualizar" onclick="actualizar(<%=departamento.getIdDepartamento()%>)" 
                               id="btnActualizar" />                        
                    </td>
                        <%}%>
                </tr>
            </table>
        </form>
        
    </td>
    
  </tr>  

  <%
} // Fin de mostrar formulario de agregar
%>

</table>



    
    
       


