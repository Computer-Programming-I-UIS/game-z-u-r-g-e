
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
    xzurge=constrain(xzurge,50,width-50);
    yzurge=constrain(yzurge,50,height-50);
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
  
  void zurge(){
   

   zurge.setXY(xzurge,yzurge);
   if(keyPressed&&(keyCode==LEFT||key=='a')&&mousePressed==false){
     zurge.setFrameSequence(4,4,0.09,1);
   }else if(keyPressed&&(keyCode==LEFT||key=='a')&&mousePressed){
     zurge.setFrameSequence(5,7,0.09,1);
   }else if(mousePressed){
     zurge.setFrameSequence(1,3,0.09,1);
   }else if(mouseX<xzurge){
     zurge.setFrameSequence(4,4,0.09,1);
   }else{
     zurge.setFrameSequence(0,0,0.09,1);
   }
   
   if(keyPressed&&key=='e'){  //Coge el fusil
     zurge.setFrameSequence(8,8,0.9,1);
     zurge.setFrameSequence(11,11,2,1);
     
   }else if(keyPressed&&key=='r'){   //Coge la bazooka
     zurge.setFrameSequence(12,12,0.9,1);
     zurge.setFrameSequence(14,14,2,1);
     
   }
     
}

}
