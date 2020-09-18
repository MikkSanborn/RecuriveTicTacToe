public class Board { //<>// //<>//
  int x;
  int y;
  int size;
  int line;
  int wl; // 0, 1, 2, for rows, 3, 4, 5 columns, 6, left right diag, 7 right left diag
  int wll;
  Square[][] squares = new Square[3][3]; // 0 means unselected, 1 means 
  public Board(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    line = 0;
    wl = -1;
    for (int i = 0; i < squares.length; i++) {
      for (int m = 0; m<squares[i].length; m++) {
        squares[i][m] = new Square(x+m*size/3, y+i*size/3, size/3);
      }
    }
    wll = 0;
  }
  public int show() {
    for (int i = 0; i < squares.length; i++) {
      for (int m = 0; m<squares[i].length; m++) {
        squares[i][m].show();
      }
    }
    fill(0);
    stroke(0);
    strokeWeight(size/20);
    line(x+size/40, (size+y)/3, x+size-size/40, (size+y)/3);
    line(x+size/40, 2*(size+y)/3, x+size-size/40, 2*(size+y)/3);
    line((size+x)/3, y+size/40, (size+x)/3, y+size-size/40);
    line(2*(size+x)/3, y+size/40, 2*(size+x)/3, y+size-size/40);
    int win = win();
    println(win);
    if (win> 0 && win<3) {

      stroke(0);
      switch(wl) {
      case 0:
        line(x+size/40, (size+y)/6, x+wll, (size+y)/6);
        break;
      case 1:
        line(x+size/40, (size+y)/2, x+wll, (size+y)/2);
        break;
      case 2:
        line(x+size/40, 5*(size+y)/6, x+wll, 5*(size+y)/6);
        break;
      case 3:
        line((size+x)/6, y+size/40, (size+x)/6, y+wll);
        break;
      case 4:
        line((size+x)/2, y+size/40, (size+x)/2, y+wll);
        break;
      case 5:
        line(5*(size+x)/6, y+size/40, 5*(size+x)/6, y+wll);
        break;
      case 6:
        line(x+size*sqrt(2)/40, y+size*sqrt(2)/40, x+wll+size*sqrt(2)/40, y+wll+size*sqrt(2)/40);
        break;
      case 7:
        line(x+size-size*sqrt(2)/40, y+size*sqrt(2)/40, x+size-size*sqrt(2)/40-wll, y+wll+size*sqrt(2)/40);
        break;
      }
      if (wll < size-size/40) {
        if (wl < 6 || wll < size-size/13) {
          wll += 10;
        }
      } else {
        return win;
      }
    }

    return 0;
  }

  public int win() { // red is 1, blue is 2, cats is 3
    for (int i = 0; i < squares.length; i++) {
      int xvo = squares[i][0].getStatus();
      boolean win = true;
      for (int x = 0; x < squares.length; x++) {
        if (xvo != squares[i][x].getStatus()) {
          win = false;
        }
      }
      if (win && xvo > 1) {
        wl = i;
        return xvo-1;
      }
    }
    for (int i = 0; i < squares.length; i++) {
      int xvo = squares[0][i].getStatus();
      boolean win = true;
      for (int x = 0; x < squares.length; x++) {
        if (xvo != squares[x][i].getStatus()) {
          win = false;
        }
      }
      if (win && xvo > 1) {
        wl = i+3;
        return xvo-1;
      }
    }    
    int xvo = squares[0][0].getStatus();
    boolean win = true;
    for (int i = 0; i < squares.length; i++) {
      if (xvo != squares[i][i].getStatus()) {
        win = false;
      }
    }
    if (win && xvo > 1) {
      wl = 6;
      return xvo-1;
    }
    //int p = 0;
    //for(int i = 0; i < 3; i ++){
    //  for(int x = 0; x < 3; x++){
    //    if(squares[i][x].getStatus() == 2){
    //      p++;
    //    }
    //  }
    //}
    //if(p == 3){
    //  p = 0;
    //}
    xvo = squares[0][squares.length-1].getStatus();
    win = true;
    for (int i = squares.length-1; i >= 0; i--) {
      if (xvo != squares[squares.length-1-i][i].getStatus()) {
        win = false;
      }
    }
    if (win && xvo > 1) {
      wl = 7;
      return xvo-1;
    }
    return 0;
  }
  public void reset() {
    line = 0;
    wl = -1;
    for (int i = 0; i < squares.length; i++) {
      for (int m = 0; m<squares[i].length; m++) {
        squares[i][m] = new Square(x+m*size/3, y+i*size/3, size/3);
      }
    }
    wll = 0;
  }
}
