package com.nttdata;

import java.util.ArrayList;
import java.util.List;

/**
 * Formaci�n - Eclipse
 * 
 * Clase principal
 * 
 * @author NTT Data Sevilla
 *
 */
public class NTTDataMain {

	/**
	 * M�todo principal
	 * 
	 * @param args
	 */
	public static void main(String[] args) {

		// Primer m�todo.
		firstMethod("AS");

	}

	/**
	 * Primer m�todo
	 * 
	 * @param msg
	 */
	private static void firstMethod(final String msg) {

		// Descomposi�n del mensaje.
		final char[] charList = msg.toCharArray();

		// Resultado.
		final List<String> strResult = new ArrayList<String>();
		
		// Iteraci�n y retirada de caracteres iguales al primero.
		final char suprChar = charList[0];
		for (final char c : charList) {
			
			// Mostrar y guardar s�lo distintos del primer caracter. 
			if (c != suprChar) {
				System.out.println(c);
				strResult.add(String.valueOf(c));
			}
			
		}
		
		// Invocar segunda clase.
		final SecondClass sc = new SecondClass();
		sc.secondMethod(strResult);

	}

}
