.class Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$2;
.super Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;
.source "MaterialListPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->showDialog(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;


# direct methods
.method constructor <init>(Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;)V
    .registers 2

    .prologue
    .line 70
    iput-object p1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$2;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;

    invoke-direct {p0}, Lcom/afollestad/materialdialogs/MaterialDialog$ButtonCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onNegative(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 4
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$2;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;

    const/4 v1, -0x2

    invoke-virtual {v0, p1, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 79
    return-void
.end method

.method public onNeutral(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 4
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$2;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;

    const/4 v1, -0x3

    invoke-virtual {v0, p1, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 74
    return-void
.end method

.method public onPositive(Lcom/afollestad/materialdialogs/MaterialDialog;)V
    .registers 4
    .param p1, "dialog"    # Lcom/afollestad/materialdialogs/MaterialDialog;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference$2;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialListPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 84
    return-void
.end method
