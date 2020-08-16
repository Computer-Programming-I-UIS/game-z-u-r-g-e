class cajas {
  float a=1,b,c;
  float xcaja;
  float ycaja;
  float vel1,vel2;
  
  cajas(float speed,float tempxcaja, float tempycaja){
    vel1=speed;
    xcaja=tempxcaja;
    ycaja=tempycaja;
  }
  
  void movi(){
    println(vel2);
    if(ycaja<-4 ||  ycaja>height+10){
      vel2*=-1;
      ycaja+=vel2;
    }
    else if (xcaja<-50){
      a=0;
      b=0;
    }
    else{
      xcaja-=vel1;
      ycaja+=vel2;
    }
  }
  
  void fondo(){
    if(a==3  &&  b>50){
      image(muni,xcaja,ycaja);
    }
    else if(a==1  &&  b>50){
      image(muni,xcaja,ycaja);
    }
    else if(a==2  &&  b>50){
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
