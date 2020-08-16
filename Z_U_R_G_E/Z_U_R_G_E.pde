int stage;
PFont fuente;
PImage star;
PImage zurge;
PImage luna1;
PImage luna2;
PImage alien;
PImage energia;
PImage muni;
PImage laser[]=new PImage[6];
PImage gus[]=new PImage[2];

Estrellas estrellas;
Estrellas stars[]=new Estrellas[30];
Zurge ZURGE;
int cont;

void setup(){
  size(1000,600);
  background(0);
  fuente=createFont("fuente.otf",70);
  star=loadImage("estrella.png");
  zurge=loadImage("zurge.png");
  luna1=loadImage("luna1.png");
  luna2=loadImage("luna2.png");
  alien=loadImage("Alien.png");
  energia=loadImage("energia.png");
  muni=loadImage("muni.png");
  
  estrellas=new Estrellas(100,200,3);
  imageMode(CENTER);
  textAlign(CENTER);
  stage=0;
  ZURGE=new Zurge (5,50,height/2);
  
  for(int i=0;i<30;i++){
    stars[cont]=new Estrellas(random(0,width),random(0,height),3);
    cont++;
}
  for(int j=0;j<laser.length;j++){
  laser[j]=loadImage("laser"+j+".png");   
  }
  for(int k=0;k<gus.length;k++){
   gus[k]=loadImage("gus"+k+".png");
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
    image(luna1,800,100);
    image(luna2,800,300);
    image(alien,600,300);
    for(int i=0;i<30;i++){
    stars[i].fondo();
    }

      
      if(mousePressed){
        image(laser[5],200,200);
        image(gus[1],300,300);
    }else{
      image(laser[1],200,200);
      image(gus[0],300,300);
    }

   
    
    
    ZURGE.movi();
    ZURGE.fondo();
   


   // image(star,100,200);
}

if(stage==2){
  background(0);
}
}


  
