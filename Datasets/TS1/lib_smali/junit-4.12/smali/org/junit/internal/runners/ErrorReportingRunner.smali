.class public Lorg/junit/internal/runners/ErrorReportingRunner;
.super Lorg/junit/runner/Runner;
.source "ErrorReportingRunner.java"


# instance fields
.field private final causes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final testClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Throwable;)V
    .registers 5
    .param p2, "cause"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 18
    .local p1, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/junit/runner/Runner;-><init>()V

    .line 19
    if-nez p1, :cond_d

    .line 20
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Test class cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 22
    :cond_d
    iput-object p1, p0, Lorg/junit/internal/runners/ErrorReportingRunner;->testClass:Ljava/lang/Class;

    .line 23
    invoke-direct {p0, p2}, Lorg/junit/internal/runners/ErrorReportingRunner;->getCauses(Ljava/lang/Throwable;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/internal/runners/ErrorReportingRunner;->causes:Ljava/util/List;

    .line 24
    return-void
.end method

.method private describeCause(Ljava/lang/Throwable;)Lorg/junit/runner/Description;
    .registers 4
    .param p1, "child"    # Ljava/lang/Throwable;

    .prologue
    .line 58
    iget-object v0, p0, Lorg/junit/internal/runners/ErrorReportingRunner;->testClass:Ljava/lang/Class;

    const-string v1, "initializationError"

    invoke-static {v0, v1}, Lorg/junit/runner/Description;->createTestDescription(Ljava/lang/Class;Ljava/lang/String;)Lorg/junit/runner/Description;

    move-result-object v0

    return-object v0
.end method

.method private getCauses(Ljava/lang/Throwable;)Ljava/util/List;
    .registers 4
    .param p1, "cause"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    instance-of v0, p1, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v0, :cond_d

    .line 45
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/junit/internal/runners/ErrorReportingRunner;->getCauses(Ljava/lang/Throwable;)Ljava/util/List;

    move-result-object v0

    .line 54
    .end local p1    # "cause":Ljava/lang/Throwable;
    :goto_c
    return-object v0

    .line 47
    .restart local p1    # "cause":Ljava/lang/Throwable;
    :cond_d
    instance-of v0, p1, Lorg/junit/runners/model/InitializationError;

    if-eqz v0, :cond_18

    .line 48
    check-cast p1, Lorg/junit/runners/model/InitializationError;

    .end local p1    # "cause":Ljava/lang/Throwable;
    invoke-virtual {p1}, Lorg/junit/runners/model/InitializationError;->getCauses()Ljava/util/List;

    move-result-object v0

    goto :goto_c

    .line 50
    .restart local p1    # "cause":Ljava/lang/Throwable;
    :cond_18
    instance-of v0, p1, Lorg/junit/internal/runners/InitializationError;

    if-eqz v0, :cond_23

    .line 51
    check-cast p1, Lorg/junit/internal/runners/InitializationError;

    .end local p1    # "cause":Ljava/lang/Throwable;
    invoke-virtual {p1}, Lorg/junit/internal/runners/InitializationError;->getCauses()Ljava/util/List;

    move-result-object v0

    goto :goto_c

    .line 54
    .restart local p1    # "cause":Ljava/lang/Throwable;
    :cond_23
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Throwable;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_c
.end method

.method private runCause(Ljava/lang/Throwable;Lorg/junit/runner/notification/RunNotifier;)V
    .registers 5
    .param p1, "child"    # Ljava/lang/Throwable;
    .param p2, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lorg/junit/internal/runners/ErrorReportingRunner;->describeCause(Ljava/lang/Throwable;)Lorg/junit/runner/Description;

    move-result-object v0

    .line 64
    .local v0, "description":Lorg/junit/runner/Description;
    invoke-virtual {p2, v0}, Lorg/junit/runner/notification/RunNotifier;->fireTestStarted(Lorg/junit/runner/Description;)V

    .line 65
    new-instance v1, Lorg/junit/runner/notification/Failure;

    invoke-direct {v1, v0, p1}, Lorg/junit/runner/notification/Failure;-><init>(Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    invoke-virtual {p2, v1}, Lorg/junit/runner/notification/RunNotifier;->fireTestFailure(Lorg/junit/runner/notification/Failure;)V

    .line 66
    invoke-virtual {p2, v0}, Lorg/junit/runner/notification/RunNotifier;->fireTestFinished(Lorg/junit/runner/Description;)V

    .line 67
    return-void
.end method


# virtual methods
.method public getDescription()Lorg/junit/runner/Description;
    .registers 5

    .prologue
    .line 28
    iget-object v3, p0, Lorg/junit/internal/runners/ErrorReportingRunner;->testClass:Ljava/lang/Class;

    invoke-static {v3}, Lorg/junit/runner/Description;->createSuiteDescription(Ljava/lang/Class;)Lorg/junit/runner/Description;

    move-result-object v0

    .line 29
    .local v0, "description":Lorg/junit/runner/Description;
    iget-object v3, p0, Lorg/junit/internal/runners/ErrorReportingRunner;->causes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;

    .line 30
    .local v1, "each":Ljava/lang/Throwable;
    invoke-direct {p0, v1}, Lorg/junit/internal/runners/ErrorReportingRunner;->describeCause(Ljava/lang/Throwable;)Lorg/junit/runner/Description;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/junit/runner/Description;->addChild(Lorg/junit/runner/Description;)V

    goto :goto_c

    .line 32
    .end local v1    # "each":Ljava/lang/Throwable;
    :cond_20
    return-object v0
.end method

.method public run(Lorg/junit/runner/notification/RunNotifier;)V
    .registers 5
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 37
    iget-object v2, p0, Lorg/junit/internal/runners/ErrorReportingRunner;->causes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    .line 38
    .local v0, "each":Ljava/lang/Throwable;
    invoke-direct {p0, v0, p1}, Lorg/junit/internal/runners/ErrorReportingRunner;->runCause(Ljava/lang/Throwable;Lorg/junit/runner/notification/RunNotifier;)V

    goto :goto_6

    .line 40
    .end local v0    # "each":Ljava/lang/Throwable;
    :cond_16
    return-void
.end method
