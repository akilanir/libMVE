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

.field protected final checkedItems:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected final checkedVisibleViewHolders:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
            "<TT;>.CheckableViewHolder;>;"
        }
    .end annotation
.end field

.field private currentDirView:Landroid/widget/TextView;

.field protected currentPath:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private listener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

.field private mAdapter:Lcom/nononsenseapps/filepicker/FileItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nononsenseapps/filepicker/FileItemAdapter",
            "<TT;>;"
        }
    .end annotation
.end field

.field private mFiles:Landroid/support/v7/util/SortedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/SortedList",
            "<TT;>;"
        }
    .end annotation
.end field

.field private mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mToolbar:Landroid/support/v7/widget/Toolbar;

.field protected mode:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 98
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 60
    iput v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    .line 75
    iput-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    .line 76
    iput-boolean v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    .line 77
    iput-boolean v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    .line 79
    iput-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mAdapter:Lcom/nononsenseapps/filepicker/FileItemAdapter;

    .line 84
    iput-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mFiles:Landroid/support/v7/util/SortedList;

    .line 99
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedItems:Ljava/util/HashSet;

    .line 100
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedVisibleViewHolders:Ljava/util/HashSet;

    .line 104
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->setRetainInstance(Z)V

    .line 105
    return-void
.end method

