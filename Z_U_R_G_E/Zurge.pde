class Zurge {
  int a;
  int xzurge;
  int yzurge;
  float vel;
  
  Zurge(float speed,int tempxzurge, int tempyzurge){
    vel=speed;
    xzurge=tempxzurge;
    yzurge=tempyzurge;
  }
  
  void movi(){
    //image(zurgeimg,xzurge,yzurge);
    if(keyPressed){
      switch(key){
        case 'w':
        yzurge-=vel;
        break;
        case 's':
        yzurge+=vel;
        break;
        case 'a':
        xzurge-=vel;
        break;
        case 'd':
        xzurge+=vel;
        break;
        default:
        switch(keyCode){
          case UP:
          yzurge-=vel;
          break;
          case DOWN:
          yzurge+=vel;
          break;
          case LEFT:
          xzurge-=vel;
          break;
          case RIGHT:
          xzurge+=vel;
          break;
        }
      }
    }
  }
  
  void fondo(){
   if(mousePressed){
    copy(zurge,0, 0, 100, 186, xzurge, yzurge, 100, 200);
    if (a>10){
      mousePressed=false;
      a=0;
    }
  }
  else{
    copy(zurge,0, 186, 100, 186, xzurge, yzurge,100, 200);
    //image(per, x, y);
  }
 
}
}
