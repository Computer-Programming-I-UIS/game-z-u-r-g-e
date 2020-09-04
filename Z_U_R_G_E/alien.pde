
class Enemigo //extends Sprite
{
  boolean f=false,h=true;
  float a,b,c,d,e,g=0,t=0, tm=1010;
  //int count=0;
  float xenemigo,xproyec;
  float yenemigo,yproyec;
  float vel;
  int vid;
  Enemigo(float speed,float tempxenemigo, float tempyenemigo, float elec, float temparicion,int vida){
    vel=speed;
    xenemigo=tempxenemigo;
    yenemigo=tempyenemigo;
    e=elec;
    d=temparicion;
    vid=vida;
  }
  
  void movi(){
    xenemigo=constrain(xenemigo,100,width-60);
    yenemigo=constrain(yenemigo,60,height-60);
    a++;
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
      enemigos[0].setXY(xenemigo,yenemigo);g++;
      if(f==false && g>d && vid>0){  //vivos
        enemigos[0].setDead(false);
        enemigos[0].setFrameSequence(0,2,1,1);
      }
      if (!enemigos[0].isDead() && vid>0 && (enemigos[0].cc_collision(balafusil) || enemigos[0].cc_collision(balabazooka))&& (!balafusil.isDead()||!balabazooka.isDead())) { //muerte
        vid-=1;
        caja.c-=1;
        balabazooka.setDead(true);
        balafusil.setDead(true);
        shot.play(-10);
      }
      else if(vid==0){
        enemigos[0].setDead(true);
        f=true;
        count++;
        g=0;
        xenemigo=random(width-64,width);
        yenemigo=random(0,height);
        vid=2;
      }
      else {
        g++;
        f=false;
      }
    }
    
    
    else if(e==2&&count==5){ //gus   && count==5
      enemigos[1].setXY(xenemigo,yenemigo);
      if(f==false&& g>d  ){  //vivos
        enemigos[1].setDead(false);
        enemigos[1].setFrameSequence(3,6,0.25,1);
        t++;
        tm++;
         menu.pause();
        if(tm%1020==0){ //Arreglar esta condicion
        boss.loop();
        }
        if(t>60){
          cajas[3].setDead(false);
          cajas[3].setXY(xproyec-=30,yproyec);
          cajas[3].setFrameSequence(3,3,0.01,1);
          enemigos[1].setFrameSequence(6,6,0.01,1);
        }
        else{
          xproyec=xenemigo;
          yproyec=yenemigo;
        }
      }
      if (!enemigos[1].isDead() && (enemigos[1].cc_collision(balafusil) || enemigos[1].cc_collision(balabazooka))&& (!balafusil.isDead()||!balabazooka.isDead())) {  //muerte
          vid-=1;
          caja.c-=1;
        balabazooka.setDead(true);
        balafusil.setDead(true);
          shot.play(-10);
      }
      if(vid==0){
          f=true;
          xenemigo=random(width-120,width-60);
          yenemigo=random(0,height);
          count++;
          g=0;
          enemigos[1].setDead(true);
          cajas[3].setDead(true);
          xproyec=height;
          yproyec=width;
          t=0;
          tm=0;
          caja.b=150;
          vid=5;
          boss.pause();
          if(stage!=4){
            stage=6;
            caja.a=3;
          }
      }
      else {
        g++;
        f=false;
      }
    }
    if(count%3==0&&count!=0&&h==true){
      ZURGE.heal+=40;
      h=false;
    }else if(count%3!=0){
      h=true;
    }
    
      
    
      
 
  }

    
    void enemigo2lvl(){
    if(e==1 && (count%7!=0||!enemigos[0].isDead())){  //Aliens
      enemigos[0].setXY(xenemigo,yenemigo);
      if(f==false && g>d ){  //vivos
        enemigos[0].setDead(false);
        enemigos[0].setFrameSequence(0,2,1,1);
      }
      if (!enemigos[0].isDead() && (enemigos[0].cc_collision(balafusil) || enemigos[0].cc_collision(balabazooka))&& (!balafusil.isDead()||!balabazooka.isDead())) { //muerte
        vid-=1;
        caja.c-=1;
        shot.play(-10);
        balabazooka.setDead(true);
        balafusil.setDead(true);
      }
      if(vid==0){
        f=true;
        count++;
        g=0;
        enemigos[0].setDead(true);
        vid=2;
      }
      else {
        g++;
        f=false;
      }
    }
    
    
      else if(e==2 && (count%7!=0||!enemigos[1].isDead())){ //gus   && count==5
      enemigos[1].setXY(xenemigo,yenemigo);
      if(f==false&& g>d  ){  //vivos
        enemigos[1].setDead(false);
        enemigos[1].setFrameSequence(3,6,0.25,1);
        t++;
        if(t>60){
          cajas[3].setDead(false);
          cajas[3].setXY(xproyec-=30,yproyec);
          cajas[3].setFrameSequence(3,3,0.01,1);
          enemigos[1].setFrameSequence(6,6,0.01,1);
        }
        else{
          xproyec=xenemigo;
          yproyec=yenemigo;
        }
      }
      if (!enemigos[1].isDead() && (enemigos[1].cc_collision(balafusil) || enemigos[1].cc_collision(balabazooka))&& (!balafusil.isDead()||!balabazooka.isDead())) {  //muerte
          vid-=1;
          caja.c-=1;
          shot.play(-10);
        balabazooka.setDead(true);
        balafusil.setDead(true);
      }
      if(vid==0){
          f=true;
          xenemigo=random(width-120,width-60);
          yenemigo=random(0,height);
          count++;
          g=0;
          enemigos[1].setDead(true);
          cajas[3].setDead(true);
          xproyec=height;
          yproyec=width;
          t=0;
          //caja.a=3;
          caja.b=150;
          vid=2;
      }
      else {
        g++;
        f=false;
      }
      }
    
      
    
    else if(e==3 && (count%7==0||!enemigos[2].isDead())){  //bil   
        enemigos[2].setXY(xenemigo,yenemigo);
        if(tm%1020==0){ //Arreglar esta condicion
              boss.loop();
           }
        if(f==false && g>d ) {  //vivos
           enemigos[2].setDead(false);
           enemigos[2].setFrameSequence(7,12,0.25,1);
           t++;
           menu.pause();
           tm++;
           if(t>90){
             cajas[2].setDead(false);
             cajas[2].setXY(xproyec-=30,yproyec);
             cajas[2].setFrameSequence(2,2,1,1);
             enemigos[2].setFrameSequence(12,12,1,1);
             if(t%90==0){
             orbe.loop();
             }
           }
           else{
              xproyec=xenemigo;
              yproyec=yenemigo;
            }
        }
        if (!enemigos[2].isDead() && (enemigos[2].cc_collision(balafusil) ||enemigos[2].cc_collision(balabazooka))&& (!balafusil.isDead()||!balabazooka.isDead())) { //muerte
            caja.c-=1;
            vid-=1;
            shot.play(-10);
        balabazooka.setDead(true);
        balafusil.setDead(true);
        }
        if(vid==0){
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
            tm=0;
            caja.a=3;
            caja.b=150;
            vid=5;
            boss.pause();
            orbe.pause();
            
        }
        else {
          g++;
          f=false;
        }
    }
    if(count%3==0&&h==true){
      ZURGE.heal+=40;
      h=false;
    }
    else if(count%3!=0){
      h=true;
    }
    
    }
    
    
    
   }  
  
    
