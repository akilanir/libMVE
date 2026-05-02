.class Lde/psdev/licensesdialog/LicensesDialog$1;
.super Ljava/lang/Object;
.source "LicensesDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    .line 83
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialog$1;->this$0:Lde/psdev/licensesdialog/LicensesDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .prologue
    .line 85
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 86
    return-void
.end method
