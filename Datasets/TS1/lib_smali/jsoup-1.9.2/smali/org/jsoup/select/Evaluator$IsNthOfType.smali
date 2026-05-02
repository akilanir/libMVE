.class public Lorg/jsoup/select/Evaluator$IsNthOfType;
.super Lorg/jsoup/select/Evaluator$CssNthEvaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IsNthOfType"
.end annotation


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "a"    # I
    .param p2, "b"    # I

    .prologue
    .line 488
    invoke-direct {p0, p1, p2}, Lorg/jsoup/select/Evaluator$CssNthEvaluator;-><init>(II)V

    .line 489
    return-void
.end method


# virtual methods
.method protected calculatePosition(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)I
    .registers 9
    .param p1, "root"    # Lorg/jsoup/nodes/Element;
    .param p2, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 492
    const/4 v2, 0x0

    .line 493
    .local v2, "pos":I
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v1

    .line 494
    .local v1, "family":Lorg/jsoup/select/Elements;
    invoke-virtual {v1}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 495
    .local v0, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v4

    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jsoup/parser/Tag;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_29

    add-int/lit8 v2, v2, 0x1

    .line 496
    :cond_29
    if-ne v0, p2, :cond_d

    .line 498
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    :cond_2b
    return v2
.end method

.method protected getPseudoClass()Ljava/lang/String;
    .registers 2

    .prologue
    .line 503
    const-string v0, "nth-of-type"

    return-object v0
.end method
