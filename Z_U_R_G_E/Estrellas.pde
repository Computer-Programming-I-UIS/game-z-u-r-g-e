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
    
    if(mouseX>400&&mouseX<595&&mouseY>215&&mouseY<255){   //Región de "JUGAR"
      
      stroke(230,240,30);
      line(400,215,595,215);
      line(400,255,595,255);
      line(400,215,400,255);
      line(595,215,595,255);
     if(mousePressed){
        stage=1;
      }
    } 
    if(mouseX>220&&mouseX<780&&mouseY>285&&mouseY<325){   //Región de "COMO JUGAR"
      stroke(230,240,30);
      line(220,285,780,285);
      line(220,325,780,325);
      line(220,285,220,325);
      line(780,285,780,325);
      if(mousePressed){
        stage=2;
      }
    }
    
    if(mouseX>360&&mouseX<640&&mouseY>355&&mouseY<395){   //Región de "COMO JUGAR"
      stroke(230,240,30);
      line(360,355,640,355);
      line(360,395,640,395);
      line(360,355,360,395);
      line(640,355,640,395);
      if(mousePressed){
        stage=3;
      }
    }
    
    else{
    }
  }
  
}
  
