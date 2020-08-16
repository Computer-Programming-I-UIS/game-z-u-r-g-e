
class Enemigo {
  float a,b,c;
  float xenemigo;
  float yenemigo;
  float vel;
  
  Enemigo(float speed,float tempxenemigo, float tempyenemigo){
    vel=speed;
    xenemigo=tempxenemigo;
    yenemigo=tempyenemigo;
  }
  
  void movi(){
    a++;
    xenemigo=constrain(xenemigo,64,936);
    yenemigo=constrain(yenemigo,64,536);
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
    image(alien,xenemigo,yenemigo);
}
}
