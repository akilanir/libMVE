.class public abstract Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;
.super Landroid/support/v4/app/Fragment;
.source "AbstractFilePickerFragment.java"

# interfaces
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;
.implements Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;
.implements Lcom/nononsenseapps/filepicker/LogicHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;,
        Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;,
        Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;,
        Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v4/app/Fragment;",
        "Landroid/support/v4/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/support/v7/util/SortedList",
        "<TT;>;>;",
        "Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;",
        "Lcom/nononsenseapps/filepicker/LogicHandler",
        "<TT;>;"
    }
.end annotation


# static fields
.field public static final KEY_ALLOW_DIR_CREATE:Ljava/lang/String; = "KEY_ALLOW_DIR_CREATE"

.field public static final KEY_ALLOW_MULTIPLE:Ljava/lang/String; = "KEY_ALLOW_MULTIPLE"

.field protected static final KEY_CURRENT_PATH:Ljava/lang/String; = "KEY_CURRENT PATH"

.field public static final KEY_MODE:Ljava/lang/String; = "KEY_MODE"

.field public static final KEY_START_PATH:Ljava/lang/String; = "KEY_START_PATH"

.field public static final MODE_DIR:I = 0x1

.field public static final MODE_FILE:I = 0x0

.field public static final MODE_FILE_AND_DIR:I = 0x2


# instance fields
.field protected allowCreateDir:Z

.field protected allowMultiple:Z

.field protected mAdapter:Lcom/nononsenseapps/filepicker/FileItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nononsenseapps/filepicker/FileItemAdapter",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected final mCheckedItems:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected final mCheckedVisibleViewHolders:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<TT;>.CheckableViewHolder;>;"
        }
    .end annotation
.end field

.field protected mCurrentDirView:Landroid/widget/TextView;

.field protected mCurrentPath:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected mFiles:Landroid/support/v7/util/SortedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/SortedList",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

.field protected mToast:Landroid/widget/Toast;

.field protected mode:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 90
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 76
    iput v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    .line 77
    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    .line 78
    iput-boolean v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    .line 79
    iput-boolean v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    .line 81
    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mAdapter:Lcom/nononsenseapps/filepicker/FileItemAdapter;

    .line 83
    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mFiles:Landroid/support/v7/util/SortedList;

    .line 84
    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mToast:Landroid/widget/Toast;

    .line 91
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedItems:Ljava/util/HashSet;

    .line 92
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedVisibleViewHolders:Ljava/util/HashSet;

    .line 96
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->setRetainInstance(Z)V

    .line 97
    return-void
.end method


# virtual methods
.method public clearSelections()V
    .registers 5

    .prologue
    .line 522
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;

    .line 523
    .local v1, "vh":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.CheckableViewHolder;"
    iget-object v2, v1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_6

    .line 525
    .end local v1    # "vh":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.CheckableViewHolder;"
    :cond_19
    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V

    .line 526
    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedItems:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V

    .line 527
    return-void
.end method

.method protected getAdapter()Lcom/nononsenseapps/filepicker/FileItemAdapter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/nononsenseapps/filepicker/FileItemAdapter",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mAdapter:Lcom/nononsenseapps/filepicker/FileItemAdapter;

    return-object v0
.end method

.method protected getDummyAdapter()Lcom/nononsenseapps/filepicker/FileItemAdapter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/nononsenseapps/filepicker/FileItemAdapter",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    new-instance v0, Lcom/nononsenseapps/filepicker/FileItemAdapter;

    invoke-direct {v0, p0}, Lcom/nononsenseapps/filepicker/FileItemAdapter;-><init>(Lcom/nononsenseapps/filepicker/LogicHandler;)V

    return-object v0
.end method

