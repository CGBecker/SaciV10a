public class GoldenFruit{
  float x,y,w,h;
  int frames, currentFrame;
  PImage [] images;

public GoldenFruit(){
  x = 0;
  y = 0;
  w = 32;
  h = 32;
  frames = 16;
  currentFrame = 0;
  images = new PImage[frames];
  for (int i=0; i<frames;i++){
    images[i]=loadImage("Gold"+nf(i+1,3)+".png");
  }

}

public void Display(){
  //scale(4.0);
  image(images[currentFrame],x,y);
  currentFrame++;
  if(currentFrame == frames){
    currentFrame = 0;
  }
  
  //fill(255);
  //rect(x,y,w,h);

}


}