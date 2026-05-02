.class public final Lorg/jsoup/select/Evaluator$IsEmpty;
.super Lorg/jsoup/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IsEmpty"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 593
    invoke-direct {p0}, Lorg/jsoup/select/Evaluator;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Lorg/jsoup/nodes/Element;Lorg/jsoup/nodes/Element;)Z
    .registers 7
    .param p1, "root"    # Lorg/jsoup/nodes/Element;
    .param p2, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 596
    invoke-virtual {p2}, Lorg/jsoup/nodes/Element;->childNodes()Ljava/util/List;

    move-result-object v0

    .line 597
    .local v0, "family":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_22

    .line 598
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Node;

    .line 599
    .local v2, "n":Lorg/jsoup/nodes/Node;
    instance-of v3, v2, Lorg/jsoup/nodes/Comment;

    if-nez v3, :cond_1f

    instance-of v3, v2, Lorg/jsoup/nodes/XmlDeclaration;

    if-nez v3, :cond_1f

    instance-of v3, v2, Lorg/jsoup/nodes/DocumentType;

    if-nez v3, :cond_1f

    const/4 v3, 0x0

    .line 601
    .end local v2    # "n":Lorg/jsoup/nodes/Node;
    :goto_1e
    return v3

    .line 597
    .restart local v2    # "n":Lorg/jsoup/nodes/Node;
    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 601
    .end local v2    # "n":Lorg/jsoup/nodes/Node;
    :cond_22
    const/4 v3, 0x1

    goto :goto_1e
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 605
    const-string v0, ":empty"

    return-object v0
.end method
