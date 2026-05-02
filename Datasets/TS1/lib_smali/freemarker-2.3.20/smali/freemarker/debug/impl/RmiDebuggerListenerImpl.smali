.class public Lfreemarker/debug/impl/RmiDebuggerListenerImpl;
.super Ljava/rmi/server/UnicastRemoteObject;
.source "RmiDebuggerListenerImpl.java"

# interfaces
.implements Lfreemarker/debug/DebuggerListener;
.implements Ljava/rmi/server/Unreferenced;


# static fields
.field private static final logger:Lfreemarker/log/Logger;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final listener:Lfreemarker/debug/DebuggerListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 23
    const-string v0, "freemarker.debug.client"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerListenerImpl;->logger:Lfreemarker/log/Logger;

    return-void
.end method

.method public constructor <init>(Lfreemarker/debug/DebuggerListener;)V
    .registers 2
    .param p1, "listener"    # Lfreemarker/debug/DebuggerListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/rmi/server/UnicastRemoteObject;-><init>()V

    .line 45
    iput-object p1, p0, Lfreemarker/debug/impl/RmiDebuggerListenerImpl;->listener:Lfreemarker/debug/DebuggerListener;

    .line 46
    return-void
.end method


# virtual methods
.method public environmentSuspended(Lfreemarker/debug/EnvironmentSuspendedEvent;)V
    .registers 3
    .param p1, "e"    # Lfreemarker/debug/EnvironmentSuspendedEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerListenerImpl;->listener:Lfreemarker/debug/DebuggerListener;

    invoke-interface {v0, p1}, Lfreemarker/debug/DebuggerListener;->environmentSuspended(Lfreemarker/debug/EnvironmentSuspendedEvent;)V

    .line 52
    return-void
.end method

.method public unreferenced()V
    .registers 4

    .prologue
    .line 34
    const/4 v1, 0x0

    :try_start_1
    invoke-static {p0, v1}, Ljava/rmi/server/UnicastRemoteObject;->unexportObject(Ljava/rmi/Remote;Z)Z
    :try_end_4
    .catch Ljava/rmi/NoSuchObjectException; {:try_start_1 .. :try_end_4} :catch_5

    .line 40
    :goto_4
    return-void

    .line 36
    :catch_5
    move-exception v0

    .line 38
    .local v0, "e":Ljava/rmi/NoSuchObjectException;
    sget-object v1, Lfreemarker/debug/impl/RmiDebuggerListenerImpl;->logger:Lfreemarker/log/Logger;

    const-string v2, "Failed to unexport RMI debugger listener"

    invoke-virtual {v1, v2, v0}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_4
.end method
