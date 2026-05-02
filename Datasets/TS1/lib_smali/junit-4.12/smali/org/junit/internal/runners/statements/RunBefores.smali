.class public Lorg/junit/internal/runners/statements/RunBefores;
.super Lorg/junit/runners/model/Statement;
.source "RunBefores.java"


# instance fields
.field private final befores:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/junit/runners/model/FrameworkMethod;",
            ">;"
        }
    .end annotation
.end field

.field private final next:Lorg/junit/runners/model/Statement;

.field private final target:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lorg/junit/runners/model/Statement;Ljava/util/List;Ljava/lang/Object;)V
    .registers 4
    .param p1, "next"    # Lorg/junit/runners/model/Statement;
    .param p3, "target"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/Statement;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runners/model/FrameworkMethod;",
            ">;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 15
    .local p2, "befores":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;"
    invoke-direct {p0}, Lorg/junit/runners/model/Statement;-><init>()V

    .line 16
    iput-object p1, p0, Lorg/junit/internal/runners/statements/RunBefores;->next:Lorg/junit/runners/model/Statement;

    .line 17
    iput-object p2, p0, Lorg/junit/internal/runners/statements/RunBefores;->befores:Ljava/util/List;

    .line 18
    iput-object p3, p0, Lorg/junit/internal/runners/statements/RunBefores;->target:Ljava/lang/Object;

    .line 19
    return-void
.end method


# virtual methods
.method public evaluate()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 23
    iget-object v2, p0, Lorg/junit/internal/runners/statements/RunBefores;->befores:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runners/model/FrameworkMethod;

    .line 24
    .local v0, "before":Lorg/junit/runners/model/FrameworkMethod;
    iget-object v2, p0, Lorg/junit/internal/runners/statements/RunBefores;->target:Ljava/lang/Object;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lorg/junit/runners/model/FrameworkMethod;->invokeExplosively(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    .line 26
    .end local v0    # "before":Lorg/junit/runners/model/FrameworkMethod;
    :cond_1b
    iget-object v2, p0, Lorg/junit/internal/runners/statements/RunBefores;->next:Lorg/junit/runners/model/Statement;

    invoke-virtual {v2}, Lorg/junit/runners/model/Statement;->evaluate()V

    .line 27
    return-void
.end method
