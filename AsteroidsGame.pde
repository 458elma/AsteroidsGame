//your variable declarations here
SpaceShip ship;
ArrayList <Bullet> ammo;
ArrayList <Asteroids> roids;
Fire fuego;
Star[] bunch = new Star[750];
public void setup() 
{
  //your code here
  size(800,800);
  ship = new SpaceShip();
  roids = new ArrayList <Asteroids> ();
  ammo = new ArrayList <Bullet> ();
  for(int i = 0;i<10;i++) {
    roids.add(new Asteroids());
  }
  fuego = new Fire();
  for(int i = 0;i<bunch.length;i++) {
    bunch[i] = new Star();
  }
}
public void draw() 
{
  //your code here
  background(0);

 
  for(int i = 0;i<bunch.length;i++) {
    bunch[i].show();
  }
  
    
  ship.show();
  ship.move();
  
  for(int i = 0;i<roids.size();i++) {
    roids.get(i).show();
    roids.get(i).move();
    double d = dist(ship.getX(), ship.getY(), roids.get(i).getX(), roids.get(i).getY());
    if(d<35) {
      roids.remove(i);
      roids.add(new Asteroids());
      //roids.add(new Asteroids());
    }
    for(int j = 0; j<ammo.size(); j++) {
      ammo.get(j).show();
      ammo.get(j).move();
      double dd = dist(ammo.get(j).getX(), ammo.get(j).getY(), roids.get(i).getX(), roids.get(i).getY());
      if(dd<20) {
        ammo.remove(j);
        roids.remove(i);
        roids.add(new Asteroids());
        //roids.add(new Asteroids());
      }
    }
  }

  //roids.getDirectionX()++;
  //roids.getDirectionY()++;
    
  
  fuego.move();
}
public void keyPressed() {
  int num = (int)(Math.random()*801);
  int num2 = (int)(Math.random()*801);
  int num3 = (int)(Math.random()*360);
  //moveForward
  if(key == 'w') {
    ship.accelerate(0.5);
    fuego.show();
    
    fuego.accelerate(0.5);
  }
  //rotate clockwise
  if(key == 'd') {
    ship.rotate(3);
    fuego.rotate(3);
  }
  //rotate counterclockwise
  if(key == 'a') {
    ship.rotate(-3);
    fuego.rotate(-3);
  }
  //move backwards 
  if(key == 's') {
    ship.accelerate(-1);
    fuego.accelerate(-1);
  }
  //hyperspace
  if(key == 'h') {
    ship.setX(num);
    ship.setY(num2);
    ship.setDirectionX(0);
    ship.setDirectionY(0);
    ship.setPointDirection(num3);
    fuego.setX(num);
    fuego.setY(num2);
    fuego.setDirectionX(0);
    fuego.setDirectionY(0);
    fuego.setPointDirection(num3);
  }
}
public void mouseClicked() {
  for(int i = 0; i<1; i++) {
    ammo.add(new Bullet(ship));
  }
  
}
class Star 
{
  private int myX,myY,mySize;
  public Star() {
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
    mySize = 3;
  }
  public void show() {
    noStroke();
    fill(255,255,51);
    ellipse(myX,myY,mySize,mySize);
  }
}
class Fire extends SpaceShip
{
  public Fire() {
      corners = 7;
      xCorners =  new int[corners];
      yCorners =  new int[corners];
      xCorners[0] = -7;
      yCorners[0] = -4; 
      xCorners[1] = -7; 
      yCorners[1] = 4; 
      xCorners[2] = -13;  
      yCorners[2] = 4;
      xCorners[3] = -10;
      yCorners[3] = 2; 
      xCorners[4] = -13; 
      yCorners[4] = 0; 
      xCorners[5] = -10; 
      yCorners[5] = -2; 
      xCorners[6] = -13; 
      yCorners[6] = -4;
      myColor = 255;
      //myColor2 = 0;
      //myColor3 = 0;
      myCenterX = 400;
      myCenterY = 400;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
    }
  }

