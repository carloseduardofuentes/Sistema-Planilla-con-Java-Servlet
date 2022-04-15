// JavaScript Document

// Validamos que el dato en la casilla sea un entero
function validarEntero(valor){
	//intento convertir a entero.
	//si era un entero no le afecta, si no lo era lo intenta convertir
	valor = parseInt(valor);
	//Compruebo si es un valor numérico
	if (isNaN(valor)) {
		//entonces (no es número) devuelvo el valor cadena vacía
		return "";
	} else {
		//En caso contrario (sí era un número) devuelvo el valor
		return valor;
	}
}

// validamos un año bisiesto
function anyoBisiesto(anyo){
	if (anyo < 100)
		var fin = anyo + 1900;
	else
		var fin = anyo;
	if (fin % 4 != 0)
		return false;
	else {
		if (fin % 100 == 0){
			if (fin % 400 == 0){
				return true;
			}
			else {
				return false;
			}
		}
		else{
			return true;
		}
	}
}


// Validamos fecha de nacimiento
function validaFecha(dia, mes, anyo){
	dia  = dia * 1;
	mes  = mes * 1;
	anyo = anyo * 1;
	if ((anyo<1900) || (anyo>2006)){
		return false;
	}
	if(anyoBisiesto(anyo))
		febrero= 29 * 1;
	else
	if ((mes<1) || (mes>12)){
		return false;
	}
	if ((mes==2) && ((dia<1) || (dia>febrero))){
		return false;
	}
	if (((mes==1) || (mes==3) || (mes==5) || (mes==7) || (mes==8) || (mes==10) || (mes==12)) && ((dia<1) || (dia>31))){
		return false;
	}
	if (((mes==4) || (mes==6) || (mes==9) || (mes==11)) && ((dia<1) || (dia>30))){
		return false;
	}
	return true;
}

// Validamos que el dato en la casilla sea un float
function validarFloat(valor){
	//intento convertir a float.
	//si era un float no le afecta, si no lo era lo intenta convertir
	valor = parseFloat(valor);
	//Compruebo si es un valor numérico
	if (isNaN(valor)) {
		//entonces (no es número) devuelvo el valor cadena vacía
		return "";
	} else {
		//En caso contrario (sí era un número) devuelvo el valor
		return valor;
	}
}

// Equivalente a la función trim
function trim(texto) {
	var Resultado;
	var objRegex = new RegExp("(^\\s+)|(\\s+$)");
	Resultado = texto.replace(objRegex, "");
	return(Resultado);
}

// Validamos Formularios:
// personaes
function valida7(formulario) {
	//extraemos el valor de cada campo
	institucion    = trim(formulario.institucion.value);
	nivel          = formulario.nivel.value;
	tituloobtenido = trim(formulario.tituloobtenido.value);
	//si no se definió institución, no dejar enviar
	if (institucion=="") {
		alert ('Debe especificar institución.');
		return false;
	}
	//si no se eligió nivel, no dejar enviar
	if (nivel=="0") {
		alert ('Debe seleccionar nivel.');
		return false;
	}
	// validamos fecha inicial
	diainicio = validarEntero(formulario.diainicio.value);
	formulario.diainicio.value = diainicio;
	mesinicio = validarEntero(formulario.mesinicio.value);
	formulario.mesinicio.value = mesinicio;
	yearinicio = validarEntero(formulario.yearinicio.value);
	formulario.yearinicio.value = yearinicio;
	if (diainicio=="" || mesinicio=="" || yearinicio=="") {
		alert ('Se debe especificar fecha de inicio.');
		return false;
	}
	if (!validaFecha(diainicio, mesinicio, yearinicio)){
		alert ('Fecha de inicio no válida.');
		return false;
	}
	// validamos fecha final
	diafin = validarEntero(formulario.diafin.value);
	formulario.diafin.value = diafin;
	mesfin = validarEntero(formulario.mesfin.value);
	formulario.mesfin.value = mesfin;
	yearfin = validarEntero(formulario.yearfin.value);
	formulario.yearfin.value = yearfin;
	if (diafin=="" || mesfin=="" || yearfin=="") {
		alert ('Se debe especificar fecha final.');
		return false;
	}
	if (!validaFecha(diafin, mesfin, yearfin)){
		alert ('Fecha final no válida.');
		return false;
	}
	//si se dejó tituloobtenido vacío, lo cambio por un guión
	if (tituloobtenido=="") {
		formulario.tituloobtenido.value = "-";
	}
	//si el script logra llegar hasta aquí, no hay problemas, dejar enviar
	return true;
}

// Validamos Formularios:
// personae
function valida8(formulario) {
	//extraemos el valor de cada campo
	empresa = trim(formulario.empresa.value);
	cargo   = formulario.cargo.value;
	//si no se definió empresa, no dejar enviar
	if (empresa=="") {
		alert ('Debe especificar empresa.');
		return false;
	}
	//si no se eligió cargo, no dejar enviar
	if (cargo=="0") {
		alert ('Debe seleccionar puesto.');
		return false;
	}
	// validamos fecha inicial
	diainicio = validarEntero(formulario.diainicio.value);
	formulario.diainicio.value = diainicio;
	mesinicio = validarEntero(formulario.mesinicio.value);
	formulario.mesinicio.value = mesinicio;
	yearinicio = validarEntero(formulario.yearinicio.value);
	formulario.yearinicio.value = yearinicio;
	if (diainicio=="" || mesinicio=="" || yearinicio=="") {
		alert ('Se debe especificar fecha de inicio.');
		return false;
	}
	if (!validaFecha(diainicio, mesinicio, yearinicio)){
		alert ('Fecha de inicio no válida.');
		return false;
	}
	// validamos fecha final
	diafin = validarEntero(formulario.diafin.value);
	formulario.diafin.value = diafin;
	mesfin = validarEntero(formulario.mesfin.value);
	formulario.mesfin.value = mesfin;
	yearfin = validarEntero(formulario.yearfin.value);
	formulario.yearfin.value = yearfin;
	if (diafin=="" || mesfin=="" || yearfin=="") {
		alert ('Se debe especificar fecha final.');
		return false;
	}
	if (!validaFecha(diafin, mesfin, yearfin)){
		alert ('Fecha final no válida.');
		return false;
	}
	// validamos salario
	salario = validarFloat(formulario.salario.value);
	formulario.salario.value = salario;
	if (salario=="") {
		alert ('Se debe especificar salario.');
		return false;
	}
	//si el script logra llegar hasta aquí, no hay problemas, dejar enviar
	return true;
}