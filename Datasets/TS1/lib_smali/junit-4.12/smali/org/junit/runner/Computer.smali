.class public Lorg/junit/runner/Computer;
.super Ljava/lang/Object;
.source "Computer.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static serial()Lorg/junit/runner/Computer;
    .registers 1

    .prologue
    .line 19
    new-instance v0, Lorg/junit/runner/Computer;

    invoke-direct {v0}, Lorg/junit/runner/Computer;-><init>()V

    return-object v0
.end method


# virtual methods
.method protected getRunner(Lorg/junit/runners/model/RunnerBuilder;Ljava/lang/Class;)Lorg/junit/runner/Runner;
    .registers 4
    .param p1, "builder"    # Lorg/junit/runners/model/RunnerBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/RunnerBuilder;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/junit/runner/Runner;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 40
    .local p2, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1, p2}, Lorg/junit/runners/model/RunnerBuilder;->runnerForClass(Ljava/lang/Class;)Lorg/junit/runner/Runner;

    move-result-object v0

    return-object v0
.end method

.method public getSuite(Lorg/junit/runners/model/RunnerBuilder;[Ljava/lang/Class;)Lorg/junit/runner/Runner;
    .registers 5
    .param p1, "builder"    # Lorg/junit/runners/model/RunnerBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/RunnerBuilder;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/junit/runner/Runner;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runners/model/InitializationError;
        }
    .end annotation

    .prologue
    .line 28
    .local p2, "classes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v0, Lorg/junit/runners/Suite;

    new-instance v1, Lorg/junit/runner/Computer$1;

    invoke-direct {v1, p0, p1}, Lorg/junit/runner/Computer$1;-><init>(Lorg/junit/runner/Computer;Lorg/junit/runners/model/RunnerBuilder;)V

    invoke-direct {v0, v1, p2}, Lorg/junit/runners/Suite;-><init>(Lorg/junit/runners/model/RunnerBuilder;[Ljava/lang/Class;)V

    return-object v0
.end method
