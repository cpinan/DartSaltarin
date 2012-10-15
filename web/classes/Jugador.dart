class Jugador implements BaseDraw {
  
  int canvasW, canvasH;
  int x,y;
  int width, height;
  var isJumping;
  var context;
  int xSpeed = 10;
  int ySpeed = 20;
  
  var src = "web/resources/jugador.gif";
  ImageElement imgPlayer;

  Jugador(int x, int y, int width, int height, var context)
  {    
    
    this.x = x;
    this.y = y;
    canvasW = width;
    canvasH = height;
    this.context = context;
    
    // Load image
    ImageElement img = new Element.tag('img'); 
    img.src = src;
    img.on.load.add((event) {
      this.width = img.width;
      this.height = img.height;
      this.imgPlayer = img;
    });
    
  }
  
  void run()
  {
    
  }
  
  void move(num cursorX, num cursorY)
  {    
    if((cursorX - x).abs() > xSpeed / 2)
    {
     
      if(cursorX < x)
      {
        if(x - xSpeed < width / 2)
        {
          x = (width / 2).toInt();
        }
        else
        {
          x = x - xSpeed;
        }
      }
      else
      {
        if(x + xSpeed > canvasW - width/2)
        {
          x = (canvasW - width/2).toInt();
        }
        else
        {
          x = x + xSpeed;
        }
      }
      
    }
    
  }
  
  void jump()
  {
    
  }
  
  void onDraw()
  {
    if(imgPlayer != null)
    {
      // print("Here ${width} ; ${height}");
      context.drawImage(imgPlayer, x - width / 2, y - height / 2, width, height);
    }
  }
  
  void update()
  {
  }
  
}
