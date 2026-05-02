.class final Lorg/jsoup/select/CombiningEvaluator$And;
.super Lorg/jsoup/select/CombiningEvaluator;
.source "CombiningEvaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/select/CombiningEvaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "And"
.end annotation


# direct methods
.method constructor <init>(Ljava/util/Collection;)V
    .registers 2
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
    .line 43
    .local p1, "evaluators":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jsoup/select/Evaluator;>;"
    invoke-direct {p0, p1}, Lorg/jsoup/select/CombiningEvaluator;-><init>(Ljava/util/Collection;)V

    .line 44
    return-void
.end method

.method varargs constructor <init>([Lorg/jsoup/select/Evaluator;)V
    .registers 3
    .param p1, "evaluators"    # [Lorg/jsoup/select/Evaluator;

    .prologue
    .line 47
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jsoup/select/CombiningEvaluator$And;-><init>(Ljava/util/Collection;)V

    .line 48
    return-void
.end method


# virtual methods
.method public matches(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)Z
    .registers 6
    .param p1, "root"    # Lorg/jsoup/nodes/Element;
    .param p2, "node"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 52
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v2, p0, Lorg/jsoup/select/CombiningEvaluator$And;->num:I

    if-ge v0, v2, :cond_18

    .line 53
    iget-object v2, p0, Lorg/jsoup/select/CombiningEvaluator$And;->evaluators:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/select/Evaluator;

    .line 54
    .local v1, "s":Lorg/jsoup/select/Evaluator;
    invoke-virtual {v1, p1, p2}, Lorg/jsoup/select/Evaluator;->matches(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)Z

    move-result v2

    if-nez v2, :cond_15

    .line 55
    const/4 v2, 0x0

    .line 57
    .end local v1    # "s":Lorg/jsoup/select/Evaluator;
    :goto_14
    return v2

    .line 52
    .restart local v1    # "s":Lorg/jsoup/select/Evaluator;
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 57
    .end local v1    # "s":Lorg/jsoup/select/Evaluator;
    :cond_18
    const/4 v2, 0x1

    goto :goto_14
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 62
    iget-object v0, p0, Lorg/jsoup/select/CombiningEvaluator$And;->evaluators:Ljava/util/ArrayList;

    const-string v1, " "

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
