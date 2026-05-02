.class final Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;
.super Ljava/lang/Object;
.source "JUnit38ClassRunner.java"

# interfaces
.implements Ljunit/framework/TestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/internal/runners/JUnit38ClassRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "OldTestClassAdaptingListener"
.end annotation


# instance fields
.field private final notifier:Lorg/junit/runner/notification/RunNotifier;


# direct methods
.method private constructor <init>(Lorg/junit/runner/notification/RunNotifier;)V
    .registers 2
    .param p1, "notifier"    # Lorg/junit/runner/notification/RunNotifier;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 30
    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/internal/runners/JUnit38ClassRunner$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/junit/runner/notification/RunNotifier;
    .param p2, "x1"    # Lorg/junit/internal/runners/JUnit38ClassRunner$1;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;-><init>(Lorg/junit/runner/notification/RunNotifier;)V

    return-void
.end method

.method private asDescription(Ljunit/framework/Test;)Lorg/junit/runner/Description;
    .registers 5
    .param p1, "test"    # Ljunit/framework/Test;

    .prologue
    .line 47
    instance-of v1, p1, Lorg/junit/runner/Describable;

    if-eqz v1, :cond_c

    move-object v0, p1

    .line 48
    check-cast v0, Lorg/junit/runner/Describable;

    .line 49
    .local v0, "facade":Lorg/junit/runner/Describable;
    invoke-interface {v0}, Lorg/junit/runner/Describable;->getDescription()Lorg/junit/runner/Description;

    move-result-object v1

    .line 51
    .end local v0    # "facade":Lorg/junit/runner/Describable;
    :goto_b
    return-object v1

    :cond_c
    invoke-direct {p0, p1}, Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;->getEffectiveClass(Ljunit/framework/Test;)Ljava/lang/Class;

    move-result-object v1

    invoke-direct {p0, p1}, Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;->getName(Ljunit/framework/Test;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/junit/runner/Description;->createTestDescription(Ljava/lang/Class;Ljava/lang/String;)Lorg/junit/runner/Description;

    move-result-object v1

    goto :goto_b
.end method

.method private getEffectiveClass(Ljunit/framework/Test;)Ljava/lang/Class;
    .registers 3
    .param p1, "test"    # Ljunit/framework/Test;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljunit/framework/Test;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Ljunit/framework/Test;",
            ">;"
        }
    .end annotation

    .prologue
    .line 55
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method private getName(Ljunit/framework/Test;)Ljava/lang/String;
    .registers 3
    .param p1, "test"    # Ljunit/framework/Test;

    .prologue
    .line 59
    instance-of v0, p1, Ljunit/framework/TestCase;

    if-eqz v0, :cond_b

    .line 60
    check-cast p1, Ljunit/framework/TestCase;

    .end local p1    # "test":Ljunit/framework/Test;
    invoke-virtual {p1}, Ljunit/framework/TestCase;->getName()Ljava/lang/String;

    move-result-object v0

    .line 62
    :goto_a
    return-object v0

    .restart local p1    # "test":Ljunit/framework/Test;
    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method


# virtual methods
.method public addError(Ljunit/framework/Test;Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "test"    # Ljunit/framework/Test;
    .param p2, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 42
    new-instance v0, Lorg/junit/runner/notification/Failure;

    invoke-direct {p0, p1}, Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;->asDescription(Ljunit/framework/Test;)Lorg/junit/runner/Description;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lorg/junit/runner/notification/Failure;-><init>(Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    .line 43
    .local v0, "failure":Lorg/junit/runner/notification/Failure;
    iget-object v1, p0, Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;->notifier:Lorg/junit/runner/notification/RunNotifier;

    invoke-virtual {v1, v0}, Lorg/junit/runner/notification/RunNotifier;->fireTestFailure(Lorg/junit/runner/notification/Failure;)V

    .line 44
    return-void
.end method

.method public addFailure(Ljunit/framework/Test;Ljunit/framework/AssertionFailedError;)V
    .registers 3
    .param p1, "test"    # Ljunit/framework/Test;
    .param p2, "t"    # Ljunit/framework/AssertionFailedError;

    .prologue
    .line 67
    invoke-virtual {p0, p1, p2}, Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;->addError(Ljunit/framework/Test;Ljava/lang/Throwable;)V

    .line 68
    return-void
.end method

.method public endTest(Ljunit/framework/Test;)V
    .registers 4
    .param p1, "test"    # Ljunit/framework/Test;

    .prologue
    .line 33
    iget-object v0, p0, Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;->notifier:Lorg/junit/runner/notification/RunNotifier;

    invoke-direct {p0, p1}, Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;->asDescription(Ljunit/framework/Test;)Lorg/junit/runner/Description;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/junit/runner/notification/RunNotifier;->fireTestFinished(Lorg/junit/runner/Description;)V

    .line 34
    return-void
.end method

.method public startTest(Ljunit/framework/Test;)V
    .registers 4
    .param p1, "test"    # Ljunit/framework/Test;

    .prologue
    .line 37
    iget-object v0, p0, Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;->notifier:Lorg/junit/runner/notification/RunNotifier;

    invoke-direct {p0, p1}, Lorg/junit/internal/runners/JUnit38ClassRunner$OldTestClassAdaptingListener;->asDescription(Ljunit/framework/Test;)Lorg/junit/runner/Description;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/junit/runner/notification/RunNotifier;->fireTestStarted(Lorg/junit/runner/Description;)V

    .line 38
    return-void
.end method
