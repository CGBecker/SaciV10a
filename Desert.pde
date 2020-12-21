public class Desert{

float x,y,w,h;
PImage image1;
  
public Desert(){
x = 0;
y = 0;
w = 100;
h = 100;
image1 = new PImage();
image1 = loadImage("TileDesert.png");

}


public void Display(){
  image(image1,x,y);

}

}
