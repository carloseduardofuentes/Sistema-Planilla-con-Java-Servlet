<%@page import="Bean.PuestoBean"%>

<%
 //int id = Integer.parseInt(request.getParameter("id") == null ? "0" : 
 //               request.getParameter("id"));
 %>
 
 <%
    PuestoBean puesto = (PuestoBean) session.getAttribute("PuestoActualizar");
    puesto = puesto == null ? new PuestoBean() : puesto;
    int id= puesto.getIdPuesto();  
    String nombre = puesto.getNombre() == null ? "" : puesto.getNombre();       
    int idnivel = puesto.getIdNivelEstudio();
    Double salariobase = puesto.getSalariobase();
    Double salariomaximo = puesto.getSalariomaximo();
    int tiempoexperiencia = puesto.getTiempoExperiencia();
    int edadminima = puesto.getEdadMinima();
    int edadmaxima = puesto.getEdadMaxima();
    String sexo = puesto.getSexo() == null ? "" : puesto.getSexo();
    
    %>
    
        <script type="text/javascript">
            function insertar(){
                var nombre = document.getElementById("txtNombre").value;                
                if(nombre == ""){
                    alert("Campo Nombre es obligatorio.")
                }else{            
                    var idnivel= $("#cmbNivel").val();
                    var salariobase= document.getElementById("txtSalarioBase").value;
                    var salariomaximo= document.getElementById("txtSalarioMaximo").value;
                    var tiempoexperiencia= document.getElementById("txtTiempoExperiencia").value;
                    var edadminima= document.getElementById("txtEdadMinima").value;
                    var edadmaxima= document.getElementById("txtEdadMaxima").value;
                    var sexo= $("#cmbSexo").val();                    

                    document.puestoFrm.action = "./PuestoServlet?accion=insertar&nombre=" + nombre + 
                         "&idnivel=" + idnivel + "&salariobase=" + salariobase + "&salariomaximo=" + salariomaximo + 
                         "&tiempoexperiencia=" + tiempoexperiencia + "&edadminima=" + edadminima + "&edadmaxima=" + edadmaxima +
                         "&sexo=" + sexo;
                    document.puestoFrm.submit();                    
                }
            }
            
            function actualizar(id){
                var nombre = document.getElementById("txtNombre").value;                  
                if(nombre == ""){
                    alert("Campo Nombre es obligatorios.")
                }else{                    
                    var idnivel= $("#cmbNivel").val();
                    var salariobase= document.getElementById("txtSalarioBase").value;
                    var salariomaximo= document.getElementById("txtSalarioMaximo").value;
                    var tiempoexperiencia= document.getElementById("txtTiempoExperiencia").value;
                    var edadminima= document.getElementById("txtEdadMinima").value;
                    var edadmaxima= document.getElementById("txtEdadMaxima").value;
                    var sexo= $("#cmbSexo").val();
                    document.puestoFrm.action = "./PuestoServlet?accion=actualizar&id=" + id +
                         "&nombre=" + nombre + "&idnivel=" + idnivel + "&salariobase=" + salariobase + "&salariomaximo=" + salariomaximo +
                         "&tiempoexperiencia=" + tiempoexperiencia + "&edadminima=" + edadminima + "&edadmaxima=" + edadmaxima +
                         "&sexo=" + sexo;
                    document.puestoFrm.submit();
                }
            }
            
            function cancelar(){
                document.location = "puestoFrm.jsp";
            }
            
                var listarNivel = function() {
                url = "./NivelServlet?accion=listar";                    
                var jqxhr = $.getJSON(url);
                jqxhr.success(function(json) {
                    $('#cmbNivel').html('');
                    $('#cmbNivel').append('<option value=-1>-----Seleccione-----</option>');
                    $.each(json.lstLista,function(i, item){
                        $('#cmbNivel').append('<option value='+ item.idNivel+'>'+ item.nombre+'</option>');	                         
                        $("#cmbNivel").val(<%=idnivel%>);
                    });
                });
                jqxhr.error(function() {
                    alert("Error de contenidos");
                });
            };
            
            //documento cargado
            $(document).ready(function() {
               
                listarNivel();
              
            });
            
             function numbersonly(e) {
                var unicode = e.charCode ? e.charCode : e.keyCode
                if (unicode != 8 && unicode != 44 && unicode !=46) {
                    if (unicode < 48 || unicode > 57)
                    { return false }
                }
            }
        </script>

