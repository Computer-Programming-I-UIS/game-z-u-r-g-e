
class Enemigo {
  boolean f=false;
  float a,b,c,d,e,g=0,h=0,t;
  int count=0;
  float xenemigo;
  float yenemigo;
  float vel;
  
  Enemigo(float speed,float tempxenemigo, float tempyenemigo, float elec, float temparicion){
    vel=speed;
    xenemigo=tempxenemigo;
    yenemigo=tempyenemigo;
    e=elec;
    d=temparicion;
  }
  
  void movi(){
    a++;
    xenemigo=constrain(xenemigo,60,width-60);
    yenemigo=constrain(yenemigo,60,height-60);
    if(a<40){
      xenemigo+=vel*b;
      yenemigo+=vel*c;
    }
    else{
      b=random(-1,1);
      c=random(-1,1);
      a=random(0,5);
    }
  }
  
  void enemigos(){
    
    t=second();
    if(e==1){  //Aliens
      if(d<g && f==false){  //vivos
        alien.setXY(xenemigo,yenemigo);
        alien.setFrameSequence(0,2,0.09,1);
      }
      if(xenemigo>ZURGE.xzurge-50 && yenemigo>ZURGE.yzurge-50 && xenemigo<ZURGE.xzurge+50 && yenemigo<ZURGE.yzurge+50){  //muerte
        f=true;
        g=0;
        xenemigo=random(width-150,width-64)-random(-86,width-96);
        yenemigo=random(height-150,height-64)-random(-86,height-96);
        count++;
      }
      else{  //respawn
        f=false;
        g++;
      }
    }

    println(t);
    }  //Fin del metodo enemigos
    
    void counter(){
      text(count,500,200);
      
      //if(xenemigo>ZURGE.xzurge-50 && yenemigo>ZURGE.yzurge-50 && xenemigo<ZURGE.xzurge+50 && yenemigo<ZURGE.yzurge+50){
        if((f==true&&g==0)==true){
        count++;
      }
    }
        

    void gus(){
      
      if(count>=3){
      if(e==2){  //enemigo gus
      if(d<g && f==false){  //vivo
         if((t%5)==0){
           gus.setXY(xenemigo,yenemigo);
           gus.setFrameSequence(0,1,0.09,1);
        }
        else{
          gus.setXY(600,300);
           gus.setFrameSequence(1,2,0.09,1);
        }
      }
      if(xenemigo>ZURGE.xzurge-50 && yenemigo>ZURGE.yzurge-50 && xenemigo<ZURGE.xzurge+50 && yenemigo<ZURGE.yzurge+50){  //muerte
        f=true;
        g=0;
        xenemigo=850;
        yenemigo=300;
      }
      else{  //respawn
        f=false;
        g++;
        //image(material,xenemigo,yenemigo);
        //println(h);
        }
      }
      }
    }
    
    void bil(){
      if(e==3){  //enemigo bil
      if(d<g && f==false){  //vivo
         if((t%5)==1 ){
           bil.setXY(xenemigo,yenemigo);
           bil.setFrameSequence(0,1,0.09,1);
        }
        else if((t%5)==0){
           bil.setXY(xenemigo,yenemigo);
           bil.setFrameSequence(1,2,0.09,1);
        }
        else{
          bil.setXY(xenemigo,yenemigo);
          bil.setFrameSequence(2,3,0.09,1);
        }
      }
      if(xenemigo>ZURGE.xzurge-50 && yenemigo>ZURGE.yzurge-50 && xenemigo<ZURGE.xzurge+50 && yenemigo<ZURGE.yzurge+50){  //muerte
        f=true;
        g=0;
        xenemigo=850;
        yenemigo=300;
      }
      else{  //respawn
        f=false;
        g++;
        //image(material,xenemigo,yenemigo);
        //println(h);
        }
      }
    }
      
      
    
}
