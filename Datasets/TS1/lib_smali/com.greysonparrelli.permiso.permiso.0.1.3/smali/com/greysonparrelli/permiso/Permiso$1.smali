.class Lcom/greysonparrelli/permiso/Permiso$1;
.super Ljava/lang/Object;
.source "Permiso.java"

# interfaces
.implements Lcom/greysonparrelli/permiso/Permiso$IOnRationaleProvided;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/greysonparrelli/permiso/Permiso;->requestPermissions(Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;[Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/greysonparrelli/permiso/Permiso;

.field final synthetic val$requestCode:I


# direct methods
.method constructor <init>(Lcom/greysonparrelli/permiso/Permiso;I)V
    .registers 3

    .prologue
    .line 129
    iput-object p1, p0, Lcom/greysonparrelli/permiso/Permiso$1;->this$0:Lcom/greysonparrelli/permiso/Permiso;

    iput p2, p0, Lcom/greysonparrelli/permiso/Permiso$1;->val$requestCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRationaleProvided()V
    .registers 3

    .prologue
    .line 132
    iget-object v0, p0, Lcom/greysonparrelli/permiso/Permiso$1;->this$0:Lcom/greysonparrelli/permiso/Permiso;

    iget v1, p0, Lcom/greysonparrelli/permiso/Permiso$1;->val$requestCode:I

    # invokes: Lcom/greysonparrelli/permiso/Permiso;->makePermissionRequest(I)V
    invoke-static {v0, v1}, Lcom/greysonparrelli/permiso/Permiso;->access$200(Lcom/greysonparrelli/permiso/Permiso;I)V

    .line 133
    return-void
.end method
