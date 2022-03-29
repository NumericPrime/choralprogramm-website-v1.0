class B_ {
  String text;
  int n;
  int n1;
  int n2;
  B_(int h) {
    n=h;
  }
  void play(int r){
    /*if(!pythag)toene[offset_toene+n]/=pow(2,(float)((float)1/(float)13));else */
    toene[offset_toene+n]/=(float)((float)(256)/(float)(243));
  }
  void paint(int nr) {
    strokeWeight(2);
    int l=0;
    //textMode(CENTER);
    //text(text,nr*18+50,120);
    if (n<n1) l=20;
    line(nr*ds, 30+((float) n)*dz/2-15+generaloffsety, nr*ds, 30+((float) n)*dz/2+5+generaloffsety );
    line(nr*ds, 30+((float) n)*dz/2+5+generaloffsety, nr*ds+7, 30+((float) n)*dz/2+8+generaloffsety );
    line(nr*ds+7, 30+((float) n)*dz/2+8+generaloffsety, nr*ds+7, 30+((float) n)*dz/2 +generaloffsety);
    line(nr*ds, 30+((float) n)*dz/2-3+generaloffsety, nr*ds+7, 30+((float) n)*dz/2 +generaloffsety);
    strokeWeight(1);
  }
}