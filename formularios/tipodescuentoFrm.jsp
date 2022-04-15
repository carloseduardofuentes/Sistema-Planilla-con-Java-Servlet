<%@page import="Bean.TipoDescuentoBean"%>

<%
 //int id = Integer.parseInt(request.getParameter("id") == null ? "0" : 
 //               request.getParameter("id"));
 %>
 
 <%
    TipoDescuentoBean tipodescuento = (TipoDescuentoBean) session.getAttribute("TipoDescuentoActualizar");
    tipodescuento = tipodescuento == null ? new TipoDescuentoBean() : tipodescuento;
    int id= tipodescuento.getIdTipoDescuento();  
    String nombre = tipodescuento.getNombre() == null ? "" : tipodescuento.getNombre();       
    
    %>
    
        <script type="text/javascript">
            function insertar(){
                var nombre = document.getElementById("txtNombre").value;                
                if(nombre == ""){
                    alert("Campos Nombre es obligatorio.")
                }else{
                    document.tipodescuentoFrm.action = "./TipoDescuentoServlet?accion=insertar&nombre=" + nombre;                         
                    document.tipodescuentoFrm.submit();                    
                }
            }
            
            function actualizar(id){
                var nombre = document.getElementById("txtNombre").value;                  
                if(nombre == ""){
                    alert("Campos Nombre es obligatorios.")
                }else{
                    document.tipodescuentoFrm.action = "./TipoDescuentoServlet?accion=actualizar&id=" + id +
                        "&nombre=" + nombre;
                    document.tipodescuentoFrm.submit();
                }
            }
            
            function cancelar(){
                document.location = "tipodescuentoFrm.jsp";
            }
            
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
    <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Tipos de Descuento</strong></td>
  </tr>
  <tr>
    <td width="81%"><iframe src="TipoDescuentoServlet?accion=buscar" name="listado" width="600" height="350" marginheight="0" frameborder="0" class="borde"></iframe></td>
    <td width="19%" align="center" valign="bottom">[ <a href="catalogos.jsp?cat=11&amp;agr=1" class="menu">Agregar</a> ] </td>
  </tr>  
  <%
// Vemos si mostramos el formulario de agregar
if (vlagregar != null || vlmostrar != null) {
%>
<tr>
    <td colspan="2" width="81%">

         <hr size="1" />
        <form name="tipodescuentoFrm" method="post" style="margin: 0px;" onSubmit="return valida2(this);">
            <table width="60%" border="0" align="center" class="borde">
                <tr>                
                <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Detalles de Tipos de Descuento</strong></td>
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
                    <td>
                        <input type="button" value="Cancelar" onclick="cancelar()" id="btnCancelar" />
                    </td>
                        <%if(session.getAttribute("TipoDescuentoActualizar") == null){%>
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



    
    
       


