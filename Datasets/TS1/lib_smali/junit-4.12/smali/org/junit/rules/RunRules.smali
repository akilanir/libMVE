.class public Lorg/junit/rules/RunRules;
.super Lorg/junit/runners/model/Statement;
.source "RunRules.java"


# instance fields
.field private final statement:Lorg/junit/runners/model/Statement;


# direct methods
.method public constructor <init>(Lorg/junit/runners/model/Statement;Ljava/lang/Iterable;Lorg/junit/runner/Description;)V
    .registers 5
    .param p1, "base"    # Lorg/junit/runners/model/Statement;
    .param p3, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/Statement;",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/junit/rules/TestRule;",
            ">;",
            "Lorg/junit/runner/Description;",
            ")V"
        }
    .end annotation

    .prologue
    .line 14
    .local p2, "rules":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lorg/junit/rules/TestRule;>;"
    invoke-direct {p0}, Lorg/junit/runners/model/Statement;-><init>()V

    .line 15
    invoke-static {p1, p2, p3}, Lorg/junit/rules/RunRules;->applyAll(Lorg/junit/runners/model/Statement;Ljava/lang/Iterable;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/rules/RunRules;->statement:Lorg/junit/runners/model/Statement;

    .line 16
    return-void
.end method

.method private static applyAll(Lorg/junit/runners/model/Statement;Ljava/lang/Iterable;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;
    .registers 6
    .param p0, "result"    # Lorg/junit/runners/model/Statement;
    .param p2, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/Statement;",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/junit/rules/TestRule;",
            ">;",
            "Lorg/junit/runner/Description;",
            ")",
            "Lorg/junit/runners/model/Statement;"
        }
    .end annotation

    .prologue
    .line 25
    .local p1, "rules":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lorg/junit/rules/TestRule;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_15

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/rules/TestRule;

    .line 26
    .local v0, "each":Lorg/junit/rules/TestRule;
    invoke-interface {v0, p0, p2}, Lorg/junit/rules/TestRule;->apply(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;

    move-result-object p0

    goto :goto_4

    .line 28
    .end local v0    # "each":Lorg/junit/rules/TestRule;
    :cond_15
    return-object p0
.end method


# virtual methods
.method public evaluate()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 20
    iget-object v0, p0, Lorg/junit/rules/RunRules;->statement:Lorg/junit/runners/model/Statement;

    invoke-virtual {v0}, Lorg/junit/runners/model/Statement;->evaluate()V

    .line 21
    return-void
.end method
