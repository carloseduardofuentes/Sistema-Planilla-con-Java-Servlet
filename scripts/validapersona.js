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
	if ((anyo<1940) || (anyo>1988)){
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
// Personas
function valida6(formulario) {
	//extraemos el valor de cada campo
	tipopersona  = formulario.tipopersona.value;
	nombres      = trim(formulario.nombres.value);
	apellidos    = trim(formulario.apellidos.value);
	sexo         = formulario.sexo.value;
	estadocivil  = formulario.estadocivil.value;
	direccion1   = trim(formulario.direccion1.value);
	direccion2   = trim(formulario.direccion2.value);
	ciudad       = trim(formulario.ciudad.value);
	departamento = trim(formulario.departamento.value);
	pais         = trim(formulario.pais.value);
	telefono     = trim(formulario.telefono.value);
	email        = trim(formulario.email.value);
	dui          = trim(formulario.dui.value);
	nit          = trim(formulario.nit.value);
	isss         = trim(formulario.isss.value);
	nup          = trim(formulario.nup.value);
	sangre       = trim(formulario.sangre.value);
	//si no se eligió tipopersona, no dejar enviar
	if (tipopersona=="0") {
		alert ('Debe seleccionar tipo de persona.');
		return false;
	}
	//si el campo nombre y apellido está vacío entonces no dejar enviar
	if (nombres=="" || apellidos=="") {
		alert ('Campos con asterisco son obligatorios.');
		return false;
	}
	//si no se eligió sexo, no dejar enviar
	if (sexo=="0") {
		alert ('Debe seleccionar sexo.');
		return false;
	}
	//si no se eligió estadocivil, no dejar enviar
	if (estadocivil=="0") {
		alert ('Debe seleccionar estado civil.');
		return false;
	}
	// validamos fecha
	dia = validarEntero(formulario.dia.value);
	formulario.dia.value = dia;
	mes = validarEntero(formulario.mes.value);
	formulario.mes.value = mes;
	year = validarEntero(formulario.year.value);
	formulario.year.value = year;
	if (dia=="" || mes=="" || year=="") {
		alert ('Se debe especificar fecha de nacimiento.');
		return false;
	}
	if (!validaFecha(dia, mes, year)){
		alert ('Fecha no válida.');
		return false;
	}
	//si los campos con * están vacíos entonces no dejar enviar
	if (direccion1=="" || ciudad=="" || departamento=="" || pais=="" || telefono=="" || dui=="") {
		alert ('Campos con asterisco son obligatorios.');
		return false;
	}
	//si se dejó direccion2 vacío, lo cambio por un guión
	if (direccion2=="") {
		formulario.direccion2.value = "-";
	}
	//si se dejó email vacío, lo cambio por un guión
	if (email=="") {
		formulario.email.value = "-";
	}
	//si se dejó nit vacío, lo cambio por un guión
	if (nit=="") {
		formulario.nit.value = "-";
	}
	//si se dejó isss vacío, lo cambio por un guión
	if (isss=="") {
		formulario.isss.value = "-";
	}
	//si se dejó nup vacío, lo cambio por un guión
	if (nup=="") {
		formulario.nup.value = "-";
	}
	//si se dejó sangre vacío, lo cambio por un guión
	if (sangre=="") {
		formulario.sangre.value = "-";
	}
	//si el script logra llegar hasta aquí, no hay problemas, dejar enviar
	return true;
}