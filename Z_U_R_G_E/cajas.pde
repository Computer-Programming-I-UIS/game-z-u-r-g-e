class cajas {
  float a=1,b;
  float xcaja;
  float ycaja;
  float vel1,vel2;
  
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
      a=0;
      b=0;
    }
    else if (xcaja<ZURGE.xzurge+100 && xcaja>ZURGE.xzurge && ycaja>ZURGE.yzurge+50 && ycaja<ZURGE.yzurge+150){  //recolecta de las cajas
      a=0;
      b=0;
    }
    else{  //movimiento
      xcaja-=vel1;
      ycaja+=vel2;
    }
  }
  
  void fondo(){
    if(a==3  &&  b>500){
      image(muni,xcaja,ycaja);
    }
    else if(a==1  &&  b>500){
      image(muni,xcaja,ycaja);
    }
    else if(a==2  &&  b>500){
      image(energia,xcaja,ycaja);
    }
    else{
      b++;
      a=int(random(1,3));
      ycaja=random(0,height);
      xcaja=width;
      vel2=random(-3,3);
    }
}
}
