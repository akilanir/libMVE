.class public Lorg/junit/internal/runners/ClassRoadie;
.super Ljava/lang/Object;
.source "ClassRoadie.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private description:Lorg/junit/runner/Description;

.field private notifier:Lorg/junit/runner/notification/RunNotifier;

.field private final runnable:Ljava/lang/Runnable;

.field private testClass:Lorg/junit/internal/runners/TestClass;


# direct methods
.method public constructor <init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/internal/runners/TestClass;Lorg/junit/runner/Description;Ljava/lang/Runnable;)V
    .registers 5
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;
    .param p2, "testClass"    # Lorg/junit/internal/runners/TestClass;
    .param p3, "description"    # Lorg/junit/runner/Description;
    .param p4, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lorg/junit/internal/runners/ClassRoadie;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 28
    iput-object p2, p0, Lorg/junit/internal/runners/ClassRoadie;->testClass:Lorg/junit/internal/runners/TestClass;

    .line 29
    iput-object p3, p0, Lorg/junit/internal/runners/ClassRoadie;->description:Lorg/junit/runner/Description;

    .line 30
    iput-object p4, p0, Lorg/junit/internal/runners/ClassRoadie;->runnable:Ljava/lang/Runnable;

    .line 31
    return-void
.end method

.method private runAfters()V
    .registers 7

    .prologue
    .line 70
    iget-object v4, p0, Lorg/junit/internal/runners/ClassRoadie;->testClass:Lorg/junit/internal/runners/TestClass;

    invoke-virtual {v4}, Lorg/junit/internal/runners/TestClass;->getAfters()Ljava/util/List;

    move-result-object v1

    .line 71
    .local v1, "afters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    .line 73
    .local v0, "after":Ljava/lang/reflect/Method;
    const/4 v4, 0x0

    const/4 v5, 0x0

    :try_start_18
    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v0, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1d
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_18 .. :try_end_1d} :catch_1e
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_1d} :catch_27

    goto :goto_a

    .line 74
    :catch_1e
    move-exception v2

    .line 75
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/junit/internal/runners/ClassRoadie;->addFailure(Ljava/lang/Throwable;)V

    goto :goto_a

    .line 76
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_27
    move-exception v2

    .line 77
    .local v2, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v2}, Lorg/junit/internal/runners/ClassRoadie;->addFailure(Ljava/lang/Throwable;)V

    goto :goto_a

    .line 80
    .end local v0    # "after":Ljava/lang/reflect/Method;
    .end local v2    # "e":Ljava/lang/Throwable;
    :cond_2c
    return-void
.end method

.method private runBefores()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/internal/runners/FailedBefore;
        }
    .end annotation

    .prologue
    .line 54
    :try_start_0
    iget-object v4, p0, Lorg/junit/internal/runners/ClassRoadie;->testClass:Lorg/junit/internal/runners/TestClass;

    invoke-virtual {v4}, Lorg/junit/internal/runners/TestClass;->getBefores()Ljava/util/List;

    move-result-object v1

    .line 55
    .local v1, "befores":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_35

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    .line 56
    .local v0, "before":Ljava/lang/reflect/Method;
    const/4 v4, 0x0

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v0, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1d
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_1d} :catch_1e
    .catch Lorg/junit/internal/AssumptionViolatedException; {:try_start_0 .. :try_end_1d} :catch_24
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_1d} :catch_2b

    goto :goto_a

    .line 58
    .end local v0    # "before":Ljava/lang/reflect/Method;
    .end local v1    # "befores":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_1e
    move-exception v2

    .line 59
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    :try_start_1f
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v4

    throw v4
    :try_end_24
    .catch Lorg/junit/internal/AssumptionViolatedException; {:try_start_1f .. :try_end_24} :catch_24
    .catch Ljava/lang/Throwable; {:try_start_1f .. :try_end_24} :catch_2b

    .line 61
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_24
    move-exception v2

    .line 62
    .local v2, "e":Lorg/junit/internal/AssumptionViolatedException;
    new-instance v4, Lorg/junit/internal/runners/FailedBefore;

    invoke-direct {v4}, Lorg/junit/internal/runners/FailedBefore;-><init>()V

    throw v4

    .line 63
    .end local v2    # "e":Lorg/junit/internal/AssumptionViolatedException;
    :catch_2b
    move-exception v2

    .line 64
    .local v2, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v2}, Lorg/junit/internal/runners/ClassRoadie;->addFailure(Ljava/lang/Throwable;)V

    .line 65
    new-instance v4, Lorg/junit/internal/runners/FailedBefore;

    invoke-direct {v4}, Lorg/junit/internal/runners/FailedBefore;-><init>()V

    throw v4

    .line 67
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v1    # "befores":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_35
    return-void
.end method


# virtual methods
.method protected addFailure(Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "targetException"    # Ljava/lang/Throwable;

    .prologue
    .line 38
    iget-object v0, p0, Lorg/junit/internal/runners/ClassRoadie;->notifier:Lorg/junit/runner/notification/RunNotifier;

    new-instance v1, Lorg/junit/runner/notification/Failure;

    iget-object v2, p0, Lorg/junit/internal/runners/ClassRoadie;->description:Lorg/junit/runner/Description;

    invoke-direct {v1, v2, p1}, Lorg/junit/runner/notification/Failure;-><init>(Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Lorg/junit/runner/notification/RunNotifier;->fireTestFailure(Lorg/junit/runner/notification/Failure;)V

    .line 39
    return-void
.end method

.method public runProtected()V
    .registers 2

    .prologue
    .line 43
    :try_start_0
    invoke-direct {p0}, Lorg/junit/internal/runners/ClassRoadie;->runBefores()V

    .line 44
    invoke-virtual {p0}, Lorg/junit/internal/runners/ClassRoadie;->runUnprotected()V
    :try_end_6
    .catch Lorg/junit/internal/runners/FailedBefore; {:try_start_0 .. :try_end_6} :catch_a
    .catchall {:try_start_0 .. :try_end_6} :catchall_f

    .line 47
    invoke-direct {p0}, Lorg/junit/internal/runners/ClassRoadie;->runAfters()V

    .line 49
    :goto_9
    return-void

    .line 45
    :catch_a
    move-exception v0

    .line 47
    invoke-direct {p0}, Lorg/junit/internal/runners/ClassRoadie;->runAfters()V

    goto :goto_9

    :catchall_f
    move-exception v0

    invoke-direct {p0}, Lorg/junit/internal/runners/ClassRoadie;->runAfters()V

    throw v0
.end method

.method protected runUnprotected()V
    .registers 2

    .prologue
    .line 34
    iget-object v0, p0, Lorg/junit/internal/runners/ClassRoadie;->runnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 35
    return-void
.end method
