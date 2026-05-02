.class public Lde/greenrobot/event/util/AsyncExecutor;
.super Ljava/lang/Object;
.source "AsyncExecutor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/greenrobot/event/util/AsyncExecutor$RunnableEx;,
        Lde/greenrobot/event/util/AsyncExecutor$Builder;
    }
.end annotation


# instance fields
.field private final eventBus:Lde/greenrobot/event/EventBus;

.field private final failureEventConstructor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation
.end field

.field private final scope:Ljava/lang/Object;

.field private final threadPool:Ljava/util/concurrent/Executor;


# direct methods
.method private constructor <init>(Ljava/util/concurrent/Executor;Lde/greenrobot/event/EventBus;Ljava/lang/Class;Ljava/lang/Object;)V
    .registers 9
    .param p1, "threadPool"    # Ljava/util/concurrent/Executor;
    .param p2, "eventBus"    # Lde/greenrobot/event/EventBus;
    .param p4, "scope"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Lde/greenrobot/event/EventBus;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 97
    .local p3, "failureEventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput-object p1, p0, Lde/greenrobot/event/util/AsyncExecutor;->threadPool:Ljava/util/concurrent/Executor;

    .line 99
    iput-object p2, p0, Lde/greenrobot/event/util/AsyncExecutor;->eventBus:Lde/greenrobot/event/EventBus;

    .line 100
    iput-object p4, p0, Lde/greenrobot/event/util/AsyncExecutor;->scope:Ljava/lang/Object;

    .line 102
    const/4 v1, 0x1

    :try_start_a
    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Ljava/lang/Throwable;

    aput-object v3, v1, v2

    invoke-virtual {p3, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    iput-object v1, p0, Lde/greenrobot/event/util/AsyncExecutor;->failureEventConstructor:Ljava/lang/reflect/Constructor;
    :try_end_17
    .catch Ljava/lang/NoSuchMethodException; {:try_start_a .. :try_end_17} :catch_18

    .line 107
    return-void

    .line 103
    :catch_18
    move-exception v0

    .line 104
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Failure event class must have a constructor with one parameter of type Throwable"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method synthetic constructor <init>(Ljava/util/concurrent/Executor;Lde/greenrobot/event/EventBus;Ljava/lang/Class;Ljava/lang/Object;Lde/greenrobot/event/util/AsyncExecutor$1;)V
    .registers 6
    .param p1, "x0"    # Ljava/util/concurrent/Executor;
    .param p2, "x1"    # Lde/greenrobot/event/EventBus;
    .param p3, "x2"    # Ljava/lang/Class;
    .param p4, "x3"    # Ljava/lang/Object;
    .param p5, "x4"    # Lde/greenrobot/event/util/AsyncExecutor$1;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3, p4}, Lde/greenrobot/event/util/AsyncExecutor;-><init>(Ljava/util/concurrent/Executor;Lde/greenrobot/event/EventBus;Ljava/lang/Class;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$200(Lde/greenrobot/event/util/AsyncExecutor;)Ljava/lang/reflect/Constructor;
    .registers 2
    .param p0, "x0"    # Lde/greenrobot/event/util/AsyncExecutor;

    .prologue
    .line 32
    iget-object v0, p0, Lde/greenrobot/event/util/AsyncExecutor;->failureEventConstructor:Ljava/lang/reflect/Constructor;

    return-object v0
.end method

.method static synthetic access$300(Lde/greenrobot/event/util/AsyncExecutor;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lde/greenrobot/event/util/AsyncExecutor;

    .prologue
    .line 32
    iget-object v0, p0, Lde/greenrobot/event/util/AsyncExecutor;->scope:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$400(Lde/greenrobot/event/util/AsyncExecutor;)Lde/greenrobot/event/EventBus;
    .registers 2
    .param p0, "x0"    # Lde/greenrobot/event/util/AsyncExecutor;

    .prologue
    .line 32
    iget-object v0, p0, Lde/greenrobot/event/util/AsyncExecutor;->eventBus:Lde/greenrobot/event/EventBus;

    return-object v0
.end method

.method public static builder()Lde/greenrobot/event/util/AsyncExecutor$Builder;
    .registers 2

    .prologue
    .line 85
    new-instance v0, Lde/greenrobot/event/util/AsyncExecutor$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lde/greenrobot/event/util/AsyncExecutor$Builder;-><init>(Lde/greenrobot/event/util/AsyncExecutor$1;)V

    return-object v0
.end method

.method public static create()Lde/greenrobot/event/util/AsyncExecutor;
    .registers 2

    .prologue
    .line 89
    new-instance v0, Lde/greenrobot/event/util/AsyncExecutor$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lde/greenrobot/event/util/AsyncExecutor$Builder;-><init>(Lde/greenrobot/event/util/AsyncExecutor$1;)V

    invoke-virtual {v0}, Lde/greenrobot/event/util/AsyncExecutor$Builder;->build()Lde/greenrobot/event/util/AsyncExecutor;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public execute(Lde/greenrobot/event/util/AsyncExecutor$RunnableEx;)V
    .registers 4
    .param p1, "runnable"    # Lde/greenrobot/event/util/AsyncExecutor$RunnableEx;

    .prologue
    .line 111
    iget-object v0, p0, Lde/greenrobot/event/util/AsyncExecutor;->threadPool:Ljava/util/concurrent/Executor;

    new-instance v1, Lde/greenrobot/event/util/AsyncExecutor$1;

    invoke-direct {v1, p0, p1}, Lde/greenrobot/event/util/AsyncExecutor$1;-><init>(Lde/greenrobot/event/util/AsyncExecutor;Lde/greenrobot/event/util/AsyncExecutor$RunnableEx;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 131
    return-void
.end method
