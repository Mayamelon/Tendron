Boolean mode; // true is tendron, false is fractal tree

void setup() {
  size(1280, 720);
  mode = true;
  background(0, 0, 0);
  //noLoop();
}

void draw() {
  background(0, 0, 0);
  if (mode) {
      Cluster c = new Cluster(27, width/2, height/2);
      c.show();
  } else {
      for (int i = 0; i < 7; i++) {
        fractalTree(width/2, height, height/2, -Math.PI / 2);
      }
  }
}

public void mousePressed() {
  mode = !mode;
}

public void fractalTree(double x, double y, double siz, double dir) {
  double startX = x, startY = y;
  double endX = 0, endY = 0;
  stroke((int)(255-siz*10), 77,163);
  endX = startX + (double)(siz * Math.cos(dir));
  endY = startY + (double)(siz * Math.sin(dir));
  line((float)startX, (float)startY, (float)endX, (float)endY);
  if (siz <= 2) return;
  fractalTree(endX, endY, siz/2, dir);
  fractalTree(endX, endY, siz/2, dir + Math.PI / 3);
  fractalTree(endX, endY, siz/2, dir - Math.PI / 3);
}
