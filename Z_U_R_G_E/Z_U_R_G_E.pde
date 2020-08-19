import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

Sprite laser;
Sprite zurge;
Sprite bazooka;
Sprite fusil;
Sprite gus;
Sprite bil;
Sprite alien;
Sprite laserbala;
StopWatch sw = new StopWatch();

float v=width,w=width*4/5,h=height*3/8,j=height/2;
int stage;
PFont fuente;
PImage star;
PImage luna1;
PImage luna2;
PImage energia;
PImage muni;
PImage material;
Estrellas stars[]=new Estrellas[30];
Zurge ZURGE;
Enemigo guss;
Enemigo BIL;
Enemigo aliens1;
Enemigo aliens0;
cajas caja;
int count=0;

void setup(){
  size(1000,600);
  background(0);
  fuente=createFont("fuente.otf",70);
  star=loadImage("estrella.png");
  luna1=loadImage("luna1.png");
  luna2=loadImage("luna2.png");
  energia=loadImage("energia.png");
  muni=loadImage("muni.png");
  material=loadImage("material.png");
  
  laser=new Sprite(this,"laser.png",2,2,2);
  zurge=new Sprite(this,"zurge.png",4,4,2);
  bazooka=new Sprite(this,"bazooka.png",2,3,2);
  fusil=new Sprite(this,"fusil.png",2,2,2); 
  gus=new Sprite(this,"gus.png",2,2,2);
  bil=new Sprite(this,"bil.png",2,2,2);
  alien=new Sprite(this,"alien.png",2,2,2);
  laserbala=new Sprite(this,"laserbala.png",2,3,2);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  stage=0;
  ZURGE=new Zurge (5,50,height/2);
  guss=new Enemigo (5,random(850,width-60),random(60,height-60),2,200);
  BIL=new Enemigo (5,random(850,width-60),random(60,height-60),3,4000);
  caja=new cajas (3.5,width,random(0,height));
  aliens1=new Enemigo (5,800,300,1,1000000);
  //aliens0=new Enemigo (5,800,300,1,10200);
  for(int i=0;i<30;i++){
    stars[i]=new Estrellas(random(0,width),random(0,height),3);
    
}
  
  
}

void draw(){
  if(stage==0){
    background(0);
    textFont(fuente);
    stroke(230,240,30);
    line(220,100,780,100);
    line(220,230,780,230);
    line(220,100,220,230);
    line(780,100,780,230);
    text("Z.U.R.G.E",width/2,200);
    textSize(30);
    text("Jugar",width/2,350);
    text("¿Cómo se juega?",width/2,420);
    text("Créditos",width/2,490);
    stars[0].menu();
  }

  if(stage==1){
    clear();
    background(0);
    text(count,500,200);
     /*if(v<-500 ||   v>width+200){  //luna
      w=random(width,width+100);
      v=random(width,width+100);
      h=random(0,height);
      j=random(0,height);
    }
    else{
      image(luna1,w-=3,h);
      image(luna2,v-=3,j);
      }*/
    for(int i=0;i<30;i++){  //estrellas
    stars[i].fondo();
    }
    float elapsedTime = (float) sw.getElapsedTime();
   S4P.updateSprites(elapsedTime);
   S4P.drawSprites();
   
    /*bazooka.setXY(300,300);
    bazooka.setFrameSequence(0,4,0.09,1);
    fusil.setXY(500,400);
    fusil.setFrameSequence(0,3,0.09,1);
    for(int j=0;j<laser.length;j++){
    aliens[j].enemigos();
    aliens[j].movi();
    aliens[j].counter();
    
    }*/
   
    aliens1.enemigo();
   // aliens0.enemigo();
    aliens1.movi();
    //aliens0.movi();
    
    ZURGE.movi();
    ZURGE.zurge();
    guss.enemigo();
    caja.fondo();
    caja.movi();
    guss.movi();
    //guss.enemigos();
   // guss.gus();
    BIL.movi();
    BIL.enemigo();
    println(guss.f);
    //BIL.bil();
  
}

if(stage==2){
  clear();
  background(0);
  textSize(12);
  text("Debes manejar a Z.U.R.G.E",200,200);
  text("Presiona cualquier tecla para volver a la pantalla de inicio",width/2,height-80);
  if(keyPressed){
    stage=0;
  }
}

if(stage==3){
  clear();
  background(0);
  textSize(12);
  text("Musica extraida de:",300,200);
  text("Presiona cualquier tecla para volver a la pantalla de inicio",width/2,height-80);
    if(keyPressed){
    stage=0;
  }
}

}
