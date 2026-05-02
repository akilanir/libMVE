.class public Lorg/junit/runner/notification/RunListener;
.super Ljava/lang/Object;
.source "RunListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/runner/notification/RunListener$ThreadSafe;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    return-void
.end method


# virtual methods
.method public testAssumptionFailure(Lorg/junit/runner/notification/Failure;)V
    .registers 2
    .param p1, "failure"    # Lorg/junit/runner/notification/Failure;

    .prologue
    .line 114
    return-void
.end method

.method public testFailure(Lorg/junit/runner/notification/Failure;)V
    .registers 2
    .param p1, "failure"    # Lorg/junit/runner/notification/Failure;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 104
    return-void
.end method

.method public testFinished(Lorg/junit/runner/Description;)V
    .registers 2
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 87
    return-void
.end method

.method public testIgnored(Lorg/junit/runner/Description;)V
    .registers 2
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 123
    return-void
.end method

.method public testRunFinished(Lorg/junit/runner/Result;)V
    .registers 2
    .param p1, "result"    # Lorg/junit/runner/Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 70
    return-void
.end method

.method public testRunStarted(Lorg/junit/runner/Description;)V
    .registers 2
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 61
    return-void
.end method

.method public testStarted(Lorg/junit/runner/Description;)V
    .registers 2
    .param p1, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 79
    return-void
.end method
