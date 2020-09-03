class Estrellas {
  
  float xstars;
  float ystars;
  float xzurge;
  float yzurge;
  float vel;
  
  Estrellas(float tempxstars, float tempystars, float speed){
    
    xstars=tempxstars;
    ystars=tempystars;
    vel=speed;
  }
  
  void fondo(){
   image(star,xstars,ystars,50,50);
   
   xstars-=vel;
   if(xstars<=0){
     xstars=width;
   }
   else if(xstars>=width){
     xstars=0;
   } 
  }
    
  
  void menu(){
    
    if(mouseX>400&&mouseX<595&&mouseY>265&&mouseY<305){   //Región de "JUGAR"
      
      stroke(230,240,30);
      line(400,265,595,265);
      line(400,305,595,305);
      line(400,265,400,305);
      line(595,265,595,305);
     if(mousePressed){
        stage=1;
      }
    } 
    if(mouseX>220&&mouseX<780&&mouseY>335&&mouseY<375){   //Región de "COMO JUGAR"
      stroke(230,240,30);
      line(220,335,780,335);
      line(220,375,780,375);
      line(220,335,220,375);
      line(780,335,780,375);
      if(mousePressed){
        stage=2;
      }
    }
    
    if(mouseX>360&&mouseX<640&&mouseY>495&&mouseY<545){   //Región de "CREDITOS"
      stroke(230,240,30);
      line(360,500,640,500);
      line(360,545,640,545);
      line(360,500,360,545);
      line(640,500,640,545);
      if(mousePressed){
        stage=3;
      }
    }
    
    if(mouseX>360&&mouseX<640&&mouseY>410&&mouseY<460){   //Región de "TUTORIAL"
      stroke(230,240,30);
      line(360,410,640,410);
      line(360,460,640,460);
      line(360,410,360,460);
      line(640,410,640,460);
      if(mousePressed){
        stage=4;
      }
    }
    else{
    }
  }
  
}
  
