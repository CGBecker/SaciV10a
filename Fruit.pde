public class Fruit{
  float x,y,w,h;
  int frames, currentFrame, currentFrameD, framesD;
  PImage [] images, imagesD;
  
  Boolean isDead;

public Fruit(){
  x = 0;
  y = 0;
  w = 32;
  h = 32;
  isDead = false;
  frames = 16;
  currentFrame = 0;
  framesD = 16;
  currentFrameD = 0;
  images = new PImage[frames];
  imagesD = new PImage[framesD];
  for (int i=0; i<frames;i++){
    images[i]=loadImage("Apple"+nf(i+1,3)+".png");
    imagesD[i]=loadImage("Des"+nf(i+1,3)+".png");
  }

}

public void Display(){
  //scale(4.0);
 if(isDead == false){
    image(images[currentFrame],x,y);
    currentFrame++;
    if(currentFrame == frames){
      currentFrame = 0;
    }
  }  
  if(isDead == true){    
    image(imagesD[currentFrameD],x,y);
    currentFrameD++;
    if(currentFrameD == framesD){
      currentFrameD = 0;
      isDead = false;
      this.y = -200;
  }
  }
  
  //fill(255);
  //rect(x,y,w,h);

}


}