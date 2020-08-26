/* Z.U.R.G.E -Proyecto de programación. Andrés Fernando Jerez Medina - Miguel Aim Garcia Villamizar
Z.U.R.G.E es un juego de rol en el que tendrás que controlar al robot Z.U.R.G.E, y ayudarlo a recolectar una serie de materiales necesarios para su salvación, debido 
a que su sistema se encuentra fallando. En la misión Z.U.R.G.E se encontrará con diferentes enemigos que intentarán atacarlo.  Evita el contacto con los enemgios, e intenta 
derrotarlos con tus armas. Puedes recolectar cajas de energía y munición, las de munición te abastecerán de balas para tanto fusil como bazooka, y las de energía aumentan una 
barra que se muestra en pantalla. Si esta barra se llena. podrás usar una embestida presionando la q y el click al mismo tiempo, esta embestida se detiene al chocar con un enemigo 
o un borde de la pantalla. Ten cuidado con los poderes que usan GUS y BIL, los jefes a los que te enfrentarás. ¡Mantente con vida, y recolecta 3 materiales! */


import ddf.minim.*;    //Importamos libreria minim para el audio
import sprites.*;
import sprites.maths.*;
import sprites.utils.*;   //Libreria para los sprites

Minim minim; 
AudioPlayer menu;
AudioPlayer shot;
AudioPlayer orbe;
AudioPlayer win;
AudioPlayer loose;
AudioPlayer alert;
AudioPlayer boss;     //Objetos de audios
Sprite laser;
Sprite caras;
Sprite cajas[]=new Sprite[5];
Sprite zurge;
Sprite enemigos[]=new Sprite[3];
Sprite laserbala;
Sprite balabazooka;
Sprite balafusil;       //Sprites usados
StopWatch sw = new StopWatch();      //Reloj que usan los sprites

float v=width,w=width*4/5,h=height*3/8,j=height/2;
int stage;
PFont fuente;
PImage star;
PImage luna1;
PImage luna2;
PImage material;
Estrellas stars[]=new Estrellas[30];      //Array del fondo de estrellas
Zurge ZURGE;   
Enemigo guss;
Enemigo BIL;
Enemigo aliens;
cajas caja;
int count=0;     //Contador de kills
int l=0,k=0;  //tiempo de la historia


