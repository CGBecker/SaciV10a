import processing.dxf.*;

import processing.sound.*;

SoundFile loop1, Shot, LevelUp, Hit, Death;

int posX = 100;
int posY = 300;

int accelX = 5;
int accelY = 5;
int enemySpeed = 0;
int timer;

int c1;
int c2;
int c3;
int c4;

int DesertCount = 0;
int Fruit1Timer1;
int Fruit1Timer2;
int Fruit1ShotsCount = 0;
int GFruit1Timer1;
int GFruit1Timer2;
int ArraySizeShots = 0;
int cooldown;
int LifeCount = 5;
int ScoreCount = 0;
int ScoreShow;

boolean UPpressed;
boolean DOWNpressed;
boolean RIGHTpressed;
boolean LEFTpressed;
boolean SPACEpressed;
boolean [] Collided;
boolean caughtFruit = true;
boolean caughtGFruit = true;
boolean [] NoTree;
boolean Started = false;
boolean CrossedLine = false;
boolean restarted = true;
boolean AudioReady = false;

String shotsCountToString;
String LifeCountToString;
String ScoreCountToString;

float AudioTime = 0;

Grass [] Grass1;
Desert [] Desert1;

Tree [] Tree1;

Fruit Fruit1;
Fruit [] Shots1;
Fruit DisplayFruits;

GoldenFruit GoldenFruit1;

Life Lifes;

Player Player1;

Enemy1 [] enemy1;
Enemy2 [] enemy2;

StartScreen StartScreen1;
StartScreen GameOver1;

GOscreen GameOver;

void setup(){

  size(800, 600);   
  
  Grass1 = new Grass[24];
  Desert1 = new Desert[48];
  Collided = new boolean[24];
  NoTree = new boolean[24];
    NoTree[18] = true;
     NoTree[19] = true;
      NoTree[20] = true;
       NoTree[21] = true;
        NoTree[22] = true;
         NoTree[23] = true;
       
  Tree1 = new Tree[18];  
  c1 = 0; 
  
  Fruit1 = new Fruit();
  Fruit1.y = -200;
  Shots1 = new Fruit[10];    
  
  Player1 = new Player();
  
  enemy1 = new Enemy1[4];
  enemy2 = new Enemy2[4];
  
  Lifes = new Life();
  Lifes.x = 125;
  Lifes.y = 8;
  
  DisplayFruits = new Fruit();
  DisplayFruits.x = 5;
  DisplayFruits.y = 5;  
  
  GoldenFruit1 = new GoldenFruit();
  
  for(int g2=0;g2<Tree1.length;g2++){
    Tree1[g2] = new Tree();
    if(g2 < 6){
      Tree1[g2].x = 28;
      Tree1[g2].y = c1;
      c1 += 100;
    }
    if(g2 >= 6 && g2 < 12){
      if(g2==6){c1 = 0;}
      Tree1[g2].x = 128;
      Tree1[g2].y = c1;
      c1 += 100;
    
    }
    if(g2 >= 12){
      if(g2==12){c1=0;}
      Tree1[g2].x = 228;
      Tree1[g2].y = c1;
      c1 += 100;
    }
    
  }    
  for(int g4=0;g4<Desert1.length;g4++){
    Desert1[g4] = new Desert();
    if(g4<6){
      Desert1[g4].x = 400;
      Desert1[g4].y = 0 + c3;
      c3+= 100;
    }  
    if(g4>=6&&g4<12){
      if(g4==6){c3 = 0;}
      Desert1[g4].x = 500;
      Desert1[g4].y = 0 + c3;
      c3+= 100;
    }
    if(g4>=12&&g4<18){
      if(g4==12){c3 = 0;}
      Desert1[g4].x = 600;
      Desert1[g4].y = 0 + c3;
      c3+= 100;
    }
    if(g4>=18&&g4<24){
      if(g4==18){c3 = 0;}
      Desert1[g4].x = 700;
      Desert1[g4].y = 0 + c3;
      c3+= 100;
    }
    if(g4>=24&&g4<48){      
      Desert1[g4].x = 0;
      Desert1[g4].y = -200;
    }
  }
  for(int g=0;g<Grass1.length;g++){
    Grass1[g] = new Grass();
    if(g<6){
      Grass1[g].x = 0;
      Grass1[g].y = 0 + c2;
      c2+= 100;
    }  
    if(g>=6&&g<12){
      if(g==6){c2 = 0;}
      Grass1[g].x = 100;
      Grass1[g].y = 0 + c2;
      c2+= 100;
    }
    if(g>=12&&g<18){
      if(g==12){c2 = 0;}
      Grass1[g].x = 200;
      Grass1[g].y = 0 + c2;
      c2+= 100;
    }
    if(g>=18&&g<24){
      if(g==18){c2 = 0;}
      Grass1[g].x = 300;
      Grass1[g].y = 0 + c2;
      c2+= 100;
    }    
  }  
  
  for(int g5=0;g5<enemy1.length;g5++){
    enemy1[g5] = new Enemy1();
    enemy1[g5].x = 900 + c4;
    enemy1[g5].y = int(random(0, 7))*100 + 20;
    c4 += 300;  
    enemy2[g5] = new Enemy2();
    enemy2[g5].x = 1800 + c4;
    enemy2[g5].y = int(random(0, 7))*100 + 20;
  }
  
  for(int i2=0;i2<Collided.length;i2++){
    Collided[i2] = false;   
  }
  
  for(int i4=0;i4<Shots1.length;i4++){
    Shots1[i4] = new Fruit();
    Shots1[i4].y = -200;
  }
  
  StartScreen1 = new StartScreen();
  
  loop1 = new SoundFile(this, "Loop1.wav");
  Shot = new SoundFile(this, "Shot.wav");
  LevelUp = new SoundFile(this, "LevelUp.wav");
  Death = new SoundFile(this, "Death.wav");
  Hit = new SoundFile(this, "Hit.wav");
  Hit.amp(0.1);
}

