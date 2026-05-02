.class public Lorg/jsoup/nodes/Element;
.super Lorg/jsoup/nodes/Node;
.source "Element.java"


# instance fields
.field private classNames:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private tag:Lorg/jsoup/parser/Tag;


# direct methods
.method public constructor <init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V
    .registers 4
    .param p1, "tag"    # Lorg/jsoup/parser/Tag;
    .param p2, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 50
    new-instance v0, Lorg/jsoup/nodes/Attributes;

    invoke-direct {v0}, Lorg/jsoup/nodes/Attributes;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V
    .registers 4
    .param p1, "tag"    # Lorg/jsoup/parser/Tag;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/jsoup/nodes/Attributes;

    .prologue
    .line 35
    invoke-direct {p0, p2, p3}, Lorg/jsoup/nodes/Node;-><init>(Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 37
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 38
    iput-object p1, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    .line 39
    return-void
.end method

.method static synthetic access$000(Ljava/lang/StringBuilder;Lorg/jsoup/nodes/TextNode;)V
    .registers 2
    .param p0, "x0"    # Ljava/lang/StringBuilder;
    .param p1, "x1"    # Lorg/jsoup/nodes/TextNode;

    .prologue
    .line 21
    invoke-static {p0, p1}, Lorg/jsoup/nodes/Element;->appendNormalisedText(Ljava/lang/StringBuilder;Lorg/jsoup/nodes/TextNode;)V

    return-void
.end method

.method static synthetic access$100(Lorg/jsoup/nodes/Element;)Lorg/jsoup/parser/Tag;
    .registers 2
    .param p0, "x0"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 21
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    return-object v0
.end method

.method private static accumulateParents(Lorg/jsoup/nodes/Element;Lorg/jsoup/select/Elements;)V
    .registers 5
    .param p0, "el"    # Lorg/jsoup/nodes/Element;
    .param p1, "parents"    # Lorg/jsoup/select/Elements;

    .prologue
    .line 153
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 154
    .local v0, "parent":Lorg/jsoup/nodes/Element;
    if-eqz v0, :cond_18

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "#root"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    .line 155
    invoke-virtual {p1, v0}, Lorg/jsoup/select/Elements;->add(Lorg/jsoup/nodes/Element;)Z

    .line 156
    invoke-static {v0, p1}, Lorg/jsoup/nodes/Element;->accumulateParents(Lorg/jsoup/nodes/Element;Lorg/jsoup/select/Elements;)V

    .line 158
    :cond_18
    return-void
.end method

.method private static appendNormalisedText(Ljava/lang/StringBuilder;Lorg/jsoup/nodes/TextNode;)V
    .registers 4
    .param p0, "accum"    # Ljava/lang/StringBuilder;
    .param p1, "textNode"    # Lorg/jsoup/nodes/TextNode;

    .prologue
    .line 868
    invoke-virtual {p1}, Lorg/jsoup/nodes/TextNode;->getWholeText()Ljava/lang/String;

    move-result-object v0

    .line 870
    .local v0, "text":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/jsoup/nodes/TextNode;->parent()Lorg/jsoup/nodes/Node;

    move-result-object v1

    invoke-static {v1}, Lorg/jsoup/nodes/Element;->preserveWhitespace(Lorg/jsoup/nodes/Node;)Z

    move-result v1

    if-nez v1, :cond_1c

    .line 871
    invoke-static {v0}, Lorg/jsoup/nodes/TextNode;->normaliseWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 872
    invoke-static {p0}, Lorg/jsoup/nodes/TextNode;->lastCharIsWhitespace(Ljava/lang/StringBuilder;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 873
    invoke-static {v0}, Lorg/jsoup/nodes/TextNode;->stripLeadingWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 875
    :cond_1c
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 876
    return-void
.end method

.method private static appendWhitespaceIfBr(Lorg/jsoup/nodes/Element;Ljava/lang/StringBuilder;)V
    .registers 4
    .param p0, "element"    # Lorg/jsoup/nodes/Element;
    .param p1, "accum"    # Ljava/lang/StringBuilder;

    .prologue
    .line 879
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "br"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-static {p1}, Lorg/jsoup/nodes/TextNode;->lastCharIsWhitespace(Ljava/lang/StringBuilder;)Z

    move-result v0

    if-nez v0, :cond_19

    .line 880
    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 881
    :cond_19
    return-void
.end method

.method private html(Ljava/lang/StringBuilder;)V
    .registers 5
    .param p1, "accum"    # Ljava/lang/StringBuilder;

    .prologue
    .line 1107
    iget-object v2, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Node;

    .line 1108
    .local v1, "node":Lorg/jsoup/nodes/Node;
    invoke-virtual {v1, p1}, Lorg/jsoup/nodes/Node;->outerHtml(Ljava/lang/StringBuilder;)V

    goto :goto_6

    .line 1109
    .end local v1    # "node":Lorg/jsoup/nodes/Node;
    :cond_16
    return-void
.end method

.method private static indexInList(Lorg/jsoup/nodes/Element;Ljava/util/List;)Ljava/lang/Integer;
    .registers 5
    .param p0, "search"    # Lorg/jsoup/nodes/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Lorg/jsoup/nodes/Element;",
            ">(",
            "Lorg/jsoup/nodes/Element;",
            "Ljava/util/List",
            "<TE;>;)",
            "Ljava/lang/Integer;"
        }
    .end annotation

    .prologue
    .line 529
    .local p1, "elements":Ljava/util/List;, "Ljava/util/List<TE;>;"
    invoke-static {p0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 530
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 532
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_21

    .line 533
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 534
    .local v0, "element":Lorg/jsoup/nodes/Element;, "TE;"
    invoke-virtual {v0, p0}, Lorg/jsoup/nodes/Element;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 535
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 537
    .end local v0    # "element":Lorg/jsoup/nodes/Element;, "TE;"
    :goto_1d
    return-object v2

    .line 532
    .restart local v0    # "element":Lorg/jsoup/nodes/Element;, "TE;"
    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 537
    .end local v0    # "element":Lorg/jsoup/nodes/Element;, "TE;"
    :cond_21
    const/4 v2, 0x0

    goto :goto_1d
.end method

.method private ownText(Ljava/lang/StringBuilder;)V
    .registers 6
    .param p1, "accum"    # Ljava/lang/StringBuilder;

    .prologue
    .line 857
    iget-object v3, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 858
    .local v0, "child":Lorg/jsoup/nodes/Node;
    instance-of v3, v0, Lorg/jsoup/nodes/TextNode;

    if-eqz v3, :cond_1d

    move-object v2, v0

    .line 859
    check-cast v2, Lorg/jsoup/nodes/TextNode;

    .line 860
    .local v2, "textNode":Lorg/jsoup/nodes/TextNode;
    invoke-static {p1, v2}, Lorg/jsoup/nodes/Element;->appendNormalisedText(Ljava/lang/StringBuilder;Lorg/jsoup/nodes/TextNode;)V

    goto :goto_6

    .line 861
    .end local v2    # "textNode":Lorg/jsoup/nodes/TextNode;
    :cond_1d
    instance-of v3, v0, Lorg/jsoup/nodes/Element;

    if-eqz v3, :cond_6

    .line 862
    check-cast v0, Lorg/jsoup/nodes/Element;

    .end local v0    # "child":Lorg/jsoup/nodes/Node;
    invoke-static {v0, p1}, Lorg/jsoup/nodes/Element;->appendWhitespaceIfBr(Lorg/jsoup/nodes/Element;Ljava/lang/StringBuilder;)V

    goto :goto_6

    .line 865
    :cond_27
    return-void
.end method

.method static preserveWhitespace(Lorg/jsoup/nodes/Node;)Z
    .registers 4
    .param p0, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    const/4 v1, 0x0

    .line 885
    if-eqz p0, :cond_25

    instance-of v2, p0, Lorg/jsoup/nodes/Element;

    if-eqz v2, :cond_25

    move-object v0, p0

    .line 886
    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 887
    .local v0, "element":Lorg/jsoup/nodes/Element;
    iget-object v2, v0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v2}, Lorg/jsoup/parser/Tag;->preserveWhitespace()Z

    move-result v2

    if-nez v2, :cond_24

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v2

    if-eqz v2, :cond_25

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v2

    iget-object v2, v2, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v2}, Lorg/jsoup/parser/Tag;->preserveWhitespace()Z

    move-result v2

    if-eqz v2, :cond_25

    :cond_24
    const/4 v1, 0x1

    .line 890
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_25
    return v1
