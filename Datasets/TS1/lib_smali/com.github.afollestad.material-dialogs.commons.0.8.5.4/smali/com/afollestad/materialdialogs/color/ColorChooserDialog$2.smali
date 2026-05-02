.class Lcom/afollestad/materialdialogs/color/ColorChooserDialog$2;
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
    .line 343
    iput-object p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$2;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lcom/afollestad/materialdialogs/MaterialDialog;Lcom/afollestad/materialdialogs/DialogAction;)V
    .registers 4
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "which"    # Lcom/afollestad/materialdialogs/DialogAction;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 346
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$2;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->toggleCustom(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    invoke-static {v0, p1}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$100(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;Lcom/afollestad/materialdialogs/MaterialDialog;)V

    .line 347
    return-void
.end method
