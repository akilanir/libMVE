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


# static fields
.field protected static final PERMISSIONS_REQUEST_WRITE_EXTERNAL_STORAGE:I = 0x1


# instance fields
.field protected showHiddenItems:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment;-><init>()V

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->showHiddenItems:Z

    .line 44
    return-void
.end method


# virtual methods
.method public areHiddenItemsShown()Z
    .registers 2

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->showHiddenItems:Z

    return v0
.end method

.method protected compareFiles(Ljava/io/File;Ljava/io/File;)I
    .registers 5
    .param p1, "lhs"    # Ljava/io/File;
    .param p2, "rhs"    # Ljava/io/File;

    .prologue
    .line 347
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_e

    .line 348
    const/4 v0, -0x1

    .line 352
    :goto_d
    return v0

    .line 349
    :cond_e
    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_1c

    .line 350
    const/4 v0, 0x1

    goto :goto_d

    .line 352
    :cond_1c
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    goto :goto_d
.end method

.method public getFullPath(Ljava/io/File;)Ljava/lang/String;
    .registers 3
    .param p1, "path"    # Ljava/io/File;

    .prologue
    .line 182
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getFullPath(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 38
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
    .line 212
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
    .line 139
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getName(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 38
    check-cast p1, Ljava/io/File;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getName(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParent(Ljava/io/File;)Ljava/io/File;
    .registers 4
    .param p1, "from"    # Ljava/io/File;

    .prologue
    .line 151
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getRoot()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 161
    .end local p1    # "from":Ljava/io/File;
    :cond_12
    :goto_12
    return-object p1

    .line 154
    .restart local p1    # "from":Ljava/io/File;
    :cond_13
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_12

    .line 155
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_28

    .line 156
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getParent(Ljava/io/File;)Ljava/io/File;

    move-result-object p1

    goto :goto_12

    .line 158
    :cond_28
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p1

    goto :goto_12
.end method

.method public bridge synthetic getParent(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 38
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
    .line 173
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic getPath(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getRoot()Ljava/io/File;
    .registers 3

    .prologue
    .line 192
    new-instance v0, Ljava/io/File;

    const-string v1, "/"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic getRoot()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getRoot()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method protected handlePermission()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 85
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v2, v0, v1

    invoke-virtual {p0, v0, v3}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->requestPermissions([Ljava/lang/String;I)V

    .line 87
    return-void
.end method

.method protected hasPermission()Z
    .registers 3

    .prologue
    .line 70
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {v0, v1}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isDir(Ljava/io/File;)Z
    .registers 3
    .param p1, "path"    # Ljava/io/File;

    .prologue
    .line 130
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic isDir(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 38
    check-cast p1, Ljava/io/File;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->isDir(Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method protected isItemVisible(Ljava/io/File;)Z
    .registers 5
    .param p1, "file"    # Ljava/io/File;

    .prologue
    const/4 v0, 0x0

    .line 328
    iget-boolean v1, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->showHiddenItems:Z

    if-nez v1, :cond_c

    invoke-virtual {p1}, Ljava/io/File;->isHidden()Z

    move-result v1

    if-eqz v1, :cond_c

    .line 331
    :cond_b
    :goto_b
    return v0

    :cond_c
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->isDir(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_1b

    iget v1, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->mode:I

    if-eqz v1, :cond_1b

    iget v1, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->mode:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_b

    :cond_1b
    const/4 v0, 0x1

    goto :goto_b
.end method

.method public onNewFolder(Ljava/lang/String;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 306
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    check-cast v1, Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 308
    .local v0, "folder":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 309
    iput-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->mCurrentPath:Ljava/lang/Object;

    .line 310
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->refresh()V

    .line 315
    :goto_14
    return-void

    .line 312
    :cond_15
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/nononsenseapps/filepicker/R$string;->nnf_create_folder_error:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_14
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 7
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "grantResults"    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 102
    array-length v0, p2

    if-nez v0, :cond_e

    .line 104
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    if-eqz v0, :cond_d

    .line 105
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    invoke-interface {v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;->onCancelled()V

    .line 120
    :cond_d
    :goto_d
    return-void

    .line 108
    :cond_e
    aget v0, p3, v2

    if-nez v0, :cond_16

    .line 110
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->refresh()V

    goto :goto_d

    .line 112
    :cond_16
    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/nononsenseapps/filepicker/R$string;->nnf_permission_external_write_denied:I

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 115
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    if-eqz v0, :cond_d

    .line 116
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->mListener:Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;

    invoke-interface {v0}, Lcom/nononsenseapps/filepicker/AbstractFilePickerFragment$OnFilePickedListener;->onCancelled()V

    goto :goto_d
.end method

.method public showHiddenItems(Z)V
    .registers 2
    .param p1, "showHiddenItems"    # Z

    .prologue
    .line 52
    iput-boolean p1, p0, Lcom/nononsenseapps/filepicker/FilePickerFragment;->showHiddenItems:Z

    .line 53
    return-void
.end method

.method public toUri(Ljava/io/File;)Landroid/net/Uri;
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 203
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic toUri(Ljava/lang/Object;)Landroid/net/Uri;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 38
    check-cast p1, Ljava/io/File;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/nononsenseapps/filepicker/FilePickerFragment;->toUri(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method
