class cajas {
  float a=1,b; int c=5;  //  c=contador de balas    b=tiempo de reaparicion de las cajas
  float xcaja;
  float ycaja;
  float vel1,vel2;
  float lima=12.75;
  float limb=0;
  int nmat;  //Contador de material
  
  cajas(float speed,float tempxcaja, float tempycaja){
    vel1=speed;
    xcaja=tempxcaja;
    ycaja=tempycaja;
  }
  
  void movi(){
    
    if(ycaja<-4 ||  ycaja>height+10){  //limites superior e inferior de cajas
      vel2*=-2;
      ycaja+=2*vel2;
    }
    else if (xcaja<-50){  //no recolecta cajas
      a=round(random(1,3));
      b=0;
    }
    else if (!cajas[0].isDead() && cajas[0].pp_collision(zurge)&&(a==1)){  //recolecta de las cajas de energia
      a=3;
      b=0;
      limb+=51;
      cajas[0].setDead(true);
    }
    else if (!cajas[1].isDead() && cajas[1].pp_collision(zurge)&&(a==2)){  //recolecta de las cajas de municion
      a=1;
      b=0;
      cajas[1].setDead(true);
      c+=4;
    }else if (!cajas[4].isDead() && cajas[4].pp_collision(zurge)&&(a==3)){  //recolecta del mineral
      a=2;
      b=0;
      cajas[4].setDead(true);  
      nmat++;
    }
    else{  //movimiento
      xcaja-=3*vel1;
      ycaja+=2*vel2;
    }
    
    
  }
  
  void fondo(){
    c=constrain(c,0,20);
    limb=constrain(limb,0,63.75);
    rect(50+width/3,97*height/100,limb,height/100);  //  indicador de power
    rect(50+2*width/3,97*height/100,lima*(c),height/100);  //  indicador de muni
    fill(155, 17, 30);
    text("Municion",5*width/6,height-20);
    text(c,5*width/6+80,height-20);
    text("Vida",width/6,height-20);
    text("Energia",3*width/6,height-20);
    fill(255);
    
    if(a==1  &&  b>60){
      cajas[0].setDead(false);
      cajas[0].setXY(xcaja,ycaja);
      cajas[0].setFrameSequence(0,0,1,1);
    }
    else if(a==2  &&  b>60){
      cajas[1].setDead(false);
      cajas[1].setXY(xcaja,ycaja);
      cajas[1].setFrameSequence(1,1,1,1);
    }else if(a==3  &&  b>60){
      cajas[4].setDead(false);
      cajas[4].setXY(xcaja,ycaja);
      cajas[4].setFrameSequence(4,4,1,1);
    }
    else{
      b++;
      ycaja=random(0,height);
      xcaja=width;
      vel2=random(-3,3);
    }
     //if(limb>=250&&keyPressed&&key=='q'&&mousePressed){
     //limb=0;
   //}
   
}
}
