// @file    TestCaseUpdater.java
// @brief   TestCaseUpdater class for SBML Standalone application
// @author  Kimberly Begley
// 

//
//<!---------------------------------------------------------------------------
// This file is part of the SBML Test Suite.  Please visit http://sbml.org for
// more information about SBML, and the latest version of the SBML Test Suite.
// 
// Copyright 2008      California Institute of Technology.
// Copyright 2004-2007 California Institute of Technology (USA) and
//                     University of Hertfordshire (UK).
// 
// The SBML Test Suite is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public License as
// published by the Free Software Foundation.  A copy of the license
// agreement is provided in the file named "LICENSE.txt" included with
// this software distribution and also available at
// http://sbml.org/Software/SBML_Test_Suite/license.html
//------------------------------------------------------------------------- -->
// Class for updating the test cases via the internet.
//

package sbml.test;

/**
 * TestCaseUpdater class creates the dialog window for the test case downloads and has many methods used in the process.
 * @author  Kimberly Begley
 * @version 2.0
 */
public class TestCaseUpdater extends javax.swing.JDialog {

   
    /**
     * Creates new form TestCaseUpdater
     * @param parent is the parent frame
     * @param modal boolean value for indicating if the dialog is modal or not
     */
    public TestCaseUpdater(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        this.setLocationRelativeTo(parent);
        this.setVisible(true);
    }
    /**
     * checkForUpdates creates a new UpdateDownloader and checks for updates
     */
    public void checkForUpdates() {
        UpdateDownloader ud = new UpdateDownloader(this);
        ud.start();
    
    }
    /**
     * appendToLog appends a string to the log
     * @param string
     */
    void appendToLog(String string) {
        jTextArea1.append(string);
    }
    /**
     * setFinished sets the progress bar details to finished with the message parameter given
     * @param message the message to set the string in the progress bar to
     */
    void setFinished(String message) {
        jProgressBar1.setIndeterminate(false);
        jProgressBar1.setMaximum(100);
        jProgressBar1.setValue(100);
        jProgressBar1.setString(message);
        jProgressBar1.setStringPainted(true);
        jButton1.setEnabled(false);
        jButton2.setEnabled(true);
    }
    /**
     * setLocalTimestamp sets the local timestamp
     * @param ts the value to set the timestamp to
     */
    void setLocalTimestamp(String ts) {
        currentVersionLabel.setText(ts);
    }
    /**
     * setNewTimestamp sets the new timestamp value
     * @param logLine the value to set the timestamp to
     */
    void setNewTimestamp(String logLine) {
        latestVersionLabel.setText(logLine);
    }
    /**
     * setProgressBarIndeterminant - sets the progress bar to an interterminant type if indicated by ind
     * @param ind the boolean value indicating whether to set the progress bar to indeterminant or not
     */
    void setProgressBarIndeterminate(boolean ind) {
        jProgressBar1.setStringPainted(!ind);
        jProgressBar1.setIndeterminate(ind);
    }
    /**
     * setProgressBarMax - sets the max value for the progress bar
     * @param i the value to set as max for the progress bar
     */
    void setProgressBarMax(int i) {
        jProgressBar1.setMaximum(i);
        jProgressBar1.setString("0 MB of "+i/(1024*1024)+" MB");
        jProgressBar1.setStringPainted(true);
    }
    /**
     * setProgressBarProgress - updates the progress of the progress bar
     * @param i the value to set the progress to
     */
    void setProgressBarProgress(int i) {
        jProgressBar1.setValue(i);
        jProgressBar1.setString(i/(1024*1024)+" MB of "+jProgressBar1.getMaximum()/(1024*1024)+" MB");
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        currentVersionLabel = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        latestVersionLabel = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jProgressBar1 = new javax.swing.JProgressBar();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        getContentPane().setLayout(new java.awt.BorderLayout(10, 10));

        jPanel1.setLayout(new java.awt.GridLayout(2, 2, 10, 10));

        jLabel1.setText("Current version:");
        jPanel1.add(jLabel1);

        currentVersionLabel.setText("--");
        jPanel1.add(currentVersionLabel);

        jLabel3.setText("Latest version available:");
        jPanel1.add(jLabel3);

        latestVersionLabel.setText("--");
        jPanel1.add(latestVersionLabel);

        getContentPane().add(jPanel1, java.awt.BorderLayout.PAGE_START);

        jButton1.setText("cancel");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel3.add(jButton1);

        jButton2.setText("Ok");
        jButton2.setEnabled(false);
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel3.add(jButton2);

        getContentPane().add(jPanel3, java.awt.BorderLayout.PAGE_END);

        jPanel2.setLayout(new java.awt.BorderLayout(10, 10));

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jScrollPane1.setViewportView(jTextArea1);

        jPanel2.add(jScrollPane1, java.awt.BorderLayout.CENTER);

        jProgressBar1.setToolTipText("<html><i>Download progress</i></html>"); // NOI18N
        jPanel2.add(jProgressBar1, java.awt.BorderLayout.PAGE_START);

        getContentPane().add(jPanel2, java.awt.BorderLayout.CENTER);

        pack();
    }// </editor-fold>//GEN-END:initComponents
    /**
     * jButtonActionPerformed is the listener event that occurs when the cancel button is clicked on 
     * @param evt it sets the window to invisible
     */
    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // Cancel button selected
        this.setVisible(false);
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        this.setVisible(false);
    }//GEN-LAST:event_jButton2ActionPerformed



    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel currentVersionLabel;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JProgressBar jProgressBar1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JLabel latestVersionLabel;
    // End of variables declaration//GEN-END:variables

}
