.class Lcom/nononsenseapps/filepicker/NewItemFragment$1$3;
.super Ljava/lang/Object;
.source "NewItemFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


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

.field final synthetic val$ok:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/nononsenseapps/filepicker/NewItemFragment$1;Landroid/widget/Button;)V
    .registers 3

    .prologue
    .line 96
    iput-object p1, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$3;->this$1:Lcom/nononsenseapps/filepicker/NewItemFragment$1;

    iput-object p2, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$3;->val$ok:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 5
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$3;->val$ok:Landroid/widget/Button;

    iget-object v1, p0, Lcom/nononsenseapps/filepicker/NewItemFragment$1$3;->this$1:Lcom/nononsenseapps/filepicker/NewItemFragment$1;

    iget-object v1, v1, Lcom/nononsenseapps/filepicker/NewItemFragment$1;->this$0:Lcom/nononsenseapps/filepicker/NewItemFragment;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/nononsenseapps/filepicker/NewItemFragment;->validateName(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 110
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 100
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 105
    return-void
.end method
