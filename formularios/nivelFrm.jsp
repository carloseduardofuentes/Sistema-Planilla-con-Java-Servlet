<%@page import="Bean.NivelBean"%>

<%
 //int id = Integer.parseInt(request.getParameter("id") == null ? "0" : 
 //               request.getParameter("id"));
 %>
 
 <%
    NivelBean nivel = (NivelBean) session.getAttribute("NivelActualizar");
    nivel = nivel == null ? new NivelBean() : nivel;
    int id= nivel.getIdNivel();  
    String nombre = nivel.getNombre() == null ? "" : nivel.getNombre();   
    String descripcion = nivel.getDescripcion() == null ? "" : nivel.getDescripcion();
    
    %>
    
        <script type="text/javascript">
            function insertar(){
                var nombre = document.getElementById("txtNombre").value;                
                if(nombre == ""){
                    alert("Campo Nombre es obligatorio.")
                }else{                    
                    var descripcion= document.getElementById("txtDescripcion").value;                    
                    document.nivelFrm.action = "./NivelServlet?accion=insertar&nombre=" + nombre + 
                         "&descripcion=" + descripcion;
                    document.nivelFrm.submit();                    
                }
            }
            
            function actualizar(id){
                var nombre = document.getElementById("txtNombre").value;                  
                if(nombre == ""){
                    alert("Campo Nombre es obligatorios.")
                }else{                    
                    var descripcion= document.getElementById("txtDescripcion").value;   
                    document.nivelFrm.action = "./NivelServlet?accion=actualizar&id=" + id +
                        "&nombre=" + nombre + "&descripcion=" + descripcion;
                    document.nivelFrm.submit();
                }
            }
            
            function cancelar(){
                document.location = "nivelFrm.jsp";
            }           
            
        </script>

<table width="100%" border="0">
  <tr>
    <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Niveles de Estudio</strong></td>
  </tr>
  <tr>
    <td width="81%"><iframe src="NivelServlet?accion=buscar" name="listado" width="600" height="350" marginheight="0" frameborder="0" class="borde"></iframe></td>
    <td width="19%" align="center" valign="bottom">[ <a href="catalogos.jsp?cat=3&amp;agr=1" class="menu">Agregar</a> ] </td>
  </tr>  
  <%
// Vemos si mostramos el formulario de agregar
if (vlagregar != null || vlmostrar != null) {
%>
<tr>
    <td colspan="2" width="81%">

         <hr size="1" />
        <form name="nivelFrm" method="post" style="margin: 0px;" onSubmit="return valida2(this);">
            <table width="60%" border="0" align="center" class="borde">
                <tr>                
                <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Detalles de Niveles de Estudio</strong></td>
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
                    <td>Descripcion:</td>
                    <td><input type="text" id="txtDescripcion" class="fuente11" value="<%=descripcion%>" /></td>
                </tr>                
                <tr>
                    <td>
                        <input type="button" value="Cancelar" onclick="cancelar()" id="btnCancelar" />
                    </td>
                        <%if(session.getAttribute("NivelActualizar") == null){%>
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



    
    
       


