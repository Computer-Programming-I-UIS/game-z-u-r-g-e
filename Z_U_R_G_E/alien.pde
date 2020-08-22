
class Enemigo //extends Sprite
{
  boolean f=false;
  float a,b,c,d,e,g=0,t=0;
  //int count=0;
  float xenemigo,xproyec;
  float yenemigo,yproyec;
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
      enemigos[0].setXY(xenemigo,yenemigo);
      if(f==false && g>d ){  //vivos
        enemigos[0].setDead(false);
        enemigos[0].setFrameSequence(0,2,0.09,1);
      }
      if (!enemigos[0].isDead() && (enemigos[0].pp_collision(balafusil) || enemigos[0].pp_collision(balafusil))) { //muerte
        f=true;
        xenemigo=random(width,width-64);
        yenemigo=random(0,height);
        count++;
        g=0;
        enemigos[0].setDead(true);
      }
      else {
        g++;
        f=false;
      }
    }
    
    
    else if(e==2 ){  //enemigo gus && ((count==5) )
      enemigos[1].setXY(xenemigo,yenemigo);
      if(f==false&& g>d  ){  //vivos
        enemigos[1].setDead(false);
        enemigos[1].setFrameSequence(3,6,1,1);
        if(t>240){
          cajas[3].setDead(false);
          cajas[3].setXY(xproyec-=30,yproyec);
          cajas[3].setFrameSequence(3,3,1,1);
        }
        if(t==240){
          xproyec=xenemigo;
          yproyec=yenemigo;
        }  
      }
      if (!enemigos[1].isDead() && (enemigos[1].pp_collision(balafusil) || enemigos[1].pp_collision(balafusil))) {  //muerte
          f=true;
          xenemigo=random(width,width-64);
          yenemigo=random(0,height);
          count++;
          g=0;
          enemigos[1].setDead(true);
          cajas[3].setDead(true);
          xproyec=height;
          yproyec=width;
          t=0;
      }
      else {
        g++;
        f=false;
      }
    }
      
    
    else if(e==3 ){  //enemigo bil&& count==10
        enemigos[2].setXY(xenemigo,yenemigo);
        if(f==false && g>d ) {  //vivos
           enemigos[2].setDead(false);
           enemigos[2].setFrameSequence(7,12,1,1);
           t++;
           if(t>360){
             cajas[2].setDead(false);
             cajas[2].setXY(xproyec-=30,yproyec);
             cajas[2].setFrameSequence(2,2,1,1);
           }
           if(t==360){
              xproyec=xenemigo;
              yproyec=yenemigo;
            }
        }
        if (!enemigos[2].isDead() && (enemigos[2].pp_collision(balafusil) ||enemigos[2].pp_collision(balafusil))) { //muerte
            f=true;
            count++;
            xenemigo=random(width,width-64);
            yenemigo=random(0,height);
            g=0;
            enemigos[2].setDead(true);
            cajas[2].setDead(true);
            xproyec=height;
            yproyec=width;
            t=0;
        }
        else {
          g++;
          f=false;
        }
    }
    }
    
    
   }   
  
    
