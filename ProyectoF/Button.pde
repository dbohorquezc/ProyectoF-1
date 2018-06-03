class Button {
  PVector position, size;  
  PImage img;

  Button(String tempText, PVector tempPos, PVector tempTam) {
    setImg(tempText);
    position=tempPos;
    size=tempTam;
  }

  void setImg(String imgn) {
    img=loadImage(imgn);
  } 

  void display() {
    pushStyle();
    rectMode(RADIUS);
    fill(255);
    stroke(0);
    if (pick(mouseX, mouseY)) {
      strokeWeight(10);
      rect(position.x, position.y, size.x, size.y, 8);
    } else {
      strokeWeight(5);      
      rect(position.x, position.y, size.x, size.y, 8);
    }
    
    imageMode(CENTER);
    image(img,position.x, position.y);
    popStyle();
  }

  boolean pick(int x, int y) {
    return (x<=position.x+(size.x) && x>=position.x-(size.x) && y<=position.y+(size.y) && y>=position.y-(size.y));
  }

  boolean click(int x, int y) {
    return pick(x, y)&&mousePressed;
  }
}