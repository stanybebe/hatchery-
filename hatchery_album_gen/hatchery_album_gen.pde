import codeanticode.syphon.*;
SyphonServer server;

//delare the objects and arrays of pictures
//array list is used for storing many copies of a class, a list of classes, in this case tiles

PImage[] pics = new PImage[28];
PImage[] pics2 = new PImage[32];
ArrayList<gShape> G_Shape = new ArrayList<gShape>();
//this bool is a flag ,here it triggers the session
boolean flag = false;
//random number used to choose a random tile
int rand;
float t , randB;

void setup() {
  size(600, 600, P3D);
  //load all the tiles, starting with tile0.png
  for (int i = 0; i < pics.length; i++) {
    pics[i] = loadImage("data/tile"+i+".png");
  }
   for (int i = 0; i < pics2.length; i++) {
    pics2[i] = loadImage("fontshapes/tile"+i+".png");
  }
  smooth(8);
  server = new SyphonServer(this, "Processing Syphon");
}



void draw() {
  
  t=t*.02;
  background(255);
  randB = random(0,50);
  

  //instansiate the class 
  G_Shape.add( new gShape());

  //this is a statement that says if flag is true then run this sequence of commands, 
  //use an enhanced for loop to create the objects in the array list then draw them in a grid
  //ie nested for loop to go across the screen in rows and columns for each step, draw a tile with the display function
  //notice important that the for loops are going from 0 to width in increments of 100, and 
  // the canvas size is 700 x 700 so then we know that we will have 7 rows and 7 columns of tiles
  //each one as its own class thus independent of their siblings
  
  

  if (flag==true) {
    for ( gShape g : G_Shape) {

      for (int i =0; i<width; i=i+100) {
        for (int j = 0; j< height; j=j+100) {

          
          g.display(i,j,50,round(random(0,4)));
          //g.polygon(50+i,50+j,50,3);
          noStroke();
          
        }
      }
    }
  } else {
    flag =false;
  }
  server.sendScreen();
}


void keyPressed() {

  if (key == 'z') {
    flag = true;


    print("working");
  }
  
  
  if (key=='s'||key=='S') {

    // Saves each frame as line-000001.png, line-000002.png, etc.
    saveFrame("hatchery-######.png");
  }
}
