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
  }
  
  /*void movi(){
    image(zurgeimg,xzurge,yzurge,100,100);
    if(keyPressed){
      switch(key){
        case 'w':
        yzurge+=vel;
        break;
        case 's':
        yzurge-=vel;
        break;
        case 'a':
        xzurge-=vel;
        break;
        case 'd':
        xzurge+=vel;
        break;
      }
    }
  }*/
  
}
  
