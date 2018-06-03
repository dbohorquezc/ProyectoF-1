void dibujar() {
  background(255);
  pushStyle();
  strokeWeight(5);
  rectMode(CENTER);
  rect(width*1/2, height*5/11, width*8/11, height*8/11);
  popStyle();  

  newBar.display();
  newArm.display();
  setLength.display();
  setAngle.display();  
  move.display();
  force.display();
  moment.display();
  //println(barras.size());
  for (int i=0; i<barras.size(); i++) {
    barras.get(i).display();
    if (barras.get(i).pick(mouseX, mouseY)) {
      println(i);
    }
  }
  switch (mode) {
  case 0:

    break;
  case 1:

    if (!P&&!Q&&mouseY<height*9/11&&mousePressed&&mouseX>width*3/22+10&&mouseY>height*1/11&&mouseX<width*21/22+10) {
      if (barras.size()>0) {
        for (int i=0; i<barras.size(); i++) {
          if (barras.get(i).origin().click()) {
            start=barras.get(i).origin();
            x=start.x();
            y=start.y();
            P=true;
          } else if (barras.get(i).end().click()) {
            start=barras.get(i).end();
            x=start.x();
            y=start.y();
            P=true;
          }
        }
        if (!P) {
          x=mouseX;
          y=mouseY;
          start=new Node(x, y);
          P=true;
        }
      } else { 
        x=mouseX;
        y=mouseY;
        start=new Node(x, y);
        P=true;
      }
    }

    if (P) {
      pushStyle();
      stroke(0);
      strokeWeight(1);
      ellipse(x, y, 10, 10);
      popStyle();
    }

    if (Q&&mouseY<height*9/11&&mousePressed&&mouseX>width*3/22+10&&mouseY>height*1/11&&mouseX<width*21/22+10) {
      if (barras.size()>0) {
        for (int i=0; i<barras.size(); i++) {
          if (barras.get(i).origin().click()) {
            fin=barras.get(i).origin();
            P=false;
            mode=0;
            Q=false;
          } else if (barras.get(i).end().click()) {
            fin=barras.get(i).end();
            P=false;
            Q=false;
            mode=0;
          }
        }
        if (Q) {
          fin=new Node(mouseX, mouseY);
          P=false;
          Q=false;
          mode=0;
        }
      } else {
        if (Q&&mouseY<700&&mousePressed) {

          fin=new Node(mouseX, mouseY);
          P=false;
          Q=false;
          mode=0;
        }
      }
      barras.add(new Bar(fin, start));
    }
    break;
  }
}