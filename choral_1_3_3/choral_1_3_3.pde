import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.text.*;
import processing.pdf.*;
import java.awt.*;
import java.awt.event.*;
float scg=0.5;
String inp="<";
String currentFileName="";
color markiert=color(200, 0, 0);
color noten=color(0, 0, 0);
final JTextArea  jtp=new JTextArea();
JButton jb=new JButton("Öffnen");
JButton jb2=new JButton("Speichern");
JButton jb3=new JButton("Pdf");
int ds=23;
int dz=20;
int dn=13;
int htextsize=80;
boolean pythag=false;
int offset_toene=2;
int schriftgroese=25;
float dauer=0.4;
String speicherort="Choraele";
float pythar[]={440*pow(256/243, 1)*pow(9/8, 3), 440*pow(256/243, 2)*pow(9/8, 1), 440*pow(256/243, 1)*pow(9/8, 1), 440*pow(9/8, 1), 440, 391*pow(9/8, -1), 349*pow(9/8, -2), 330*pow(256/243, -1)*pow(9/8, -2), 293330*pow(256/243, -1)*pow(9/8, -3), 262*pow(256/243, -1)*pow(9/8, -4), 247*pow(256/243, -2)*pow(9/8, -4), 220*pow(9/8, -1), 191*pow(9/8, -2), 175*pow(256/243, -1)*pow(9/8, -3), 165, 147, 131, 124, 110, 95, 87};
float pythag_toene[]={640, 576, 512, 480, 432, 432*0.888, 352, 320, 288, 256, 240, 216, 192, 176, 160, 144, 128, 120, 108, 96, 88};
float temp_toene[]={352*2, 659, 587, 523, 493, 440, 396, 352, 330, 293, 262, 247, 220, 191, 181, 175, 147, 131, 124, 110, 95, 90, 87};
float gtoene[]=temp_toene;
float stoene[]={352*2, 659, 587, 523, 493, 440, 396, 352, 330, 293, 262, 247, 220, 191, 181, 175, 147, 131, 124, 110, 95, 90, 87};
float toene[]={352*2, 659, 587, 523, 493, 440, 396, 352, 330, 293, 262, 247, 220, 191, 181, 175, 147, 131, 124, 110, 95, 90, 87};
float multip=1/2;
float generaloffsety=0;
String speicherort_neuerChoral="Choraele";
float amps[]={1, 0.7, 0.5, 0.5, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10};
import processing.sound.*;
boolean abort=false;
ArrayList<Float> amp2=new ArrayList();
ArrayList<Float> del2=new ArrayList();
String rep(String input, String in, String out) {
  // println(input+" in "+in+" out "+out);
  String ins[]=input.split(in);
  String ret="";
  if (ins.length==0) return input;
  for (int i=0; i<ins.length-1; i++) ret+=ins[i]+out;
  ret+=ins[ins.length-1];
  return ret;
}
void amp2(float del, float amp) {
  amp2.add(amp);
  del2.add(del);
  amp2.add(-1.0);
  del2.add(0.05);
}
boolean organ=true;/*
void amp(float del, float amp) {
 println(amp);
 SinOsc s=new SinOsc(this);
 SawOsc s2=new SawOsc(this);
 SawOsc s3=new SawOsc(this);
 SawOsc s4=new SawOsc(this);
 TriOsc s5=new TriOsc(this);
 TriOsc s6=new TriOsc(this);
 TriOsc s7=new TriOsc(this);
 SinOsc s8=new SinOsc(this);
 s.amp(amps[0]);
 if (!pythag) {
 s2.amp(amps[1]);
 s3.amp(amps[2]);
 s4.amp(amps[3]);
 s5.amp(amps[4]);
 s6.amp(amps[5]);
 s7.amp(amps[6]);
 s8.amp(amps[6]);
 } else {
 s3.amp(0.28);
 s5.amp(0.28);
 }
  /*s2.amp(0);
 s3.amp(0.18);
 s4.amp(0.2);
 s5.amp(0.0);
 s6.amp(0.0);*/
