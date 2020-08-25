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
    
    if(mouseX>400&&mouseX<595&&mouseY>315&&mouseY<355){   //Región de "JUGAR"
      
      stroke(230,240,30);
      line(400,315,595,315);
      line(400,355,595,355);
      line(400,315,400,355);
      line(595,315,595,355);
     if(mousePressed){
        stage=1;
      }
    } 
    if(mouseX>220&&mouseX<780&&mouseY>385&&mouseY<425){   //Región de "COMO JUGAR"
      stroke(230,240,30);
      line(220,385,780,385);
      line(220,425,780,425);
      line(220,385,220,425);
      line(780,385,780,425);
      if(mousePressed){
        stage=2;
      }
    }
    
    if(mouseX>360&&mouseX<640&&mouseY>455&&mouseY<495){   //Región de "COMO JUGAR"
      stroke(230,240,30);
      line(360,455,640,455);
      line(360,495,640,495);
      line(360,455,360,495);
      line(640,455,640,495);
      if(mousePressed){
        stage=3;
      }
    }
    
    else{
    }
  }
  
}
  
