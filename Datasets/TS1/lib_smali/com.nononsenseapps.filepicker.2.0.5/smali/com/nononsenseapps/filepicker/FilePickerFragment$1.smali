.class Lcom/nononsenseapps/filepicker/FilePickerFragment$1;
.super Landroid/support/v4/content/AsyncTaskLoader;
.source "FilePickerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nononsenseapps/filepicker/FilePickerFragment;->getLoader()Landroid/support/v4/content/Loader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/content/AsyncTaskLoader",
        "<",
        "Landroid/support/v7/util/SortedList",
        "<",
        "Ljava/io/File;",
        ">;>;"
    }
.end annotation


# instance fields
.field fileObserver:Landroid/os/FileObserver;

.field final synthetic this$0:Lcom/nononsenseapps/filepicker/FilePickerFragment;


# direct methods
.method constructor <init>(Lcom/nononsenseapps/filepicker/FilePickerFragment;Landroid/content/Context;)V
    .registers 3
    .param p2, "x0"    # Landroid/content/Context;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->this$0:Lcom/nononsenseapps/filepicker/FilePickerFragment;

    invoke-direct {p0, p2}, Landroid/support/v4/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public loadInBackground()Landroid/support/v7/util/SortedList;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v7/util/SortedList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 124
    iget-object v7, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->this$0:Lcom/nononsenseapps/filepicker/FilePickerFragment;

    iget-object v7, v7, Lcom/nononsenseapps/filepicker/FilePickerFragment;->currentPath:Ljava/lang/Object;

    check-cast v7, Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v6

    .line 125
    .local v6, "listFiles":[Ljava/io/File;
    if-nez v6, :cond_44

    const/4 v4, 0x0

    .line 127
    .local v4, "initCap":I
    :goto_d
    new-instance v2, Landroid/support/v7/util/SortedList;

    const-class v7, Ljava/io/File;

    new-instance v8, Lcom/nononsenseapps/filepicker/FilePickerFragment$1$1;

    iget-object v9, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->this$0:Lcom/nononsenseapps/filepicker/FilePickerFragment;

    invoke-virtual {v9}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getDummyAdapter()Lcom/nononsenseapps/filepicker/FileItemAdapter;

    move-result-object v9

    invoke-direct {v8, p0, v9}, Lcom/nononsenseapps/filepicker/FilePickerFragment$1$1;-><init>(Lcom/nononsenseapps/filepicker/FilePickerFragment$1;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    invoke-direct {v2, v7, v8, v4}, Landroid/support/v7/util/SortedList;-><init>(Ljava/lang/Class;Landroid/support/v7/util/SortedList$Callback;I)V

    .line 152
    .local v2, "files":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<Ljava/io/File;>;"
    invoke-virtual {v2}, Landroid/support/v7/util/SortedList;->beginBatchedUpdates()V

    .line 153
    if-eqz v6, :cond_46

    .line 154
    move-object v0, v6

    .local v0, "arr$":[Ljava/io/File;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_27
    if-ge v3, v5, :cond_46

    aget-object v1, v0, v3

    .line 155
    .local v1, "f":Ljava/io/File;
    iget-object v7, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->this$0:Lcom/nononsenseapps/filepicker/FilePickerFragment;

    iget v7, v7, Lcom/nononsenseapps/filepicker/FilePickerFragment;->mode:I

    if-eqz v7, :cond_3e

    iget-object v7, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->this$0:Lcom/nononsenseapps/filepicker/FilePickerFragment;

    iget v7, v7, Lcom/nononsenseapps/filepicker/FilePickerFragment;->mode:I

    const/4 v8, 0x2

    if-eq v7, v8, :cond_3e

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_41

    .line 157
    :cond_3e
    invoke-virtual {v2, v1}, Landroid/support/v7/util/SortedList;->add(Ljava/lang/Object;)I

    .line 154
    :cond_41
    add-int/lit8 v3, v3, 0x1

    goto :goto_27

    .line 125
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "files":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<Ljava/io/File;>;"
    .end local v3    # "i$":I
    .end local v4    # "initCap":I
    .end local v5    # "len$":I
    :cond_44
    array-length v4, v6

    goto :goto_d

    .line 162
    .restart local v2    # "files":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<Ljava/io/File;>;"
    .restart local v4    # "initCap":I
    :cond_46
    invoke-virtual {v2}, Landroid/support/v7/util/SortedList;->endBatchedUpdates()V

    .line 164
    return-object v2
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->loadInBackground()Landroid/support/v7/util/SortedList;

    move-result-object v0

    return-object v0
.end method

.method protected onReset()V
    .registers 2

    .prologue
    .line 202
    invoke-super {p0}, Landroid/support/v4/content/AsyncTaskLoader;->onReset()V

    .line 205
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->fileObserver:Landroid/os/FileObserver;

    if-eqz v0, :cond_f

    .line 206
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->fileObserver:Landroid/os/FileObserver;

    invoke-virtual {v0}, Landroid/os/FileObserver;->stopWatching()V

    .line 207
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->fileObserver:Landroid/os/FileObserver;

    .line 209
    :cond_f
    return-void
.end method

.method protected onStartLoading()V
    .registers 4

    .prologue
    .line 172
    invoke-super {p0}, Landroid/support/v4/content/AsyncTaskLoader;->onStartLoading()V

    .line 175
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->this$0:Lcom/nononsenseapps/filepicker/FilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->currentPath:Ljava/lang/Object;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->this$0:Lcom/nononsenseapps/filepicker/FilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->currentPath:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_1f

    .line 176
    :cond_15
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->this$0:Lcom/nononsenseapps/filepicker/FilePickerFragment;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->this$0:Lcom/nononsenseapps/filepicker/FilePickerFragment;

    invoke-virtual {v1}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getRoot()Ljava/io/File;

    move-result-object v1

    iput-object v1, v0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->currentPath:Ljava/lang/Object;

    .line 180
    :cond_1f
    new-instance v1, Lcom/nononsenseapps/filepicker/FilePickerFragment$1$2;

    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->this$0:Lcom/nononsenseapps/filepicker/FilePickerFragment;

    iget-object v0, v0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->currentPath:Ljava/lang/Object;

    check-cast v0, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x3c0

    invoke-direct {v1, p0, v0, v2}, Lcom/nononsenseapps/filepicker/FilePickerFragment$1$2;-><init>(Lcom/nononsenseapps/filepicker/FilePickerFragment$1;Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->fileObserver:Landroid/os/FileObserver;

    .line 192
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->fileObserver:Landroid/os/FileObserver;

    invoke-virtual {v0}, Landroid/os/FileObserver;->startWatching()V

    .line 194
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;->forceLoad()V

    .line 195
    return-void
.end method
