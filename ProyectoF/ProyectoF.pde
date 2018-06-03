//Bar bar;
Node start;
Node fin;

Button newBar;
Button newArm;
Button setAngle;
Button setLength;
Button move;
Button force;
Button moment;

int mode, x, y, z, w, f;

Boolean P, Q, M;

ArrayList<Bar> barras=new ArrayList<Bar>();
//ArrayList<Node> nodos=new ArrayList<Node>();

void setup() {
  fullScreen();
  mode=0;
  P=false;
  Q=false;
  M=false;

  newBar=new Button("xd1.png", new PVector(width*6/88, height*1/11), new PVector(40, 35));
  newArm=new Button("Papelera1.png", new PVector(width*6/88, height*5/22), new PVector(40, 35));
  setAngle= new Button("setAngle1.png", new PVector(width*6/88, height*4/11), new PVector(40, 35));
  setLength= new Button("setLength1.png", new PVector(width*6/88, height*11/22 ), new PVector(40, 35));
  move=new Button("mano1.png", new PVector(width*6/88, height*7/11), new PVector(40, 35));
  force= new Button("force1.png",new PVector(width*6/88,height*17/22),new PVector(40,35));
  moment= new Button("moment1.png",new PVector(width*6/88,height*10/11 ),new PVector(40,35));
}

void draw() {
  dibujar();
}

void mousePressed() {
  if (mode==0&&newBar.click(mouseX, mouseY)) {
    mode=1;
  }
}


void mouseReleased() {
  if (mode==1&&P) {
    Q=true;
  }
}

void mouseWheel(MouseEvent event) {
  float q=event.getCount();
  if (q==-1) {
    f++;
  }
  if (q==1) {
    f--;
  }
  println(f);
}

boolean nose(int i) {
  return barras.get(i).origin().click()||barras.get(i).end().click();
}