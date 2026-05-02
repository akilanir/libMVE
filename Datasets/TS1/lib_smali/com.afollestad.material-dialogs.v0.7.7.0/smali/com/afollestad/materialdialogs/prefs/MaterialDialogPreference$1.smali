.class Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;
.super Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;
.source "MaterialDialogPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->showDialog(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;


# direct methods
.method constructor <init>(Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;)V
    .registers 2

    .prologue
    .line 56
    iput-object p1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onNegative(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 4
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;

    const/4 v1, -0x2

    invoke-virtual {v0, p1, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 65
    return-void
.end method

.method public onNeutral(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 4
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;

    const/4 v1, -0x3

    invoke-virtual {v0, p1, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 60
    return-void
.end method

.method public onPositive(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 4
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 70
    return-void
.end method
