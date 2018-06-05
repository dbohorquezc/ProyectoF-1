class Fixed extends Support {  
  PVector fuerzax=new PVector(0, 0), fuerzay=new PVector(0, 0);
  PVector getFuerzax () {
    return fuerzax;
  }
  PVector getFuerzay () {
    return fuerzay;
  }
  void setFuerzax (PVector a) {
    fuerzax=a;
  }
  void setFuerzay (PVector a) {
    fuerzay=a;
  }

  Fixed(Node pos) {  
    super(pos);
  }
  @Override
    void display() {
    pushStyle();
    imageMode(CENTER);
    image(loadImage("fixed.png"), pos.position.x, pos.position.y+16);
    pos.display();
    popStyle();
  }
}