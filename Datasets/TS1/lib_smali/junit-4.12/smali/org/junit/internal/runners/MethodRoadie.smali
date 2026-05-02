.class public Lorg/junit/internal/runners/MethodRoadie;
.super Ljava/lang/Object;
.source "MethodRoadie.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final description:Lorg/junit/runner/Description;

.field private final notifier:Lorg/junit/runner/notification/RunNotifier;

.field private final test:Ljava/lang/Object;

.field private testMethod:Lorg/junit/internal/runners/TestMethod;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lorg/junit/internal/runners/TestMethod;Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;)V
    .registers 5
    .param p1, "test"    # Ljava/lang/Object;
    .param p2, "method"    # Lorg/junit/internal/runners/TestMethod;
    .param p3, "notifier"    # Lorg/junit/runner/notification/RunNotifier;
    .param p4, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/junit/internal/runners/MethodRoadie;->test:Ljava/lang/Object;

    .line 34
    iput-object p3, p0, Lorg/junit/internal/runners/MethodRoadie;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 35
    iput-object p4, p0, Lorg/junit/internal/runners/MethodRoadie;->description:Lorg/junit/runner/Description;

    .line 36
    iput-object p2, p0, Lorg/junit/internal/runners/MethodRoadie;->testMethod:Lorg/junit/internal/runners/TestMethod;

    .line 37
    return-void
.end method

.method private runAfters()V
    .registers 7

    .prologue
    .line 147
    iget-object v4, p0, Lorg/junit/internal/runners/MethodRoadie;->testMethod:Lorg/junit/internal/runners/TestMethod;

    invoke-virtual {v4}, Lorg/junit/internal/runners/TestMethod;->getAfters()Ljava/util/List;

    move-result-object v1

    .line 148
    .local v1, "afters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    .line 150
    .local v0, "after":Ljava/lang/reflect/Method;
    :try_start_16
    iget-object v4, p0, Lorg/junit/internal/runners/MethodRoadie;->test:Ljava/lang/Object;

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v0, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_16 .. :try_end_1e} :catch_1f
    .catch Ljava/lang/Throwable; {:try_start_16 .. :try_end_1e} :catch_28

    goto :goto_a

    .line 151
    :catch_1f
    move-exception v2

    .line 152
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/junit/internal/runners/MethodRoadie;->addFailure(Ljava/lang/Throwable;)V

    goto :goto_a

    .line 153
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_28
    move-exception v2

    .line 154
    .local v2, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v2}, Lorg/junit/internal/runners/MethodRoadie;->addFailure(Ljava/lang/Throwable;)V

    goto :goto_a

    .line 157
    .end local v0    # "after":Ljava/lang/reflect/Method;
    .end local v2    # "e":Ljava/lang/Throwable;
    :cond_2d
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
    .line 131
    :try_start_0
    iget-object v4, p0, Lorg/junit/internal/runners/MethodRoadie;->testMethod:Lorg/junit/internal/runners/TestMethod;

    invoke-virtual {v4}, Lorg/junit/internal/runners/TestMethod;->getBefores()Ljava/util/List;

    move-result-object v1

    .line 132
    .local v1, "befores":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_36

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    .line 133
    .local v0, "before":Ljava/lang/reflect/Method;
    iget-object v4, p0, Lorg/junit/internal/runners/MethodRoadie;->test:Ljava/lang/Object;

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v0, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_1e} :catch_1f
    .catch Lorg/junit/internal/AssumptionViolatedException; {:try_start_0 .. :try_end_1e} :catch_25
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_1e} :catch_2c

    goto :goto_a

    .line 135
    .end local v0    # "before":Ljava/lang/reflect/Method;
    .end local v1    # "befores":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_1f
    move-exception v2

    .line 136
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    :try_start_20
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v4

    throw v4
    :try_end_25
    .catch Lorg/junit/internal/AssumptionViolatedException; {:try_start_20 .. :try_end_25} :catch_25
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_25} :catch_2c

    .line 138
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_25
    move-exception v2

    .line 139
    .local v2, "e":Lorg/junit/internal/AssumptionViolatedException;
    new-instance v4, Lorg/junit/internal/runners/FailedBefore;

    invoke-direct {v4}, Lorg/junit/internal/runners/FailedBefore;-><init>()V

    throw v4

    .line 140
    .end local v2    # "e":Lorg/junit/internal/AssumptionViolatedException;
    :catch_2c
    move-exception v2

    .line 141
    .local v2, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v2}, Lorg/junit/internal/runners/MethodRoadie;->addFailure(Ljava/lang/Throwable;)V

    .line 142
    new-instance v4, Lorg/junit/internal/runners/FailedBefore;

    invoke-direct {v4}, Lorg/junit/internal/runners/FailedBefore;-><init>()V

    throw v4

    .line 144
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v1    # "befores":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_36
    return-void
.end method

