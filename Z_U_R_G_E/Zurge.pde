
class Zurge {
  float a;
  int xzurge;
  int yzurge;
  float vel;
  float velbala;
  float xbala;
  float heal=width/3-80;
  
  Zurge(float speed,float speedbala, float tempxbala,int tempxzurge, int tempyzurge){
    xbala=tempxbala;
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
   if(mouseX>xzurge&&mousePressed){
     golpe.play();
     zurge.setFrameSequence(1,3,0.09,1);
   }else if(mouseX<xzurge&&mousePressed){
     zurge.setFrameSequence(5,7,0.09,1);
   }else if(mouseX>xzurge){
     zurge.setFrameSequence(0,0,0.09,1);
   }else{
     zurge.setFrameSequence(4,4,0.09,1);
   }
   if(caja.limb>=250){ //250 aprox = a width/3-80
   if(keyPressed&&key=='q'){  //Embestida
       velbala+=3;
       velbala=constrain(velbala,0,(width-xzurge-40)/10);
       zurge.setXY(xzurge,yzurge);
     if(mousePressed&&mouseX>xzurge){
       zurge.setFrameSequence(18,18,2,1);
      // zurge.setFrameSequence(14,14,2,1);
       zurge.setXY(xzurge+=velbala,yzurge);
       zurge.setFrameSequence(20,20,2,1);
       //escudo=true;
       //zurge.setFrameSequence(17,17,2,1);
     }else if(mousePressed&&mouseX<xzurge){
       zurge.setFrameSequence(18,18,2,1);
      // zurge.setFrameSequence(14,14,2,1);
       zurge.setXY(xzurge-=velbala,yzurge);
       zurge.setFrameSequence(21,21,2,1);
       xzurge=constrain(xzurge,150,width-150);
      // escudo=false;
       //zurge.setFrameSequence(17,17,2,1);
     }
   }
   }

   if(keyPressed&&key=='e'){  //Coge el fusil
     if(mousePressed){
      // zurge.setFrameSequence(13,13,2,1);
       balafusil.setDead(false);
      // zurge.setFrameSequence(14,14,2,1);
       balafusil.setXY(xbala+60,yzurge-5);
       balafusil.setFrameSequence(0,0,2,1);
       //zurge.setFrameSequence(17,17,2,1);
       velbala+=3;
       velbala=constrain(velbala,0,(width-xzurge-50)/10);
       if(mouseX>xzurge){
         zurge.setFrameSequence(13,13,2,1);
         xbala+=velbala;
       }
       else{
         zurge.setFrameSequence(15,15,2,1);
         balafusil.setXY(xbala-60,yzurge-5);
         xbala-=velbala;
       }
     }else {
       xbala=xzurge;
       balafusil.setDead(true);
     }
     
     if(mouseX>xzurge){
       zurge.setFrameSequence(8,8,0.9,1);
     }else{
       zurge.setFrameSequence(9,9,0.9,1);
     }

   }else if(keyPressed&&key=='r'){   //Coge la bazooka
       //zurge.setFrameSequence(10,10,0.9,1);
     if(mousePressed){
       balabazooka.setDead(false);
       //zurge.setFrameSequence(15,15,2,1);
       balabazooka.setXY(xbala+75,yzurge-20);
       balabazooka.setFrameSequence(0,0,2,1);
       velbala+=3;
       velbala=constrain(velbala,0,(width-50)/10);
       if(mouseX>xzurge){
         zurge.setFrameSequence(14,14,2,1);
         xbala+=velbala;
       }
       else{
         zurge.setFrameSequence(16,16,2,1);
         balabazooka.setXY(xbala-75,yzurge-20);
         balabazooka.setFrameSequence(1,1,2,1);
         xbala-=velbala;
       }
     }else{
       xbala=xzurge;
       balabazooka.setDead(true);
     }
     
     if(mouseX>xzurge){
       zurge.setFrameSequence(10,10,0.9,1);
     }else{
       zurge.setFrameSequence(11,11,0.9,1);
     }
   }
     
   
     if (!zurge.isDead()&& zurge.pp_collision(enemigos[0])) {  //  daño a zurge
       heal-=10;
      }
      if (!zurge.isDead()&& zurge.pp_collision(enemigos[1])) {  //  daño a zurge
       heal-=10;
      }
      if (!zurge.isDead()&& zurge.pp_collision(enemigos[2])) {  //  daño a zurge
       heal-=10;
      }
      if (!zurge.isDead()&& zurge.pp_collision(cajas[2])) {  //  daño a zurge
       heal-=10;
       cajas[2].setDead(true);
       BIL.xproyec=height;
       BIL.yproyec=width;
       BIL.t=0;
      }
      if (!zurge.isDead()&& zurge.pp_collision(cajas[3])) {  //  daño a zurge
       heal-=10;
       cajas[3].setDead(true);
       guss.xproyec=height;
       guss.yproyec=width;
       guss.t=0;
      }
      if (!zurge.isDead()&& guss.xproyec<xzurge){
        guss.xproyec=height;
        guss.yproyec=width;
        guss.t=0;
        cajas[3].setDead(true);
      }
      if (!zurge.isDead()&& BIL.xproyec<xzurge){
        BIL.xproyec=height;
        BIL.yproyec=width;
        BIL.t=0;
        cajas[2].setDead(true);
      }
  }
      /*else if(heal<20){
        zurge.setDead(true);
      }*/
     
  

}
