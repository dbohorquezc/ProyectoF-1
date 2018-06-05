class Fuerza extends Vector{  
 Fuerza(Node tempos, PVector tempM ){
    setPos(tempos);
    setPos2(tempM);
   }  
  float getAngle(){
  float angle=atan((originv.y()-magnitud.y)/(originv.x()-magnitud.x));
     return angle; //DEVUELVE EL ANGULO DEL VECTOR
  }  
  float getM(PVector tempM, Node tempos ){      
    float M = sqrt(((tempM.x-tempos.x())*(tempM.x-tempos.x()))+(tempM.y-tempos.y())*(tempM.y-tempos.y()));    
    return M; //DEVUELVE LA MAGNITUD DEL VECTOR  
  }
  void display() {
    pushStyle();
    if (pick(mouseX, mouseY)) {
      stroke(color(255, 0, 0));
      //strokeWeight(3);
      //fill(0);
    } else {
      stroke(color(0));      
    }
    strokeWeight(10);
    float len = sqrt(pow(originv.x()-magnitud.x,2)+pow(originv.y()-magnitud.y,2));
   pushMatrix();
  translate(originv.x(), originv.y());
  //PARA CADA VECTOR SE ROTA
  if(originv.y()<magnitud.y && originv.x()<magnitud.x) rotate(-getAngle()+PI/2);
  if(originv.x()<magnitud.x && originv.y()>magnitud.y) rotate(getAngle());
  if(originv.y()<magnitud.y && originv.x()>magnitud.x) rotate (getAngle() + PI);
  if (originv.x()>magnitud.x && originv.y()>magnitud.y) rotate(getAngle()+ PI);   
  //DIBUJAR LA FLECHITA 
  line(0,0,len, 0);
  line(len, 0, len -8 , -8);
  line(len, 0, len -8, 8);
  popMatrix();
  popStyle();      
  }
  boolean pick(int x, int y) {
    float x1, y1, x2, y2, m, b, y3, m2, b2, x3;
    x1=originv.x();
    y1=originv.y();    
    x2=magnitud.x;
    y2=magnitud.y;

    m=((y2-y1)/(x2-x1));
    b=(y1-(x1*m));
    
    m2=-1/m;
    b2=(y-(x*m2));
    
    x3=((b2-b)/(m-m2));
    y3=(x3*m+b);
    
    return sqrt(sq(y-y3)+sq(x-x3))<=10 &&((x>=x2 && x<=x1)||(y>=y2 && y<=y1));
  }
boolean click(){
    return pick(mouseX, mouseY)&&mousePressed;
  }
}