void setup(){
  size(1000,600);
  background(0);
  minim=new Minim(this);
  menu=minim.loadFile("menu.mp3");
  shot=minim.loadFile("shot.mp3");
  orbe=minim.loadFile("orbe.mp3");
  win=minim.loadFile("win.mp3");
  loose=minim.loadFile("loose.mp3");
  alert=minim.loadFile("alert.mp3");
  boss=minim.loadFile("boss.mp3");        //Declaración de los audios
  fuente=createFont("fuente.otf",70);     //Fuente
  star=loadImage("estrella.png");      //Imagen de unica estrella
  caras=new Sprite(this,"caraszurge.png",1,2,2);
  caras.setDead(true);
  //caras.setXY(400,500);
  //luna1=loadImage("luna1.png");
  //luna2=loadImage("luna2.png"); 
  balabazooka=new Sprite(this,"balabazooka.png",1,2,2);
  balafusil=new Sprite(this,"balafusil.png",1,1,2);
  //laser=new Sprite(this,"laser.png",2,2,2);
  zurge=new Sprite(this,"zurge.png",5,5,2);           //Declaracion de los sprites
  //laserbala=new Sprite(this,"laserbala.png",2,3,2);
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  stage=-2;
  ZURGE=new Zurge (8,10,50,50,height/2);
  guss=new Enemigo (8,random(width-60,width),random(0,height),2,120,5);
  BIL=new Enemigo (8,random(width-60,width),random(0,height),3,120,5);
  aliens=new Enemigo (12,random(width-60,width),random(0,height),1,100,2);
  caja=new cajas (10,random(width-120,width),random(0,height));
  for(int i=0;i<30;i++){
    stars[i]=new Estrellas(random(0,width),random(0,height),3);    //Estrellas
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
  println(l);
  if(l<360&&stage==-2){      //Narración de la historia
    background(0);
    textSize(20);
    text("Z.U.R.G.E se ecuentra en peligro, su sistema está fallando y debe recolectar",width/2,200);
    text("un material que puede salvarlo. Lo aterrador es que Z.U.R.G.E debe recorrer mundos muy",width/2,250);
    text("macabros para obtenerlo, donde hay todo tipo de seres que no tienen ninguna intención de",width/2,300);
    text(" permitir que Z.U.R.G.E consiga su objetivo. ¡Ayuda a Z.U.R.G.E a llegar a su salvación!",width/2,350);
    text("¡Consigue recolectar 3 materiales!",width/2,400);
    stroke(230,240,30);
    line(50,100,950,100);
    line(50,100,50,450);
    line(50,450,950,450);
    line(950,100,950,450);
 
    l++;
  }
  if(l==360){
    stage=0;
    l=361;
  }
  if(stage==-1){   //Pantalla de perdiste
    menu.pause();
    boss.pause();
    background(0);
    loose.play();
    caras.setXY(width/2,height/2);
    caras.setFrameSequence(0,0,1,1);
    textSize(50);
    text("PERDISTE",width/2,height/2);
    ZURGE.heal=width/3-80;
    caja.nmat=0;
    l++;
    if(l>600){
      l=260;
    }
  }
  
  if(stage==0){      //Menú
    k=0;
    for(int i=0;i<3;i++){
      enemigos[i].setDead(true);
    }
    caja.c=10;
    zurge.setDead(false);
    l++;
    count=0;
    background(0);
    if(l%270==0){    //Cancion del menu
      menu.loop();
    }
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
      stars[i].fondo();     //Metodo del fondo
    }
    
    for(int a=0;a<50;a++){   //Margenes amarillas
      stroke(230,240,30);
      strokeWeight(3);
      line(20*a-1,5,20*a+8,5);
      line(5,20*a-1,5,20*a+8);
      line(20*a-1,height-5,20*a+8,height-5);
      line(width-5,20*a-1,width-5,20*a+8);
    }
  }
  
  if(stage==1){         //Fase del primer nivel
    menu.setPan(0.8);    //Bajada de volumen
    l=520;
    clear();
    println(guss.tm);
    background(0);
    textSize(15);
    text("Kills:",width-90,30);
    text(count,width-30,30);
    textSize(15);
    text("Material:",90,30);
    text(caja.nmat,180,30);
    //if(caja.nmat==3){
     // stage=5;
    //if(caja.nmat>=3){
     // stage=4;
   // }
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

    ZURGE.movi();
    ZURGE.zurge();
    ZURGE.heridas();
    aliens.enemigo();
    aliens.movi();
    guss.enemigo();
    caja.fondo();
    caja.movi();
    guss.movi();
    //guss.enemigos();
   // guss.gus();
    BIL.movi();
    BIL.enemigo();        //Aplicacion de los metodos 
    //BIL.bil();   
}

  if(stage==2){     //Fase de como jugar
    clear();
    background(0);
    for(int a=0;a<50;a++){    //Margenes
      stroke(230,240,30);
      line(20*a-1,5,20*a+8,5);
      line(5,20*a-1,5,20*a+8);
      line(20*a-1,height-5,20*a+8,height-5);
      line(width-5,20*a-1,width-5,20*a+8);
    }
    for(int i=0;i<30;i++){
      stars[i].fondo();       //Fondo de estrellas
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
    rect(575,295,30,30);
    rect(625,345,30,30);
     //q
    rect(270,220,30,30);
    
    fill(0);
    text("w",195,105);
    text("a",165,135);
    text("s",195,135);
    text("d",225,135);
     //wasd
    text("e",570,300);
    text("r",620,350);
    text("q",265,225);
    //flechas
     stroke(0);
    line(400,95,400,110);
    line(360,130,380,130);
    line(400,120,400,135);
    line(420,130,440,130);
    line(360,130,370,125);
    line(360,130,370,135); //izquierda
    line(390,100,400,95);
    line(400,95,410,100); //arriba
    line(390,130,400,135);
    line(400,135,410,130); //abajo
    line(430,125,440,130);
    line(430,135,440,130); //derecha
    noStroke();
    
    fill(255);
    text("Recolecta energía. Cuando llenes la barra, podrás usar una embestida mientras tienes un",50,180);
    text("escudo y serás inmune a los enemigos en ese momento. ¡Solo se activa al llenar la barra!",50,200);
    text("Presiona la tecla                      y da click para usarla, te vas a dirigir hacia el cursor",50,230);
    text("si tocas a un enemigo no sufrirás daño. Se desactiva al tocar enemigos o bordes de la pantalla",50,265); 
    text("Puedes disparar un fusil presionando la tecla                    y haciendo click",50,300);
    text("o puedes disparar una bazooka presionando la tecla                 y haciendo click",50,350);
    text("Puedes dar golpes presionando click en la dirección que quieras, pero cuidado, si tocas",50,400);
    text("a los enemigos tu vida va a disminuir. ¡Mejor usa tus armas!",50,420);
    text("Puedes recolectar cajas de energía y munición, y materiales, solo con tocarlos",50,470);
    fill(#F6FF05);
    text("¡Recolecta materiales para ganar! Cada 3 kills recuperas un poco de vida",50,490);
    text("¡Ten cuidado con los ataques de GUS y BIL, que pueden matarte si te impactan!",50,540);       //Mensajes con las instrucciones
    fill(255);
  
    textSize(5);
    text("Presiona cualquier tecla para volver a la pantalla de inicio",350,height-20);
    if(keyPressed){
      stage=0;      //Volver al menu
    }
  }

  if(stage==3){      //Fase de creditos
    clear();
    background(0);
    for(int a=0;a<50;a++){    //Margenes
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
    text("Musica extraida de",370,100);
    textSize(10);
    text("Menú: Metal intro- Propiedad de Leonard B. Blaesing",50,150);
    text("Sonido de disparos: Game Style-Shot - Sin derechos de autor",50,200);
    text("Sonido del orbe de Bil: Game FX sounds- Propiedad de Daniel Lukaz",50,250);
    text("Sonido de ganar: Level Complete- Propiedad de jivatma07",50,300);
    text("Sonido de perder: Powering Down- Sin derechos de autor",50,350);
    text("Sonido de alerta: ¡Alert Alert Alert!- Propiedad de ProjectsU012",50,400);
    text("Música contra los jefes: Boss Battle Loop #3- Propiedad de Sirkoto51",50,450);
    text("Fuente de texto: Merchsuit- Propiedad de Serxphis en la web Dafont.com",50,500);
    textSize(5);
    text("Presiona cualquier tecla para volver a la pantalla de inicio",350,height-50);      //Mensajes de derechos de autor
    if(keyPressed){
      stage=0;    //Volver al menu
    }
  }
  
  if(stage==4){   //Fase de ganar
    clear();
    boss.pause();
    menu.pause();
    orbe.pause();    //Detener los audios anteriores
    background(0);
    //caras.setDead(false);
    caras.setXY(width/2,height/2);
    caras.setFrameSequence(1,1,1,1);
    win.play();   //Audio de ganar
    textFont(fuente);
    text("GANASTE",width/2,150);
    textSize(40);
    text("Has salvado a Z.U.R.G.E",width/2,250);
    
  }
  if(stage==5){        //Fase del nivel 2
    k++;
    if(k<600){
      for(int i=0;i<3;i++){
        enemigos[i].setDead(true);
      }
      background(0);
      textFont(fuente);
      text("NIVEL 2",width/2,150);
      textSize(20);
      text("Ahora tendrás que lidiar con los aliens",width/2,320);
      text("y con más individuos como GUS",width/2,370);
      text("¡Cuidado con Bil y su orbe!",width/2,450);
      stroke(230,240,30);
      line(200,50,790,50);
      line(200,170,790,170);
      line(200,50,200,170);
      line(790,50,790,170);       //Pantalla estatica de nivel 2
    }
    if(k>=600){   //Despues de esta pantalla, nivel 2
      k++;
      clear();
      l++;
      if(l%270==0){ 
        menu.loop();
      }
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
     
      ZURGE.movi();
      ZURGE.zurge();
      ZURGE.heridas();
      caja.fondo();
      caja.movi();
      if(k>=800){
        aliens.enemigo2lvl();
        aliens.movi();
        guss.enemigo2lvl();
        guss.movi();
        BIL.movi();
        BIL.enemigo2lvl();
     }
    }
  }

}
