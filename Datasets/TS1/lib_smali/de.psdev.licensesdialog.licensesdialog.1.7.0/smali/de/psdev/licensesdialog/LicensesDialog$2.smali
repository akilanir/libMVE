.class Lde/psdev/licensesdialog/LicensesDialog$2;
.super Ljava/lang/Object;
.source "LicensesDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/psdev/licensesdialog/LicensesDialog;->create()Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lde/psdev/licensesdialog/LicensesDialog;


# direct methods
.method constructor <init>(Lde/psdev/licensesdialog/LicensesDialog;)V
    .registers 2
    .param p1, "this$0"    # Lde/psdev/licensesdialog/LicensesDialog;

    .prologue
    .line 82
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialog$2;->this$0:Lde/psdev/licensesdialog/LicensesDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 85
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$2;->this$0:Lde/psdev/licensesdialog/LicensesDialog;

    # getter for: Lde/psdev/licensesdialog/LicensesDialog;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;
    invoke-static {v0}, Lde/psdev/licensesdialog/LicensesDialog;->access$000(Lde/psdev/licensesdialog/LicensesDialog;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 86
    iget-object v0, p0, Lde/psdev/licensesdialog/LicensesDialog$2;->this$0:Lde/psdev/licensesdialog/LicensesDialog;

    # getter for: Lde/psdev/licensesdialog/LicensesDialog;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;
    invoke-static {v0}, Lde/psdev/licensesdialog/LicensesDialog;->access$000(Lde/psdev/licensesdialog/LicensesDialog;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 88
    :cond_11
    return-void
.end method
