class Bar {
  Node origin;
  Node end;
boolean mov1=false;
boolean mov2=false;

  Bar(Node tempOrigin, Node tempEnd) {
    origin=tempOrigin;
    end=tempEnd;
  }

  Bar(Node tempOrigin, int tempLength, int tempAngle) {
    origin=tempOrigin;
    end=new Node(new PVector(tempOrigin.x()+tempLength*cos(radians(tempAngle)), tempOrigin.y()-tempLength*sin(radians(tempAngle))));
  }

  void setL(int tempL){
    if(origin.x()<end.x()&&origin.y()<end.y()){
      end=new Node(new PVector(origin.x()+10*tempL*cos(getAngle()),origin.y()+tempL*10*sin(getAngle())));
    }
    if(origin.x()>end.x()&&origin.y()>end.y()){
      end=new Node(new PVector(origin.x()-10*tempL*cos(getAngle()),origin.y()-10*tempL*sin(getAngle())));
    }
    if(origin.x()<end.x()&&origin.y()>end.y()){
      end=new Node(new PVector(origin.x()+10*tempL*cos(getAngle()),origin.y()-10*tempL*sin(getAngle())));
    }
    if(origin.x()>end.x()&&origin.y()<end.y()){
      end=new Node(new PVector(origin.x()-10*tempL*cos(getAngle()),origin.y()+10*tempL*sin(getAngle())));
    }
  }
  
  void setA(float tempA){
    if(origin.x()<end.x()&&origin.y()<end.y()){
      end=new Node(new PVector(origin.x()+10*getL()*cos(tempA),origin.y()+getL()*10*sin(tempA)));
    }
    if(origin.x()>end.x()&&origin.y()>end.y()){
      end=new Node(new PVector(origin.x()-10*getL()*cos(tempA),origin.y()-10*getL()*sin(tempA)));
    }
    if(origin.x()<end.x()&&origin.y()>end.y()){
      end=new Node(new PVector(origin.x()+10*getL()*cos(tempA),origin.y()-10*getL()*sin(tempA)));
    }
    if(origin.x()>end.x()&&origin.y()<end.y()){
      end=new Node(new PVector(origin.x()-10*getL()*cos(tempA),origin.y()+10*getL()*sin(tempA)));
    }
  }
  
  float getAngle(){
    return atan(abs(origin.y()-end.y())/abs(origin.x()-end.x()));
  }
  
  float getL(){
    return int((sqrt(sq(origin.y()-end.y()) + sq(origin.x()-end.x())))/10);
  }
  

  boolean pick(int x, int y) {
    float x1, y1, x2, y2, m, b, y3, m2, b2, x3;
    x1=origin.position.x;
    y1=origin.position.y;    
    x2=end.position.x;
    y2=end.position.y;

    m=((y2-y1)/(x2-x1));
    b=(y1-(x1*m));
    
    m2=-1/m;
    b2=(y-(x*m2));
    
    x3=((b2-b)/(m-m2));
    y3=(x3*m+b);
    
    return sqrt(sq(y-y3)+sq(x-x3))<=10 &&((x>=x2 && x<=x1)||(y>=y2 && y<=y1)||(x>=x1 && x<=x2)||(y>=y1 && y<=y2));
  }
    boolean click(){
    return pick(mouseX,mouseY)&&mousePressed;
  }

  void display() {
    pushStyle();
    if (pick(mouseX, mouseY)) {
      stroke(color(208, 106, 212));
    } else {
      stroke(color(208, 206, 212));
    }
    strokeWeight(20);
    line(origin.x(), origin.y(), end.x(), end.y());
    popStyle();
    origin.display();
    end.display();
  }

  Node origin() {
    return origin;
  }

  Node end() {
    return end;
  }
}