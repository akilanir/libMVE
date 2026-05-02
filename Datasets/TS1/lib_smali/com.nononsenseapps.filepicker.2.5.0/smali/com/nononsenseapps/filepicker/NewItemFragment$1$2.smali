.class Lcom/nononsenseapps/filepicker/NewItemFragment$1$2;
.super Ljava/lang/Object;
.source "NewItemFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nononsenseapps/filepicker/NewItemFragment$1;->onShow(Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nononsenseapps/filepicker/NewItemFragment$1;

.field final synthetic val$dialog:Landroid/support/v7/app/AlertDialog;

.field final synthetic val$editText:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/nononsenseapps/filepicker/NewItemFragment$1;Landroid/widget/EditText;Landroid/support/v7/app/AlertDialog;)V
    .registers 4

    .prologue
    .line 82
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$2;->this$1:Lcom/nononsenseapps/filepicker/NewItemFragment$1;

    iput-object p2, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$2;->val$editText:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$2;->val$dialog:Landroid/support/v7/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 86
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$2;->val$editText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "itemName":Ljava/lang/String;
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$2;->this$1:Lcom/nononsenseapps/filepicker/NewItemFragment$1;

    iget-object v1, v1, Lcom/nononsenseapps/filepicker/NewItemFragment$1;->this$0:Lcom/nononsenseapps/filepicker/NewItemFragment;

    invoke-virtual {v1, v0}, Lcom/nononsenseapps/filepicker/NewItemFragment;->validateName(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 88
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$2;->this$1:Lcom/nononsenseapps/filepicker/NewItemFragment$1;

    iget-object v1, v1, Lcom/nononsenseapps/filepicker/NewItemFragment$1;->this$0:Lcom/nononsenseapps/filepicker/NewItemFragment;

    # getter for: Lcom/nononsenseapps/filepicker/NewItemFragment;->listener:Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;
    invoke-static {v1}, Lcom/nononsenseapps/filepicker/NewItemFragment;->access$000(Lcom/nononsenseapps/filepicker/NewItemFragment;)Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;

    move-result-object v1

    if-eqz v1, :cond_29

    .line 89
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$2;->this$1:Lcom/nononsenseapps/filepicker/NewItemFragment$1;

    iget-object v1, v1, Lcom/nononsenseapps/filepicker/NewItemFragment$1;->this$0:Lcom/nononsenseapps/filepicker/NewItemFragment;

    # getter for: Lcom/nononsenseapps/filepicker/NewItemFragment;->listener:Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;
    invoke-static {v1}, Lcom/nononsenseapps/filepicker/NewItemFragment;->access$000(Lcom/nononsenseapps/filepicker/NewItemFragment;)Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener;->onNewFolder(Ljava/lang/String;)V

    .line 91
    :cond_29
    iget-object v1, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$2;->val$dialog:Landroid/support/v7/app/AlertDialog;

    invoke-virtual {v1}, Landroid/support/v7/app/AlertDialog;->dismiss()V

    .line 93
    :cond_2e
    return-void
.end method
