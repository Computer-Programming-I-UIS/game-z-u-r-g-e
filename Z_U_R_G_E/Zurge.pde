
class Zurge {
  float a,b=0,c=1;
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
    xzurge=constrain(xzurge,100,width-50);
    yzurge=constrain(yzurge,50,height-50);
    if(keyPressed){
      switch(key){
        case 'w':
        yzurge-=vel;
        b=1;
        break;
        case 's':
        yzurge+=vel;
        b=1;
        break;
        case 'a':
        xzurge-=vel;
        c=-1;
        b=1;
        break;
        case 'd':
        xzurge+=vel;
        c=1;
        b=1;
        break;
        default:
        switch(keyCode){
          case UP:
          yzurge-=vel;
          b=1;
          break;
          case DOWN:
          yzurge+=vel;
          b=1;
          break;
          case LEFT:
          xzurge-=vel;
          c=-1;
          b=1;
          break;
          case RIGHT:
          xzurge+=vel;
          c=1;
          b=1;
          break;
          default:
          b=0;
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
       velbala=20;
       zurge.setXY(xzurge,yzurge);
     if(mousePressed&&mouseX>xzurge){
       zurge.setFrameSequence(18,18,2,1);
      // zurge.setFrameSequence(14,14,2,1);
       zurge.setXY(xzurge+=velbala,yzurge);
       zurge.setFrameSequence(20,20,2,1);
       if(xzurge>=950){
       caja.limb=0;  
       }
     }else if(mousePressed&&mouseX<xzurge){
       zurge.setFrameSequence(18,18,2,1);
      // zurge.setFrameSequence(14,14,2,1);
       zurge.setXY(xzurge-=velbala,yzurge);
       zurge.setFrameSequence(21,21,2,1);
       if(xzurge<=200){
         caja.limb=0;  
         }
     }
     }
   }
   
   //disparo con fusil
   if(keyPressed&& key=='e' ){  //Coge el fusil
       balafusil.setXY(xbala+60,yzurge-5);
     if(mousePressed&&b==0&&caja.c>0){
      // zurge.setFrameSequence(13,13,2,1);
       balafusil.setDead(false);
      // zurge.setFrameSequence(14,14,2,1);
       balafusil.setFrameSequence(0,0,2,1);
       //zurge.setFrameSequence(17,17,2,1);
       velbala+=3;
       velbala=constrain(velbala,0,(width-xzurge-50)/10);
       if(mouseX>xzurge){
         zurge.setFrameSequence(13,13,2,1);
         xbala+=velbala;
       }else{
         zurge.setFrameSequence(15,15,2,1);
         balafusil.setXY(xbala-60,yzurge-5);
         xbala-=velbala;
       }
      
     }
     else {
       xbala=xzurge;
       balafusil.setDead(true);
     }
     if(mouseX>xzurge){
       zurge.setFrameSequence(8,8,0.9,1);
     }else{
       zurge.setFrameSequence(9,9,0.9,1);
     }
        /*if(xbala<=0 || xbala>=width){
         xbala=constrain(xbala,0,width);
         caja.c--;
         xbala=xzurge;
         balabazooka.setDead(true);
         balafusil.setDead(true);
       }*/
  //disparo con bazooka

   }else if(keyPressed&&key=='r'){   //Coge la bazooka
       balabazooka.setXY(xbala+75,yzurge-20);
       //zurge.setFrameSequence(10,10,0.9,1);
     if(mousePressed&&b==0&&caja.c>0){
       balabazooka.setDead(false);
       //zurge.setFrameSequence(15,15,2,1);
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
     }
     else {
     xbala=xzurge;
     balabazooka.setDead(true);
     balafusil.setDead(true);
   }
   if(mouseX>xzurge){
       zurge.setFrameSequence(10,10,0.9,1);
     }else{
       zurge.setFrameSequence(11,11,0.9,1);
   }
   }
   else{
         balabazooka.setDead(true);
         balafusil.setDead(true);
   }
   if(xbala<=0 || xbala>=width){
         xbala=constrain(xbala,0,width);
         caja.c--;
         xbala=xzurge;
         balabazooka.setDead(true);
         balafusil.setDead(true);
       }
   
   
   
     
     //  daños que recibe zurge
     if (!zurge.isDead()&& zurge.pp_collision(enemigos[0])) {  //  daño por chocar con alien a zurge
       enemigos[0].setDead(true);
       aliens.g=0;
       aliens.xenemigo=random(width,width-64);
       aliens.yenemigo=random(0,height);
         if(key=='q'){
         }
         else{
          heal-=40;
         }
      }
      if (!zurge.isDead()&& zurge.pp_collision(enemigos[1])) {  //  daño por chocar con gus a zurge
       heal-=80;
       enemigos[1].setDead(true);
       guss.g=0;
       guss.xenemigo=random(width,width-64);
       guss.yenemigo=random(0,height);
       cajas[3].setDead(true);
         if(key=='q'){
         }
         else{
          heal-=40;
         }
      }
      if (!zurge.isDead()&& zurge.pp_collision(enemigos[2])) {  //  daño por chocar con bil a zurge
       heal-=120;
       enemigos[2].setDead(true);
       BIL.g=0;
       BIL.xenemigo=random(width,width-64);
       BIL.yenemigo=random(0,height);
       cajas[2].setDead(true);
         if(key=='q'){
         }
         else{
          heal-=40;
         }
      }
      if (!zurge.isDead()&& zurge.pp_collision(cajas[2])) {  //  daño por chocar con hacha de gus a zurge
       cajas[2].setXY(width,height);
       cajas[2].setDead(true);
       BIL.t=0;
         if(key=='q'){
         }
         else{
          heal-=60;
         }
      }
      if (!zurge.isDead()&& zurge.pp_collision(cajas[3])) {  //  daño por chocar con orbe de bil a zurge
       cajas[3].setXY(width,height);
       cajas[3].setDead(true);
       cajas[3].setXY(width,height);
       guss.t=0;
         if(key=='q'){
         }
         else{
          heal-=100;
         }
      }  
      if (!zurge.isDead()&& guss.xproyec<0){  //  el hacha no golpeo
        guss.t=0;
        cajas[3].setDead(true);
      }
      if (!zurge.isDead()&& BIL.xproyec<0){  //  el orbe no golpeo
        BIL.t=0;
        cajas[2].setDead(true);
        cajas[2].setXY(width,height);    
      }
      else if(heal<10){
        stage=-1;
        zurge.setDead(true);
        textSize(15);
      }
  }
      
     
  

}
