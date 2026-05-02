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
    .line 1760
    iput-object p1, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 1782
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 1763
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

    .line 1768
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v1

    .line 1769
    .local v1, "length":I
    const/4 v0, 0x0

    .line 1770
    .local v0, "emptyDisabled":Z
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v5, v5, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputAllowEmpty:Z

    if-nez v5, :cond_23

    .line 1771
    if-nez v1, :cond_3c

    move v0, v3

    .line 1772
    :goto_16
    iget-object v5, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    sget-object v6, Lcom/afollestad/materialdialogs/DialogAction;->POSITIVE:Lcom/afollestad/materialdialogs/DialogAction;

    invoke-virtual {v5, v6}, Lcom/afollestad/materialdialogs/MaterialDialog;->getActionButton(Lcom/afollestad/materialdialogs/DialogAction;)Lcom/afollestad/materialdialogs/internal/MDButton;

    move-result-object v2

    .line 1773
    .local v2, "positiveAb":Landroid/view/View;
    if-nez v0, :cond_3e

    :goto_20
    invoke-virtual {v2, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 1775
    .end local v2    # "positiveAb":Landroid/view/View;
    :cond_23
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-virtual {v3, v1, v0}, Lcom/afollestad/materialdialogs/MaterialDialog;->invalidateInputMinMaxIndicator(IZ)V

    .line 1776
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v3, v3, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-boolean v3, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->alwaysCallInputCallback:Z

    if-eqz v3, :cond_3b

    .line 1777
    iget-object v3, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    iget-object v3, v3, Lcom/afollestad/materialdialogs/MaterialDialog;->mBuilder:Lcom/afollestad/materialdialogs/MaterialDialog$Builder;

    iget-object v3, v3, Lcom/afollestad/materialdialogs/MaterialDialog$Builder;->inputCallback:Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;

    iget-object v4, p0, Lcom/afollestad/materialdialogs/MaterialDialog$3;->this$0:Lcom/afollestad/materialdialogs/MaterialDialog;

    invoke-interface {v3, v4, p1}, Lcom/afollestad/materialdialogs/MaterialDialog$InputCallback;->onInput(Lcom/afollestad/materialdialogs/MaterialDialog;Ljava/lang/CharSequence;)V

    .line 1778
    :cond_3b
    return-void

    :cond_3c
    move v0, v4

    .line 1771
    goto :goto_16

    .restart local v2    # "positiveAb":Landroid/view/View;
    :cond_3e
    move v3, v4

    .line 1773
    goto :goto_20
.end method
