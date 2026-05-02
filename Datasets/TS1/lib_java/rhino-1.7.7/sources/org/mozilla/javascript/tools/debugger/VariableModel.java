package org.mozilla.javascript.tools.debugger;

import java.util.Arrays;
import java.util.Comparator;
import javax.swing.event.TreeModelListener;
import javax.swing.tree.TreePath;
import org.mozilla.javascript.tools.debugger.treetable.TreeTableModel;

/* compiled from: SwingGui.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/VariableModel.class */
class VariableModel implements TreeTableModel {
    private static final String[] cNames = {" Name", " Value"};
    private static final Class<?>[] cTypes = {TreeTableModel.class, String.class};
    private static final VariableNode[] CHILDLESS = new VariableNode[0];
    private Dim debugger;
    private VariableNode root;

    public VariableModel() {
    }

    public VariableModel(Dim debugger, Object scope) {
        this.debugger = debugger;
        this.root = new VariableNode(scope, "this");
    }

    public Object getRoot() {
        if (this.debugger == null) {
            return null;
        }
        return this.root;
    }

    public int getChildCount(Object nodeObj) {
        if (this.debugger == null) {
            return 0;
        }
        VariableNode node = (VariableNode) nodeObj;
        return children(node).length;
    }

    public Object getChild(Object nodeObj, int i) {
        if (this.debugger == null) {
            return null;
        }
        VariableNode node = (VariableNode) nodeObj;
        return children(node)[i];
    }

    public boolean isLeaf(Object nodeObj) {
        if (this.debugger == null) {
            return true;
        }
        VariableNode node = (VariableNode) nodeObj;
        return children(node).length == 0;
    }

    public int getIndexOfChild(Object parentObj, Object childObj) {
        if (this.debugger == null) {
            return -1;
        }
        VariableNode parent = (VariableNode) parentObj;
        VariableNode child = (VariableNode) childObj;
        VariableNode[] children = children(parent);
        for (int i = 0; i != children.length; i++) {
            if (children[i] == child) {
                return i;
            }
        }
        return -1;
    }

    @Override // org.mozilla.javascript.tools.debugger.treetable.TreeTableModel
    public boolean isCellEditable(Object node, int column) {
        return column == 0;
    }

    @Override // org.mozilla.javascript.tools.debugger.treetable.TreeTableModel
    public void setValueAt(Object value, Object node, int column) {
    }

    public void addTreeModelListener(TreeModelListener l) {
    }

    public void removeTreeModelListener(TreeModelListener l) {
    }

    public void valueForPathChanged(TreePath path, Object newValue) {
    }

    @Override // org.mozilla.javascript.tools.debugger.treetable.TreeTableModel
    public int getColumnCount() {
        return cNames.length;
    }

    @Override // org.mozilla.javascript.tools.debugger.treetable.TreeTableModel
    public String getColumnName(int column) {
        return cNames[column];
    }

    @Override // org.mozilla.javascript.tools.debugger.treetable.TreeTableModel
    public Class<?> getColumnClass(int column) {
        return cTypes[column];
    }

    @Override // org.mozilla.javascript.tools.debugger.treetable.TreeTableModel
    public Object getValueAt(Object nodeObj, int column) {
        String result;
        if (this.debugger == null) {
            return null;
        }
        VariableNode node = (VariableNode) nodeObj;
        switch (column) {
            case 0:
                return node.toString();
            case 1:
                try {
                    result = this.debugger.objectToString(getValue(node));
                } catch (RuntimeException exc) {
                    result = exc.getMessage();
                }
                StringBuilder buf = new StringBuilder();
                int len = result.length();
                for (int i = 0; i < len; i++) {
                    char ch = result.charAt(i);
                    if (Character.isISOControl(ch)) {
                        ch = ' ';
                    }
                    buf.append(ch);
                }
                return buf.toString();
            default:
                return null;
        }
    }

    private VariableNode[] children(VariableNode node) {
        VariableNode[] children;
        if (node.children == null) {
            Object value = getValue(node);
            Object[] ids = this.debugger.getObjectIds(value);
            if (ids == null || ids.length == 0) {
                children = CHILDLESS;
            } else {
                Arrays.sort(ids, new Comparator<Object>() { // from class: org.mozilla.javascript.tools.debugger.VariableModel.1
                    @Override // java.util.Comparator
                    public int compare(Object l, Object r) {
                        if (l instanceof String) {
                            if (r instanceof Integer) {
                                return -1;
                            }
                            return ((String) l).compareToIgnoreCase((String) r);
                        }
                        if (r instanceof String) {
                            return 1;
                        }
                        int lint = ((Integer) l).intValue();
                        int rint = ((Integer) r).intValue();
                        return lint - rint;
                    }
                });
                children = new VariableNode[ids.length];
                for (int i = 0; i != ids.length; i++) {
                    children[i] = new VariableNode(value, ids[i]);
                }
            }
            node.children = children;
            return children;
        }
        return node.children;
    }

    public Object getValue(VariableNode node) {
        try {
            return this.debugger.getObjectProperty(node.object, node.id);
        } catch (Exception e) {
            return "undefined";
        }
    }

    /* compiled from: SwingGui.java */
    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/VariableModel$VariableNode.class */
    private static class VariableNode {
        private Object object;
        private Object id;
        private VariableNode[] children;

        public VariableNode(Object object, Object id) {
            this.object = object;
            this.id = id;
        }

        public String toString() {
            return this.id instanceof String ? (String) this.id : "[" + ((Integer) this.id).intValue() + "]";
        }
    }
}
