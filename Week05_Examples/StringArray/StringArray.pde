int whichChar = 4;
String tnGreeting = "how about those Volunteers?";
//println(tnGreeting.charAt(7));
//println(tnGreeting.charAt(whichChar));

/*
whichChar = 0;
 println(whichChar + " " + tnGreeting.charAt(whichChar));
 whichChar+=1;
 println(whichChar, tnGreeting.charAt(whichChar));
 whichChar++;
 println(whichChar, tnGreeting.charAt(whichChar));
 whichChar++;
 println(whichChar, tnGreeting.charAt(whichChar));
 whichChar++;
 println(whichChar, tnGreeting.charAt(whichChar));
 */

//print every character, one by one until the end of the String
/*
whichChar = 0;
 println(tnGreeting.length());
 println(whichChar, tnGreeting.charAt(whichChar));
 if (whichChar < tnGreeting.length()) {
 whichChar += 1;
 println(whichChar, tnGreeting.charAt(whichChar));
 if (whichChar < tnGreeting.length()) {
 whichChar += 1;
 println(whichChar, tnGreeting.charAt(whichChar));
 if (whichChar < tnGreeting.length()) {
 whichChar += 1;
 println(whichChar, tnGreeting.charAt(whichChar));
 // etc....
 }
 }
 }
 */
/*
for (whichChar = 4; whichChar < tnGreeting.length(); whichChar+=1) {
  println(whichChar, tnGreeting.charAt(whichChar));
}
*/
/*
//start at the end and count backwards
for (whichChar = tnGreeting.length()-1; whichChar >= 0; whichChar-=1) {
  println(whichChar, tnGreeting.charAt(whichChar));
}
*/