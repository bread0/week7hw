// Code_1_FA18
// Week 7
// Bryan Ma

// this is the leap we made from a single arraylist of ball objects,
//  to an arraylist of particle generators, all which possess their own
//  arraylist of particle objects. clicking on the screen creates a new
//  object of the Generator class. 

//  modify the behavior of the particle (and potentially the particle 
//  generator to create an effect that simulates some kind of natural 
//  phenonema. think about the youtube video we saw in class - 
//  (https://www.youtube.com/watch?v=heW3vn1hP2E) that shows how a few 
//  simple changes to a basic particle system can create some convincing 
//  effects, like fire, smoke, and water. 
// see how far you can get and be creative. maybe it could be raindrops on
//  a window, stars zooming by in space, a waterfall? Use color, opacity,
//  size, and lifetimes to control things. try mapping the values of your 
//  parameters to the lifetime, just as in the example each particle gets
//  smaller as it reaches the end of its life. try changing particle speeds,'
//  directions, and other behavior.

//ArrayList<Generator> generators;
Soap test = new Soap(400, 400);

void setup() {
  size (800, 800);
  //generators = new ArrayList<Generator>();
}

void draw() {
  background(249, 204, 204);
  //for (int i = 0; i < generators.size(); i++) {
  //  Generator g = generators.get(i);
  //  g.addParticles();
  //  g.drawParticles();
  //}
  test.addStars();
  test.drawStars();
  
}

//void mousePressed() {
//  generators.add(new Generator(mouseX, mouseY));
//}

class Soap {
  ArrayList<Suds> stars;
  float posX;
  float posY;
  float rate; 
  
  Soap(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
    stars = new ArrayList<Suds>();
  }
  
  void addStars() {
    stars.add(new Suds(this.posX, this.posY));
  }
  
  void drawStars() {
    for (int i = 0; i < stars.size(); i++) {
      Suds s = stars.get(i);
      s.update();
      s.display();
    }
  }
}

class Suds {
  float posX;
  float posY;
  float velX;
  float velY;
  float life;
  
  Suds(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
    this.velX = random(-5,5);
    this.velY = random(-5,5);
    life = 5;
  }

  void display() {
    stroke(125, 212, 224);
    ellipse(this.posX, this.posY, life, life);
  }
  
  void update() {
    life++;
    this.posX += this.velX;
    this.posY += this.velY;
  }
}

class Particle {
  float posX;
  float posY;
  float velX;
  float velY;
  float life;
  float alpha;

  Particle(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
    this.velX = random(-5, 5);
    this.velY = random(-5, 5);
    life = 50;
  }

  void display() {
    fill(255, alpha);
    ellipse(this.posX, this.posY, life, life);
  }

  void update() {
    life--;
    alpha--;
    this.posX += this.velX;
    this.posY += this.velY;

    // check if it goes off
    if (this.posX > width || this.posX < 0) {
      this.velX *= -1;
    }
    if (this.posY > height || this.posY < 0) {
      this.velY *= -1;
    }
  }
}
