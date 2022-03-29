class Paus_ {
  int l=0;
  Paus_(int l) {
    this.l=l;
  }
  void play(int r){
  amp2((dauer/4*7),-1.0);
  }
  void paint(int pos) {
    if (l==1) line(pos*ds+10, 30-dz/4+generaloffsety*2, pos*ds+10, 30+dz/4+generaloffsety*2);
    if (l==2) line(pos*ds+10, 30+dz/2+generaloffsety*2, pos*ds+10, 30-dz/2+3*dz+generaloffsety*2);
    if (l==3) line(pos*ds+10, 30+generaloffsety*2, pos*ds+10, 30+3*dz+generaloffsety*2);
    if (l==4) line(pos*ds+7, 30+generaloffsety*2, pos*ds+7, 30+3*dz+generaloffsety*2);
    if (l==4) line(pos*ds+12, 30+generaloffsety*2, pos*ds+12, 30+3*dz+generaloffsety*2);
  }
}