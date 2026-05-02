.class public Lorg/junit/internal/builders/JUnit4Builder;
.super Lorg/junit/runners/model/RunnerBuilder;
.source "JUnit4Builder.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Lorg/junit/runners/model/RunnerBuilder;-><init>()V

    return-void
.end method


# virtual methods
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
    .local p1, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lorg/junit/runners/BlockJUnit4ClassRunner;

    invoke-direct {v0, p1}, Lorg/junit/runners/BlockJUnit4ClassRunner;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method
