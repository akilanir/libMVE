.class Lde/psdev/licensesdialog/LicensesDialog$3;
.super Ljava/lang/Object;
.source "LicensesDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


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

.field final synthetic val$dialog:Landroid/app/AlertDialog;


# direct methods
.method constructor <init>(Lde/psdev/licensesdialog/LicensesDialog;Landroid/app/AlertDialog;)V
    .registers 3
    .param p1, "this$0"    # Lde/psdev/licensesdialog/LicensesDialog;

    .prologue
    .line 90
    iput-object p1, p0, Lde/psdev/licensesdialog/LicensesDialog$3;->this$0:Lde/psdev/licensesdialog/LicensesDialog;

    iput-object p2, p0, Lde/psdev/licensesdialog/LicensesDialog$3;->val$dialog:Landroid/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .registers 8
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;

    .prologue
    .line 93
    iget-object v2, p0, Lde/psdev/licensesdialog/LicensesDialog$3;->this$0:Lde/psdev/licensesdialog/LicensesDialog;

    # getter for: Lde/psdev/licensesdialog/LicensesDialog;->mDividerColor:I
    invoke-static {v2}, Lde/psdev/licensesdialog/LicensesDialog;->access$100(Lde/psdev/licensesdialog/LicensesDialog;)I

    move-result v2

    if-eqz v2, :cond_2d

    .line 95
    iget-object v2, p0, Lde/psdev/licensesdialog/LicensesDialog$3;->this$0:Lde/psdev/licensesdialog/LicensesDialog;

    # getter for: Lde/psdev/licensesdialog/LicensesDialog;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lde/psdev/licensesdialog/LicensesDialog;->access$200(Lde/psdev/licensesdialog/LicensesDialog;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "titleDivider"

    const-string v4, "id"

    const-string v5, "android"

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 96
    .local v1, "titleDividerId":I
    iget-object v2, p0, Lde/psdev/licensesdialog/LicensesDialog$3;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 97
    .local v0, "titleDivider":Landroid/view/View;
    if-eqz v0, :cond_2d

    .line 98
    iget-object v2, p0, Lde/psdev/licensesdialog/LicensesDialog$3;->this$0:Lde/psdev/licensesdialog/LicensesDialog;

    # getter for: Lde/psdev/licensesdialog/LicensesDialog;->mDividerColor:I
    invoke-static {v2}, Lde/psdev/licensesdialog/LicensesDialog;->access$100(Lde/psdev/licensesdialog/LicensesDialog;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 101
    .end local v0    # "titleDivider":Landroid/view/View;
    .end local v1    # "titleDividerId":I
    :cond_2d
    return-void
.end method