.method public getFirstCheckedItem()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 243
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedItems:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 246
    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public getItemViewType(ILjava/lang/Object;)I
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)I"
        }
    .end annotation

    .prologue
    .line 457
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p2, "data":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->isCheckable(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 458
    const/4 v0, 0x2

    .line 460
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public goToDir(Ljava/lang/Object;)V
    .registers 3
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 572
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p1, "file":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    .line 573
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedItems:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 574
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 575
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->refresh()V

    .line 576
    return-void
.end method

.method public goUp()V
    .registers 2

    .prologue
    .line 548
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getParent(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->goToDir(Ljava/lang/Object;)V

    .line 549
    return-void
.end method

.method protected handlePermission()V
    .registers 1

    .prologue
    .line 394
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    return-void
.end method

.method protected hasPermission()Z
    .registers 2

    .prologue
    .line 404
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public isCheckable(Ljava/lang/Object;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p1, "data":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 259
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->isDir(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 260
    iget v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    if-ne v2, v1, :cond_10

    iget-boolean v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    if-nez v2, :cond_19

    :cond_10
    iget v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1a

    iget-boolean v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    if-eqz v2, :cond_1a

    :cond_19
    move v0, v1

    .line 266
    .local v0, "checkable":Z
    :cond_1a
    :goto_1a
    return v0

    .line 264
    .end local v0    # "checkable":Z
    :cond_1b
    iget v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    if-eq v2, v1, :cond_20

    move v0, v1

    .restart local v0    # "checkable":Z
    :cond_20
    goto :goto_1a
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 302
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 304
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    if-nez v0, :cond_3d

    .line 305
    if-eqz p1, :cond_41

    .line 306
    const-string v0, "KEY_MODE"

    iget v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    .line 307
    const-string v0, "KEY_ALLOW_DIR_CREATE"

    iget-boolean v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    .line 309
    const-string v0, "KEY_ALLOW_MULTIPLE"

    iget-boolean v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    .line 311
    const-string v0, "KEY_CURRENT PATH"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getPath(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    .line 326
    :cond_33
    :goto_33
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    if-nez v0, :cond_3d

    .line 327
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getRoot()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    .line 331
    :cond_3d
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->refresh()V

    .line 332
    return-void

    .line 313
    :cond_41
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_33

    .line 314
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "KEY_MODE"

    iget v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    .line 315
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "KEY_ALLOW_DIR_CREATE"

    iget-boolean v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    .line 317
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "KEY_ALLOW_MULTIPLE"

    iget-boolean v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    .line 319
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "KEY_START_PATH"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 320
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "KEY_START_PATH"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getPath(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    goto :goto_33
.end method

.method public onAttach(Landroid/content/Context;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 271
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 273
    :try_start_3
    move-object v0, p1

    check-cast v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    move-object v2, v0

    iput-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;
    :try_end_9
    .catch Ljava/lang/ClassCastException; {:try_start_3 .. :try_end_9} :catch_a

    .line 278
    return-void

    .line 274
    :catch_a
    move-exception v1

    .line 275
    .local v1, "e":Ljava/lang/ClassCastException;
    new-instance v2, Ljava/lang/ClassCastException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " must implement OnFilePickedListener"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public onBindHeaderViewHolder(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<TT;>.HeaderViewHolder;)V"
        }
    .end annotation

    .prologue
    .line 466
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p1, "viewHolder":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.HeaderViewHolder;"
    iget-object v0, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;->text:Landroid/widget/TextView;

    const-string v1, ".."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 467
    return-void
.end method

.method public onBindViewHolder(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;ILjava/lang/Object;)V
    .registers 7
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<TT;>.DirViewHolder;ITT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p1, "vh":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.DirViewHolder;"
    .local p3, "data":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x0

    .line 501
    iput-object p3, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;->file:Ljava/lang/Object;

    .line 502
    iget-object v2, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;->icon:Landroid/view/View;

    invoke-virtual {p0, p3}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->isDir(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    move v0, v1

    :goto_c
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 503
    iget-object v0, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;->text:Landroid/widget/TextView;

    invoke-virtual {p0, p3}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 505
    invoke-virtual {p0, p3}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->isCheckable(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    .line 506
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedItems:Ljava/util/HashSet;

    invoke-virtual {v0, p3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 507
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedVisibleViewHolders:Ljava/util/HashSet;

    move-object v0, p1

    check-cast v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 508
    check-cast p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;

    .end local p1    # "vh":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.DirViewHolder;"
    iget-object v0, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 515
    :cond_36
    :goto_36
    return-void

    .line 502
    .restart local p1    # "vh":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.DirViewHolder;"
    :cond_37
    const/16 v0, 0x8

    goto :goto_c

    .line 511
    :cond_3a
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 512
    check-cast p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;

    .end local p1    # "vh":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.DirViewHolder;"
    iget-object v0, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_36
.end method

.method public onClickCancel(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 189
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    if-eqz v0, :cond_9

    .line 190
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    invoke-interface {v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;->onCancelled()V

    .line 192
    :cond_9
    return-void
.end method

.method public onClickCheckBox(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<TT;>.CheckableViewHolder;)V"
        }
    .end annotation

    .prologue
    .line 625
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p1, "viewHolder":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.CheckableViewHolder;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedItems:Ljava/util/HashSet;

    iget-object v1, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->file:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 626
    iget-object v0, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 627
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedItems:Ljava/util/HashSet;

    iget-object v1, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->file:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 628
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 637
    :goto_1c
    return-void

    .line 630
    :cond_1d
    iget-boolean v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    if-nez v0, :cond_24

    .line 631
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->clearSelections()V

    .line 633
    :cond_24
    iget-object v0, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 634
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedItems:Ljava/util/HashSet;

    iget-object v1, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->file:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 635
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1c
.end method

.method public onClickCheckable(Landroid/view/View;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<TT;>.CheckableViewHolder;)V"
        }
    .end annotation

    .prologue
    .line 596
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p2, "viewHolder":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.CheckableViewHolder;"
    iget-object v0, p2, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->file:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->isDir(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 597
    iget-object v0, p2, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->file:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->goToDir(Ljava/lang/Object;)V

    .line 601
    :goto_d
    return-void

    .line 599
    :cond_e
    invoke-virtual {p0, p1, p2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->onLongClickCheckable(Landroid/view/View;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;)Z

    goto :goto_d
.end method

.method public onClickDir(Landroid/view/View;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<TT;>.DirViewHolder;)V"
        }
    .end annotation

    .prologue
    .line 558
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p2, "viewHolder":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.DirViewHolder;"
    iget-object v0, p2, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;->file:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->isDir(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 559
    iget-object v0, p2, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;->file:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->goToDir(Ljava/lang/Object;)V

    .line 561
    :cond_d
    return-void
.end method

.method public onClickHeader(Landroid/view/View;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<TT;>.HeaderViewHolder;)V"
        }
    .end annotation

    .prologue
    .line 537
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p2, "viewHolder":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.HeaderViewHolder;"
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->goUp()V

    .line 538
    return-void
.end method

.method public onClickOk(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 200
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    if-nez v0, :cond_5

    .line 228
    :goto_4
    return-void

    .line 205
    :cond_5
    iget-boolean v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    if-nez v0, :cond_d

    iget v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    if-nez v0, :cond_2c

    :cond_d
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedItems:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 206
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mToast:Landroid/widget/Toast;

    if-nez v0, :cond_26

    .line 207
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    sget v1, Lcom/nononsenseapps/filepicker/R$string;->nnf_select_something_first:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mToast:Landroid/widget/Toast;

    .line 210
    :cond_26
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mToast:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_4

    .line 214
    :cond_2c
    iget-boolean v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    if-eqz v0, :cond_3c

    .line 215
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedItems:Ljava/util/HashSet;

    invoke-virtual {p0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->toUri(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;->onFilesPicked(Ljava/util/List;)V

    goto :goto_4

    .line 216
    :cond_3c
    iget v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    if-nez v0, :cond_4e

    .line 217
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getFirstCheckedItem()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->toUri(Ljava/lang/Object;)Landroid/net/Uri;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;->onFilePicked(Landroid/net/Uri;)V

    goto :goto_4

    .line 218
    :cond_4e
    iget v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_5f

    .line 219
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->toUri(Ljava/lang/Object;)Landroid/net/Uri;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;->onFilePicked(Landroid/net/Uri;)V

    goto :goto_4

    .line 222
    :cond_5f
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedItems:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_73

    .line 223
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->toUri(Ljava/lang/Object;)Landroid/net/Uri;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;->onFilePicked(Landroid/net/Uri;)V

    goto :goto_4

    .line 225
    :cond_73
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getFirstCheckedItem()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->toUri(Ljava/lang/Object;)Landroid/net/Uri;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;->onFilePicked(Landroid/net/Uri;)V

    goto :goto_4
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 282
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 284
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->setHasOptionsMenu(Z)V

    .line 285
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .registers 4
    .param p1, "id"    # I
    .param p2, "args"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/support/v7/util/SortedList",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 416
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getLoader()Landroid/support/v4/content/Loader;

    move-result-object v0

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .registers 5
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 336
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    sget v1, Lcom/nononsenseapps/filepicker/R$menu;->picker_actions:I

    invoke-virtual {p2, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 338
    sget v1, Lcom/nononsenseapps/filepicker/R$id;->nnf_action_createdir:I

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 339
    .local v0, "item":Landroid/view/MenuItem;
    iget-boolean v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 340
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 10
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 140
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    sget v4, Lcom/nononsenseapps/filepicker/R$layout;->nnf_fragment_filepicker:I

    const/4 v5, 0x0

    invoke-virtual {p1, v4, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 142
    .local v3, "view":Landroid/view/View;
    sget v4, Lcom/nononsenseapps/filepicker/R$id;->nnf_picker_toolbar:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/Toolbar;

    .line 143
    .local v2, "toolbar":Landroid/support/v7/widget/Toolbar;
    if-eqz v2, :cond_14

    .line 144
    invoke-virtual {p0, v2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->setupToolbar(Landroid/support/v7/widget/Toolbar;)V

    .line 147
    :cond_14
    const v4, 0x102000a

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    .line 150
    .local v1, "mRecyclerView":Landroid/support/v7/widget/RecyclerView;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 152
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-direct {v0, v4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 153
    .local v0, "mLayoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 155
    new-instance v4, Lcom/nononsenseapps/filepicker/FileItemAdapter;

    invoke-direct {v4, p0}, Lcom/nononsenseapps/filepicker/FileItemAdapter;-><init>(Lcom/nononsenseapps/filepicker/LogicHandler;)V

    iput-object v4, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mAdapter:Lcom/nononsenseapps/filepicker/FileItemAdapter;

    .line 156
    iget-object v4, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mAdapter:Lcom/nononsenseapps/filepicker/FileItemAdapter;

    invoke-virtual {v1, v4}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 158
    sget v4, Lcom/nononsenseapps/filepicker/R$id;->nnf_button_cancel:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    new-instance v5, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$1;

    invoke-direct {v5, p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$1;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 166
    sget v4, Lcom/nononsenseapps/filepicker/R$id;->nnf_button_ok:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    new-instance v5, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;

    invoke-direct {v5, p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    sget v4, Lcom/nononsenseapps/filepicker/R$id;->nnf_current_dir:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentDirView:Landroid/widget/TextView;

    .line 176
    iget-object v4, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    if-eqz v4, :cond_72

    iget-object v4, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentDirView:Landroid/widget/TextView;

    if-eqz v4, :cond_72

    .line 177
    iget-object v4, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentDirView:Landroid/widget/TextView;

    iget-object v5, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    invoke-virtual {p0, v5}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getFullPath(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 180
    :cond_72
    return-object v3
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 7
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    const/4 v3, 0x0

    .line 477
    packed-switch p2, :pswitch_data_40

    .line 488
    :pswitch_4
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/nononsenseapps/filepicker/R$layout;->nnf_filepicker_listitem_dir:I

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 490
    .local v0, "v":Landroid/view/View;
    new-instance v1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;Landroid/view/View;)V

    :goto_17
    return-object v1

    .line 479
    .end local v0    # "v":Landroid/view/View;
    :pswitch_18
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/nononsenseapps/filepicker/R$layout;->nnf_filepicker_listitem_dir:I

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 481
    .restart local v0    # "v":Landroid/view/View;
    new-instance v1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;Landroid/view/View;)V

    goto :goto_17

    .line 483
    .end local v0    # "v":Landroid/view/View;
    :pswitch_2c
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/nononsenseapps/filepicker/R$layout;->nnf_filepicker_listitem_checkable:I

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 485
    .restart local v0    # "v":Landroid/view/View;
    new-instance v1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;Landroid/view/View;)V

    goto :goto_17

    .line 477
    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_18
        :pswitch_4
        :pswitch_2c
    .end packed-switch
.end method

.method public onDetach()V
    .registers 2

    .prologue
    .line 368
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDetach()V

    .line 369
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    .line 370
    return-void
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/support/v7/util/SortedList;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/support/v7/util/SortedList",
            "<TT;>;>;",
            "Landroid/support/v7/util/SortedList",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 428
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/support/v7/util/SortedList<TT;>;>;"
    .local p2, "data":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedItems:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 429
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCheckedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 430
    iput-object p2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mFiles:Landroid/support/v7/util/SortedList;

    .line 431
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mAdapter:Lcom/nononsenseapps/filepicker/FileItemAdapter;

    invoke-virtual {v0, p2}, Lcom/nononsenseapps/filepicker/FileItemAdapter;->setList(Landroid/support/v7/util/SortedList;)V

    .line 432
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentDirView:Landroid/widget/TextView;

    if-eqz v0, :cond_20

    .line 433
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentDirView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getFullPath(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 435
    :cond_20
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v4/content/Loader;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 55
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    check-cast p2, Landroid/support/v7/util/SortedList;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/support/v7/util/SortedList;)V

    return-void
.end method

.method public onLoaderReset(Landroid/support/v4/content/Loader;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/support/v7/util/SortedList",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/support/v7/util/SortedList<TT;>;>;"
    const/4 v1, 0x0

    .line 446
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mAdapter:Lcom/nononsenseapps/filepicker/FileItemAdapter;

    invoke-virtual {v0, v1}, Lcom/nononsenseapps/filepicker/FileItemAdapter;->setList(Landroid/support/v7/util/SortedList;)V

    .line 447
    iput-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mFiles:Landroid/support/v7/util/SortedList;

    .line 448
    return-void
.end method

.method public onLongClickCheckable(Landroid/view/View;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;)Z
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<TT;>.CheckableViewHolder;)Z"
        }
    .end annotation

    .prologue
    .line 613
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p2, "viewHolder":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.CheckableViewHolder;"
    invoke-virtual {p0, p2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->onClickCheckBox(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;)V

    .line 614
    const/4 v0, 0x1

    return v0
.end method

.method public onLongClickDir(Landroid/view/View;Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;)Z
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<TT;>.DirViewHolder;)Z"
        }
    .end annotation

    .prologue
    .line 586
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p2, "viewHolder":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.DirViewHolder;"
    const/4 v0, 0x0

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 5
    .param p1, "menuItem"    # Landroid/view/MenuItem;

    .prologue
    .line 344
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    sget v1, Lcom/nononsenseapps/filepicker/R$id;->nnf_action_createdir:I

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    if-ne v1, v2, :cond_1b

    .line 345
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 346
    .local v0, "activity":Landroid/app/Activity;
    instance-of v1, v0, Landroid/support/v7/app/AppCompatActivity;

    if-eqz v1, :cond_19

    .line 347
    check-cast v0, Landroid/support/v7/app/AppCompatActivity;

    .end local v0    # "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/support/v7/app/AppCompatActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/nononsenseapps/filepicker/NewFolderFragment;->showDialog(Landroid/support/v4/app/FragmentManager;Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;)V

    .line 350
    :cond_19
    const/4 v1, 0x1

    .line 352
    :goto_1a
    return v1

    :cond_1b
    const/4 v1, 0x0

    goto :goto_1a
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 359
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 360
    const-string v0, "KEY_CURRENT PATH"

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 361
    const-string v0, "KEY_ALLOW_MULTIPLE"

    iget-boolean v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 362
    const-string v0, "KEY_ALLOW_DIR_CREATE"

    iget-boolean v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 363
    const-string v0, "KEY_MODE"

    iget v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 364
    return-void
.end method

.method protected refresh()V
    .registers 4

    .prologue
    .line 379
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->hasPermission()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 380
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 385
    :goto_f
    return-void

    .line 383
    :cond_10
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->handlePermission()V

    goto :goto_f
.end method

.method public setArgs(Ljava/lang/String;IZZ)V
    .registers 7
    .param p1, "startPath"    # Ljava/lang/String;
    .param p2, "mode"    # I
    .param p3, "allowMultiple"    # Z
    .param p4, "allowDirCreate"    # Z

    .prologue
    .line 123
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 124
    .local v0, "b":Landroid/os/Bundle;
    if-nez v0, :cond_b

    .line 125
    new-instance v0, Landroid/os/Bundle;

    .end local v0    # "b":Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 128
    .restart local v0    # "b":Landroid/os/Bundle;
    :cond_b
    if-eqz p1, :cond_12

    .line 129
    const-string v1, "KEY_START_PATH"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    :cond_12
    const-string v1, "KEY_ALLOW_DIR_CREATE"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 132
    const-string v1, "KEY_ALLOW_MULTIPLE"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 133
    const-string v1, "KEY_MODE"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 134
    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->setArguments(Landroid/os/Bundle;)V

    .line 135
    return-void
.end method

.method protected setupToolbar(Landroid/support/v7/widget/Toolbar;)V
    .registers 3
    .param p1, "toolbar"    # Landroid/support/v7/widget/Toolbar;

    .prologue
    .line 238
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Landroid/support/v7/app/AppCompatActivity;

    invoke-virtual {v0, p1}, Landroid/support/v7/app/AppCompatActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 239
    return-void
.end method

.method protected toUri(Ljava/lang/Iterable;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TT;>;)",
            "Ljava/util/List",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .prologue
    .line 250
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p1, "files":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 251
    .local v2, "uris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 252
    .local v0, "file":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->toUri(Ljava/lang/Object;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 254
    .end local v0    # "file":Ljava/lang/Object;, "TT;"
    :cond_1b
    return-object v2
.end method
