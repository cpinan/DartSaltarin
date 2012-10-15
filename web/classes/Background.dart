class Background implements BaseDraw {
  
  int canvasW, canvasH;
  var context;
  
  Background(var context, int width, int height)
  {
    this.context = context;
    canvasW = width;
    canvasH = height;
  }
  
  void onDraw()
  {
  }
  
  void update()
  {
    
  }
  
}
