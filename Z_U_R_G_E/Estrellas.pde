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
    
    if(mouseX>350&&mouseX<650&&mouseY>300&&mouseY<340){
      if(mousePressed){
        stage=2;
      }
    }
  }
  
}
  
