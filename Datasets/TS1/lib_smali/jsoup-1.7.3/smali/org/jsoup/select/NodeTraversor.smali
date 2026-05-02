.class public Lorg/jsoup/select/NodeTraversor;
.super Ljava/lang/Object;
.source "NodeTraversor.java"


# instance fields
.field private visitor:Lorg/jsoup/select/NodeVisitor;


# direct methods
.method public constructor <init>(Lorg/jsoup/select/NodeVisitor;)V
    .registers 2
    .param p1, "visitor"    # Lorg/jsoup/select/NodeVisitor;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lorg/jsoup/select/NodeTraversor;->visitor:Lorg/jsoup/select/NodeVisitor;

    .line 19
    return-void
.end method


# virtual methods
.method public traverse(Lorg/jsoup/nodes/Node;)V
    .registers 5
    .param p1, "root"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 26
    move-object v1, p1

    .line 27
    .local v1, "node":Lorg/jsoup/nodes/Node;
    const/4 v0, 0x0

    .line 29
    .local v0, "depth":I
    :goto_2
    if-eqz v1, :cond_32

    .line 30
    iget-object v2, p0, Lorg/jsoup/select/NodeTraversor;->visitor:Lorg/jsoup/select/NodeVisitor;

    invoke-interface {v2, v1, v0}, Lorg/jsoup/select/NodeVisitor;->head(Lorg/jsoup/nodes/Node;I)V

    .line 31
    invoke-virtual {v1}, Lorg/jsoup/nodes/Node;->childNodeSize()I

    move-result v2

    if-lez v2, :cond_17

    .line 32
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Node;->childNode(I)Lorg/jsoup/nodes/Node;

    move-result-object v1

    .line 33
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 35
    :cond_17
    :goto_17
    invoke-virtual {v1}, Lorg/jsoup/nodes/Node;->nextSibling()Lorg/jsoup/nodes/Node;

    move-result-object v2

    if-nez v2, :cond_2b

    if-lez v0, :cond_2b

    .line 36
    iget-object v2, p0, Lorg/jsoup/select/NodeTraversor;->visitor:Lorg/jsoup/select/NodeVisitor;

    invoke-interface {v2, v1, v0}, Lorg/jsoup/select/NodeVisitor;->tail(Lorg/jsoup/nodes/Node;I)V

    .line 37
    invoke-virtual {v1}, Lorg/jsoup/nodes/Node;->parentNode()Lorg/jsoup/nodes/Node;

    move-result-object v1

    .line 38
    add-int/lit8 v0, v0, -0x1

    goto :goto_17

    .line 40
    :cond_2b
    iget-object v2, p0, Lorg/jsoup/select/NodeTraversor;->visitor:Lorg/jsoup/select/NodeVisitor;

    invoke-interface {v2, v1, v0}, Lorg/jsoup/select/NodeVisitor;->tail(Lorg/jsoup/nodes/Node;I)V

    .line 41
    if-ne v1, p1, :cond_33

    .line 46
    :cond_32
    return-void

    .line 43
    :cond_33
    invoke-virtual {v1}, Lorg/jsoup/nodes/Node;->nextSibling()Lorg/jsoup/nodes/Node;

    move-result-object v1

    goto :goto_2
.end method