void draw(){
  timer++;
  if(timer >= 900){
    timer = 0;
    enemySpeed++;
    for(int u4 = 0;u4 < Shots1.length;u4++){
      if(Shots1[u4].isDead == false){Shots1[u4].w += 7;}
    }
  }  
   for(int z=0;z<Desert1.length;z++){      
    Desert1[z].Display();   
  }  
  for(int u=0;u<Grass1.length;u++){      
    Grass1[u].Display();     
  } 
  for(int i=0;i<Tree1.length;i++){        
    Tree1[i].Display();     
  }   
  for(int i3=0;i3<Shots1.length;i3++){
    Shots1[i3].Display();
  }
  Fruit1.Display();
  GoldenFruit1.Display();
  Player1.Display();
  Player1.x = posX;
  Player1.y = posY;
  Lifes.Display();
  
  if(AudioReady == true){
    loop1.play(0.5);
    AudioReady = false;  
    AudioTime = 0;
  }
  AudioTime++;
  if(AudioTime > 1330 && Started == true){
    loop1.play(0.5);    
    AudioTime = 0;
  }
  
  if(UPpressed){posY -= accelY;}
  if(DOWNpressed){posY += accelY;}
  if(RIGHTpressed){posX += accelX;}
  if(LEFTpressed){posX -= accelX;}
  cooldown++;
  if(SPACEpressed && cooldown >= 30 && Fruit1ShotsCount > 0 && Started == true){
    if(ArraySizeShots == 10){ArraySizeShots = 0;}
    Shot.play();
    Shots1[ArraySizeShots] = new Fruit();
    Shots1[ArraySizeShots].x = Player1.x + 20;
    Shots1[ArraySizeShots].y = Player1.y + 20;
    ArraySizeShots++;
    Fruit1ShotsCount--;
    cooldown = 0;
  }  
  
  if(Shots1.length > 0){
    for(int g9 = 0; g9 < Shots1.length; g9++){
      Shots1[g9].Display();
      Shots1[g9].x += 6;      
    }
}
  
  if(Player1.x < 0){Player1.x = 0; posX = 0;}
  if(Player1.x > 375){Player1.x = 375; posX = 375;}
  if(Player1.y < 0){Player1.y = 0; posY = 0;}
  if(Player1.y > 540){Player1.y = 540; posY = 540;}
  
  for(int g6=0;g6<enemy1.length;g6++){
    enemy1[g6].Display();
    if(enemy1[g6].isDead == false){enemy1[g6].x -= enemySpeed;}
    if(enemy1[g6].x < -100 && CrossedLine == true){ //refazer CrossedLine para Array
      print(enemy1[g6].x);      
      LifeCount-=1;        
    }
    if(enemy1[g6].y < 0){enemy1[g6].y = int(random(0,7))*100+20;}
    if(enemy1[g6].x < -100){enemy1[g6].x = 1800; enemy1[g6].y = int(random(0,7))*100+20;}   
    
    enemy2[g6].Display();
    if(enemy2[g6].isDead == false){enemy2[g6].x -= enemySpeed;}
    if(enemy2[g6].x < -100 && CrossedLine == true){
      print(enemy2[g6].x);      
      LifeCount-=1;        
    }
    if(enemy2[g6].y < 0){enemy2[g6].y = int(random(0,7))*100+20;}
    if(enemy2[g6].x < -100){enemy2[g6].x = 1800; enemy2[g6].y = int(random(0,7))*100+20;}    
       
    for(int g7=0;g7<Tree1.length;g7++){
    if(Colision(Tree1[g7].x, Tree1[g7].y, Tree1[g7].w, Tree1[g7].h, enemy1[g6].x, enemy1[g6].y, enemy1[g6].w, enemy1[g6].h)){
      enemy1[g6].isDead = true;
      Tree1[g7].isDead = true;                        
    }    
    
    if(Colision(Tree1[g7].x, Tree1[g7].y, Tree1[g7].w, Tree1[g7].h, enemy2[g6].x, enemy2[g6].y, enemy2[g6].w, enemy2[g6].h)){    
      enemy2[g6].isDead = true;  
      Tree1[g7].isDead = true;                         
    }
    if(Tree1[g7].Burned == true){
      NoTree[g7] = true;
    }
    
    for(int g8=0;g8<Grass1.length;g8++){
      if(Colision(Grass1[g8].x, Grass1[g8].y, Grass1[g8].w, Grass1[g8].h, enemy1[g6].x, enemy1[g6].y, enemy1[g6].w, enemy1[g6].h)){
        if(NoTree[g8] == true){
        if(Grass1[g8].y >= 0 && Collided[g8] == false && Grass1[g8].isDead == false){
          Desert1[DesertCount+24].x = Grass1[g8].x;
          Desert1[DesertCount+24].y = Grass1[g8].y;
          Collided[g8] = true;
          DesertCount++;
        }
        Grass1[g8].isDead = true;
        if(g8 < 6){
        CrossedLine = true;
        }
      }
      }
      
      if(Colision(Grass1[g8].x, Grass1[g8].y, Grass1[g8].w, Grass1[g8].h, enemy2[g6].x, enemy2[g6].y, enemy2[g6].w, enemy2[g6].h)){
        if(NoTree[g8] == true){
        if(Grass1[g8].y >= 0 && Collided[g8] == false && Grass1[g8].isDead == false){
          Desert1[DesertCount+24].x = Grass1[g8].x;
          Desert1[DesertCount+24].y = Grass1[g8].y;
          Collided[g8] = true;
          DesertCount++;
        }
        Grass1[g8].isDead = true;
        if(g8 < 6){
        CrossedLine = true;
        }
      }
      }
      
    }
    }   
  }
  
  DisplayFruits.Display();
  
  for(int u2 = 0; u2<Shots1.length;u2++){
    if(Shots1[u2].x >= 850){
      Shots1[u2].y = -200;
    }
    for(int u3 = 0;u3<enemy1.length;u3++){
      if(Colision(Shots1[u2].x, Shots1[u2].y, Shots1[u2].w, Shots1[u2].h, enemy1[u3].x, enemy1[u3].y, enemy1[u3].w, enemy1[u3].h)){
        Hit.play();
        enemy1[u3].isDead = true;
        Shots1[u2].isDead = true;
        ScoreCount += 25;
      }    
      
      if(Colision(Shots1[u2].x, Shots1[u2].y, Shots1[u2].w, Shots1[u2].h, enemy2[u3].x, enemy2[u3].y, enemy2[u3].w, enemy2[u3].h)){
        Hit.play();
        enemy2[u3].isDead = true;
        Shots1[u2].isDead = true;
        ScoreCount += 55;
      }       
    }    
  }
  if(Colision(Fruit1.x, Fruit1.y, Fruit1.w, Fruit1.h, Player1.x, Player1.y, Player1.w, Player1.h)){
    caughtFruit = true;
    Fruit1Timer1 = 0;
    Fruit1Timer2 = 0;
    Fruit1ShotsCount += 10;
            
   }
   
    if(Colision(GoldenFruit1.x, GoldenFruit1.y, GoldenFruit1.w, GoldenFruit1.h, Player1.x, Player1.y, Player1.w, Player1.h)){
      LevelUp.play();
      caughtGFruit = true;
      GFruit1Timer1 = 0;
      GFruit1Timer2 = 0;  
      accelX += 1;
      accelY += 1;
            
   }      
    
   if(caughtGFruit == false){
    GFruit1Timer1++;
    if(GFruit1Timer1 <= 1){
      GoldenFruit1.y = int(random(25,550));
      GoldenFruit1.x = int(random(25,350));
    }
    if(GFruit1Timer1 >= 180){
      GoldenFruit1.y = -200;
      caughtGFruit = true;
      GFruit1Timer1 = 0;
    }
  }
  if(caughtGFruit == true){
    GFruit1Timer2++;
    if(GFruit1Timer2 <= 1){
      GoldenFruit1.y = -200;
    }
    if(GFruit1Timer2 >= 600){
      caughtGFruit = false;
      GFruit1Timer2 = 0;
    }
  }
   
    
  
  if(caughtFruit == false){
    Fruit1Timer1++;
    if(Fruit1Timer1 <= 1){
      Fruit1.y = int(random(25,550));
      Fruit1.x = int(random(25,350));
    }
    if(Fruit1Timer1 >= 180){
      Fruit1.y = -200;
      caughtFruit = true;
      Fruit1Timer1 = 0;
    }
  }
  if(caughtFruit == true){
    Fruit1Timer2++;
    if(Fruit1Timer2 <= 1){
      Fruit1.y = -200;
    }
    if(Fruit1Timer2 >= 600){
      caughtFruit = false;
      Fruit1Timer2 = 0;
    }
  }
  
  
  shotsCountToString = "X"+Fruit1ShotsCount;
  LifeCountToString = "X"+LifeCount;
  ScoreCountToString = "SCORE X "+ScoreCount;
  
  textSize(32);
  text(shotsCountToString, 45, 35); 
  text(LifeCountToString, 160, 35);
  text(ScoreCountToString, 275, 35);
  
  if(Started == false){
    StartScreen1.Display();
    //text("SACI ADVENTURE", 150,150);
    //text("PRESS SPACE TO START!!", 150, 400);
  }
  
  if(LifeCount <= 0){    
    loop1.stop();
    Death.play();
    ScoreShow = ScoreCount;
    Grass1 = new Grass[24];
    Desert1 = new Desert[48];
    Collided = new boolean[24];
    NoTree = new boolean[24];
    NoTree[18] = true;
    NoTree[19] = true;
    NoTree[20] = true;
    NoTree[21] = true;
    NoTree[22] = true;
    NoTree[23] = true;       
    Tree1 = new Tree[18];  
    c1 = 0;      
    Fruit1 = new Fruit();
    Fruit1.y = -200;
    Shots1 = new Fruit[10];    
    Player1 = new Player();  
    enemy1 = new Enemy1[4];  
    enemy2 = new Enemy2[4];
    Lifes = new Life();
    Lifes.x = 125;
    Lifes.y = 8;  
    DisplayFruits = new Fruit();
    DisplayFruits.x = 5;
    DisplayFruits.y = 5;    
    DesertCount = 0;
    enemySpeed = 0;
    Fruit1ShotsCount = 0;
    ScoreCount = 0;
    CrossedLine = false;
    for(int g2=0;g2<Tree1.length;g2++){
      if(g2 == 0){c1 = 0;}
      Tree1[g2] = new Tree();
      if(g2 < 6){
        Tree1[g2].x = 28;
        Tree1[g2].y = c1;
        c1 += 100;
      }
      if(g2 >= 6 && g2 < 12){
        if(g2==6){c1 = 0;}
        Tree1[g2].x = 128;
        Tree1[g2].y = c1;
        c1 += 100;    
      }
      if(g2 >= 12){
        if(g2==12){c1=0;}
        Tree1[g2].x = 228;
        Tree1[g2].y = c1;
        c1 += 100;
      }    
    }  
    for(int g=0;g<Grass1.length;g++){
      Grass1[g] = new Grass();
      if(g == 0){c2 = 0;}
      if(g<6){
        Grass1[g].x = 0;
        Grass1[g].y = 0 + c2;
        c2+= 100;
      }  
      if(g>=6&&g<12){
        if(g==6){c2 = 0;}
        Grass1[g].x = 100;
        Grass1[g].y = 0 + c2;
        c2+= 100;
      }
      if(g>=12&&g<18){
        if(g==12){c2 = 0;}
        Grass1[g].x = 200;
        Grass1[g].y = 0 + c2;
        c2+= 100;
      }
      if(g>=18&&g<24){
        if(g==18){c2 = 0;}
        Grass1[g].x = 300;
        Grass1[g].y = 0 + c2;
        c2+= 100;
      }    
    }
    for(int g4=0;g4<Desert1.length;g4++){
      Desert1[g4] = new Desert();
      if(g4 == 0){c3 = 0;}
      if(g4<6){
        Desert1[g4].x = 400;
        Desert1[g4].y = 0 + c3;
        c3+= 100;
      }  
      if(g4>=6&&g4<12){
        if(g4==6){c3 = 0;}
        Desert1[g4].x = 500;
        Desert1[g4].y = 0 + c3;
        c3+= 100;
      }
      if(g4>=12&&g4<18){
        if(g4==12){c3 = 0;}
        Desert1[g4].x = 600;
        Desert1[g4].y = 0 + c3;
        c3+= 100;
      }
      if(g4>=18&&g4<24){
        if(g4==18){c3 = 0;}
        Desert1[g4].x = 700;
        Desert1[g4].y = 0 + c3;
        c3+= 100;
      }
      if(g4>=24&&g4<48){      
        Desert1[g4].x = 0;
        Desert1[g4].y = -200;
      }
    }  
    for(int g5=0;g5<enemy1.length;g5++){
      if(g5 == 0){c4 = 0;}
      enemy1[g5] = new Enemy1();
      enemy1[g5].x = 900 + c4;
      enemy1[g5].y = int(random(0, 7))*100 + 20;
      c4 += 300;  
      enemy2[g5] = new Enemy2();
      enemy2[g5].x = 1800 + c4;
      enemy2[g5].y = int(random(0, 7))*100 + 20; 
    }  
    for(int i2=0;i2<Collided.length;i2++){
      Collided[i2] = false;   
    }  
    for(int i4=0;i4<Shots1.length;i4++){
      Shots1[i4] = new Fruit();
      Shots1[i4].y = -200;
    }
    LifeCount = 5;
    restarted = false;
    GameOver = new GOscreen();
  }
  
  if(restarted == false){
    GameOver.Display();
    //text("GAME OVER", 150,150);
    text("SCORE: "+ScoreShow, 100,50);
    //text("PRESS SPACE TO RESTART!!", 150, 400);
  }
  
  
}

