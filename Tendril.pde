class Tendril
{
  public final static int NUM_SEG = 10; //How many segments
  private int myLen;
  private double myAngle, myX, myY;
  
  /**
   Class constructor
   len is how many segments in this tendril (each a fixed length, 4 is a good start)
   theta is tendril starting angle in radians 
   x, y  is the starting (x,y) coordinate
   */
  public Tendril(int len, double theta, double x, double y)
  {
    myX = x;
    myY = y;
    myAngle = theta;
    myLen = len;
  }
  public void show()
  {
    double startX = myX, startY = myY;
    double endX = 0, endY = 0;
    stroke((int)(255-myLen*10), 77,163);
    for (int i = 0; i < 10; i ++) {
      endX = startX + (double)(myLen * Math.cos(myAngle+Math.random()/5));
      endY = startY + (double)(myLen * Math.sin(myAngle+Math.random()/5));
      line((float)startX, (float)startY, (float)endX, (float)endY);
      startX = endX;
      startY = endY;
    }
    if (myLen <= 1) return;
    Cluster c = new Cluster(myLen/3, endX, endY);
    c.show();
  }
}
