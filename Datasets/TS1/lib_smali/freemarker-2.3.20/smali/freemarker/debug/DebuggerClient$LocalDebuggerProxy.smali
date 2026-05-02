.class Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;
.super Ljava/lang/Object;
.source "DebuggerClient.java"

# interfaces
.implements Lfreemarker/debug/Debugger;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/debug/DebuggerClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LocalDebuggerProxy"
.end annotation


# instance fields
.field private final remoteDebugger:Lfreemarker/debug/Debugger;


# direct methods
.method constructor <init>(Lfreemarker/debug/Debugger;)V
    .registers 2
    .param p1, "remoteDebugger"    # Lfreemarker/debug/Debugger;

    .prologue
    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    iput-object p1, p0, Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;->remoteDebugger:Lfreemarker/debug/Debugger;

    .line 144
    return-void
.end method


# virtual methods
.method public addBreakpoint(Lfreemarker/debug/Breakpoint;)V
    .registers 3
    .param p1, "breakpoint"    # Lfreemarker/debug/Breakpoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 148
    iget-object v0, p0, Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;->remoteDebugger:Lfreemarker/debug/Debugger;

    invoke-interface {v0, p1}, Lfreemarker/debug/Debugger;->addBreakpoint(Lfreemarker/debug/Breakpoint;)V

    .line 149
    return-void
.end method

.method public addDebuggerListener(Lfreemarker/debug/DebuggerListener;)Ljava/lang/Object;
    .registers 4
    .param p1, "listener"    # Lfreemarker/debug/DebuggerListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 154
    instance-of v1, p1, Ljava/rmi/server/RemoteObject;

    if-eqz v1, :cond_b

    .line 156
    iget-object v1, p0, Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;->remoteDebugger:Lfreemarker/debug/Debugger;

    invoke-interface {v1, p1}, Lfreemarker/debug/Debugger;->addDebuggerListener(Lfreemarker/debug/DebuggerListener;)Ljava/lang/Object;

    move-result-object v1

    .line 162
    :goto_a
    return-object v1

    .line 160
    :cond_b
    new-instance v0, Lfreemarker/debug/impl/RmiDebuggerListenerImpl;

    invoke-direct {v0, p1}, Lfreemarker/debug/impl/RmiDebuggerListenerImpl;-><init>(Lfreemarker/debug/DebuggerListener;)V

    .line 162
    .local v0, "remotableListener":Lfreemarker/debug/impl/RmiDebuggerListenerImpl;
    iget-object v1, p0, Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;->remoteDebugger:Lfreemarker/debug/Debugger;

    invoke-interface {v1, v0}, Lfreemarker/debug/Debugger;->addDebuggerListener(Lfreemarker/debug/DebuggerListener;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_a
.end method

.method public getBreakpoints()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 168
    iget-object v0, p0, Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;->remoteDebugger:Lfreemarker/debug/Debugger;

    invoke-interface {v0}, Lfreemarker/debug/Debugger;->getBreakpoints()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getBreakpoints(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "templateName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 173
    iget-object v0, p0, Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;->remoteDebugger:Lfreemarker/debug/Debugger;

    invoke-interface {v0, p1}, Lfreemarker/debug/Debugger;->getBreakpoints(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSuspendedEnvironments()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 178
    iget-object v0, p0, Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;->remoteDebugger:Lfreemarker/debug/Debugger;

    invoke-interface {v0}, Lfreemarker/debug/Debugger;->getSuspendedEnvironments()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public removeBreakpoint(Lfreemarker/debug/Breakpoint;)V
    .registers 3
    .param p1, "breakpoint"    # Lfreemarker/debug/Breakpoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 183
    iget-object v0, p0, Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;->remoteDebugger:Lfreemarker/debug/Debugger;

    invoke-interface {v0, p1}, Lfreemarker/debug/Debugger;->removeBreakpoint(Lfreemarker/debug/Breakpoint;)V

    .line 184
    return-void
.end method

.method public removeBreakpoints()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 193
    iget-object v0, p0, Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;->remoteDebugger:Lfreemarker/debug/Debugger;

    invoke-interface {v0}, Lfreemarker/debug/Debugger;->removeBreakpoints()V

    .line 194
    return-void
.end method

.method public removeBreakpoints(Ljava/lang/String;)V
    .registers 3
    .param p1, "templateName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 188
    iget-object v0, p0, Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;->remoteDebugger:Lfreemarker/debug/Debugger;

    invoke-interface {v0, p1}, Lfreemarker/debug/Debugger;->removeBreakpoints(Ljava/lang/String;)V

    .line 189
    return-void
.end method

.method public removeDebuggerListener(Ljava/lang/Object;)V
    .registers 3
    .param p1, "id"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    .prologue
    .line 198
    iget-object v0, p0, Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;->remoteDebugger:Lfreemarker/debug/Debugger;

    invoke-interface {v0, p1}, Lfreemarker/debug/Debugger;->removeDebuggerListener(Ljava/lang/Object;)V

    .line 199
    return-void
.end method
