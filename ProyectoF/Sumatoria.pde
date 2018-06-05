 float sumatoriaX(){

  for (int i = 0 ; i< fuerzas.size(); i++){
    
    float a = abs(fuerzas.get(i).getAngle());
    float m=fuerzas.get(i).getM(fuerzas.get(i).magnitud,fuerzas.get(i).originv);
    float x=m*cos(a);
    if(fuerzas.get(i).originv.x()>fuerzas.get(i).magnitud.x){
    sumx = sumx - x;}  else{sumx = sumx+1;}
   
  }
 
 return sumx;
 
}
float sumatoriaY(){

   for (int i = 0 ; i< fuerzas.size(); i++){
    
    float a = abs(fuerzas.get(i).getAngle());
    float M=fuerzas.get(i).getM(fuerzas.get(i).magnitud,fuerzas.get(i).originv);
    float y=M*sin(a);
    if(fuerzas.get(i).originv.y()>fuerzas.get(i).magnitud.y){
    sumy = sumy + y;}  else{sumy = sumy-y;}
  } 
  return sumy;
   
  
}