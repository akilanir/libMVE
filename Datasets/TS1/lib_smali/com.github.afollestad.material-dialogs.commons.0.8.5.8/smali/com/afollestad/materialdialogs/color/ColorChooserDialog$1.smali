.class Lcom/afollestad/materialdialogs/color/ColorChooserDialog$1;
.super Ljava/lang/Object;
.source "ColorChooserDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


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
    .line 349
    iput-object p1, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$1;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 352
    iget-object v0, p0, Lcom/afollestad/materialdialogs/color/ColorChooserDialog$1;->this$0:Lcom/afollestad/materialdialogs/color/ColorChooserDialog;

    # invokes: Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->invalidateDynamicButtonColors()V
    invoke-static {v0}, Lcom/afollestad/materialdialogs/color/ColorChooserDialog;->access$000(Lcom/afollestad/materialdialogs/color/ColorChooserDialog;)V

    .line 353
    return-void
.end method
