//Bar bar;
Node start, fin, apoyoin;

Button newBar, erase, setAngle, setLength, move, force, moment, fixed, roller, collar, pinned, corde;

int mode, z, w, f, d, u,intmover=-1,a;
float x, y;
int j=0,k=0;
float sumx = 0;
float sumy = 0;
PVector posicion;
PVector magnitud;
boolean direccion;

char[] numeros=new char[3];
char[] angulo=new char[3];

Boolean P, Q, M, mover=false,mover2=false, algo=false;

PVector d1 = new PVector(0, 0), d2 = new PVector(0, 0);

ArrayList<Bar> barras=new ArrayList<Bar>();
ArrayList<Support> apoy =new ArrayList<Support>();
ArrayList<Integer> mover1= new ArrayList<Integer>();
ArrayList<Integer> mover11= new ArrayList<Integer>();
ArrayList<Fuerza> fuerzas = new ArrayList<Fuerza>();
ArrayList<Momento> momentos = new ArrayList<Momento>();
//ArrayList<Node> nodos=new ArrayList<Node>();

void setup() {
  fullScreen();
  mode=0;
  P=false;
  Q=false;
  M=false;

  newBar=new Button("xd1.png", new PVector(width*6/88, height*2/14), new PVector(40, 35), 1);
  setAngle= new Button("setAngle1.png", new PVector(width*6/88, height*4/14), new PVector(40, 35), 2);
  setLength= new Button("setLength1.png", new PVector(width*6/88, height*6/14 ), new PVector(40, 35), 3);
  move=new Button("mano1.png", new PVector(width*6/88, height*8/14), new PVector(40, 35), 5);
  force= new Button("force1.png", new PVector(width*6/88, height*10/14), new PVector(40, 35), 4);
  moment= new Button("moment1.png", new PVector(width*6/88, height*12/14 ), new PVector(40, 35), 6);
  fixed= new Button("fixed.png", new PVector(width*82/88, height*2/14), new PVector(40, 35), 7);
  roller=new Button("roller.png", new PVector(width*82/88, height*4/14), new PVector(40, 35), 8);
  collar= new Button("collar.png", new PVector(width*82/88, height*6/14), new PVector(40, 35), 0);
  pinned=new Button("pinned.png", new PVector(width*82/88, height*8/14), new PVector(40, 35), 10);
  corde= new Button("corde.png", new PVector(width*82/88, height*10/14), new PVector(40, 35), 0);
  erase=new Button("Papelera1.png", new PVector(width*82/88, height*12/14), new PVector(40, 35), 12);
}

void draw() {
  dibujar();
}

void mousePressed() {
  if (get(mouseX, mouseY) == -3118380) {
    d1 = new PVector(mouseX, mouseY);
    algo = true;
  }
}


void mouseReleased() {
  if ((mode==1||mode == 4)&&P) {
    Q=true;
  }
  if (algo == true) {
    d2 = new PVector(mouseX, mouseY);    
    for (int i=0; i<barras.size(); i++) {
      barras.get(i).origin.position.x = barras.get(i).origin.position.x - (d1.x-d2.x);
      barras.get(i).origin.position.y = barras.get(i).origin.position.y - (d1.y-d2.y);
      barras.get(i).end.position.x = barras.get(i).end.position.x - (d1.x-d2.x);
      barras.get(i).end.position.y = barras.get(i).end.position.y - (d1.y-d2.y);
    }
    algo = false;
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
}

boolean nose(int i) {
  return barras.get(i).origin().click()||barras.get(i).end().click();
}

void keyPressed(){
  
  if(key == CODED){
    if(keyCode == UP){
        sumatoriaY();
        println("La fuerza en y del sistema es "+sumy+" Newtons");
        sumatoriaX();
        println("La fuerza en x del sistema es "+sumx+" Newtons");
    
    }
    
  }





}