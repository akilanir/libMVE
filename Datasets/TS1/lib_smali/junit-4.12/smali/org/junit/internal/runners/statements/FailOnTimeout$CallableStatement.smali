.class Lorg/junit/internal/runners/statements/FailOnTimeout$CallableStatement;
.super Ljava/lang/Object;
.source "FailOnTimeout.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/internal/runners/statements/FailOnTimeout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CallableStatement"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field private final startLatch:Ljava/util/concurrent/CountDownLatch;

.field final synthetic this$0:Lorg/junit/internal/runners/statements/FailOnTimeout;


# direct methods
.method private constructor <init>(Lorg/junit/internal/runners/statements/FailOnTimeout;)V
    .registers 4

    .prologue
    .line 292
    iput-object p1, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$CallableStatement;->this$0:Lorg/junit/internal/runners/statements/FailOnTimeout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 293
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$CallableStatement;->startLatch:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/internal/runners/statements/FailOnTimeout;Lorg/junit/internal/runners/statements/FailOnTimeout$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/junit/internal/runners/statements/FailOnTimeout;
    .param p2, "x1"    # Lorg/junit/internal/runners/statements/FailOnTimeout$1;

    .prologue
    .line 292
    invoke-direct {p0, p1}, Lorg/junit/internal/runners/statements/FailOnTimeout$CallableStatement;-><init>(Lorg/junit/internal/runners/statements/FailOnTimeout;)V

    return-void
.end method


# virtual methods
.method public awaitStarted()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 308
    iget-object v0, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$CallableStatement;->startLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 309
    return-void
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 292
    invoke-virtual {p0}, Lorg/junit/internal/runners/statements/FailOnTimeout$CallableStatement;->call()Ljava/lang/Throwable;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Throwable;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 297
    :try_start_0
    iget-object v1, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$CallableStatement;->startLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 298
    iget-object v1, p0, Lorg/junit/internal/runners/statements/FailOnTimeout$CallableStatement;->this$0:Lorg/junit/internal/runners/statements/FailOnTimeout;

    # getter for: Lorg/junit/internal/runners/statements/FailOnTimeout;->originalStatement:Lorg/junit/runners/model/Statement;
    invoke-static {v1}, Lorg/junit/internal/runners/statements/FailOnTimeout;->access$600(Lorg/junit/internal/runners/statements/FailOnTimeout;)Lorg/junit/runners/model/Statement;

    move-result-object v1

    invoke-virtual {v1}, Lorg/junit/runners/model/Statement;->evaluate()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_e} :catch_10
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_e} :catch_12

    .line 304
    const/4 v0, 0x0

    :goto_f
    return-object v0

    .line 299
    :catch_10
    move-exception v0

    .line 300
    .local v0, "e":Ljava/lang/Exception;
    throw v0

    .line 301
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_12
    move-exception v0

    .line 302
    .local v0, "e":Ljava/lang/Throwable;
    goto :goto_f
.end method
