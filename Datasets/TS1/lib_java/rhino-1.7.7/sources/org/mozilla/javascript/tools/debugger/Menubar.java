package org.mozilla.javascript.tools.debugger;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.swing.JCheckBoxMenuItem;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.KeyStroke;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;

/* compiled from: SwingGui.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/Menubar.class */
class Menubar extends JMenuBar implements ActionListener {
    private static final long serialVersionUID = 3217170497245911461L;
    private List<JMenuItem> interruptOnlyItems = Collections.synchronizedList(new ArrayList());
    private List<JMenuItem> runOnlyItems = Collections.synchronizedList(new ArrayList());
    private SwingGui debugGui;
    private JMenu windowMenu;
    private JCheckBoxMenuItem breakOnExceptions;
    private JCheckBoxMenuItem breakOnEnter;
    private JCheckBoxMenuItem breakOnReturn;

    Menubar(SwingGui debugGui) {
        this.debugGui = debugGui;
        String[] fileItems = {"Open...", "Run...", "", "Exit"};
        String[] fileCmds = {"Open", "Load", "", "Exit"};
        char[] fileShortCuts = {'0', 'N', 0, 'X'};
        int[] fileAccelerators = {79, 78, 0, 81};
        String[] editItems = {"Cut", "Copy", "Paste", "Go to function..."};
        char[] editShortCuts = {'T', 'C', 'P', 'F'};
        String[] debugItems = {"Break", "Go", "Step Into", "Step Over", "Step Out"};
        char[] debugShortCuts = {'B', 'G', 'I', 'O', 'T'};
        String[] plafItems = {"Metal", "Windows", "Motif"};
        char[] plafShortCuts = {'M', 'W', 'F'};
        int[] debugAccelerators = {19, 116, 122, 118, 119, 0, 0};
        JMenu fileMenu = new JMenu("File");
        fileMenu.setMnemonic('F');
        JMenu editMenu = new JMenu("Edit");
        editMenu.setMnemonic('E');
        JMenu plafMenu = new JMenu("Platform");
        plafMenu.setMnemonic('P');
        JMenu debugMenu = new JMenu("Debug");
        debugMenu.setMnemonic('D');
        this.windowMenu = new JMenu("Window");
        this.windowMenu.setMnemonic('W');
        for (int i = 0; i < fileItems.length; i++) {
            if (fileItems[i].length() == 0) {
                fileMenu.addSeparator();
            } else {
                JMenuItem item = new JMenuItem(fileItems[i], fileShortCuts[i]);
                item.setActionCommand(fileCmds[i]);
                item.addActionListener(this);
                fileMenu.add(item);
                if (fileAccelerators[i] != 0) {
                    KeyStroke k = KeyStroke.getKeyStroke(fileAccelerators[i], 2);
                    item.setAccelerator(k);
                }
            }
        }
        for (int i2 = 0; i2 < editItems.length; i2++) {
            JMenuItem item2 = new JMenuItem(editItems[i2], editShortCuts[i2]);
            item2.addActionListener(this);
            editMenu.add(item2);
        }
        for (int i3 = 0; i3 < plafItems.length; i3++) {
            JMenuItem item3 = new JMenuItem(plafItems[i3], plafShortCuts[i3]);
            item3.addActionListener(this);
            plafMenu.add(item3);
        }
        for (int i4 = 0; i4 < debugItems.length; i4++) {
            JMenuItem item4 = new JMenuItem(debugItems[i4], debugShortCuts[i4]);
            item4.addActionListener(this);
            if (debugAccelerators[i4] != 0) {
                KeyStroke k2 = KeyStroke.getKeyStroke(debugAccelerators[i4], 0);
                item4.setAccelerator(k2);
            }
            if (i4 != 0) {
                this.interruptOnlyItems.add(item4);
            } else {
                this.runOnlyItems.add(item4);
            }
            debugMenu.add(item4);
        }
        this.breakOnExceptions = new JCheckBoxMenuItem("Break on Exceptions");
        this.breakOnExceptions.setMnemonic('X');
        this.breakOnExceptions.addActionListener(this);
        this.breakOnExceptions.setSelected(false);
        debugMenu.add(this.breakOnExceptions);
        this.breakOnEnter = new JCheckBoxMenuItem("Break on Function Enter");
        this.breakOnEnter.setMnemonic('E');
        this.breakOnEnter.addActionListener(this);
        this.breakOnEnter.setSelected(false);
        debugMenu.add(this.breakOnEnter);
        this.breakOnReturn = new JCheckBoxMenuItem("Break on Function Return");
        this.breakOnReturn.setMnemonic('R');
        this.breakOnReturn.addActionListener(this);
        this.breakOnReturn.setSelected(false);
        debugMenu.add(this.breakOnReturn);
        add(fileMenu);
        add(editMenu);
        add(debugMenu);
        JMenu jMenu = this.windowMenu;
        JMenuItem item5 = new JMenuItem("Cascade", 65);
        jMenu.add(item5);
        item5.addActionListener(this);
        JMenu jMenu2 = this.windowMenu;
        JMenuItem item6 = new JMenuItem("Tile", 84);
        jMenu2.add(item6);
        item6.addActionListener(this);
        this.windowMenu.addSeparator();
        JMenu jMenu3 = this.windowMenu;
        JMenuItem item7 = new JMenuItem("Console", 67);
        jMenu3.add(item7);
        item7.addActionListener(this);
        add(this.windowMenu);
        updateEnabled(false);
    }

