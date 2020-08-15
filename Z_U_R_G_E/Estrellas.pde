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
  
  void move(){
    image(zurge,xzurge,yzurge);
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
  }
  
  void menu(){
    
    if(mouseX>350&&mouseX<650&&mouseY>300&&mouseY<340){
      if(mousePressed){
        background(0);
      }
    }
  }
  
}
  
