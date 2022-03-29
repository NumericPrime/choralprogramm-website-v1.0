import java.awt.AWTEvent;
import java.awt.MouseInfo;
import java.awt.Toolkit;
import java.awt.event.AWTEventListener;

import javax.swing.JFrame;
/*
    public static void main(String[] args) {
        JFrame frame = new JFrame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }*/
    private static class Listener implements AWTEventListener {
        public void eventDispatched(AWTEvent event) {
            System.out.print(MouseInfo.getPointerInfo().getLocation() + " | ");
            System.out.println(event);
        }
    }