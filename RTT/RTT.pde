Board b;
int turn;
//Square s;
void setup(){
  size(800,800);
  b = new Board(0,0,width);
 // s = new Square(0, 266, 266);
 turn = 0;
}





void draw(){
  background(255);
  b.show();
  //s.show();
  if(keys['r']){
    b.reset();
  }
}




///////////////
// KEY STUFF //
///////////////
boolean []keys=new boolean[1024];
void keyPressed() {
  if (!(key==CODED)) {
    keys[key]=true;
  }
}
void keyReleased() {
  if (!(key==CODED)) {
    keys[key]=false;
  }
}
