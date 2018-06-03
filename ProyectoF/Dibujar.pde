void dibujar() {
  background(255);
  pushStyle();
  strokeWeight(5);
  rectMode(CENTER);
  rect(width*1/2, height*5/11, width*8/11, height*8/11);
  popStyle();  
  newBar.display();
  erase.display();
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
    cursor(ARROW);
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
  case 2:  
    cursor(HAND);
    if (mouseY<height*9/11&&mousePressed&&mouseX>width*3/22+10&&mouseY>height*1/11&&mouseX<width*21/22+10) {
      for (int i=0; i<barras.size(); i++) {
        if (barras.get(i).click()) {
          barras.remove(i);
        }
      }
    }
    break;
  case 5:
    pushStyle();
    cursor(MOVE);
    for (int i=0; i<barras.size(); i++) {
      if (barras.get(i).origin.click()) {
        barras.get(i).origin.position.x = mouseX;
        barras.get(i).origin.position.y = mouseY;
        textSize(20);
        fill(0, 1, 0);
        arc(barras.get(i).end.position.x, barras.get(i).end.position.y, 100, 100, 0, atan((barras.get(i).end.position.y-barras.get(i).origin.position.y)/(barras.get(i).end.position.x-barras.get(i).origin.position.x)));
        text(int((sqrt(sq(mouseX-barras.get(i).end.position.x) + sq(mouseY-barras.get(i).end.position.y)))/10), barras.get(i).end.position.x+(mouseX-barras.get(i).end.position.x)/2, barras.get(i).end.position.y+(mouseY-barras.get(i).end.position.y)/2);


        line(barras.get(i).end.position.x, barras.get(i).end.position.y, barras.get(i).end.position.x+1000, barras.get(i).end.position.y);

        textSize(20);

        text(int((-1)*(180/PI)*atan((barras.get(i).end.position.y-barras.get(i).origin.position.y)/(barras.get(i).end.position.x-barras.get(i).origin.position.x)))+"°", barras.get(i).end.position.x+10, barras.get(i).end.position.y-10);
        fill(0, 1, 0);
      } else if (barras.get(i).end.click()) {
        barras.get(i).end.position.x = mouseX;
        barras.get(i).end.position.y = mouseY; 
        textSize(20);
        fill(0, 1, 0);
        arc(barras.get(i).end.position.x, barras.get(i).end.position.y, 100, 100, 0, atan((barras.get(i).end.position.y-barras.get(i).origin.position.y)/(barras.get(i).end.position.x-barras.get(i).origin.position.x)));
        text(int((sqrt(sq(mouseX-barras.get(i).origin.position.x) + sq(mouseY-barras.get(i).origin.position.y)))/10), barras.get(i).origin.position.x+(mouseX-barras.get(i).origin.position.x)/2, barras.get(i).origin.position.y+(mouseY-barras.get(i).origin.position.y)/2);
        line(barras.get(i).end.position.x, barras.get(i).end.position.y, barras.get(i).end.position.x+1000, barras.get(i).end.position.y);

        text(int(-(180/PI)*atan((barras.get(i).end.position.y-barras.get(i).origin.position.y)/(barras.get(i).end.position.x-barras.get(i).origin.position.x)))+"°", barras.get(i).end.position.x+10, barras.get(i).end.position.y-10);
        fill(0, 1, 0);
      }
    }
    popStyle();
    break;
  }
}