.method static synthetic access$000(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;
    .registers 2
    .param p0, "x0"    # Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->listener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    return-object v0
.end method


# virtual methods
.method public clearSelections()V
    .registers 5

    .prologue
    .line 591
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedVisibleViewHolders:Ljava/util/HashSet;

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

    .line 592
    .local v1, "vh":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.CheckableViewHolder;"
    iget-object v2, v1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_6

    .line 594
    .end local v1    # "vh":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.CheckableViewHolder;"
    :cond_19
    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V

    .line 595
    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedItems:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V

    .line 596
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
    .line 87
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
    .line 91
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
    .line 203
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedItems:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 206
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
    .line 407
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p2, "data":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->isCheckable(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 408
    const/4 v0, 0x2

    .line 410
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x1

    goto :goto_7
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

    .line 219
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->isDir(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 220
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

    .line 226
    .local v0, "checkable":Z
    :cond_1a
    :goto_1a
    return v0

    .line 224
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
    .line 262
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 264
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    if-nez v0, :cond_3d

    .line 265
    if-eqz p1, :cond_41

    .line 266
    const-string v0, "KEY_MODE"

    iget v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    .line 267
    const-string v0, "KEY_ALLOW_DIR_CREATE"

    iget-boolean v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    .line 269
    const-string v0, "KEY_ALLOW_MULTIPLE"

    iget-boolean v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    .line 271
    const-string v0, "KEY_CURRENT PATH"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getPath(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    .line 286
    :cond_33
    :goto_33
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    if-nez v0, :cond_3d

    .line 287
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getRoot()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    .line 291
    :cond_3d
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->refresh()V

    .line 292
    return-void

    .line 273
    :cond_41
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_33

    .line 274
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "KEY_MODE"

    iget v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    .line 275
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "KEY_ALLOW_DIR_CREATE"

    iget-boolean v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    .line 277
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "KEY_ALLOW_MULTIPLE"

    iget-boolean v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    .line 279
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "KEY_START_PATH"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 280
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "KEY_START_PATH"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getPath(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    goto :goto_33
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 7
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 231
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 233
    :try_start_3
    move-object v0, p1

    check-cast v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    move-object v2, v0

    iput-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->listener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;
    :try_end_9
    .catch Ljava/lang/ClassCastException; {:try_start_3 .. :try_end_9} :catch_a

    .line 238
    return-void

    .line 234
    :catch_a
    move-exception v1

    .line 235
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
    .line 416
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p1, "viewHolder":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.HeaderViewHolder;"
    iget-object v0, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;->text:Landroid/widget/TextView;

    const-string v1, ".."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 417
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

    .line 451
    iput-object p3, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;->file:Ljava/lang/Object;

    .line 452
    iget-object v2, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;->icon:Landroid/view/View;

    invoke-virtual {p0, p3}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->isDir(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    move v0, v1

    :goto_c
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 453
    iget-object v0, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;->text:Landroid/widget/TextView;

    invoke-virtual {p0, p3}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 455
    invoke-virtual {p0, p3}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->isCheckable(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    .line 456
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedItems:Ljava/util/HashSet;

    invoke-virtual {v0, p3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 457
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedVisibleViewHolders:Ljava/util/HashSet;

    move-object v0, p1

    check-cast v0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 458
    check-cast p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;

    .end local p1    # "vh":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.DirViewHolder;"
    iget-object v0, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 464
    :cond_36
    :goto_36
    return-void

    .line 452
    .restart local p1    # "vh":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.DirViewHolder;"
    :cond_37
    const/16 v0, 0x8

    goto :goto_c

    .line 460
    :cond_3a
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 461
    check-cast p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;

    .end local p1    # "vh":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>.DirViewHolder;"
    iget-object v0, p1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;->checkbox:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_36
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 242
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 244
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->setHasOptionsMenu(Z)V

    .line 245
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
    .line 349
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getLoader()Landroid/support/v4/content/Loader;

    move-result-object v0

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .registers 6
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    const/4 v1, 0x1

    .line 296
    sget v2, Lcom/nononsenseapps/filepicker/R$menu;->picker_actions:I

    invoke-virtual {p2, v2, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 298
    sget v2, Lcom/nononsenseapps/filepicker/R$id;->action_createdir:I

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 299
    .local v0, "item":Landroid/view/MenuItem;
    iget-boolean v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    if-eqz v2, :cond_18

    iget v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    if-ne v2, v1, :cond_18

    :goto_14
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 300
    return-void

    .line 299
    :cond_18
    const/4 v1, 0x0

    goto :goto_14
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 7
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 130
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    sget v1, Lcom/nononsenseapps/filepicker/R$layout;->fragment_filepicker:I

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 132
    .local v0, "view":Landroid/view/View;
    sget v1, Lcom/nononsenseapps/filepicker/R$id;->picker_toolbar:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/Toolbar;

    iput-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mToolbar:Landroid/support/v7/widget/Toolbar;

    .line 133
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Landroid/support/v7/app/AppCompatActivity;

    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1, v2}, Landroid/support/v7/app/AppCompatActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 136
    const v1, 0x102000a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    iput-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 139
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 144
    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 145
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 147
    new-instance v1, Lcom/nononsenseapps/filepicker/FileItemAdapter;

    invoke-direct {v1, p0}, Lcom/nononsenseapps/filepicker/FileItemAdapter;-><init>(Lcom/nononsenseapps/filepicker/LogicHandler;)V

    iput-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mAdapter:Lcom/nononsenseapps/filepicker/FileItemAdapter;

    .line 148
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mAdapter:Lcom/nononsenseapps/filepicker/FileItemAdapter;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 150
    sget v1, Lcom/nononsenseapps/filepicker/R$id;->button_cancel:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$1;

    invoke-direct {v2, p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$1;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    sget v1, Lcom/nononsenseapps/filepicker/R$id;->button_ok:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;

    invoke-direct {v2, p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$2;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 193
    sget v1, Lcom/nononsenseapps/filepicker/R$id;->current_dir:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentDirView:Landroid/widget/TextView;

    .line 195
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    if-eqz v1, :cond_82

    .line 196
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentDirView:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    invoke-virtual {p0, v2}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getFullPath(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 199
    :cond_82
    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 7
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    const/4 v3, 0x0

    .line 427
    packed-switch p2, :pswitch_data_40

    .line 438
    :pswitch_4
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/nononsenseapps/filepicker/R$layout;->filepicker_listitem_dir:I

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 440
    .local v0, "v":Landroid/view/View;
    new-instance v1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$DirViewHolder;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;Landroid/view/View;)V

    :goto_17
    return-object v1

    .line 429
    .end local v0    # "v":Landroid/view/View;
    :pswitch_18
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/nononsenseapps/filepicker/R$layout;->filepicker_listitem_dir:I

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 431
    .restart local v0    # "v":Landroid/view/View;
    new-instance v1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$HeaderViewHolder;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;Landroid/view/View;)V

    goto :goto_17

    .line 433
    .end local v0    # "v":Landroid/view/View;
    :pswitch_2c
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/nononsenseapps/filepicker/R$layout;->filepicker_listitem_checkable:I

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 435
    .restart local v0    # "v":Landroid/view/View;
    new-instance v1, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;

    invoke-direct {v1, p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$CheckableViewHolder;-><init>(Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;Landroid/view/View;)V

    goto :goto_17

    .line 427
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
    .line 328
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDetach()V

    .line 329
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->listener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    .line 330
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
    .line 361
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/support/v7/util/SortedList<TT;>;>;"
    .local p2, "data":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedItems:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 362
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->checkedVisibleViewHolders:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 363
    iput-object p2, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mFiles:Landroid/support/v7/util/SortedList;

    .line 364
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mAdapter:Lcom/nononsenseapps/filepicker/FileItemAdapter;

    invoke-virtual {v0, p2}, Lcom/nononsenseapps/filepicker/FileItemAdapter;->setList(Landroid/support/v7/util/SortedList;)V

    .line 365
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentDirView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getFullPath(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 366
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v4/content/Loader;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 53
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

    .line 377
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mAdapter:Lcom/nononsenseapps/filepicker/FileItemAdapter;

    invoke-virtual {v0, v1}, Lcom/nononsenseapps/filepicker/FileItemAdapter;->setList(Landroid/support/v7/util/SortedList;)V

    .line 378
    iput-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mFiles:Landroid/support/v7/util/SortedList;

    .line 379
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 5
    .param p1, "menuItem"    # Landroid/view/MenuItem;

    .prologue
    .line 304
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    sget v1, Lcom/nononsenseapps/filepicker/R$id;->action_createdir:I

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    if-ne v1, v2, :cond_1b

    .line 305
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 306
    .local v0, "activity":Landroid/app/Activity;
    instance-of v1, v0, Landroid/support/v7/app/AppCompatActivity;

    if-eqz v1, :cond_19

    .line 307
    check-cast v0, Landroid/support/v7/app/AppCompatActivity;

    .end local v0    # "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/support/v7/app/AppCompatActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/nononsenseapps/filepicker/NewFolderFragment;->showDialog(Landroid/support/v4/app/FragmentManager;Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;)V

    .line 310
    :cond_19
    const/4 v1, 0x1

    .line 312
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
    .line 319
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 320
    const-string v0, "KEY_CURRENT PATH"

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->currentPath:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    const-string v0, "KEY_ALLOW_MULTIPLE"

    iget-boolean v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowMultiple:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 322
    const-string v0, "KEY_ALLOW_DIR_CREATE"

    iget-boolean v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->allowCreateDir:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 323
    const-string v0, "KEY_MODE"

    iget v1, p0, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->mode:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 324
    return-void
.end method

.method protected refresh()V
    .registers 4

    .prologue
    .line 336
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 338
    return-void
.end method

.method public setArgs(Ljava/lang/String;IZZ)V
    .registers 7
    .param p1, "startPath"    # Ljava/lang/String;
    .param p2, "mode"    # I
    .param p3, "allowMultiple"    # Z
    .param p4, "allowDirCreate"    # Z

    .prologue
    .line 117
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 118
    .local v0, "b":Landroid/os/Bundle;
    if-eqz p1, :cond_c

    .line 119
    const-string v1, "KEY_START_PATH"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    :cond_c
    const-string v1, "KEY_ALLOW_DIR_CREATE"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 122
    const-string v1, "KEY_ALLOW_MULTIPLE"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 123
    const-string v1, "KEY_MODE"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 124
    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->setArguments(Landroid/os/Bundle;)V

    .line 125
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
    .line 210
    .local p0, "this":Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;, "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment<TT;>;"
    .local p1, "files":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 211
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

    .line 212
    .local v0, "file":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;->toUri(Ljava/lang/Object;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 214
    .end local v0    # "file":Ljava/lang/Object;, "TT;"
    :cond_1b
    return-object v2
.end method
