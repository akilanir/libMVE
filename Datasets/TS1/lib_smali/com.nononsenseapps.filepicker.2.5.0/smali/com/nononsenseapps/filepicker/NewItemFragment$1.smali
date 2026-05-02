.class Lcom/nononsenseapps/filepicker/NewItemFragment$1;
.super Ljava/lang/Object;
.source "NewItemFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nononsenseapps/filepicker/NewItemFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nononsenseapps/filepicker/NewItemFragment;


# direct methods
.method constructor <init>(Lcom/nononsenseapps/filepicker/NewItemFragment;)V
    .registers 2

    .prologue
    .line 64
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1;->this$0:Lcom/nononsenseapps/filepicker/NewItemFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .registers 7
    .param p1, "dialog1"    # Landroid/content/DialogInterface;

    .prologue
    .line 67
    move-object v1, p1

    check-cast v1, Landroid/support/v7/app/AlertDialog;

    .line 68
    .local v1, "dialog":Landroid/support/v7/app/AlertDialog;
    sget v4, Lcom/nononsenseapps/filepicker/R$id;->edit_text:I

    invoke-virtual {v1, v4}, Landroid/support/v7/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    .line 70
    .local v2, "editText":Landroid/widget/EditText;
    const/4 v4, -0x2

    invoke-virtual {v1, v4}, Landroid/support/v7/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    .line 71
    .local v0, "cancel":Landroid/widget/Button;
    new-instance v4, Lcom/nononsenseapps/filepicker/NewItemFragment$1$1;

    invoke-direct {v4, p0, v1}, Lcom/nononsenseapps/filepicker/NewItemFragment$1$1;-><init>(Lcom/nononsenseapps/filepicker/NewItemFragment$1;Landroid/support/v7/app/AlertDialog;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    const/4 v4, -0x1

    invoke-virtual {v1, v4}, Landroid/support/v7/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v3

    .line 81
    .local v3, "ok":Landroid/widget/Button;
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 82
    new-instance v4, Lcom/nononsenseapps/filepicker/NewItemFragment$1$2;

    invoke-direct {v4, p0, v2, v1}, Lcom/nononsenseapps/filepicker/NewItemFragment$1$2;-><init>(Lcom/nononsenseapps/filepicker/NewItemFragment$1;Landroid/widget/EditText;Landroid/support/v7/app/AlertDialog;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    new-instance v4, Lcom/nononsenseapps/filepicker/NewItemFragment$1$3;

    invoke-direct {v4, p0, v3}, Lcom/nononsenseapps/filepicker/NewItemFragment$1$3;-><init>(Lcom/nononsenseapps/filepicker/NewItemFragment$1;Landroid/widget/Button;)V

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 112
    return-void
.end method
