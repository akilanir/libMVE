.class public Lorg/junit/internal/builders/AllDefaultPossibilitiesBuilder;
.super Lorg/junit/runners/model/RunnerBuilder;
.source "AllDefaultPossibilitiesBuilder.java"


# instance fields
.field private final canUseSuiteMethod:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 2
    .param p1, "canUseSuiteMethod"    # Z

    .prologue
    .line 12
    invoke-direct {p0}, Lorg/junit/runners/model/RunnerBuilder;-><init>()V

    .line 13
    iput-boolean p1, p0, Lorg/junit/internal/builders/AllDefaultPossibilitiesBuilder;->canUseSuiteMethod:Z

    .line 14
    return-void
.end method


# virtual methods
.method protected annotatedBuilder()Lorg/junit/internal/builders/AnnotatedBuilder;
    .registers 2

    .prologue
    .line 43
    new-instance v0, Lorg/junit/internal/builders/AnnotatedBuilder;

    invoke-direct {v0, p0}, Lorg/junit/internal/builders/AnnotatedBuilder;-><init>(Lorg/junit/runners/model/RunnerBuilder;)V

    return-object v0
.end method

.method protected ignoredBuilder()Lorg/junit/internal/builders/IgnoredBuilder;
    .registers 2

    .prologue
    .line 47
    new-instance v0, Lorg/junit/internal/builders/IgnoredBuilder;

    invoke-direct {v0}, Lorg/junit/internal/builders/IgnoredBuilder;-><init>()V

    return-object v0
.end method

.method protected junit3Builder()Lorg/junit/internal/builders/JUnit3Builder;
    .registers 2

    .prologue
    .line 39
    new-instance v0, Lorg/junit/internal/builders/JUnit3Builder;

    invoke-direct {v0}, Lorg/junit/internal/builders/JUnit3Builder;-><init>()V

    return-object v0
.end method

.method protected junit4Builder()Lorg/junit/internal/builders/JUnit4Builder;
    .registers 2

    .prologue
    .line 35
    new-instance v0, Lorg/junit/internal/builders/JUnit4Builder;

    invoke-direct {v0}, Lorg/junit/internal/builders/JUnit4Builder;-><init>()V

    return-object v0
.end method

.method public runnerForClass(Ljava/lang/Class;)Lorg/junit/runner/Runner;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 18
    .local p1, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v4, 0x5

    new-array v4, v4, [Lorg/junit/runners/model/RunnerBuilder;

    const/4 v5, 0x0

    invoke-virtual {p0}, Lorg/junit/internal/builders/AllDefaultPossibilitiesBuilder;->ignoredBuilder()Lorg/junit/internal/builders/IgnoredBuilder;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-virtual {p0}, Lorg/junit/internal/builders/AllDefaultPossibilitiesBuilder;->annotatedBuilder()Lorg/junit/internal/builders/AnnotatedBuilder;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-virtual {p0}, Lorg/junit/internal/builders/AllDefaultPossibilitiesBuilder;->suiteMethodBuilder()Lorg/junit/runners/model/RunnerBuilder;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    invoke-virtual {p0}, Lorg/junit/internal/builders/AllDefaultPossibilitiesBuilder;->junit3Builder()Lorg/junit/internal/builders/JUnit3Builder;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x4

    invoke-virtual {p0}, Lorg/junit/internal/builders/AllDefaultPossibilitiesBuilder;->junit4Builder()Lorg/junit/internal/builders/JUnit4Builder;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 25
    .local v0, "builders":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/RunnerBuilder;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_2e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_41

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/junit/runners/model/RunnerBuilder;

    .line 26
    .local v1, "each":Lorg/junit/runners/model/RunnerBuilder;
    invoke-virtual {v1, p1}, Lorg/junit/runners/model/RunnerBuilder;->safeRunnerForClass(Ljava/lang/Class;)Lorg/junit/runner/Runner;

    move-result-object v3

    .line 27
    .local v3, "runner":Lorg/junit/runner/Runner;
    if-eqz v3, :cond_2e

    .line 31
    .end local v1    # "each":Lorg/junit/runners/model/RunnerBuilder;
    .end local v3    # "runner":Lorg/junit/runner/Runner;
    :goto_40
    return-object v3

    :cond_41
    const/4 v3, 0x0

    goto :goto_40
.end method

.method protected suiteMethodBuilder()Lorg/junit/runners/model/RunnerBuilder;
    .registers 2

    .prologue
    .line 51
    iget-boolean v0, p0, Lorg/junit/internal/builders/AllDefaultPossibilitiesBuilder;->canUseSuiteMethod:Z

    if-eqz v0, :cond_a

    .line 52
    new-instance v0, Lorg/junit/internal/builders/SuiteMethodBuilder;

    invoke-direct {v0}, Lorg/junit/internal/builders/SuiteMethodBuilder;-><init>()V

    .line 54
    :goto_9
    return-object v0

    :cond_a
    new-instance v0, Lorg/junit/internal/builders/NullBuilder;

    invoke-direct {v0}, Lorg/junit/internal/builders/NullBuilder;-><init>()V

    goto :goto_9
.end method
