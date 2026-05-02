.class public Lorg/junit/rules/RuleChain;
.super Ljava/lang/Object;
.source "RuleChain.java"

# interfaces
.implements Lorg/junit/rules/TestRule;


# static fields
.field private static final EMPTY_CHAIN:Lorg/junit/rules/RuleChain;


# instance fields
.field private rulesStartingWithInnerMost:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/junit/rules/TestRule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 44
    new-instance v0, Lorg/junit/rules/RuleChain;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/junit/rules/RuleChain;-><init>(Ljava/util/List;)V

    sput-object v0, Lorg/junit/rules/RuleChain;->EMPTY_CHAIN:Lorg/junit/rules/RuleChain;

    return-void
.end method

.method private constructor <init>(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/junit/rules/TestRule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 70
    .local p1, "rules":Ljava/util/List;, "Ljava/util/List<Lorg/junit/rules/TestRule;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lorg/junit/rules/RuleChain;->rulesStartingWithInnerMost:Ljava/util/List;

    .line 72
    return-void
.end method

.method public static emptyRuleChain()Lorg/junit/rules/RuleChain;
    .registers 1

    .prologue
    .line 56
    sget-object v0, Lorg/junit/rules/RuleChain;->EMPTY_CHAIN:Lorg/junit/rules/RuleChain;

    return-object v0
.end method

.method public static outerRule(Lorg/junit/rules/TestRule;)Lorg/junit/rules/RuleChain;
    .registers 2
    .param p0, "outerRule"    # Lorg/junit/rules/TestRule;

    .prologue
    .line 67
    invoke-static {}, Lorg/junit/rules/RuleChain;->emptyRuleChain()Lorg/junit/rules/RuleChain;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/junit/rules/RuleChain;->around(Lorg/junit/rules/TestRule;)Lorg/junit/rules/RuleChain;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public apply(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;
    .registers 6
    .param p1, "base"    # Lorg/junit/runners/model/Statement;
    .param p2, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 92
    iget-object v2, p0, Lorg/junit/rules/RuleChain;->rulesStartingWithInnerMost:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/rules/TestRule;

    .line 93
    .local v0, "each":Lorg/junit/rules/TestRule;
    invoke-interface {v0, p1, p2}, Lorg/junit/rules/TestRule;->apply(Lorg/junit/runners/model/Statement;Lorg/junit/runner/Description;)Lorg/junit/runners/model/Statement;

    move-result-object p1

    goto :goto_6

    .line 95
    .end local v0    # "each":Lorg/junit/rules/TestRule;
    :cond_17
    return-object p1
.end method

.method public around(Lorg/junit/rules/TestRule;)Lorg/junit/rules/RuleChain;
    .registers 4
    .param p1, "enclosedRule"    # Lorg/junit/rules/TestRule;

    .prologue
    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .local v0, "rulesOfNewChain":Ljava/util/List;, "Ljava/util/List<Lorg/junit/rules/TestRule;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    iget-object v1, p0, Lorg/junit/rules/RuleChain;->rulesStartingWithInnerMost:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 85
    new-instance v1, Lorg/junit/rules/RuleChain;

    invoke-direct {v1, v0}, Lorg/junit/rules/RuleChain;-><init>(Ljava/util/List;)V

    return-object v1
.end method
