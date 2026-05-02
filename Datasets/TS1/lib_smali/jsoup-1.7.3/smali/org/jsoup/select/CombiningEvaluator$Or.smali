.class final Lorg/jsoup/select/CombiningEvaluator$Or;
.super Lorg/jsoup/select/CombiningEvaluator;
.source "CombiningEvaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/select/CombiningEvaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Or"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 82
    invoke-direct {p0}, Lorg/jsoup/select/CombiningEvaluator;-><init>()V

    .line 83
    return-void
.end method

.method constructor <init>(Ljava/util/Collection;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/jsoup/select/Evaluator;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p1, "evaluators":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jsoup/select/Evaluator;>;"
    invoke-direct {p0}, Lorg/jsoup/select/CombiningEvaluator;-><init>()V

    .line 74
    iget v0, p0, Lorg/jsoup/select/CombiningEvaluator$Or;->num:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_16

    .line 75
    iget-object v0, p0, Lorg/jsoup/select/CombiningEvaluator$Or;->evaluators:Ljava/util/ArrayList;

    new-instance v1, Lorg/jsoup/select/CombiningEvaluator$And;

    invoke-direct {v1, p1}, Lorg/jsoup/select/CombiningEvaluator$And;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    :goto_12
    invoke-virtual {p0}, Lorg/jsoup/select/CombiningEvaluator$Or;->updateNumEvaluators()V

    .line 79
    return-void

    .line 77
    :cond_16
    iget-object v0, p0, Lorg/jsoup/select/CombiningEvaluator$Or;->evaluators:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_12
.end method


# virtual methods
.method public add(Lorg/jsoup/select/Evaluator;)V
    .registers 3
    .param p1, "e"    # Lorg/jsoup/select/Evaluator;

    .prologue
    .line 86
    iget-object v0, p0, Lorg/jsoup/select/CombiningEvaluator$Or;->evaluators:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    invoke-virtual {p0}, Lorg/jsoup/select/CombiningEvaluator$Or;->updateNumEvaluators()V

    .line 88
    return-void
.end method

.method public matches(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)Z
    .registers 6
    .param p1, "root"    # Lorg/jsoup/nodes/Element;
    .param p2, "node"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 92
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v2, p0, Lorg/jsoup/select/CombiningEvaluator$Or;->num:I

    if-ge v0, v2, :cond_18

    .line 93
    iget-object v2, p0, Lorg/jsoup/select/CombiningEvaluator$Or;->evaluators:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/select/Evaluator;

    .line 94
    .local v1, "s":Lorg/jsoup/select/Evaluator;
    invoke-virtual {v1, p1, p2}, Lorg/jsoup/select/Evaluator;->matches(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 95
    const/4 v2, 0x1

    .line 97
    .end local v1    # "s":Lorg/jsoup/select/Evaluator;
    :goto_14
    return v2

    .line 92
    .restart local v1    # "s":Lorg/jsoup/select/Evaluator;
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 97
    .end local v1    # "s":Lorg/jsoup/select/Evaluator;
    :cond_18
    const/4 v2, 0x0

    goto :goto_14
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 102
    const-string v0, ":or%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/jsoup/select/CombiningEvaluator$Or;->evaluators:Ljava/util/ArrayList;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
