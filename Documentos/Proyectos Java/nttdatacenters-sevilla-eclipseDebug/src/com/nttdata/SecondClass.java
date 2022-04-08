package com.nttdata;

import java.util.List;

/**
 * Formación - Eclipse
 * 
 * Segunda clase
 * 
 * @author NTT Data Sevilla
 *
 */
public class SecondClass {

	/**
	 * Segundo método.
	 * 
	 * @param strList
	 */
	public void secondMethod(final List<String> strList) {

		// Printa tamaño de lista recibida.
		System.out.println("Tamaño : " + strList.size());

		// Printa la letra del medio.
		final String strM = strList.get(strList.size() / 2);
		System.out.println(strM);

		final ThirdClass tc = new ThirdClass();
		tc.thirdMethod(strM);

	}

}
