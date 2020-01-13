class gShape {
  float xpos=0;
  float ypos=0;
  float xpos2=0;
  float ypos2=0;
  int  rand;

  void display( float xpos, float ypos, float rad, int point ) {
    if (flag ==true) {
      rand = floor(random(0, 28));
    } else {
      flag=false;
    }
    pushMatrix();
    fill(255);

    image(pics[rand], 0+xpos, 0+ypos, 100, 100);
    ellipse(50+xpos,50+ypos,rand,rand);
    //image(pics2[rand], 0+xpos, 0+ypos, 100, 100);

    popMatrix();


    pushMatrix();


    // polygon(xpos, ypos, rad, point);
    popMatrix();
  }

  //void display(float xpos, float ypos) {

  //}
  void polygon(float x, float y, float radius, int npoints) {
    float angle = TWO_PI / npoints;
    noStroke();
    fill(#231F20);
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
