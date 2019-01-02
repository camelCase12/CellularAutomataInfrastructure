//The base component for any cellular automata, the cell.

class Cell {
  int x; // The x position of the cell (starting from the left, going to the right)
  int y; // The y position of the cell (starting from the top, going to the bottom)
  boolean live; // Whether the cell is alive or not
  float value; // A value can be attatched to the cell, for more complex purposes
  Cell() {
    
  }
  
  Cell(int x, int y) {
   this.x = x;
   this.y = y;
  }
}
