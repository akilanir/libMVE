.class Lorg/junit/experimental/results/FailureList;
.super Ljava/lang/Object;
.source "FailureList.java"


# instance fields
.field private final failures:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/notification/Failure;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runner/notification/Failure;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 12
    .local p1, "failures":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runner/notification/Failure;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lorg/junit/experimental/results/FailureList;->failures:Ljava/util/List;

    .line 14
    return-void
.end method


# virtual methods
.method public result()Lorg/junit/runner/Result;
    .registers 8

    .prologue
    .line 17
    new-instance v4, Lorg/junit/runner/Result;

    invoke-direct {v4}, Lorg/junit/runner/Result;-><init>()V

    .line 18
    .local v4, "result":Lorg/junit/runner/Result;
    invoke-virtual {v4}, Lorg/junit/runner/Result;->createListener()Lorg/junit/runner/notification/RunListener;

    move-result-object v3

    .line 19
    .local v3, "listener":Lorg/junit/runner/notification/RunListener;
    iget-object v5, p0, Lorg/junit/experimental/results/FailureList;->failures:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/junit/runner/notification/Failure;

    .line 21
    .local v1, "failure":Lorg/junit/runner/notification/Failure;
    :try_start_1b
    invoke-virtual {v3, v1}, Lorg/junit/runner/notification/RunListener;->testFailure(Lorg/junit/runner/notification/Failure;)V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1e} :catch_1f

    goto :goto_f

    .line 22
    :catch_1f
    move-exception v0

    .line 23
    .local v0, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/RuntimeException;

    const-string v6, "I can\'t believe this happened"

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 26
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "failure":Lorg/junit/runner/notification/Failure;
    :cond_28
    return-object v4
.end method
