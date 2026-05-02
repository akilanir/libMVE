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
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    .line 51
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 42
    new-instance v0, Lorg/jsoup/nodes/Attributes;

    invoke-direct {v0}, Lorg/jsoup/nodes/Attributes;-><init>()V

    invoke-direct {p0, p1, v0}, Lorg/jsoup/nodes/Node;-><init>(Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 43
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V
    .registers 5
    .param p1, "baseUri"    # Ljava/lang/String;
    .param p2, "attributes"    # Lorg/jsoup/nodes/Attributes;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 34
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    .line 37
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/nodes/Node;->baseUri:Ljava/lang/String;

    .line 38
    iput-object p2, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    .line 39
    return-void
.end method

.method private addSiblingHtml(ILjava/lang/String;)V
    .registers 7
    .param p1, "index"    # I
    .param p2, "html"    # Ljava/lang/String;

    .prologue
    .line 336
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 337
    iget-object v2, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-static {v2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 339
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->parent()Lorg/jsoup/nodes/Node;

    move-result-object v2

    instance-of v2, v2, Lorg/jsoup/nodes/Element;

    if-eqz v2, :cond_31

    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->parent()Lorg/jsoup/nodes/Node;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    move-object v0, v2

    .line 340
    .local v0, "context":Lorg/jsoup/nodes/Element;
    :goto_17
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->baseUri()Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, v0, v2}, Lorg/jsoup/parser/Parser;->parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 341
    .local v1, "nodes":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lorg/jsoup/nodes/Node;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lorg/jsoup/nodes/Node;

    invoke-virtual {v3, p1, v2}, Lorg/jsoup/nodes/Node;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 342
    return-void

    .line 339
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
    .line 400
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 401
    .local v0, "children":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Element;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_15

    .line 402
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    invoke-direct {p0, v1}, Lorg/jsoup/nodes/Node;->getDeepChild(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/Element;

    move-result-object p1

    .line 404
    .end local p1    # "el":Lorg/jsoup/nodes/Element;
    :cond_15
    return-object p1
.end method

.method private reindexChildren(I)V
    .registers 4
    .param p1, "start"    # I

    .prologue
    .line 470
    move v0, p1

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_17

    .line 471
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Node;

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Node;->setSiblingIndex(I)V

    .line 470
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 473
    :cond_17
    return-void
.end method


# virtual methods
.method public absUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "attributeKey"    # Ljava/lang/String;

    .prologue
    .line 179
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 181
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Node;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 182
    .local v3, "relUrl":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Node;->hasAttr(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_10

    .line 183
    const-string v4, ""

    .line 200
    :goto_f
    return-object v4

    .line 188
    :cond_10
    :try_start_10
    new-instance v1, Ljava/net/URL;

    iget-object v4, p0, Lorg/jsoup/nodes/Node;->baseUri:Ljava/lang/String;

    invoke-direct {v1, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_17
    .catch Ljava/net/MalformedURLException; {:try_start_10 .. :try_end_17} :catch_3e

    .line 195
    .local v1, "base":Ljava/net/URL;
    :try_start_17
    const-string v4, "?"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_34

    .line 196
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 197
    :cond_34
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v1, v3}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 198
    .local v0, "abs":Ljava/net/URL;
    invoke-virtual {v0}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v4

    goto :goto_f

    .line 189
    .end local v0    # "abs":Ljava/net/URL;
    .end local v1    # "base":Ljava/net/URL;
    :catch_3e
    move-exception v2

    .line 191
    .local v2, "e":Ljava/net/MalformedURLException;
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 192
    .restart local v0    # "abs":Ljava/net/URL;
    invoke-virtual {v0}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;
    :try_end_47
    .catch Ljava/net/MalformedURLException; {:try_start_17 .. :try_end_47} :catch_49

    move-result-object v4

    goto :goto_f

    .line 199
    .end local v0    # "abs":Ljava/net/URL;
    .end local v2    # "e":Ljava/net/MalformedURLException;
    :catch_49
    move-exception v2

    .line 200
    .restart local v2    # "e":Ljava/net/MalformedURLException;
    const-string v4, ""

    goto :goto_f
.end method

.method protected varargs addChildren(I[Lorg/jsoup/nodes/Node;)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "children"    # [Lorg/jsoup/nodes/Node;

    .prologue
    .line 454
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->noNullElements([Ljava/lang/Object;)V

    .line 455
    array-length v2, p2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_6
    if-ltz v0, :cond_15

    .line 456
    aget-object v1, p2, v0

    .line 457
    .local v1, "in":Lorg/jsoup/nodes/Node;
    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Node;->reparentChild(Lorg/jsoup/nodes/Node;)V

    .line 458
    iget-object v2, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v2, p1, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 455
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 460
    .end local v1    # "in":Lorg/jsoup/nodes/Node;
    :cond_15
    invoke-direct {p0, p1}, Lorg/jsoup/nodes/Node;->reindexChildren(I)V

    .line 461
    return-void
.end method

.method protected varargs addChildren([Lorg/jsoup/nodes/Node;)V
    .registers 7
    .param p1, "children"    # [Lorg/jsoup/nodes/Node;

    .prologue
    .line 446
    move-object v0, p1

    .local v0, "arr$":[Lorg/jsoup/nodes/Node;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_3
    if-ge v2, v3, :cond_1d

    aget-object v1, v0, v2

    .line 447
    .local v1, "child":Lorg/jsoup/nodes/Node;
    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Node;->reparentChild(Lorg/jsoup/nodes/Node;)V

    .line 448
    iget-object v4, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 449
    iget-object v4, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v1, v4}, Lorg/jsoup/nodes/Node;->setSiblingIndex(I)V

    .line 446
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 451
    .end local v1    # "child":Lorg/jsoup/nodes/Node;
    :cond_1d
    return-void
.end method

.method public after(Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 317
    iget v0, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0, p1}, Lorg/jsoup/nodes/Node;->addSiblingHtml(ILjava/lang/String;)V

    .line 318
    return-object p0
.end method

.method public after(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;
    .registers 6
    .param p1, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 328
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 329
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 331
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    iget v1, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    add-int/lit8 v1, v1, 0x1

    const/4 v2, 0x1

    new-array v2, v2, [Lorg/jsoup/nodes/Node;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/nodes/Node;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 332
    return-object p0
.end method

.method public attr(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "attributeKey"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 77
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 78
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 81
    :goto_11
    return-object v0

    .line 79
    :cond_12
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "abs:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 80
    const-string v0, "abs:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Node;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_11

    .line 81
    :cond_2d
    const-string v0, ""

    goto :goto_11
.end method

.method public attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 4
    .param p1, "attributeKey"    # Ljava/lang/String;
    .param p2, "attributeValue"    # Ljava/lang/String;

    .prologue
    .line 99
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0, p1, p2}, Lorg/jsoup/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    return-object p0
.end method

.method public attributes()Lorg/jsoup/nodes/Attributes;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    return-object v0
.end method

.method public baseUri()Ljava/lang/String;
    .registers 2

    .prologue
    .line 135
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->baseUri:Ljava/lang/String;

    return-object v0
.end method

.method public before(Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 292
    iget v0, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    invoke-direct {p0, v0, p1}, Lorg/jsoup/nodes/Node;->addSiblingHtml(ILjava/lang/String;)V

    .line 293
    return-object p0
.end method

.method public before(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;
    .registers 6
    .param p1, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 303
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 304
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 306
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    iget v1, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    const/4 v2, 0x1

    new-array v2, v2, [Lorg/jsoup/nodes/Node;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/nodes/Node;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 307
    return-object p0
.end method

.method public childNode(I)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 211
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    return-object v0
.end method

.method public final childNodeSize()I
    .registers 2

    .prologue
    .line 241
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
    .line 220
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected childNodesAsArray()[Lorg/jsoup/nodes/Node;
    .registers 3

    .prologue
    .line 245
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
    .line 229
    new-instance v0, Ljava/util/ArrayList;

    iget-object v3, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 230
    .local v0, "children":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Node;

    .line 231
    .local v2, "node":Lorg/jsoup/nodes/Node;
    invoke-virtual {v2}, Lorg/jsoup/nodes/Node;->clone()Lorg/jsoup/nodes/Node;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 233
    .end local v2    # "node":Lorg/jsoup/nodes/Node;
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
    .line 625
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lorg/jsoup/nodes/Node;->doClone(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;

    move-result-object v4

    .line 628
    .local v4, "thisClone":Lorg/jsoup/nodes/Node;
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 629
    .local v3, "nodesToProcess":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/jsoup/nodes/Node;>;"
    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 631
    :cond_d
    invoke-virtual {v3}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_39

    .line 632
    invoke-virtual {v3}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Node;

    .line 634
    .local v1, "currParent":Lorg/jsoup/nodes/Node;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1a
    iget-object v5, v1, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_d

    .line 635
    iget-object v5, v1, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jsoup/nodes/Node;

    invoke-virtual {v5, v1}, Lorg/jsoup/nodes/Node;->doClone(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;

    move-result-object v0

    .line 636
    .local v0, "childClone":Lorg/jsoup/nodes/Node;
    iget-object v5, v1, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v5, v2, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 637
    invoke-virtual {v3, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 634
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 641
    .end local v0    # "childClone":Lorg/jsoup/nodes/Node;
    .end local v1    # "currParent":Lorg/jsoup/nodes/Node;
    .end local v2    # "i":I
    :cond_39
    return-object v4
.end method

.method protected doClone(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;
    .registers 8
    .param p1, "parent"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 652
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Node;
    :try_end_6
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_6} :catch_42

    .line 657
    .local v1, "clone":Lorg/jsoup/nodes/Node;
    iput-object p1, v1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    .line 658
    if-nez p1, :cond_49

    const/4 v4, 0x0

    :goto_b
    iput v4, v1, Lorg/jsoup/nodes/Node;->siblingIndex:I

    .line 659
    iget-object v4, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    if-eqz v4, :cond_4c

    iget-object v4, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v4}, Lorg/jsoup/nodes/Attributes;->clone()Lorg/jsoup/nodes/Attributes;

    move-result-object v4

    :goto_17
    iput-object v4, v1, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    .line 660
    iget-object v4, p0, Lorg/jsoup/nodes/Node;->baseUri:Ljava/lang/String;

    iput-object v4, v1, Lorg/jsoup/nodes/Node;->baseUri:Ljava/lang/String;

    .line 661
    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v4, v1, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    .line 663
    iget-object v4, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_30
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 664
    .local v0, "child":Lorg/jsoup/nodes/Node;
    iget-object v4, v1, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_30

    .line 653
    .end local v0    # "child":Lorg/jsoup/nodes/Node;
    .end local v1    # "clone":Lorg/jsoup/nodes/Node;
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_42
    move-exception v2

    .line 654
    .local v2, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 658
    .end local v2    # "e":Ljava/lang/CloneNotSupportedException;
    .restart local v1    # "clone":Lorg/jsoup/nodes/Node;
    :cond_49
    iget v4, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    goto :goto_b

    .line 659
    :cond_4c
    const/4 v4, 0x0

    goto :goto_17

    .line 666
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_4e
    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 592
    if-ne p0, p1, :cond_5

    .line 598
    :cond_4
    :goto_4
    return v1

    .line 593
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 595
    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 597
    .local v0, "node":Lorg/jsoup/nodes/Node;
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    if-eqz v3, :cond_26

    iget-object v3, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    iget-object v4, v0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2a

    :cond_24
    move v1, v2

    goto :goto_4

    :cond_26
    iget-object v3, v0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    if-nez v3, :cond_24

    .line 598
    :cond_2a
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    if-eqz v3, :cond_3a

    iget-object v3, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    iget-object v4, v0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v3, v4}, Lorg/jsoup/nodes/Attributes;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_38
    move v1, v2

    goto :goto_4

    :cond_3a
    iget-object v3, v0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    if-nez v3, :cond_38

    goto :goto_4
.end method

.method getOutputSettings()Lorg/jsoup/nodes/Document$OutputSettings;
    .registers 3

    .prologue
    .line 564
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
    .line 109
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 111
    const-string v1, "abs:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 112
    const-string v1, "abs:"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 113
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

    .line 114
    const/4 v1, 0x1

    .line 116
    .end local v0    # "key":Ljava/lang/String;
    :goto_2a
    return v1

    :cond_2b
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v1, p1}, Lorg/jsoup/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v1

    goto :goto_2a
.end method

.method public hashCode()I
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 610
    iget-object v2, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    if-eqz v2, :cond_1a

    iget-object v2, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 611
    .local v0, "result":I
    :goto_b
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    if-eqz v3, :cond_17

    iget-object v1, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v1}, Lorg/jsoup/nodes/Attributes;->hashCode()I

    move-result v1

    :cond_17
    add-int v0, v2, v1

    .line 612
    return v0

    .end local v0    # "result":I
    :cond_1a
    move v0, v1

    .line 610
    goto :goto_b
.end method

.method protected indent(Ljava/lang/StringBuilder;ILorg/jsoup/nodes/Document$OutputSettings;)V
    .registers 6
    .param p1, "accum"    # Ljava/lang/StringBuilder;
    .param p2, "depth"    # I
    .param p3, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;

    .prologue
    .line 581
    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p3}, Lorg/jsoup/nodes/Document$OutputSettings;->indentAmount()I

    move-result v1

    mul-int/2addr v1, p2

    invoke-static {v1}, Lorg/jsoup/helper/StringUtil;->padding(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 582
    return-void
.end method

.method public nextSibling()Lorg/jsoup/nodes/Node;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 497
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v3, :cond_6

    .line 505
    :cond_5
    :goto_5
    return-object v2

    .line 500
    :cond_6
    iget-object v3, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    iget-object v1, v3, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    .line 501
    .local v1, "siblings":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    iget v3, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    add-int/lit8 v0, v3, 0x1

    .line 502
    .local v0, "index":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-le v3, v0, :cond_5

    .line 503
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
    .line 553
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 554
    .local v0, "accum":Ljava/lang/StringBuilder;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Node;->outerHtml(Ljava/lang/StringBuilder;)V

    .line 555
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected outerHtml(Ljava/lang/StringBuilder;)V
    .registers 5
    .param p1, "accum"    # Ljava/lang/StringBuilder;

    .prologue
    .line 559
    new-instance v0, Lorg/jsoup/select/NodeTraversor;

    new-instance v1, Lorg/jsoup/nodes/Node$OuterHtmlVisitor;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->getOutputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Lorg/jsoup/nodes/Node$OuterHtmlVisitor;-><init>(Ljava/lang/StringBuilder;Lorg/jsoup/nodes/Document$OutputSettings;)V

    invoke-direct {v0, v1}, Lorg/jsoup/select/NodeTraversor;-><init>(Lorg/jsoup/select/NodeVisitor;)V

    invoke-virtual {v0, p0}, Lorg/jsoup/select/NodeTraversor;->traverse(Lorg/jsoup/nodes/Node;)V

    .line 560
    return-void
.end method

.method abstract outerHtmlHead(Ljava/lang/StringBuilder;ILorg/jsoup/nodes/Document$OutputSettings;)V
.end method

.method abstract outerHtmlTail(Ljava/lang/StringBuilder;ILorg/jsoup/nodes/Document$OutputSettings;)V
.end method

.method public ownerDocument()Lorg/jsoup/nodes/Document;
    .registers 2

    .prologue
    .line 269
    instance-of v0, p0, Lorg/jsoup/nodes/Document;

    if-eqz v0, :cond_7

    .line 270
    check-cast p0, Lorg/jsoup/nodes/Document;

    .line 274
    .end local p0    # "this":Lorg/jsoup/nodes/Node;
    :goto_6
    return-object p0

    .line 271
    .restart local p0    # "this":Lorg/jsoup/nodes/Node;
    :cond_7
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v0, :cond_d

    .line 272
    const/4 p0, 0x0

    goto :goto_6

    .line 274
    :cond_d
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Node;->ownerDocument()Lorg/jsoup/nodes/Document;

    move-result-object p0

    goto :goto_6
.end method

.method public parent()Lorg/jsoup/nodes/Node;
    .registers 2

    .prologue
    .line 253
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    return-object v0
.end method

.method public final parentNode()Lorg/jsoup/nodes/Node;
    .registers 2

    .prologue
    .line 261
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    return-object v0
.end method

.method public previousSibling()Lorg/jsoup/nodes/Node;
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 513
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v1, :cond_6

    .line 519
    :cond_5
    :goto_5
    return-object v0

    .line 516
    :cond_6
    iget v1, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    if-lez v1, :cond_5

    .line 517
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
    .line 281
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 282
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v0, p0}, Lorg/jsoup/nodes/Node;->removeChild(Lorg/jsoup/nodes/Node;)V

    .line 283
    return-void
.end method

.method public removeAttr(Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "attributeKey"    # Ljava/lang/String;

    .prologue
    .line 125
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 126
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Attributes;->remove(Ljava/lang/String;)V

    .line 127
    return-object p0
.end method

.method protected removeChild(Lorg/jsoup/nodes/Node;)V
    .registers 4
    .param p1, "out"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 437
    iget-object v1, p1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-ne v1, p0, :cond_16

    const/4 v1, 0x1

    :goto_5
    invoke-static {v1}, Lorg/jsoup/helper/Validate;->isTrue(Z)V

    .line 438
    iget v0, p1, Lorg/jsoup/nodes/Node;->siblingIndex:I

    .line 439
    .local v0, "index":I
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 440
    invoke-direct {p0, v0}, Lorg/jsoup/nodes/Node;->reindexChildren(I)V

    .line 441
    const/4 v1, 0x0

    iput-object v1, p1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    .line 442
    return-void

    .line 437
    .end local v0    # "index":I
    :cond_16
    const/4 v1, 0x0

    goto :goto_5
.end method

.method protected reparentChild(Lorg/jsoup/nodes/Node;)V
    .registers 3
    .param p1, "child"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 464
    iget-object v0, p1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-eqz v0, :cond_9

    .line 465
    iget-object v0, p1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Node;->removeChild(Lorg/jsoup/nodes/Node;)V

    .line 466
    :cond_9
    invoke-virtual {p1, p0}, Lorg/jsoup/nodes/Node;->setParentNode(Lorg/jsoup/nodes/Node;)V

    .line 467
    return-void
.end method

.method protected replaceChild(Lorg/jsoup/nodes/Node;Lorg/jsoup/nodes/Node;)V
    .registers 5
    .param p1, "out"    # Lorg/jsoup/nodes/Node;
    .param p2, "in"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 424
    iget-object v1, p1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-ne v1, p0, :cond_24

    const/4 v1, 0x1

    :goto_5
    invoke-static {v1}, Lorg/jsoup/helper/Validate;->isTrue(Z)V

    .line 425
    invoke-static {p2}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 426
    iget-object v1, p2, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-eqz v1, :cond_14

    .line 427
    iget-object v1, p2, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v1, p2}, Lorg/jsoup/nodes/Node;->removeChild(Lorg/jsoup/nodes/Node;)V

    .line 429
    :cond_14
    iget v0, p1, Lorg/jsoup/nodes/Node;->siblingIndex:I

    .line 430
    .local v0, "index":I
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v1, v0, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 431
    iput-object p0, p2, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    .line 432
    invoke-virtual {p2, v0}, Lorg/jsoup/nodes/Node;->setSiblingIndex(I)V

    .line 433
    const/4 v1, 0x0

    iput-object v1, p1, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    .line 434
    return-void

    .line 424
    .end local v0    # "index":I
    :cond_24
    const/4 v1, 0x0

    goto :goto_5
.end method

.method public replaceWith(Lorg/jsoup/nodes/Node;)V
    .registers 3
    .param p1, "in"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 412
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 413
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 414
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v0, p0, p1}, Lorg/jsoup/nodes/Node;->replaceChild(Lorg/jsoup/nodes/Node;Lorg/jsoup/nodes/Node;)V

    .line 415
    return-void
.end method

.method public setBaseUri(Ljava/lang/String;)V
    .registers 3
    .param p1, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 143
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 145
    new-instance v0, Lorg/jsoup/nodes/Node$1;

    invoke-direct {v0, p0, p1}, Lorg/jsoup/nodes/Node$1;-><init>(Lorg/jsoup/nodes/Node;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Node;->traverse(Lorg/jsoup/select/NodeVisitor;)Lorg/jsoup/nodes/Node;

    .line 153
    return-void
.end method

.method protected setParentNode(Lorg/jsoup/nodes/Node;)V
    .registers 3
    .param p1, "parentNode"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 418
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-eqz v0, :cond_9

    .line 419
    iget-object v0, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v0, p0}, Lorg/jsoup/nodes/Node;->removeChild(Lorg/jsoup/nodes/Node;)V

    .line 420
    :cond_9
    iput-object p1, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    .line 421
    return-void
.end method

.method protected setSiblingIndex(I)V
    .registers 2
    .param p1, "siblingIndex"    # I

    .prologue
    .line 533
    iput p1, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    .line 534
    return-void
.end method

.method public siblingIndex()I
    .registers 2

    .prologue
    .line 529
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
    .line 481
    iget-object v4, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v4, :cond_9

    .line 482
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    .line 489
    :cond_8
    return-object v3

    .line 484
    :cond_9
    iget-object v4, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    iget-object v2, v4, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    .line 485
    .local v2, "nodes":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 486
    .local v3, "siblings":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1c
    :goto_1c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Node;

    .line 487
    .local v1, "node":Lorg/jsoup/nodes/Node;
    if-eq v1, p0, :cond_1c

    .line 488
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1c
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 577
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public traverse(Lorg/jsoup/select/NodeVisitor;)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "nodeVisitor"    # Lorg/jsoup/select/NodeVisitor;

    .prologue
    .line 542
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 543
    new-instance v0, Lorg/jsoup/select/NodeTraversor;

    invoke-direct {v0, p1}, Lorg/jsoup/select/NodeTraversor;-><init>(Lorg/jsoup/select/NodeVisitor;)V

    .line 544
    .local v0, "traversor":Lorg/jsoup/select/NodeTraversor;
    invoke-virtual {v0, p0}, Lorg/jsoup/select/NodeTraversor;->traverse(Lorg/jsoup/nodes/Node;)V

    .line 545
    return-object p0
.end method

.method public unwrap()Lorg/jsoup/nodes/Node;
    .registers 5

    .prologue
    .line 390
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-static {v1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 392
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

    .line 393
    .local v0, "firstChild":Lorg/jsoup/nodes/Node;
    :goto_17
    iget-object v1, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    iget v2, p0, Lorg/jsoup/nodes/Node;->siblingIndex:I

    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->childNodesAsArray()[Lorg/jsoup/nodes/Node;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/jsoup/nodes/Node;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 394
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->remove()V

    .line 396
    return-object v0

    .line 392
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

    .line 350
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 352
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->parent()Lorg/jsoup/nodes/Node;

    move-result-object v7

    instance-of v7, v7, Lorg/jsoup/nodes/Element;

    if-eqz v7, :cond_2a

    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->parent()Lorg/jsoup/nodes/Node;

    move-result-object v7

    check-cast v7, Lorg/jsoup/nodes/Element;

    move-object v0, v7

    .line 353
    .local v0, "context":Lorg/jsoup/nodes/Element;
    :goto_14
    invoke-virtual {p0}, Lorg/jsoup/nodes/Node;->baseUri()Ljava/lang/String;

    move-result-object v7

    invoke-static {p1, v0, v7}, Lorg/jsoup/parser/Parser;->parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    .line 354
    .local v5, "wrapChildren":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    invoke-interface {v5, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jsoup/nodes/Node;

    .line 355
    .local v6, "wrapNode":Lorg/jsoup/nodes/Node;
    if-eqz v6, :cond_28

    instance-of v7, v6, Lorg/jsoup/nodes/Element;

    if-nez v7, :cond_2c

    :cond_28
    move-object p0, v8

    .line 371
    .end local p0    # "this":Lorg/jsoup/nodes/Node;
    :cond_29
    return-object p0

    .end local v0    # "context":Lorg/jsoup/nodes/Element;
    .end local v5    # "wrapChildren":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    .end local v6    # "wrapNode":Lorg/jsoup/nodes/Node;
    .restart local p0    # "this":Lorg/jsoup/nodes/Node;
    :cond_2a
    move-object v0, v8

    .line 352
    goto :goto_14

    .restart local v0    # "context":Lorg/jsoup/nodes/Element;
    .restart local v5    # "wrapChildren":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    .restart local v6    # "wrapNode":Lorg/jsoup/nodes/Node;
    :cond_2c
    move-object v4, v6

    .line 358
    check-cast v4, Lorg/jsoup/nodes/Element;

    .line 359
    .local v4, "wrap":Lorg/jsoup/nodes/Element;
    invoke-direct {p0, v4}, Lorg/jsoup/nodes/Node;->getDeepChild(Lorg/jsoup/nodes/Element;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    .line 360
    .local v1, "deepest":Lorg/jsoup/nodes/Element;
    iget-object v7, p0, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v7, p0, v4}, Lorg/jsoup/nodes/Node;->replaceChild(Lorg/jsoup/nodes/Node;Lorg/jsoup/nodes/Node;)V

    .line 361
    const/4 v7, 0x1

    new-array v7, v7, [Lorg/jsoup/nodes/Node;

    aput-object p0, v7, v9

    invoke-virtual {v1, v7}, Lorg/jsoup/nodes/Element;->addChildren([Lorg/jsoup/nodes/Node;)V

    .line 364
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_29

    .line 365
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_47
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    if-ge v2, v7, :cond_29

    .line 366
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Node;

    .line 367
    .local v3, "remainder":Lorg/jsoup/nodes/Node;
    iget-object v7, v3, Lorg/jsoup/nodes/Node;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-virtual {v7, v3}, Lorg/jsoup/nodes/Node;->removeChild(Lorg/jsoup/nodes/Node;)V

    .line 368
    invoke-virtual {v4, v3}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 365
    add-int/lit8 v2, v2, 0x1

    goto :goto_47
.end method
