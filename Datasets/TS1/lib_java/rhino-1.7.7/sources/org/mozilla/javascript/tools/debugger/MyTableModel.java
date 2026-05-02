package org.mozilla.javascript.tools.debugger;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.swing.table.AbstractTableModel;

/* compiled from: SwingGui.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/MyTableModel.class */
class MyTableModel extends AbstractTableModel {
    private static final long serialVersionUID = 2971618907207577000L;
    private SwingGui debugGui;
    private List<String> expressions = Collections.synchronizedList(new ArrayList());
    private List<String> values = Collections.synchronizedList(new ArrayList());

    public MyTableModel(SwingGui debugGui) {
        this.debugGui = debugGui;
        this.expressions.add("");
        this.values.add("");
    }

    public int getColumnCount() {
        return 2;
    }

    public int getRowCount() {
        return this.expressions.size();
    }

    public String getColumnName(int column) {
        switch (column) {
            case 0:
                return "Expression";
            case 1:
                return "Value";
            default:
                return null;
        }
    }

    public boolean isCellEditable(int row, int column) {
        return true;
    }

    public Object getValueAt(int row, int column) {
        switch (column) {
            case 0:
                return this.expressions.get(row);
            case 1:
                return this.values.get(row);
            default:
                return "";
        }
    }

    public void setValueAt(Object value, int row, int column) {
        switch (column) {
            case 0:
                String expr = value.toString();
                this.expressions.set(row, expr);
                String result = "";
                if (expr.length() > 0) {
                    result = this.debugGui.dim.eval(expr);
                    if (result == null) {
                        result = "";
                    }
                }
                this.values.set(row, result);
                updateModel();
                if (row + 1 == this.expressions.size()) {
                    this.expressions.add("");
                    this.values.add("");
                    fireTableRowsInserted(row + 1, row + 1);
                    break;
                }
                break;
            case 1:
                fireTableDataChanged();
                break;
        }
    }

    void updateModel() {
        String result;
        for (int i = 0; i < this.expressions.size(); i++) {
            String expr = this.expressions.get(i);
            if (expr.length() > 0) {
                result = this.debugGui.dim.eval(expr);
                if (result == null) {
                    result = "";
                }
            } else {
                result = "";
            }
            this.values.set(i, result.replace('\n', ' '));
        }
        fireTableDataChanged();
    }
}
