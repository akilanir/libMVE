.class public final Lfreemarker/debug/impl/RmiDebuggerListenerImpl_Stub;
.super Ljava/rmi/server/RemoteStub;

# interfaces
.implements Lfreemarker/debug/DebuggerListener;
.implements Ljava/rmi/Remote;


# static fields
.field private static $method_environmentSuspended_0:Ljava/lang/reflect/Method; = null

.field static class$freemarker$debug$DebuggerListener:Ljava/lang/Class; = null

.field static class$freemarker$debug$EnvironmentSuspendedEvent:Ljava/lang/Class; = null

.field private static final serialVersionUID:J = 0x2L


# direct methods
.method static constructor <clinit>()V
    .registers 5

    :try_start_0
    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerListenerImpl_Stub;->class$freemarker$debug$DebuggerListener:Ljava/lang/Class;

    if-eqz v0, :cond_1c

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerListenerImpl_Stub;->class$freemarker$debug$DebuggerListener:Ljava/lang/Class;

    move-object v1, v0

    :goto_7
    const-string v2, "environmentSuspended"

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerListenerImpl_Stub;->class$freemarker$debug$EnvironmentSuspendedEvent:Ljava/lang/Class;

    if-eqz v0, :cond_26

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerListenerImpl_Stub;->class$freemarker$debug$EnvironmentSuspendedEvent:Ljava/lang/Class;

    :goto_13
    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerListenerImpl_Stub;->$method_environmentSuspended_0:Ljava/lang/reflect/Method;

    return-void

    :cond_1c
    const-string v0, "freemarker.debug.DebuggerListener"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerListenerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerListenerImpl_Stub;->class$freemarker$debug$DebuggerListener:Ljava/lang/Class;

    move-object v1, v0

    goto :goto_7

    :cond_26
    const-string v0, "freemarker.debug.EnvironmentSuspendedEvent"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerListenerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerListenerImpl_Stub;->class$freemarker$debug$EnvironmentSuspendedEvent:Ljava/lang/Class;
    :try_end_2e
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_2e} :catch_2f

    goto :goto_13

    :catch_2f
    move-exception v0

    new-instance v0, Ljava/lang/NoSuchMethodError;

    const-string v1, "stub class initialization failed"

    invoke-direct {v0, v1}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Ljava/rmi/server/RemoteRef;)V
    .registers 2

    invoke-direct {p0, p1}, Ljava/rmi/server/RemoteStub;-><init>(Ljava/rmi/server/RemoteRef;)V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3

    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    return-object v0

    :catch_5
    move-exception v0

    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public environmentSuspended(Lfreemarker/debug/EnvironmentSuspendedEvent;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggerListenerImpl_Stub;->$method_environmentSuspended_0:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v3, v1

    const-wide v4, -0x2343ff8674e8d87aL    # -5.210325063224157E138

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;
    :try_end_13
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_13} :catch_14
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_13} :catch_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_18

    return-void

    :catch_14
    move-exception v0

    throw v0

    :catch_16
    move-exception v0

    throw v0

    :catch_18
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method
