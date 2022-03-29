class Group {
  String text="";
  float pk=0;
  int l=0;
  int lx=0;
  Komponenten k[];
  Group(Komponenten[] n, String t, int x) {
    text=t;
    k=n;
    for (int i=0; i<n.length; i++) if (n[i]!=null) pk+=n[i].pcount;
    pk=max(pk, text.length())+x;
    lx=x;
  }
  //int leng=text.length();
  void paint() {

    l=lx;
    text(text, lx*ds, 130);
    for (int i=0; i<k.length; i++) {
      if (k[i]!=null) k[i].paint(l);
      if (k[i]!=null) l+=k[i].pcount;
    }
  }
  void play() {

    l=lx;
    text(text, lx*ds, 130);
    for (int i=0; i<k.length; i++) {
      if (k[i]!=null) k[i].play(l);
      if (k[i]!=null) l+=k[i].pcount;
    }
  }
}