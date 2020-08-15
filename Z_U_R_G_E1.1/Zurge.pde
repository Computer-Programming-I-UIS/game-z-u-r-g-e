class Zurge {
  
  float xzurge;
  float yzurge;
  float vel;
  
  Zurge(float speed,float tempxzurge, float tempyzurge){
    vel=speed;
    xzurge=tempxzurge;
    yzurge=tempyzurge;
  }
  
  void movi(){
    
    
    image(zurgeimg,xzurge,yzurge);
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
      }
    }
  }
}
