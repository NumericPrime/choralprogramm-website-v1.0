class Schluessel_ {
  boolean f=true;
  int a=0;
  Schluessel_(int s, boolean sch) {
    f=sch;
    a=s;
  }
  void paint() {
    rect(35, 5+dz*a, 3, 10);
    rect(35, 15+dz*a, 6, 3);
    rect(35, 2+dz*a, 6, 3);
    if (f==true) {
      rect(28, 8+dz*a, 4, 4);
      line(28, dn*1.5+dz*a, 28, 8+20*a);
    }
  }
  void play(int r){
    int gz=-(2*a+(f?3:-1));
    for(int i=0;i<gtoene.length;i++) {
      int resetp=gtoene.length-1;
    stoene[i]=gtoene[i+gz-((i+gz>resetp)?7:0)+((i+gz<0)?7:0)]*((i+gz<0)?2:1)*((i+gz>resetp)?0.5:1);
   // stoene[i]=gtoene[i+gz-((i+gz]
    toene[i]=stoene[i];
    }println(toene);
  }
  void paint(int r) {
    rect(15+ds*r, 5+dz*a, 3, 10);
    rect(15+ds*r, 15+dz*a, 6, 3);
    rect(15+ds*r, 2+dz*a, 6, 3);
    if (f==true) {
      rect(ds*r+8, 8+dz*a, 4, 4);
      line(ds*r+8, 8+dz*a, ds*r+8, 8+dn+dz*a);
    }
  }
}