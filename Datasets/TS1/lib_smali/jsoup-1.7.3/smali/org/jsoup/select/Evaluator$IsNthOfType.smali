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
    .line 482
    invoke-direct {p0, p1, p2}, Lorg/jsoup/select/Evaluator$CssNthEvaluator;-><init>(II)V

    .line 483
    return-void
.end method


# virtual methods
.method protected calculatePosition(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)I
    .registers 8
    .param p1, "root"    # Lorg/jsoup/nodes/Element;
    .param p2, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 486
    const/4 v2, 0x0

    .line 487
    .local v2, "pos":I
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 488
    .local v0, "family":Lorg/jsoup/select/Elements;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->size()I

    move-result v3

    if-ge v1, v3, :cond_26

    .line 489
    invoke-virtual {v0, v1}, Lorg/jsoup/select/Elements;->get(I)Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v3

    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v4

    if-ne v3, v4, :cond_20

    add-int/lit8 v2, v2, 0x1

    .line 490
    :cond_20
    invoke-virtual {v0, v1}, Lorg/jsoup/select/Elements;->get(I)Lorg/jsoup/nodes/Element;

    move-result-object v3

    if-ne v3, p2, :cond_27

    .line 492
    :cond_26
    return v2

    .line 488
    :cond_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_a
.end method

.method protected getPseudoClass()Ljava/lang/String;
    .registers 2

    .prologue
    .line 497
    const-string v0, "nth-of-type"

    return-object v0
.end method
