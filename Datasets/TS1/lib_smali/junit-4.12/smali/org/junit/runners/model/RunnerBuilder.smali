.class public abstract Lorg/junit/runners/model/RunnerBuilder;
.super Ljava/lang/Object;
.source "RunnerBuilder.java"


# instance fields
.field private final parents:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/junit/runners/model/RunnerBuilder;->parents:Ljava/util/Set;

    return-void
.end method

.method private runners([Ljava/lang/Class;)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/Runner;",
            ">;"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, "children":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 100
    .local v5, "runners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/junit/runner/Runner;>;"
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_8
    if-ge v3, v4, :cond_18

    aget-object v2, v0, v3

    .line 101
    .local v2, "each":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, v2}, Lorg/junit/runners/model/RunnerBuilder;->safeRunnerForClass(Ljava/lang/Class;)Lorg/junit/runner/Runner;

    move-result-object v1

    .line 102
    .local v1, "childRunner":Lorg/junit/runner/Runner;
    if-eqz v1, :cond_15

    .line 103
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    :cond_15
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 106
    .end local v1    # "childRunner":Lorg/junit/runner/Runner;
    .end local v2    # "each":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_18
    return-object v5
.end method


# virtual methods
.method addParent(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runners/model/InitializationError;
        }
    .end annotation

    .prologue
    .line 66
    .local p1, "parent":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lorg/junit/runners/model/RunnerBuilder;->parents:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 67
    new-instance v0, Lorg/junit/runners/model/InitializationError;

    const-string v1, "class \'%s\' (possibly indirectly) contains itself as a SuiteClass"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/junit/runners/model/InitializationError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 69
    :cond_1e
    return-object p1
.end method

.method removeParent(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lorg/junit/runners/model/RunnerBuilder;->parents:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 74
    return-void
.end method

.method public abstract runnerForClass(Ljava/lang/Class;)Lorg/junit/runner/Runner;
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
.end method

.method public runners(Ljava/lang/Class;Ljava/util/List;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;)",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/Runner;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runners/model/InitializationError;
        }
    .end annotation

    .prologue
    .line 95
    .local p1, "parent":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "children":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Class;

    invoke-interface {p2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Class;

    invoke-virtual {p0, p1, v0}, Lorg/junit/runners/model/RunnerBuilder;->runners(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public runners(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/Runner;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runners/model/InitializationError;
        }
    .end annotation

    .prologue
    .line 84
    .local p1, "parent":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "children":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lorg/junit/runners/model/RunnerBuilder;->addParent(Ljava/lang/Class;)Ljava/lang/Class;

    .line 87
    :try_start_3
    invoke-direct {p0, p2}, Lorg/junit/runners/model/RunnerBuilder;->runners([Ljava/lang/Class;)Ljava/util/List;
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_b

    move-result-object v0

    .line 89
    invoke-virtual {p0, p1}, Lorg/junit/runners/model/RunnerBuilder;->removeParent(Ljava/lang/Class;)V

    return-object v0

    :catchall_b
    move-exception v0

    invoke-virtual {p0, p1}, Lorg/junit/runners/model/RunnerBuilder;->removeParent(Ljava/lang/Class;)V

    throw v0
.end method

.method public safeRunnerForClass(Ljava/lang/Class;)Lorg/junit/runner/Runner;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/junit/runner/Runner;"
        }
    .end annotation

    .prologue
    .line 59
    .local p1, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/junit/runners/model/RunnerBuilder;->runnerForClass(Ljava/lang/Class;)Lorg/junit/runner/Runner;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 61
    :goto_4
    return-object v1

    .line 60
    :catch_5
    move-exception v0

    .line 61
    .local v0, "e":Ljava/lang/Throwable;
    new-instance v1, Lorg/junit/internal/runners/ErrorReportingRunner;

    invoke-direct {v1, p1, v0}, Lorg/junit/internal/runners/ErrorReportingRunner;-><init>(Ljava/lang/Class;Ljava/lang/Throwable;)V

    goto :goto_4
.end method
