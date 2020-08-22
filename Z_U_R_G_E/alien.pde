
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
      enemigos.setXY(xenemigo,yenemigo);
      if(f==false && g>d ){  //vivos
        enemigos.setDead(false);
        enemigos.setFrameSequence(0,2,0.09,1);
      }
      if (!enemigos.isDead() && (enemigos.pp_collision(balafusil) || enemigos.pp_collision(balafusil))) { //muerte
        f=true;
        xenemigo=random(width-150,width-64)-random(-86,width-96);
        yenemigo=random(height-150,height-64)-random(-86,height-96);
        count++;
        g=0;
        enemigos.setDead(true);
      }
      else {
        g++;
        f=false;
      }
    }
    
    
    else if(e==2 && ((count==5) )){  //enemigo gus
      enemigos.setXY(xenemigo,yenemigo);
      if(f==false&& g>d  ){  //vivos
        enemigos.setDead(false);
        enemigos.setFrameSequence(3,5,0.09,4);
      }
      if (!enemigos.isDead() && (enemigos.pp_collision(balafusil) || enemigos.pp_collision(balafusil))) {  //muerte
          f=true;
          xenemigo=random(width-150,width-64)-random(-86,width-96);
          yenemigo=random(height-150,height-64)-random(-86,height-96);
          count++;
          g=0;
          enemigos.setDead(true);
      }
      else {
        g++;
        f=false;
      }
    }
      
    else if(e==3 && count==10){  //enemigo bil
        enemigos.setXY(xenemigo,yenemigo);
        if(f==false && g>d ) {  //vivos
           enemigos.setDead(false);
           enemigos.setFrameSequence(7,12,1,1);
        }
        if (!enemigos.isDead() && (enemigos.pp_collision(balafusil) ||enemigos.pp_collision(balafusil))) { //muerte
            f=true;
            count++;
            g=0;
            enemigos.setDead(true);
        }
        else {
          g++;
          f=false;
        }
    }
    }
   }   
      
    
