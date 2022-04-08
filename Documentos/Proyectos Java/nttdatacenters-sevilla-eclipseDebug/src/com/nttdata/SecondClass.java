package com.nttdata;

import java.util.List;

/**
 * Formaci�n - Eclipse
 * 
 * Segunda clase
 * 
 * @author NTT Data Sevilla
 *
 */
public class SecondClass {

	/**
	 * Segundo m�todo.
	 * 
	 * @param strList
	 */
	public void secondMethod(final List<String> strList) {

		// Printa tama�o de lista recibida.
		System.out.println("Tama�o : " + strList.size());

		// Printa la letra del medio.
		final String strM = strList.get(strList.size() / 2);
		System.out.println(strM);

		final ThirdClass tc = new ThirdClass();
		tc.thirdMethod(strM);

	}

}
