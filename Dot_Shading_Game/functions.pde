color applyColor(color you, color food, float youRadius, float foodRadius) {
  float percentFood = foodRadius / ( youRadius + foodRadius); //calculate your new color
  float percentMe = 1 - percentFood;
  float amountRed = (red(you)*percentMe + red(food)* percentFood); 
  float amountGreen = (green(you)*percentMe + green(food)* percentFood);
  float amountBlue = (blue(you)*percentMe + blue(food)* percentFood);
  color newColor = color( amountRed, amountGreen, amountBlue );
  return color(newColor);
}

void displayWin() {
  println("You win the game!");
}

void drawBackGround() {
  background(backgroundCol);

  for (int i = 0; i < foodDots.size(); i++) {
    foodDots.get(i).display();
  }
}

void checkDist() { //check the distance between you and a foodDot
  color tempVar = youFill;
  int numDeleted = 0;
  PVector tempYou = you;
  for (int i = 0; i < foodDots.size(); ) {
    float xSquared = pow( (tempYou.x - foodDots.get(i).location.x), 2);
    float ySquared = pow( (tempYou.y - foodDots.get(i).location.y), 2);
    float dist = sqrt(xSquared + ySquared);
    if ( dist <= youSize/2) {
      tempVar = color( (applyColor(youFill, (foodDots.get(i)).c, youSize, (foodDots.get(i)).radius)));
      foodDots.remove(i);
      numDeleted ++;
      //println("removed", i);
    } else
      i++;
  }
  youFill = tempVar;
  //generate new dots to make up for the ones you ate
  for (int i = 0; i < numDeleted; i++) {
    PVector l = new PVector (random( width), random(height));
    color c = color(random(255), random(255), random(255));
    float r = random(rMin, rMax);
    foodDots.add( new foodDot(r, c, l) );
  }
}
