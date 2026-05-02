.class Lcom/greysonparrelli/permiso/PermisoDialogFragment$1;
.super Ljava/lang/Object;
.source "PermisoDialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/greysonparrelli/permiso/PermisoDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/greysonparrelli/permiso/PermisoDialogFragment;


# direct methods
.method constructor <init>(Lcom/greysonparrelli/permiso/PermisoDialogFragment;)V
    .registers 2

    .prologue
    .line 94
    iput-object p1, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment$1;->this$0:Lcom/greysonparrelli/permiso/PermisoDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 97
    iget-object v0, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment$1;->this$0:Lcom/greysonparrelli/permiso/PermisoDialogFragment;

    # getter for: Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mOnCloseListener:Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;
    invoke-static {v0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->access$000(Lcom/greysonparrelli/permiso/PermisoDialogFragment;)Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 98
    iget-object v0, p0, Lcom/greysonparrelli/permiso/PermisoDialogFragment$1;->this$0:Lcom/greysonparrelli/permiso/PermisoDialogFragment;

    # getter for: Lcom/greysonparrelli/permiso/PermisoDialogFragment;->mOnCloseListener:Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;
    invoke-static {v0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment;->access$000(Lcom/greysonparrelli/permiso/PermisoDialogFragment;)Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;->onClose()V

    .line 100
    :cond_11
    return-void
.end method
