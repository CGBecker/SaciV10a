public class Life{
  float x,y,w,h;
  int frames, currentFrame;
  PImage [] images;

public Life(){
  x = 0;
  y = 0;
  w = 32;
  h = 60;
  frames = 12;
  currentFrame = 0;
  images = new PImage[frames];
  for (int i=0; i<frames;i++){
    images[i]=loadImage("Life"+nf(i+1,3)+".png");
  }

}

public void Display(){
  //scale(4.0);
  image(images[currentFrame],x,y);
  currentFrame++;
  if(currentFrame == frames){
    currentFrame = 0;
  }

}


}
