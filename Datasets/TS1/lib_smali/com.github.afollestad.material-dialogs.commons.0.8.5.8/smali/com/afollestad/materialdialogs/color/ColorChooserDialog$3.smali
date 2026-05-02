.class Lcom/afollestad/materialdialogs/color/ColorChooserDialog$3;
.super Ljava/lang/Object;
.source "ColorChooserDialog.java"

# interfaces
.implements Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;


# direct methods
.method constructor <init>(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V
    .registers 2

    .prologue
    .line 331
    iput-object p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$3;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V
    .registers 5
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "which"    # Lcom/afollestad/materialdialogs/DialogAction;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 334
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$3;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub()Z
    invoke-static {v0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$200(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 335
    sget-object v0, Lcom/afollestad/materialdialogs/DialogAction;->NEGATIVE:Lcom/afollestad/materialdialogs/DialogAction;

    iget-object v1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$3;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->getBuilder()Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;
    invoke-static {v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$300(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;

    move-result-object v1

    iget v1, v1, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$Builder;->mCancelBtn:I

    invoke-virtual {p1, v0, v1}, Lcom/afollestad/materialdialogs/MaterialDialog;->setActionButton(Lcom/afollestad/materialdialogs/DialogAction;I)V

    .line 336
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$3;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    const/4 v1, 0x0

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->isInSub(Z)V
    invoke-static {v0, v1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$400(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;Z)V

    .line 337
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$3;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->invalidate()V
    invoke-static {v0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$500(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V

    .line 341
    :goto_20
    return-void

    .line 339
    :cond_21
    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/MaterialDialog;->cancel()V

    goto :goto_20
.end method
