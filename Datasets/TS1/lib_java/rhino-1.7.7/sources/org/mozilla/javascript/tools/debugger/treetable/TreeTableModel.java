package org.mozilla.javascript.tools.debugger.treetable;

import javax.swing.tree.TreeModel;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/treetable/TreeTableModel.class */
public interface TreeTableModel extends TreeModel {
    int getColumnCount();

    String getColumnName(int i);

    Class<?> getColumnClass(int i);

    Object getValueAt(Object obj, int i);

    boolean isCellEditable(Object obj, int i);

    void setValueAt(Object obj, Object obj2, int i);
}
