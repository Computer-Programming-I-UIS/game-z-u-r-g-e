
class Zurge {
  float a,b=0;   
  int xzurge;
  int yzurge;
  float vel;
  float velbala;
  float xbala,ybala;
  float heal=width/3-80;
  int p=0;  //1.carga hacia la derecha  -1.carga hacia la izquierda (q)
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
      switch(m){
        case 1:
        yzurge-=vel;
        break;
        case -1:
        yzurge+=vel;
        break;
        case -2:
        xzurge-=vel;
        break;
        case 2:
        xzurge+=vel;
        break;
        default:
      }
    }
  }
  
  void zurge(){
   heal=constrain(heal,0,width/3-80);
   rect(50+width/100,97*height/100,heal,height/100);  //  indicador de vida
   zurge.setXY(xzurge,yzurge);
   if(mouseX>xzurge&&mousePressed&&e==false&&r==false){
     zurge.setFrameSequence(1,3,0.09,1);
   }else if(mouseX<xzurge&&mousePressed&&e==false&&r==false){
     zurge.setFrameSequence(5,7,0.09,1);
   }else if(mouseX>xzurge&&e==false&&r==false){
     zurge.setFrameSequence(0,0,0.09,1);
   }else if(mouseX<xzurge&&e==false&&r==false){
     zurge.setFrameSequence(4,4,0.09,1);
   }
   if(caja.limb>=250){ //250 aprox = a width/3-80
   if((keyPressed&&key=='q')||(p==1||p==-1)){  //Embestida
       velbala=20;
       zurge.setXY(xzurge,yzurge);
     if((mousePressed&&mouseX>xzurge&&p!=-1)||p==1){
       p=1;
       zurge.setFrameSequence(18,18,2,1);
      // zurge.setFrameSequence(14,14,2,1);
       zurge.setXY(xzurge+=velbala,yzurge);
       zurge.setFrameSequence(20,20,2,1);
       if(xzurge>=950){
       caja.limb=0; 
       p=0;
       }
     }else if((mousePressed&&mouseX<xzurge&&p!=1)||p==-1){
       p=-1;
       zurge.setFrameSequence(18,18,2,1);
      // zurge.setFrameSequence(14,14,2,1);
       zurge.setXY(xzurge-=velbala,yzurge);
       zurge.setFrameSequence(21,21,2,1);
       if(xzurge<=200){
         caja.limb=0;  
         p=0;
         }
     }
     }
   }
   
   //posicion de disparo con fusil
   if(keyPressed&&e==true&&r==false&&m!=5){  //Coge el fusil
     if(mouseX>xzurge){
       zurge.setFrameSequence(8,8,0.9,1);
     }else{
       zurge.setFrameSequence(9,9,0.9,1);
     }
        if(xbala<=0 || xbala>=width){
         xbala=constrain(xbala,0,width);
         caja.c--;
         xbala=xzurge;
         balabazooka.setDead(true);
         balafusil.setDead(true);
       }
   }
  //posicion de disparo con bazooka 

   else if(keyPressed&&r==true&&e==false&&m!=5){   //Coge la bazooka
     if(mouseX>xzurge){
       zurge.setFrameSequence(10,10,0.9,1);
     }
     else{
       zurge.setFrameSequence(11,11,0.9,1);
     }
   }
   if(xbala<=0 || xbala>=width){
         xbala=constrain(xbala,0,width);
         caja.c--;
         xbala=xzurge;
         balabazooka.setDead(true);
         balafusil.setDead(true);
         shot.play(-10);
         b=0;
       }
   
  }
  void disparos(){
    
  velbala=constrain(velbala,0,(width-50)/10);
    if((keyPressed&&e==true&&r==false&&mousePressed&&caja.c>0)||!balafusil.isDead()){
       shot.play();
       balafusil.setDead(false);
       balafusil.setFrameSequence(0,0,2,1);
       velbala=30;
         if(mouseX>xzurge&&mousePressed&&b!=-1||b==1){
           balafusil.setXY(xbala+60,ybala-5);
           zurge.setFrameSequence(13,13,2,1);
           xbala+=velbala;
           b=1;
         }
         else if(mouseX<xzurge&&mousePressed&&b!=1||b==-1){
           balafusil.setXY(xbala-60,ybala-5);
           zurge.setFrameSequence(15,15,2,1);
           xbala-=velbala;
           b=-1;
         }
    }
    else if((keyPressed&&r==true&&e==false&&mousePressed&&caja.c>0)||!balabazooka.isDead()){
      shot.play();
      balabazooka.setDead(false);
      velbala=30;
        if(mouseX>xzurge&&mousePressed&&b!=-1||b==1){
          balabazooka.setXY(xbala+75,ybala-20);
          balabazooka.setFrameSequence(0,0,2,1);
          zurge.setFrameSequence(14,14,2,1);
          xbala+=velbala;
          b=1;
        }
          else if(mouseX<xzurge&&mousePressed&&b!=1||b==-1){
          balabazooka.setXY(xbala-75,ybala-20);
          balabazooka.setFrameSequence(1,1,2,1);
          zurge.setFrameSequence(16,16,2,1);
          xbala-=velbala;
          b=-1;
       }
    }
    else{
     xbala=xzurge;
     ybala=yzurge;
     balabazooka.setDead(true);
     balafusil.setDead(true);
     b=0;
    }
  }
  void heridas(){   
     //  daños que recibe zurge
     if (!zurge.isDead() && enemigos[0].oo_collision(zurge,40)&&!enemigos[0].isDead()) {  //  daño por chocar con alien a zurge
       enemigos[0].setDead(true);
       aliens.g=0;
       aliens.xenemigo=random(width-64,width);
       aliens.yenemigo=random(0,height);
         if(p==1||p==-1){
           caja.limb=0;
           p=0;
         }
         else{
          heal-=40;
         }
      }
      if (!zurge.isDead()&& enemigos[1].oo_collision(zurge,40)&&!enemigos[1].isDead()) {  //  daño por chocar con gus a zurge
       enemigos[1].setDead(true);
       guss.g=0;
       guss.vid=0;
       guss.xenemigo=random(width-64,width);
       guss.yenemigo=random(0,height);
       cajas[3].setDead(true);
         if(p==1||p==-1){
           caja.limb=0;
           p=0;
         }
         else{
          heal-=80;
         }
      }
      if (!zurge.isDead()&& enemigos[2].oo_collision(zurge,40)&&!enemigos[2].isDead()) {  //  daño por chocar con bil a zurge
       enemigos[2].setDead(true);
       BIL.g=0;
       BIL.vid=0;
       BIL.xenemigo=random(width-64,width);
       BIL.yenemigo=random(0,height);
       cajas[2].setDead(true);
         if(p==1||p==-1){
           caja.limb=0;
           p=0;
         }
         else if (stage==4){
           stage=0;
         }
         else{
          heal=0;
         }
      }
      if (!zurge.isDead()&& cajas[2].oo_collision(zurge,40)&&!cajas[2].isDead() ) {  //  daño por chocar con orbe de bil a zurge
       cajas[2].setXY(width,height);
       cajas[2].setDead(true);
       BIL.t=0;
         if(p==1||p==-1){
         }
         else{
          heal-=60;
         }
      }
      if (!zurge.isDead()&& cajas[3].oo_collision(zurge,40)&&!cajas[3].isDead()) {  //  daño por chocar con hacha de gus a zurge
       cajas[3].setXY(width,height);
       cajas[3].setDead(true);
       cajas[3].setXY(width,height);
       guss.t=0;
         if(p==1||p==-1){
         }
         else{
          heal-=100;
         }
      }  
      if (!zurge.isDead()&& guss.xproyec<0&&!cajas[3].isDead()){  //  el hacha no golpeo
        guss.t=0;
        cajas[3].setDead(true);
        cajas[3].setXY(width,height);    
      }
      if (!zurge.isDead()&& BIL.xproyec<0&&!cajas[2].isDead()){  //  el orbe no golpeo
        BIL.t=0;
        cajas[2].setDead(true);
        cajas[2].setXY(width,height);    
      }
      else if(heal<1){
        stage=-1;
        zurge.setDead(true);
        textSize(15);
        l=261;
      }
      if(heal<40){
        fill(#FF0015);
        textSize(20);
        text("¡ALERTA: VIDA BAJA!",width/2,50);
        if(l%270==0) //Falta la del nviel 2, que k% en un numero sea ==0
        menu.setGain(-10);
        alert.play();
        fill(255);
      }
  
  }
      
     
  

}
