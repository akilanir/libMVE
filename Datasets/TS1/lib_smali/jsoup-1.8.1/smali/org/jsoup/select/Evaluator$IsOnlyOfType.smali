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
    .line 571
    invoke-direct {p0}, Lorg/jsoup/select/Evaluator;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)Z
    .registers 11
    .param p1, "root"    # Lorg/jsoup/nodes/Element;
    .param p2, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 574
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v2

    .line 575
    .local v2, "p":Lorg/jsoup/nodes/Element;
    if-eqz v2, :cond_c

    instance-of v6, v2, Lorg/jsoup/nodes/Document;

    if-eqz v6, :cond_e

    :cond_c
    move v4, v5

    .line 582
    :cond_d
    :goto_d
    return v4

    .line 577
    :cond_e
    const/4 v3, 0x0

    .line 578
    .local v3, "pos":I
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 579
    .local v0, "family":Lorg/jsoup/select/Elements;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_14
    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->size()I

    move-result v6

    if-ge v1, v6, :cond_31

    .line 580
    invoke-virtual {v0, v1}, Lorg/jsoup/select/Elements;->get(I)Lorg/jsoup/nodes/Element;

    move-result-object v6

    invoke-virtual {v6}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v6

    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jsoup/parser/Tag;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2e

    add-int/lit8 v3, v3, 0x1

    .line 579
    :cond_2e
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 582
    :cond_31
    if-eq v3, v4, :cond_d

    move v4, v5

    goto :goto_d
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 586
    const-string v0, ":only-of-type"

    return-object v0
.end method
