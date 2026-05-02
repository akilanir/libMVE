.class public Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "FolderChooserDialog.java"

# interfaces
.implements Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderSorter;,
        Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;,
        Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderCallback;
    }
.end annotation


# static fields
.field private static final DEFAULT_TAG:Ljava/lang/String; = "[MD_FOLDER_SELECTOR]"


# instance fields
.field private canGoUp:Z

.field private mCallback:Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderCallback;

.field private parentContents:[Ljava/io/File;

.field private parentFolder:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 47
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 40
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->canGoUp:Z

    .line 48
    return-void
.end method

.method static synthetic access$100(Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;)Ljava/io/File;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$200(Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;)Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderCallback;
    .registers 2
    .param p0, "x0"    # Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->mCallback:Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderCallback;

    return-object v0
.end method

.method private getBuilder()Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 218
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "builder"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;

    return-object v0
.end method


# virtual methods
.method getContentsArray()[Ljava/lang/String;
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 51
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentContents:[Ljava/io/File;

    if-nez v2, :cond_8

    new-array v1, v3, [Ljava/lang/String;

    .line 56
    :cond_7
    return-object v1

    .line 52
    :cond_8
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentContents:[Ljava/io/File;

    array-length v4, v2

    iget-boolean v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->canGoUp:Z

    if-eqz v2, :cond_34

    const/4 v2, 0x1

    :goto_10
    add-int/2addr v2, v4

    new-array v1, v2, [Ljava/lang/String;

    .line 53
    .local v1, "results":[Ljava/lang/String;
    iget-boolean v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->canGoUp:Z

    if-eqz v2, :cond_1b

    const-string v2, "..."

    aput-object v2, v1, v3

    .line 54
    :cond_1b
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1c
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentContents:[Ljava/io/File;

    array-length v2, v2

    if-ge v0, v2, :cond_7

    .line 55
    iget-boolean v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->canGoUp:Z

    if-eqz v2, :cond_36

    add-int/lit8 v2, v0, 0x1

    :goto_27
    iget-object v3, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentContents:[Ljava/io/File;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 54
    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    .end local v0    # "i":I
    .end local v1    # "results":[Ljava/lang/String;
    :cond_34
    move v2, v3

    .line 52
    goto :goto_10

    .restart local v0    # "i":I
    .restart local v1    # "results":[Ljava/lang/String;
    :cond_36
    move v2, v0

    .line 55
    goto :goto_27
.end method

.method listFiles()[Ljava/io/File;
    .registers 9

    .prologue
    const/4 v6, 0x0

    .line 60
    iget-object v7, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 61
    .local v1, "contents":[Ljava/io/File;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .local v5, "results":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    if-eqz v1, :cond_35

    .line 63
    move-object v0, v1

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_11
    if-ge v3, v4, :cond_21

    aget-object v2, v0, v3

    .line 64
    .local v2, "fi":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_1e

    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    :cond_1e
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 66
    .end local v2    # "fi":Ljava/io/File;
    :cond_21
    new-instance v7, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderSorter;

    invoke-direct {v7, v6}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderSorter;-><init>(Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$1;)V

    invoke-static {v5, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 67
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Ljava/io/File;

    invoke-interface {v5, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/io/File;

    .line 69
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_35
    return-object v6
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 137
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 138
    check-cast p1, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderCallback;

    .end local p1    # "activity":Landroid/app/Activity;
    iput-object p1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->mCallback:Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderCallback;

    .line 139
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 76
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_33

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {v0, v1}, Landroid/support/v4/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_33

    .line 79
    new-instance v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

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

    .line 92
    :goto_32
    return-object v0

    .line 86
    :cond_33
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_45

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "builder"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4d

    .line 87
    :cond_45
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You must create a FolderChooserDialog using the Builder."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_4d
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "current_path"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_68

    .line 89
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "current_path"

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;

    move-result-object v2

    iget-object v2, v2, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->mInitialPath:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    :cond_68
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "current_path"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    .line 91
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->listFiles()[Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentContents:[Ljava/io/File;

    .line 92
    new-instance v0, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->title(Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getContentsArray()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->items([Ljava/lang/CharSequence;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->itemsCallback(Lcom/afollestad/materialdialogs/MaterialDialog$ListCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$2;

    invoke-direct {v1, p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$2;-><init>(Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;)V

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onPositive(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$1;

    invoke-direct {v1, p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$1;-><init>(Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;)V

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->onNegative(Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->autoDismiss(Z)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;

    move-result-object v1

    iget v1, v1, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->mChooseButton:I

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->positiveText(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    move-result-object v0

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;

    move-result-object v1

    iget v1, v1, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->mCancelButton:I

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->negativeText(I)Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

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

    .line 117
    iget-boolean v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->canGoUp:Z

    if-eqz v2, :cond_5d

    if-nez p3, :cond_5d

    .line 118
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    iput-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    .line 119
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const-string v3, "/storage/emulated"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 120
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    iput-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    .line 121
    :cond_25
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5b

    :goto_2d
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->canGoUp:Z

    .line 128
    .end local p3    # "i":I
    :cond_2f
    :goto_2f
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->listFiles()[Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentContents:[Ljava/io/File;

    .line 129
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    check-cast v0, Lcom/afollestad/materialdialogs/MaterialDialog;

    .line 130
    .local v0, "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    iget-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 131
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "current_path"

    iget-object v3, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getContentsArray()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setItems([Ljava/lang/CharSequence;)V

    .line 133
    return-void

    .line 121
    .end local v0    # "dialog":Lcom/afollestad/materialdialogs/MaterialDialog;
    .restart local p3    # "i":I
    :cond_5b
    const/4 v1, 0x0

    goto :goto_2d

    .line 123
    :cond_5d
    iget-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentContents:[Ljava/io/File;

    iget-boolean v3, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->canGoUp:Z

    if-eqz v3, :cond_65

    add-int/lit8 p3, p3, -0x1

    .end local p3    # "i":I
    :cond_65
    aget-object v2, v2, p3

    iput-object v2, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    .line 124
    iput-boolean v1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->canGoUp:Z

    .line 125
    iget-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/storage/emulated"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 126
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->parentFolder:Ljava/io/File;

    goto :goto_2f
.end method

.method public show(Landroid/support/v4/app/FragmentActivity;)V
    .registers 5
    .param p1, "context"    # Landroid/support/v4/app/FragmentActivity;

    .prologue
    .line 142
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;

    move-result-object v2

    iget-object v1, v2, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->mTag:Ljava/lang/String;

    .line 143
    .local v1, "tag":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 144
    .local v0, "frag":Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_25

    move-object v2, v0

    .line 145
    check-cast v2, Landroid/support/v4/app/DialogFragment;

    invoke-virtual {v2}, Landroid/support/v4/app/DialogFragment;->dismiss()V

    .line 146
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 149
    :cond_25
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 150
    return-void
.end method
