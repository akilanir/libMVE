.class public Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "FileChooserDialog.java"

# interfaces
.implements Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$FileSorter;,
        Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;,
        Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$FileCallback;
    }
.end annotation


# static fields
.field private static final DEFAULT_TAG:Ljava/lang/String; = "[MD_FILE_SELECTOR]"


# instance fields
.field private canGoUp:Z

.field private mCallback:Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$FileCallback;

.field private parentContents:[Ljava/io/File;

.field private parentFolder:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 45
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->canGoUp:Z

    .line 46
    return-void
.end method

.method private getBuilder()Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 275
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "builder"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;

    return-object v0
.end method


# virtual methods
.method fileIsMimeType(Ljava/io/File;Ljava/lang/String;Landroid/webkit/MimeTypeMap;)Z
    .registers 14
    .param p1, "file"    # Ljava/io/File;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "mimeTypeMap"    # Landroid/webkit/MimeTypeMap;

    .prologue
    .line 78
    if-eqz p2, :cond_a

    const-string v9, "*/*"

    invoke-virtual {p2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c

    .line 79
    :cond_a
    const/4 v9, 0x1

    .line 115
    :goto_b
    return v9

    .line 82
    :cond_c
    invoke-virtual {p1}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v9

    invoke-virtual {v9}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v5

    .line 83
    .local v5, "filename":Ljava/lang/String;
    const/16 v9, 0x2e

    invoke-virtual {v5, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 84
    .local v0, "dotPos":I
    const/4 v9, -0x1

    if-ne v0, v9, :cond_1f

    .line 85
    const/4 v9, 0x0

    goto :goto_b

    .line 87
    :cond_1f
    add-int/lit8 v9, v0, 0x1

    invoke-virtual {v5, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 88
    .local v1, "fileExtension":Ljava/lang/String;
    invoke-virtual {p3, v1}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 89
    .local v2, "fileType":Ljava/lang/String;
    if-nez v2, :cond_2d

    .line 90
    const/4 v9, 0x0

    goto :goto_b

    .line 93
    :cond_2d
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_35

    .line 94
    const/4 v9, 0x1

    goto :goto_b

    .line 97
    :cond_35
    const/16 v9, 0x2f

    invoke-virtual {p2, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    .line 98
    .local v6, "mimeTypeDelimiter":I
    const/4 v9, -0x1

    if-ne v6, v9, :cond_40

    .line 99
    const/4 v9, 0x0

    goto :goto_b

    .line 101
    :cond_40
    const/4 v9, 0x0

    invoke-virtual {p2, v9, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 102
    .local v7, "mimeTypeMainType":Ljava/lang/String;
    add-int/lit8 v9, v6, 0x1

    invoke-virtual {p2, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 103
    .local v8, "mimeTypeSubtype":Ljava/lang/String;
    const-string v9, "*"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_55

    .line 104
    const/4 v9, 0x0

    goto :goto_b

    .line 106
    :cond_55
    const/16 v9, 0x2f

    invoke-virtual {v2, v9}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    .line 107
    .local v3, "fileTypeDelimiter":I
    const/4 v9, -0x1

    if-ne v3, v9, :cond_60

    .line 108
    const/4 v9, 0x0

    goto :goto_b

    .line 110
    :cond_60
    const/4 v9, 0x0

    invoke-virtual {v2, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 111
    .local v4, "fileTypeMainType":Ljava/lang/String;
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6d

    .line 112
    const/4 v9, 0x1

    goto :goto_b

    .line 115
    :cond_6d
    const/4 v9, 0x0

    goto :goto_b
.end method

.method getContentsArray()[Ljava/lang/String;
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 49
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentContents:[Ljava/io/File;

    if-nez v2, :cond_8

    new-array v1, v3, [Ljava/lang/String;

    .line 54
    :cond_7
    return-object v1

    .line 50
    :cond_8
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentContents:[Ljava/io/File;

    array-length v4, v2

    iget-boolean v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->canGoUp:Z

    if-eqz v2, :cond_34

    const/4 v2, 0x1

    :goto_10
    add-int/2addr v2, v4

    new-array v1, v2, [Ljava/lang/String;

    .line 51
    .local v1, "results":[Ljava/lang/String;
    iget-boolean v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->canGoUp:Z

    if-eqz v2, :cond_1b

    const-string v2, "..."

    aput-object v2, v1, v3

    .line 52
    :cond_1b
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1c
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentContents:[Ljava/io/File;

    array-length v2, v2

    if-ge v0, v2, :cond_7

    .line 53
    iget-boolean v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->canGoUp:Z

    if-eqz v2, :cond_36

    add-int/lit8 v2, v0, 0x1

    :goto_27
    iget-object v3, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentContents:[Ljava/io/File;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 52
    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    .end local v0    # "i":I
    .end local v1    # "results":[Ljava/lang/String;
    :cond_34
    move v2, v3

    .line 50
    goto :goto_10

    .restart local v0    # "i":I
    .restart local v1    # "results":[Ljava/lang/String;
    :cond_36
    move v2, v0

    .line 53
    goto :goto_27
.end method

.method public getInitialPath()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 269
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;

    move-result-object v0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mInitialPath:Ljava/lang/String;

    return-object v0
.end method

.method listFiles(Ljava/lang/String;)[Ljava/io/File;
    .registers 11
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 58
    iget-object v8, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 59
    .local v1, "contents":[Ljava/io/File;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .local v6, "results":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    if-eqz v1, :cond_43

    .line 61
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v5

    .line 62
    .local v5, "mimeTypeMap":Landroid/webkit/MimeTypeMap;
    move-object v0, v1

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_15
    if-ge v3, v4, :cond_2f

    aget-object v2, v0, v3

    .line 63
    .local v2, "fi":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_25

    .line 64
    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    :cond_22
    :goto_22
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 66
    :cond_25
    invoke-virtual {p0, v2, p1, v5}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->fileIsMimeType(Ljava/io/File;Ljava/lang/String;Landroid/webkit/MimeTypeMap;)Z

    move-result v8

    if-eqz v8, :cond_22

    .line 67
    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_22

    .line 71
    .end local v2    # "fi":Ljava/io/File;
    :cond_2f
    new-instance v8, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$FileSorter;

    invoke-direct {v8, v7}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$FileSorter;-><init>(Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$1;)V

    invoke-static {v6, v8}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 72
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Ljava/io/File;

    invoke-interface {v6, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/io/File;

    .line 74
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "mimeTypeMap":Landroid/webkit/MimeTypeMap;
    :cond_43
    return-object v7
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 181
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 182
    check-cast p1, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$FileCallback;

    .end local p1    # "activity":Landroid/app/Activity;
    iput-object p1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->mCallback:Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$FileCallback;

    .line 183
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 122
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_33

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {v0, v1}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_33

    .line 125
    new-instance v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/afollestad/materialdialogs/commons/R$string;->md_error_label:I

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    sget v1, Lcom/afollestad/materialdialogs/commons/R$string;->md_storage_perm_error:I

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->content(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->build()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object v0

    .line 138
    :goto_32
    return-object v0

    .line 132
    :cond_33
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_45

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "builder"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4d

    .line 133
    :cond_45
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You must create a FileChooserDialog using the Builder."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
    :cond_4d
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "current_path"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_68

    .line 135
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "current_path"

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;

    move-result-object v2

    iget-object v2, v2, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mInitialPath:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    :cond_68
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "current_path"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    .line 137
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;

    move-result-object v0

    iget-object v0, v0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mMimeType:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->listFiles(Ljava/lang/String;)[Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentContents:[Ljava/io/File;

    .line 138
    new-instance v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getContentsArray()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items([Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsCallback(Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$1;

    invoke-direct {v1, p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$1;-><init>(Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;)V

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onNegative(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;

    move-result-object v1

    iget v1, v1, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mCancelButton:I

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;

    move-result-object v1

    iget v1, v1, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mChooseButton:I

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->build()Lcom/afollestad/materialdialogs/MaterialDialog;

    move-result-object v0

    goto/16 :goto_32
.end method

.method public onSelection(Lcom/afollestad/materialdialogs/MaterialDialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .registers 9
    .param p1, "materialDialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "i"    # I
    .param p4, "s"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v1, 0x1

    .line 156
    iget-boolean v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->canGoUp:Z

    if-eqz v2, :cond_44

    if-nez p3, :cond_44

    .line 157
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    iput-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    .line 158
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "/storage/emulated"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 159
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    iput-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    .line 160
    :cond_25
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_42

    :goto_2d
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->canGoUp:Z

    .line 167
    .end local p3    # "i":I
    :cond_2f
    :goto_2f
    iget-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_67

    .line 168
    iget-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->mCallback:Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$FileCallback;

    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    invoke-interface {v1, p0, v2}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$FileCallback;->onFileSelection(Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;Ljava/io/File;)V

    .line 169
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->dismiss()V

    .line 177
    :goto_41
    return-void

    .line 160
    .restart local p3    # "i":I
    :cond_42
    const/4 v1, 0x0

    goto :goto_2d

    .line 162
    :cond_44
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentContents:[Ljava/io/File;

    iget-boolean v3, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->canGoUp:Z

    if-eqz v3, :cond_4c

    add-int/lit8 p3, p3, -0x1

    .end local p3    # "i":I
    :cond_4c
    aget-object v2, v2, p3

    iput-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    .line 163
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->canGoUp:Z

    .line 164
    iget-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/storage/emulated"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 165
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    goto :goto_2f

    .line 171
    :cond_67
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;

    move-result-object v1

    iget-object v1, v1, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mMimeType:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->listFiles(Ljava/lang/String;)[Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentContents:[Ljava/io/File;

    .line 172
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    check-cast v0, Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 173
    .local v0, "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    iget-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 174
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "current_path"

    iget-object v3, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getContentsArray()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setItems([Ljava/lang/CharSequence;)V

    goto :goto_41
.end method

.method public show(Landroid/support/v4/app/FragmentActivity;)V
    .registers 5
    .param p1, "context"    # Landroid/support/v4/app/FragmentActivity;

    .prologue
    .line 186
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;

    move-result-object v2

    iget-object v1, v2, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mTag:Ljava/lang/String;

    .line 187
    .local v1, "tag":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 188
    .local v0, "frag":Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_25

    move-object v2, v0

    .line 189
    check-cast v2, Landroid/support/v4/app/DialogFragment;

    invoke-virtual {v2}, Landroid/support/v4/app/DialogFragment;->dismiss()V

    .line 190
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 193
    :cond_25
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 194
    return-void
.end method
