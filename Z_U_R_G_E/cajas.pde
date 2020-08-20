class cajas {
  float a=1,b;
  float xcaja;
  float ycaja;
  float vel1,vel2;
  float lima=0;
  float limb=0;
  float limc=0;
  
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
    else if (muni.pp_collision(zurge)){  //recolecta de las cajas
      a=int(random(1,3));
      b=0;
      limc+=1;
      muni.setDead(true);
    }
    else if (energia.pp_collision(zurge)){  //recolecta de las cajas
      a=int(random(1,3));
      b=0;
      limb+=1;
      energia.setDead(true);
    }
    else{  //movimiento
      xcaja-=vel1;
      ycaja+=vel2;
    }
  }
  
  void fondo(){
    lima=constrain(lima,0,width/3-50);
    limb=constrain(limb,0,width/3-50);
    limc=constrain(limc,0,width/3-50);
    text("heal",width/100,height/100);
    rect(50+width/100,97*height/100,lima,height/100);
    text("power",width/3,height/100);
    rect(50+width/3,97*height/100,limb,height/100);
    text("ammunition",2*width/3,height/100);
    rect(50+2*width/3,97*height/100,limc,height/100);
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
}
}
