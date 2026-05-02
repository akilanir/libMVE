.class Lcom/afollestad/materialdialogs/MaterialDialog$3;
.super Ljava/lang/Object;
.source "MaterialDialog.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/afollestad/materialdialogs/MaterialDialog;->setInternalInputCallback()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/MaterialDialog;


# direct methods
.method constructor <init>(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 2

    .prologue
    .line 1549
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 1571
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 1552
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 12
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1557
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v1

    .line 1558
    .local v1, "length":I
    const/4 v0, 0x0

    .line 1559
    .local v0, "emptyDisabled":Z
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputAllowEmpty:Z

    if-nez v5, :cond_23

    .line 1560
    if-nez v1, :cond_3c

    move v0, v3

    .line 1561
    :goto_16
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    sget-object v6, Lcom/afollestad/materialdialogs/DialogAction;->POSITIVE:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-virtual {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog;->getActionButton(Lcom/afollestad/materialdialogs/DialogAction;)Landroid/view/View;

    move-result-object v2

    .line 1562
    .local v2, "positiveAb":Landroid/view/View;
    if-nez v0, :cond_3e

    :goto_20
    invoke-virtual {v2, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 1564
    .end local v2    # "positiveAb":Landroid/view/View;
    :cond_23
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v3, v1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->invalidateInputMinMaxIndicator(IZ)V

    .line 1565
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v3, v3, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v3, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallInputCallback:Z

    if-eqz v3, :cond_3b

    .line 1566
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v3, v3, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v3, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-interface {v3, v4, p1}, Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;->onInput(Lcom/afollestad/materialdialogs/MaterialDialog;Ljava/lang/CharSequence;)V

    .line 1567
    :cond_3b
    return-void

    :cond_3c
    move v0, v4

    .line 1560
    goto :goto_16

    .restart local v2    # "positiveAb":Landroid/view/View;
    :cond_3e
    move v3, v4

    .line 1562
    goto :goto_20
.end method