<table width="100%" border="0">
  <tr>
    <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Puestos de Trabajo</strong></td>
  </tr>
  <tr>
    <td width="81%"><iframe src="PuestoServlet?accion=buscar" name="listado" width="600" height="350" marginheight="0" frameborder="0" class="borde"></iframe></td>
    <td width="19%" align="center" valign="bottom">[ <a href="catalogos.jsp?cat=2&amp;agr=1" class="menu">Agregar</a> ] </td>
  </tr>  
  <%
// Vemos si mostramos el formulario de agregar
if (vlagregar != null || vlmostrar != null) {
%>
<tr>
    <td colspan="2" width="81%">

         <hr size="1" />
        <form name="puestoFrm" method="post" style="margin: 0px;" onSubmit="return valida2(this);">
            <table width="60%" border="0" align="center" class="borde">
                <tr>                
                <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Detalles del Puesto</strong></td>
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
                    <td>Nombre del Puesto:</td>
                    <td><input type="text" id="txtNombre" class="fuente11" value="<%=nombre%>" /></td>
                </tr>                                
                <tr>
                    <td>Salario Base:</td>
                    <td><input type="text" id="txtSalarioBase" class="fuente11" value="<%=salariobase%>" onkeypress ="return numbersonly(event);" /></td>
                </tr>
                <tr>
                    <td>Salario Maximo:</td>
                    <td><input type="text" id="txtSalarioMaximo" class="fuente11" value="<%=salariomaximo%>" onkeypress ="return numbersonly(event);" /></td>
                </tr>
                <tr>       
                <td valign="top">&nbsp;</td>        
                <td align="center">&nbsp;</td>
                </tr>
                <tr>        
                  <td align="center" valign="top" bgcolor="#CCD8E6"><strong>Perfil</strong></td>
                  <td class="bordeinferior">&nbsp;</td>        
                </tr>
                <tr>       
                <td valign="top">&nbsp;</td>        
                <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td>Nivel de Estudio:</td>
                    <td>                     
                         <select id="cmbNivel" name="cbmNivel" class="fuente11">
                            <option></option>
                         </select>
                    </td>
                </tr>
                <tr>
                    <td>Experiencia:</td>
                    <td><input type="text" id="txtTiempoExperiencia" class="fuente11" value="<%=tiempoexperiencia%>" onkeypress ="return numbersonly(event);" /></td>
                </tr>
                <tr>
                    <td>Edad Minima:</td>
                    <td><input type="text" id="txtEdadMinima" class="fuente11" value="<%=edadminima%>" onkeypress ="return numbersonly(event);" /></td>
                </tr>
                <tr>
                    <td>Edad Máxima:</td>
                    <td><input type="text" id="txtEdadMaxima" class="fuente11" value="<%=edadmaxima%>" onkeypress ="return numbersonly(event);" /></td>
                </tr>
                <tr>
                    <td>Sexo:</td>
                    <td><select name="cmbSexo" id="cmbSexo" class="fuente11">                    
                    <option value="F">Femenino</option>
                    <option value="M">Masculino</option>
                  </select>
                  </td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="Cancelar" onclick="cancelar()" id="btnCancelar" />
                    </td>
                        <%if(session.getAttribute("PuestoActualizar") == null){%>
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
} // Fin de mostrar formulario de agregar
%>

</table>



    
    
       


