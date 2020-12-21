public class Tree{

float x,y,w,h;
PImage image1;
PImage [] imagesD;
int frames, currentFrame;
Boolean isDead, Burned;  
  
public Tree(){
x = 0;
y = 0;
w = 44;
h = 100;
isDead = false;
Burned = false;
frames = 22;
currentFrame = 0;
image1 = new PImage();
imagesD = new PImage[frames];
image1 = loadImage("Tree001.png");

for (int i=0; i<frames;i++){
  imagesD[i]=loadImage("TreeB"+nf(i+1,3)+".png");
}
}

public void Display(){
  if(isDead == false){image(image1,x,y);}
  if(isDead == true){
    image(imagesD[currentFrame],x,y);
    currentFrame++;
    if(currentFrame == frames){
      currentFrame = 0;
      isDead = false;
      this.y = -200;
      Burned = true;
    }
  }
}
}