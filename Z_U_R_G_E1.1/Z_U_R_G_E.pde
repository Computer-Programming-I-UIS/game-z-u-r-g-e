

int stage;
PFont fuente;
PImage star;
PImage zurgeimg;
PImage luna1;
PImage luna2;
Estrellas stars[]=new Estrellas[30];
Zurge zurge;
int cont;

void setup(){
  size(1000,600);
  background(0);
  fuente=createFont("fuente.otf",70);
  star=loadImage("estrella.png");
  zurgeimg=loadImage("zurge.png");
  luna1=loadImage("luna1.png");
  luna2=loadImage("luna2.png");
  
  zurge=new Zurge(3,20,300);
  //estrellas=new Estrellas(100,200,1);
  imageMode(CENTER);
  textAlign(CENTER);
  stage=0;
  for(int i=0;i<30;i++){
    stars[cont]=new Estrellas(random(0,width)+i,random(0,height)+i,3);
    cont++;
    cont=constrain(cont,0,29);
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
    if(keyPressed){
      stage=1;
    }
  }
  
  if(stage==1){
    background(0);
    image(luna1,800,100);
    image(luna2,800,300);
    
    for(int i=0;i<30;i++){
    stars[i].fondo();
    }

    zurge.movi();
   

   // image(star,100,200);
}
}

  
