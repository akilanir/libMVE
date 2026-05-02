.class public final Lorg/jsoup/select/Evaluator$IsOnlyOfType;
.super Lorg/jsoup/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IsOnlyOfType"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 573
    invoke-direct {p0}, Lorg/jsoup/select/Evaluator;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)Z
    .registers 11
    .param p1, "root"    # Lorg/jsoup/nodes/Element;
    .param p2, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 576
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v2

    .line 577
    .local v2, "p":Lorg/jsoup/nodes/Element;
    if-eqz v2, :cond_c

    instance-of v4, v2, Lorg/jsoup/nodes/Document;

    if-eqz v4, :cond_e

    :cond_c
    move v4, v6

    .line 584
    :goto_d
    return v4

    .line 579
    :cond_e
    const/4 v3, 0x0

    .line 580
    .local v3, "pos":I
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 581
    .local v0, "family":Lorg/jsoup/select/Elements;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_14
    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->size()I

    move-result v4

    if-ge v1, v4, :cond_33

    .line 582
    invoke-virtual {v0, v1}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jsoup/nodes/Element;

    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v4

    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/jsoup/parser/Tag;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    add-int/lit8 v3, v3, 0x1

    .line 581
    :cond_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 584
    :cond_33
    if-ne v3, v5, :cond_37

    move v4, v5

    goto :goto_d

    :cond_37
    move v4, v6

    goto :goto_d
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 588
    const-string v0, ":only-of-type"

    return-object v0
.end method
