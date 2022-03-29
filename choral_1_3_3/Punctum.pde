class Punctum_ {
  int n;
  int pcount=1;
  boolean bn;
  int t=0;
  Punctum_(int u, boolean b) {
    n=u;
    bn=b;
  }
  void play(int r) {
    if (t!=3) amp2(dauer/(bn?2:1)*((t==2)?1.5:1), toene[offset_toene+n]);
    toene[offset_toene+n]=stoene[offset_toene+n];
    //println("pun"+n);
  }
  Punctum_(int u, boolean b, int t) {
    n=u;
    bn=b;
    this.t=t;
  }
  void paint(int nr) {
    int l=0;
    int tl=7;
    if (bn==true) {
      float offs=2.4;
      quad(nr*ds+1+tl, 30+((float) n)*dz/2+10-offs+(dz/2-10+offs)
      , nr*ds-6+tl+offs, 30+((float) n)*dz/2+(dz/2-10+offs),
      nr*ds+1+tl, 30+((float) n)*dz/2-10+offs+(dz/2-10+offs),
      nr*ds+8+tl-offs, 30+((float) n)*dz/2+(dz/2-10+offs));
    } else {
      if (n<-1) line(nr*ds-5, 30+generaloffsety+((float) n)*dz/2-10+(dz-dn)/2+dn/2,nr*ds+dn+5, 30+((float) n)*dz/2-10+(dz-dn)/2+dn/2);
      if (t==2) line(nr*ds+dn, 30+generaloffsety+((float) n)*dz/2-10+(dz-dn)/2, nr*ds+dn, 30+((float) n)*dz/2+30+(dz-dn)/2);
      if (t!=3) rect(nr*ds, 30+generaloffsety+((float) n)*dz/2-10+(dz-dn)/2, dn, dn);
      if (t==3)line(660/scg-ds/2+dn/2, 30+generaloffsety+((float) n)*dz/2+3+(dz-dn)/2, 660/scg-ds/2+dn/2, 30+generaloffsety+((float) n)*dz/2-30+(dz-dn)/2);
      if (t==3) rect(660/scg-ds/2, 30+generaloffsety+((float) n)*dz/2-10+(dz-dn)/2, dn/2, dn-2);
    }
  }
}