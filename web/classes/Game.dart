class Game implements BaseDraw {
  
  final int FPS = 10;
  Timer timer;
  var context;
  int width, height;
  Jugador jugador;
  Background background;
  Point mouse;
  
  Game(var context, int width, int height)
  {
    this.context = context;
    this.width = width;
    this.height = height;
    initGame();
  }
  
  void initGame()
  {
    context.canvas.on.click.add((e)
    {
    });

    context.canvas.on.mouseMove.add((e) {
      mouse = new Point(e.offsetX, e.offsetY);
      // print ("${e.offsetX} ; ${e.offsetY}");
    });
    
    jugador = new Jugador((width / 2).toInt(), height - 32, width, height, context);
    background = new Background(context, width, height);
    
    draw(x: (width/2).toInt(), y: (height/2).toInt());
    
    timer = new Timer.repeating((1000 / FPS).toInt(), (Timer t) => gameLogic());
    
  }
  
  void gameLogic()
  {
    update();
    onDraw();
  }
  
  void onDraw()
  {
    context.clearRect(0,0,width,height);
    
    if(background != null)
    {
      background.onDraw();
    }
    
    if(jugador != null)
    {
      jugador.onDraw();
    }
  }
  
  void update()
  {
    
    if(background != null)
    {
      background.update();
    }
    
    if(jugador != null && mouse != null)
    {
      jugador.move(mouse.x, mouse.y);
      jugador.update();
    }
  }
  
  draw([int x, int y]) {
    
    context.beginPath();

    // clear drawing area
    context.clearRect(0,0,width,height);
    context.fillStyle = '#ffffff';
    context.strokeStyle = '#000000';
    context.fillRect(0,0,width,height);

    // draw me and fill me in
    context.rect(x,y,20,20);

    context.fillStyle = 'red';
    context.fill();

    context.stroke();

    context.closePath();
    
  }
  
}
