<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
String cat = request.getParameter("cat");
String agr = request.getParameter("agr");
String mod = request.getParameter("mod");
String mos = request.getParameter("mos");
String id  = request.getParameter("id");
String hoja  = request.getParameter("hoja");
 %>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redireccion</title>
         <script type="text/javascript">
            var remplaza = /\+/gi; 
            var url = window.location.href;

            url = unescape(url);
            url = url.replace(remplaza, " ");
            url = url.toUpperCase();
            
            var cat=obtener_variable2("cat");
            
            function obtener_variable2(variable)
            {
                var variable=url.split("?");
                var variable2=variable[1].split("&");
                var variable3=variable2[0].split("=");
                return variable3[1];
            
            }

            function obtener_url(variable) 
            { 
                var variable_may = variable.toUpperCase();
                var variable_pos = url.indexOf(variable_may);

                
                if (variable_pos != -1) 
                {
                    var pos_separador = url.indexOf("&", variable_pos);
                    if (pos_separador != -1) 
                    {  
                        return url.substring(variable_pos + variable_may.length + 1, pos_separador);
                    } 
                    else
                    {
                        var pos_inicio = url.indexOf("?", variable_pos)+4;
                        return url.substring(pos_inicio, url.length);
                    }
                } 
                else 
                {
                    return "NO_ENCONTRADO";
                }
            }
            
            function obtener_variable(variable) {
                var variable_may = variable.toUpperCase();
                var variable_pos = url.indexOf(variable_may);
                
                if (variable_pos != -1) {
                    var pos_separador = url.indexOf("&");
                    return url.substring(pos_separador + 1);
                }
                else {
                    return "NO_ENCONTRADO";
                }
            }   
             
             
            function refrescar(){
                if (cat==99)
                    top.location.href= "../persona.jsp?mos=1&hoja=1";
                else if (cat==98)
                    top.location.href= "../prestamo.jsp?mos=1&idsolicitante=<%=id%>&hoja=<%=hoja%>";
                else if (cat==97)
                    top.location.href= "../permiso.jsp?mos=1&idempleado=<%=id%>&hoja=<%=hoja%>";
                else if (cat==96)
                    top.location.href= "../ingreso.jsp?mos=1&idempleado=<%=id%>";
                else if (cat==95)
                    top.location.href= "../descuento.jsp?mos=1&idempleado=<%=id%>";
                else
                    top.location.href= "../catalogos.jsp?cat=<%=cat%>&mos=1";
            }
            </script>
    </head>
    <body onload="refrescar();">
        <h1></h1>
    </body>
</html>
