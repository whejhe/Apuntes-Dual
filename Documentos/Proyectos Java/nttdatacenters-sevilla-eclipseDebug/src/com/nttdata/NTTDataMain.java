package com.nttdata;

import java.util.ArrayList;
import java.util.List;

/**
 * Formación - Eclipse
 * 
 * Clase principal
 * 
 * @author NTT Data Sevilla
 *
 */
public class NTTDataMain {

	/**
	 * Método principal
	 * 
	 * @param args
	 */
	public static void main(String[] args) {

		// Primer método.
		firstMethod("AS");

	}

	/**
	 * Primer método
	 * 
	 * @param msg
	 */
	private static void firstMethod(final String msg) {

		// Descomposión del mensaje.
		final char[] charList = msg.toCharArray();

		// Resultado.
		final List<String> strResult = new ArrayList<String>();
		
		// Iteración y retirada de caracteres iguales al primero.
		final char suprChar = charList[0];
		for (final char c : charList) {
			
			// Mostrar y guardar sólo distintos del primer caracter. 
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