.end method


# virtual methods
.method public addClass(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 1003
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1005
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v0

    .line 1006
    .local v0, "classes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1007
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->classNames(Ljava/util/Set;)Lorg/jsoup/nodes/Element;

    .line 1009
    return-object p0
.end method

.method public after(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 413
    invoke-super {p0, p1}, Lorg/jsoup/nodes/Node;->after(Ljava/lang/String;)Lorg/jsoup/nodes/Node;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public after(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 424
    invoke-super {p0, p1}, Lorg/jsoup/nodes/Node;->after(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic after(Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->after(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic after(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "x0"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 21
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->after(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public append(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 360
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 362
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, p0, v1}, Lorg/jsoup/parser/Parser;->parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 363
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lorg/jsoup/nodes/Node;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/jsoup/nodes/Node;

    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Element;->addChildren([Lorg/jsoup/nodes/Node;)V

    .line 364
    return-object p0
.end method

.method public appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "child"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 262
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 264
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/jsoup/nodes/Node;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->addChildren([Lorg/jsoup/nodes/Node;)V

    .line 265
    return-object p0
.end method

.method public appendElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "tagName"    # Ljava/lang/String;

    .prologue
    .line 311
    new-instance v0, Lorg/jsoup/nodes/Element;

    invoke-static {p1}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    .line 312
    .local v0, "child":Lorg/jsoup/nodes/Element;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 313
    return-object v0
.end method

.method public appendText(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 336
    new-instance v0, Lorg/jsoup/nodes/TextNode;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/jsoup/nodes/TextNode;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    .local v0, "node":Lorg/jsoup/nodes/TextNode;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 338
    return-object p0
.end method

.method public attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "attributeKey"    # Ljava/lang/String;
    .param p2, "attributeValue"    # Ljava/lang/String;

    .prologue
    .line 116
    invoke-super {p0, p1, p2}, Lorg/jsoup/nodes/Node;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Node;

    .line 117
    return-object p0
.end method

.method public bridge synthetic attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-virtual {p0, p1, p2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public before(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 390
    invoke-super {p0, p1}, Lorg/jsoup/nodes/Node;->before(Ljava/lang/String;)Lorg/jsoup/nodes/Node;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public before(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 401
    invoke-super {p0, p1}, Lorg/jsoup/nodes/Node;->before(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic before(Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->before(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic before(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "x0"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 21
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->before(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public child(I)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 171
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jsoup/select/Elements;->get(I)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public children()Lorg/jsoup/select/Elements;
    .registers 5

    .prologue
    .line 184
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .local v0, "elements":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Element;>;"
    iget-object v3, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Node;

    .line 186
    .local v2, "node":Lorg/jsoup/nodes/Node;
    instance-of v3, v2, Lorg/jsoup/nodes/Element;

    if-eqz v3, :cond_b

    .line 187
    check-cast v2, Lorg/jsoup/nodes/Element;

    .end local v2    # "node":Lorg/jsoup/nodes/Node;
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 189
    :cond_21
    new-instance v3, Lorg/jsoup/select/Elements;

    invoke-direct {v3, v0}, Lorg/jsoup/select/Elements;-><init>(Ljava/util/List;)V

    return-object v3
.end method

.method public className()Ljava/lang/String;
    .registers 2

    .prologue
    .line 955
    const-string v0, "class"

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public classNames()Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 965
    iget-object v1, p0, Lorg/jsoup/nodes/Element;->classNames:Ljava/util/Set;

    if-nez v1, :cond_19

    .line 966
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->className()Ljava/lang/String;

    move-result-object v1

    const-string v2, "\\s+"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 967
    .local v0, "names":[Ljava/lang/String;
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lorg/jsoup/nodes/Element;->classNames:Ljava/util/Set;

    .line 969
    .end local v0    # "names":[Ljava/lang/String;
    :cond_19
    iget-object v1, p0, Lorg/jsoup/nodes/Element;->classNames:Ljava/util/Set;

    return-object v1
.end method

.method public classNames(Ljava/util/Set;)Lorg/jsoup/nodes/Element;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/jsoup/nodes/Element;"
        }
    .end annotation

    .prologue
    .line 978
    .local p1, "classNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 979
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v1, "class"

    const-string v2, " "

    invoke-static {p1, v2}, Lorg/jsoup/helper/StringUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 980
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 21
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->clone()Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/jsoup/nodes/Element;
    .registers 3

    .prologue
    .line 1142
    invoke-super {p0}, Lorg/jsoup/nodes/Node;->clone()Lorg/jsoup/nodes/Node;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 1143
    .local v0, "clone":Lorg/jsoup/nodes/Element;
    const/4 v1, 0x0

    iput-object v1, v0, Lorg/jsoup/nodes/Element;->classNames:Ljava/util/Set;

    .line 1144
    return-object v0
.end method

.method public bridge synthetic clone()Lorg/jsoup/nodes/Node;
    .registers 2

    .prologue
    .line 21
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->clone()Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public data()Ljava/lang/String;
    .registers 8

    .prologue
    .line 934
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 936
    .local v5, "sb":Ljava/lang/StringBuilder;
    iget-object v6, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_35

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 937
    .local v0, "childNode":Lorg/jsoup/nodes/Node;
    instance-of v6, v0, Lorg/jsoup/nodes/DataNode;

    if-eqz v6, :cond_26

    move-object v1, v0

    .line 938
    check-cast v1, Lorg/jsoup/nodes/DataNode;

    .line 939
    .local v1, "data":Lorg/jsoup/nodes/DataNode;
    invoke-virtual {v1}, Lorg/jsoup/nodes/DataNode;->getWholeData()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    .line 940
    .end local v1    # "data":Lorg/jsoup/nodes/DataNode;
    :cond_26
    instance-of v6, v0, Lorg/jsoup/nodes/Element;

    if-eqz v6, :cond_b

    move-object v2, v0

    .line 941
    check-cast v2, Lorg/jsoup/nodes/Element;

    .line 942
    .local v2, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->data()Ljava/lang/String;

    move-result-object v3

    .line 943
    .local v3, "elementData":Ljava/lang/String;
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    .line 946
    .end local v0    # "childNode":Lorg/jsoup/nodes/Node;
    .end local v2    # "element":Lorg/jsoup/nodes/Element;
    .end local v3    # "elementData":Ljava/lang/String;
    :cond_35
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public dataNodes()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/DataNode;",
            ">;"
        }
    .end annotation

    .prologue
    .line 226
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 227
    .local v0, "dataNodes":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/DataNode;>;"
    iget-object v3, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Node;

    .line 228
    .local v2, "node":Lorg/jsoup/nodes/Node;
    instance-of v3, v2, Lorg/jsoup/nodes/DataNode;

    if-eqz v3, :cond_b

    .line 229
    check-cast v2, Lorg/jsoup/nodes/DataNode;

    .end local v2    # "node":Lorg/jsoup/nodes/Node;
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 231
    :cond_21
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    return-object v3
.end method

.method public dataset()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 134
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Attributes;->dataset()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public elementSiblingIndex()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 515
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    if-nez v0, :cond_c

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 516
    :goto_b
    return-object v0

    :cond_c
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/jsoup/nodes/Element;->indexInList(Lorg/jsoup/nodes/Element;Ljava/util/List;)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_b
.end method

.method public empty()Lorg/jsoup/nodes/Element;
    .registers 2

    .prologue
    .line 432
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 433
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1129
    if-ne p0, p1, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public firstElementSibling()Lorg/jsoup/nodes/Element;
    .registers 4

    .prologue
    .line 505
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 506
    .local v0, "siblings":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Element;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_17

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    :goto_16
    return-object v1

    :cond_17
    const/4 v1, 0x0

    goto :goto_16
.end method

.method public getAllElements()Lorg/jsoup/select/Elements;
    .registers 2

    .prologue
    .line 805
    new-instance v0, Lorg/jsoup/select/Evaluator$AllElements;

    invoke-direct {v0}, Lorg/jsoup/select/Evaluator$AllElements;-><init>()V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementById(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 564
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 566
    new-instance v1, Lorg/jsoup/select/Evaluator$Id;

    invoke-direct {v1, p1}, Lorg/jsoup/select/Evaluator$Id;-><init>(Ljava/lang/String;)V

    invoke-static {v1, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 567
    .local v0, "elements":Lorg/jsoup/select/Elements;
    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->size()I

    move-result v1

    if-lez v1, :cond_18

    .line 568
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/jsoup/select/Elements;->get(I)Lorg/jsoup/nodes/Element;

    move-result-object v1

    .line 570
    :goto_17
    return-object v1

    :cond_18
    const/4 v1, 0x0

    goto :goto_17
.end method

.method public getElementsByAttribute(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 597
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 598
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 600
    new-instance v0, Lorg/jsoup/select/Evaluator$Attribute;

    invoke-direct {v0, p1}, Lorg/jsoup/select/Evaluator$Attribute;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeStarting(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "keyPrefix"    # Ljava/lang/String;

    .prologue
    .line 610
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 611
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 613
    new-instance v0, Lorg/jsoup/select/Evaluator$AttributeStarting;

    invoke-direct {v0, p1}, Lorg/jsoup/select/Evaluator$AttributeStarting;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeValue(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 624
    new-instance v0, Lorg/jsoup/select/Evaluator$AttributeWithValue;

    invoke-direct {v0, p1, p2}, Lorg/jsoup/select/Evaluator$AttributeWithValue;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeValueContaining(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "match"    # Ljava/lang/String;

    .prologue
    .line 668
    new-instance v0, Lorg/jsoup/select/Evaluator$AttributeWithValueContaining;

    invoke-direct {v0, p1, p2}, Lorg/jsoup/select/Evaluator$AttributeWithValueContaining;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeValueEnding(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "valueSuffix"    # Ljava/lang/String;

    .prologue
    .line 657
    new-instance v0, Lorg/jsoup/select/Evaluator$AttributeWithValueEnding;

    invoke-direct {v0, p1, p2}, Lorg/jsoup/select/Evaluator$AttributeWithValueEnding;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeValueMatching(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 8
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "regex"    # Ljava/lang/String;

    .prologue
    .line 691
    :try_start_0
    invoke-static {p2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    :try_end_3
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_3} :catch_9

    move-result-object v1

    .line 695
    .local v1, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {p0, p1, v1}, Lorg/jsoup/nodes/Element;->getElementsByAttributeValueMatching(Ljava/lang/String;Ljava/util/regex/Pattern;)Lorg/jsoup/select/Elements;

    move-result-object v2

    return-object v2

    .line 692
    .end local v1    # "pattern":Ljava/util/regex/Pattern;
    :catch_9
    move-exception v0

    .line 693
    .local v0, "e":Ljava/util/regex/PatternSyntaxException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Pattern syntax error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getElementsByAttributeValueMatching(Ljava/lang/String;Ljava/util/regex/Pattern;)Lorg/jsoup/select/Elements;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/util/regex/Pattern;

    .prologue
    .line 678
    new-instance v0, Lorg/jsoup/select/Evaluator$AttributeWithValueMatching;

    invoke-direct {v0, p1, p2}, Lorg/jsoup/select/Evaluator$AttributeWithValueMatching;-><init>(Ljava/lang/String;Ljava/util/regex/Pattern;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeValueNot(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 635
    new-instance v0, Lorg/jsoup/select/Evaluator$AttributeWithValueNot;

    invoke-direct {v0, p1, p2}, Lorg/jsoup/select/Evaluator$AttributeWithValueNot;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByAttributeValueStarting(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "valuePrefix"    # Ljava/lang/String;

    .prologue
    .line 646
    new-instance v0, Lorg/jsoup/select/Evaluator$AttributeWithValueStarting;

    invoke-direct {v0, p1, p2}, Lorg/jsoup/select/Evaluator$AttributeWithValueStarting;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByClass(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 585
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 587
    new-instance v0, Lorg/jsoup/select/Evaluator$Class;

    invoke-direct {v0, p1}, Lorg/jsoup/select/Evaluator$Class;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByIndexEquals(I)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 722
    new-instance v0, Lorg/jsoup/select/Evaluator$IndexEquals;

    invoke-direct {v0, p1}, Lorg/jsoup/select/Evaluator$IndexEquals;-><init>(I)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByIndexGreaterThan(I)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 713
    new-instance v0, Lorg/jsoup/select/Evaluator$IndexGreaterThan;

    invoke-direct {v0, p1}, Lorg/jsoup/select/Evaluator$IndexGreaterThan;-><init>(I)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByIndexLessThan(I)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 704
    new-instance v0, Lorg/jsoup/select/Evaluator$IndexLessThan;

    invoke-direct {v0, p1}, Lorg/jsoup/select/Evaluator$IndexLessThan;-><init>(I)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsByTag(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "tagName"    # Ljava/lang/String;

    .prologue
    .line 548
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 549
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 551
    new-instance v0, Lorg/jsoup/select/Evaluator$Tag;

    invoke-direct {v0, p1}, Lorg/jsoup/select/Evaluator$Tag;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsContainingOwnText(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "searchText"    # Ljava/lang/String;

    .prologue
    .line 744
    new-instance v0, Lorg/jsoup/select/Evaluator$ContainsOwnText;

    invoke-direct {v0, p1}, Lorg/jsoup/select/Evaluator$ContainsOwnText;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsContainingText(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "searchText"    # Ljava/lang/String;

    .prologue
    .line 733
    new-instance v0, Lorg/jsoup/select/Evaluator$ContainsText;

    invoke-direct {v0, p1}, Lorg/jsoup/select/Evaluator$ContainsText;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsMatchingOwnText(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 7
    .param p1, "regex"    # Ljava/lang/String;

    .prologue
    .line 792
    :try_start_0
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    :try_end_3
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_3} :catch_9

    move-result-object v1

    .line 796
    .local v1, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Element;->getElementsMatchingOwnText(Ljava/util/regex/Pattern;)Lorg/jsoup/select/Elements;

    move-result-object v2

    return-object v2

    .line 793
    .end local v1    # "pattern":Ljava/util/regex/Pattern;
    :catch_9
    move-exception v0

    .line 794
    .local v0, "e":Ljava/util/regex/PatternSyntaxException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Pattern syntax error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getElementsMatchingOwnText(Ljava/util/regex/Pattern;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "pattern"    # Ljava/util/regex/Pattern;

    .prologue
    .line 780
    new-instance v0, Lorg/jsoup/select/Evaluator$MatchesOwn;

    invoke-direct {v0, p1}, Lorg/jsoup/select/Evaluator$MatchesOwn;-><init>(Ljava/util/regex/Pattern;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public getElementsMatchingText(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 7
    .param p1, "regex"    # Ljava/lang/String;

    .prologue
    .line 766
    :try_start_0
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    :try_end_3
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_3} :catch_9

    move-result-object v1

    .line 770
    .local v1, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Element;->getElementsMatchingText(Ljava/util/regex/Pattern;)Lorg/jsoup/select/Elements;

    move-result-object v2

    return-object v2

    .line 767
    .end local v1    # "pattern":Ljava/util/regex/Pattern;
    :catch_9
    move-exception v0

    .line 768
    .local v0, "e":Ljava/util/regex/PatternSyntaxException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Pattern syntax error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getElementsMatchingText(Ljava/util/regex/Pattern;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "pattern"    # Ljava/util/regex/Pattern;

    .prologue
    .line 754
    new-instance v0, Lorg/jsoup/select/Evaluator$Matches;

    invoke-direct {v0, p1}, Lorg/jsoup/select/Evaluator$Matches;-><init>(Ljava/util/regex/Pattern;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public hasClass(Ljava/lang/String;)Z
    .registers 6
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 989
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v0

    .line 990
    .local v0, "classNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 991
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 992
    const/4 v3, 0x1

    .line 994
    .end local v2    # "name":Ljava/lang/String;
    :goto_1b
    return v3

    :cond_1c
    const/4 v3, 0x0

    goto :goto_1b
.end method

.method public hasText()Z
    .registers 7

    .prologue
    const/4 v4, 0x1

    .line 913
    iget-object v5, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 914
    .local v0, "child":Lorg/jsoup/nodes/Node;
    instance-of v5, v0, Lorg/jsoup/nodes/TextNode;

    if-eqz v5, :cond_21

    move-object v3, v0

    .line 915
    check-cast v3, Lorg/jsoup/nodes/TextNode;

    .line 916
    .local v3, "textNode":Lorg/jsoup/nodes/TextNode;
    invoke-virtual {v3}, Lorg/jsoup/nodes/TextNode;->isBlank()Z

    move-result v5

    if-nez v5, :cond_7

    .line 924
    .end local v0    # "child":Lorg/jsoup/nodes/Node;
    .end local v3    # "textNode":Lorg/jsoup/nodes/TextNode;
    :goto_20
    return v4

    .line 918
    .restart local v0    # "child":Lorg/jsoup/nodes/Node;
    :cond_21
    instance-of v5, v0, Lorg/jsoup/nodes/Element;

    if-eqz v5, :cond_7

    move-object v1, v0

    .line 919
    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 920
    .local v1, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->hasText()Z

    move-result v5

    if-eqz v5, :cond_7

    goto :goto_20

    .line 924
    .end local v0    # "child":Lorg/jsoup/nodes/Node;
    .end local v1    # "el":Lorg/jsoup/nodes/Element;
    :cond_2f
    const/4 v4, 0x0

    goto :goto_20
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 1135
    invoke-super {p0}, Lorg/jsoup/nodes/Node;->hashCode()I

    move-result v0

    .line 1136
    .local v0, "result":I
    mul-int/lit8 v2, v0, 0x1f

    iget-object v1, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    if-eqz v1, :cond_13

    iget-object v1, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v1}, Lorg/jsoup/parser/Tag;->hashCode()I

    move-result v1

    :goto_10
    add-int v0, v2, v1

    .line 1137
    return v0

    .line 1136
    :cond_13
    const/4 v1, 0x0

    goto :goto_10
.end method

.method public html()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1102
    .local v0, "accum":Ljava/lang/StringBuilder;
    invoke-direct {p0, v0}, Lorg/jsoup/nodes/Element;->html(Ljava/lang/StringBuilder;)V

    .line 1103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public html(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 2
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 1118
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->empty()Lorg/jsoup/nodes/Element;

    .line 1119
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->append(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 1120
    return-object p0
.end method

.method public id()Ljava/lang/String;
    .registers 3

    .prologue
    .line 105
    const-string v1, "id"

    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, "id":Ljava/lang/String;
    if-nez v0, :cond_a

    const-string v0, ""

    .end local v0    # "id":Ljava/lang/String;
    :cond_a
    return-object v0
.end method

.method public insertChildren(ILjava/util/Collection;)Lorg/jsoup/nodes/Element;
    .registers 8
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<+",
            "Lorg/jsoup/nodes/Node;",
            ">;)",
            "Lorg/jsoup/nodes/Element;"
        }
    .end annotation

    .prologue
    .line 292
    .local p2, "children":Ljava/util/Collection;, "Ljava/util/Collection<+Lorg/jsoup/nodes/Node;>;"
    const-string v3, "Children collection to be inserted must not be null."

    invoke-static {p2, v3}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 293
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->childNodeSize()I

    move-result v0

    .line 294
    .local v0, "currentSize":I
    if-gez p1, :cond_e

    add-int/lit8 v3, v0, 0x1

    add-int/2addr p1, v3

    .line 295
    :cond_e
    if-ltz p1, :cond_2d

    if-gt p1, v0, :cond_2d

    const/4 v3, 0x1

    :goto_13
    const-string v4, "Insert position out of bounds."

    invoke-static {v3, v4}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 297
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 298
    .local v2, "nodes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Node;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Lorg/jsoup/nodes/Node;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/jsoup/nodes/Node;

    .line 299
    .local v1, "nodeArray":[Lorg/jsoup/nodes/Node;
    invoke-virtual {p0, p1, v1}, Lorg/jsoup/nodes/Element;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 300
    return-object p0

    .line 295
    .end local v1    # "nodeArray":[Lorg/jsoup/nodes/Node;
    .end local v2    # "nodes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Node;>;"
    :cond_2d
    const/4 v3, 0x0

    goto :goto_13
.end method

.method public isBlock()Z
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->isBlock()Z

    move-result v0

    return v0
.end method

.method public lastElementSibling()Lorg/jsoup/nodes/Element;
    .registers 4

    .prologue
    .line 524
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 525
    .local v0, "siblings":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Element;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_1c

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    :goto_1b
    return-object v1

    :cond_1c
    const/4 v1, 0x0

    goto :goto_1b
.end method

.method public nextElementSibling()Lorg/jsoup/nodes/Element;
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 473
    iget-object v3, p0, Lorg/jsoup/nodes/Element;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v3, :cond_6

    .line 480
    :cond_5
    :goto_5
    return-object v2

    .line 474
    :cond_6
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v1

    .line 475
    .local v1, "siblings":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Element;>;"
    invoke-static {p0, v1}, Lorg/jsoup/nodes/Element;->indexInList(Lorg/jsoup/nodes/Element;Ljava/util/List;)Ljava/lang/Integer;

    move-result-object v0

    .line 476
    .local v0, "index":Ljava/lang/Integer;
    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 477
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    if-le v3, v4, :cond_5

    .line 478
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    goto :goto_5
.end method

.method public nodeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method outerHtmlHead(Ljava/lang/StringBuilder;ILorg/jsoup/nodes/Document$OutputSettings;)V
    .registers 6
    .param p1, "accum"    # Ljava/lang/StringBuilder;
    .param p2, "depth"    # I
    .param p3, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;

    .prologue
    .line 1070
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_31

    invoke-virtual {p3}, Lorg/jsoup/nodes/Document$OutputSettings;->prettyPrint()Z

    move-result v0

    if-eqz v0, :cond_31

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->formatAsBlock()Z

    move-result v0

    if-nez v0, :cond_2e

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_28

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->formatAsBlock()Z

    move-result v0

    if-nez v0, :cond_2e

    :cond_28
    invoke-virtual {p3}, Lorg/jsoup/nodes/Document$OutputSettings;->outline()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 1071
    :cond_2e
    invoke-virtual {p0, p1, p2, p3}, Lorg/jsoup/nodes/Element;->indent(Ljava/lang/StringBuilder;ILorg/jsoup/nodes/Document$OutputSettings;)V

    .line 1072
    :cond_31
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1075
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0, p1, p3}, Lorg/jsoup/nodes/Attributes;->html(Ljava/lang/StringBuilder;Lorg/jsoup/nodes/Document$OutputSettings;)V

    .line 1077
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_59

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->isSelfClosing()Z

    move-result v0

    if-eqz v0, :cond_59

    .line 1078
    const-string v0, " />"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1081
    :goto_58
    return-void

    .line 1080
    :cond_59
    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_58
.end method

.method outerHtmlTail(Ljava/lang/StringBuilder;ILorg/jsoup/nodes/Document$OutputSettings;)V
    .registers 6
    .param p1, "accum"    # Ljava/lang/StringBuilder;
    .param p2, "depth"    # I
    .param p3, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;

    .prologue
    const/4 v1, 0x1

    .line 1084
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->isSelfClosing()Z

    move-result v0

    if-nez v0, :cond_5e

    .line 1085
    :cond_11
    invoke-virtual {p3}, Lorg/jsoup/nodes/Document$OutputSettings;->prettyPrint()Z

    move-result v0

    if-eqz v0, :cond_4b

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4b

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->formatAsBlock()Z

    move-result v0

    if-nez v0, :cond_48

    invoke-virtual {p3}, Lorg/jsoup/nodes/Document$OutputSettings;->outline()Z

    move-result v0

    if-eqz v0, :cond_4b

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gt v0, v1, :cond_48

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v1, :cond_4b

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lorg/jsoup/nodes/TextNode;

    if-nez v0, :cond_4b

    .line 1088
    :cond_48
    invoke-virtual {p0, p1, p2, p3}, Lorg/jsoup/nodes/Element;->indent(Ljava/lang/StringBuilder;ILorg/jsoup/nodes/Document$OutputSettings;)V

    .line 1089
    :cond_4b
    const-string v0, "</"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1091
    :cond_5e
    return-void
.end method

.method public ownText()Ljava/lang/String;
    .registers 3

    .prologue
    .line 851
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 852
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-direct {p0, v0}, Lorg/jsoup/nodes/Element;->ownText(Ljava/lang/StringBuilder;)V

    .line 853
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public final parent()Lorg/jsoup/nodes/Element;
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->parentNode:Lorg/jsoup/nodes/Node;

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic parent()Lorg/jsoup/nodes/Node;
    .registers 2

    .prologue
    .line 21
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public parents()Lorg/jsoup/select/Elements;
    .registers 2

    .prologue
    .line 147
    new-instance v0, Lorg/jsoup/select/Elements;

    invoke-direct {v0}, Lorg/jsoup/select/Elements;-><init>()V

    .line 148
    .local v0, "parents":Lorg/jsoup/select/Elements;
    invoke-static {p0, v0}, Lorg/jsoup/nodes/Element;->accumulateParents(Lorg/jsoup/nodes/Element;Lorg/jsoup/select/Elements;)V

    .line 149
    return-object v0
.end method

.method public prepend(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 374
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 376
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, p0, v1}, Lorg/jsoup/parser/Parser;->parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 377
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    const/4 v2, 0x0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lorg/jsoup/nodes/Node;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/jsoup/nodes/Node;

    invoke-virtual {p0, v2, v1}, Lorg/jsoup/nodes/Element;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 378
    return-object p0
.end method

.method public prependChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "child"    # Lorg/jsoup/nodes/Node;

    .prologue
    const/4 v1, 0x0

    .line 275
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 277
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/jsoup/nodes/Node;

    aput-object p1, v0, v1

    invoke-virtual {p0, v1, v0}, Lorg/jsoup/nodes/Element;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 278
    return-object p0
.end method

.method public prependElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "tagName"    # Ljava/lang/String;

    .prologue
    .line 324
    new-instance v0, Lorg/jsoup/nodes/Element;

    invoke-static {p1}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    .line 325
    .local v0, "child":Lorg/jsoup/nodes/Element;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->prependChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 326
    return-object v0
.end method

.method public prependText(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 348
    new-instance v0, Lorg/jsoup/nodes/TextNode;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/jsoup/nodes/TextNode;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 349
    .local v0, "node":Lorg/jsoup/nodes/TextNode;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->prependChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 350
    return-object p0
.end method

.method public previousElementSibling()Lorg/jsoup/nodes/Element;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 489
    iget-object v3, p0, Lorg/jsoup/nodes/Element;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v3, :cond_6

    .line 496
    :cond_5
    :goto_5
    return-object v2

    .line 490
    :cond_6
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v1

    .line 491
    .local v1, "siblings":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Element;>;"
    invoke-static {p0, v1}, Lorg/jsoup/nodes/Element;->indexInList(Lorg/jsoup/nodes/Element;Ljava/util/List;)Ljava/lang/Integer;

    move-result-object v0

    .line 492
    .local v0, "index":Ljava/lang/Integer;
    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 493
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-lez v3, :cond_5

    .line 494
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    goto :goto_5
.end method

.method public removeClass(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 1018
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1020
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v0

    .line 1021
    .local v0, "classes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1022
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->classNames(Ljava/util/Set;)Lorg/jsoup/nodes/Element;

    .line 1024
    return-object p0
.end method

.method public select(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "cssQuery"    # Ljava/lang/String;

    .prologue
    .line 252
    invoke-static {p1, p0}, Lorg/jsoup/select/Selector;->select(Ljava/lang/String;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public siblingElements()Lorg/jsoup/select/Elements;
    .registers 6

    .prologue
    .line 453
    iget-object v4, p0, Lorg/jsoup/nodes/Element;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v4, :cond_b

    .line 454
    new-instance v3, Lorg/jsoup/select/Elements;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lorg/jsoup/select/Elements;-><init>(I)V

    .line 461
    :cond_a
    return-object v3

    .line 456
    :cond_b
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v1

    .line 457
    .local v1, "elements":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Element;>;"
    new-instance v3, Lorg/jsoup/select/Elements;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-direct {v3, v4}, Lorg/jsoup/select/Elements;-><init>(I)V

    .line 458
    .local v3, "siblings":Lorg/jsoup/select/Elements;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_22
    :goto_22
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 459
    .local v0, "el":Lorg/jsoup/nodes/Element;
    if-eq v0, p0, :cond_22

    .line 460
    invoke-virtual {v3, v0}, Lorg/jsoup/select/Elements;->add(Lorg/jsoup/nodes/Element;)Z

    goto :goto_22
.end method

.method public tag()Lorg/jsoup/parser/Tag;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    return-object v0
.end method

.method public tagName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public tagName(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "tagName"    # Ljava/lang/String;

    .prologue
    .line 75
    const-string v0, "Tag name must not be empty."

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    invoke-static {p1}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    .line 77
    return-object p0
.end method

.method public text()Ljava/lang/String;
    .registers 4

    .prologue
    .line 818
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 819
    .local v0, "accum":Ljava/lang/StringBuilder;
    new-instance v1, Lorg/jsoup/select/NodeTraversor;

    new-instance v2, Lorg/jsoup/nodes/Element$1;

    invoke-direct {v2, p0, v0}, Lorg/jsoup/nodes/Element$1;-><init>(Lorg/jsoup/nodes/Element;Ljava/lang/StringBuilder;)V

    invoke-direct {v1, v2}, Lorg/jsoup/select/NodeTraversor;-><init>(Lorg/jsoup/select/NodeVisitor;)V

    invoke-virtual {v1, p0}, Lorg/jsoup/select/NodeTraversor;->traverse(Lorg/jsoup/nodes/Node;)V

    .line 836
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public text(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 899
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 901
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->empty()Lorg/jsoup/nodes/Element;

    .line 902
    new-instance v0, Lorg/jsoup/nodes/TextNode;

    iget-object v1, p0, Lorg/jsoup/nodes/Element;->baseUri:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Lorg/jsoup/nodes/TextNode;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 903
    .local v0, "textNode":Lorg/jsoup/nodes/TextNode;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 905
    return-object p0
.end method

.method public textNodes()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/TextNode;",
            ">;"
        }
    .end annotation

    .prologue
    .line 209
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 210
    .local v2, "textNodes":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/TextNode;>;"
    iget-object v3, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Node;

    .line 211
    .local v1, "node":Lorg/jsoup/nodes/Node;
    instance-of v3, v1, Lorg/jsoup/nodes/TextNode;

    if-eqz v3, :cond_b

    .line 212
    check-cast v1, Lorg/jsoup/nodes/TextNode;

    .end local v1    # "node":Lorg/jsoup/nodes/Node;
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 214
    :cond_21
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    return-object v3
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1124
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toggleClass(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 1033
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1035
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v0

    .line 1036
    .local v0, "classes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 1037
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1040
    :goto_10
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->classNames(Ljava/util/Set;)Lorg/jsoup/nodes/Element;

    .line 1042
    return-object p0

    .line 1039
    :cond_14
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_10
.end method

.method public val()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1050
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "textarea"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1051
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v0

    .line 1053
    :goto_10
    return-object v0

    :cond_11
    const-string v0, "value"

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_10
.end method

.method public val(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1062
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "textarea"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 1063
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->text(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 1066
    :goto_f
    return-object p0

    .line 1065
    :cond_10
    const-string v0, "value"

    invoke-virtual {p0, v0, p1}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_f
.end method

.method public wrap(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 444
    invoke-super {p0, p1}, Lorg/jsoup/nodes/Node;->wrap(Ljava/lang/String;)Lorg/jsoup/nodes/Node;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic wrap(Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 21
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->wrap(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method
