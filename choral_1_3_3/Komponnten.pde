class Komponenten {
  float pcount=1;
  int n[]={0, 0};
  int l;
  String storage="";
  Pes_ p1_;
  Punctum_ pi;
  Torculus_ t_;
  Paus_ p;
  Schluessel_ s;
  B_ b=null;
  Qui q;
  Clivis cl=null;
  Komponenten(Pes_ p, Punctum_ pu, Torculus_ t) {
    p1_=p;
    if (p!=null) if (p.n<p.n1) {
      pcount=2;
    } else {
      pcount=1;
    }
    pi=pu;
    if (pi!=null) pcount=1;
    t_=t;
  }
  Komponenten(Pes_ p) {
    p1_=p;
    if (p!=null) if (p.n<p.n1) {
      pcount=2;
    } else {
      pcount=1;
    }
    pi=null;
    t_=null;
  }
  Komponenten(Clivis p) {
    p1_=null;
    pcount=2;
    pi=null;
    t_=null;
    cl=p;
  }
  Komponenten(Punctum_ pu) {
    p1_=null;
    pi=pu;
    t_=null;
    pcount=(pu.t==3)?0:1;
  }
  Komponenten(Qui q) {
    this.q=q;
    pcount=0;
  }
  Komponenten(B_ b) {
    p1_=null;
    pi=null;
    t_=null;
    this.b=b;
  }
  Komponenten(Torculus_ t) {
    p1_=null;
    pi=null;
    t_=t;
    pcount=4-t.tp-2+t.dk;
  }
  Komponenten(Paus_ p) {
    this.p=p;
    pcount=2;
  }
  Komponenten(Schluessel_ s) {
    this.s=s;
    pcount=2;
  }
  Komponenten(String st) {
    storage=st;
    pcount=0;
  }
  color m2=color(0, 0, 0);
  Komponenten(color m) {
    pcount=0;
    this.m2=m;
    this.m3=m;
  }
  color m3=color(0, 0, 0);
  Komponenten(color m, color m2) {
    pcount=0;
    this.m2=m;
    this.m3=m2;
  }
  Komponenten() {
    pcount=1;
  }
  void paint(int r) {
    if (p!=null) p.paint(r);
    if (p1_!=null) p1_.paint(r);
    if (pi!=null) pi.paint(r);
    if (t_!=null) t_.paint(r);
    if (b!=null) b.paint(r);
    if (s!=null) s.paint(r);
    if (q!=null) q.paint(r);
    if (cl!=null) cl.paint(r);
    if (!storage.equals("")) text(storage, r*ds, 70+60*(dz)/20+ts-20+offsetText);
    //if(p!=null||p1_!=null||pi!=null||t_!=null||b!=null||s!=null||q!=null||!storage.equals("")){
    if (millis()%600<=300) {
      fill(m2);
      stroke(m2);
    } else {
      fill(m3);
      stroke(m3);
    }
    // }
  }
  void play(int r) {
    if (!abort) if (p!=null) p.play(r);
    if (!abort) if (p1_!=null) p1_.play(r);
    if (!abort) if (pi!=null) pi.play(r);
    if (!abort) if (t_!=null) t_.play(r);
    if (!abort) if (b!=null) b.play(r);
    if (!abort) if (s!=null) s.play(r);
    if (!abort) if (q!=null) q.play(r);
    if (!abort) if (cl!=null) cl.paint(r);
  }
}