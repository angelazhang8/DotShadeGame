class foodDot {

  float radius;
  color c;
  PVector location;
  ArrayList<foodDot> foodDots;

  foodDot(float s, color c, PVector l) {
    this.radius = s;
    this.c = c;
    this.location = l;
  }

  void display() {
    fill(this.c);
    ellipse( (this.location).x, (this.location).y, this.radius, this.radius);
  }
}
