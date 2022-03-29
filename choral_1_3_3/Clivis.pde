class Clivis {
  String text;
  int n;
  int n1;
  boolean over=false;
  int l=dn;
  Clivis(int u, int o, String te) {
    n=u;
    n1=o;
    text=te;
  }
  void play(int r) {
    amp2(dauer*0.8, toene[offset_toene+(int)n]);
    amp2(dauer*0.7, toene[offset_toene+(int)n1]);
    toene[offset_toene+n]=stoene[offset_toene+n];
    toene[offset_toene+n1]=stoene[offset_toene+n1];
  }
  void paint(int nr) {
    //textMode(CENTER);
    //text(text,nr*dn+50,120);
    rect(nr*ds+10*text.length()+l, 30+((float) n1)*dz/2-10+generaloffsety, dn, dn);
    rect(nr*ds+10*text.length(), 30+((float) n)*dz/2-10+(dz-dn)/2+generaloffsety, dn, dn);
    line(nr*ds+10*text.length()+dn, 30+((float) n1)*dz/2-10+(dz-dn)/2+generaloffsety, nr*ds+10*text.length()+dn, 30+((float) n)*dz/2-10+generaloffsety+dn);
    if (n1>n) line(nr*ds, 30+((float) n)*dz/2-10+(dz-dn)/2+generaloffsety, nr*ds, 30+((float) n)*dz/2-10+(dz-dn)/2+3*dn+generaloffsety);
  }
}