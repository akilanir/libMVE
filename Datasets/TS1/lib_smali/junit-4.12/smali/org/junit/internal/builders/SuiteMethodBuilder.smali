.class public Lorg/junit/internal/builders/SuiteMethodBuilder;
.super Lorg/junit/runners/model/RunnerBuilder;
.source "SuiteMethodBuilder.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Lorg/junit/runners/model/RunnerBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public hasSuiteMethod(Ljava/lang/Class;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 18
    :try_start_1
    const-string v2, "suite"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {p1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_9
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_9} :catch_b

    .line 22
    const/4 v1, 0x1

    :goto_a
    return v1

    .line 19
    :catch_b
    move-exception v0

    .line 20
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    goto :goto_a
.end method

.method public runnerForClass(Ljava/lang/Class;)Lorg/junit/runner/Runner;
    .registers 3
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
    .line 10
    .local p1, "each":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lorg/junit/internal/builders/SuiteMethodBuilder;->hasSuiteMethod(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 11
    new-instance v0, Lorg/junit/internal/runners/SuiteMethod;

    invoke-direct {v0, p1}, Lorg/junit/internal/runners/SuiteMethod;-><init>(Ljava/lang/Class;)V

    .line 13
    :goto_b
    return-object v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method
