class Momento extends Vector{  
  float magnitud;
  boolean direccion;
  Momento(Node tempos, float tempM, boolean tempDir){    
    setPos (tempos);
    setM(tempM);
    setD(tempDir);
  }  
  void setM (float tempM){    
    magnitud= tempM;      
  }  
  void setD(boolean tempDir){    
    direccion=tempDir;    
  }  
  void display(){    
    PImage moment1 = loadImage("moment1.png");
    PImage moment2 = loadImage("moment2.png");    
    imageMode(CENTER);
    pushStyle();
    if(direccion==true){
    image(moment1,originv.x(), originv.y());
    }else{
    image(moment2,originv.x(),originv.y());}
    popStyle();  
  }      
}