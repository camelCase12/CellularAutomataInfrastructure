//For use: renderGridSimple will render your grid to the screen from default x, y 0, 0 at the top left, with green boxes representing living cells, and red boxes representing dead.
//renderGridComplex renders different colors on the basis of the cell value. renderGridComplex requires 2 inputs, a CellularGrid as well as a valueColorPallet. The valueColorPallet must 
//(/cont.) be manually initialized with the number of colors in the pallet, and then each color within the pallet should be initialized in the [valueColorPallet].colors array, (cont./)
//(/cont.) containing RGBValues, which contain 3 integers, representing the red, blue, and green counterparts for rgb color rendering.

void renderGridSimple(CellularGrid cellGrid) { //Takes a CellularGrid and renders it to the screen, stretching it to fit the screen size. It is a simple rendering form, (cont./)
//(/cont.) rendering on the basis of whether the cell is alive, a green box for living and a red for dead.
  int rectWidth = width / cellGrid.cells[0].length;
  int rectHeight = height / cellGrid.cells[1].length;
  for(int i = 0; i < cellGrid.cells[0].length; i++) {
    for(int j = 0; j < cellGrid.cells[1].length; j++) {
      if(cellGrid.cells[i][j].live == false) {
         stroke(0);
         fill(255, 50, 50);
         rect(i * rectWidth, j * rectHeight, rectWidth, rectHeight); 
      }
      else {
         stroke(0);
         fill(50, 255, 50);
         rect(i * rectWidth, j * rectHeight, rectWidth, rectHeight);
      }
    }
  }
}

void renderGridComplex(CellularGrid cellGrid, valueColorPallet vCP) { //Takes a CellularGrid and renders it to the screen, scretching it to fit the screen size. (cont./)
//(/cont.) It is a complex rendering form, rendering on the basis of the value of the cell and the attatched pallet.
  int rectWidth = width / cellGrid.cells[0].length;
  int rectHeight = height / cellGrid.cells[1].length;
  for(int i = 0; i < cellGrid.cells[0].length; i++) {
    for(int j = 0; j < cellGrid.cells[1].length; j++) {
      stroke(0);
      fill(vCP.colors[int(cellGrid.cells[i][j].value)].red, vCP.colors[int(cellGrid.cells[i][j].value)].green, vCP.colors[int(cellGrid.cells[i][j].value)].blue);
      rect(i * rectWidth, j * rectHeight, rectWidth, rectHeight); 
    }  
  }    
}

class valueColorPallet { //This is the pallet to be used for rendering the grid with colors based on the float 'value' attatched to each cell
  RGBValue[] colors; //Array of rgb colors
  
  valueColorPallet(int numberOfValues) { //Pallet must be initialized with the number of values pre-determined as of now
    colors = new RGBValue[numberOfValues];
    for(int i = 0; i < colors.length; i++) {
      colors[i] = new RGBValue(0, 0, 0); // Defaults to black when the colors have not yet been selected.
    }
  }
}

class RGBValue { // This class simply stores an RGB color for compartmentalization.
  int red, green, blue;
  
  RGBValue() {
    
  }
  RGBValue(int red, int green, int blue) {
    this.red = red;
    this.green = green;
    this.blue = blue;
  }
}
