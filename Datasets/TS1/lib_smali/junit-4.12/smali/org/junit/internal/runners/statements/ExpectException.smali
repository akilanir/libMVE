.class public Lorg/junit/internal/runners/statements/ExpectException;
.super Lorg/junit/runners/model/Statement;
.source "ExpectException.java"


# instance fields
.field private final expected:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final next:Lorg/junit/runners/model/Statement;


# direct methods
.method public constructor <init>(Lorg/junit/runners/model/Statement;Ljava/lang/Class;)V
    .registers 3
    .param p1, "next"    # Lorg/junit/runners/model/Statement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/Statement;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 10
    .local p2, "expected":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Throwable;>;"
    invoke-direct {p0}, Lorg/junit/runners/model/Statement;-><init>()V

    .line 11
    iput-object p1, p0, Lorg/junit/internal/runners/statements/ExpectException;->next:Lorg/junit/runners/model/Statement;

    .line 12
    iput-object p2, p0, Lorg/junit/internal/runners/statements/ExpectException;->expected:Ljava/lang/Class;

    .line 13
    return-void
.end method


# virtual methods
.method public evaluate()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 17
    const/4 v0, 0x0

    .line 19
    .local v0, "complete":Z
    :try_start_1
    iget-object v3, p0, Lorg/junit/internal/runners/statements/ExpectException;->next:Lorg/junit/runners/model/Statement;

    invoke-virtual {v3}, Lorg/junit/runners/model/Statement;->evaluate()V
    :try_end_6
    .catch Lorg/junit/internal/AssumptionViolatedException; {:try_start_1 .. :try_end_6} :catch_28
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_6} :catch_2a

    .line 20
    const/4 v0, 0x1

    .line 31
    :cond_7
    if-eqz v0, :cond_6e

    .line 32
    new-instance v3, Ljava/lang/AssertionError;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected exception: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/junit/internal/runners/statements/ExpectException;->expected:Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 21
    :catch_28
    move-exception v1

    .line 22
    .local v1, "e":Lorg/junit/internal/AssumptionViolatedException;
    throw v1

    .line 23
    .end local v1    # "e":Lorg/junit/internal/AssumptionViolatedException;
    :catch_2a
    move-exception v1

    .line 24
    .local v1, "e":Ljava/lang/Throwable;
    iget-object v3, p0, Lorg/junit/internal/runners/statements/ExpectException;->expected:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 25
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected exception, expected<"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/junit/internal/runners/statements/ExpectException;->expected:Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "> but was<"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

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

    .line 28
    .local v2, "message":Ljava/lang/String;
    new-instance v3, Ljava/lang/Exception;

    invoke-direct {v3, v2, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 35
    .end local v1    # "e":Ljava/lang/Throwable;
    .end local v2    # "message":Ljava/lang/String;
    :cond_6e
    return-void
.end method
