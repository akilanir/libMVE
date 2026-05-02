.class public Lorg/greenrobot/eventbus/EventBusBuilder;
.super Ljava/lang/Object;
.source "EventBusBuilder.java"


# static fields
.field private static final DEFAULT_EXECUTOR_SERVICE:Ljava/util/concurrent/ExecutorService;


# instance fields
.field eventInheritance:Z

.field executorService:Ljava/util/concurrent/ExecutorService;

.field ignoreGeneratedIndex:Z

.field logNoSubscriberMessages:Z

.field logSubscriberExceptions:Z

.field sendNoSubscriberEvent:Z

.field sendSubscriberExceptionEvent:Z

.field skipMethodVerificationForClasses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field strictMethodVerification:Z

.field subscriberInfoIndexes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/greenrobot/eventbus/meta/SubscriberInfoIndex;",
            ">;"
        }
    .end annotation
.end field

.field throwSubscriberException:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 30
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lorg/greenrobot/eventbus/EventBusBuilder;->DEFAULT_EXECUTOR_SERVICE:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-boolean v0, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->logSubscriberExceptions:Z

    .line 33
    iput-boolean v0, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->logNoSubscriberMessages:Z

    .line 34
    iput-boolean v0, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->sendSubscriberExceptionEvent:Z

    .line 35
    iput-boolean v0, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->sendNoSubscriberEvent:Z

    .line 37
    iput-boolean v0, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->eventInheritance:Z

    .line 40
    sget-object v0, Lorg/greenrobot/eventbus/EventBusBuilder;->DEFAULT_EXECUTOR_SERVICE:Ljava/util/concurrent/ExecutorService;

    iput-object v0, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 45
    return-void
.end method


# virtual methods
.method public addIndex(Lorg/greenrobot/eventbus/meta/SubscriberInfoIndex;)Lorg/greenrobot/eventbus/EventBusBuilder;
    .registers 3
    .param p1, "index"    # Lorg/greenrobot/eventbus/meta/SubscriberInfoIndex;

    .prologue
    .line 133
    iget-object v0, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->subscriberInfoIndexes:Ljava/util/List;

    if-nez v0, :cond_b

    .line 134
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->subscriberInfoIndexes:Ljava/util/List;

    .line 136
    :cond_b
    iget-object v0, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->subscriberInfoIndexes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    return-object p0
.end method

.method public build()Lorg/greenrobot/eventbus/EventBus;
    .registers 2

    .prologue
    .line 159
    new-instance v0, Lorg/greenrobot/eventbus/EventBus;

    invoke-direct {v0, p0}, Lorg/greenrobot/eventbus/EventBus;-><init>(Lorg/greenrobot/eventbus/EventBusBuilder;)V

    return-object v0
.end method

.method public eventInheritance(Z)Lorg/greenrobot/eventbus/EventBusBuilder;
    .registers 2
    .param p1, "eventInheritance"    # Z

    .prologue
    .line 92
    iput-boolean p1, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->eventInheritance:Z

    .line 93
    return-object p0
.end method

.method public executorService(Ljava/util/concurrent/ExecutorService;)Lorg/greenrobot/eventbus/EventBusBuilder;
    .registers 2
    .param p1, "executorService"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 102
    iput-object p1, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 103
    return-object p0
.end method

.method public ignoreGeneratedIndex(Z)Lorg/greenrobot/eventbus/EventBusBuilder;
    .registers 2
    .param p1, "ignoreGeneratedIndex"    # Z

    .prologue
    .line 121
    iput-boolean p1, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->ignoreGeneratedIndex:Z

    .line 122
    return-object p0
.end method

.method public installDefaultEventBus()Lorg/greenrobot/eventbus/EventBus;
    .registers 4

    .prologue
    .line 147
    const-class v1, Lorg/greenrobot/eventbus/EventBus;

    monitor-enter v1

    .line 148
    :try_start_3
    sget-object v0, Lorg/greenrobot/eventbus/EventBus;->defaultInstance:Lorg/greenrobot/eventbus/EventBus;

    if-eqz v0, :cond_12

    .line 149
    new-instance v0, Lorg/greenrobot/eventbus/EventBusException;

    const-string v2, "Default instance already exists. It may be only set once before it\'s used the first time to ensure consistent behavior."

    invoke-direct {v0, v2}, Lorg/greenrobot/eventbus/EventBusException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 154
    :catchall_f
    move-exception v0

    monitor-exit v1
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_f

    throw v0

    .line 152
    :cond_12
    :try_start_12
    invoke-virtual {p0}, Lorg/greenrobot/eventbus/EventBusBuilder;->build()Lorg/greenrobot/eventbus/EventBus;

    move-result-object v0

    sput-object v0, Lorg/greenrobot/eventbus/EventBus;->defaultInstance:Lorg/greenrobot/eventbus/EventBus;

    .line 153
    sget-object v0, Lorg/greenrobot/eventbus/EventBus;->defaultInstance:Lorg/greenrobot/eventbus/EventBus;

    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_12 .. :try_end_1b} :catchall_f

    return-object v0
.end method

.method public logNoSubscriberMessages(Z)Lorg/greenrobot/eventbus/EventBusBuilder;
    .registers 2
    .param p1, "logNoSubscriberMessages"    # Z

    .prologue
    .line 55
    iput-boolean p1, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->logNoSubscriberMessages:Z

    .line 56
    return-object p0
.end method

.method public logSubscriberExceptions(Z)Lorg/greenrobot/eventbus/EventBusBuilder;
    .registers 2
    .param p1, "logSubscriberExceptions"    # Z

    .prologue
    .line 49
    iput-boolean p1, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->logSubscriberExceptions:Z

    .line 50
    return-object p0
.end method

.method public sendNoSubscriberEvent(Z)Lorg/greenrobot/eventbus/EventBusBuilder;
    .registers 2
    .param p1, "sendNoSubscriberEvent"    # Z

    .prologue
    .line 67
    iput-boolean p1, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->sendNoSubscriberEvent:Z

    .line 68
    return-object p0
.end method

.method public sendSubscriberExceptionEvent(Z)Lorg/greenrobot/eventbus/EventBusBuilder;
    .registers 2
    .param p1, "sendSubscriberExceptionEvent"    # Z

    .prologue
    .line 61
    iput-boolean p1, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->sendSubscriberExceptionEvent:Z

    .line 62
    return-object p0
.end method

.method public skipMethodVerificationFor(Ljava/lang/Class;)Lorg/greenrobot/eventbus/EventBusBuilder;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/greenrobot/eventbus/EventBusBuilder;"
        }
    .end annotation

    .prologue
    .line 112
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->skipMethodVerificationForClasses:Ljava/util/List;

    if-nez v0, :cond_b

    .line 113
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->skipMethodVerificationForClasses:Ljava/util/List;

    .line 115
    :cond_b
    iget-object v0, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->skipMethodVerificationForClasses:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    return-object p0
.end method

.method public strictMethodVerification(Z)Lorg/greenrobot/eventbus/EventBusBuilder;
    .registers 2
    .param p1, "strictMethodVerification"    # Z

    .prologue
    .line 127
    iput-boolean p1, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->strictMethodVerification:Z

    .line 128
    return-object p0
.end method

.method public throwSubscriberException(Z)Lorg/greenrobot/eventbus/EventBusBuilder;
    .registers 2
    .param p1, "throwSubscriberException"    # Z

    .prologue
    .line 78
    iput-boolean p1, p0, Lorg/greenrobot/eventbus/EventBusBuilder;->throwSubscriberException:Z

    .line 79
    return-object p0
.end method
