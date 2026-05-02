.class Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;
.super Ljava/lang/Object;
.source "MaterialDialogPreference.java"

# interfaces
.implements Lcom/afollestad/materialdialogs/MaterialDialog$SingleButtonCallback;


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
    .line 66
    iput-object p1, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;

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
    .line 69
    sget-object v0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$2;->$SwitchMap$com$afollestad$materialdialogs$DialogAction:[I

    invoke-virtual {p2}, Lcom/afollestad/materialdialogs/DialogAction;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_20

    .line 71
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->onClick(Landroid/content/DialogInterface;I)V

    .line 80
    :goto_11
    return-void

    .line 74
    :pswitch_12
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;

    const/4 v1, -0x3

    invoke-virtual {v0, p1, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->onClick(Landroid/content/DialogInterface;I)V

    goto :goto_11

    .line 77
    :pswitch_19
    iget-object v0, p0, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference$1;->this$0:Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;

    const/4 v1, -0x2

    invoke-virtual {v0, p1, v1}, Lcom/afollestad/materialdialogs/prefs/MaterialDialogPreference;->onClick(Landroid/content/DialogInterface;I)V

    goto :goto_11

    .line 69
    :pswitch_data_20
    .packed-switch 0x1
        :pswitch_12
        :pswitch_19
    .end packed-switch
.end method
