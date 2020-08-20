
class Zurge {
  float a;
  int xzurge;
  int yzurge;
  float vel;
  float velbala;
  float heal=width/3-80;
  
  Zurge(float speed,float speedbala,int tempxzurge, int tempyzurge){
    velbala=speedbala;
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
   heal=constrain(heal,0,width/3-80);
   rect(50+width/100,97*height/100,heal,height/100);  //  indicador de vida
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
     zurge.setFrameSequence(14,14,2,1);
     if(mousePressed){
       
       zurge.setFrameSequence(14,14,2,1);
       zurge.setXY(xzurge+=velbala,yzurge);
       zurge.setFrameSequence(17,17,2,1);
      
       velbala+=3;
       velbala=constrain(velbala,0,(width-xzurge-50)/10);
     }else{
     }
     
   }else if(keyPressed&&key=='r'){   //Coge la bazooka
     zurge.setFrameSequence(12,12,0.9,1);
     zurge.setFrameSequence(15,15,2,1);
     
     if(mousePressed){
       zurge.setFrameSequence(15,15,2,1);
       zurge.setXY(xzurge+=velbala,yzurge);
       zurge.setFrameSequence(16,16,2,1);
       velbala+=3;
       velbala=constrain(velbala,0,(width-50)/10);
     }else{
     }
     
   }
     if (!zurge.isDead()&& (zurge.pp_collision(alien) || zurge.pp_collision(gus) || zurge.pp_collision(bil))) {  //  daño a zurge
       heal-=10;
      }
      /*else if(heal<20){
        zurge.setDead(true);
      }*/
     
}

}