    public JCheckBoxMenuItem getBreakOnExceptions() {
        return this.breakOnExceptions;
    }

    public JCheckBoxMenuItem getBreakOnEnter() {
        return this.breakOnEnter;
    }

    public JCheckBoxMenuItem getBreakOnReturn() {
        return this.breakOnReturn;
    }

    public JMenu getDebugMenu() {
        return getMenu(2);
    }

    public void actionPerformed(ActionEvent e) {
        String plaf_name;
        String cmd = e.getActionCommand();
        if (cmd.equals("Metal")) {
            plaf_name = "javax.swing.plaf.metal.MetalLookAndFeel";
        } else if (cmd.equals("Windows")) {
            plaf_name = "com.sun.java.swing.plaf.windows.WindowsLookAndFeel";
        } else if (cmd.equals("Motif")) {
            plaf_name = "com.sun.java.swing.plaf.motif.MotifLookAndFeel";
        } else {
            Object source = e.getSource();
            if (source == this.breakOnExceptions) {
                this.debugGui.dim.setBreakOnExceptions(this.breakOnExceptions.isSelected());
                return;
            }
            if (source == this.breakOnEnter) {
                this.debugGui.dim.setBreakOnEnter(this.breakOnEnter.isSelected());
                return;
            } else if (source == this.breakOnReturn) {
                this.debugGui.dim.setBreakOnReturn(this.breakOnReturn.isSelected());
                return;
            } else {
                this.debugGui.actionPerformed(e);
                return;
            }
        }
        try {
            UIManager.setLookAndFeel(plaf_name);
            SwingUtilities.updateComponentTreeUI(this.debugGui);
            SwingUtilities.updateComponentTreeUI(this.debugGui.dlg);
        } catch (Exception e2) {
        }
    }

    public void addFile(String url) {
        int count = this.windowMenu.getItemCount();
        if (count == 4) {
            this.windowMenu.addSeparator();
            count++;
        }
        JMenuItem lastItem = this.windowMenu.getItem(count - 1);
        boolean hasMoreWin = false;
        int maxWin = 5;
        if (lastItem != null && lastItem.getText().equals("More Windows...")) {
            hasMoreWin = true;
            maxWin = 5 + 1;
        }
        if (!hasMoreWin && count - 4 == 5) {
            JMenu jMenu = this.windowMenu;
            JMenuItem item = new JMenuItem("More Windows...", 77);
            jMenu.add(item);
            item.setActionCommand("More Windows...");
            item.addActionListener(this);
            return;
        }
        if (count - 4 <= maxWin) {
            if (hasMoreWin) {
                count--;
                this.windowMenu.remove(lastItem);
            }
            String shortName = SwingGui.getShortName(url);
            JMenu jMenu2 = this.windowMenu;
            JMenuItem item2 = new JMenuItem(((char) (48 + (count - 4))) + " " + shortName, 48 + (count - 4));
            jMenu2.add(item2);
            if (hasMoreWin) {
                this.windowMenu.add(lastItem);
            }
            item2.setActionCommand(url);
            item2.addActionListener(this);
        }
    }

    public void updateEnabled(boolean interrupted) {
        for (int i = 0; i != this.interruptOnlyItems.size(); i++) {
            JMenuItem item = this.interruptOnlyItems.get(i);
            item.setEnabled(interrupted);
        }
        for (int i2 = 0; i2 != this.runOnlyItems.size(); i2++) {
            JMenuItem item2 = this.runOnlyItems.get(i2);
            item2.setEnabled(!interrupted);
        }
    }
}
