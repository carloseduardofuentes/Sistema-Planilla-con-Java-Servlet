<%@page import="Bean.PaisBean"%>

<%
 //int id = Integer.parseInt(request.getParameter("id") == null ? "0" : 
 //               request.getParameter("id"));
 %>
 
 <%
    PaisBean pais = (PaisBean) session.getAttribute("PaisActualizar");
    pais = pais == null ? new PaisBean() : pais;
    int id= pais.getIdPais();  
    String nombre = pais.getNombre() == null ? "" : pais.getNombre();   
        
    %>
    
        <script type="text/javascript">
            function insertar(){
                var nombre = document.getElementById("txtNombre").value;                
                if(nombre == ""){
                    alert("Campos Nombre es obligatorio.")
                }else{                    
                   
                    document.paisFrm.action = "./PaisServlet?accion=insertar&nombre=" + nombre;
                    document.paisFrm.submit();                    
                }
            }
            
            function actualizar(id){
                var nombre = document.getElementById("txtNombre").value;                  
                if(nombre == ""){
                    alert("Campos Nombre es obligatorios.")
                }else{ 
                    document.paisFrm.action = "./PaisServlet?accion=actualizar&id=" + id +
                        "&nombre=" + nombre;
                    document.paisFrm.submit();
                }
            }
            
            function cancelar(){
                document.location = "paisFrm.jsp";
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
    <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Pais</strong></td>
  </tr>
  <tr>
    <td width="81%"><iframe src="PaisServlet?accion=buscar" name="listado" width="600" height="350" marginheight="0" frameborder="0" class="borde"></iframe></td>
    <td width="19%" align="center" valign="bottom">[ <a href="catalogos.jsp?cat=8&amp;agr=1" class="menu">Agregar</a> ] </td>
  </tr>  
  <%
// Vemos si mostramos el formulario de agregar
if (vlagregar != null || vlmostrar != null) {
%>
<tr>
    <td colspan="2" width="81%">

         <hr size="1" />
        <form name="paisFrm" method="post" style="margin: 0px;" onSubmit="return valida2(this);">
            <table width="60%" border="0" align="center" class="borde">
                <tr>                
                <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Detalles de Pais</strong></td>
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
                        <%if(session.getAttribute("PaisActualizar") == null){%>
                        ${clienteActualizar}
                    <td>
                        <input type="button" value="Insertar" onclick="insertar()" id="btnInsertar" />                         
                    </td>
                        <%}else{%>
                    <td>
                        <input type="button" value="Actualizar" onclick="actualizar(<%=pais.getIdPais()%>)" 
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



    
    
       


