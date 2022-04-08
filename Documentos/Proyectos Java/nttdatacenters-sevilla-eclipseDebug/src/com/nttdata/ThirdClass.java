package com.nttdata;

import java.util.HashMap;
import java.util.Map;

/**
 * Formación - Eclipse
 * 
 * Tercera clase
 * 
 * @author NTT Data Sevilla
 *
 */
public class ThirdClass {

	/**
	 * Tercer método.
	 * 
	 * @param str
	 */
	public void thirdMethod(final String str) {

		// Alfabeto radiofónico.
		final Map<String, String> namesMap = new HashMap<String, String>();
		namesMap.put("A", "Alpha");
		namesMap.put("B", "Bravo");
		namesMap.put("C", "Charlie");
		namesMap.put("D", "Delta");
		namesMap.put("E", "Echo");
		namesMap.put("F", "Foxtrot");
		namesMap.put("G", "Golf");
		namesMap.put("H", "Hotel");
		namesMap.put("I", "India");
		namesMap.put("J", "Juliet");
		namesMap.put("K", "Kilo");
		namesMap.put("L", "Lima");
		namesMap.put("M", "Mike");
		namesMap.put("N", "November");
		namesMap.put("O", "Oscar");
		namesMap.put("P", "Papa");
		namesMap.put("Q", "Quebec");
		namesMap.put("R", "Romeo");
		namesMap.put("S", "Sierra");
		namesMap.put("T", "Tango");
		namesMap.put("U", "Uniform");
		namesMap.put("V", "Victor");
		namesMap.put("W", "Whiskey");
		namesMap.put("X", "X-Ray");
		namesMap.put("Y", "Yankee");
		namesMap.put("Z", "Zulu");

		System.out.println("Obtienes: " + namesMap.get(str.toUpperCase()));

	}

}
