.class public abstract Lorg/jsoup/nodes/Node;
.super Ljava/lang/Object;
.source "Node.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/nodes/Node$OuterHtmlVisitor;
    }
.end annotation


# static fields
.field private static final EMPTY_NODES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/Node;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field attributes:Lorg/jsoup/nodes/Attributes;

.field baseUri:Ljava/lang/String;

.field childNodes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/Node;",
            ">;"
        }
    .end annotation
.end field

.field parentNode:Lorg/jsoup/nodes/Node;

.field siblingIndex:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 21
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/jsoup/nodes/Node;->EMPTY_NODES:Ljava/util/List;

    return-void
.end method

.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    sget-object v0, Lorg/jsoup/nodes/Node;->EMPTY_NODES:Ljava/util/List;

    iput-object v0, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    .line 52
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 43
    new-instance v0, Lorg/jsoup/nodes/Attributes;

    invoke-direct {v0}, Lorg/jsoup/nodes/Attributes;-><init>()V

    invoke-direct {p0, p1, v0}, Lorg/jsoup/nodes/Node;-><init>(Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 44
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V
    .registers 4
    .param p1, "baseUri"    # Ljava/lang/String;
    .param p2, "attributes"    # Lorg/jsoup/nodes/Attributes;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 35
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 37
    sget-object v0, Lorg/jsoup/nodes/Node;->EMPTY_NODES:Ljava/util/List;

    iput-object v0, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    .line 38
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/nodes/Node;->baseUri:Ljava/lang/String;

    .line 39
    iput-object p2, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    .line 40
    return-void
.end method

.method private addSiblingHtml(ILjava/lang/String;)V
    .registers 7
    .param p1, "index"    # I
    .param p2, "html"    # Ljava/lang/String;

    .prologue
    .line 320
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 321
    iget-object v2, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-static {v2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 323
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->parent()Lorg/jsoup/nodes/Node;

    move-result-object v2

    instance-of v2, v2, Lorg/jsoup/nodes/Element;

    if-eqz v2, :cond_31

    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->parent()Lorg/jsoup/nodes/Node;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    move-object v0, v2

    .line 324
    .local v0, "context":Lorg/jsoup/nodes/Element;
    :goto_17
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->baseUri()Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, v0, v2}, Lorg/jsoup/parser/Parser;->parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 325
    .local v1, "nodes":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lorg/jsoup/nodes/Node;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lorg/jsoup/nodes/Node;

    invoke-virtual {v3, p1, v2}, Lorg/jsoup/nodes/Node;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 326
    return-void

    .line 323
    .end local v0    # "context":Lorg/jsoup/nodes/Element;
    .end local v1    # "nodes":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    :cond_31
    const/4 v0, 0x0

    goto :goto_17
.end method

.method private getDeepChild(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 384
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 385
    .local v0, "children":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Element;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_15

    .line 386
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    invoke-direct {p0, v1}, Lorg/jsoup/nodes/Node;->getDeepChild(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/Element;

    move-result-object p1

    .line 388
    .end local p1    # "el":Lorg/jsoup/nodes/Element;
    :cond_15
    return-object p1
.end method

.method private reindexChildren(I)V
    .registers 4
    .param p1, "start"    # I

    .prologue
    .line 462
    move v0, p1

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_17

    .line 463
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Node;

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Node;->setSiblingIndex(I)V

    .line 462
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 465
    :cond_17
    return-void
.end method


# virtual methods
.method public absUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "attributeKey"    # Ljava/lang/String;

    .prologue
    .line 180
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 182
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Node;->hasAttr(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 183
    const-string v0, ""

    .line 185
    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->baseUri:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Node;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/jsoup/helper/StringUtil;->resolve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_b
.end method

.method protected varargs addChildren(I[Lorg/jsoup/nodes/Node;)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "children"    # [Lorg/jsoup/nodes/Node;

    .prologue
    .line 439
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->noNullElements([Ljava/lang/Object;)V

    .line 440
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->ensureChildNodes()V

    .line 441
    array-length v2, p2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_9
    if-ltz v0, :cond_1b

    .line 442
    aget-object v1, p2, v0

    .line 443
    .local v1, "in":Lorg/jsoup/nodes/Node;
    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Node;->reparentChild(Lorg/jsoup/nodes/Node;)V

    .line 444
    iget-object v2, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v2, p1, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 445
    invoke-direct {p0, p1}, Lorg/jsoup/nodes/Node;->reindexChildren(I)V

    .line 441
    add-int/lit8 v0, v0, -0x1

    goto :goto_9

    .line 447
    .end local v1    # "in":Lorg/jsoup/nodes/Node;
    :cond_1b
    return-void
.end method

.method protected varargs addChildren([Lorg/jsoup/nodes/Node;)V
    .registers 6
    .param p1, "children"    # [Lorg/jsoup/nodes/Node;

    .prologue
    .line 430
    array-length v2, p1

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v2, :cond_1f

    aget-object v0, p1, v1

    .line 431
    .local v0, "child":Lorg/jsoup/nodes/Node;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Node;->reparentChild(Lorg/jsoup/nodes/Node;)V

    .line 432
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->ensureChildNodes()V

    .line 433
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 434
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v3}, Lorg/jsoup/nodes/Node;->setSiblingIndex(I)V

    .line 430
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 436
    .end local v0    # "child":Lorg/jsoup/nodes/Node;
    :cond_1f
    return-void
.end method

.method public after(Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 301
    iget v0, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0, p1}, Lorg/jsoup/nodes/Node;->addSiblingHtml(ILjava/lang/String;)V

    .line 302
    return-object p0
.end method

.method public after(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;
    .registers 6
    .param p1, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 312
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 313
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 315
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    iget v1, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    add-int/lit8 v1, v1, 0x1

    const/4 v2, 0x1

    new-array v2, v2, [Lorg/jsoup/nodes/Node;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/nodes/Node;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 316
    return-object p0
.end method

.method public attr(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "attributeKey"    # Ljava/lang/String;

    .prologue
    .line 76
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 78
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 79
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 82
    :goto_11
    return-object v0

    .line 80
    :cond_12
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "abs:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 81
    const-string v0, "abs:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Node;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_11

    .line 82
    :cond_2d
    const-string v0, ""

    goto :goto_11
.end method

.method public attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 4
    .param p1, "attributeKey"    # Ljava/lang/String;
    .param p2, "attributeValue"    # Ljava/lang/String;

    .prologue
    .line 100
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0, p1, p2}, Lorg/jsoup/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    return-object p0
.end method

.method public attributes()Lorg/jsoup/nodes/Attributes;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    return-object v0
.end method

.method public baseUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->baseUri:Ljava/lang/String;

    return-object v0
.end method

.method public before(Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 276
    iget v0, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    invoke-direct {p0, v0, p1}, Lorg/jsoup/nodes/Node;->addSiblingHtml(ILjava/lang/String;)V

    .line 277
    return-object p0
.end method

.method public before(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;
    .registers 6
    .param p1, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 287
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 288
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 290
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    iget v1, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    const/4 v2, 0x1

    new-array v2, v2, [Lorg/jsoup/nodes/Node;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/nodes/Node;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 291
    return-object p0
.end method

.method public childNode(I)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 195
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    return-object v0
.end method

.method public final childNodeSize()I
    .registers 2

    .prologue
    .line 225
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public childNodes()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 204
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected childNodesAsArray()[Lorg/jsoup/nodes/Node;
    .registers 3

    .prologue
    .line 229
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->childNodeSize()I

    move-result v1

    new-array v1, v1, [Lorg/jsoup/nodes/Node;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jsoup/nodes/Node;

    return-object v0
.end method

.method public childNodesCopy()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 213
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 214
    .local v0, "children":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    iget-object v2, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Node;

    .line 215
    .local v1, "node":Lorg/jsoup/nodes/Node;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Node;->clone()Lorg/jsoup/nodes/Node;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 217
    .end local v1    # "node":Lorg/jsoup/nodes/Node;
    :cond_25
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 20
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->clone()Lorg/jsoup/nodes/Node;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/jsoup/nodes/Node;
    .registers 7

    .prologue
    .line 624
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lorg/jsoup/nodes/Node;->doClone(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;

    move-result-object v4

    .line 627
    .local v4, "thisClone":Lorg/jsoup/nodes/Node;
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 628
    .local v3, "nodesToProcess":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Node;>;"
    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 630
    :cond_d
    invoke-virtual {v3}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_39

    .line 631
    invoke-virtual {v3}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Node;

    .line 633
    .local v1, "currParent":Lorg/jsoup/nodes/Node;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1a
    iget-object v5, v1, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_d

    .line 634
    iget-object v5, v1, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jsoup/nodes/Node;

    invoke-virtual {v5, v1}, Lorg/jsoup/nodes/Node;->doClone(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;

    move-result-object v0

    .line 635
    .local v0, "childClone":Lorg/jsoup/nodes/Node;
    iget-object v5, v1, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v5, v2, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 636
    invoke-virtual {v3, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 633
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 640
    .end local v0    # "childClone":Lorg/jsoup/nodes/Node;
    .end local v1    # "currParent":Lorg/jsoup/nodes/Node;
    .end local v2    # "i":I
    :cond_39
    return-object v4
.end method

.method protected doClone(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;
    .registers 7
    .param p1, "parent"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 651
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Node;
    :try_end_6
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_6} :catch_42

    .line 656
    .local v1, "clone":Lorg/jsoup/nodes/Node;
    iput-object p1, v1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    .line 657
    if-nez p1, :cond_49

    const/4 v3, 0x0

    :goto_b
    iput v3, v1, Lorg/jsoup/nodes/Node;->siblingIndex:I

    .line 658
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    if-eqz v3, :cond_4c

    iget-object v3, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v3}, Lorg/jsoup/nodes/Attributes;->clone()Lorg/jsoup/nodes/Attributes;

    move-result-object v3

    :goto_17
    iput-object v3, v1, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    .line 659
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->baseUri:Ljava/lang/String;

    iput-object v3, v1, Lorg/jsoup/nodes/Node;->baseUri:Ljava/lang/String;

    .line 660
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v3, v1, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    .line 662
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_30
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 663
    .local v0, "child":Lorg/jsoup/nodes/Node;
    iget-object v4, v1, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_30

    .line 652
    .end local v0    # "child":Lorg/jsoup/nodes/Node;
    .end local v1    # "clone":Lorg/jsoup/nodes/Node;
    :catch_42
    move-exception v2

    .line 653
    .local v2, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 657
    .end local v2    # "e":Ljava/lang/CloneNotSupportedException;
    .restart local v1    # "clone":Lorg/jsoup/nodes/Node;
    :cond_49
    iget v3, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    goto :goto_b

    .line 658
    :cond_4c
    const/4 v3, 0x0

    goto :goto_17

    .line 665
    :cond_4e
    return-object v1
.end method

.method protected ensureChildNodes()V
    .registers 3

    .prologue
    .line 450
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    sget-object v1, Lorg/jsoup/nodes/Node;->EMPTY_NODES:Ljava/util/List;

    if-ne v0, v1, :cond_e

    .line 451
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    .line 453
    :cond_e
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 596
    if-ne p0, p1, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method getOutputSettings()Lorg/jsoup/nodes/Document$OutputSettings;
    .registers 3

    .prologue
    .line 556
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->ownerDocument()Lorg/jsoup/nodes/Document;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->ownerDocument()Lorg/jsoup/nodes/Document;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->outputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v0

    :goto_e
    return-object v0

    :cond_f
    new-instance v0, Lorg/jsoup/nodes/Document;

    const-string v1, ""

    invoke-direct {v0, v1}, Lorg/jsoup/nodes/Document;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->outputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v0

    goto :goto_e
.end method

.method public hasAttr(Ljava/lang/String;)Z
    .registers 5
    .param p1, "attributeKey"    # Ljava/lang/String;

    .prologue
    .line 110
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 112
    const-string v1, "abs:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 113
    const-string v1, "abs:"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 114
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Node;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2b

    .line 115
    const/4 v1, 0x1

    .line 117
    .end local v0    # "key":Ljava/lang/String;
    :goto_2a
    return v1

    :cond_2b
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v1, p1}, Lorg/jsoup/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v1

    goto :goto_2a
.end method

.method public hasSameValue(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 607
    if-ne p0, p1, :cond_4

    const/4 v1, 0x1

    .line 611
    .end local p1    # "o":Ljava/lang/Object;
    :goto_3
    return v1

    .line 608
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_4
    if-eqz p1, :cond_10

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_12

    :cond_10
    const/4 v1, 0x0

    goto :goto_3

    :cond_12
    move-object v0, p1

    .line 610
    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 611
    .local v0, "node":Lorg/jsoup/nodes/Node;
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->outerHtml()Ljava/lang/String;

    move-result-object v1

    check-cast p1, Lorg/jsoup/nodes/Node;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jsoup/nodes/Node;->outerHtml()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_3
.end method

.method public html(Ljava/lang/Appendable;)Ljava/lang/Appendable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Appendable;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 575
    .local p1, "appendable":Ljava/lang/Appendable;, "TT;"
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Node;->outerHtml(Ljava/lang/Appendable;)V

    .line 576
    return-object p1
.end method

.method protected indent(Ljava/lang/Appendable;ILorg/jsoup/nodes/Document$OutputSettings;)V
    .registers 6
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 584
    const-string v0, "\n"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    invoke-virtual {p3}, Lorg/jsoup/nodes/Document$OutputSettings;->indentAmount()I

    move-result v1

    mul-int/2addr v1, p2

    invoke-static {v1}, Lorg/jsoup/helper/StringUtil;->padding(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 585
    return-void
.end method

.method public nextSibling()Lorg/jsoup/nodes/Node;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 489
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v3, :cond_6

    .line 497
    :cond_5
    :goto_5
    return-object v2

    .line 492
    :cond_6
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    iget-object v1, v3, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    .line 493
    .local v1, "siblings":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    iget v3, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    add-int/lit8 v0, v3, 0x1

    .line 494
    .local v0, "index":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-le v3, v0, :cond_5

    .line 495
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Node;

    goto :goto_5
.end method

.method public abstract nodeName()Ljava/lang/String;
.end method

.method public outerHtml()Ljava/lang/String;
    .registers 3

    .prologue
    .line 545
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 546
    .local v0, "accum":Ljava/lang/StringBuilder;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Node;->outerHtml(Ljava/lang/Appendable;)V

    .line 547
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected outerHtml(Ljava/lang/Appendable;)V
    .registers 5
    .param p1, "accum"    # Ljava/lang/Appendable;

    .prologue
    .line 551
    new-instance v0, Lorg/jsoup/select/NodeTraversor;

    new-instance v1, Lorg/jsoup/nodes/Node$OuterHtmlVisitor;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->getOutputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Lorg/jsoup/nodes/Node$OuterHtmlVisitor;-><init>(Ljava/lang/Appendable;Lorg/jsoup/nodes/Document$OutputSettings;)V

    invoke-direct {v0, v1}, Lorg/jsoup/select/NodeTraversor;-><init>(Lorg/jsoup/select/NodeVisitor;)V

    invoke-virtual {v0, p0}, Lorg/jsoup/select/NodeTraversor;->traverse(Lorg/jsoup/nodes/Node;)V

    .line 552
    return-void
.end method

.method abstract outerHtmlHead(Ljava/lang/Appendable;ILorg/jsoup/nodes/Document$OutputSettings;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract outerHtmlTail(Ljava/lang/Appendable;ILorg/jsoup/nodes/Document$OutputSettings;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public ownerDocument()Lorg/jsoup/nodes/Document;
    .registers 2

    .prologue
    .line 253
    instance-of v0, p0, Lorg/jsoup/nodes/Document;

    if-eqz v0, :cond_7

    .line 254
    check-cast p0, Lorg/jsoup/nodes/Document;

    .line 258
    .end local p0    # "this":Lorg/jsoup/nodes/Node;
    :goto_6
    return-object p0

    .line 255
    .restart local p0    # "this":Lorg/jsoup/nodes/Node;
    :cond_7
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v0, :cond_d

    .line 256
    const/4 p0, 0x0

    goto :goto_6

    .line 258
    :cond_d
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Node;->ownerDocument()Lorg/jsoup/nodes/Document;

    move-result-object p0

    goto :goto_6
.end method

.method public parent()Lorg/jsoup/nodes/Node;
    .registers 2

    .prologue
    .line 237
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    return-object v0
.end method

.method public final parentNode()Lorg/jsoup/nodes/Node;
    .registers 2

    .prologue
    .line 245
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    return-object v0
.end method

.method public previousSibling()Lorg/jsoup/nodes/Node;
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 505
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v1, :cond_6

    .line 511
    :cond_5
    :goto_5
    return-object v0

    .line 508
    :cond_6
    iget v1, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    if-lez v1, :cond_5

    .line 509
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    iget-object v0, v0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    iget v1, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    goto :goto_5
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 265
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 266
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v0, p0}, Lorg/jsoup/nodes/Node;->removeChild(Lorg/jsoup/nodes/Node;)V

    .line 267
    return-void
.end method

.method public removeAttr(Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "attributeKey"    # Ljava/lang/String;

    .prologue
    .line 126
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 127
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Attributes;->remove(Ljava/lang/String;)V

    .line 128
    return-object p0
.end method

.method protected removeChild(Lorg/jsoup/nodes/Node;)V
    .registers 4
    .param p1, "out"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 421
    iget-object v1, p1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-ne v1, p0, :cond_16

    const/4 v1, 0x1

    :goto_5
    invoke-static {v1}, Lorg/jsoup/helper/Validate;->isTrue(Z)V

    .line 422
    iget v0, p1, Lorg/jsoup/nodes/Node;->siblingIndex:I

    .line 423
    .local v0, "index":I
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 424
    invoke-direct {p0, v0}, Lorg/jsoup/nodes/Node;->reindexChildren(I)V

    .line 425
    const/4 v1, 0x0

    iput-object v1, p1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    .line 426
    return-void

    .line 421
    .end local v0    # "index":I
    :cond_16
    const/4 v1, 0x0

    goto :goto_5
.end method

.method protected reparentChild(Lorg/jsoup/nodes/Node;)V
    .registers 3
    .param p1, "child"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 456
    iget-object v0, p1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-eqz v0, :cond_9

    .line 457
    iget-object v0, p1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Node;->removeChild(Lorg/jsoup/nodes/Node;)V

    .line 458
    :cond_9
    invoke-virtual {p1, p0}, Lorg/jsoup/nodes/Node;->setParentNode(Lorg/jsoup/nodes/Node;)V

    .line 459
    return-void
.end method

.method protected replaceChild(Lorg/jsoup/nodes/Node;Lorg/jsoup/nodes/Node;)V
    .registers 5
    .param p1, "out"    # Lorg/jsoup/nodes/Node;
    .param p2, "in"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 408
    iget-object v1, p1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-ne v1, p0, :cond_24

    const/4 v1, 0x1

    :goto_5
    invoke-static {v1}, Lorg/jsoup/helper/Validate;->isTrue(Z)V

    .line 409
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 410
    iget-object v1, p2, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-eqz v1, :cond_14

    .line 411
    iget-object v1, p2, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v1, p2}, Lorg/jsoup/nodes/Node;->removeChild(Lorg/jsoup/nodes/Node;)V

    .line 413
    :cond_14
    iget v0, p1, Lorg/jsoup/nodes/Node;->siblingIndex:I

    .line 414
    .local v0, "index":I
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v1, v0, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 415
    iput-object p0, p2, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    .line 416
    invoke-virtual {p2, v0}, Lorg/jsoup/nodes/Node;->setSiblingIndex(I)V

    .line 417
    const/4 v1, 0x0

    iput-object v1, p1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    .line 418
    return-void

    .line 408
    .end local v0    # "index":I
    :cond_24
    const/4 v1, 0x0

    goto :goto_5
.end method

.method public replaceWith(Lorg/jsoup/nodes/Node;)V
    .registers 3
    .param p1, "in"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 396
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 397
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 398
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v0, p0, p1}, Lorg/jsoup/nodes/Node;->replaceChild(Lorg/jsoup/nodes/Node;Lorg/jsoup/nodes/Node;)V

    .line 399
    return-void
.end method

.method public setBaseUri(Ljava/lang/String;)V
    .registers 3
    .param p1, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 144
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 146
    new-instance v0, Lorg/jsoup/nodes/Node$1;

    invoke-direct {v0, p0, p1}, Lorg/jsoup/nodes/Node$1;-><init>(Lorg/jsoup/nodes/Node;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Node;->traverse(Lorg/jsoup/select/NodeVisitor;)Lorg/jsoup/nodes/Node;

    .line 154
    return-void
.end method

.method protected setParentNode(Lorg/jsoup/nodes/Node;)V
    .registers 3
    .param p1, "parentNode"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 402
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-eqz v0, :cond_9

    .line 403
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v0, p0}, Lorg/jsoup/nodes/Node;->removeChild(Lorg/jsoup/nodes/Node;)V

    .line 404
    :cond_9
    iput-object p1, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    .line 405
    return-void
.end method

.method protected setSiblingIndex(I)V
    .registers 2
    .param p1, "siblingIndex"    # I

    .prologue
    .line 525
    iput p1, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    .line 526
    return-void
.end method

.method public siblingIndex()I
    .registers 2

    .prologue
    .line 521
    iget v0, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    return v0
.end method

.method public siblingNodes()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 473
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v3, :cond_9

    .line 474
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    .line 481
    :cond_8
    return-object v2

    .line 476
    :cond_9
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    iget-object v1, v3, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    .line 477
    .local v1, "nodes":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 478
    .local v2, "siblings":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1c
    :goto_1c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 479
    .local v0, "node":Lorg/jsoup/nodes/Node;
    if-eq v0, p0, :cond_1c

    .line 480
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1c
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 580
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public traverse(Lorg/jsoup/select/NodeVisitor;)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "nodeVisitor"    # Lorg/jsoup/select/NodeVisitor;

    .prologue
    .line 534
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 535
    new-instance v0, Lorg/jsoup/select/NodeTraversor;

    invoke-direct {v0, p1}, Lorg/jsoup/select/NodeTraversor;-><init>(Lorg/jsoup/select/NodeVisitor;)V

    .line 536
    .local v0, "traversor":Lorg/jsoup/select/NodeTraversor;
    invoke-virtual {v0, p0}, Lorg/jsoup/select/NodeTraversor;->traverse(Lorg/jsoup/nodes/Node;)V

    .line 537
    return-object p0
.end method

.method public unwrap()Lorg/jsoup/nodes/Node;
    .registers 5

    .prologue
    .line 374
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-static {v1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 376
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_26

    iget-object v1, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Node;

    move-object v0, v1

    .line 377
    .local v0, "firstChild":Lorg/jsoup/nodes/Node;
    :goto_17
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    iget v2, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->childNodesAsArray()[Lorg/jsoup/nodes/Node;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/jsoup/nodes/Node;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 378
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->remove()V

    .line 380
    return-object v0

    .line 376
    .end local v0    # "firstChild":Lorg/jsoup/nodes/Node;
    :cond_26
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public wrap(Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 12
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    const/4 v9, 0x0

    .line 334
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 336
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->parent()Lorg/jsoup/nodes/Node;

    move-result-object v7

    instance-of v7, v7, Lorg/jsoup/nodes/Element;

    if-eqz v7, :cond_2a

    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->parent()Lorg/jsoup/nodes/Node;

    move-result-object v7

    check-cast v7, Lorg/jsoup/nodes/Element;

    move-object v0, v7

    .line 337
    .local v0, "context":Lorg/jsoup/nodes/Element;
    :goto_14
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->baseUri()Ljava/lang/String;

    move-result-object v7

    invoke-static {p1, v0, v7}, Lorg/jsoup/parser/Parser;->parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    .line 338
    .local v5, "wrapChildren":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jsoup/nodes/Node;

    .line 339
    .local v6, "wrapNode":Lorg/jsoup/nodes/Node;
    if-eqz v6, :cond_28

    instance-of v7, v6, Lorg/jsoup/nodes/Element;

    if-nez v7, :cond_2c

    :cond_28
    move-object p0, v8

    .line 355
    .end local p0    # "this":Lorg/jsoup/nodes/Node;
    :cond_29
    return-object p0

    .end local v0    # "context":Lorg/jsoup/nodes/Element;
    .end local v5    # "wrapChildren":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    .end local v6    # "wrapNode":Lorg/jsoup/nodes/Node;
    .restart local p0    # "this":Lorg/jsoup/nodes/Node;
    :cond_2a
    move-object v0, v8

    .line 336
    goto :goto_14

    .restart local v0    # "context":Lorg/jsoup/nodes/Element;
    .restart local v5    # "wrapChildren":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    .restart local v6    # "wrapNode":Lorg/jsoup/nodes/Node;
    :cond_2c
    move-object v4, v6

    .line 342
    check-cast v4, Lorg/jsoup/nodes/Element;

    .line 343
    .local v4, "wrap":Lorg/jsoup/nodes/Element;
    invoke-direct {p0, v4}, Lorg/jsoup/nodes/Node;->getDeepChild(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    .line 344
    .local v1, "deepest":Lorg/jsoup/nodes/Element;
    iget-object v7, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v7, p0, v4}, Lorg/jsoup/nodes/Node;->replaceChild(Lorg/jsoup/nodes/Node;Lorg/jsoup/nodes/Node;)V

    .line 345
    const/4 v7, 0x1

    new-array v7, v7, [Lorg/jsoup/nodes/Node;

    aput-object p0, v7, v9

    invoke-virtual {v1, v7}, Lorg/jsoup/nodes/Element;->addChildren([Lorg/jsoup/nodes/Node;)V

    .line 348
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_29

    .line 349
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_47
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    if-ge v2, v7, :cond_29

    .line 350
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Node;

    .line 351
    .local v3, "remainder":Lorg/jsoup/nodes/Node;
    iget-object v7, v3, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v7, v3}, Lorg/jsoup/nodes/Node;->removeChild(Lorg/jsoup/nodes/Node;)V

    .line 352
    invoke-virtual {v4, v3}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 349
    add-int/lit8 v2, v2, 0x1

    goto :goto_47
.end method
