.class final Lch/qos/logback/core/util/Loader$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lch/qos/logback/core/util/Loader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Boolean;
    .registers 3

    :try_start_0
    new-instance v0, Ljava/lang/RuntimePermission;

    const-string v1, "getClassLoader"

    invoke-direct {v0, v1}, Ljava/lang/RuntimePermission;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/security/AccessController;->checkPermission(Ljava/security/Permission;)V

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_e
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_e} :catch_10

    move-result-object v0

    :goto_f
    return-object v0

    :catch_10
    move-exception v0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_f
.end method

.method public bridge synthetic run()Ljava/lang/Object;
    .registers 2

    invoke-virtual {p0}, Lch/qos/logback/core/util/Loader$1;->run()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
