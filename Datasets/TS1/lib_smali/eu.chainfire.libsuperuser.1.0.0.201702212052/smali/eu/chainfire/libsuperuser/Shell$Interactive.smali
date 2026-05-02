.class public Leu/chainfire/libsuperuser/Shell$Interactive;
.super Ljava/lang/Object;
.source "Shell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Leu/chainfire/libsuperuser/Shell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Interactive"
.end annotation


# instance fields
.field private STDERR:Leu/chainfire/libsuperuser/StreamGobbler;

.field private STDIN:Ljava/io/DataOutputStream;

.field private STDOUT:Leu/chainfire/libsuperuser/StreamGobbler;

.field private final autoHandler:Z

.field private volatile buffer:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final callbackSync:Ljava/lang/Object;

.field private volatile callbacks:I

.field private volatile closed:Z

.field private volatile command:Leu/chainfire/libsuperuser/Shell$Command;

.field private final commands:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Leu/chainfire/libsuperuser/Shell$Command;",
            ">;"
        }
    .end annotation
.end field

.field private final environment:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final handler:Landroid/os/Handler;

.field private volatile idle:Z

.field private final idleSync:Ljava/lang/Object;

.field private volatile lastExitCode:I

.field private volatile lastMarkerSTDERR:Ljava/lang/String;

.field private volatile lastMarkerSTDOUT:Ljava/lang/String;

.field private final onSTDERRLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

.field private final onSTDOUTLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

.field private process:Ljava/lang/Process;

.field private volatile running:Z

.field private final shell:Ljava/lang/String;

.field private final wantSTDERR:Z

.field private watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

.field private volatile watchdogCount:I

.field private watchdogTimeout:I


