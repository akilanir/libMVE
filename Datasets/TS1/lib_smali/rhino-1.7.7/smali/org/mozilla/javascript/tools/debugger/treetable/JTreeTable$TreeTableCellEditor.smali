.class public Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;
.super Lorg/mozilla/javascript/tools/debugger/treetable/AbstractCellEditor;
.source "JTreeTable.java"

# interfaces
.implements Ljavax/swing/table/TableCellEditor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TreeTableCellEditor"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;)V
    .registers 2

    .prologue
    .line 238
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    invoke-direct {p0}, Lorg/mozilla/javascript/tools/debugger/treetable/AbstractCellEditor;-><init>()V

    return-void
.end method


# virtual methods
.method public getTableCellEditorComponent(Ljavax/swing/JTable;Ljava/lang/Object;ZII)Ljava/awt/Component;
    .registers 7
    .param p1, "table"    # Ljavax/swing/JTable;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "isSelected"    # Z
    .param p4, "r"    # I
    .param p5, "c"    # I

    .prologue
    .line 244
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    iget-object v0, v0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    return-object v0
.end method

.method public isCellEditable(Ljava/util/EventObject;)Z
    .registers 15
    .param p1, "e"    # Ljava/util/EventObject;

    .prologue
    const/4 v12, 0x0

    .line 267
    instance-of v1, p1, Ljava/awt/event/MouseEvent;

    if-eqz v1, :cond_52

    .line 268
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->getColumnCount()I

    move-result v1

    add-int/lit8 v10, v1, -0x1

    .local v10, "counter":I
    :goto_d
    if-ltz v10, :cond_52

    .line 270
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    invoke-virtual {v1, v10}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->getColumnClass(I)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lorg/mozilla/javascript/tools/debugger/treetable/TreeTableModel;

    if-ne v1, v2, :cond_53

    move-object v11, p1

    .line 271
    check-cast v11, Ljava/awt/event/MouseEvent;

    .line 272
    .local v11, "me":Ljava/awt/event/MouseEvent;
    new-instance v0, Ljava/awt/event/MouseEvent;

    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    iget-object v1, v1, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getID()I

    move-result v2

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getWhen()J

    move-result-wide v3

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getModifiers()I

    move-result v5

    invoke-virtual {v11}, Ljava/awt/event/MouseEvent;->getX()I

    move-result v6

    iget-object v7, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    const/4 v8, 0x1

    invoke-virtual {v7, v12, v10, v8}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->getCellRect(IIZ)Ljava/awt/Rectangle;

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

    .line 277
    .local v0, "newME":Ljava/awt/event/MouseEvent;
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellEditor;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    iget-object v1, v1, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v1, v0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->dispatchEvent(Ljava/awt/AWTEvent;)V

    .line 282
    .end local v0    # "newME":Ljava/awt/event/MouseEvent;
    .end local v10    # "counter":I
    .end local v11    # "me":Ljava/awt/event/MouseEvent;
    :cond_52
    return v12

    .line 269
    .restart local v10    # "counter":I
    :cond_53
    add-int/lit8 v10, v10, -0x1

    goto :goto_d
.end method
