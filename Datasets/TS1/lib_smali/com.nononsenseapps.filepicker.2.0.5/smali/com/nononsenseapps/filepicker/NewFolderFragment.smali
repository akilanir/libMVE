.class public Lcom/nononsenseapps/filepicker/NewFolderFragment;
.super Lcom/nononsenseapps/filepicker/NewItemFragment;
.source "NewFolderFragment.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "new_folder_fragment"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/nononsenseapps/filepicker/NewItemFragment;-><init>()V

    return-void
.end method

.method public static showDialog(Landroid/support/v4/app/FragmentManager;Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;)V
    .registers 4
    .param p0, "fm"    # Landroid/support/v4/app/FragmentManager;
    .param p1, "listener"    # Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;

    .prologue
    .line 29
    new-instance v0, Lcom/nononsenseapps/filepicker/NewFolderFragment;

    invoke-direct {v0}, Lcom/nononsenseapps/filepicker/NewFolderFragment;-><init>()V

    .line 30
    .local v0, "d":Lcom/nononsenseapps/filepicker/NewItemFragment;
    invoke-virtual {v0, p1}, Lcom/nononsenseapps/filepicker/NewItemFragment;->setListener(Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;)V

    .line 31
    const-string v1, "new_folder_fragment"

    invoke-virtual {v0, p0, v1}, Lcom/nononsenseapps/filepicker/NewItemFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 32
    return-void
.end method


# virtual methods
.method protected validateName(Ljava/lang/String;)Z
    .registers 3
    .param p1, "itemName"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, ".."

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const/4 v0, 0x1

    :goto_1f
    return v0

    :cond_20
    const/4 v0, 0x0

    goto :goto_1f
.end method
