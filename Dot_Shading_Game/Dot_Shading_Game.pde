//============================================================
//  Instructions for play
//============================================================
//  1. Use the arrow keys to move your dot on the screen. 
//  2. You are trying to "eat up" dots that help you achieve the same shade as the background.
//  3. Everytime you "eat" a dot, your rgb values change, depending on the size of the dot you ate.
//  4. Once your shade is deemed close enough to the background, you win!
//  5. Have fun playing!

PVector you = new PVector(0, 0); //starting position (top left corner, use your arrow keys to move)
ArrayList<foodDot> foodDots = new ArrayList <foodDot>(); //array of dots in the background
int numDots = 200; //change the number of dots on the screen
int rMin = 10; //mininum size of the foodDots
int rMax = 20; //maximum size of the foodDots
float speed = 15; //speed at which you move
int youSize = 30; //your radius
color youFill = color(255); //you begin off as a white shade
int difficultyLevel = 50; //the smaller the number is, the harder the game gets
color backgroundCol = color (random(255), random(255), random(255));

void setup() {
  size(600, 600);
  background(backgroundCol);
  noStroke();
  //generate dots in the background
  for (int i = 0; i < numDots; i++) {
    PVector l = new PVector (random( width), random(height));
    color c = color(random(255), random(255), random(255));
    float r = random(rMin, rMax);
    foodDots.add( new foodDot(r, c, l) );
  }

  for (int i = 0; i < numDots; i++) {
    foodDots.get(i).display();
  }
}

void draw() {
  //how close your color is to the background shade
  float deltaRed = abs(red(backgroundCol) - red(youFill));
  float deltaGreen = abs(green(backgroundCol) - green(youFill));
  float deltaBlue = abs(blue(backgroundCol) - blue(youFill));
  if ( (deltaRed + deltaGreen + deltaBlue) < difficultyLevel) {
    displayWin();
    noLoop();
  }
  drawBackGround();
  checkDist(); 
  fill(youFill);
  ellipse(you.x, you.y, youSize, youSize); //update your dot
}

void keyPressed() { //movement
  if (key == CODED) {
    if (keyCode == LEFT) 
      you.x -= speed;
    else if (keyCode == RIGHT)
      you.x += speed;
    else if (keyCode == UP)
      you.y -= speed;
    else if (keyCode == DOWN)
      you.y += speed;
  }
}
