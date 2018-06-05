class Pinned extends Support {
  PVector fuerzax=new PVector(0, 0), fuerzay=new PVector(0, 0);

  PVector getFuerzax () {
    return fuerzax;
  }
  PVector getFuerzay () {
    return fuerzay;
  }
  void setFuerzax (PVector a){
    fuerzax=a;
  }
  void setFuerzay (PVector a){
    fuerzay=a;
  }
  
  Pinned(Node pos) {  
    super(pos);
  }
  @Override
    void display() {
    pushStyle();
    imageMode(CENTER);
    pos.display();
    image(loadImage("pinned2.png"), pos.position.x, pos.position.y);
    popStyle();
  }
}