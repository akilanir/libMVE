.class public Lorg/jsoup/select/Elements;
.super Ljava/util/ArrayList;
.source "Elements.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Lorg/jsoup/nodes/Element;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "initialCapacity"    # I

    .prologue
    .line 22
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 23
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/jsoup/nodes/Element;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 26
    .local p1, "elements":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jsoup/nodes/Element;>;"
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/Element;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p1, "elements":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Element;>;"
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 31
    return-void
.end method

.method public varargs constructor <init>([Lorg/jsoup/nodes/Element;)V
    .registers 3
    .param p1, "elements"    # [Lorg/jsoup/nodes/Element;

    .prologue
    .line 34
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 35
    return-void
.end method


# virtual methods
.method public addClass(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 5
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 112
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->addClass(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_4

    .line 114
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public after(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 5
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 319
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 320
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->after(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_4

    .line 322
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public append(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 5
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 293
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 294
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->append(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_4

    .line 296
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public attr(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "attributeKey"    # Ljava/lang/String;

    .prologue
    .line 60
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 61
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 62
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 64
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :goto_1a
    return-object v1

    :cond_1b
    const-string v1, ""

    goto :goto_1a
.end method

.method public attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 6
    .param p1, "attributeKey"    # Ljava/lang/String;
    .param p2, "attributeValue"    # Ljava/lang/String;

    .prologue
    .line 87
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 88
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1, p2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_4

    .line 90
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public before(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 5
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 306
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 307
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->before(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_4

    .line 309
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 17
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->clone()Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/jsoup/select/Elements;
    .registers 5

    .prologue
    .line 43
    new-instance v0, Lorg/jsoup/select/Elements;

    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->size()I

    move-result v2

    invoke-direct {v0, v2}, Lorg/jsoup/select/Elements;-><init>(I)V

    .line 45
    .local v0, "clone":Lorg/jsoup/select/Elements;
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 46
    .local v1, "e":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->clone()Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jsoup/select/Elements;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 48
    .end local v1    # "e":Lorg/jsoup/nodes/Element;
    :cond_21
    return-object v0
.end method

.method public empty()Lorg/jsoup/select/Elements;
    .registers 4

    .prologue
    .line 375
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 376
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->empty()Lorg/jsoup/nodes/Element;

    goto :goto_4

    .line 378
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public eq(I)Lorg/jsoup/select/Elements;
    .registers 6
    .param p1, "index"    # I

    .prologue
    .line 434
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->size()I

    move-result v0

    if-le v0, p1, :cond_19

    new-instance v1, Lorg/jsoup/select/Elements;

    const/4 v0, 0x1

    new-array v2, v0, [Lorg/jsoup/nodes/Element;

    const/4 v3, 0x0

    invoke-virtual {p0, p1}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    aput-object v0, v2, v3

    invoke-direct {v1, v2}, Lorg/jsoup/select/Elements;-><init>([Lorg/jsoup/nodes/Element;)V

    move-object v0, v1

    :goto_18
    return-object v0

    :cond_19
    new-instance v0, Lorg/jsoup/select/Elements;

    invoke-direct {v0}, Lorg/jsoup/select/Elements;-><init>()V

    goto :goto_18
.end method

.method public first()Lorg/jsoup/nodes/Element;
    .registers 2

    .prologue
    .line 465
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    goto :goto_7
.end method

.method public forms()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/FormElement;",
            ">;"
        }
    .end annotation

    .prologue
    .line 496
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 497
    .local v1, "forms":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/FormElement;>;"
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_9
    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 498
    .local v0, "el":Lorg/jsoup/nodes/Element;
    instance-of v3, v0, Lorg/jsoup/nodes/FormElement;

    if-eqz v3, :cond_9

    .line 499
    check-cast v0, Lorg/jsoup/nodes/FormElement;

    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 500
    :cond_1f
    return-object v1
.end method

.method public hasAttr(Ljava/lang/String;)Z
    .registers 5
    .param p1, "attributeKey"    # Ljava/lang/String;

    .prologue
    .line 73
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 74
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 75
    const/4 v1, 0x1

    .line 77
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :goto_17
    return v1

    :cond_18
    const/4 v1, 0x0

    goto :goto_17
.end method

.method public hasClass(Ljava/lang/String;)Z
    .registers 5
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 147
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 148
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->hasClass(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 149
    const/4 v1, 0x1

    .line 151
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :goto_17
    return v1

    :cond_18
    const/4 v1, 0x0

    goto :goto_17
.end method

.method public hasText()Z
    .registers 4

    .prologue
    .line 196
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 197
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->hasText()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 198
    const/4 v1, 0x1

    .line 200
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :goto_17
    return v1

    :cond_18
    const/4 v1, 0x0

    goto :goto_17
.end method

.method public html()Ljava/lang/String;
    .registers 5

    .prologue
    .line 210
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 211
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 212
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_20

    .line 213
    const-string v3, "\n"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    :cond_20
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->html()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 216
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public html(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 5
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 267
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 268
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->html(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_4

    .line 270
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public is(Ljava/lang/String;)Z
    .registers 4
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 443
    invoke-virtual {p0, p1}, Lorg/jsoup/select/Elements;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 444
    .local v0, "children":Lorg/jsoup/select/Elements;
    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_c

    const/4 v1, 0x1

    :goto_b
    return v1

    :cond_c
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public last()Lorg/jsoup/nodes/Element;
    .registers 2

    .prologue
    .line 473
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    goto :goto_7
.end method

.method public not(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 4
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 422
    invoke-static {p1, p0}, Lorg/jsoup/select/Selector;->select(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 423
    .local v0, "out":Lorg/jsoup/select/Elements;
    invoke-static {p0, v0}, Lorg/jsoup/select/Selector;->filterOut(Ljava/util/Collection;Ljava/util/Collection;)Lorg/jsoup/select/Elements;

    move-result-object v1

    return-object v1
.end method

.method public outerHtml()Ljava/lang/String;
    .registers 5

    .prologue
    .line 226
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 227
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 228
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_20

    .line 229
    const-string v3, "\n"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    :cond_20
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->outerHtml()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 232
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public parents()Lorg/jsoup/select/Elements;
    .registers 5

    .prologue
    .line 452
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 453
    .local v0, "combo":Ljava/util/HashSet;, "Ljava/util/HashSet<Lorg/jsoup/nodes/Element;>;"
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 454
    .local v1, "e":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->parents()Lorg/jsoup/select/Elements;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    goto :goto_9

    .line 456
    .end local v1    # "e":Lorg/jsoup/nodes/Element;
    :cond_1d
    new-instance v2, Lorg/jsoup/select/Elements;

    invoke-direct {v2, v0}, Lorg/jsoup/select/Elements;-><init>(Ljava/util/Collection;)V

    return-object v2
.end method

.method public prepend(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 5
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 280
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 281
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->prepend(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_4

    .line 283
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public remove()Lorg/jsoup/select/Elements;
    .registers 4

    .prologue
    .line 394
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 395
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->remove()V

    goto :goto_4

    .line 397
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public removeAttr(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 5
    .param p1, "attributeKey"    # Ljava/lang/String;

    .prologue
    .line 99
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 100
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->removeAttr(Ljava/lang/String;)Lorg/jsoup/nodes/Node;

    goto :goto_4

    .line 102
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public removeClass(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 5
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 123
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 124
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->removeClass(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_4

    .line 126
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public select(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 408
    invoke-static {p1, p0}, Lorg/jsoup/select/Selector;->select(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public tagName(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 5
    .param p1, "tagName"    # Ljava/lang/String;

    .prologue
    .line 254
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 255
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->tagName(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_4

    .line 257
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public text()Ljava/lang/String;
    .registers 5

    .prologue
    .line 186
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 187
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 188
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_20

    .line 189
    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    :cond_20
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 192
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 243
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toggleClass(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 5
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 135
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 136
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->toggleClass(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_4

    .line 138
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public traverse(Lorg/jsoup/select/NodeVisitor;)Lorg/jsoup/select/Elements;
    .registers 6
    .param p1, "nodeVisitor"    # Lorg/jsoup/select/NodeVisitor;

    .prologue
    .line 482
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 483
    new-instance v1, Lorg/jsoup/select/NodeTraversor;

    invoke-direct {v1, p1}, Lorg/jsoup/select/NodeTraversor;-><init>(Lorg/jsoup/select/NodeVisitor;)V

    .line 484
    .local v1, "traversor":Lorg/jsoup/select/NodeTraversor;
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 485
    .local v0, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1, v0}, Lorg/jsoup/select/NodeTraversor;->traverse(Lorg/jsoup/nodes/Node;)V

    goto :goto_c

    .line 487
    .end local v0    # "el":Lorg/jsoup/nodes/Element;
    :cond_1c
    return-object p0
.end method

.method public unwrap()Lorg/jsoup/select/Elements;
    .registers 4

    .prologue
    .line 357
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 358
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->unwrap()Lorg/jsoup/nodes/Node;

    goto :goto_4

    .line 360
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public val()Ljava/lang/String;
    .registers 2

    .prologue
    .line 160
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->size()I

    move-result v0

    if-lez v0, :cond_f

    .line 161
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->first()Lorg/jsoup/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->val()Ljava/lang/String;

    move-result-object v0

    .line 163
    :goto_e
    return-object v0

    :cond_f
    const-string v0, ""

    goto :goto_e
.end method

.method public val(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 172
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 173
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->val(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_4

    .line 174
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_14
    return-object p0
.end method

.method public wrap(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 5
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 335
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 336
    invoke-virtual {p0}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 337
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->wrap(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_7

    .line 339
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_17
    return-object p0
.end method
