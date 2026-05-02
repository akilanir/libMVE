.class Lcom/greysonparrelli/permiso/Permiso$2;
.super Ljava/lang/Object;
.source "Permiso.java"

# interfaces
.implements Lcom/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/greysonparrelli/permiso/Permiso;->showRationaleInDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/greysonparrelli/permiso/Permiso;

.field final synthetic val$rationaleCallback:Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;


# direct methods
.method constructor <init>(Lcom/greysonparrelli/permiso/Permiso;Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;)V
    .registers 3

    .prologue
    .line 187
    iput-object p1, p0, Lcom/greysonparrelli/permiso/Permiso$2;->this$0:Lcom/greysonparrelli/permiso/Permiso;

    iput-object p2, p0, Lcom/greysonparrelli/permiso/Permiso$2;->val$rationaleCallback:Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose()V
    .registers 2

    .prologue
    .line 190
    iget-object v0, p0, Lcom/greysonparrelli/permiso/Permiso$2;->val$rationaleCallback:Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;

    invoke-interface {v0}, Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;->onRationaleProvided()V

    .line 191
    return-void
.end method
