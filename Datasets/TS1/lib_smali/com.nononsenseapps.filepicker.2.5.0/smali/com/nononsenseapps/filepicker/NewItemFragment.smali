.class public abstract Lcom/nononsenseapps/filepicker/NewItemFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "NewItemFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;
    }
.end annotation


# instance fields
.field private listener:Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nononsenseapps/filepicker/NewItemFragment;->listener:Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;

    .line 40
    return-void
.end method

.method static synthetic access$000(Lcom/nononsenseapps/filepicker/NewItemFragment;)Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;
    .registers 2
    .param p0, "x0"    # Lcom/nononsenseapps/filepicker/NewItemFragment;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/NewItemFragment;->listener:Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;

    return-object v0
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 48
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 49
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 54
    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/nononsenseapps/filepicker/NewItemFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 55
    .local v0, "builder":Landroid/support/v7/app/AlertDialog$Builder;
    sget v2, Lcom/nononsenseapps/filepicker/R$layout;->nnf_dialog_folder_name:I

    invoke-virtual {v0, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setView(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    sget v3, Lcom/nononsenseapps/filepicker/R$string;->nnf_new_folder:I

    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const/high16 v3, 0x1040000

    invoke-virtual {v2, v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x104000a

    invoke-virtual {v2, v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 62
    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v1

    .line 64
    .local v1, "dialog":Landroid/support/v7/app/AlertDialog;
    new-instance v2, Lcom/nononsenseapps/filepicker/NewItemFragment$1;

    invoke-direct {v2, p0}, Lcom/nononsenseapps/filepicker/NewItemFragment$1;-><init>(Lcom/nononsenseapps/filepicker/NewItemFragment;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 116
    return-object v1
.end method

.method public setListener(Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/NewItemFragment;->listener:Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;

    .line 44
    return-void
.end method

.method protected abstract validateName(Ljava/lang/String;)Z
.end method
