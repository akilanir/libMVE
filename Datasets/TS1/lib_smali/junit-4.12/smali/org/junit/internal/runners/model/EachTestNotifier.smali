.class public Lorg/junit/internal/runners/model/EachTestNotifier;
.super Ljava/lang/Object;
.source "EachTestNotifier.java"


# instance fields
.field private final description:Lorg/junit/runner/Description;

.field private final notifier:Lorg/junit/runner/notification/RunNotifier;


# direct methods
.method public constructor <init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;)V
    .registers 3
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;
    .param p2, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 16
    iput-object p2, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->description:Lorg/junit/runner/Description;

    .line 17
    return-void
.end method

.method private addMultipleFailureException(Lorg/junit/runners/model/MultipleFailureException;)V
    .registers 5
    .param p1, "mfe"    # Lorg/junit/runners/model/MultipleFailureException;

    .prologue
    .line 28
    invoke-virtual {p1}, Lorg/junit/runners/model/MultipleFailureException;->getFailures()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    .line 29
    .local v0, "each":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lorg/junit/internal/runners/model/EachTestNotifier;->addFailure(Ljava/lang/Throwable;)V

    goto :goto_8

    .line 31
    .end local v0    # "each":Ljava/lang/Throwable;
    :cond_18
    return-void
.end method


# virtual methods
.method public addFailedAssumption(Lorg/junit/internal/AssumptionViolatedException;)V
    .registers 5
    .param p1, "e"    # Lorg/junit/internal/AssumptionViolatedException;

    .prologue
    .line 34
    iget-object v0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->notifier:Lorg/junit/runner/notification/RunNotifier;

    new-instance v1, Lorg/junit/runner/notification/Failure;

    iget-object v2, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->description:Lorg/junit/runner/Description;

    invoke-direct {v1, v2, p1}, Lorg/junit/runner/notification/Failure;-><init>(Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Lorg/junit/runner/notification/RunNotifier;->fireTestAssumptionFailed(Lorg/junit/runner/notification/Failure;)V

    .line 35
    return-void
.end method

.method public addFailure(Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "targetException"    # Ljava/lang/Throwable;

    .prologue
    .line 20
    instance-of v0, p1, Lorg/junit/runners/model/MultipleFailureException;

    if-eqz v0, :cond_a

    .line 21
    check-cast p1, Lorg/junit/runners/model/MultipleFailureException;

    .end local p1    # "targetException":Ljava/lang/Throwable;
    invoke-direct {p0, p1}, Lorg/junit/internal/runners/model/EachTestNotifier;->addMultipleFailureException(Lorg/junit/runners/model/MultipleFailureException;)V

    .line 25
    :goto_9
    return-void

    .line 23
    .restart local p1    # "targetException":Ljava/lang/Throwable;
    :cond_a
    iget-object v0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->notifier:Lorg/junit/runner/notification/RunNotifier;

    new-instance v1, Lorg/junit/runner/notification/Failure;

    iget-object v2, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->description:Lorg/junit/runner/Description;

    invoke-direct {v1, v2, p1}, Lorg/junit/runner/notification/Failure;-><init>(Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Lorg/junit/runner/notification/RunNotifier;->fireTestFailure(Lorg/junit/runner/notification/Failure;)V

    goto :goto_9
.end method

.method public fireTestFinished()V
    .registers 3

    .prologue
    .line 38
    iget-object v0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->notifier:Lorg/junit/runner/notification/RunNotifier;

    iget-object v1, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->description:Lorg/junit/runner/Description;

    invoke-virtual {v0, v1}, Lorg/junit/runner/notification/RunNotifier;->fireTestFinished(Lorg/junit/runner/Description;)V

    .line 39
    return-void
.end method

.method public fireTestIgnored()V
    .registers 3

    .prologue
    .line 46
    iget-object v0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->notifier:Lorg/junit/runner/notification/RunNotifier;

    iget-object v1, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->description:Lorg/junit/runner/Description;

    invoke-virtual {v0, v1}, Lorg/junit/runner/notification/RunNotifier;->fireTestIgnored(Lorg/junit/runner/Description;)V

    .line 47
    return-void
.end method

.method public fireTestStarted()V
    .registers 3

    .prologue
    .line 42
    iget-object v0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->notifier:Lorg/junit/runner/notification/RunNotifier;

    iget-object v1, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->description:Lorg/junit/runner/Description;

    invoke-virtual {v0, v1}, Lorg/junit/runner/notification/RunNotifier;->fireTestStarted(Lorg/junit/runner/Description;)V

    .line 43
    return-void
.end method