# direct methods
.method private constructor <init>(Leu/chainfire/libsuperuser/Shell$Builder;Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V
    .registers 9
    .param p1, "builder"    # Leu/chainfire/libsuperuser/Shell$Builder;
    .param p2, "onCommandResultListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    .prologue
    const/4 v0, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 1013
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 986
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    .line 987
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    .line 988
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDOUT:Leu/chainfire/libsuperuser/StreamGobbler;

    .line 989
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDERR:Leu/chainfire/libsuperuser/StreamGobbler;

    .line 990
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 992
    iput-boolean v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->running:Z

    .line 993
    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    .line 994
    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->closed:Z

    .line 995
    iput v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I

    .line 998
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    .line 999
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbackSync:Ljava/lang/Object;

    .line 1001
    iput v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastExitCode:I

    .line 1002
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDOUT:Ljava/lang/String;

    .line 1003
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDERR:Ljava/lang/String;

    .line 1004
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    .line 1005
    iput-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    .line 1014
    # getter for: Leu/chainfire/libsuperuser/Shell$Builder;->autoHandler:Z
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$100(Leu/chainfire/libsuperuser/Shell$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->autoHandler:Z

    .line 1015
    # getter for: Leu/chainfire/libsuperuser/Shell$Builder;->shell:Ljava/lang/String;
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$200(Leu/chainfire/libsuperuser/Shell$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    .line 1016
    # getter for: Leu/chainfire/libsuperuser/Shell$Builder;->wantSTDERR:Z
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$300(Leu/chainfire/libsuperuser/Shell$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->wantSTDERR:Z

    .line 1017
    # getter for: Leu/chainfire/libsuperuser/Shell$Builder;->commands:Ljava/util/List;
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$400(Leu/chainfire/libsuperuser/Shell$Builder;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    .line 1018
    # getter for: Leu/chainfire/libsuperuser/Shell$Builder;->environment:Ljava/util/Map;
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$500(Leu/chainfire/libsuperuser/Shell$Builder;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->environment:Ljava/util/Map;

    .line 1019
    # getter for: Leu/chainfire/libsuperuser/Shell$Builder;->onSTDOUTLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$600(Leu/chainfire/libsuperuser/Shell$Builder;)Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    move-result-object v0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->onSTDOUTLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    .line 1020
    # getter for: Leu/chainfire/libsuperuser/Shell$Builder;->onSTDERRLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$700(Leu/chainfire/libsuperuser/Shell$Builder;)Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    move-result-object v0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->onSTDERRLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    .line 1021
    # getter for: Leu/chainfire/libsuperuser/Shell$Builder;->watchdogTimeout:I
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$800(Leu/chainfire/libsuperuser/Shell$Builder;)I

    move-result v0

    iput v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogTimeout:I

    .line 1027
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_9b

    # getter for: Leu/chainfire/libsuperuser/Shell$Builder;->handler:Landroid/os/Handler;
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$900(Leu/chainfire/libsuperuser/Shell$Builder;)Landroid/os/Handler;

    move-result-object v0

    if-nez v0, :cond_9b

    iget-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->autoHandler:Z

    if-eqz v0, :cond_9b

    .line 1028
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    .line 1033
    :goto_77
    if-eqz p2, :cond_8e

    .line 1036
    const/16 v0, 0x3c

    iput v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogTimeout:I

    .line 1037
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    new-instance v1, Leu/chainfire/libsuperuser/Shell$Command;

    sget-object v2, Leu/chainfire/libsuperuser/Shell;->availableTestCommands:[Ljava/lang/String;

    new-instance v3, Leu/chainfire/libsuperuser/Shell$Interactive$1;

    invoke-direct {v3, p0, p1, p2}, Leu/chainfire/libsuperuser/Shell$Interactive$1;-><init>(Leu/chainfire/libsuperuser/Shell$Interactive;Leu/chainfire/libsuperuser/Shell$Builder;Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    invoke-direct {v1, v2, v5, v3, v4}, Leu/chainfire/libsuperuser/Shell$Command;-><init>([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V

    invoke-interface {v0, v5, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 1050
    :cond_8e
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->open()Z

    move-result v0

    if-nez v0, :cond_9a

    if-eqz p2, :cond_9a

    .line 1051
    const/4 v0, -0x3

    invoke-interface {p2, v5, v0, v4}, Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;->onCommandResult(IILjava/util/List;)V

    .line 1054
    :cond_9a
    return-void

    .line 1030
    :cond_9b
    # getter for: Leu/chainfire/libsuperuser/Shell$Builder;->handler:Landroid/os/Handler;
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Builder;->access$900(Leu/chainfire/libsuperuser/Shell$Builder;)Landroid/os/Handler;

    move-result-object v0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    goto :goto_77
.end method

.method synthetic constructor <init>(Leu/chainfire/libsuperuser/Shell$Builder;Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;Leu/chainfire/libsuperuser/Shell$1;)V
    .registers 4
    .param p1, "x0"    # Leu/chainfire/libsuperuser/Shell$Builder;
    .param p2, "x1"    # Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;
    .param p3, "x2"    # Leu/chainfire/libsuperuser/Shell$1;

    .prologue
    .line 975
    invoke-direct {p0, p1, p2}, Leu/chainfire/libsuperuser/Shell$Interactive;-><init>(Leu/chainfire/libsuperuser/Shell$Builder;Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    return-void
.end method

.method static synthetic access$1000(Leu/chainfire/libsuperuser/Shell$Interactive;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 975
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1102(Leu/chainfire/libsuperuser/Shell$Interactive;I)I
    .registers 2
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;
    .param p1, "x1"    # I

    .prologue
    .line 975
    iput p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogTimeout:I

    return p1
.end method

.method static synthetic access$1200(Leu/chainfire/libsuperuser/Shell$Interactive;)V
    .registers 1
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 975
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->handleWatchdog()V

    return-void
.end method

.method static synthetic access$1600(Leu/chainfire/libsuperuser/Shell$Interactive;)V
    .registers 1
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 975
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->endCallback()V

    return-void
.end method

.method static synthetic access$1900(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/Shell$Command;
    .registers 2
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 975
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    return-object v0
.end method

.method static synthetic access$2000(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 975
    invoke-direct {p0, p1}, Leu/chainfire/libsuperuser/Shell$Interactive;->addBuffer(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2100(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;
    .registers 2
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 975
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->onSTDOUTLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    return-object v0
.end method

.method static synthetic access$2200(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V
    .registers 3
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    .prologue
    .line 975
    invoke-direct {p0, p1, p2}, Leu/chainfire/libsuperuser/Shell$Interactive;->processLine(Ljava/lang/String;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V

    return-void
.end method

.method static synthetic access$2302(Leu/chainfire/libsuperuser/Shell$Interactive;I)I
    .registers 2
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;
    .param p1, "x1"    # I

    .prologue
    .line 975
    iput p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastExitCode:I

    return p1
.end method

.method static synthetic access$2402(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 975
    iput-object p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDOUT:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2500(Leu/chainfire/libsuperuser/Shell$Interactive;)V
    .registers 1
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 975
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->processMarker()V

    return-void
.end method

.method static synthetic access$2600(Leu/chainfire/libsuperuser/Shell$Interactive;)Z
    .registers 2
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 975
    iget-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->wantSTDERR:Z

    return v0
.end method

.method static synthetic access$2700(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;
    .registers 2
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 975
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->onSTDERRLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    return-object v0
.end method

.method static synthetic access$2802(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Leu/chainfire/libsuperuser/Shell$Interactive;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 975
    iput-object p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDERR:Ljava/lang/String;

    return-object p1
.end method

.method private declared-synchronized addBuffer(Ljava/lang/String;)V
    .registers 3
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 1399
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    if-eqz v0, :cond_a

    .line 1400
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 1402
    :cond_a
    monitor-exit p0

    return-void

    .line 1399
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private endCallback()V
    .registers 3

    .prologue
    .line 1452
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbackSync:Ljava/lang/Object;

    monitor-enter v1

    .line 1453
    :try_start_3
    iget v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I

    .line 1454
    iget v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I

    if-nez v0, :cond_12

    .line 1455
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbackSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1457
    :cond_12
    monitor-exit v1

    .line 1458
    return-void

    .line 1457
    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method private declared-synchronized handleWatchdog()V
    .registers 7

    .prologue
    .line 1231
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_49

    if-nez v1, :cond_7

    .line 1258
    :cond_5
    :goto_5
    monitor-exit p0

    return-void

    .line 1233
    :cond_7
    :try_start_7
    iget v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogTimeout:I

    if-eqz v1, :cond_5

    .line 1236
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->isRunning()Z

    move-result v1

    if-nez v1, :cond_4c

    .line 1237
    const/4 v0, -0x2

    .line 1238
    .local v0, "exitCode":I
    const-string v1, "[%s%%] SHELL_DIED"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V

    .line 1246
    :goto_29
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    if-eqz v1, :cond_34

    .line 1247
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    invoke-direct {p0, v1, v0, v2}, Leu/chainfire/libsuperuser/Shell$Interactive;->postCallback(Leu/chainfire/libsuperuser/Shell$Command;ILjava/util/List;)V

    .line 1251
    :cond_34
    const/4 v1, 0x0

    iput-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    .line 1252
    const/4 v1, 0x0

    iput-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    .line 1253
    const/4 v1, 0x1

    iput-boolean v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    .line 1255
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->shutdown()V

    .line 1256
    const/4 v1, 0x0

    iput-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 1257
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->kill()V
    :try_end_48
    .catchall {:try_start_7 .. :try_end_48} :catchall_49

    goto :goto_5

    .line 1231
    .end local v0    # "exitCode":I
    :catchall_49
    move-exception v1

    monitor-exit p0

    throw v1

    .line 1239
    :cond_4c
    :try_start_4c
    iget v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogCount:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogCount:I

    iget v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogTimeout:I

    if-lt v1, v2, :cond_5

    .line 1242
    const/4 v0, -0x1

    .line 1243
    .restart local v0    # "exitCode":I
    const-string v1, "[%s%%] WATCHDOG_EXIT"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V
    :try_end_6e
    .catchall {:try_start_4c .. :try_end_6e} :catchall_49

    goto :goto_29
.end method

.method private declared-synchronized open()Z
    .registers 13

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1467
    monitor-enter p0

    :try_start_3
    const-string v5, "[%s%%] START"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    iget-object v10, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v11, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v10, v11}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v5, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_110

    .line 1472
    :try_start_1a
    iget-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->environment:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v5

    if-nez v5, :cond_ab

    .line 1473
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    iget-object v8, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v5

    iput-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    .line 1487
    :goto_2e
    new-instance v5, Ljava/io/DataOutputStream;

    iget-object v8, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    invoke-virtual {v8}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    .line 1488
    new-instance v5, Leu/chainfire/libsuperuser/StreamGobbler;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v10, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v9, v10}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "-"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    .line 1489
    invoke-virtual {v9}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    new-instance v10, Leu/chainfire/libsuperuser/Shell$Interactive$5;

    invoke-direct {v10, p0}, Leu/chainfire/libsuperuser/Shell$Interactive$5;-><init>(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    invoke-direct {v5, v8, v9, v10}, Leu/chainfire/libsuperuser/StreamGobbler;-><init>(Ljava/lang/String;Ljava/io/InputStream;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V

    iput-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDOUT:Leu/chainfire/libsuperuser/StreamGobbler;

    .line 1529
    new-instance v5, Leu/chainfire/libsuperuser/StreamGobbler;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v10, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v9, v10}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "*"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    .line 1530
    invoke-virtual {v9}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v9

    new-instance v10, Leu/chainfire/libsuperuser/Shell$Interactive$6;

    invoke-direct {v10, p0}, Leu/chainfire/libsuperuser/Shell$Interactive$6;-><init>(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    invoke-direct {v5, v8, v9, v10}, Leu/chainfire/libsuperuser/StreamGobbler;-><init>(Ljava/lang/String;Ljava/io/InputStream;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V

    iput-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDERR:Leu/chainfire/libsuperuser/StreamGobbler;

    .line 1562
    iget-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDOUT:Leu/chainfire/libsuperuser/StreamGobbler;

    invoke-virtual {v5}, Leu/chainfire/libsuperuser/StreamGobbler;->start()V

    .line 1563
    iget-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDERR:Leu/chainfire/libsuperuser/StreamGobbler;

    invoke-virtual {v5}, Leu/chainfire/libsuperuser/StreamGobbler;->start()V

    .line 1565
    const/4 v5, 0x1

    iput-boolean v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->running:Z

    .line 1566
    const/4 v5, 0x0

    iput-boolean v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->closed:Z

    .line 1568
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->runNextCommand()V
    :try_end_a8
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_a8} :catch_10d
    .catchall {:try_start_1a .. :try_end_a8} :catchall_110

    move v5, v6

    .line 1573
    :goto_a9
    monitor-exit p0

    return v5

    .line 1475
    :cond_ab
    :try_start_ab
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 1476
    .local v4, "newEnvironment":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Ljava/lang/System;->getenv()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 1477
    iget-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->environment:Ljava/util/Map;

    invoke-interface {v4, v5}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 1478
    const/4 v3, 0x0

    .line 1479
    .local v3, "i":I
    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v5

    new-array v2, v5, [Ljava/lang/String;

    .line 1480
    .local v2, "env":[Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_cb
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_ff

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 1481
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "="

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v3

    .line 1482
    add-int/lit8 v3, v3, 0x1

    .line 1483
    goto :goto_cb

    .line 1484
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_ff
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    iget-object v8, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    invoke-virtual {v5, v8, v2}, Ljava/lang/Runtime;->exec(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v5

    iput-object v5, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;
    :try_end_10b
    .catch Ljava/io/IOException; {:try_start_ab .. :try_end_10b} :catch_10d
    .catchall {:try_start_ab .. :try_end_10b} :catchall_110

    goto/16 :goto_2e

    .line 1571
    .end local v2    # "env":[Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "newEnvironment":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_10d
    move-exception v0

    .local v0, "e":Ljava/io/IOException;
    move v5, v7

    .line 1573
    goto :goto_a9

    .line 1467
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_110
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method private postCallback(Leu/chainfire/libsuperuser/Shell$Command;ILjava/util/List;)V
    .registers 6
    .param p1, "fCommand"    # Leu/chainfire/libsuperuser/Shell$Command;
    .param p2, "fExitCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Leu/chainfire/libsuperuser/Shell$Command;",
            "I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1418
    .local p3, "fOutput":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->onCommandResultListener:Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1400(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    move-result-object v0

    if-nez v0, :cond_d

    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->onCommandLineListener:Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1700(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    move-result-object v0

    if-nez v0, :cond_d

    .line 1445
    :cond_c
    :goto_c
    return-void

    .line 1421
    :cond_d
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    if-nez v0, :cond_36

    .line 1422
    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->onCommandResultListener:Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1400(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    move-result-object v0

    if-eqz v0, :cond_24

    if-eqz p3, :cond_24

    .line 1423
    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->onCommandResultListener:Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1400(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    move-result-object v0

    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->code:I
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1800(Leu/chainfire/libsuperuser/Shell$Command;)I

    move-result v1

    invoke-interface {v0, v1, p2, p3}, Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;->onCommandResult(IILjava/util/List;)V

    .line 1425
    :cond_24
    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->onCommandLineListener:Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1700(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 1426
    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->onCommandLineListener:Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1700(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    move-result-object v0

    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->code:I
    invoke-static {p1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1800(Leu/chainfire/libsuperuser/Shell$Command;)I

    move-result v1

    invoke-interface {v0, v1, p2}, Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;->onCommandResult(II)V

    goto :goto_c

    .line 1429
    :cond_36
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->startCallback()V

    .line 1430
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    new-instance v1, Leu/chainfire/libsuperuser/Shell$Interactive$4;

    invoke-direct {v1, p0, p1, p3, p2}, Leu/chainfire/libsuperuser/Shell$Interactive$4;-><init>(Leu/chainfire/libsuperuser/Shell$Interactive;Leu/chainfire/libsuperuser/Shell$Command;Ljava/util/List;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_c
.end method

.method private declared-synchronized processLine(Ljava/lang/String;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V
    .registers 7
    .param p1, "line"    # Ljava/lang/String;
    .param p2, "listener"    # Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    .prologue
    .line 1371
    monitor-enter p0

    if-eqz p2, :cond_16

    .line 1372
    :try_start_3
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    if-eqz v2, :cond_18

    .line 1373
    move-object v0, p1

    .line 1374
    .local v0, "fLine":Ljava/lang/String;
    move-object v1, p2

    .line 1376
    .local v1, "fListener":Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->startCallback()V

    .line 1377
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    new-instance v3, Leu/chainfire/libsuperuser/Shell$Interactive$3;

    invoke-direct {v3, p0, v1, v0}, Leu/chainfire/libsuperuser/Shell$Interactive$3;-><init>(Leu/chainfire/libsuperuser/Shell$Interactive;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_1c

    .line 1391
    .end local v0    # "fLine":Ljava/lang/String;
    .end local v1    # "fListener":Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;
    :cond_16
    :goto_16
    monitor-exit p0

    return-void

    .line 1388
    :cond_18
    :try_start_18
    invoke-interface {p2, p1}, Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;->onLine(Ljava/lang/String;)V
    :try_end_1b
    .catchall {:try_start_18 .. :try_end_1b} :catchall_1c

    goto :goto_16

    .line 1371
    :catchall_1c
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private declared-synchronized processMarker()V
    .registers 4

    .prologue
    .line 1353
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->marker:Ljava/lang/String;
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDOUT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    .line 1354
    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->marker:Ljava/lang/String;
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDERR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    .line 1355
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    iget v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastExitCode:I

    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    invoke-direct {p0, v0, v1, v2}, Leu/chainfire/libsuperuser/Shell$Interactive;->postCallback(Leu/chainfire/libsuperuser/Shell$Command;ILjava/util/List;)V

    .line 1356
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->stopWatchdog()V

    .line 1357
    const/4 v0, 0x0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    .line 1358
    const/4 v0, 0x0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    .line 1359
    const/4 v0, 0x1

    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    .line 1360
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->runNextCommand()V
    :try_end_35
    .catchall {:try_start_1 .. :try_end_35} :catchall_37

    .line 1362
    :cond_35
    monitor-exit p0

    return-void

    .line 1353
    :catchall_37
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private runNextCommand()V
    .registers 2

    .prologue
    .line 1221
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->runNextCommand(Z)V

    .line 1222
    return-void
.end method

.method private runNextCommand(Z)V
    .registers 13
    .param p1, "notifyIdle"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v6, 0x0

    const/4 v4, 0x0

    .line 1295
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->isRunning()Z

    move-result v1

    .line 1296
    .local v1, "running":Z
    if-nez v1, :cond_b

    .line 1297
    iput-boolean v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    .line 1299
    :cond_b
    if-eqz v1, :cond_fc

    iget-boolean v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    if-eqz v3, :cond_fc

    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_fc

    .line 1300
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leu/chainfire/libsuperuser/Shell$Command;

    .line 1301
    .local v0, "command":Leu/chainfire/libsuperuser/Shell$Command;
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1303
    iput-object v6, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    .line 1304
    iput v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastExitCode:I

    .line 1305
    iput-object v6, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDOUT:Ljava/lang/String;

    .line 1306
    iput-object v6, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDERR:Ljava/lang/String;

    .line 1308
    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->commands:[Ljava/lang/String;
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1300(Leu/chainfire/libsuperuser/Shell$Command;)[Ljava/lang/String;

    move-result-object v3

    array-length v3, v3

    if-lez v3, :cond_f8

    .line 1310
    :try_start_35
    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->onCommandResultListener:Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1400(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    move-result-object v3

    if-eqz v3, :cond_46

    .line 1315
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v3}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->buffer:Ljava/util/List;

    .line 1318
    :cond_46
    const/4 v3, 0x0

    iput-boolean v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    .line 1319
    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;

    .line 1320
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->startWatchdog()V

    .line 1321
    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->commands:[Ljava/lang/String;
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1300(Leu/chainfire/libsuperuser/Shell$Command;)[Ljava/lang/String;

    move-result-object v5

    array-length v6, v5

    move v3, v4

    :goto_54
    if-ge v3, v6, :cond_93

    aget-object v2, v5, v3

    .line 1322
    .local v2, "write":Ljava/lang/String;
    const-string v4, "[%s+] %s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v10, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 1323
    invoke-virtual {v9, v10}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    aput-object v2, v7, v8

    .line 1322
    invoke-static {v4, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Leu/chainfire/libsuperuser/Debug;->logCommand(Ljava/lang/String;)V

    .line 1324
    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-virtual {v7, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/io/DataOutputStream;->write([B)V

    .line 1321
    add-int/lit8 v3, v3, 0x1

    goto :goto_54

    .line 1326
    .end local v2    # "write":Ljava/lang/String;
    :cond_93
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "echo "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->marker:Ljava/lang/String;
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " $?\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/DataOutputStream;->write([B)V

    .line 1327
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "echo "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->marker:Ljava/lang/String;
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " >&2\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/DataOutputStream;->write([B)V

    .line 1328
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    invoke-virtual {v3}, Ljava/io/DataOutputStream;->flush()V
    :try_end_e8
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_e8} :catch_116

    .line 1342
    .end local v0    # "command":Leu/chainfire/libsuperuser/Shell$Command;
    :cond_e8
    :goto_e8
    iget-boolean v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    if-eqz v3, :cond_f7

    if-eqz p1, :cond_f7

    .line 1343
    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    monitor-enter v4

    .line 1344
    :try_start_f1
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 1345
    monitor-exit v4
    :try_end_f7
    .catchall {:try_start_f1 .. :try_end_f7} :catchall_113

    .line 1347
    :cond_f7
    return-void

    .line 1333
    .restart local v0    # "command":Leu/chainfire/libsuperuser/Shell$Command;
    :cond_f8
    invoke-direct {p0, v4}, Leu/chainfire/libsuperuser/Shell$Interactive;->runNextCommand(Z)V

    goto :goto_e8

    .line 1335
    .end local v0    # "command":Leu/chainfire/libsuperuser/Shell$Command;
    :cond_fc
    if-nez v1, :cond_e8

    .line 1337
    :goto_fe
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_e8

    .line 1338
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leu/chainfire/libsuperuser/Shell$Command;

    const/4 v5, -0x2

    invoke-direct {p0, v3, v5, v6}, Leu/chainfire/libsuperuser/Shell$Interactive;->postCallback(Leu/chainfire/libsuperuser/Shell$Command;ILjava/util/List;)V

    goto :goto_fe

    .line 1345
    :catchall_113
    move-exception v3

    :try_start_114
    monitor-exit v4
    :try_end_115
    .catchall {:try_start_114 .. :try_end_115} :catchall_113

    throw v3

    .line 1329
    .restart local v0    # "command":Leu/chainfire/libsuperuser/Shell$Command;
    :catch_116
    move-exception v3

    goto :goto_e8
.end method

.method private startCallback()V
    .registers 3

    .prologue
    .line 1408
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbackSync:Ljava/lang/Object;

    monitor-enter v1

    .line 1409
    :try_start_3
    iget v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I

    .line 1410
    monitor-exit v1

    .line 1411
    return-void

    .line 1410
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method private startWatchdog()V
    .registers 8

    .prologue
    const-wide/16 v2, 0x1

    .line 1264
    iget v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogTimeout:I

    if-nez v0, :cond_7

    .line 1275
    :goto_6
    return-void

    .line 1267
    :cond_7
    const/4 v0, 0x0

    iput v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdogCount:I

    .line 1268
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 1269
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v1, Leu/chainfire/libsuperuser/Shell$Interactive$2;

    invoke-direct {v1, p0}, Leu/chainfire/libsuperuser/Shell$Interactive$2;-><init>(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide v4, v2

    invoke-virtual/range {v0 .. v6}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    goto :goto_6
.end method

.method private stopWatchdog()V
    .registers 2

    .prologue
    .line 1281
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    if-eqz v0, :cond_c

    .line 1282
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    .line 1283
    const/4 v0, 0x0

    iput-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->watchdog:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 1285
    :cond_c
    return-void
.end method


# virtual methods
.method public addCommand(Ljava/lang/String;)V
    .registers 4
    .param p1, "command"    # Ljava/lang/String;

    .prologue
    .line 1072
    const/4 v1, 0x0

    const/4 v0, 0x0

    check-cast v0, Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    invoke-virtual {p0, p1, v1, v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand(Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    .line 1073
    return-void
.end method

.method public addCommand(Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V
    .registers 6
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "code"    # I
    .param p3, "onCommandLineListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    .prologue
    .line 1111
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0, p2, p3}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V

    .line 1114
    return-void
.end method

.method public addCommand(Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V
    .registers 6
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "code"    # I
    .param p3, "onCommandResultListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    .prologue
    .line 1090
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0, p2, p3}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    .line 1093
    return-void
.end method

.method public addCommand(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1122
    .local p1, "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    const/4 v0, 0x0

    check-cast v0, Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    invoke-virtual {p0, p1, v1, v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand(Ljava/util/List;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    .line 1123
    return-void
.end method

.method public addCommand(Ljava/util/List;ILeu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V
    .registers 5
    .param p2, "code"    # I
    .param p3, "onCommandLineListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;I",
            "Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1162
    .local p1, "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-virtual {p0, v0, p2, p3}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V

    .line 1163
    return-void
.end method

.method public addCommand(Ljava/util/List;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V
    .registers 5
    .param p2, "code"    # I
    .param p3, "onCommandResultListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;I",
            "Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1142
    .local p1, "commands":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-virtual {p0, v0, p2, p3}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    .line 1143
    return-void
.end method

.method public addCommand([Ljava/lang/String;)V
    .registers 4
    .param p1, "commands"    # [Ljava/lang/String;

    .prologue
    .line 1171
    const/4 v1, 0x0

    const/4 v0, 0x0

    check-cast v0, Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    invoke-virtual {p0, p1, v1, v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V

    .line 1172
    return-void
.end method

.method public declared-synchronized addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V
    .registers 7
    .param p1, "commands"    # [Ljava/lang/String;
    .param p2, "code"    # I
    .param p3, "onCommandLineListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    .prologue
    .line 1212
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    new-instance v1, Leu/chainfire/libsuperuser/Shell$Command;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2, p3}, Leu/chainfire/libsuperuser/Shell$Command;-><init>([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1213
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->runNextCommand()V
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_11

    .line 1214
    monitor-exit p0

    return-void

    .line 1212
    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addCommand([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;)V
    .registers 7
    .param p1, "commands"    # [Ljava/lang/String;
    .param p2, "code"    # I
    .param p3, "onCommandResultListener"    # Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    .prologue
    .line 1191
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->commands:Ljava/util/List;

    new-instance v1, Leu/chainfire/libsuperuser/Shell$Command;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, p3, v2}, Leu/chainfire/libsuperuser/Shell$Command;-><init>([Ljava/lang/String;ILeu/chainfire/libsuperuser/Shell$OnCommandResultListener;Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1192
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->runNextCommand()V
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_11

    .line 1193
    monitor-exit p0

    return-void

    .line 1191
    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public close()V
    .registers 8

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1585
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->isIdle()Z

    move-result v0

    .line 1587
    .local v0, "_idle":Z
    monitor-enter p0

    .line 1588
    :try_start_7
    iget-boolean v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->running:Z

    if-nez v2, :cond_d

    .line 1589
    monitor-exit p0

    .line 1643
    :goto_c
    return-void

    .line 1590
    :cond_d
    const/4 v2, 0x0

    iput-boolean v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->running:Z

    .line 1591
    const/4 v2, 0x1

    iput-boolean v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->closed:Z

    .line 1592
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_7 .. :try_end_14} :catchall_2f

    .line 1597
    if-nez v0, :cond_32

    invoke-static {}, Leu/chainfire/libsuperuser/Debug;->getSanityChecksEnabledEffective()Z

    move-result v2

    if-eqz v2, :cond_32

    invoke-static {}, Leu/chainfire/libsuperuser/Debug;->onMainThread()Z

    move-result v2

    if-eqz v2, :cond_32

    .line 1598
    const-string v2, "Application attempted to wait for a non-idle shell to close on the main thread"

    invoke-static {v2}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V

    .line 1599
    new-instance v2, Leu/chainfire/libsuperuser/ShellOnMainThreadException;

    const-string v3, "Application attempted to wait for a non-idle shell to close on the main thread"

    invoke-direct {v2, v3}, Leu/chainfire/libsuperuser/ShellOnMainThreadException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1592
    :catchall_2f
    move-exception v2

    :try_start_30
    monitor-exit p0
    :try_end_31
    .catchall {:try_start_30 .. :try_end_31} :catchall_2f

    throw v2

    .line 1602
    :cond_32
    if-nez v0, :cond_37

    .line 1603
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->waitForIdle()Z

    .line 1607
    :cond_37
    :try_start_37
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    const-string v3, "exit\n"

    const-string v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->write([B)V

    .line 1608
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/io/DataOutputStream;->flush()V
    :try_end_49
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_49} :catch_7b
    .catch Ljava/lang/InterruptedException; {:try_start_37 .. :try_end_49} :catch_8b

    .line 1620
    :cond_49
    :try_start_49
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    invoke-virtual {v2}, Ljava/lang/Process;->waitFor()I
    :try_end_4e
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_4e} :catch_89
    .catch Ljava/lang/InterruptedException; {:try_start_49 .. :try_end_4e} :catch_8b

    .line 1628
    :try_start_4e
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V
    :try_end_53
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_53} :catch_8d
    .catch Ljava/lang/InterruptedException; {:try_start_4e .. :try_end_53} :catch_8b

    .line 1632
    :goto_53
    :try_start_53
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDOUT:Leu/chainfire/libsuperuser/StreamGobbler;

    invoke-virtual {v2}, Leu/chainfire/libsuperuser/StreamGobbler;->join()V

    .line 1633
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDERR:Leu/chainfire/libsuperuser/StreamGobbler;

    invoke-virtual {v2}, Leu/chainfire/libsuperuser/StreamGobbler;->join()V

    .line 1634
    invoke-direct {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->stopWatchdog()V

    .line 1635
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    invoke-virtual {v2}, Ljava/lang/Process;->destroy()V
    :try_end_65
    .catch Ljava/io/IOException; {:try_start_53 .. :try_end_65} :catch_89
    .catch Ljava/lang/InterruptedException; {:try_start_53 .. :try_end_65} :catch_8b

    .line 1642
    :goto_65
    const-string v2, "[%s%%] END"

    new-array v3, v5, [Ljava/lang/Object;

    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->shell:Ljava/lang/String;

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V

    goto :goto_c

    .line 1609
    :catch_7b
    move-exception v1

    .line 1610
    .local v1, "e":Ljava/io/IOException;
    :try_start_7c
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    const-string v3, "EPIPE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_49

    .line 1614
    throw v1
    :try_end_89
    .catch Ljava/io/IOException; {:try_start_7c .. :try_end_89} :catch_89
    .catch Ljava/lang/InterruptedException; {:try_start_7c .. :try_end_89} :catch_8b

    .line 1636
    .end local v1    # "e":Ljava/io/IOException;
    :catch_89
    move-exception v2

    goto :goto_65

    .line 1638
    :catch_8b
    move-exception v2

    goto :goto_65

    .line 1629
    :catch_8d
    move-exception v2

    goto :goto_53
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 1058
    iget-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->closed:Z

    if-nez v0, :cond_15

    invoke-static {}, Leu/chainfire/libsuperuser/Debug;->getSanityChecksEnabledEffective()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 1060
    const-string v0, "Application did not close() interactive shell"

    invoke-static {v0}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V

    .line 1061
    new-instance v0, Leu/chainfire/libsuperuser/ShellNotClosedException;

    invoke-direct {v0}, Leu/chainfire/libsuperuser/ShellNotClosedException;-><init>()V

    throw v0

    .line 1063
    :cond_15
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 1064
    return-void
.end method

.method public hasHandler()Z
    .registers 2

    .prologue
    .line 1779
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public declared-synchronized isIdle()Z
    .registers 3

    .prologue
    .line 1690
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->isRunning()Z

    move-result v0

    if-nez v0, :cond_13

    .line 1691
    const/4 v0, 0x1

    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z

    .line 1692
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    monitor-enter v1
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_1a

    .line 1693
    :try_start_d
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1694
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_d .. :try_end_13} :catchall_17

    .line 1696
    :cond_13
    :try_start_13
    iget-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z
    :try_end_15
    .catchall {:try_start_13 .. :try_end_15} :catchall_1a

    monitor-exit p0

    return v0

    .line 1694
    :catchall_17
    move-exception v0

    :try_start_18
    monitor-exit v1
    :try_end_19
    .catchall {:try_start_18 .. :try_end_19} :catchall_17

    :try_start_19
    throw v0
    :try_end_1a
    .catchall {:try_start_19 .. :try_end_1a} :catchall_1a

    .line 1690
    :catchall_1a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isRunning()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 1672
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    if-nez v1, :cond_6

    .line 1681
    :goto_5
    return v0

    .line 1676
    :cond_6
    :try_start_6
    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    invoke-virtual {v1}, Ljava/lang/Process;->exitValue()I
    :try_end_b
    .catch Ljava/lang/IllegalThreadStateException; {:try_start_6 .. :try_end_b} :catch_c

    goto :goto_5

    .line 1678
    :catch_c
    move-exception v0

    .line 1681
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public declared-synchronized kill()V
    .registers 2

    .prologue
    .line 1651
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->running:Z

    .line 1652
    const/4 v0, 0x1

    iput-boolean v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->closed:Z
    :try_end_7
    .catchall {:try_start_2 .. :try_end_7} :catchall_13

    .line 1655
    :try_start_7
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->STDIN:Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_18
    .catchall {:try_start_7 .. :try_end_c} :catchall_13

    .line 1660
    :goto_c
    :try_start_c
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->process:Ljava/lang/Process;

    invoke-virtual {v0}, Ljava/lang/Process;->destroy()V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_11} :catch_16
    .catchall {:try_start_c .. :try_end_11} :catchall_13

    .line 1664
    :goto_11
    monitor-exit p0

    return-void

    .line 1651
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1661
    :catch_16
    move-exception v0

    goto :goto_11

    .line 1656
    :catch_18
    move-exception v0

    goto :goto_c
.end method

.method public waitForIdle()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 1732
    invoke-static {}, Leu/chainfire/libsuperuser/Debug;->getSanityChecksEnabledEffective()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-static {}, Leu/chainfire/libsuperuser/Debug;->onMainThread()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 1733
    const-string v1, "Application attempted to wait for a shell to become idle on the main thread"

    invoke-static {v1}, Leu/chainfire/libsuperuser/Debug;->log(Ljava/lang/String;)V

    .line 1734
    new-instance v1, Leu/chainfire/libsuperuser/ShellOnMainThreadException;

    const-string v2, "Application attempted to wait for a shell to become idle on the main thread"

    invoke-direct {v1, v2}, Leu/chainfire/libsuperuser/ShellOnMainThreadException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1737
    :cond_1a
    invoke-virtual {p0}, Leu/chainfire/libsuperuser/Shell$Interactive;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_60

    .line 1738
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    monitor-enter v2

    .line 1739
    :goto_23
    :try_start_23
    iget-boolean v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idle:Z
    :try_end_25
    .catchall {:try_start_23 .. :try_end_25} :catchall_5c

    if-nez v3, :cond_30

    .line 1741
    :try_start_27
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->idleSync:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V
    :try_end_2c
    .catch Ljava/lang/InterruptedException; {:try_start_27 .. :try_end_2c} :catch_2d
    .catchall {:try_start_27 .. :try_end_2c} :catchall_5c

    goto :goto_23

    .line 1742
    :catch_2d
    move-exception v0

    .line 1743
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2e
    monitor-exit v2

    .line 1770
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :goto_2f
    return v1

    .line 1746
    :cond_30
    monitor-exit v2
    :try_end_31
    .catchall {:try_start_2e .. :try_end_31} :catchall_5c

    .line 1748
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    if-eqz v2, :cond_60

    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    .line 1749
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    if-eqz v2, :cond_60

    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->handler:Landroid/os/Handler;

    .line 1750
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v3

    if-eq v2, v3, :cond_60

    .line 1758
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbackSync:Ljava/lang/Object;

    monitor-enter v2

    .line 1759
    :goto_4c
    :try_start_4c
    iget v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbacks:I
    :try_end_4e
    .catchall {:try_start_4c .. :try_end_4e} :catchall_59

    if-lez v3, :cond_5f

    .line 1761
    :try_start_50
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive;->callbackSync:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V
    :try_end_55
    .catch Ljava/lang/InterruptedException; {:try_start_50 .. :try_end_55} :catch_56
    .catchall {:try_start_50 .. :try_end_55} :catchall_59

    goto :goto_4c

    .line 1762
    :catch_56
    move-exception v0

    .line 1763
    .restart local v0    # "e":Ljava/lang/InterruptedException;
    :try_start_57
    monitor-exit v2

    goto :goto_2f

    .line 1766
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_59
    move-exception v1

    monitor-exit v2
    :try_end_5b
    .catchall {:try_start_57 .. :try_end_5b} :catchall_59

    throw v1

    .line 1746
    :catchall_5c
    move-exception v1

    :try_start_5d
    monitor-exit v2
    :try_end_5e
    .catchall {:try_start_5d .. :try_end_5e} :catchall_5c

    throw v1

    .line 1766
    :cond_5f
    :try_start_5f
    monitor-exit v2
    :try_end_60
    .catchall {:try_start_5f .. :try_end_60} :catchall_59

    .line 1770
    :cond_60
    const/4 v1, 0x1

    goto :goto_2f
.end method
