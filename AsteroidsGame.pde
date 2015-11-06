//your variable declarations here
SpaceShip ship;
Fire fuego;
Star[] bunch = new Star[750];
public void setup() 
{
  //your code here
  size(800,800);
  ship = new SpaceShip();
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
  fuego.move();
}
public void keyPressed() {
  int num = (int)(Math.random()*801);
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
    ship.setY(num);
    fuego.setX(num);
    fuego.setY(num);
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
      myColor = 75;
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

