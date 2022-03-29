int headoffset=0;
class Page {
  Zeile[] zeilen;
  Page() {
  }
  int tt=0;
  float scal=0.5;
  String text;
  void insert(String[] str) {
    warnings.setText("Keine Fehler gefunden");
    if (str.length>0) {
      String scale[]=str[0].split(" ");
      if (scale[0].equals("scal")) try {
        scal=float(scale[1]);
        if (scal==0) scal=0.65;
      }
      catch(Exception e) {
        if (warnings.getText().equals("Keine Fehler gefunden")) warnings.setText("");
        warnings.setText(warnings.getText()+"\n"+"Fehler in Zeile "+0);
      }
      if (str.length>1) { 
        try {
          scale=str[1].split(" ");
          tt=int(scale[1]);
          if (scale[0].equals("text"))
            text=str[1].substring(7, str[1].length()); else text="";
        }
        catch(Exception e) {
          if (warnings.getText().equals("Keine Fehler gefunden")) warnings.setText("");
          warnings.setText(warnings.getText()+"\n"+"Fehler in Zeile "+1);
        }
      }
      for (int j=1; j<45; j++) {
        for (int i=0; i<str.length; i++) {
          String kl="";
          for (int k=1; k<j; k++) kl+="+";
          str[i]=rep(str[i], "\\+"+(j-1)+"\\+", kl);
        }
      }
      scg=scal;
      String doc="";
      for (int i=0; i<str.length; i++) {
        int in=str[i].indexOf("+");
        if (in!=-1&&in!=str[i].length()) {
          if(i+1<str.length) str[i+1]+="\n"+str[i].substring(in+1, str[i].length());
          str[i]=str[i].substring(0, in);
        }
      }
      for (int i=0; i<str.length; i++) doc+=str[i]+((i==str.length-1)?"":"\n");
      doc=rep(doc,"#","gap \n");
      doc=rep(doc,"$","gap \n");
      doc=rep(doc,"<!!>","\nM2\n");
      String lines[]=doc.split("newline");
      zeilen=new Zeile[lines.length];
      for (int i=0; i<zeilen.length; i++) {
        //println(i);
        if (i==0) zeilen[i]=new Zeile(); 
        else zeilen[i]=new Zeile(zeilen[i-1].x, null);
        zeilen[i].insert(lines[i].split("\n"));

        //println(zeilen[i].x==null);
      }
    }
  }
  void paint() {
    generaloffsety=(int)(dz-20)/2;
    scale(scal);
    textSize(htextsize);
    if (text!=null&&!text.equals("")) {
      textAlign(LEFT);
      if (tt==0)  text(text, 50/scal, 80/scal);
      textAlign(CENTER);
      if (tt==1)  text(text, width/2/scal, 80/scal);
      textAlign(RIGHT);
      if (tt==2)  text(text, (width-50)/scal, 80/scal);
    } else
      translate(0, -(headoffset+70+60*dz/20));
    textSize(ts);
    textAlign(LEFT);
    for (int i=0; i<zeilen.length; i++) {
      //println(i);
      translate(0, headoffset+(70)+60*dz/20);
      zeilen[i].scal=scal;
      zeilen[i].paint();
    }
    translate(0, 0);
  }
  void play() {
    amp2.clear();
    del2.clear();
    amp2.add(-1.0);
    del2.add(0.1);
    for (int i=0; i<zeilen.length; i++) {
      zeilen[i].play();
    }
    amp2.add(-1.0);
    del2.add(0.1);
    abort=false;
  }
}