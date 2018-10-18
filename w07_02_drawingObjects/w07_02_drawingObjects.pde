// Code_1_FA18
// Week 7
// Bryan Ma

// this sketch creates 10 instances of a ball class. 
// it does this in the setup() function in a loop instead of 
//  doing it based on mouse presses as we did in class.

// review this approach, then create your own class that draws
//  a different visual to the screen with its own behavior. 
//  it could be abstract or more explicit. think about how to 
//  parameterize your object's constructor. once you've created 
//  a class like this, create a number of instances of your 
//  class on the canvas by any means you prefer.

int num = 250;
ArrayList<Ball> balls = new ArrayList<Ball>();
ArrayList<Gradient> test = new ArrayList<Gradient>();

void setup() {
  size(800, 800);
  
  for (int i = 0; i < 10; i++) {
    balls.add(new Ball(random(width), random(height)));
  }
  
  for (int i = 0; i < num; i++) {
    test.add(new Gradient(num));
  }
}

void draw() {
  
  for (int i = 0; i < balls.size(); i++) {
    Ball ball = balls.get(i);
    ball.display();
    ball.update();
  }
  
  for (int i = 0; i < test.size(); i++) {
    Gradient g = test.get(i);
    g.display();
    g.update();
  }
}

class Gradient {
  float y;
  float howMany, rectH;
  float[] gradColor = new float[255];
  int i;
  
  Gradient(float howMany) { 
    float rectHeight = height/howMany;
    rectH = rectHeight;
  }
  
  void display() {
    noStroke();
    rect(0, y, width, rectH);
    y += rectH;
  }
  
  void update() {
    for (int i = 0; i < gradColor.length; i++) {
      gradColor[i]++;
    }
    
    fill(gradColor[i]);
    
    if (y > height || y < 0) {
      rectH = -rectH;
    }
    
    // this crashes the code whoops!
    // how can i have the gradient reverse back to 0 from 255?
    
    if (gradColor[i] == 255) {
      gradColor[i] = -gradColor[i];
    }
   
  }
}

class Ball {
  // what does it have and do? 
  // create the variables
  // position x,y
  // velocity x,y
  float posX;
  float posY;
  float velX;
  float velY;
  float size;

  // create the constructor
  Ball(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
    this.velX = random(-5, 5);
    this.velY = random(-5, 5);
    this.size = random(50, 200);
  }

  // draw to the screen
  void display() {
    stroke(1);
    fill(255, 0, 0);
    ellipse(this.posX, this.posY, size, size);
  }

  // update its position and velocity.
  void update() {
    this.posX += this.velX;
    this.posY += this.velY;

    // check if it goes off
    if (this.posX > width-this.size/2 || this.posX < this.size/2) {
      this.velX *= -1;
    }
    if (this.posY > height-this.size/2 || this.posY < this.size/2) {
      this.velY *= -1;
    }
  }
}
