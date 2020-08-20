
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
    if(e==1 && (count==0 || count%5!=0)){  //Aliens
      alien.setXY(xenemigo,yenemigo);
      if(f==false && g>d ){  //vivos
        alien.setDead(false);
        alien.setFrameSequence(0,2,0.09,1);
      }
      if (!alien.isDead()) {
        if(alien.pp_collision(zurge)){  //muerte
        f=true;
        xenemigo=random(width-150,width-64)-random(-86,width-96);
        yenemigo=random(height-150,height-64)-random(-86,height-96);
        count++;
        g=0;
        alien.setDead(true);
        }
      }
      else {
        g++;
        f=false;
      }
    }
    
    
    else if(e==2 && count%5==0 && count!=0){  //enemigo gus
      gus.setXY(xenemigo,yenemigo);
      if(f==false && g>d ){  //vivos
        gus.setDead(false);
        gus.setFrameSequence(0,2,0.09,4);
      }
      if (!gus.isDead()) {
        if(gus.pp_collision(balafusil)){  //muerte
          f=true;
          xenemigo=random(width-150,width-64)-random(-86,width-96);
          yenemigo=random(height-150,height-64)-random(-86,height-96);
          count++;
          g=0;
          gus.setDead(true);
        }
      }
      else {
        g++;
        f=false;
      }
    }
      
    else if(e==3 && count%10==0 && count!=0){  //enemigo bil
        bil.setXY(xenemigo,yenemigo);
        if(f==false && g>d ){  //vivos
           bil.setDead(false);
           bil.setFrameSequence(0,3,1,1);
        }
        if (!bil.isDead()) {
          if(bil.pp_collision(zurge)){  //muerte
            f=true;
            xenemigo=random(width-150,width-64)-random(-86,width-96);
            yenemigo=random(height-150,height-64)-random(-86,height-96);
            count++;
            g=0;
            bil.setDead(true);
          }
        }
        else {
          g++;
          f=false;
        }
    }
    }
   }   
      
    
