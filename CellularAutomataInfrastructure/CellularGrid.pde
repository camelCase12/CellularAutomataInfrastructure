//The meat of this infrastructure, the cellular grid. A grid of cells with built-in functions to gather information about inter-cellular interactions and information.

class CellularGrid {
  Cell[][] cells;
  
  CellularGrid(int Width, int Height) { // Constructor, instantiates the cells within the array.
   cells = new Cell[Width][Height]; 
   for(int i = 0; i < Width; i++) {
      for(int j = 0; j < Height; j++) {
         cells[i][j] = new Cell(i, j); 
      }
   }
  }
  
  int getLiveNeighborCount(Cell cell) { // Gathers the number of living neighbors around the cell (8 of them)
    int neighborCount = 0;
    for(int i = -1; i <= 1; i++) {
      for(int j = -1; j <= 1; j++) {
       try {
         if(!(i == 0 && j == 0)) {
           if(cells[cell.x + i][cell.y + j].live) {
             neighborCount++;
           }
         }
       } catch(ArrayIndexOutOfBoundsException e) { }
      }
    }
    return neighborCount;
  }
  
  float getNeighborValueTotal(Cell cell) { // Gathers the combined value of all neighboring cells
     float neighborValue = 0;
     for(int i = -1; i <= 1; i++) {
        for(int j = -1; j <= 1; j++) {
         try {
           if(!(i == 0 && j == 0)) {
            neighborValue += cells[cell.x + i][cell.y + j].value; 
           }
         } catch(ArrayIndexOutOfBoundsException e) { }
        }
     }
     return neighborValue;
  }
}
