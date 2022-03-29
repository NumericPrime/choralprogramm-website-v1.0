class Pes_ {
  String text;
  int n;
  int n1;
  boolean over=false;
  int l=0;
  Pes_(int u, int o, String te) {
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
    if (n<n1||over) l=dn;
    //textMode(CENTER);
    //text(text,nr*dn+50,120);
    //println(nr,ds,l,dz,dn,n1,n);
    rect(nr*ds+10*text.length()+l, 30+generaloffsety+((float) n1)*dz/2-10+(dz-dn)/2-((n-n1)<2&&n>n1?0:0), dn, dn/((n-n1)<2&&n>n1?1.3:1));
    rect(nr*ds+10*text.length(), 30+generaloffsety+((float) n)*dz/2-10+((n-n1)<2&&n>n1?3:0)+(dz-dn)/2, dn, dn/((n-n1)<2&&n>n1?1.3:1));
    line(nr*ds+10*text.length()+dn, 30+generaloffsety+((float) n1)*dz/2-10+(dz-dn)/2-((n-n1)<2&&n>n1?0:0), nr*ds+10*text.length()+dn, 30+((float) n)*dz/2-10+((n-n1)<2&&n>n1?3:0)+dn/((n-n1)<2&&n>n1?1.3:1));
    if (n1>n) line(nr*ds, 30+generaloffsety+((float) n)*dz/2-10+(dz-dn)/2, nr*ds, 30+((float) n)*dz/2-10+(dz-dn)/2+3*dn+generaloffsety);
  }
}