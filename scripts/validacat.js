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

// Equivalente a la funci�n trim
function trim(texto) {
	var Resultado;
	var objRegex = new RegExp("(^\\s+)|(\\s+$)");
	Resultado = texto.replace(objRegex, "");
	return(Resultado);
}

// Validamos Formularios:
// Ex�menes M�dicos, Niveles de Estudio, Habilidades y Destrezas
function valida1(formulario) {
	//extraemos el valor de cada campo
	nombre      = trim(formulario.nombre.value);
	descripcion = trim(formulario.descripcion.value);
	//si el campo nombre est� vac�o entonces no dejar enviar
	if (nombre=="") {
		alert ('Se debe especificar un nombre.');
		return false;
	}
	//si el campo descripcion est� vac�o, sustituir con gui�n
	if (descripcion=="") {
		formulario.descripcion.value="-";
	}
	//si el script logra llegar hasta aqu�, no hay problemas, dejar enviar
	return true;
}

// Validamos Formularios:
// Gerencias
function valida2(formulario) {
	//extraemos el valor de cada campo
	nombre   = trim(formulario.nombre.value);
	telefono = trim(formulario.telefono.value);
	//si el campo nombre est� vac�o entonces no dejar enviar
	if (nombre=="") {
		alert ('Se debe especificar un nombre.');
		return false;
	}
	//si el campo tel�fono est� vac�o, sustituir con gui�n
	if (telefono=="") {
		formulario.telefono.value="-";
	}
	//si el script logra llegar hasta aqu�, no hay problemas, dejar enviar
	return true;
}

// Validamos Formularios:
// Tipos de Entrevista, Ex�menes Psicol�gicos y de Conocimiento
function valida3(formulario) {
	//extraemos el valor de cada campo
	nombre      = trim(formulario.nombre.value);
	descripcion = trim(formulario.descripcion.value);
	objetivo    = trim(formulario.objetivo.value);
	//si el campo nombre est� vac�o entonces no dejar enviar
	if (nombre=="") {
		alert ('Se debe especificar un nombre.');
		return false;
	}
	//si el campo descripcion est� vac�o, sustituir con gui�n
	if (descripcion=="") {
		formulario.descripcion.value="-";
	}
	//si el campo objetivo est� vac�o, sustituir con gui�n
	if (objetivo=="") {
		formulario.objetivo.value="-";
	}
	//si el script logra llegar hasta aqu�, no hay problemas, dejar enviar
	return true;
}

// Validamos Formularios:
// Departamentos
function valida4(formulario) {
	//extraemos el valor de cada campo
	nombre    = trim(formulario.nombre.value);
	gerencia  = trim(formulario.gerencia.value);
	encargado = trim(formulario.encargado.value);
	telefono  = trim(formulario.telefono.value);
	//si el campo nombre est� vac�o entonces no dejar enviar
	if (nombre=="") {
		alert ('Se debe especificar un nombre.');
		return false;
	}
	//si no se elige una gerencia, no dejar pasar
	if (gerencia=="0") {
		alert ('Se debe especificar una gerencia.');
		return false;
	}
	//si el campo encargado est� vac�o, sustituir con gui�n
	if (encargado=="") {
		formulario.encargado.value="-";
	}
	//si el campo telefono est� vac�o, sustituir con gui�n
	if (telefono=="") {
		formulario.telefono.value="-";
	}
	//si el script logra llegar hasta aqu�, no hay problemas, dejar enviar
	return true;
}