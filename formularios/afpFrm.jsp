<%@page import="Bean.AfpBean"%>

<%
 //int id = Integer.parseInt(request.getParameter("id") == null ? "0" : 
 //               request.getParameter("id"));
 %>
 
 <%
    AfpBean afp = (AfpBean) session.getAttribute("AfpActualizar");
    afp = afp == null ? new AfpBean() : afp;
    int id= afp.getIdafp();  
    String nombre = afp.getNombre() == null ? "" : afp.getNombre();   
    double porcentajelaboral = afp.getPorcentajelaboral();
    double porcentajepatronal = afp.getPorcentajepatronal();
    
    %>
    
        <script type="text/javascript">
            function insertar(){
                var nombre = document.getElementById("txtNombre").value;                
                if(nombre == ""){
                    alert("Campos Nombre es obligatorio.")
                }else{                    
                    var porcentajelaboral= document.getElementById("txtPorcentajeLaboral").value;
                    var porcentajepatronal= document.getElementById("txtPorcentajePatronal").value;
                    document.afpFrm.action = "./AfpServlet?accion=insertar&nombre=" + nombre + 
                         "&porcentajelaboral=" + porcentajelaboral + "&porcentajepatronal=" + porcentajepatronal;
                    document.afpFrm.submit();                    
                }
            }
            
            function actualizar(id){
                var nombre = document.getElementById("txtNombre").value;                  
                if(nombre == ""){
                    alert("Campos Nombre es obligatorios.")
                }else{                    
                    var porcentajelaboral= document.getElementById("txtPorcentajeLaboral").value;
                    var porcentajepatronal= document.getElementById("txtPorcentajePatronal").value;
                    document.afpFrm.action = "./AfpServlet?accion=actualizar&id=" + id +
                        "&nombre=" + nombre + "&porcentajelaboral=" + porcentajelaboral + "&porcentajepatronal=" + porcentajepatronal;
                    document.afpFrm.submit();
                }
            }
            
            function cancelar(){
                document.location = "afpFrm.jsp";
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
    <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>AFP</strong></td>
  </tr>
  <tr>
    <td width="81%"><iframe src="AfpServlet?accion=buscar" name="listado" width="600" height="350" marginheight="0" frameborder="0" class="borde"></iframe></td>
    <td width="19%" align="center" valign="bottom">[ <a href="catalogos.jsp?cat=1&amp;agr=1" class="menu">Agregar</a> ] </td>
  </tr>  
  <%
// Vemos si mostramos el formulario de agregar
if (vlagregar != null || vlmostrar != null) {
%>
<tr>
    <td colspan="2" width="81%">

         <hr size="1" />
        <form name="afpFrm" method="post" style="margin: 0px;" onSubmit="return valida2(this);">
            <table width="60%" border="0" align="center" class="borde">
                <tr>                
                <td colspan="2" align="center" bgcolor="#CCD8E6"><strong>Detalles de AFP</strong></td>
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
                    <td>Porcentaje Laboral:</td>
                    <td><input type="text" id="txtPorcentajeLaboral" class="fuente11" value="<%=porcentajelaboral%>" onkeypress ="return numbersonly(event);" /></td>
                </tr>
                <tr>
                    <td>Porcentaje Patronal:</td>
                    <td><input type="text" id="txtPorcentajePatronal" class="fuente11" value="<%=porcentajepatronal%>" onkeypress ="return numbersonly(event);" /></td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="Cancelar" onclick="cancelar()" id="btnCancelar" />
                    </td>
                        <%if(session.getAttribute("AfpActualizar") == null){%>
                        ${clienteActualizar}
                    <td>
                        <input type="button" value="Insertar" onclick="insertar()" id="btnInsertar" />                         
                    </td>
                        <%}else{%>
                    <td>
                        <input type="button" value="Actualizar" onclick="actualizar(<%=afp.getIdafp()%>)" 
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



    
    
       


