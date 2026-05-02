package org.mozilla.javascript.tools.debugger.treetable;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.MouseEvent;
import java.util.EventObject;
import javax.swing.JTable;
import javax.swing.JTree;
import javax.swing.ListSelectionModel;
import javax.swing.LookAndFeel;
import javax.swing.UIManager;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.TableCellEditor;
import javax.swing.table.TableCellRenderer;
import javax.swing.tree.DefaultTreeCellRenderer;
import javax.swing.tree.DefaultTreeSelectionModel;
import javax.swing.tree.TreeModel;
import javax.swing.tree.TreePath;
import javax.swing.tree.TreeSelectionModel;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/treetable/JTreeTable.class */
public class JTreeTable extends JTable {
    private static final long serialVersionUID = -2103973006456695515L;
    protected TreeTableCellRenderer tree;

    public JTreeTable(TreeTableModel treeTableModel) {
        this.tree = new TreeTableCellRenderer(treeTableModel);
        super.setModel(new TreeTableModelAdapter(treeTableModel, this.tree));
        TreeSelectionModel listToTreeSelectionModelWrapper = new ListToTreeSelectionModelWrapper();
        this.tree.setSelectionModel(listToTreeSelectionModelWrapper);
        setSelectionModel(listToTreeSelectionModelWrapper.getListSelectionModel());
        setDefaultRenderer(TreeTableModel.class, this.tree);
        setDefaultEditor(TreeTableModel.class, new TreeTableCellEditor());
        setShowGrid(false);
        setIntercellSpacing(new Dimension(0, 0));
        if (this.tree.getRowHeight() < 1) {
            setRowHeight(18);
        }
    }

    public void updateUI() {
        super.updateUI();
        if (this.tree != null) {
            this.tree.updateUI();
        }
        LookAndFeel.installColorsAndFont(this, "Tree.background", "Tree.foreground", "Tree.font");
    }

    public int getEditingRow() {
        if (getColumnClass(this.editingColumn) == TreeTableModel.class) {
            return -1;
        }
        return this.editingRow;
    }

    public void setRowHeight(int rowHeight) {
        super.setRowHeight(rowHeight);
        if (this.tree != null && this.tree.getRowHeight() != rowHeight) {
            this.tree.setRowHeight(getRowHeight());
        }
    }

    public JTree getTree() {
        return this.tree;
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer.class */
    public class TreeTableCellRenderer extends JTree implements TableCellRenderer {
        private static final long serialVersionUID = -193867880014600717L;
        protected int visibleRow;

        public TreeTableCellRenderer(TreeModel model) {
            super(model);
        }

        public void updateUI() {
            super.updateUI();
            DefaultTreeCellRenderer cellRenderer = getCellRenderer();
            if (cellRenderer instanceof DefaultTreeCellRenderer) {
                DefaultTreeCellRenderer dtcr = cellRenderer;
                dtcr.setTextSelectionColor(UIManager.getColor("Table.selectionForeground"));
                dtcr.setBackgroundSelectionColor(UIManager.getColor("Table.selectionBackground"));
            }
        }

        public void setRowHeight(int rowHeight) {
            if (rowHeight > 0) {
                super.setRowHeight(rowHeight);
                if (JTreeTable.this != null && JTreeTable.this.getRowHeight() != rowHeight) {
                    JTreeTable.this.setRowHeight(getRowHeight());
                }
            }
        }

        public void setBounds(int x, int y, int w, int h) {
            super.setBounds(x, 0, w, JTreeTable.this.getHeight());
        }

        public void paint(Graphics g) {
            g.translate(0, (-this.visibleRow) * getRowHeight());
            super.paint(g);
        }

        public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
            if (isSelected) {
                setBackground(table.getSelectionBackground());
            } else {
                setBackground(table.getBackground());
            }
            this.visibleRow = row;
            return this;
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor.class */
    public class TreeTableCellEditor extends AbstractCellEditor implements TableCellEditor {
        public TreeTableCellEditor() {
        }

        public Component getTableCellEditorComponent(JTable table, Object value, boolean isSelected, int r, int c) {
            return JTreeTable.this.tree;
        }

        @Override // org.mozilla.javascript.tools.debugger.treetable.AbstractCellEditor
        public boolean isCellEditable(EventObject e) {
            if (e instanceof MouseEvent) {
                for (int counter = JTreeTable.this.getColumnCount() - 1; counter >= 0; counter--) {
                    if (JTreeTable.this.getColumnClass(counter) == TreeTableModel.class) {
                        MouseEvent me = (MouseEvent) e;
                        JTreeTable.this.tree.dispatchEvent(new MouseEvent(JTreeTable.this.tree, me.getID(), me.getWhen(), me.getModifiers(), me.getX() - JTreeTable.this.getCellRect(0, counter, true).x, me.getY(), me.getClickCount(), me.isPopupTrigger()));
                        return false;
                    }
                }
                return false;
            }
            return false;
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper.class */
    public class ListToTreeSelectionModelWrapper extends DefaultTreeSelectionModel {
        private static final long serialVersionUID = 8168140829623071131L;
        protected boolean updatingListSelectionModel;

        public ListToTreeSelectionModelWrapper() {
            getListSelectionModel().addListSelectionListener(createListSelectionListener());
        }

        public ListSelectionModel getListSelectionModel() {
            return this.listSelectionModel;
        }

        public void resetRowSelection() {
            if (!this.updatingListSelectionModel) {
                this.updatingListSelectionModel = true;
                try {
                    super.resetRowSelection();
                    this.updatingListSelectionModel = false;
                } catch (Throwable th) {
                    this.updatingListSelectionModel = false;
                    throw th;
                }
            }
        }

        protected ListSelectionListener createListSelectionListener() {
            return new ListSelectionHandler();
        }

        protected void updateSelectedPathsFromSelectedRows() {
            TreePath selPath;
            if (!this.updatingListSelectionModel) {
                this.updatingListSelectionModel = true;
                try {
                    int min = this.listSelectionModel.getMinSelectionIndex();
                    int max = this.listSelectionModel.getMaxSelectionIndex();
                    clearSelection();
                    if (min != -1 && max != -1) {
                        for (int counter = min; counter <= max; counter++) {
                            if (this.listSelectionModel.isSelectedIndex(counter) && (selPath = JTreeTable.this.tree.getPathForRow(counter)) != null) {
                                addSelectionPath(selPath);
                            }
                        }
                    }
                } finally {
                    this.updatingListSelectionModel = false;
                }
            }
        }

        /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper$ListSelectionHandler.class */
        class ListSelectionHandler implements ListSelectionListener {
            ListSelectionHandler() {
            }

            public void valueChanged(ListSelectionEvent e) {
                ListToTreeSelectionModelWrapper.this.updateSelectedPathsFromSelectedRows();
            }
        }
    }
}
