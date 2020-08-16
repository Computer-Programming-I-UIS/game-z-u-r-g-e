float v=width,w=width*4/5,h=height*3/8,j=height/2;
int stage;
PFont fuente;
PImage star;
PImage armas[]=new PImage[4];
PImage zurge[]=new PImage[2];
PImage luna1;
PImage luna2;
PImage alien;
PImage energia;
PImage muni;
PImage material;
PImage laser[]=new PImage[4];
PImage gus[]=new PImage[2];
PImage bil[]=new PImage[3];
Estrellas stars[]=new Estrellas[30];
Zurge ZURGE;
Enemigo aliens[]=new Enemigo[60];
Enemigo guss;
Enemigo BIL;
cajas caja;
int cont;

void setup(){
  size(1000,600);
  background(0);
  fuente=createFont("fuente.otf",70);
  star=loadImage("estrella.png");
  //zurge=loadImage("zurge.png");
  luna1=loadImage("luna1.png");
  luna2=loadImage("luna2.png");
  alien=loadImage("Alien.png");
  energia=loadImage("energia.png");
  muni=loadImage("muni.png");
  material=loadImage("material.png");
  
  imageMode(CENTER);
  textAlign(CENTER);
  stage=0;
  ZURGE=new Zurge (5,50,height/2);
  guss=new Enemigo (5,850,300,2,200);
  BIL=new Enemigo (5,850,300,3,400);
  caja=new cajas (3.5,width,random(0,height));
  for(int i=0;i<30;i++){
    stars[cont]=new Estrellas(random(0,width),random(0,height),3);
    aliens[cont]=new Enemigo (5,800,300,1,1000);
    cont++;
}
  for(int j=0;j<laser.length;j++){
    laser[j]=loadImage("laser"+j+".png");
    armas[j]=loadImage("armas"+j+".png");
  }
  for(int k=0;k<gus.length;k++){
   gus[k]=loadImage("gus"+k+".png");
   zurge[k]=loadImage("zurge"+k+".png");
  }
  for(int l=0;l<bil.length;l++){
   bil[l]=loadImage("bil"+l+".png");
  }
}

void draw(){
  if(stage==0){
    textFont(fuente);
    text("Z.U.R.G.E",width/2,150);
    textSize(30);
    text("Jugar",width/2,250);
    text("¿Cómo se juega?",width/2,320);
    text("Créditos",width/2,390);
    textSize(20);
    text("Presiona cualquier tecla para iniciar el juego",width/2,height-100);
    stars[0].menu();
    if(keyPressed){
      stage=1;
    }
  }

  if(stage==1){
    background(0);
     if(v<-500 ||   v>width+200){  //luna
      w=random(width,width+100);
      v=random(width,width+100);
      h=random(0,height);
      j=random(0,height);
    }
    else{
      image(luna1,w-=3,h);
      image(luna2,v-=3,j);
      }
    for(int i=0;i<30;i++){  //estrellas
    stars[i].fondo();
    aliens[i].fondo();
    aliens[i].movi();
    }
      if(mousePressed){
        image(laser[3],200,200);
        image(armas[3],300,300);
    } 
    
     else{
      image(laser[1],200,200);
      image(armas[1],300,300);
      }
   
    
    ZURGE.movi();
    ZURGE.fondo();
    caja.fondo();
    caja.movi();
    guss.movi();
    guss.fondo();
    BIL.movi();
    BIL.fondo();
  
}

if(stage==2){
  background(0);
}
}
