public class Square {
  int x;
  int y;
  int size;
  int status; // 0 means blank, 1 means hovered over, 2 means red, 3 means blue,
  boolean done;
  public Square(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    status = 0;
    done = false;
  }
  public void show() {
    strokeWeight(size/20);
    if (!done) {
      if (hitBox(x, y, x+size, y+size) && status == 0) {
        status = 1;
      } 

      if (status == 1 && mousePressed) {
        if (turn%2 == 0) {
          status = 2;
        } else {
          status = 3;
        }
      }
      if ((status == 3 || status == 2) && keys[' ']) {
        done = true;
        turn++;
      }
      if (mousePressed && !done && !hitBox(x, y, x+size, y+size)) {
        status = 0;
      }
    }
    if (status == 1) {
      noStroke();
      fill(59, 255, 103, 100);
      rect(x, y, size, size);
      if (!hitBox(x, y, x+size, y+size)) {
        status = 0;
      }
    } else if (status == 2) {
      stroke(255, 0, 0);
      line(x+size/5, y+size/5, x+size-size/5, y+size-size/5);
      line(x+size-size/5, y+size/5, x+size/5, y+size-size/5);
    } else if (status == 3) {
      noFill();
      stroke(0, 0, 255);
      ellipse(x+size/2, y+size/2, 3*size/5, 3*size/5);
    }
  }
  public boolean hitBox(int x1, int y1, int x2, int y2) {
    if (mouseX>x1 && mouseY>y1 && mouseX<x2 && mouseY<y2) {
      return true;
    } else {
      return false;
    }
  }
  public int getStatus(){
    if(!done){
      return 0;
    } else { 
      return status;
    }
  }
}
