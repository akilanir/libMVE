.class public Lorg/jsoup/select/Evaluator$IsNthLastOfType;
.super Lorg/jsoup/select/Evaluator$CssNthEvaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IsNthLastOfType"
.end annotation


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "a"    # I
    .param p2, "b"    # I

    .prologue
    .line 510
    invoke-direct {p0, p1, p2}, Lorg/jsoup/select/Evaluator$CssNthEvaluator;-><init>(II)V

    .line 511
    return-void
.end method


# virtual methods
.method protected calculatePosition(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)I
    .registers 8
    .param p1, "root"    # Lorg/jsoup/nodes/Element;
    .param p2, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 515
    const/4 v2, 0x0

    .line 516
    .local v2, "pos":I
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 517
    .local v0, "family":Lorg/jsoup/select/Elements;
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->elementSiblingIndex()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .local v1, "i":I
    :goto_11
    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->size()I

    move-result v3

    if-ge v1, v3, :cond_30

    .line 518
    invoke-virtual {v0, v1}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v3

    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jsoup/parser/Tag;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2d

    add-int/lit8 v2, v2, 0x1

    .line 517
    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 520
    :cond_30
    return v2
.end method

.method protected getPseudoClass()Ljava/lang/String;
    .registers 2

    .prologue
    .line 525
    const-string v0, "nth-last-of-type"

    return-object v0
.end method
