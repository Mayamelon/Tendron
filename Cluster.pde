public class Cluster
{
    public final static int NUM_STEMS = 7; //number of tendrils per cluster
    
    private Tendril[] ts = new Tendril[7];

    public Cluster(int len, double x, double y)
    {
      for (int i = 0; i < 7; i++) {
        ts[i] = new Tendril(len, Math.PI * 2 * i / 7, x, y);
      }
    }
    public void show() {
      for (int i = 0; i < 7; i++) {
        ts[i].show();
      }
    }
}