/*
  if (organ) {
 s.amp(3.5/4.5);
 s2.amp(4.25/4.5);
 s3.amp(2/4.5);
 s4.amp(1.5/4.5);
 s6.amp(4/4.5);
 s5.amp(0.3/4.5);
 s7.amp(3/4.5);
 s8.amp(1.5/4.5);
 }
 if (!abort) for (int i=0; i<oscs.length; i++) oscs[i].freq(amp*multip+amp*multip*i);
 if (!abort) for (int i=0; i<amps.length; i++) oscs[i].amp(amps[i]);
 if (!abort) for (int i=0; i<oscs.length; i++) oscs[i].play();
 if (!abort) delay((int)(del*1000));
 for (int i=0; i<oscs.length; i++) oscs[i].stop();
 if (!abort) delay(50);
 redraw();
 }*/

final Zeile z=new Zeile();
final Page page=new Page();
final JLabel warnings=new JLabel("Keine Fehler gefunden");
String file_in="unnamed.txt";
boolean begin=false;                                
JPanel jpan=new JPanel();
JFrame jf=new JFrame("Code");
JFrame jf1=new JFrame("Erklärung");
JScrollPane listScroller2 = new JScrollPane(jtp);
PGraphicsPDF pdf;
int ts=20;
int timer=0;
SinOsc oscs[]=new SinOsc[3500/250];
SinOsc oscs2[]=new SinOsc[3500/250];
SinOsc oscs3[]=new SinOsc[3500/250];
void setup() {
  for (int i=0; i<oscs.length; i++) oscs[i]=new SinOsc(this);
  for (int i=0; i<oscs.length; i++) oscs[i].amp(0);
  for (int i=0; i<oscs.length; i++) oscs2[i]=new SinOsc(this);
  for (int i=0; i<oscs.length; i++) oscs2[i].amp(0);
  for (int i=0; i<oscs.length; i++) oscs3[i]=new SinOsc(this);
  for (int i=0; i<oscs.length; i++) oscs3[i].amp(0);
  //for (int i=0; i<oscs.length; i++) oscs[i].add(1/(i+2));
  this.getSurface().setVisible(false);
  if (pythag) gtoene=pythag_toene;
  textSize(ts);
  readinsetup();
  page.scal=0.5;
  frameRate(30);
  size(700, 800);
  PImage titlebaricon = loadImage("Icon.png");
  println(titlebaricon.toString());
  surface.setIcon(titlebaricon);
  surface.setTitle("Choral");
  background(255);
  if (args!=null) fileSelected(new File(args[0])); 
  else {
    fileSelected(null);
    //selectInput("Öffnen:", "fileSelected");
  }
  scale(2.5);
}
boolean trigger_once=true;
int offsetText=0;
void overrideoption(String command) {
  String read[]={command};
  for (int i=0; i<read.length; i++) {
    String var2=read[i].split(":")[0].replace(" ", "");
    String par[]={};
    if (read[i].split(":").length>1) par=read[i].split(":")[1].replace(" ", "").split(" ");
    if (read[i].split(":").length>1) switch(var2) {

    case "Geschwindigkeit":
      dauer=0.4*float(par[0]);
      break;
    case "Tonverschiebung":
      multip=float(par[0]);
      break;
    case "Schriftgroese":
      schriftgroese=int(par[0]);
      break;
    case "SchriftgroeseUeberschrift":
      htextsize=int(par[0]);
      break;
    case "Text-Verschiebung":
      offsetText=int(par[0]);
      break;
    case "Liedtext-Groese":
      textSize(ts=int(par[0]));
      break;
    case "Notenabstand":
      ds=int(par[0]);
      break;
    case "Zeilenabstand":
      dz=int(par[0]);
      break;
    case "Notengroese":
      dn=int(par[0]);
      break;
    case "UeberschriftVerschiebung":
      headoffset=int(par[0]);
      println("Autoload");
      break;
    case "Pdf-Speicherort":
      speicherort=(" "+read[i]).split("Pdf-Speicherort")[1];
      println(speicherort);
      while (speicherort.substring(0, 1).equals(" ")||speicherort.substring(0, 1).equals(":")) {
        println(speicherort);
        speicherort=speicherort.substring(1, speicherort.length());
      }
      println(speicherort_neuerChoral);
      break;
    case "Amplitude-Grundton":
      amps[0]=float(par[0]);
      break;
    case "Amplitude-Oktave":
      amps[1]=float(par[0]);
      break;
    case "Amplitude-2Oktaven":
      amps[3]=float(par[0]);
      break;
    case "Amplitude-Quinte2Oktaven":
      amps[4]=float(par[0]);
      break;
    case "Amplitude-QuinteOktave":
      amps[2]=float(par[0]);
      break;
    case "Amplitude-Terz2Oktaven":
      amps[5]=float(par[0]);
      break;
    case "Choral-Speicherort":
    println("Hoppla");
      speicherort_neuerChoral=(" "+read[i]).split("Choral-Speicherort")[1];
      println(speicherort_neuerChoral);
      while (speicherort_neuerChoral.substring(0, 1).equals(" ")||speicherort_neuerChoral.substring(0, 1).equals(":")) {
        println(speicherort_neuerChoral);
        speicherort_neuerChoral=speicherort_neuerChoral.substring(1, speicherort_neuerChoral.length());
      }
      println(speicherort_neuerChoral);
      break;

    case "Amplitude-Oberton-1":
      amps[1]=float(par[1]);
      break;
    case "Amplitude-Oberton-2":
      amps[2]=float(par[2]);
      break;
    case "Amplitude-Oberton-3":
      amps[3]=float(par[3]);
      break;
    case "Amplitude-Oberton-4":
      amps[4]=float(par[4]);
      break;
    case "Amplitude-Oberton-5":
      amps[5]=float(par[5]);
      break;
    case "Amplitude-Oberton-6":
      amps[6]=float(par[6]);
      break;
    case "Amplitude-Oberton-7":
      amps[7]=float(par[7]);
      break;
    case "Amplitude-Oberton-8":
      amps[8]=float(par[8]);
      break;
    case "Amplitude-Oberton-9":
      amps[9]=float(par[9]);
      break;
    }
  }
}
void readinsetup() {
  String read[]=loadStrings("Einstellungen.ini");
  for (int i=0; i<read.length; i++) {
    String var2=read[i].split(":")[0].replace(" ", "");
    String par[]={};
    if (read[i].split(":").length>1) par=read[i].split(":")[1].replace(" ", "").split(" ");
    if (read[i].split(":").length>1) switch(var2) {
      /*"\n!-! Schriftgroese:"+ schriftgroese+"\n"+
       "!-! SchriftgroeseUeberschrift:"+ htextsize+"\n"+
       "!-! Text-Verschiebung:"+ offsetText+"\n"+
       "!-! Liedtext-Groese"+ ts+"\n"+
       "!-! Notenabstand"+ ds+"\n"+
       "!-! Zeilenabstand"+ dz+"\n"+
       "!-! Notengroese"+ dn
       */
    case "Geschwindigkeit":
      dauer=0.4*float(par[0]);
      break;
    case "Tonverschiebung":
      multip=float(par[0]);
      break;
    case "Schriftgroese":
      schriftgroese=int(par[0]);
      break;
    case "SchriftgroeseUeberschrift":
      htextsize=int(par[0]);
      break;
    case "Text-Verschiebung":
      offsetText=int(par[0]);
      break;
    case "UeberschriftVerschiebung":
      headoffset=int(par[0]);
      break;
    case "Liedtext-Groese":
      textSize(ts=int(par[0]));
      break;
    case "Notenabstand":
      ds=int(par[0]);
      break;
    case "Zeilenabstand":
      dz=int(par[0]);
      break;
    case "Notengroese":
      dn=int(par[0]);
      break;
    case "Pdf-Speicherort":
      speicherort=(" "+read[i]).split("Pdf-Speicherort")[1];
      println(speicherort);
      while (speicherort.substring(0, 1).equals(" ")||speicherort.substring(0, 1).equals(":")) {
        println(speicherort);
        speicherort=speicherort.substring(1, speicherort.length());
      }
      println(speicherort_neuerChoral);
      break;
    case "Amplitude-Grundton":
      amps[0]=float(par[0]);
      break;
    case "Amplitude-Oktave":
      amps[1]=float(par[0]);
      break;
    case "Amplitude-2Oktaven":
      amps[3]=float(par[0]);
      break;
    case "Amplitude-Quinte2Oktaven":
      amps[4]=float(par[0]);
      break;
    case "Amplitude-QuinteOktave":
      amps[2]=float(par[0]);
      break;
    case "Amplitude-Terz2Oktaven":
      amps[5]=float(par[0]);
      break;
    case "Choral-Speicherort":
      speicherort_neuerChoral=(" "+read[i]).split("Choral-Speicherort")[1];
      println(speicherort_neuerChoral);
      while (speicherort_neuerChoral.substring(0, 1).equals(" ")||speicherort_neuerChoral.substring(0, 1).equals(":")) {
        println(speicherort_neuerChoral);
        speicherort_neuerChoral=speicherort_neuerChoral.substring(1, speicherort_neuerChoral.length());
      }
      println(speicherort_neuerChoral);
      break;

    case "Amplitude-Oberton-1":
      amps[1]=float(par[1]);
      break;
    case "Amplitude-Oberton-2":
      amps[2]=float(par[2]);
      break;
    case "Amplitude-Oberton-3":
      amps[3]=float(par[3]);
      break;
    case "Amplitude-Oberton-4":
      amps[4]=float(par[4]);
      break;
    case "Amplitude-Oberton-5":
      amps[5]=float(par[5]);
      break;
    case "Amplitude-Oberton-6":
      amps[6]=float(par[6]);
      break;
    case "Amplitude-Oberton-7":
      amps[7]=float(par[7]);
      break;
    case "Amplitude-Oberton-8":
      amps[8]=float(par[8]);
      break;
    case "Amplitude-Oberton-9":
      amps[9]=float(par[9]);
      break;
    }
  }
}
void delay2(int time) {
  for (int i=0; i<time; i++) {
    if (i%10==0) redraw();
    delay(1);
  }
}
boolean autoMark=false;
void animation() {
  warnings.setText("");
  String readinText=jtp.getText();
  if (autoMark) try {
    int caretoffset= jtp.getCaretPosition();
    int currentline= (jtp).getLineOfOffset(caretoffset);
    int startOffset=jtp.getLineStartOffset(currentline);
    println(currentline, startOffset);
    readinText=readinText.substring(0, startOffset)+"<!!>"+readinText.substring(startOffset, readinText.length());
    //jtp.getDocument().insertString(startOffset,"M\n",null);
  }
  catch(Exception e) {
  }
  page.insert(readinText.split("\n"));
  background(255);
  //println(jtp.getText().split("\n")[0]);
  fill(0);
  page.paint();
}
boolean prioritizeExport=false;
@Override
  public void mouseClicked() {
  // abort=true;
}
void draw() {
  if (timer==0&&amp2.size()>1) {
    if (amp2.get(0)>=0)for (int i=0; i<oscs.length; i++) oscs[i].stop();
    if (amp2.get(0)>=0)for (int i=0; i<oscs.length; i++) oscs2[i].stop();
    if (amp2.get(0)>=0)for (int i=0; i<oscs.length; i++) oscs3[i].stop();
    amp2.remove(0);
    del2.remove(0);
    float nr=0.001;
    float[] kal={random(1-nr, 1+nr), random(1-nr, 1+nr)};
    //kal=new float[]{1,1.01};
    Env en[][]=new Env[3][oscs.length];
    for (int i=0; i<en.length; i++) for (int j=0; j<en[0].length; j++) en[i][j]=new Env(this);
    if (amp2.get(0)>=0)if (!abort) for (int i=0; i<oscs.length; i++) oscs[i].freq(amp2.get(0)*multip+amp2.get(0)*multip*i);
    if (!abort) for (int i=0; i<amps.length; i++) oscs[i].amp(amps[i]);

    if (amp2.get(0)>=0)if (!abort) for (int i=0; i<oscs.length; i++) oscs3[i].freq((amp2.get(0)*multip*(i+1))*kal[1]);
    if (!abort) for (int i=0; i<amps.length; i++) oscs3[i].amp(amps[i]);
    oscs3[5].amp(1/4);
    //if (amp2.get(0)>=0)if (!abort) for (int i=0; i<oscs.length; i++)oscs3[i].play();

    if (amp2.get(0)>=0)if (!abort) for (int i=0; i<oscs.length; i++) oscs2[i].freq(amp2.get(0)*multip+amp2.get(0)*multip*i-kal[0]);
    if (!abort) for (int i=0; i<amps.length; i++) oscs2[i].amp(amps[i]);
    //oscs2[2].amp(1);
    //if(amp2.get(0)>=0)if (!abort) for (int i=0; i<oscs.length; i++) oscs2[i].play();/**/
    // if(amp2.get(0)>=0)if (!abort) for (int i=0; i<oscs.length; i++) oscs3[i].play();/**/
    //   if(amp2.get(0)>=0)if (!abort) for (int i=0; i<oscs.length; i++) oscs3[i].play();
    if (amp2.get(0)>=0)if (!abort) for (int i=0; i<oscs.length; i++) en[0][i].play(oscs[i], 0.1, del2.get(0), 2, 0.1);
    // if(amp2.get(0)>=0)if (!abort) for (int i=0; i<oscs.length; i++) en[2][i].play(oscs3[i],0.1,del2.get(0),2,0.1);
    if (!abort) timer=(int)((del2.get(0)+0.05)*frameRate);
  } else if (timer!=0)timer--;
  //println(amp2.size(),timer);
  //println(amp2.size());
  PointerInfo pointerInfo = MouseInfo.getPointerInfo();
  if (prioritizeExport) {
    prioritizeExport=false;
    autoMark=false;
    beginRecord(PDF, file_in.substring(0,file_in.lastIndexOf("."))+".pdf");
    println(file_in.substring(0,file_in.lastIndexOf("."))+".pdf");
    animation();
    //pdf = (PGraphicsPDF)beginRecord(PDF, "Lines.pdf");
    //pdf.nextPage();
    endRecord();
    autoMark=autoTrace.getState();
  }
  if (trigger_once) {
    create_Window();
    trigger_once=false;
  }
  if (begin&&frameCount%5==0) {
    beginRecord(PDF, "Lines2.pdf");
    animation();
    //pdf = (PGraphicsPDF)beginRecord(PDF, "Lines.pdf");
    //pdf.nextPage();
    endRecord();
  }

}
void read_in_File(String select) {
  println("Lade Datei:" + select);
  file_in=select;

  String p[]=loadStrings(file_in);
  if (p.length==0) p=new String[]{"scal 1", " "};
  begin=true;
  //println(p[0]);
  String prog="";
  for (int i=0; i<p.length; i++) prog+=p[i]+"\n";
  jtp.setText(prog);
  jf.setTitle("Choral ("+file_in+")");
}
void fileSelected(File selection) {
  readinsetup();
  if (selection == null) {
    println("Warnung: Keine Datei Ausgewählt erstelle neue Datei");
    saveStrings("unnamed.txt", new String[]{});
  } else {

    println("Lade Datei:" + selection.getAbsolutePath());
    file_in=selection.getAbsolutePath();
  }
  println(file_in);
  String p[]=loadStrings(file_in);
  if (p.length==0) p=new String[]{"scal 0.65", "text 1 Überschrift", "sc 2 0", ""};
  begin=true;
  //println(p[0]);
  String prog="";
  for (int i=0; i<p.length; i++) prog+=p[i]+"\n";
  jtp.setText(prog);
  page.insert(p);
  // jf1.setVisible(true);
  fill(0);
  page.paint();
  jf.setTitle("Choral ("+file_in+")");
}
JCheckBoxMenuItem autoTrace=new JCheckBoxMenuItem("Position markieren");

