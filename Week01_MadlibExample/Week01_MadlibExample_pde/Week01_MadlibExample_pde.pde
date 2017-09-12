//double slashes is a comment. The compiler ignores this line when running the program

//I've put all my Strings together. 
String name = "johnny";
String verb = "sit";
String name2 = "marcus";

//and my ints
int numberOfDogs = 4;

//and my floats
float howMuchFood = 1.4;

// When programming in Processing, definitely group similar variables together. 
// Also pay attention to what you name each variable. It matters!

print(name);
println(" taught an amazing class today!");
println( name + " is going home to their " + numberOfDogs + " dogs this evening." );
println( name, "is going to", verb, "with them and", name2);
println( "The Dogs always eat " + howMuchFood + " pounds of food an hour!");

ellipse(20, 20, 40, 40);