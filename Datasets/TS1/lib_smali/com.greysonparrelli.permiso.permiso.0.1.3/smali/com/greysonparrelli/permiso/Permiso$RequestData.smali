.class Lcom/greysonparrelli/permiso/Permiso$RequestData;
.super Ljava/lang/Object;
.source "Permiso.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/greysonparrelli/permiso/Permiso;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RequestData"
.end annotation


# instance fields
.field onResultListener:Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;

.field resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;


# direct methods
.method public varargs constructor <init>(Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;[Ljava/lang/String;)V
    .registers 5
    .param p1, "onResultListener"    # Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "permissions"    # [Ljava/lang/String;

    .prologue
    .line 316
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 317
    iput-object p1, p0, Lcom/greysonparrelli/permiso/Permiso$RequestData;->onResultListener:Lcom/greysonparrelli/permiso/Permiso$IOnPermissionResult;

    .line 318
    new-instance v0, Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    const/4 v1, 0x0

    invoke-direct {v0, p2, v1}, Lcom/greysonparrelli/permiso/Permiso$ResultSet;-><init>([Ljava/lang/String;Lcom/greysonparrelli/permiso/Permiso$1;)V

    iput-object v0, p0, Lcom/greysonparrelli/permiso/Permiso$RequestData;->resultSet:Lcom/greysonparrelli/permiso/Permiso$ResultSet;

    .line 319
    return-void
.end method