class SpaceShip extends Floater  
{   
    //your code here
    //protected int myColor2,myColor3;
    public SpaceShip() {
      corners = 7;
      xCorners =  new int[corners];
      yCorners =  new int[corners];
      xCorners[0] = -12;
      yCorners[0] = -9; 
      xCorners[1] = 7; 
      yCorners[1] = -9; 
      xCorners[2] = 13;  
      yCorners[2] = 0;
      xCorners[3] = 7;
      yCorners[3] = 9; 
      xCorners[4] = -12; 
      yCorners[4] = 9; 
      xCorners[5] = -7; 
      yCorners[5] = 4; 
      xCorners[6] = -7; 
      yCorners[6] = -4;
      myColor = 150;
      //myColor2 = 0;
      //myColor3 = 0;
      myCenterX = 400;
      myCenterY = 400;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
    }
    public void setX(int x) {myCenterX = x;}
    public int getX() {return (int)myCenterX;}   
    public void setY(int y) {myCenterY = y;}   
    public int getY(){return (int)myCenterY;}    
    public void setDirectionX(double x){myDirectionX = x;}  
    public double getDirectionX(){return myDirectionX;}   
    public void setDirectionY(double y){myDirectionY = y;} 
    public double getDirectionY(){return myDirectionY;}  
    public void setPointDirection(int degrees){myPointDirection = degrees;}   
    public double getPointDirection(){return myPointDirection;}
}
class Bullet extends Floater 
{
  private double dRadians;
  public Bullet(SpaceShip ship) {
      myCenterX = ship.getX();
      myCenterY = ship.getY();
      myPointDirection = ship.getPointDirection();
      dRadians = myPointDirection*(Math.PI/180);
      myDirectionX = 5*Math.cos(dRadians) + ship.getDirectionX();
      myDirectionY = 5*Math.sin(dRadians) + ship.getDirectionY();
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY = y;}   
  public int getY(){return (int)myCenterY;}    
  public void setDirectionX(double x){myDirectionX = x;}      
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;} 
  public double getDirectionY(){return myDirectionY;}  
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;}
  public void show() {
    fill(255,0,0);
    noStroke();
    ellipse(myCenterX,myCenterY,5,5);
  }
}
class Asteroids extends Floater 
{
    private int rotSpd,asMoveX,asMoveY,prob;
    public Asteroids() {
      corners = 8;
      xCorners =  new int[corners];
      yCorners =  new int[corners];
      xCorners[0] = -1;
      yCorners[0] = -18; 
      xCorners[1] = 8; 
      yCorners[1] = -19; 
      xCorners[2] = 17;  
      yCorners[2] = -12;
      xCorners[3] = 17;
      yCorners[3] = 16; 
      xCorners[4] = 1; 
      yCorners[4] = 17; 
      xCorners[5] = -17; 
      yCorners[5] = 12;
      xCorners[6] = -15; 
      yCorners[6] = -4;
      xCorners[7] = -5; 
      yCorners[7] = -11; 
      myColor = 75;
      myCenterX = (int)(Math.random()*800);
      myCenterY = (int)(Math.random()*800);;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
      rotSpd = 3;
      asMoveX = (int)(Math.random()*2+1);
      asMoveY = (int)(Math.random()*2+1);
      prob = (int)(Math.random()*2);
    }
    public void setX(int x) {myCenterX = x;}
    public int getX() {return (int)myCenterX;}   
    public void setY(int y) {myCenterY = y;}   
    public int getY(){return (int)myCenterY;}    
    public void setDirectionX(double x){myDirectionX = x;}  
    public double getDirectionX(){return myDirectionX;}   
    public void setDirectionY(double y){myDirectionY = y;} 
    public double getDirectionY(){return myDirectionY;}  
    public void setPointDirection(int degrees){myPointDirection = degrees;}   
    public double getPointDirection(){return myPointDirection;}
    public void move() {
      
      rotate(rotSpd);
      super.move();
      if(prob == 0) {
        myCenterX+= asMoveX;
        myCenterY+= asMoveY;
      } else {
        myCenterX-= asMoveX;
        myCenterY-= asMoveY;
      }
      
    }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

