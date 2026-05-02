.class public final Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;
.super Ljava/rmi/server/RemoteStub;

# interfaces
.implements Lfreemarker/debug/Debugger;
.implements Ljava/rmi/Remote;


# static fields
.field private static $method_addBreakpoint_0:Ljava/lang/reflect/Method; = null

.field private static $method_addDebuggerListener_1:Ljava/lang/reflect/Method; = null

.field private static $method_getBreakpoints_2:Ljava/lang/reflect/Method; = null

.field private static $method_getBreakpoints_3:Ljava/lang/reflect/Method; = null

.field private static $method_getSuspendedEnvironments_4:Ljava/lang/reflect/Method; = null

.field private static $method_removeBreakpoint_5:Ljava/lang/reflect/Method; = null

.field private static $method_removeBreakpoints_6:Ljava/lang/reflect/Method; = null

.field private static $method_removeBreakpoints_7:Ljava/lang/reflect/Method; = null

.field private static $method_removeDebuggerListener_8:Ljava/lang/reflect/Method; = null

.field static class$freemarker$debug$Breakpoint:Ljava/lang/Class; = null

.field static class$freemarker$debug$Debugger:Ljava/lang/Class; = null

.field static class$freemarker$debug$DebuggerListener:Ljava/lang/Class; = null

.field static class$java$lang$Object:Ljava/lang/Class; = null

.field static class$java$lang$String:Ljava/lang/Class; = null

.field private static final serialVersionUID:J = 0x2L


