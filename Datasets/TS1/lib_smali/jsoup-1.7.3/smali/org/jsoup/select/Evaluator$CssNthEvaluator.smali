.class public abstract Lorg/jsoup/select/Evaluator$CssNthEvaluator;
.super Lorg/jsoup/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "CssNthEvaluator"
.end annotation


# instance fields
.field protected final a:I

.field protected final b:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "b"    # I

    .prologue
    .line 406
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/jsoup/select/Evaluator$CssNthEvaluator;-><init>(II)V

    .line 407
    return-void
.end method

.method public constructor <init>(II)V
    .registers 3
    .param p1, "a"    # I
    .param p2, "b"    # I

    .prologue
    .line 401
    invoke-direct {p0}, Lorg/jsoup/select/Evaluator;-><init>()V

    .line 402
    iput p1, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->a:I

    .line 403
    iput p2, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->b:I

    .line 404
    return-void
.end method


# virtual methods
.method protected abstract calculatePosition(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)I
.end method

.method protected abstract getPseudoClass()Ljava/lang/String;
.end method

.method public matches(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)Z
    .registers 9
    .param p1, "root"    # Lorg/jsoup/nodes/Element;
    .param p2, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 411
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 412
    .local v0, "p":Lorg/jsoup/nodes/Element;
    if-eqz v0, :cond_c

    instance-of v4, v0, Lorg/jsoup/nodes/Document;

    if-eqz v4, :cond_e

    :cond_c
    move v2, v3

    .line 417
    :cond_d
    :goto_d
    return v2

    .line 414
    :cond_e
    invoke-virtual {p0, p1, p2}, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->calculatePosition(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)I

    move-result v1

    .line 415
    .local v1, "pos":I
    iget v4, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->a:I

    if-nez v4, :cond_1c

    iget v4, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->b:I

    if-eq v1, v4, :cond_d

    move v2, v3

    goto :goto_d

    .line 417
    :cond_1c
    iget v4, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->b:I

    sub-int v4, v1, v4

    iget v5, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->a:I

    mul-int/2addr v4, v5

    if-ltz v4, :cond_2e

    iget v4, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->b:I

    sub-int v4, v1, v4

    iget v5, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->a:I

    rem-int/2addr v4, v5

    if-eqz v4, :cond_d

    :cond_2e
    move v2, v3

    goto :goto_d
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 422
    iget v0, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->a:I

    if-nez v0, :cond_1e

    .line 423
    const-string v0, ":%s(%d)"

    new-array v1, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->getPseudoClass()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    iget v2, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->b:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 426
    :goto_1d
    return-object v0

    .line 424
    :cond_1e
    iget v0, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->b:I

    if-nez v0, :cond_39

    .line 425
    const-string v0, ":%s(%dn)"

    new-array v1, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->getPseudoClass()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    iget v2, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->a:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1d

    .line 426
    :cond_39
    const-string v0, ":%s(%dn%+d)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->getPseudoClass()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    iget v2, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->a:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    iget v2, p0, Lorg/jsoup/select/Evaluator$CssNthEvaluator;->b:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1d
.end method
