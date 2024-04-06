	Trabajo del Coba.

	Hay que hacer un programa que convierta un numero en forma de string a su forma en binario
	Nuestro programa acepta strings de entrada con un largo de maximo 8 caracteres numericos (0x30-0x39) que terminen con un terminador (\0)

	El Funcionamiento
	Nuestro programa consiste de dos algoritmos conectados. 
	El primero pasa de un string ascii a codigo bcd. Esto se consigue facilmente removiendo los primeros 4 bits de cada caracter y concatenandolos.
 	El segundo pasa de codigo bcd a binario implementando el un Double Dabble inverso. El codigo que chequea cada digito y y resta 3 si es mayor a 8 fue implementado aparte por su complejidad.



	t0-t2		Registros Auxiliares
	t5		Salida del programa
	t6		Contador para el algoritmo que convierte de bcd -> binario
	t7		Contador para el algoritmo que chequea si hay digitos mayores a 8
	t8		Constante igual al largo del string de entrada menos uno, por cuatro.
	t9		Constante igual al largo del string de entrada
	k0		Constante igual al largo del string de entrada por cuatro
	k1		Constante igual al largo del string de entrada por cuatro, menos uno