# direct methods
.method static constructor <clinit>()V
    .registers 5

    :try_start_0
    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    if-eqz v0, :cond_d6

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    move-object v1, v0

    :goto_7
    const-string v2, "addBreakpoint"

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Breakpoint:Ljava/lang/Class;

    if-eqz v0, :cond_e1

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Breakpoint:Ljava/lang/Class;

    :goto_13
    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_addBreakpoint_0:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    if-eqz v0, :cond_f4

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    move-object v1, v0

    :goto_22
    const-string v2, "addDebuggerListener"

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$DebuggerListener:Ljava/lang/Class;

    if-eqz v0, :cond_ff

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$DebuggerListener:Ljava/lang/Class;

    :goto_2e
    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_addDebuggerListener_1:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    if-eqz v0, :cond_109

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    :goto_3c
    const-string v1, "getBreakpoints"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_getBreakpoints_2:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    if-eqz v0, :cond_113

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    move-object v1, v0

    :goto_4e
    const-string v2, "getBreakpoints"

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$java$lang$String:Ljava/lang/Class;

    if-eqz v0, :cond_11e

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$java$lang$String:Ljava/lang/Class;

    :goto_5a
    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_getBreakpoints_3:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    if-eqz v0, :cond_128

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    :goto_68
    const-string v1, "getSuspendedEnvironments"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_getSuspendedEnvironments_4:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    if-eqz v0, :cond_132

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    move-object v1, v0

    :goto_7a
    const-string v2, "removeBreakpoint"

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Breakpoint:Ljava/lang/Class;

    if-eqz v0, :cond_13d

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Breakpoint:Ljava/lang/Class;

    :goto_86
    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_removeBreakpoint_5:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    if-eqz v0, :cond_147

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    :goto_94
    const-string v1, "removeBreakpoints"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_removeBreakpoints_6:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    if-eqz v0, :cond_151

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    move-object v1, v0

    :goto_a6
    const-string v2, "removeBreakpoints"

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$java$lang$String:Ljava/lang/Class;

    if-eqz v0, :cond_15c

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$java$lang$String:Ljava/lang/Class;

    :goto_b2
    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_removeBreakpoints_7:Ljava/lang/reflect/Method;

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    if-eqz v0, :cond_166

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    move-object v1, v0

    :goto_c1
    const-string v2, "removeDebuggerListener"

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$java$lang$Object:Ljava/lang/Class;

    if-eqz v0, :cond_171

    sget-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$java$lang$Object:Ljava/lang/Class;

    :goto_cd
    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_removeDebuggerListener_8:Ljava/lang/reflect/Method;

    return-void

    :cond_d6
    const-string v0, "freemarker.debug.Debugger"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    move-object v1, v0

    goto/16 :goto_7

    :cond_e1
    const-string v0, "freemarker.debug.Breakpoint"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Breakpoint:Ljava/lang/Class;
    :try_end_e9
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_e9} :catch_eb

    goto/16 :goto_13

    :catch_eb
    move-exception v0

    new-instance v0, Ljava/lang/NoSuchMethodError;

    const-string v1, "stub class initialization failed"

    invoke-direct {v0, v1}, Ljava/lang/NoSuchMethodError;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_f4
    :try_start_f4
    const-string v0, "freemarker.debug.Debugger"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    move-object v1, v0

    goto/16 :goto_22

    :cond_ff
    const-string v0, "freemarker.debug.DebuggerListener"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$DebuggerListener:Ljava/lang/Class;

    goto/16 :goto_2e

    :cond_109
    const-string v0, "freemarker.debug.Debugger"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    goto/16 :goto_3c

    :cond_113
    const-string v0, "freemarker.debug.Debugger"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    move-object v1, v0

    goto/16 :goto_4e

    :cond_11e
    const-string v0, "java.lang.String"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$java$lang$String:Ljava/lang/Class;

    goto/16 :goto_5a

    :cond_128
    const-string v0, "freemarker.debug.Debugger"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    goto/16 :goto_68

    :cond_132
    const-string v0, "freemarker.debug.Debugger"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    move-object v1, v0

    goto/16 :goto_7a

    :cond_13d
    const-string v0, "freemarker.debug.Breakpoint"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Breakpoint:Ljava/lang/Class;

    goto/16 :goto_86

    :cond_147
    const-string v0, "freemarker.debug.Debugger"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    goto/16 :goto_94

    :cond_151
    const-string v0, "freemarker.debug.Debugger"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    move-object v1, v0

    goto/16 :goto_a6

    :cond_15c
    const-string v0, "java.lang.String"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$java$lang$String:Ljava/lang/Class;

    goto/16 :goto_b2

    :cond_166
    const-string v0, "freemarker.debug.Debugger"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$freemarker$debug$Debugger:Ljava/lang/Class;

    move-object v1, v0

    goto/16 :goto_c1

    :cond_171
    const-string v0, "java.lang.Object"

    invoke-static {v0}, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->class$java$lang$Object:Ljava/lang/Class;
    :try_end_179
    .catch Ljava/lang/NoSuchMethodException; {:try_start_f4 .. :try_end_179} :catch_eb

    goto/16 :goto_cd
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
.method public addBreakpoint(Lfreemarker/debug/Breakpoint;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_addBreakpoint_0:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v3, v1

    const-wide v4, -0x6261508e29e08a2aL    # -5.203711503485291E-166

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

.method public addDebuggerListener(Lfreemarker/debug/DebuggerListener;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_addDebuggerListener_1:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v3, v1

    const-wide v4, 0x372616e982aa4e1dL    # 4.952637319842364E-43

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;
    :try_end_13
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_13} :catch_15
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_13} :catch_17
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_19

    move-result-object v0

    return-object v0

    :catch_15
    move-exception v0

    throw v0

    :catch_17
    move-exception v0

    throw v0

    :catch_19
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public getBreakpoints()Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_getBreakpoints_2:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, 0x25b554704a807575L    # 4.923448552477671E-127

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_11} :catch_12
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_11} :catch_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_16

    return-object v0

    :catch_12
    move-exception v0

    throw v0

    :catch_14
    move-exception v0

    throw v0

    :catch_16
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public getBreakpoints(Ljava/lang/String;)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_getBreakpoints_3:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v3, v1

    const-wide v4, 0x1f2aed24cc1b85c4L

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;
    :try_end_16
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_16} :catch_17
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_16} :catch_19
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_1b

    return-object v0

    :catch_17
    move-exception v0

    throw v0

    :catch_19
    move-exception v0

    throw v0

    :catch_1b
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public getSuspendedEnvironments()Ljava/util/Collection;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_getSuspendedEnvironments_4:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, 0x590c0403b1a8c3d7L    # 9.042936223882068E120

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_11} :catch_12
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_11} :catch_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_16

    return-object v0

    :catch_12
    move-exception v0

    throw v0

    :catch_14
    move-exception v0

    throw v0

    :catch_16
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public removeBreakpoint(Lfreemarker/debug/Breakpoint;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_removeBreakpoint_5:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v3, v1

    const-wide v4, -0x5facc4cfe3a3016bL    # -5.737314544761486E-153

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

.method public removeBreakpoints()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_removeBreakpoints_6:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    const-wide v4, -0x5fe1e549ab55cefL    # -5.071663833589492E279

    move-object v1, p0

    invoke-interface/range {v0 .. v5}, Ljava/rmi/server/RemoteRef;->invoke(Ljava/rmi/Remote;Ljava/lang/reflect/Method;[Ljava/lang/Object;J)Ljava/lang/Object;
    :try_end_e
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_e} :catch_f
    .catch Ljava/rmi/RemoteException; {:try_start_0 .. :try_end_e} :catch_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_13

    return-void

    :catch_f
    move-exception v0

    throw v0

    :catch_11
    move-exception v0

    throw v0

    :catch_13
    move-exception v0

    new-instance v1, Ljava/rmi/UnexpectedException;

    const-string v2, "undeclared checked exception"

    invoke-direct {v1, v2, v0}, Ljava/rmi/UnexpectedException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method

.method public removeBreakpoints(Ljava/lang/String;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_removeBreakpoints_7:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v3, v1

    const-wide v4, -0x3955a4de1f39ea2cL    # -2.672814486119402E32

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

.method public removeDebuggerListener(Ljava/lang/Object;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/rmi/RemoteException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Ljava/rmi/server/RemoteObject;->ref:Ljava/rmi/server/RemoteRef;

    sget-object v2, Lfreemarker/debug/impl/RmiDebuggerImpl_Stub;->$method_removeDebuggerListener_8:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v3, v1

    const-wide v4, 0x74217b3c29d3246dL    # 2.503238780380829E251

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
