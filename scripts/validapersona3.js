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
// personar
function valida9(formulario) {
	//extraemos el valor de cada campo
	nombres    = trim(formulario.nombres.value);
	apellidos  = trim(formulario.apellidos.value);
	referencia = trim(formulario.referencia.value);
	direccion1 = trim(formulario.direccion1.value);
	direccion2 = trim(formulario.direccion2.value);
	telefono   = trim(formulario.telefono.value);
	email      = trim(formulario.email.value);
	//casillas con * son obligatorias
	if (nombres=="" || apellidos=="" || referencia=="" || direccion1=="" || telefono=="") {
		alert ('Campos con asterisco son obligatorios.');
		return false;
	}
	//si direccion2 est� vac�o, sustitu�mos con gui�n
	if (direccion2=="") {
		formulario.direccion2.value="-";
	}
	//si email est� vac�o, sustitu�mos con gui�n
	if (email=="") {
		formulario.email.value="-";
	}
	//si el script logra llegar hasta aqu�, no hay problemas, dejar enviar
	return true;
}

// Validamos Formularios:
// personap
function valida10(formulario) {
	//extraemos el valor de cada campo
	puesto = formulario.puesto.value;
	//si no ha selecciona puesto, no dejar pasar
	if (puesto=="0") {
		alert ('Debe seleccionar puesto.');
		return false;
	}
	// validamos salario
	salario = validarFloat(formulario.salario.value);
	formulario.salario.value = salario;
	if (salario=="") {
		alert ('Se debe especificar salario.');
		return false;
	}
	//si el script logra llegar hasta aqu�, no hay problemas, dejar enviar
	return true;
}