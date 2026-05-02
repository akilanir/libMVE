package org.mozilla.javascript.tools.debugger;

import javax.swing.JComponent;
import javax.swing.JMenuItem;
import javax.swing.JPopupMenu;

/* compiled from: SwingGui.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/FilePopupMenu.class */
class FilePopupMenu extends JPopupMenu {
    private static final long serialVersionUID = 3589525009546013565L;
    int x;
    int y;

    public FilePopupMenu(FileTextArea w) {
        JMenuItem item = new JMenuItem("Set Breakpoint");
        add(item);
        item.addActionListener(w);
        JMenuItem item2 = new JMenuItem("Clear Breakpoint");
        add(item2);
        item2.addActionListener(w);
        JMenuItem item3 = new JMenuItem("Run");
        add(item3);
        item3.addActionListener(w);
    }

    public void show(JComponent comp, int x, int y) {
        this.x = x;
        this.y = y;
        super.show(comp, x, y);
    }
}
