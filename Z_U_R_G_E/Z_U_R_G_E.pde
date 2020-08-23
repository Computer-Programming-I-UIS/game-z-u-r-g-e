import ddf.minim.*;
import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

Minim minim;
AudioPlayer menu;
AudioPlayer golpe;
Sprite laser;
Sprite caras;
Sprite cajas[]=new Sprite[5];
Sprite zurge;
Sprite enemigos[]=new Sprite[3];
Sprite laserbala;
Sprite balabazooka;
Sprite balafusil;
StopWatch sw = new StopWatch();
boolean mouse;
float v=width,w=width*4/5,h=height*3/8,j=height/2;
int stage;
PFont fuente;
PImage star;
PImage luna1;
PImage luna2;
PImage material;
Estrellas stars[]=new Estrellas[30];
Zurge ZURGE;
Enemigo guss;
Enemigo BIL;
Enemigo aliens;
cajas caja;
int count=0;
int l=0;  //tiempo de la historia


void setup(){
  size(1000,600);
  background(0);
  minim=new Minim(this);
  //menu=minim.loadFile("menu.mp3");
  golpe=minim.loadFile("golpe.mp3");
  fuente=createFont("fuente.otf",70);
  star=loadImage("estrella.png");
  caras=new Sprite(this,"caraszurge.png",1,2,2);
  caras.setDead(true);
  //caras.setXY(400,500);
  //luna1=loadImage("luna1.png");
  //luna2=loadImage("luna2.png"); 
  balabazooka=new Sprite(this,"balabazooka.png",1,2,2);
  balafusil=new Sprite(this,"balafusil.png",1,1,2);
  //laser=new Sprite(this,"laser.png",2,2,2);
  zurge=new Sprite(this,"zurge.png",5,5,2);
  //laserbala=new Sprite(this,"laserbala.png",2,3,2);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  stage=-2;
  ZURGE=new Zurge (8,10,50,50,height/2);
  guss=new Enemigo (8,random(width,width-60),random(0,height),2,120);
  BIL=new Enemigo (8,random(width,width-60),random(0,height),3,120);
  aliens=new Enemigo (12,random(width,width-60),random(0,height),1,100);
  caja=new cajas (5,random(width,width-60),random(0,height));
  for(int i=0;i<30;i++){
    stars[i]=new Estrellas(random(0,width),random(0,height),3);
}
  for(int i=0;i<3;i++){
  enemigos[i]=new Sprite(this,"enemigos.png",4,4,2);    //  i=0  :alien;    i=1  :gus;    i=2  :bil
  enemigos[i].setDead(true);
}
  for(int i=0;i<5;i++){
  cajas[i]=new Sprite(this,"cajas.png",2,3,2);    //  i=0  :energia;    i=1  :municion;    i=2  :orbe de bil;    i=3  :hacha de gus;    i=4   : material
  cajas[i].setDead(true);
}
  
}

