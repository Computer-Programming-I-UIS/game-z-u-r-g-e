
int stage;
PFont fuente;
PImage star;
PImage zurge;
Estrellas estrellas;
Estrellas stars[]=new Estrellas[20];
Zurge ZURGE;
int cont;

void setup(){
  size(1000,600);
  background(0);
  fuente=createFont("fuente.otf",70);
  star=loadImage("estrella.png");
  zurge=loadImage("zurge.png");
  estrellas=new Estrellas(100,200,1);
  imageMode(CENTER);
  textAlign(CENTER);
  stage=0;
  ZURGE=new Zurge (5,50,height/2);
  for(int i=0;i<20;i++){
    stars[cont]=new Estrellas(random(0,width),random(0,height),3);
    cont++;
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
    stars[0].fondo();
    stars[1].fondo();
    stars[2].fondo();
    stars[3].fondo();
    stars[4].fondo();
    stars[5].fondo();
    stars[6].fondo();
    stars[7].fondo();
    stars[8].fondo();
    stars[9].fondo();
    stars[10].fondo();
    stars[11].fondo();
    stars[12].fondo();
    stars[13].fondo();
    stars[14].fondo();
    stars[15].fondo();
    stars[16].fondo();
    stars[17].fondo();
    stars[18].fondo();
    stars[19].fondo();
    ZURGE.movi();
    ZURGE.fondo();
   

   // image(star,100,200);
}
}

  