void keyTyped() {
  println(inp);
  if (key==' ') jtp.setText(jtp.getText()+"\ngap");
  else if (key==ENTER) if (inp.substring(0, min(1, inp.length())).equals("<")) jtp.setText(jtp.getText()+"\nnewline"); 
  else jtp.setText(jtp.getText()+"\n"+inp);
  else if (key==BACKSPACE) {
    if (inp.equals("<")||inp.equals("")) {
      String[] sp=jtp.getText().split("\n");
      String st="";
      for (int i=0; i<sp.length-1; i++) st+=sp[i]+"\n";
      jtp.setText(st);
    } else inp="<";
  } else if (key=='N'||(procesCRTL&&procesN)) {
    final ImageIcon icon2=new ImageIcon(sketchPath("")+"\\data\\Icon.png");
    String datname=  speicherort_neuerChoral+"\\"+JOptionPane.showInputDialog(null, "Name der neuen Datei", "Datei erstellen", JOptionPane.INFORMATION_MESSAGE, icon2, null, "")+".choral";
    println(datname);  
    if (!datname.equals(speicherort_neuerChoral+"\\null.choral"))saveStrings(datname, new String[]{"scal 0.65", "text 1 Überschrift", "sc 2 0", });
    //fileSelected(new File(datname));
    if (!datname.equals(speicherort_neuerChoral+"\\null.choral"))read_in_File(  datname);
  } else if (key=='S'||(procesCRTL&&procesS)) {
    final ImageIcon icon2=new ImageIcon(sketchPath("")+"\\data\\Icon.png");
    String datname=speicherort_neuerChoral+"\\"+JOptionPane.showInputDialog(null, "Name der Datei", "Speichern als", JOptionPane.INFORMATION_MESSAGE, icon2, null, "")+".choral";
    if (!datname.equals(speicherort_neuerChoral+"\\null.choral"))saveStrings(datname, new String[]{jtp.getText()});
    if (!datname.equals(speicherort_neuerChoral+"\\null.choral"))read_in_File(  datname);
  } else if (key=='R'||(procesCRTL&&procesR)) readinsetup();
  else
    if (key=='?') save(file_in+"Screenshot.png");
    else {
      if (inp.substring(0, min(1, inp.length())).equals("<")||inp.substring(0, min(1, inp.length())).equals("q")||inp.substring(0, min(1, inp.length())).equals("p")) {
        if (key=='p') inp="pa";
        if (key=='q') inp="q";
        else if (key!='p')
          inp+=""+((key=='b')?"":" ")+key;
        if (int(""+key)!=0||key=='0') {
          jtp.setText(jtp.getText()+"\n"+inp);
          inp="<";
        }
      } else {
        inp+=key;
      }
    }

  if (key=='.') {
    abort=true;
    inp="<";
  }

  if (key=='#') inp="";
}

boolean procesCRTL=false;
boolean procesN=false;
boolean procesS=false;
boolean procesR=false;
void keyPressed() {
  //if (keyCode==17) procesCRTL=true;
  if (keyCode==82)
    procesR=true;
  if (keyCode==78)
    procesN=true;
  if (keyCode==83)
    procesS=true;
}

void keyReleased() {
  if (keyCode==17)
    procesCRTL=false;
  if (keyCode==82)
    procesR=false;
  if (keyCode==78)
    procesN=false;
  if (keyCode==83)
    procesS=false;
}