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
// Puestos
function valida5(formulario) {
	//extraemos el valor de cada campo
	nombre       = trim(formulario.nombre.value);
	departamento = trim(formulario.departamento.value);
	tipopuesto   = trim(formulario.tipopuesto.value);
	horario      = trim(formulario.horario.value);
	nivel        = trim(formulario.nivel.value);
	//si el campo nombre está vacío entonces no dejar enviar
	if (nombre=="") {
		alert ('Se debe especificar un nombre.');
		return false;
	}
	//si no se elige departamento, no dejar enviar
	if (departamento=="0") {
		alert ('Se debe especificar un departamento.');
		return false;
	}
	//si no se elige tipopuesto, no dejar enviar
	if (tipopuesto=="0") {
		alert ('Se debe especificar tipo del puesto.');
		return false;
	}
	//si no se elige horario, no dejar enviar
	if (horario=="0") {
		alert ('Se debe especificar un horario.');
		return false;
	}
	//validamos salariobase, si no hay nada o no es entero, no dejar enviar
	salariobase = validarFloat(formulario.salariobase.value);
	formulario.salariobase.value = salariobase;
	if (salariobase=="") {
		alert ('Se debe especificar un salario base.');
		return false;
	}
	//validamos salariomax, si no hay nada o no es entero, no dejar enviar
	salariomax = validarFloat(formulario.salariomax.value);
	formulario.salariomax.value = salariomax;
	if (salariomax=="") {
		alert ('Se debe especificar un salario máximo.');
		return false;
	}
	//si el salariobase o salariomin son menores de cero, no dejar enviar
	if (salariobase<0 || salariomax<0) {
		alert ('Salarios no pueden ser menores de cero.');
		return false;
	}
	//si el salario base es mayor que el salario máximo, no dejar enviar
	if (salariobase>salariomax) {
		alert ('Salario base no puede ser mayor que salario máximo.');
		return false;
	}
	//si no se elige nivel de estudio, no dejar enviar
	if (nivel=="0") {
		alert ('Se debe especificar un nivel de estudio.');
		return false;
	}
	//validamos experiencia, si no hay nada o no es entero, no dejar enviar
	if (formulario.experiencia.value!="0")	{
		experiencia = validarEntero(formulario.experiencia.value);
		formulario.experiencia.value = experiencia;
		if (experiencia=="") {
			alert ('Se debe especificar experiencia.');
			return false;
		}
		if (experiencia<0) {
			alert ('Experiencia no puede ser menor de cero.');
			return false;
		}
	}
	//validamos edadmin, si no hay nada o no es entero, no dejar enviar
	edadmin = validarEntero(formulario.edadmin.value);
	formulario.edadmin.value = edadmin;
	if (edadmin=="") {
		alert ('Se debe especificar edad mínima.');
		return false;
	}
	//validamos edadmax, si no hay nada o no es entero, no dejar enviar
	edadmax = validarEntero(formulario.edadmax.value);
	formulario.edadmax.value = edadmax;
	if (edadmax=="") {
		alert ('Se debe especificar edad máxima.');
		return false;
	}
	//si la edad mínima o máxima son menores de 18 años, no dejar enviar
	if (edadmin<18 || edadmax<18) {
		alert ('Edades no pueden ser menor de 18 años.');
		return false;
	}
	//si la edad mínima es mayor que la máxima, no dejar enviar
	if (edadmin>edadmax) {
		alert ('Edad mínima no puede ser mayor que edad máxima.');
		return false;
	}
	//si el script logra llegar hasta aquí, no hay problemas, dejar enviar
	return true;
}