void draw(){
  if(l<360){
    textSize(20);
    text("Z.U.R.G.E se ecuentra en peligro, su sistema está fallando y debe recolectar",width/2,200);
    text("un material que puede salvarl. Lo aterrador es que Z.U.R.G.E debe recorrer mundos muy",width/2,250);
    text("macabros para obtenerlo, donde hay todo tipo de seres que no tienen ninguna intención de",width/2,300);
    text(" permitir que Z.U.R.G.E consiga su objetivo. ¡Ayuda a Z.U.R.G.E a llegar a su salvación!",width/2,350);
    
    l++;
  }
  if(l==160){
    stage=0;
    l=240;
  }
  if(stage==-1){
    background(0);
    caras.setXY(width/2,height/2);
    caras.setFrameSequence(0,0,1,1);
    textSize(50);
    text("GAME OVER",width/2,height/2);
  }
  if(stage==0){
    background(0);
    menu.loop();
    textFont(fuente);
    textAlign(CENTER);
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
    for(int i=0;i<30;i++){
    stars[i].fondo();
    }
    
    for(int a=0;a<50;a++){
      stroke(230,240,30);
      strokeWeight(3);
      line(20*a-1,5,20*a+8,5);
      line(5,20*a-1,5,20*a+8);
      line(20*a-1,height-5,20*a+8,height-5);
      line(width-5,20*a-1,width-5,20*a+8);
    }
  }
  if(stage==1){
    clear();
    println(guss.xproyec);
    background(0);
    textSize(15);
    text("Kills",width-90,30);
    text(count,width-30,30);
    textSize(10);
    text("Material:",60,20);
    text(caja.nmat,120,20);
    if(caja.nmat>=3){
      stage=4;
    }
    stroke(230,240,30);
    line(5,5,5,height-5);
    line(5,5,width-5,5);
    line(width-5,height-5,width-5,5);
    line(5,height-5,width-5,height-5);
    rectMode(CORNER);
    textSize(10);
    for(int i=0;i<30;i++){  //estrellas
    stars[i].fondo();
    }
    float elapsedTime = (float) sw.getElapsedTime();
   S4P.updateSprites(elapsedTime);
   S4P.drawSprites();
   
    aliens.enemigo();
    aliens.movi();
    
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
    //BIL.bil();
    
}

if(stage==2){
  clear();
  background(0);
  for(int a=0;a<50;a++){
      stroke(230,240,30);
      line(20*a-1,5,20*a+8,5);
      line(5,20*a-1,5,20*a+8);
      line(20*a-1,height-5,20*a+8,height-5);
      line(width-5,20*a-1,width-5,20*a+8);
    }
  for(int i=0;i<30;i++){
  stars[i].fondo();
  }
  textSize(10);
  textAlign(CORNER);
  text("Debes manejar a Z.U.R.G.E, puedes moverlo usando las flechas o las teclas wasd",50,50);
   //wasd
  rect(200,100,30,30);
  rect(170,130,30,30);
  rect(200,130,30,30);
  rect(230,130,30,30);
  //flechas
  rect(400,100,30,30);
  rect(370,130,30,30);
  rect(400,130,30,30);
  rect(430,130,30,30);
   // teclas e y r
  rect(575,240,30,30);
  rect(625,290,30,30);
  
  fill(0);
  text("w",195,105);
  text("a",165,135);
  text("s",195,135);
  text("d",225,135);
   //wasd
  text("e",570,245);
  text("r",620,295);
   
  
  fill(255);
  text("Puedes disparar un fusil presionando la tecla                    y haciendo click",50,250);
  text("o puedes disparar una bazooka presionando la tecla                 y haciendo click",50,300);
  text("Puedes dar golpes presionando click en la dirección que quieras, pero cuidado, si tocas",50,350);
  text("a los enemigos tu vida va a disminuir. ¡Mejor usa tus armas!",50,370);
  text("Puedes recolectar cajas de energía y munición, y materiales, solo con tocarlos",50,420);
  text("¡Recolecta materiales para ganar!",50,440);
  text("¡Ten cuidado con los ataques de GUS y BIL, que pueden matarte si te impactan!",50,490);

  textSize(5);
  text("Presiona cualquier tecla para volver a la pantalla de inicio",350,height-50);
  if(keyPressed){
    stage=0;
  }
}

if(stage==3){
  clear();
  background(0);
  for(int a=0;a<50;a++){
      stroke(230,240,30);
      line(20*a-1,5,20*a+8,5);
      line(5,20*a-1,5,20*a+8);
      line(20*a-1,height-5,20*a+8,height-5);
      line(width-5,20*a-1,width-5,20*a+8);
    }
  for(int i=0;i<30;i++){
  stars[i].fondo();
  }
  
  textAlign(CORNER);
  textSize(15);
  text("Musica extraida de:",50,50);
  textSize(10);
  text("Menú: Metal intro- Propiedad de Leonard B. Blaesing",50,100);
  text("Sonido de disparos: Heavy Techno Kick- Propiedad de Leonarf B. Blaesing",50,130);
  textSize(5);
  text("Presiona cualquier tecla para volver a la pantalla de inicio",50,height-80);
    if(keyPressed){
    stage=0;
  }
}

if(stage==4){
  clear();
  background(0);
  //caras.setDead(false);
  caras.setXY(width/2,height/2);
  caras.setFrameSequence(1,1,1,1);
  textFont(fuente);
  text("GANASTE",width/2,150);
  textSize(40);
  text("Has salvado a Z.U.R.G.E",width/2,250);
}

}
