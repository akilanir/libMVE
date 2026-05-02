.class Lfreemarker/debug/impl/RmiDebuggerImpl;
.super Ljava/rmi/server/UnicastRemoteObject;
.source "RmiDebuggerImpl.java"

# interfaces
.implements Lfreemarker/debug/Debugger;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final service:Lfreemarker/debug/impl/RmiDebuggerService;


# direct methods
.method protected constructor <init>(Lfreemarker/debug/impl/RmiDebuggerService;)V
    .registers 2
    .param p1, "service"    # Lfreemarker/debug/impl/RmiDebuggerService;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/rmi/server/UnicastRemoteObject;-><init>()V

    .line 27
    iput-object p1, p0, Lfreemarker/debug/impl/RmiDebuggerImpl;->service:Lfreemarker/debug/impl/RmiDebuggerService;

    .line 28
    return-void
.end method


# virtual methods
.method public addBreakpoint(Lfreemarker/debug/Breakpoint;)V
    .registers 3
    .param p1, "breakpoint"    # Lfreemarker/debug/Breakpoint;

    .prologue
    .line 32
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerImpl;->service:Lfreemarker/debug/impl/RmiDebuggerService;

    invoke-virtual {v0, p1}, Lfreemarker/debug/impl/RmiDebuggerService;->addBreakpoint(Lfreemarker/debug/Breakpoint;)V

    .line 33
    return-void
.end method

.method public addDebuggerListener(Lfreemarker/debug/DebuggerListener;)Ljava/lang/Object;
    .registers 3
    .param p1, "listener"    # Lfreemarker/debug/DebuggerListener;

    .prologue
    .line 37
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerImpl;->service:Lfreemarker/debug/impl/RmiDebuggerService;

    invoke-virtual {v0, p1}, Lfreemarker/debug/impl/RmiDebuggerService;->addDebuggerListener(Lfreemarker/debug/DebuggerListener;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getBreakpoints()Ljava/util/List;
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerImpl;->service:Lfreemarker/debug/impl/RmiDebuggerService;

    invoke-virtual {v0}, Lfreemarker/debug/impl/RmiDebuggerService;->getBreakpointsSpi()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getBreakpoints(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "templateName"    # Ljava/lang/String;

    .prologue
    .line 47
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerImpl;->service:Lfreemarker/debug/impl/RmiDebuggerService;

    invoke-virtual {v0, p1}, Lfreemarker/debug/impl/RmiDebuggerService;->getBreakpointsSpi(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSuspendedEnvironments()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerImpl;->service:Lfreemarker/debug/impl/RmiDebuggerService;

    invoke-virtual {v0}, Lfreemarker/debug/impl/RmiDebuggerService;->getSuspendedEnvironments()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public removeBreakpoint(Lfreemarker/debug/Breakpoint;)V
    .registers 3
    .param p1, "breakpoint"    # Lfreemarker/debug/Breakpoint;

    .prologue
    .line 57
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerImpl;->service:Lfreemarker/debug/impl/RmiDebuggerService;

    invoke-virtual {v0, p1}, Lfreemarker/debug/impl/RmiDebuggerService;->removeBreakpoint(Lfreemarker/debug/Breakpoint;)V

    .line 58
    return-void
.end method

.method public removeBreakpoints()V
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerImpl;->service:Lfreemarker/debug/impl/RmiDebuggerService;

    invoke-virtual {v0}, Lfreemarker/debug/impl/RmiDebuggerService;->removeBreakpoints()V

    .line 68
    return-void
.end method

.method public removeBreakpoints(Ljava/lang/String;)V
    .registers 3
    .param p1, "templateName"    # Ljava/lang/String;

    .prologue
    .line 72
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerImpl;->service:Lfreemarker/debug/impl/RmiDebuggerService;

    invoke-virtual {v0, p1}, Lfreemarker/debug/impl/RmiDebuggerService;->removeBreakpoints(Ljava/lang/String;)V

    .line 73
    return-void
.end method

.method public removeDebuggerListener(Ljava/lang/Object;)V
    .registers 3
    .param p1, "id"    # Ljava/lang/Object;

    .prologue
    .line 62
    iget-object v0, p0, Lfreemarker/debug/impl/RmiDebuggerImpl;->service:Lfreemarker/debug/impl/RmiDebuggerService;

    invoke-virtual {v0, p1}, Lfreemarker/debug/impl/RmiDebuggerService;->removeDebuggerListener(Ljava/lang/Object;)V

    .line 63
    return-void
.end method
