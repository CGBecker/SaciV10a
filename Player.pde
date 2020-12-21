public class Player{
  float x,y,w,h;
  int frames, currentFrame;
  PImage [] imagesB, imagesF, imagesR, imagesL;
  
  Boolean UPpressed = false, DOWNpressed = false, RIGHTpressed = false, LEFTpressed = false;

public Player(){
  x = 0;
  y = 0;
  w = 32;
  h = 60;
  frames = 8;
  currentFrame = 0;
  imagesB = new PImage[frames];
  imagesF = new PImage[frames];
  imagesR = new PImage[frames];
  imagesL = new PImage[frames];
  for (int i=0; i<frames;i++){    
    imagesB[i]=loadImage("saciB"+nf(i+1,3)+".png");    
    imagesF[i]=loadImage("saciF"+nf(i+1,3)+".png");    
    imagesR[i]=loadImage("saciR"+nf(i+1,3)+".png");   
    imagesL[i]=loadImage("saciL"+nf(i+1,3)+".png");          
  }
}

public void Display(){
  
  if(UPpressed == true && DOWNpressed == false && RIGHTpressed == false && LEFTpressed == false){image(imagesB[currentFrame],x,y);}
  if(UPpressed == false && DOWNpressed == true && RIGHTpressed == false && LEFTpressed == false){image(imagesF[currentFrame],x,y);}
  if(UPpressed == true && DOWNpressed == true && RIGHTpressed == false && LEFTpressed == false){image(imagesF[currentFrame],x,y);}
  if(UPpressed == false && DOWNpressed == false && RIGHTpressed == true && LEFTpressed == false){image(imagesR[currentFrame],x,y);}
  if(UPpressed == false && DOWNpressed == false && RIGHTpressed == false && LEFTpressed == true){image(imagesL[currentFrame],x,y);}
  if(UPpressed == true && DOWNpressed == false && RIGHTpressed == true && LEFTpressed == false){image(imagesR[currentFrame],x,y);}
  if(UPpressed == false && DOWNpressed == true && RIGHTpressed == true && LEFTpressed == false){image(imagesR[currentFrame],x,y);}
  if(UPpressed == true && DOWNpressed == false && RIGHTpressed == false && LEFTpressed == true){image(imagesL[currentFrame],x,y);}
  if(UPpressed == false && DOWNpressed == true && RIGHTpressed == false && LEFTpressed == true){image(imagesL[currentFrame],x,y);}
  if(UPpressed == false && DOWNpressed == false && RIGHTpressed == false && LEFTpressed == false){image(imagesR[currentFrame],x,y);}
  if(UPpressed == false && DOWNpressed == false && RIGHTpressed == true && LEFTpressed == true){image(imagesR[currentFrame],x,y);}
  
  currentFrame++;
  if(currentFrame == frames){
    currentFrame = 0;
  }

}

}