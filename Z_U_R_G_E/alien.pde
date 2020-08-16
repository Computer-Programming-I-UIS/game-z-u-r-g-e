
class Enemigo {
  boolean f=false;
  float a,b,c,d,e,g=0,h=0,t;
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
  
  void fondo(){
    t=second();
    if(e==1){  //enemigo alien
      if(d<g && f==false){  //vivo
        image(alien,xenemigo,yenemigo);
      }
      if(xenemigo>ZURGE.xzurge && yenemigo>ZURGE.yzurge && xenemigo<ZURGE.xzurge+100 && yenemigo<ZURGE.yzurge+200){  //muerte
        f=true;
        g=0;
        xenemigo=random(width-150,width-64)-random(-86,width-96);
        yenemigo=random(height-150,height-64)-random(-86,height-96);
      }
      else{  //respawn
        f=false;
        g++;
      }
    }
    else if(e==2){  //enemigo gus
      if(d<g && f==false){  //vivo
         if((t%5)==0){
           image(gus[1],xenemigo,yenemigo);
        }
        else{
          image(gus[0],xenemigo,yenemigo);
        }
      }
      if(xenemigo>ZURGE.xzurge && yenemigo>ZURGE.yzurge && xenemigo<ZURGE.xzurge+100 && yenemigo<ZURGE.yzurge+200){  //muerte
        f=true;
        g=0;
        xenemigo=850;
        yenemigo=300;
      }
      else{  //respawn
        f=false;
        g++;
        image(material,xenemigo,yenemigo);
        //println(h);
        }
    }
    else if(e==3){  //enemigo bil
      if(d<g && f==false){  //vivo
         if((t%5)==1 ){
           image(bil[2],xenemigo,yenemigo);
        }
        else if((t%5)==0){
           image(bil[1],xenemigo,yenemigo);
        }
        else{
          image(bil[0],xenemigo,yenemigo);
        }
      }
      if(xenemigo>ZURGE.xzurge && yenemigo>ZURGE.yzurge && xenemigo<ZURGE.xzurge+100 && yenemigo<ZURGE.yzurge+200){  //muerte
        f=true;
        g=0;
        xenemigo=850;
        yenemigo=300;
      }
      else{  //respawn
        f=false;
        g++;
        image(material,xenemigo,yenemigo);
        //println(h);
        }
    }

println(t);}
}