.method private runWithTimeout(J)V
    .registers 4
    .param p1, "timeout"    # J

    .prologue
    .line 58
    new-instance v0, Lorg/junit/internal/runners/MethodRoadie$1;

    invoke-direct {v0, p0, p1, p2}, Lorg/junit/internal/runners/MethodRoadie$1;-><init>(Lorg/junit/internal/runners/MethodRoadie;J)V

    invoke-virtual {p0, v0}, Lorg/junit/internal/runners/MethodRoadie;->runBeforesThenTestThenAfters(Ljava/lang/Runnable;)V

    .line 84
    return-void
.end method


# virtual methods
.method protected addFailure(Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 160
    iget-object v0, p0, Lorg/junit/internal/runners/MethodRoadie;->notifier:Lorg/junit/runner/notification/RunNotifier;

    new-instance v1, Lorg/junit/runner/notification/Failure;

    iget-object v2, p0, Lorg/junit/internal/runners/MethodRoadie;->description:Lorg/junit/runner/Description;

    invoke-direct {v1, v2, p1}, Lorg/junit/runner/notification/Failure;-><init>(Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Lorg/junit/runner/notification/RunNotifier;->fireTestFailure(Lorg/junit/runner/notification/Failure;)V

    .line 161
    return-void
.end method

.method public run()V
    .registers 6

    .prologue
    .line 40
    iget-object v2, p0, Lorg/junit/internal/runners/MethodRoadie;->testMethod:Lorg/junit/internal/runners/TestMethod;

    invoke-virtual {v2}, Lorg/junit/internal/runners/TestMethod;->isIgnored()Z

    move-result v2

    if-eqz v2, :cond_10

    .line 41
    iget-object v2, p0, Lorg/junit/internal/runners/MethodRoadie;->notifier:Lorg/junit/runner/notification/RunNotifier;

    iget-object v3, p0, Lorg/junit/internal/runners/MethodRoadie;->description:Lorg/junit/runner/Description;

    invoke-virtual {v2, v3}, Lorg/junit/runner/notification/RunNotifier;->fireTestIgnored(Lorg/junit/runner/Description;)V

    .line 55
    :goto_f
    return-void

    .line 44
    :cond_10
    iget-object v2, p0, Lorg/junit/internal/runners/MethodRoadie;->notifier:Lorg/junit/runner/notification/RunNotifier;

    iget-object v3, p0, Lorg/junit/internal/runners/MethodRoadie;->description:Lorg/junit/runner/Description;

    invoke-virtual {v2, v3}, Lorg/junit/runner/notification/RunNotifier;->fireTestStarted(Lorg/junit/runner/Description;)V

    .line 46
    :try_start_17
    iget-object v2, p0, Lorg/junit/internal/runners/MethodRoadie;->testMethod:Lorg/junit/internal/runners/TestMethod;

    invoke-virtual {v2}, Lorg/junit/internal/runners/TestMethod;->getTimeout()J

    move-result-wide v0

    .line 47
    .local v0, "timeout":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_2e

    .line 48
    invoke-direct {p0, v0, v1}, Lorg/junit/internal/runners/MethodRoadie;->runWithTimeout(J)V
    :try_end_26
    .catchall {:try_start_17 .. :try_end_26} :catchall_32

    .line 53
    :goto_26
    iget-object v2, p0, Lorg/junit/internal/runners/MethodRoadie;->notifier:Lorg/junit/runner/notification/RunNotifier;

    iget-object v3, p0, Lorg/junit/internal/runners/MethodRoadie;->description:Lorg/junit/runner/Description;

    invoke-virtual {v2, v3}, Lorg/junit/runner/notification/RunNotifier;->fireTestFinished(Lorg/junit/runner/Description;)V

    goto :goto_f

    .line 50
    :cond_2e
    :try_start_2e
    invoke-virtual {p0}, Lorg/junit/internal/runners/MethodRoadie;->runTest()V
    :try_end_31
    .catchall {:try_start_2e .. :try_end_31} :catchall_32

    goto :goto_26

    .line 53
    .end local v0    # "timeout":J
    :catchall_32
    move-exception v2

    iget-object v3, p0, Lorg/junit/internal/runners/MethodRoadie;->notifier:Lorg/junit/runner/notification/RunNotifier;

    iget-object v4, p0, Lorg/junit/internal/runners/MethodRoadie;->description:Lorg/junit/runner/Description;

    invoke-virtual {v3, v4}, Lorg/junit/runner/notification/RunNotifier;->fireTestFinished(Lorg/junit/runner/Description;)V

    throw v2
.end method

.method public runBeforesThenTestThenAfters(Ljava/lang/Runnable;)V
    .registers 5
    .param p1, "test"    # Ljava/lang/Runnable;

    .prologue
    .line 96
    :try_start_0
    invoke-direct {p0}, Lorg/junit/internal/runners/MethodRoadie;->runBefores()V

    .line 97
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_6
    .catch Lorg/junit/internal/runners/FailedBefore; {:try_start_0 .. :try_end_6} :catch_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_6} :catch_f
    .catchall {:try_start_0 .. :try_end_6} :catchall_18

    .line 102
    invoke-direct {p0}, Lorg/junit/internal/runners/MethodRoadie;->runAfters()V

    .line 104
    :goto_9
    return-void

    .line 98
    :catch_a
    move-exception v1

    .line 102
    invoke-direct {p0}, Lorg/junit/internal/runners/MethodRoadie;->runAfters()V

    goto :goto_9

    .line 99
    :catch_f
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/Exception;
    :try_start_10
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "test should never throw an exception to this level"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_18
    .catchall {:try_start_10 .. :try_end_18} :catchall_18

    .line 102
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_18
    move-exception v1

    invoke-direct {p0}, Lorg/junit/internal/runners/MethodRoadie;->runAfters()V

    throw v1
.end method

.method public runTest()V
    .registers 2

    .prologue
    .line 87
    new-instance v0, Lorg/junit/internal/runners/MethodRoadie$2;

    invoke-direct {v0, p0}, Lorg/junit/internal/runners/MethodRoadie$2;-><init>(Lorg/junit/internal/runners/MethodRoadie;)V

    invoke-virtual {p0, v0}, Lorg/junit/internal/runners/MethodRoadie;->runBeforesThenTestThenAfters(Ljava/lang/Runnable;)V

    .line 92
    return-void
.end method

.method protected runTestMethod()V
    .registers 7

    .prologue
    .line 108
    :try_start_0
    iget-object v3, p0, Lorg/junit/internal/runners/MethodRoadie;->testMethod:Lorg/junit/internal/runners/TestMethod;

    iget-object v4, p0, Lorg/junit/internal/runners/MethodRoadie;->test:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Lorg/junit/internal/runners/TestMethod;->invoke(Ljava/lang/Object;)V

    .line 109
    iget-object v3, p0, Lorg/junit/internal/runners/MethodRoadie;->testMethod:Lorg/junit/internal/runners/TestMethod;

    invoke-virtual {v3}, Lorg/junit/internal/runners/TestMethod;->expectsException()Z

    move-result v3

    if-eqz v3, :cond_34

    .line 110
    new-instance v3, Ljava/lang/AssertionError;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected exception: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/junit/internal/runners/MethodRoadie;->testMethod:Lorg/junit/internal/runners/TestMethod;

    invoke-virtual {v5}, Lorg/junit/internal/runners/TestMethod;->getExpectedException()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v3}, Lorg/junit/internal/runners/MethodRoadie;->addFailure(Ljava/lang/Throwable;)V
    :try_end_34
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_34} :catch_35
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_34} :catch_90

    .line 126
    :cond_34
    :goto_34
    return-void

    .line 112
    :catch_35
    move-exception v1

    .line 113
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v0

    .line 114
    .local v0, "actual":Ljava/lang/Throwable;
    instance-of v3, v0, Lorg/junit/internal/AssumptionViolatedException;

    if-nez v3, :cond_34

    .line 116
    iget-object v3, p0, Lorg/junit/internal/runners/MethodRoadie;->testMethod:Lorg/junit/internal/runners/TestMethod;

    invoke-virtual {v3}, Lorg/junit/internal/runners/TestMethod;->expectsException()Z

    move-result v3

    if-nez v3, :cond_4a

    .line 117
    invoke-virtual {p0, v0}, Lorg/junit/internal/runners/MethodRoadie;->addFailure(Ljava/lang/Throwable;)V

    goto :goto_34

    .line 118
    :cond_4a
    iget-object v3, p0, Lorg/junit/internal/runners/MethodRoadie;->testMethod:Lorg/junit/internal/runners/TestMethod;

    invoke-virtual {v3, v0}, Lorg/junit/internal/runners/TestMethod;->isUnexpected(Ljava/lang/Throwable;)Z

    move-result v3

    if-eqz v3, :cond_34

    .line 119
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected exception, expected<"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/junit/internal/runners/MethodRoadie;->testMethod:Lorg/junit/internal/runners/TestMethod;

    invoke-virtual {v4}, Lorg/junit/internal/runners/TestMethod;->getExpectedException()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "> but was<"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ">"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 121
    .local v2, "message":Ljava/lang/String;
    new-instance v3, Ljava/lang/Exception;

    invoke-direct {v3, v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v3}, Lorg/junit/internal/runners/MethodRoadie;->addFailure(Ljava/lang/Throwable;)V

    goto :goto_34

    .line 123
    .end local v0    # "actual":Ljava/lang/Throwable;
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v2    # "message":Ljava/lang/String;
    :catch_90
    move-exception v1

    .line 124
    .local v1, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v1}, Lorg/junit/internal/runners/MethodRoadie;->addFailure(Ljava/lang/Throwable;)V

    goto :goto_34
.end method
