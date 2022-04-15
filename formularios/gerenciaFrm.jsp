<%@page import="Bean.GerenciaBean"%>

<%
 //int id = Integer.parseInt(request.getParameter("id") == null ? "0" : 
 //               request.getParameter("id"));
 %>
 
 <%
    GerenciaBean gerencia = (GerenciaBean) session.getAttribute("GerenciaActualizar");
    gerencia = gerencia == null ? new GerenciaBean() : gerencia;
    int id= gerencia.getIdGerencia();  
    String nombre = gerencia.getNombre() == null ? "" : gerencia.getNombre();   
    String telefono = gerencia.getTelefono() == null ? "" : gerencia.getTelefono();
    
    %>
    
        <script type="text/javascript">
            function insertar(){
                var nombre = document.getElementById("txtNombre").value;                
                if(nombre == ""){
                    alert("Campos Nombre es obligatorio.")
                }else{                    
                    var telefono = document.getElementById("txtTelefono").value;
                    document.gerenciaFrm.action = "./GerenciaServlet?accion=insertar&nombre=" + nombre + 
                         "&telefono=" + telefono;
                    document.gerenciaFrm.submit();                    
                }
            }
            
            function actualizar(id){
                var nombre = document.getElementById("txtNombre").value;                
                if(nombre == ""){
                    alert("Campos Nombre es obligatorios.")
                }else{                    
                    var telefono = document.getElementById("txtTelefono").value;
                    document.gerenciaFrm.action = "./GerenciaServlet?accion=actualizar&id=" + id +
                        "&nombre=" + nombre + "&telefono=" + telefono;
                    document.gerenciaFrm.submit();
                }
            }
            
            function cancelar(){
                document.location = "gerenciaFrm.jsp";
            }
        </script>

<table width="100%" border="0">
  <tr>
    <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Gerencias</strong></td>
  </tr>
  <tr>
    <td width="81%"><iframe src="GerenciaServlet?accion=buscar" name="listado" width="600" height="350" marginheight="0" frameborder="0" class="borde"></iframe></td>
    <td width="19%" align="center" valign="bottom">[ <a href="catalogos.jsp?cat=6&amp;agr=1" class="menu">Agregar</a> ] </td>
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
                <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Detalles de Gerencia</strong></td>
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
                    <td>Teléfono:</td>
                    <td><input type="text" id="txtTelefono" class="fuente11" value="<%=telefono%>" /></td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="Cancelar" onclick="cancelar()" id="btnCancelar" />
                    </td>
                        <%if(session.getAttribute("GerenciaActualizar") == null){%>
                        ${clienteActualizar}
                    <td>
                        <input type="button" value="Insertar" onclick="insertar()" id="btnInsertar" />                         
                    </td>
                        <%}else{%>
                    <td>
                        <input type="button" value="Actualizar" onclick="actualizar(<%=gerencia.getIdGerencia()%>)" 
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



    
    
       


