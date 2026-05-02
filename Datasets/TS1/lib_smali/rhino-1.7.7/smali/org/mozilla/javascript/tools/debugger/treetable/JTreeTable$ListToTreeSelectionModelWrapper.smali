.class public Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;
.super Ljavax/swing/tree/DefaultTreeSelectionModel;
.source "JTreeTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ListToTreeSelectionModelWrapper"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper$ListSelectionHandler;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x715b10ced10c319bL


# instance fields
.field final synthetic this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

.field protected updatingListSelectionModel:Z


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;)V
    .registers 4

    .prologue
    .line 301
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    .line 302
    invoke-direct {p0}, Ljavax/swing/tree/DefaultTreeSelectionModel;-><init>()V

    .line 303
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->getListSelectionModel()Ljavax/swing/ListSelectionModel;

    move-result-object v0

    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->createListSelectionListener()Ljavax/swing/event/ListSelectionListener;

    move-result-object v1

    invoke-interface {v0, v1}, Ljavax/swing/ListSelectionModel;->addListSelectionListener(Ljavax/swing/event/ListSelectionListener;)V

    .line 305
    return-void
.end method


# virtual methods
.method protected createListSelectionListener()Ljavax/swing/event/ListSelectionListener;
    .registers 2

    .prologue
    .line 343
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper$ListSelectionHandler;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper$ListSelectionHandler;-><init>(Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;)V

    return-object v0
.end method

.method public getListSelectionModel()Ljavax/swing/ListSelectionModel;
    .registers 2

    .prologue
    .line 313
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->listSelectionModel:Ljavax/swing/DefaultListSelectionModel;

    return-object v0
.end method

.method public resetRowSelection()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 323
    iget-boolean v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    if-nez v0, :cond_d

    .line 324
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    .line 326
    :try_start_8
    invoke-super {p0}, Ljavax/swing/tree/DefaultTreeSelectionModel;->resetRowSelection()V
    :try_end_b
    .catchall {:try_start_8 .. :try_end_b} :catchall_e

    .line 329
    iput-boolean v1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    .line 337
    :cond_d
    return-void

    .line 329
    :catchall_e
    move-exception v0

    iput-boolean v1, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    throw v0
.end method

.method protected updateSelectedPathsFromSelectedRows()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    .line 352
    iget-boolean v4, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    if-nez v4, :cond_39

    .line 353
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    .line 357
    :try_start_9
    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->listSelectionModel:Ljavax/swing/DefaultListSelectionModel;

    invoke-virtual {v4}, Ljavax/swing/DefaultListSelectionModel;->getMinSelectionIndex()I

    move-result v2

    .line 358
    .local v2, "min":I
    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->listSelectionModel:Ljavax/swing/DefaultListSelectionModel;

    invoke-virtual {v4}, Ljavax/swing/DefaultListSelectionModel;->getMaxSelectionIndex()I

    move-result v1

    .line 360
    .local v1, "max":I
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->clearSelection()V

    .line 361
    if-eq v2, v5, :cond_37

    if-eq v1, v5, :cond_37

    .line 362
    move v0, v2

    .local v0, "counter":I
    :goto_1d
    if-gt v0, v1, :cond_37

    .line 363
    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->listSelectionModel:Ljavax/swing/DefaultListSelectionModel;

    invoke-virtual {v4, v0}, Ljavax/swing/DefaultListSelectionModel;->isSelectedIndex(I)Z

    move-result v4

    if-eqz v4, :cond_34

    .line 364
    iget-object v4, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->this$0:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;

    iget-object v4, v4, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable;->tree:Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;

    invoke-virtual {v4, v0}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$TreeTableCellRenderer;->getPathForRow(I)Ljavax/swing/tree/TreePath;

    move-result-object v3

    .line 367
    .local v3, "selPath":Ljavax/swing/tree/TreePath;
    if-eqz v3, :cond_34

    .line 368
    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->addSelectionPath(Ljavax/swing/tree/TreePath;)V
    :try_end_34
    .catchall {:try_start_9 .. :try_end_34} :catchall_3a

    .line 362
    .end local v3    # "selPath":Ljavax/swing/tree/TreePath;
    :cond_34
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d

    .line 375
    .end local v0    # "counter":I
    :cond_37
    iput-boolean v6, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    .line 378
    .end local v1    # "max":I
    .end local v2    # "min":I
    :cond_39
    return-void

    .line 375
    :catchall_3a
    move-exception v4

    iput-boolean v6, p0, Lorg/mozilla/javascript/tools/debugger/treetable/JTreeTable$ListToTreeSelectionModelWrapper;->updatingListSelectionModel:Z

    throw v4
.end method
