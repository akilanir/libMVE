.class public Lcom/nononsenseapps/filepicker/FilePickerFragment;
.super Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;
.source "FilePickerFragment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment",
        "<",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;-><init>()V

    .line 34
    return-void
.end method


# virtual methods
.method public getFullPath(Ljava/io/File;)Ljava/lang/String;
    .registers 3
    .param p1, "path"    # Ljava/io/File;

    .prologue
    .line 90
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getFullPath(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 31
    check-cast p1, Ljava/io/File;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getFullPath(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLoader()Landroid/support/v4/content/Loader;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/support/v7/util/SortedList",
            "<",
            "Ljava/io/File;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 118
    new-instance v0, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;

    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/nononsenseapps/filepicker/FilePickerFragment$1;-><init>(Lcom/nononsenseapps/filepicker/FilePickerFragment;Landroid/content/Context;)V

    return-object v0
.end method

.method public getName(Ljava/io/File;)Ljava/lang/String;
    .registers 3
    .param p1, "path"    # Ljava/io/File;

    .prologue
    .line 52
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getName(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 31
    check-cast p1, Ljava/io/File;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getName(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParent(Ljava/io/File;)Ljava/io/File;
    .registers 3
    .param p1, "from"    # Ljava/io/File;

    .prologue
    .line 63
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_14

    .line 64
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 65
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getParent(Ljava/io/File;)Ljava/io/File;

    move-result-object p1

    .line 70
    .end local p1    # "from":Ljava/io/File;
    :cond_14
    :goto_14
    return-object p1

    .line 67
    .restart local p1    # "from":Ljava/io/File;
    :cond_15
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p1

    goto :goto_14
.end method

.method public bridge synthetic getParent(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 31
    check-cast p1, Ljava/io/File;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getParent(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getPath(Ljava/lang/String;)Ljava/io/File;
    .registers 3
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 81
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic getPath(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getRoot()Ljava/io/File;
    .registers 2

    .prologue
    .line 98
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getRoot()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 31
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getRoot()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public isDir(Ljava/io/File;)Z
    .registers 3
    .param p1, "path"    # Ljava/io/File;

    .prologue
    .line 43
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic isDir(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 31
    check-cast p1, Ljava/io/File;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->isDir(Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method public onNewFolder(Ljava/lang/String;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 221
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->currentPath:Ljava/lang/Object;

    check-cast v1, Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 223
    .local v0, "folder":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 224
    iput-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->currentPath:Ljava/lang/Object;

    .line 225
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->refresh()V

    .line 230
    :goto_14
    return-void

    .line 227
    :cond_15
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/nononsenseapps/filepicker/R$string;->create_folder_error:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_14
.end method

.method public toUri(Ljava/io/File;)Landroid/net/Uri;
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 109
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toUri(Ljava/lang/Object;)Landroid/net/Uri;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 31
    check-cast p1, Ljava/io/File;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->toUri(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method
