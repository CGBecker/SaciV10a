public class Enemy2{
  float x,y,w,h;
  int frames, currentFrame, currentFrameD, framesD;
  PImage [] images, imagesD;
  
  Boolean isDead;
  
public Enemy2(){
  x = 0;
  y = 0;
  w = 60;
  h = 60;
  isDead = false;
  frames = 8;
  currentFrame = 0;
  framesD = 20;
  currentFrameD = 0;
  images = new PImage[frames];
  imagesD = new PImage[framesD];
  for (int i=0; i<frames;i++){
    images[i]=loadImage("cas"+nf(i+1,3)+".png");    
  }
  for (int u=0; u<framesD;u++){
    imagesD[u]=loadImage("casD"+nf(u+1,3)+".png");
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
      this.x = 1800;
      this.y = int(random(0,7))*100+20;
  }
  }
  
  //fill(255);
  //rect(x,y,w,h);

}


}