.class public Lcom/greysonparrelli/permiso/PermisoDialogFragment;
.super Landroid/app/DialogFragment;
.source "PermisoDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;
    }
.end annotation


# static fields
.field private static final KEY_BUTTON_TEXT:Ljava/lang/String; = "button_text"

.field private static final KEY_MESSAGE:Ljava/lang/String; = "message"

.field private static final KEY_TITLE:Ljava/lang/String; = "title"

.field public static TAG:Ljava/lang/String;


# instance fields
.field private mButtonText:Ljava/lang/String;

.field private mMessage:Ljava/lang/String;

.field private mOnCloseListener:Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;

.field private mTitle:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 18
    const-string v0, "PermisoDialogFragment"

    sput-object v0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 125
    return-void
.end method

.method static synthetic access$000(Lcom/greysonparrelli/permiso/PermisoDialogFragment;)Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;
    .registers 2
    .param p0, "x0"    # Lcom/greysonparrelli/permiso/PermisoDialogFragment;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mOnCloseListener:Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;

    return-object v0
.end method

.method public static newInstance(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/greysonparrelli/permiso/PermisoDialogFragment;
    .registers 6
    .param p0, "title"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "buttonText"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 39
    new-instance v1, Lcom/greysonparrelli/permiso/PermisoDialogFragment;

    invoke-direct {v1}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;-><init>()V

    .line 42
    .local v1, "dialogFragment":Lcom/greysonparrelli/permiso/PermisoDialogFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 43
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "title"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    const-string v2, "message"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    const-string v2, "button_text"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    invoke-virtual {v1, v0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 48
    return-object v1
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 107
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 108
    iget-object v0, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mOnCloseListener:Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;

    if-eqz v0, :cond_c

    .line 109
    iget-object v0, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mOnCloseListener:Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;

    invoke-interface {v0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;->onClose()V

    .line 111
    :cond_c
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 53
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 56
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->setRetainInstance(Z)V

    .line 58
    invoke-virtual {p0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mTitle:Ljava/lang/String;

    .line 59
    invoke-virtual {p0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "message"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mMessage:Ljava/lang/String;

    .line 60
    invoke-virtual {p0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "button_text"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mButtonText:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 75
    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 78
    .local v0, "builder":Landroid/support/v7/app/AlertDialog$Builder;
    iget-object v2, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mTitle:Ljava/lang/String;

    if-eqz v2, :cond_12

    .line 79
    iget-object v2, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 83
    :cond_12
    iget-object v2, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mMessage:Ljava/lang/String;

    if-eqz v2, :cond_1b

    .line 84
    iget-object v2, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mMessage:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 89
    :cond_1b
    iget-object v2, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mButtonText:Ljava/lang/String;

    if-eqz v2, :cond_2e

    .line 90
    iget-object v1, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mButtonText:Ljava/lang/String;

    .line 94
    .local v1, "buttonText":Ljava/lang/String;
    :goto_21
    new-instance v2, Lcom/greysonparrelli/permiso/PermisoDialogFragment$1;

    invoke-direct {v2, p0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment$1;-><init>(Lcom/greysonparrelli/permiso/PermisoDialogFragment;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 102
    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v2

    return-object v2

    .line 92
    .end local v1    # "buttonText":Ljava/lang/String;
    :cond_2e
    const v2, 0x104000a

    invoke-virtual {p0, v2}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "buttonText":Ljava/lang/String;
    goto :goto_21
.end method

.method public onDestroyView()V
    .registers 3

    .prologue
    .line 67
    invoke-virtual {p0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->getRetainInstance()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 68
    invoke-virtual {p0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setDismissMessage(Landroid/os/Message;)V

    .line 70
    :cond_14
    invoke-super {p0}, Landroid/app/DialogFragment;->onDestroyView()V

    .line 71
    return-void
.end method

.method public setOnCloseListener(Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mOnCloseListener:Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;

    .line 120
    return-void
.end method
