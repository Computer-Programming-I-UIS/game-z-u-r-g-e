
class Zurge {
  float a;
  int xzurge;
  int yzurge;
  float vel;
  
  Zurge(float speed,int tempxzurge, int tempyzurge){
    vel=speed;
    xzurge=tempxzurge;
    yzurge=tempyzurge;
  }
  
  void movi(){
    xzurge=constrain(xzurge,100,width-100);
    yzurge=constrain(yzurge,100,height-100);
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
    image(zurge[1],xzurge,yzurge);
    if (a>10){
      mousePressed=false;
      a=0;
    }
  }
  else{
    image(zurge[0],xzurge,yzurge);
    //image(per, x, y);
  }
 
}
}
