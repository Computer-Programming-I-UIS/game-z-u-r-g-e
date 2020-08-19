
class Enemigo //extends Sprite
{
  boolean f=false;
  float a,b,c,d,e,g=0,h=0,t;
  //int count=0;
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
  
  void enemigo(){
    if(e==1){  //Aliens
      alien.setXY(xenemigo,yenemigo);
      if(d<g && f==false){  //vivos
        alien.setFrameSequence(0,2,0.09,1);
      }
      if(xenemigo>ZURGE.xzurge-50 && yenemigo>ZURGE.yzurge-50 && xenemigo<ZURGE.xzurge+50 && yenemigo<ZURGE.yzurge+50||(ZURGE.xzurge+10*ZURGE.velbala>xenemigo-20&&ZURGE.xzurge+10*ZURGE.velbala<xenemigo+20)&&ZURGE.yzurge>yenemigo-50&&ZURGE.yzurge<yenemigo+50){  //muerte
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
    
    
    else if(e==2 && count>5){  //enemigo gus
      gus.setXY(xenemigo,yenemigo);
      if(g>d && f==false){  //vivo
           gus.setFrameSequence(0,2,0.09,4);
        }
      else if(xenemigo>ZURGE.xzurge-50 && yenemigo>ZURGE.yzurge-50 && xenemigo<ZURGE.xzurge+50 && yenemigo<ZURGE.yzurge+50){  //muerte
        f=true;
        g=0;
        xenemigo=random(850,width-60);
        yenemigo=random(60,height-60);
        count+=3;
      }
      else if(g>d){  //respawn
        //f=false;
        }
      else {
        g+=0.1;
      }
   }
      
      
    else if(e==3 && count>20){  //enemigo bil
      bil.setXY(xenemigo,yenemigo);
        if(t>d && f==false){  //vivo
           bil.setFrameSequence(0,3,1,1);
        }
        else if(xenemigo>ZURGE.xzurge-50 && yenemigo>ZURGE.yzurge-50 && xenemigo<ZURGE.xzurge+50 && yenemigo<ZURGE.yzurge+50 && f==false){  //muerte
          f=true;
          g=0;
          xenemigo=random(850,width-60);
          yenemigo=random(60,height-60);
          count+=5;
      }
        else{  //respawn
          f=false;
          g++;
        }
      }
    }
   }   
      
    
