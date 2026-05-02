.class public Lorg/junit/internal/builders/NullBuilder;
.super Lorg/junit/runners/model/RunnerBuilder;
.source "NullBuilder.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
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
    .line 9
    .local p1, "each":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    return-object v0
.end method
