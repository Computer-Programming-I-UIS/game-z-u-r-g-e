import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

StopWatch sw = new StopWatch();

Sprite laser;
Sprite zurge;
Sprite armas;
Sprite gus;
Sprite bil;
Sprite alien;
Sprite laserbala;

void setup(){
  size(800,600);
 
  laser=new Sprite(this,"laser.png",2,2,20);
  zurge=new Sprite(this,"zurge.png",3,3,20);
  armas=new Sprite(this,"armas.png",2,2,20);
  gus=new Sprite(this,"gus.png",2,2,20);
  bil=new Sprite(this,"bil.png",2,2,20);
  alien=new Sprite(this,"alien.png",2,2,20);
  laserbala=new Sprite(this,"laserbala.png",2,3,20);
  
  
}




void draw(){
  
  float elapsedTime = (float) sw.getElapsedTime();
  S4P.updateSprites(elapsedTime);
  background(200, 200, 255);
  S4P.drawSprites();
  if(mousePressed){
    laser.setXY(250,500);
    laser.setFrameSequence(0, 3, 0.09, 1);
    zurge.setXY(500,200);
    zurge.setFrameSequence(0,3,0.09,1);
    armas.setXY(100,300);
    armas.setFrameSequence(0,3,0.09,1);
    gus.setXY(600,300);
    gus.setFrameSequence(0,2,0.09,1);
    bil.setXY(500,400);
    bil.setFrameSequence(0,3,0.09,1);
    laserbala.setXY(430,510);
    laserbala.setFrameSequence(0,4,0.09,1);
    
  }
  if(keyPressed&&keyCode==LEFT){
    zurge.setXY(500,200);
    zurge.setFrameSequence(4,6,0.09,1);
    alien.setXY(200,400);
    alien.setFrameSequence(0,2,0.09,1);
  }
}
