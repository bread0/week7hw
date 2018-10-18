// Code_1_FA18
// Week 7
// Bryan Ma

// this is the "Cookie" class sketch we wrote in class.

// create 2 or more additional class definitions. 
// these classes aren't used for actually programming any visuals so they can 
//  be totally abstract and print text only just as the Cookie class does. 

// The first new class you make should represent some other kind of common object.
// give it fields and methods, as well as a custom constructor.
// The second new class you create should have its own object instance of the Cookie 
//  (or other) class. For example, maybe a Cookie Jar class would have an 
//  ArrayList of type Cookie. 

void setup() {
  Milk milk = new Milk("chocolate");
  milk.milkInfo();
  milk.drink();
  
  Jar jar = new Jar("small");
  jar.jarInfo();
  jar.getCookie();
}

void draw() {}

class Milk {
  String flavor;
  
  Milk(String whatFlavor) {
    println("Got ye some " + whatFlavor + " milk out of this here refrigerator.");
    flavor = whatFlavor;
  }
  
  void milkInfo() {
    println("This be " + flavor + " milk.");
  }
  
  void drink() {
    println("Ye drink the milk.");
  }
}

class Jar {
  String size;
  //int[] amount = new int[20];
  int amount = 20;
  
  Jar(String whatSize) {
    println("Grabbed a " + whatSize + " jar off the shelf.");
    size = whatSize;
  }
  
  Jar() {
     println("Grabbed a jar off the shelf.");
  }
  
  void jarInfo() {
    println("This is a " + size + " jar with " + amount + " cookies in it.");
  }
  
  void getCookie() {
    println("You grab a cookie from the jar.");
    amount--;
  }
  
}

class Cookie {
  String kind;
  String size;
  
  Cookie(String whatKind, String whatSize) {
    println("baked new " + whatSize + " " + whatKind + " cookie!");
    kind = whatKind;
    size = whatSize;
  }
  
  void cookieInfo() {
    println("This cookie is a " + size + " " + kind + " cookie!");
  }
  
  void eat(String modifier) {
    println("You eat the cookie " + modifier);
  }
  
  String getSize() {
    return size;
  }
  
}
