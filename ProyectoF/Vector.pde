class Vector {
  Node originv;
  PVector magnitud; 
  void setPos(Node tempos) {    
    originv = new Node( tempos.x(), tempos.y());
  }  
  void setPos2(PVector tempM) {  
    magnitud = new PVector( tempM.x, tempM.y);
  }
}