void keyPressed(){
  if(keyCode == UP){UPpressed = true; Player1.UPpressed = true;}
  if(keyCode == DOWN){DOWNpressed = true; Player1.DOWNpressed = true;}
  if(keyCode == RIGHT){RIGHTpressed = true; Player1.RIGHTpressed = true;}
  if(keyCode == LEFT){LEFTpressed = true; Player1.LEFTpressed = true;}
  if(key == ' '){SPACEpressed = true;}
}

void keyReleased(){
  if(keyCode == UP){UPpressed = false; Player1.UPpressed = false;}
  if(keyCode == DOWN){DOWNpressed = false; Player1.DOWNpressed = false;}
  if(keyCode == RIGHT){RIGHTpressed = false; Player1.RIGHTpressed = false;}
  if(keyCode == LEFT){LEFTpressed = false; Player1.LEFTpressed = false;}
  if(key == ' '){
    SPACEpressed = false;
    if(Started == false){
      Started = true;
      enemySpeed = 3;
      Fruit1ShotsCount = 10;
      //loop1.loop(0.5);
      AudioReady = true;
    }
    if(restarted == false){
      //loop1.loop(0.5);
      restarted = true;
      enemySpeed = 3;
      Fruit1ShotsCount = 10;
      AudioReady = true;
    }
  }
}

boolean Colision(float x1,float y1,float w1,float h1,float x2, float y2,float w2,float h2){
   boolean horizontal = false;
   boolean vertical = false;
  
   //colisao em x
   if(x1 < x2)
     horizontal = x2 < (x1 + w1);
   else
     horizontal = x1 < (x2 + w2);
  //colisao em y
  if(y1 < y2)
    vertical = y2 < (y1 + h1);
  else
    vertical = y1 < (y2 + h2);
  
  return horizontal && vertical;    
}