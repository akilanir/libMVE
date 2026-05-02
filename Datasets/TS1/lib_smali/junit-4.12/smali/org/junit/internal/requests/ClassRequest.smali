.class public Lorg/junit/internal/requests/ClassRequest;
.super Lorg/junit/runner/Request;
.source "ClassRequest.java"


# instance fields
.field private final canUseSuiteMethod:Z

.field private final fTestClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private volatile runner:Lorg/junit/runner/Runner;

.field private final runnerLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p1, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/junit/internal/requests/ClassRequest;-><init>(Ljava/lang/Class;Z)V

    .line 26
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Z)V
    .registers 4
    .param p2, "canUseSuiteMethod"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .line 19
    .local p1, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/junit/runner/Request;-><init>()V

    .line 8
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/junit/internal/requests/ClassRequest;->runnerLock:Ljava/lang/Object;

    .line 20
    iput-object p1, p0, Lorg/junit/internal/requests/ClassRequest;->fTestClass:Ljava/lang/Class;

    .line 21
    iput-boolean p2, p0, Lorg/junit/internal/requests/ClassRequest;->canUseSuiteMethod:Z

    .line 22
    return-void
.end method


# virtual methods
.method public getRunner()Lorg/junit/runner/Runner;
    .registers 4

    .prologue
    .line 30
    iget-object v0, p0, Lorg/junit/internal/requests/ClassRequest;->runner:Lorg/junit/runner/Runner;

    if-nez v0, :cond_1b

    .line 31
    iget-object v1, p0, Lorg/junit/internal/requests/ClassRequest;->runnerLock:Ljava/lang/Object;

    monitor-enter v1

    .line 32
    :try_start_7
    iget-object v0, p0, Lorg/junit/internal/requests/ClassRequest;->runner:Lorg/junit/runner/Runner;

    if-nez v0, :cond_1a

    .line 33
    new-instance v0, Lorg/junit/internal/builders/AllDefaultPossibilitiesBuilder;

    iget-boolean v2, p0, Lorg/junit/internal/requests/ClassRequest;->canUseSuiteMethod:Z

    invoke-direct {v0, v2}, Lorg/junit/internal/builders/AllDefaultPossibilitiesBuilder;-><init>(Z)V

    iget-object v2, p0, Lorg/junit/internal/requests/ClassRequest;->fTestClass:Ljava/lang/Class;

    invoke-virtual {v0, v2}, Lorg/junit/internal/builders/AllDefaultPossibilitiesBuilder;->safeRunnerForClass(Ljava/lang/Class;)Lorg/junit/runner/Runner;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/internal/requests/ClassRequest;->runner:Lorg/junit/runner/Runner;

    .line 35
    :cond_1a
    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_7 .. :try_end_1b} :catchall_1e

    .line 37
    :cond_1b
    iget-object v0, p0, Lorg/junit/internal/requests/ClassRequest;->runner:Lorg/junit/runner/Runner;

    return-object v0

    .line 35
    :catchall_1e
    move-exception v0

    :try_start_1f
    monitor-exit v1
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_1e

    throw v0
.end method
