class cajas {
  float a=1,b;
  float xcaja;
  float ycaja;
  float vel1,vel2;
  float lima=0;
  float limb=0;
  
  cajas(float speed,float tempxcaja, float tempycaja){
    vel1=speed;
    xcaja=tempxcaja;
    ycaja=tempycaja;
  }
  
  void movi(){
    
    if(ycaja<-4 ||  ycaja>height+10){  //limites superior e inferior de cajas
      vel2*=-1;
      ycaja+=vel2;
    }
    else if (xcaja<-50){  //no recolecta cajas
      a=int(random(1,3));
      b=0;
    }
    else if (!muni.isDead() && muni.pp_collision(zurge)){  //recolecta de las cajas
      a=int(random(1,3));
      b=0;
      lima+=50;
      muni.setDead(true);
    }
    else if (!energia.isDead() && energia.pp_collision(zurge)){  //recolecta de las cajas
      a=int(random(1,3));
      b=0;
      limb+=50;
      energia.setDead(true);  
    }
    else{  //movimiento
      xcaja-=vel1;
      ycaja+=vel2;
    }
    
  }
  
  void fondo(){
    lima=constrain(lima,0,width/3-80);
    limb=constrain(limb,0,width/3-80);
    rect(50+width/3,97*height/100,caja.limb,height/100);  //  indicador de power
    rect(50+2*width/3,97*height/100,caja.lima,height/100);  //  indicador de muni
    fill(155, 17, 30);
    text("ammunition",5*width/6,height-20);
    text("heal",width/6,height-20);
    text("power",3*width/6,height-20);
    fill(255);
    
    if(a==1  &&  b>50){
      muni.setDead(false);
      muni.setXY(xcaja,ycaja);
      muni.setFrameSequence(0,0,1,1);
    }
    else if(a==2  &&  b>50){
      energia.setDead(false);
      energia.setXY(xcaja,ycaja);
      energia.setFrameSequence(0,0,1,1);
    }
    else{
      b++;
      ycaja=random(0,height);
      xcaja=width;
      vel2=random(-3,3);
    }
     if(limb>=250&&keyPressed&&key=='q'&&mousePressed){
     limb=0;
   }
   
}
}
