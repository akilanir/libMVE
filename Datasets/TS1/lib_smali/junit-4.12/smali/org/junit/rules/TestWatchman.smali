.class public Lorg/junit/rules/TestWatchman;
.super Ljava/lang/Object;
.source "TestWatchman.java"

# interfaces
.implements Lorg/junit/rules/MethodRule;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lorg/junit/runners/model/Statement;Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;)Lorg/junit/runners/model/Statement;
    .registers 5
    .param p1, "base"    # Lorg/junit/runners/model/Statement;
    .param p2, "method"    # Lorg/junit/runners/model/FrameworkMethod;
    .param p3, "target"    # Ljava/lang/Object;

    .prologue
    .line 48
    new-instance v0, Lorg/junit/rules/TestWatchman$1;

    invoke-direct {v0, p0, p2, p1}, Lorg/junit/rules/TestWatchman$1;-><init>(Lorg/junit/rules/TestWatchman;Lorg/junit/runners/model/FrameworkMethod;Lorg/junit/runners/model/Statement;)V

    return-object v0
.end method

.method public failed(Ljava/lang/Throwable;Lorg/junit/runners/model/FrameworkMethod;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;
    .param p2, "method"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    .line 77
    return-void
.end method

.method public finished(Lorg/junit/runners/model/FrameworkMethod;)V
    .registers 2
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    .line 90
    return-void
.end method

.method public starting(Lorg/junit/runners/model/FrameworkMethod;)V
    .registers 2
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    .line 83
    return-void
.end method

.method public succeeded(Lorg/junit/runners/model/FrameworkMethod;)V
    .registers 2
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    .line 71
    return-void
.end method
