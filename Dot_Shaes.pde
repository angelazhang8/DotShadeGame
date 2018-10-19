//

PVector you = new PVector(0, 0);
ArrayList<foodDot> foodDots = new ArrayList <foodDot>();
int numDots = 200;
int rMin = 10;
int rMax = 20;
float speed = 15;
int youSize = 30;
color youFill = color(255);
int difficultyLevel = 50; //smaller the number is, the harder it gets
color backgroundCol = color (random(255), random(255), random(255));

void setup() {
  size(600, 600);
  background(backgroundCol);
  noStroke();

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
  ellipse(you.x, you.y, youSize, youSize);
}

void keyPressed() {
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
