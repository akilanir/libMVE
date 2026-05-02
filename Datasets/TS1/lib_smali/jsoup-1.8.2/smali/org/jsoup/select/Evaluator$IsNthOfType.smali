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
    .line 487
    invoke-direct {p0, p1, p2}, Lorg/jsoup/select/Evaluator$CssNthEvaluator;-><init>(II)V

    .line 488
    return-void
.end method


# virtual methods
.method protected calculatePosition(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)I
    .registers 8
    .param p1, "root"    # Lorg/jsoup/nodes/Element;
    .param p2, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 491
    const/4 v2, 0x0

    .line 492
    .local v2, "pos":I
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 493
    .local v0, "family":Lorg/jsoup/select/Elements;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->size()I

    move-result v3

    if-ge v1, v3, :cond_2c

    .line 494
    invoke-virtual {v0, v1}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v3

    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jsoup/parser/Tag;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_26

    add-int/lit8 v2, v2, 0x1

    .line 495
    :cond_26
    invoke-virtual {v0, v1}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p2, :cond_2d

    .line 497
    :cond_2c
    return v2

    .line 493
    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_a
.end method

.method protected getPseudoClass()Ljava/lang/String;
    .registers 2

    .prologue
    .line 502
    const-string v0, "nth-of-type"

    return-object v0
.end method
