package org.mozilla.javascript.tools.debugger;

import java.awt.Dimension;
import java.awt.event.MouseEvent;
import java.util.EventObject;
import javax.swing.Icon;
import javax.swing.JTree;
import javax.swing.tree.DefaultTreeCellRenderer;
import javax.swing.tree.TreeSelectionModel;
import org.mozilla.javascript.tools.debugger.treetable.JTreeTable;
import org.mozilla.javascript.tools.debugger.treetable.TreeTableModel;
import org.mozilla.javascript.tools.debugger.treetable.TreeTableModelAdapter;

/* compiled from: SwingGui.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/MyTreeTable.class */
class MyTreeTable extends JTreeTable {
    private static final long serialVersionUID = 3457265548184453049L;

    public MyTreeTable(VariableModel model) {
        super(model);
    }

    public JTree resetTree(TreeTableModel treeTableModel) {
        this.tree = new JTreeTable.TreeTableCellRenderer(treeTableModel);
        super.setModel(new TreeTableModelAdapter(treeTableModel, this.tree));
        TreeSelectionModel listToTreeSelectionModelWrapper = new JTreeTable.ListToTreeSelectionModelWrapper();
        this.tree.setSelectionModel(listToTreeSelectionModelWrapper);
        setSelectionModel(listToTreeSelectionModelWrapper.getListSelectionModel());
        if (this.tree.getRowHeight() < 1) {
            setRowHeight(18);
        }
        setDefaultRenderer(TreeTableModel.class, this.tree);
        setDefaultEditor(TreeTableModel.class, new JTreeTable.TreeTableCellEditor());
        setShowGrid(true);
        setIntercellSpacing(new Dimension(1, 1));
        this.tree.setRootVisible(false);
        this.tree.setShowsRootHandles(true);
        DefaultTreeCellRenderer r = this.tree.getCellRenderer();
        r.setOpenIcon((Icon) null);
        r.setClosedIcon((Icon) null);
        r.setLeafIcon((Icon) null);
        return this.tree;
    }

    public boolean isCellEditable(EventObject e) {
        if (e instanceof MouseEvent) {
            MouseEvent me = (MouseEvent) e;
            if (me.getModifiers() == 0 || ((me.getModifiers() & 1040) != 0 && (me.getModifiers() & 6863) == 0)) {
                int row = rowAtPoint(me.getPoint());
                int counter = getColumnCount() - 1;
                while (true) {
                    if (counter < 0) {
                        break;
                    }
                    if (TreeTableModel.class != getColumnClass(counter)) {
                        counter--;
                    } else {
                        this.tree.dispatchEvent(new MouseEvent(this.tree, me.getID(), me.getWhen(), me.getModifiers(), me.getX() - getCellRect(row, counter, true).x, me.getY(), me.getClickCount(), me.isPopupTrigger()));
                        break;
                    }
                }
            }
            if (me.getClickCount() >= 3) {
                return true;
            }
            return false;
        }
        if (e == null) {
            return true;
        }
        return false;
    }
}
