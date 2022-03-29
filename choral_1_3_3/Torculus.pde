class Torculus_ {
  float dk=1;
  String text;
  float n;
  int n1;
  int n2;
  int tp=0;
  Torculus_(int u, int m, int o, String te) {
    n=u;
    n1=m;
    n2=o;
    text=te;
  }
  Torculus_(int u, int m, int o, String te, int tp) {
    n=u;
    n1=m;
    n2=o;
    text=te;
    this.tp=tp;
  }
  void play(int nr) {
    amp2(dauer*0.6*((tp>0)?2.4:1), toene[offset_toene+(int)n]);
    amp2(dauer*0.6*((tp>0)?2.4:1), toene[offset_toene+(int)n1]);
    amp2(dauer*0.5, toene[offset_toene+(int)n2]);
    toene[offset_toene+(int)n]=stoene[offset_toene+(int)n];
    toene[offset_toene+n1]=stoene[offset_toene+n1];
    toene[offset_toene+n2]=stoene[offset_toene+n2];
  }
  void paint(int nr) {
    if (tp==0) {
      int l=0;
      //textMode(CENTER);
      //text(text,nr*dn+50,120);
      if (n<n1) l=20;
      rect(nr*ds, 30+generaloffsety+((float) n)*dz/2-10+(dz-dn)/2, dn, dn);
      rect(nr*ds+10*text.length()+dn, 30+generaloffsety+((float) n1)*dz/2-10+(dz-dn)/2, dn, dn);
      rect(nr*ds+10*text.length()+dn*2, 30+generaloffsety+((float) n2)*dz/2-10+(dz-dn)/2, dn, dn);
      line(nr*ds+dn, 30+generaloffsety+((float) n)*dz/2-8+(dz-dn)/2, nr*ds+dn, 30+generaloffsety+((float) n1)*dz/2+dn-10+(dz-dn)/2);
      line(nr*ds+dn*2, 30+generaloffsety+((float) n1)*dz/2-10+(dz-dn)/2, nr*ds+dn*2, 30+generaloffsety+((float) n2)*dz/2-10+dn+(dz-dn)/2);
    } else {
      fill(0);
      float v1=30+generaloffsety+((float) n)*dz/2-dn/2-2;
      float v2=30+generaloffsety+((float) n1)*dz/2-dn/2;
      float v3=30+generaloffsety+((float) n2)*dz/2-dn/2;
      if (v1!=v2) line(nr*ds, v1, nr*ds, v1+dn*2);
      float numb=1;
      if (n==n1) {
        v1=30+generaloffsety+((float) n)*dz/2-dz/2;
        v2=30+generaloffsety+((float) n1)*dz/2+dz-dz/2;
        dk=0.5;
      }
      for (int i=0; i<=dk*ds; i++) {
        float pos=sin(PI/2*numb*i/(dk*ds))/sin(PI/2*numb);
        if (n!=n1) { 
          line(nr*ds+i, v1+(v2-v1)*pos+3, nr*ds+i, v1+(v2-v1)*pos+dn+2*(n1-n)*(1-pos)*dn*dn/(18*18));
        } else 
        line(nr*ds+i, v1+(dz-dn)*pos+3, nr*ds+i, v1+(dz-dn)*pos+dn);
      }
      if (n!=n1) line(nr*ds+dk*ds, v2+dn, nr*ds+dk*ds, v3+(dz-dn/2)/2-dn/4); 
      else line(nr*ds+dk*ds, v2, nr*ds+dk*ds, v3+(dz-dn/2)/2-dn/4);
      rect(nr*ds+dk*ds-dn/2, v3+(dz-dn/2)/2-dn/4-(abs(n1-n2)==1?1:0), dn/2, dn/2);
    }
  }
}