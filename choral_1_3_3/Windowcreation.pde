final JCheckBoxMenuItem twowindows=new JCheckBoxMenuItem("Zweifenster-Modus");

final JMenuBar menubar = new JMenuBar();
JFrame mainFrame;
import javax.swing.text.*;
void create_Window() {
  mainFrame=(JFrame) ((processing.awt.PSurfaceAWT.SmoothCanvas)this.getSurface().getNative()).getFrame();
  JPanel jlp=new JPanel();
  jlp.setLayout(new BorderLayout());
  jlp.add(mainFrame.getContentPane(), "Center");
  final Container mainFramecont=mainFrame.getContentPane();
  Style style, fontsize;
  jf.setTitle("Choral");
  Font f=new Font(Font.SANS_SERIF, schriftgroese/2, schriftgroese);
  jtp.setFont(f);

  final Container c=jf.getContentPane();
  Container con=jf1.getContentPane();
  c.add(listScroller2);

  JPanel contp=new JPanel();
  contp.setLayout(new GridBagLayout());

  String erkl[]={"Jede Zeile enthält einen Befehl", "Jeder dieser erwartet Eingaben:", "Tonhöhe h", "pun h1 m: Erstellt eine Einzelnote "};


  jpan.setBounds(0, 0, 280, 350);
  jb.setBounds(100, 370, 140, 100);

  jf.setSize(325, 500);

  ImageIcon iconMain=new ImageIcon(sketchPath("")+"\\data\\Icon.png");
  jf.setIconImage(iconMain.getImage());
  jf1.setSize(280, 100);
  JPanel jpanel2=new JPanel();
  jpanel2.add(warnings);
  JButton pla=new JButton("Abspielen");

  ActionListener al=new ActionListener() {
    public void actionPerformed(ActionEvent e) {

      selectInput("Öffnen:", "fileSelected");
    }
  };
  jb.addActionListener(al);
  pla.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {

      page.play();
    }
  }
  );
  ActionListener sp=new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      saveStrings(file_in, jtp.getText().split("\n"));
    }
  };
  jb2.addActionListener(sp);
  ActionListener pd=new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      prioritizeExport=true;
    }
  };
  ActionListener readnewset=new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      readinsetup();
    }
  };
  ActionListener savas=new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      final ImageIcon icon2=new ImageIcon(sketchPath("")+"\\data\\Icon.png");
      String datname=speicherort_neuerChoral+"\\"+JOptionPane.showInputDialog(null, "Name der Datei", "Speichern als", JOptionPane.INFORMATION_MESSAGE, icon2, null, "")+".choral";
      if (!datname.equals(speicherort_neuerChoral+"\\null.choral"))saveStrings(datname, new String[]{jtp.getText()});
      if (!datname.equals(speicherort_neuerChoral+"\\null.choral"))read_in_File(  datname);
    }
  };
  ActionListener newdat=new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      final ImageIcon icon2=new ImageIcon(sketchPath("")+"\\data\\Icon.png");
      String datname=  speicherort_neuerChoral+"\\"+JOptionPane.showInputDialog(null, "Name der neuen Datei", "Datei erstellen", JOptionPane.INFORMATION_MESSAGE, icon2, null, "")+".choral";
      println(datname);  
      if (!datname.equals(speicherort_neuerChoral+"\\null.choral"))saveStrings(datname, new String[]{"scal 0.65", "text 1 Überschrift", "sc 2 0", });
      //fileSelected(new File(datname));
      if (!datname.equals(speicherort_neuerChoral+"\\null.choral"))read_in_File(  datname);
    }
  };
  /*"\n!-! Schriftgroese:"+ schriftgroese+"\n"+
   "!-! SchriftgroeseUeberschrift:"+ htextsize+"\n"+
   "!-! Text-Verschiebung:"+ offsetText+"\n"+
   "!-! Liedtext-Groese"+ ts+"\n"+
   "!-! Notenabstand"+ ds+"\n"+
   "!-! Zeilenabstand"+ dz+"\n"+
   "!-! Notengroese"+ dn
   */
  ActionListener addsettings=new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      String list="\n!-! Schriftgroese:"+ schriftgroese+"\n"+
        "!-! SchriftgroeseUeberschrift:"+ htextsize+"\n"+
        "!-! Text-Verschiebung:"+ offsetText+"\n"+
        "!-! Liedtext-Groese:"+ ts+"\n"+
        "!-! Notenabstand:"+ ds+"\n"+
        "!-! Zeilenabstand:"+ dz+"\n"+
        "!-! Notengroese:"+ dn+"\n"
        +"!-! UeberschriftVerschiebung:"+headoffset;
      jtp.setText(jtp.getText()+list);
    }
  };
  int nr=16;
  Font s=(new Font(Font.SANS_SERIF, nr/2, nr));
  try {
    //JCheckBoxMenuItem
    //UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
    UIManager.put("MenuItem.background", Color.WHITE);
    UIManager.put("MenuItem.acceleratorFont", s);
    UIManager.put("CheckBoxMenuItem.selectionBackground", Color.WHITE);
    UIManager.put("CheckBoxMenuItem.acceleratorFont", s);
    UIManager.put("Menu.background", Color.WHITE);
    //UIManager.put("CheckBoxMenuItem.acceleratorFont", s);
    UIManager.put("menuText", Color.WHITE);
    autoTrace.setBackground(Color.WHITE);
    twowindows.setBackground(Color.WHITE);
    menubar.setBackground(new Color(230, 230, 240));
    SwingUtilities.updateComponentTreeUI(jf.getContentPane());
  }
  catch(Exception e) {
    println("exception:");
    e.printStackTrace();
  }
  jb3.addActionListener(pd);
  JMenu file = new JMenu("Datei");
  JMenu edittext = new JMenu("Bearbeiten");
  JMenu aud = new JMenu("Audio");
  JMenuItem svan = new JMenuItem("Speichern als");
  JMenuItem open = new JMenuItem("Öffnen");
  JMenuItem savg = new JMenuItem("Speichern");
  JMenuItem extv = new JMenuItem("Beenden");
  JMenuItem ned = new JMenuItem("Neu");
  //autoMark
  JMenuItem abspi = new JMenuItem("Abspielen");
  JMenuItem ababs = new JMenuItem("Abbrechen");
  JMenuItem recsetup = new JMenuItem("Einstellungen Laden");
  JMenuItem addsetup = new JMenuItem("Einstellungen Einfügen");
  JMenuItem pdff = new JMenuItem("Pdf");
  file.setFont(new Font(Font.SANS_SERIF, 9, 18));
  file.add(ned);
  edittext.add(addsetup);
  edittext.add(autoTrace);
  edittext.add(twowindows);
  ned.setAccelerator(KeyStroke.getKeyStroke("control N"));
  file.add(open);
  open.setAccelerator(KeyStroke.getKeyStroke("control O"));
  file.add(savg);
  savg.setAccelerator(KeyStroke.getKeyStroke("control S"));
  file.add(svan);
  file.addSeparator();
  svan.setAccelerator(KeyStroke.getKeyStroke("control alt S"));
  file.add(pdff);
  file.addSeparator();
  file.add(recsetup);
  file.add(extv);
  aud.add(abspi);
  aud.add(ababs);
  menubar.add(file);
  menubar.add(edittext);
  menubar.add(aud);
  open.addActionListener(al);
  savg.addActionListener(sp);
  pdff.addActionListener(pd);
  svan.addActionListener(savas);
  addsetup.addActionListener(addsettings);
  recsetup.addActionListener(readnewset);
  /*  svan.setBorder(BorderFactory
   .createMatteBorder(0, 0, 1, 0, Color.BLACK));*/
  ned.addActionListener(newdat);
  abspi.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {

      page.play();
    }
  }
  );
  autoTrace.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {

      autoMark=autoTrace.getState();
    }
  }
  );
  extv.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      exit();
    }
  }
  );
  ababs.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      abort=true;
    }
  }
  );
  for (int i=0; i<menubar.getMenuCount(); i++) {
    menubar.getMenu(i).setFont(s);
    Component[] m=(Component[]) menubar.getMenu(i).getMenuComponents();
    for (Component j : m) {
      j.setFont(s);
    }
  }
  addUndoFunction();
  c.add(mainFramecont, "East");
  //c.add(menubar, "North");


  twowindows.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      if (!twowindows.getState()) {
        //getSurface().getNative().getContentPane().add();
        mainFrame.setVisible(false);
        mainFramecont.setPreferredSize(new Dimension(width, height));
        jf.setMinimumSize(new Dimension(width+200, height+50));
        c.add(mainFramecont, "East");
        jf.setJMenuBar(menubar);
      } else {
        mainFrame.setVisible(true);
        mainFrame.setContentPane(mainFramecont);
        jf.setMinimumSize(null);
      }
      SwingUtilities.updateComponentTreeUI(jf.getContentPane());
    }
  }
  );

  //getSurface().getNative().getContentPane().add();
  mainFramecont.setPreferredSize(new Dimension(width, height));
  mainFrame.setVisible(false);
  jf.addComponentListener(new ComponentAdapter() {
    public void componentResized(ComponentEvent e) {
      SwingUtilities.updateComponentTreeUI(c);
    }
  }
  );
  jf.setMinimumSize(new Dimension(width+200, height+50));

  jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  jf.setVisible(true);
  jf.setJMenuBar(menubar);
}
import javax.swing.undo.*;
void addUndoFunction() {
  InputMap inputm=jtp.getInputMap(JComponent.WHEN_FOCUSED);
  inputm.put(KeyStroke.getKeyStroke("control Z"), "Undo");
  inputm.put(KeyStroke.getKeyStroke("control Y"), "Redo");
  final UndoManager undoManager=new UndoManager();
  Document doc=jtp.getDocument();
  doc.addUndoableEditListener(undoManager);
  ActionMap actionm=jtp.getActionMap();
  actionm.put("Undo", new AbstractAction() {
    @Override
      public void actionPerformed(ActionEvent e) {
      try { 
        if (undoManager.canUndo()) undoManager.undo();
      }
      catch(Exception ex) {
        ex.printStackTrace();
      }
    }
  }
  );
  actionm.put("Redo", new AbstractAction() {
    @Override
      public void actionPerformed(ActionEvent e) {
      try { 
        if (undoManager.canRedo()) undoManager.redo();
      }
      catch(Exception ex) {
        ex.printStackTrace();
      }
    }
  }
  );
}