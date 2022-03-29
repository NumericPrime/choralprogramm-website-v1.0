class Qui {
  int h, o;
  boolean over=false;
  boolean over2=false;
  float off=1;
  float ds_q=3.3;
  float c=3;
  float a_q=ds_q*2/dn;
  float len=((float)dn)/c;
  Qui(int h, int o) {
    this.h=h;
    h=1;
    this.o=o;
  }
  void play(int r){}
  void paint(int nr) {
    nr-=off;
    int v=-o*dn;
    //rect(nr*ds, 30+((float) h)*dz/2-10+(dz-dn)/2, dn, dn);
    stroke(255,255,255,255);
    fill(255);
    float y1=30+generaloffsety+((float) h)*dz/2-10+(dz-dn)/2+(over?1:0)-(over2?2:0);
    float y2=30+generaloffsety+((float) h)*dz/2-10+(dz-dn)/2+dn-(over2?3:0)-1;
    //for (int i=1; i<dn; i+=3) line(nr*ds+i-v, 30+((float) h)*dz/2-10+(dz-dn)/2-1+(over?1:0)-(over2?2:0),nr*ds+i-v, 30+((float) h)*dz/2-10+(dz-dn)/2+1+(over?1:0)-(over2?2:0));
    //for (int i=2; i<dn; i+=3) line(nr*ds+i-v, 30+((float) h)*dz/2-10+(dz-dn)/2+dn-(over2?3:0)-2,nr*ds+i-v, 30+((float) h)*dz/2-10+(dz-dn)/2+dn-(over2?3:0));
    //for (int i=0; i<dn; i++) line(nr*ds+i-v,y1,nr*ds+i-v,y1+ds_q-(i*a_q)%ds_q);
    //for (int i=0; i<dn; i++) line(nr*ds+i-v,y2,nr*ds+i-v,y2-(i*a_q)%ds_q);
    for (int i=0; i<c; i++) triangle(nr*ds-v+len*i+len-1,y1,nr*ds-v+len*i,y1,nr*ds-v+len*i,y1+ds_q-1);
    for (int i=0; i<c; i++) triangle(nr*ds-v+len*i+len,y2-ds_q,nr*ds-v+len*i,y2+1,nr*ds-v+len*i+len,y2+1);
    fill(0);
    stroke(0);
  }
}