Mode mode;

void setup() {
  size(1280, 720);
  mode = Mode.TENDRON;
}

void draw() {
  background(0, 0, 0);
  switch (mode) {
    case TENDRON:
      for (int i = 0; i < 7; i++) {
        tendril(width/2, height/2, 27, Math.PI * 2 * i / 7);
      }
      break;
    case FRACTAL_TREE:
      for (int i = 0; i < 7; i++) {
        fractalTree(width/2, height, height/2, -Math.PI / 2, Math.random()*Math.PI/24 - Math.PI/48);
      }
      break;
  }
}

public void mousePressed() {
  if (mode == Mode.TENDRON) mode = Mode.FRACTAL_TREE;
  else mode = Mode.TENDRON;
}

public void tendril(double x, double y, double siz, double dir) {
  double startX = x, startY = y;
  double endX = 0, endY = 0;
  stroke((int)(255-siz*10), 77,163);
  for (int i = 0; i < 10; i ++) {
    endX = startX + (double)(siz * Math.cos(dir+Math.random()/5));
    endY = startY + (double)(siz * Math.sin(dir+Math.random()/5));
    line((float)startX, (float)startY, (float)endX, (float)endY);
    startX = endX;
    startY = endY;
  }
  if (siz <= 1) return;
  for (int i = 0; i < 7; i++) {
    tendril(endX, endY, siz/3, Math.PI * i * 2 / 7);
  }
}

public void fractalTree(double x, double y, double siz, double dir, double rand) {
  double startX = x, startY = y;
  double endX = 0, endY = 0;
  stroke((int)(255-siz*10), 77,163);
  endX = startX + (double)(siz * Math.cos(dir));
  endY = startY + (double)(siz * Math.sin(dir));
  line((float)startX, (float)startY, (float)endX, (float)endY);
  if (siz <= 2) return;
  fractalTree(endX, endY, siz/2, dir+rand, rand);
  fractalTree(endX, endY, siz/2, dir + Math.PI / 3 + rand, rand);
  fractalTree(endX, endY, siz/2, dir - Math.PI / 3 + rand, rand);
}

public static enum Mode {
  TENDRON,
  FRACTAL_TREE
}
