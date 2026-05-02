.class Lorg/mozilla/javascript/tools/debugger/MyTreeTable;
.super Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;
.source "SwingGui.java"


# static fields
.field private static final serialVersionUID:J = 0x2ffaacb2ddbaffb9L


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/VariableModel;)V
    .registers 2
    .param p1, "model"    # Lorg/mozilla/javascript/tools/debugger/VariableModel;

    .prologue
    .line 2719
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;)V

    .line 2720
    return-void
.end method


# virtual methods
.method public isCellEditable(Ljava/util/EventObject;)Z
    .registers 15
    .param p1, "e"    # Ljava/util/EventObject;

    .prologue
    .line 2762
    instance-of v1, p1, Ljava/awt/event/MouseEvent;

    if-eqz v1, :cond_73

    move-object v11, p1

    .line 2763
    check-cast v11, Ljava/awt/event/MouseEvent;

    .line 2770
    .local v11, "me":Ljava/awt/event/MouseEvent;
    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getModifiers()I

    move-result v1

    if-eqz v1, :cond_1d

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getModifiers()I

    move-result v1

    and-int/lit16 v1, v1, 0x410

    if-eqz v1, :cond_65

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getModifiers()I

    move-result v1

    and-int/lit16 v1, v1, 0x1acf

    if-nez v1, :cond_65

    .line 2784
    :cond_1d
    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getPoint()Ljava/awt/Point;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->rowAtPoint(Ljava/awt/Point;)I

    move-result v12

    .line 2785
    .local v12, "row":I
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->getColumnCount()I

    move-result v1

    add-int/lit8 v10, v1, -0x1

    .local v10, "counter":I
    :goto_2b
    if-ltz v10, :cond_65

    .line 2787
    const-class v1, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    invoke-virtual {p0, v10}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->getColumnClass(I)Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_6e

    .line 2788
    new-instance v0, Ljava/awt/event/MouseEvent;

    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getID()I

    move-result v2

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getWhen()J

    move-result-wide v3

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getModifiers()I

    move-result v5

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getX()I

    move-result v6

    const/4 v7, 0x1

    invoke-virtual {p0, v12, v10, v7}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->getCellRect(IIZ)Ljava/awt/Rectangle;

    move-result-object v7

    iget v7, v7, Ljava/awt/Rectangle;->x:I

    sub-int/2addr v6, v7

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getY()I

    move-result v7

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getClickCount()I

    move-result v8

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->isPopupTrigger()Z

    move-result v9

    invoke-direct/range {v0 .. v9}, Ljava/awt/event/MouseEvent;-><init>(Ljava/awt/Component;IJIIIIZ)V

    .line 2794
    .local v0, "newME":Ljava/awt/event/MouseEvent;
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->dispatchEvent(Ljava/awt/AWTEvent;)V

    .line 2799
    .end local v0    # "newME":Ljava/awt/event/MouseEvent;
    .end local v10    # "counter":I
    .end local v12    # "row":I
    :cond_65
    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getClickCount()I

    move-result v1

    const/4 v2, 0x3

    if-lt v1, v2, :cond_71

    .line 2800
    const/4 v1, 0x1

    .line 2807
    .end local v11    # "me":Ljava/awt/event/MouseEvent;
    :goto_6d
    return v1

    .line 2786
    .restart local v10    # "counter":I
    .restart local v11    # "me":Ljava/awt/event/MouseEvent;
    .restart local v12    # "row":I
    :cond_6e
    add-int/lit8 v10, v10, -0x1

    goto :goto_2b

    .line 2802
    .end local v10    # "counter":I
    .end local v12    # "row":I
    :cond_71
    const/4 v1, 0x0

    goto :goto_6d

    .line 2804
    .end local v11    # "me":Ljava/awt/event/MouseEvent;
    :cond_73
    if-nez p1, :cond_77

    .line 2805
    const/4 v1, 0x1

    goto :goto_6d

    .line 2807
    :cond_77
    const/4 v1, 0x0

    goto :goto_6d
.end method

.method public resetTree(Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;)Ljavax/swing/JTree;
    .registers 8
    .param p1, "treeTableModel"    # Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 2726
    new-instance v2, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-direct {v2, p0, p1}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;Ljavax/swing/tree/TreeModel;)V

    iput-object v2, p0, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    .line 2729
    new-instance v2, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-direct {v2, p1, v3}, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModelAdapter;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;Ljavax/swing/JTree;)V

    invoke-super {p0, v2}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->setModel(Ljavax/swing/table/TableModel;)V

    .line 2732
    new-instance v1, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;

    invoke-direct {v1, p0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;)V

    .line 2734
    .local v1, "selectionWrapper":Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->setSelectionModel(Ljavax/swing/tree/TreeSelectionModel;)V

    .line 2735
    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->getListSelectionModel()Ljavax/swing/ListSelectionModel;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->setSelectionModel(Ljavax/swing/ListSelectionModel;)V

    .line 2738
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->getRowHeight()I

    move-result v2

    if-ge v2, v4, :cond_31

    .line 2740
    const/16 v2, 0x12

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->setRowHeight(I)V

    .line 2744
    :cond_31
    const-class v2, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    iget-object v3, p0, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {p0, v2, v3}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->setDefaultRenderer(Ljava/lang/Class;Ljavax/swing/table/TableCellRenderer;)V

    .line 2745
    const-class v2, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    new-instance v3, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;

    invoke-direct {v3, p0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;)V

    invoke-virtual {p0, v2, v3}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->setDefaultEditor(Ljava/lang/Class;Ljavax/swing/table/TableCellEditor;)V

    .line 2746
    invoke-virtual {p0, v4}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->setShowGrid(Z)V

    .line 2747
    new-instance v2, Ljava/awt/Dimension;

    invoke-direct {v2, v4, v4}, Ljava/awt/Dimension;-><init>(II)V

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->setIntercellSpacing(Ljava/awt/Dimension;)V

    .line 2748
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->setRootVisible(Z)V

    .line 2749
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v2, v4}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->setShowsRootHandles(Z)V

    .line 2750
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->getCellRenderer()Ljavax/swing/tree/TreeCellRenderer;

    move-result-object v0

    check-cast v0, Ljavax/swing/tree/DefaultTreeCellRenderer;

    .line 2751
    .local v0, "r":Ljavax/swing/tree/DefaultTreeCellRenderer;
    invoke-virtual {v0, v5}, Ljavax/swing/tree/DefaultTreeCellRenderer;->setOpenIcon(Ljavax/swing/Icon;)V

    .line 2752
    invoke-virtual {v0, v5}, Ljavax/swing/tree/DefaultTreeCellRenderer;->setClosedIcon(Ljavax/swing/Icon;)V

    .line 2753
    invoke-virtual {v0, v5}, Ljavax/swing/tree/DefaultTreeCellRenderer;->setLeafIcon(Ljavax/swing/Icon;)V

    .line 2754
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/MyTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    return-object v2
.end method
