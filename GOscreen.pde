public class GOscreen{

float x,y,w,h;
PImage image1;
  
public GOscreen(){
x = 0;
y = 0;
w = 800;
h = 600;
image1 = new PImage();
image1 = loadImage("END.png");

}


public void Display(){
  image(image1,x,y);

}


}