class Zeile {
  float scal=0.5;
  Schluessel_ x;
  Group gr;
  Zeile() {
  }
  Zeile(Schluessel_ sc, Group g) {
    gr=g;
    x=sc;
  }
  void play() {
    //println("sequenze start");
    //println(x==null&&gr==null);
    x.play(0);
    gr.play();
    //thread("requestData");
    line(30, 10+dz, 660/scal, 10+dz);
    line(30, 10+2*dz, 660/scal, 10+2*dz);
    line(30, 10+3*dz, 660/scal, 10+3*dz);
    line(30, 10+4*dz, 660/scal, 10+4*dz);
  }
  void paint() {
    //println("sequenze start");
    //println(x==null&&gr==null);
    x.paint();
    gr.paint();
    //thread("requestData");
    line(30, 10+dz, 660/scal, 10+dz);
    line(30, 10+2*dz, 660/scal, 10+2*dz);
    line(30, 10+3*dz, 660/scal, 10+3*dz);
    line(30, 10+4*dz, 660/scal, 10+4*dz);
  }

  void insert(String[] p) {
    Schluessel_ sch=new Schluessel_(0, true);
    // println(p.length);
    if (p.length>0) {
      String tr="";
      for (int i=0; i<p.length; i++) tr+=p[i]+"\n";
      //jtp.setText(tr);
      for (int i=0; i<p.length; i++) if(!p[i].split(" ")[0].equals("!-!")) {
        String st=p[i]+" ";
        st=rep(st, " C", " 8");
        st=rep(st, " D", " 7");
        st=rep(st, " E", " 6");
        st=rep(st, " F", " 5");
        st=rep(st, " G", " 4");
        st=rep(st, " A", " 3");
        st=rep(st, " H", " 2");
        st=rep(st, " c", " 1");
        st=rep(st, " d", " 0");
        st=rep(st, " e", " -1");
        String[] splitted=st.split("b");
        if (splitted.length>0)
          for (int l=0; l<splitted.length-1; l++) {
            try {
              String bef=splitted[l].substring(splitted[l].length()-1, splitted[l].length());
              boolean cond=false;
              for (int k=0; k<10; k++) if (bef.equals(k+"")) cond=true;
              if (cond||bef.equals("e")) {
                st="b "+bef+"\n"+rep(st, bef+"b", bef);
               // println(st);
              }
            }
            catch(Exception e) {
            }
          }
        p[i]=st;
      }
      tr="";
      //  println(p.length);
      for (int i=0; i<p.length; i++) tr+=p[i]+"\n";
      p=tr.split("\n");
      Komponenten komp[]=new Komponenten[p.length];
      // println(x==null);
      for (int i=0; i<p.length; i++) {
        try {
          switch(p[i].split(" ")[0]) { 
          case "scal": 
            break;
          case "text": 
            break;
          case "M": 
            komp[i]=new Komponenten(markiert);
            break;
          case "M2": 
            komp[i]=new Komponenten(markiert,color(255,255,255));
            break;
          case "pun": 
          //  println(p[i]);
            if (p[i].split(" ").length==1) komp[i]=new Komponenten(p[i]); 
            else if (p[i].split(" ").length==2) komp[i]=new Komponenten(new Punctum_(int(p[i].split(" ")[1]), false, 0));
            else
              komp[i]=new Komponenten(new Punctum_(int(p[i].split(" ")[1]), (int(p[i].split(" ")[2])==1), int(p[i].split(" ")[2])));
            break; 
          case "b": 
           // println(p[i]);
            if (p[i].split(" ").length==1) komp[i]=new Komponenten(p[i]); 
            else
              komp[i]=new Komponenten(new B_(int(p[i].split(" ")[1])));
            break; 
          case "q":
            if (p[i].split(" ").length==1) komp[i]=new Komponenten(p[i]);  
            else if (p[i].split(" ").length==2) {
              komp[i]=new Komponenten(new Qui(int(p[i].split(" ")[1]), 0));
            } else 
            komp[i]=new Komponenten(new Qui(int(p[i].split(" ")[1]), int(p[i].split(" ")[2]))); 
            komp[i].q.off=komp[i-1].pcount;
            Pes_ subj=komp[i-1].p1_;
            if (subj!=null&&(subj.n-subj.n1)<2&&subj.n>subj.n1) {
              if(komp[i].q.h==subj.n) komp[i].q.over=true;
              if(komp[i].q.h==subj.n1) komp[i].q.over2=true;
            }
            break;
          case "!-!":
            overrideoption(p[i].replaceFirst("!-! ",""));
          break;
          case "pes": 
           // println(p[i]);
            if (p[i].split(" ").length==1) komp[i]=new Komponenten(p[i]); 
            else if (p[i].split(" ").length==3){
              komp[i]=new Komponenten(new Pes_(int(p[i].split(" ")[1]), int(p[i].split(" ")[2]), ""));} 
            else if (int(p[i].split(" ")[3])==0)  komp[i]=new Komponenten(new Pes_(int(p[i].split(" ")[1]), int(p[i].split(" ")[2]), ""));
              else if(int(p[i].split(" ")[3])==1) komp[i]=new Komponenten(new Clivis(int(p[i].split(" ")[1]), int(p[i].split(" ")[2]), ""));
            else if (int(p[i].split(" ")[3])==2){
              komp[i]=new Komponenten(new Torculus_(int(p[i].split(" ")[1]), int(p[i].split(" ")[1]), int(p[i].split(" ")[2]), "", 1));
              komp[i].t_.dk=dn/ds;
            }
            break;
          case "<":
            if (p[i].split(" ").length==5) komp[i]=new Komponenten(new Torculus_(int(p[i].split(" ")[1]), int(p[i].split(" ")[2]), int(p[i].split(" ")[3]), "", int(p[i].split(" ")[4])));
            else if (p[i].split(" ").length==4) if (int(p[i].split(" ")[3])==0)  komp[i]=new Komponenten(new Pes_(int(p[i].split(" ")[1]), int(p[i].split(" ")[2]), ""));
            else {
              komp[i]=new Komponenten(new Torculus_(int(p[i].split(" ")[1]), int(p[i].split(" ")[1]), int(p[i].split(" ")[2]), "", 1));
              komp[i].t_.dk=dn/ds;
            }else 
            if (p[i].split(" ").length==1) komp[i]=new Komponenten(p[i]); 
            else if (p[i].split(" ").length==2) komp[i]=new Komponenten(new Punctum_(int(p[i].split(" ")[1]), false, 0));
            else
              komp[i]=new Komponenten(new Punctum_(int(p[i].split(" ")[1]), (int(p[i].split(" ")[2])==1), int(p[i].split(" ")[2])));
            

            break;
          case "torv": 
          //  println(p[i]);
            if (p[i].split(" ").length==1) komp[i]=new Komponenten(p[i]); 
            else {
              komp[i]=new Komponenten(new Torculus_(int(p[i].split(" ")[1]), int(p[i].split(" ")[1]), int(p[i].split(" ")[2]), "", 1));
              komp[i].t_.dk=dn/ds;
            }

            break; 
          case "tor": 
          //  println(p[i]);
            if (p[i].split(" ").length==1) komp[i]=new Komponenten(p[i]); 
            else
            {
              if (p[i].split(" ").length==4) komp[i]=new Komponenten(new Torculus_(int(p[i].split(" ")[1]), int(p[i].split(" ")[2]), int(p[i].split(" ")[3]), ""));
              else komp[i]=new Komponenten(new Torculus_(int(p[i].split(" ")[1]), int(p[i].split(" ")[2]), int(p[i].split(" ")[3]), "", int(p[i].split(" ")[4])));
            }
            break; 
          case "sc":
//println(p[i]);
            if (x!=null) {
              komp[i]=new Komponenten(new Schluessel_(int(p[i].split(" ")[1]), int(p[i].split(" ")[2])==1));
            } else {
              if (int(p[i].split(" ")[2])==0)x =new Schluessel_(int(p[i].split(" ")[1]), false);
              if (int(p[i].split(" ")[2])==1) x=new Schluessel_(int(p[i].split(" ")[1]), true);
            }
            break; 
          case "pa":
           // println(p[i]);
            if (p[i].split(" ").length==1) komp[i]=new Komponenten(p[i]); 
            else
              komp[i]=new Komponenten(new Paus_(int(p[i].split(" ")[1])));
            break; 
          case "gap":
            komp[i]=new Komponenten();
            break; 
          case "#":
            komp[i]=new Komponenten();
            break; 
          case "'gap":
            komp[i]=new Komponenten("gap");
            break; 
          case "'pa":
            komp[i]=new Komponenten("pa");
            break;
          case "'pes":
            komp[i]=new Komponenten("pes");
            break; 
          case "'tor":
            komp[i]=new Komponenten("tor");
            break; 
          case "'pun":
            komp[i]=new Komponenten("pun");
            break; 
          default: 
            komp[i]=new Komponenten(p[i]);
          }
        }
        catch(Exception e2) {
          if (warnings.getText().equals("Keine Fehler gefunden")) warnings.setText("");
          warnings.setText(warnings.getText()+"\n"+"Fehler in Zeile "+i+": "+p[i]);
        }
      }

      // println(x==null);
      gr= new Group(komp, "", 4);
    }
    if (x==null) x=sch;
   // println("sequenze complete");
  }
}