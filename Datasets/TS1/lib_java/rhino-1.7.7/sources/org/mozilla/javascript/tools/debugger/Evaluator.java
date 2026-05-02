package org.mozilla.javascript.tools.debugger;

import javax.swing.JTable;

/* compiled from: SwingGui.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/Evaluator.class */
class Evaluator extends JTable {
    private static final long serialVersionUID = 8133672432982594256L;
    MyTableModel tableModel;

    public Evaluator(SwingGui debugGui) {
        super(new MyTableModel(debugGui));
        this.tableModel = getModel();
    }
}
