// JavaScript Document

// Validamos que el dato en la casilla sea un entero
function validarEntero(valor){
	//intento convertir a entero.
	//si era un entero no le afecta, si no lo era lo intenta convertir
	valor = parseInt(valor);
	//Compruebo si es un valor num�rico
	if (isNaN(valor)) {
		//entonces (no es n�mero) devuelvo el valor cadena vac�a
		return "";
	} else {
		//En caso contrario (s� era un n�mero) devuelvo el valor
		return valor;
	}
}

// validamos un a�o bisiesto
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
	//Compruebo si es un valor num�rico
	if (isNaN(valor)) {
		//entonces (no es n�mero) devuelvo el valor cadena vac�a
		return "";
	} else {
		//En caso contrario (s� era un n�mero) devuelvo el valor
		return valor;
	}
}

// Equivalente a la funci�n trim
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
	//si no se eligi� tipopersona, no dejar enviar
	if (tipopersona=="0") {
		alert ('Debe seleccionar tipo de persona.');
		return false;
	}
	//si el campo nombre y apellido est� vac�o entonces no dejar enviar
	if (nombres=="" || apellidos=="") {
		alert ('Campos con asterisco son obligatorios.');
		return false;
	}
	//si no se eligi� sexo, no dejar enviar
	if (sexo=="0") {
		alert ('Debe seleccionar sexo.');
		return false;
	}
	//si no se eligi� estadocivil, no dejar enviar
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
		alert ('Fecha no v�lida.');
		return false;
	}
	//si los campos con * est�n vac�os entonces no dejar enviar
	if (direccion1=="" || ciudad=="" || departamento=="" || pais=="" || telefono=="" || dui=="") {
		alert ('Campos con asterisco son obligatorios.');
		return false;
	}
	//si se dej� direccion2 vac�o, lo cambio por un gui�n
	if (direccion2=="") {
		formulario.direccion2.value = "-";
	}
	//si se dej� email vac�o, lo cambio por un gui�n
	if (email=="") {
		formulario.email.value = "-";
	}
	//si se dej� nit vac�o, lo cambio por un gui�n
	if (nit=="") {
		formulario.nit.value = "-";
	}
	//si se dej� isss vac�o, lo cambio por un gui�n
	if (isss=="") {
		formulario.isss.value = "-";
	}
	//si se dej� nup vac�o, lo cambio por un gui�n
	if (nup=="") {
		formulario.nup.value = "-";
	}
	//si se dej� sangre vac�o, lo cambio por un gui�n
	if (sangre=="") {
		formulario.sangre.value = "-";
	}
	//si el script logra llegar hasta aqu�, no hay problemas, dejar enviar
	return true;
}