.class public Lorg/jsoup/nodes/Element;
.super Lorg/jsoup/nodes/Node;
.source "Element.java"


# static fields
.field private static final classSplit:Ljava/util/regex/Pattern;


# instance fields
.field private tag:Lorg/jsoup/parser/Tag;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 37
    const-string v0, "\\s+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jsoup/nodes/Element;->classSplit:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V
    .registers 4
    .param p1, "tag"    # Lorg/jsoup/parser/Tag;
    .param p2, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 64
    new-instance v0, Lorg/jsoup/nodes/Attributes;

    invoke-direct {v0}, Lorg/jsoup/nodes/Attributes;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V
    .registers 4
    .param p1, "tag"    # Lorg/jsoup/parser/Tag;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/jsoup/nodes/Attributes;

    .prologue
    .line 49
    invoke-direct {p0, p2, p3}, Lorg/jsoup/nodes/Node;-><init>(Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 51
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 52
    iput-object p1, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    .line 53
    return-void
.end method

.method static synthetic access$000(Ljava/lang/StringBuilder;Lorg/jsoup/nodes/TextNode;)V
    .registers 2
    .param p0, "x0"    # Ljava/lang/StringBuilder;
    .param p1, "x1"    # Lorg/jsoup/nodes/TextNode;

    .prologue
    .line 34
    invoke-static {p0, p1}, Lorg/jsoup/nodes/Element;->appendNormalisedText(Ljava/lang/StringBuilder;Lorg/jsoup/nodes/TextNode;)V

    return-void
.end method

.method static synthetic access$100(Lorg/jsoup/nodes/Element;)Lorg/jsoup/parser/Tag;
    .registers 2
    .param p0, "x0"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 34
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    return-object v0
.end method

.method private static accumulateParents(Lorg/jsoup/nodes/Element;Lorg/jsoup/select/Elements;)V
    .registers 5
    .param p0, "el"    # Lorg/jsoup/nodes/Element;
    .param p1, "parents"    # Lorg/jsoup/select/Elements;

    .prologue
    .line 181
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 182
    .local v0, "parent":Lorg/jsoup/nodes/Element;
    if-eqz v0, :cond_18

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "#root"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    .line 183
    invoke-virtual {p1, v0}, Lorg/jsoup/select/Elements;->add(Ljava/lang/Object;)Z

    .line 184
    invoke-static {v0, p1}, Lorg/jsoup/nodes/Element;->accumulateParents(Lorg/jsoup/nodes/Element;Lorg/jsoup/select/Elements;)V

    .line 186
    :cond_18
    return-void
.end method

.method private static appendNormalisedText(Ljava/lang/StringBuilder;Lorg/jsoup/nodes/TextNode;)V
    .registers 4
    .param p0, "accum"    # Ljava/lang/StringBuilder;
    .param p1, "textNode"    # Lorg/jsoup/nodes/TextNode;

    .prologue
    .line 939
    invoke-virtual {p1}, Lorg/jsoup/nodes/TextNode;->getWholeText()Ljava/lang/String;

    move-result-object v0

    .line 941
    .local v0, "text":Ljava/lang/String;
    iget-object v1, p1, Lorg/jsoup/nodes/TextNode;->parentNode:Lorg/jsoup/nodes/Node;

    invoke-static {v1}, Lorg/jsoup/nodes/Element;->preserveWhitespace(Lorg/jsoup/nodes/Node;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 942
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 945
    :goto_f
    return-void

    .line 944
    :cond_10
    invoke-static {p0}, Lorg/jsoup/nodes/TextNode;->lastCharIsWhitespace(Ljava/lang/StringBuilder;)Z

    move-result v1

    invoke-static {p0, v0, v1}, Lorg/jsoup/helper/StringUtil;->appendNormalisedWhitespace(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V

    goto :goto_f
.end method

.method private static appendWhitespaceIfBr(Lorg/jsoup/nodes/Element;Ljava/lang/StringBuilder;)V
    .registers 4
    .param p0, "element"    # Lorg/jsoup/nodes/Element;
    .param p1, "accum"    # Ljava/lang/StringBuilder;

    .prologue
    .line 948
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

    .line 949
    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 950
    :cond_19
    return-void
.end method

.method private html(Ljava/lang/StringBuilder;)V
    .registers 5
    .param p1, "accum"    # Ljava/lang/StringBuilder;

    .prologue
    .line 1200
    iget-object v1, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 1201
    .local v0, "node":Lorg/jsoup/nodes/Node;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Node;->outerHtml(Ljava/lang/Appendable;)V

    goto :goto_6

    .line 1202
    .end local v0    # "node":Lorg/jsoup/nodes/Node;
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
    .line 600
    .local p1, "elements":Ljava/util/List;, "Ljava/util/List<TE;>;"
    invoke-static {p0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 601
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 603
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1d

    .line 604
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 605
    .local v0, "element":Lorg/jsoup/nodes/Element;, "TE;"
    if-ne v0, p0, :cond_1a

    .line 606
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 608
    .end local v0    # "element":Lorg/jsoup/nodes/Element;, "TE;"
    :goto_19
    return-object v2

    .line 603
    .restart local v0    # "element":Lorg/jsoup/nodes/Element;, "TE;"
    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 608
    .end local v0    # "element":Lorg/jsoup/nodes/Element;, "TE;"
    :cond_1d
    const/4 v2, 0x0

    goto :goto_19
.end method

.method private ownText(Ljava/lang/StringBuilder;)V
    .registers 6
    .param p1, "accum"    # Ljava/lang/StringBuilder;

    .prologue
    .line 928
    iget-object v2, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    :goto_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 929
    .local v0, "child":Lorg/jsoup/nodes/Node;
    instance-of v3, v0, Lorg/jsoup/nodes/TextNode;

    if-eqz v3, :cond_1d

    move-object v1, v0

    .line 930
    check-cast v1, Lorg/jsoup/nodes/TextNode;

    .line 931
    .local v1, "textNode":Lorg/jsoup/nodes/TextNode;
    invoke-static {p1, v1}, Lorg/jsoup/nodes/Element;->appendNormalisedText(Ljava/lang/StringBuilder;Lorg/jsoup/nodes/TextNode;)V

    goto :goto_6

    .line 932
    .end local v1    # "textNode":Lorg/jsoup/nodes/TextNode;
    :cond_1d
    instance-of v3, v0, Lorg/jsoup/nodes/Element;

    if-eqz v3, :cond_6

    .line 933
    check-cast v0, Lorg/jsoup/nodes/Element;

    .end local v0    # "child":Lorg/jsoup/nodes/Node;
    invoke-static {v0, p1}, Lorg/jsoup/nodes/Element;->appendWhitespaceIfBr(Lorg/jsoup/nodes/Element;Ljava/lang/StringBuilder;)V

    goto :goto_6

    .line 936
    :cond_27
    return-void
.end method

.method static preserveWhitespace(Lorg/jsoup/nodes/Node;)Z
    .registers 4
    .param p0, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    const/4 v1, 0x0

    .line 954
    if-eqz p0, :cond_25

    instance-of v2, p0, Lorg/jsoup/nodes/Element;

    if-eqz v2, :cond_25

    move-object v0, p0

    .line 955
    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 956
    .local v0, "element":Lorg/jsoup/nodes/Element;
    iget-object v2, v0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v2}, Lorg/jsoup/parser/Tag;->preserveWhitespace()Z

    move-result v2

    if-nez v2, :cond_24

    .line 957
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

    .line 959
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_25
    return v1
.end method


# virtual methods
.method public addClass(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 1085
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1087
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v0

    .line 1088
    .local v0, "classes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1089
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->classNames(Ljava/util/Set;)Lorg/jsoup/nodes/Element;

    .line 1091
    return-object p0
.end method

.method public after(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 453
    invoke-super {p0, p1}, Lorg/jsoup/nodes/Node;->after(Ljava/lang/String;)Lorg/jsoup/nodes/Node;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public after(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 464
    invoke-super {p0, p1}, Lorg/jsoup/nodes/Node;->after(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic after(Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 3

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->after(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic after(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;
    .registers 3

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->after(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public append(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 400
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 402
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, p0, v1}, Lorg/jsoup/parser/Parser;->parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 403
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lorg/jsoup/nodes/Node;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/jsoup/nodes/Node;

    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Element;->addChildren([Lorg/jsoup/nodes/Node;)V

    .line 404
    return-object p0
.end method

.method public appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "child"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 296
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 299
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->reparentChild(Lorg/jsoup/nodes/Node;)V

    .line 300
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->ensureChildNodes()V

    .line 301
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 302
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Lorg/jsoup/nodes/Node;->setSiblingIndex(I)V

    .line 303
    return-object p0
.end method

.method public appendElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "tagName"    # Ljava/lang/String;

    .prologue
    .line 349
    new-instance v0, Lorg/jsoup/nodes/Element;

    invoke-static {p1}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    .line 350
    .local v0, "child":Lorg/jsoup/nodes/Element;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 351
    return-object v0
.end method

.method public appendText(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 374
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 375
    new-instance v0, Lorg/jsoup/nodes/TextNode;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/jsoup/nodes/TextNode;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 376
    .local v0, "node":Lorg/jsoup/nodes/TextNode;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 377
    return-object p0
.end method

.method public attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "attributeKey"    # Ljava/lang/String;
    .param p2, "attributeValue"    # Ljava/lang/String;

    .prologue
    .line 129
    invoke-super {p0, p1, p2}, Lorg/jsoup/nodes/Node;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Node;

    .line 130
    return-object p0
.end method

.method public attr(Ljava/lang/String;Z)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "attributeKey"    # Ljava/lang/String;
    .param p2, "attributeValue"    # Z

    .prologue
    .line 144
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0, p1, p2}, Lorg/jsoup/nodes/Attributes;->put(Ljava/lang/String;Z)V

    .line 145
    return-object p0
.end method

.method public bridge synthetic attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 4

    .prologue
    .line 34
    invoke-virtual {p0, p1, p2}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public before(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 430
    invoke-super {p0, p1}, Lorg/jsoup/nodes/Node;->before(Ljava/lang/String;)Lorg/jsoup/nodes/Node;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public before(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 441
    invoke-super {p0, p1}, Lorg/jsoup/nodes/Node;->before(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic before(Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 3

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->before(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic before(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Node;
    .registers 3

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->before(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public child(I)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 200
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public children()Lorg/jsoup/select/Elements;
    .registers 5

    .prologue
    .line 214
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 215
    .local v0, "elements":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Element;>;"
    iget-object v2, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_11
    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Node;

    .line 216
    .local v1, "node":Lorg/jsoup/nodes/Node;
    instance-of v3, v1, Lorg/jsoup/nodes/Element;

    if-eqz v3, :cond_11

    .line 217
    check-cast v1, Lorg/jsoup/nodes/Element;

    .end local v1    # "node":Lorg/jsoup/nodes/Node;
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 219
    :cond_27
    new-instance v2, Lorg/jsoup/select/Elements;

    invoke-direct {v2, v0}, Lorg/jsoup/select/Elements;-><init>(Ljava/util/List;)V

    return-object v2
.end method

.method public className()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1024
    const-string v0, "class"

    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public classNames()Ljava/util/Set;
    .registers 5
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
    .line 1034
    sget-object v2, Lorg/jsoup/nodes/Element;->classSplit:Ljava/util/regex/Pattern;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->className()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v1

    .line 1035
    .local v1, "names":[Ljava/lang/String;
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 1036
    .local v0, "classNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v2, ""

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1038
    return-object v0
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
    .line 1047
    .local p1, "classNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1048
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v1, "class"

    const-string v2, " "

    invoke-static {p1, v2}, Lorg/jsoup/helper/StringUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/jsoup/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1049
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
    .line 34
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->clone()Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/jsoup/nodes/Element;
    .registers 2

    .prologue
    .line 1233
    invoke-super {p0}, Lorg/jsoup/nodes/Node;->clone()Lorg/jsoup/nodes/Node;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/jsoup/nodes/Node;
    .registers 2

    .prologue
    .line 34
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->clone()Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public cssSelector()Ljava/lang/String;
    .registers 7

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 498
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->id()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_24

    .line 499
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->id()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 514
    :goto_23
    return-object v2

    .line 501
    :cond_24
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 502
    .local v1, "selector":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v2

    const-string v3, "."

    invoke-static {v2, v3}, Lorg/jsoup/helper/StringUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 503
    .local v0, "classes":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_46

    .line 504
    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 506
    :cond_46
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v2

    if-eqz v2, :cond_54

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v2

    instance-of v2, v2, Lorg/jsoup/nodes/Document;

    if-eqz v2, :cond_59

    .line 507
    :cond_54
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_23

    .line 509
    :cond_59
    const-string v2, " > "

    invoke-virtual {v1, v5, v2}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 510
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jsoup/nodes/Element;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jsoup/select/Elements;->size()I

    move-result v2

    if-le v2, v4, :cond_8b

    .line 511
    const-string v2, ":nth-child(%d)"

    new-array v3, v4, [Ljava/lang/Object;

    .line 512
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->elementSiblingIndex()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    .line 511
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 514
    :cond_8b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->cssSelector()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_23
.end method

.method public data()Ljava/lang/String;
    .registers 8

    .prologue
    .line 1003
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 1005
    .local v4, "sb":Ljava/lang/StringBuilder;
    iget-object v5, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_b
    :goto_b
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_35

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 1006
    .local v0, "childNode":Lorg/jsoup/nodes/Node;
    instance-of v6, v0, Lorg/jsoup/nodes/DataNode;

    if-eqz v6, :cond_26

    move-object v1, v0

    .line 1007
    check-cast v1, Lorg/jsoup/nodes/DataNode;

    .line 1008
    .local v1, "data":Lorg/jsoup/nodes/DataNode;
    invoke-virtual {v1}, Lorg/jsoup/nodes/DataNode;->getWholeData()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    .line 1009
    .end local v1    # "data":Lorg/jsoup/nodes/DataNode;
    :cond_26
    instance-of v6, v0, Lorg/jsoup/nodes/Element;

    if-eqz v6, :cond_b

    move-object v2, v0

    .line 1010
    check-cast v2, Lorg/jsoup/nodes/Element;

    .line 1011
    .local v2, "element":Lorg/jsoup/nodes/Element;
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->data()Ljava/lang/String;

    move-result-object v3

    .line 1012
    .local v3, "elementData":Ljava/lang/String;
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    .line 1015
    .end local v0    # "childNode":Lorg/jsoup/nodes/Node;
    .end local v2    # "element":Lorg/jsoup/nodes/Element;
    .end local v3    # "elementData":Ljava/lang/String;
    :cond_35
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
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
    .line 257
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 258
    .local v0, "dataNodes":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/DataNode;>;"
    iget-object v2, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Node;

    .line 259
    .local v1, "node":Lorg/jsoup/nodes/Node;
    instance-of v3, v1, Lorg/jsoup/nodes/DataNode;

    if-eqz v3, :cond_b

    .line 260
    check-cast v1, Lorg/jsoup/nodes/DataNode;

    .end local v1    # "node":Lorg/jsoup/nodes/Node;
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 262
    :cond_21
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    return-object v2
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
    .line 162
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Attributes;->dataset()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public elementSiblingIndex()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 586
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    if-nez v0, :cond_c

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 587
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
    .line 472
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 473
    return-object p0
.end method

.method public firstElementSibling()Lorg/jsoup/nodes/Element;
    .registers 4

    .prologue
    .line 576
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 577
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
    .line 876
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
    .line 635
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 637
    new-instance v1, Lorg/jsoup/select/Evaluator$Id;

    invoke-direct {v1, p1}, Lorg/jsoup/select/Evaluator$Id;-><init>(Ljava/lang/String;)V

    invoke-static {v1, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 638
    .local v0, "elements":Lorg/jsoup/select/Elements;
    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->size()I

    move-result v1

    if-lez v1, :cond_1a

    .line 639
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/jsoup/select/Elements;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 641
    :goto_19
    return-object v1

    :cond_1a
    const/4 v1, 0x0

    goto :goto_19
.end method

.method public getElementsByAttribute(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 668
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 669
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 671
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
    .line 681
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 682
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 684
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
    .line 695
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
    .line 739
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
    .line 728
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
    .line 762
    :try_start_0
    invoke-static {p2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    :try_end_3
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_3} :catch_9

    move-result-object v1

    .line 766
    .local v1, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {p0, p1, v1}, Lorg/jsoup/nodes/Element;->getElementsByAttributeValueMatching(Ljava/lang/String;Ljava/util/regex/Pattern;)Lorg/jsoup/select/Elements;

    move-result-object v2

    return-object v2

    .line 763
    .end local v1    # "pattern":Ljava/util/regex/Pattern;
    :catch_9
    move-exception v0

    .line 764
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
    .line 749
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
    .line 706
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
    .line 717
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
    .line 656
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 658
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
    .line 793
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
    .line 784
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
    .line 775
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
    .line 619
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 620
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 622
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
    .line 815
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
    .line 804
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
    .line 863
    :try_start_0
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    :try_end_3
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_3} :catch_9

    move-result-object v1

    .line 867
    .local v1, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Element;->getElementsMatchingOwnText(Ljava/util/regex/Pattern;)Lorg/jsoup/select/Elements;

    move-result-object v2

    return-object v2

    .line 864
    .end local v1    # "pattern":Ljava/util/regex/Pattern;
    :catch_9
    move-exception v0

    .line 865
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
    .line 851
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
    .line 837
    :try_start_0
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    :try_end_3
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_3} :catch_9

    move-result-object v1

    .line 841
    .local v1, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Element;->getElementsMatchingText(Ljava/util/regex/Pattern;)Lorg/jsoup/select/Elements;

    move-result-object v2

    return-object v2

    .line 838
    .end local v1    # "pattern":Ljava/util/regex/Pattern;
    :catch_9
    move-exception v0

    .line 839
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
    .line 825
    new-instance v0, Lorg/jsoup/select/Evaluator$Matches;

    invoke-direct {v0, p1}, Lorg/jsoup/select/Evaluator$Matches;-><init>(Ljava/util/regex/Pattern;)V

    invoke-static {v0, p0}, Lorg/jsoup/select/Collector;->collect(Lorg/jsoup/select/Evaluator;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public hasClass(Ljava/lang/String;)Z
    .registers 9
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1066
    iget-object v4, p0, Lorg/jsoup/nodes/Element;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v5, "class"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1067
    .local v0, "classAttr":Ljava/lang/String;
    const-string v4, ""

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1b

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_1c

    .line 1076
    :cond_1b
    :goto_1b
    return v3

    .line 1070
    :cond_1c
    sget-object v4, Lorg/jsoup/nodes/Element;->classSplit:Ljava/util/regex/Pattern;

    invoke-virtual {v4, v0}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v1

    .line 1071
    .local v1, "classes":[Ljava/lang/String;
    array-length v5, v1

    move v4, v3

    :goto_24
    if-ge v4, v5, :cond_1b

    aget-object v2, v1, v4

    .line 1072
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_30

    .line 1073
    const/4 v3, 0x1

    goto :goto_1b

    .line 1071
    :cond_30
    add-int/lit8 v4, v4, 0x1

    goto :goto_24
.end method

.method public hasText()Z
    .registers 7

    .prologue
    const/4 v3, 0x1

    .line 982
    iget-object v4, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_7
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 983
    .local v0, "child":Lorg/jsoup/nodes/Node;
    instance-of v5, v0, Lorg/jsoup/nodes/TextNode;

    if-eqz v5, :cond_21

    move-object v2, v0

    .line 984
    check-cast v2, Lorg/jsoup/nodes/TextNode;

    .line 985
    .local v2, "textNode":Lorg/jsoup/nodes/TextNode;
    invoke-virtual {v2}, Lorg/jsoup/nodes/TextNode;->isBlank()Z

    move-result v5

    if-nez v5, :cond_7

    .line 993
    .end local v0    # "child":Lorg/jsoup/nodes/Node;
    .end local v2    # "textNode":Lorg/jsoup/nodes/TextNode;
    :goto_20
    return v3

    .line 987
    .restart local v0    # "child":Lorg/jsoup/nodes/Node;
    :cond_21
    instance-of v5, v0, Lorg/jsoup/nodes/Element;

    if-eqz v5, :cond_7

    move-object v1, v0

    .line 988
    check-cast v1, Lorg/jsoup/nodes/Element;

    .line 989
    .local v1, "el":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->hasText()Z

    move-result v5

    if-eqz v5, :cond_7

    goto :goto_20

    .line 993
    .end local v0    # "child":Lorg/jsoup/nodes/Node;
    .end local v1    # "el":Lorg/jsoup/nodes/Element;
    :cond_2f
    const/4 v3, 0x0

    goto :goto_20
.end method

.method public html(Ljava/lang/Appendable;)Ljava/lang/Appendable;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Appendable;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 1209
    .local p1, "appendable":Ljava/lang/Appendable;, "TT;"
    iget-object v1, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 1210
    .local v0, "node":Lorg/jsoup/nodes/Node;
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Node;->outerHtml(Ljava/lang/Appendable;)V

    goto :goto_6

    .line 1212
    .end local v0    # "node":Lorg/jsoup/nodes/Node;
    :cond_16
    return-object p1
.end method

.method public html()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1195
    .local v0, "accum":Ljava/lang/StringBuilder;
    invoke-direct {p0, v0}, Lorg/jsoup/nodes/Element;->html(Ljava/lang/StringBuilder;)V

    .line 1196
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->getOutputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/nodes/Document$OutputSettings;->prettyPrint()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    :goto_1a
    return-object v1

    :cond_1b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1a
.end method

.method public html(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 2
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 1222
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->empty()Lorg/jsoup/nodes/Element;

    .line 1223
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->append(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 1224
    return-object p0
.end method

.method public id()Ljava/lang/String;
    .registers 3

    .prologue
    .line 119
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v1, "id"

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

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
    .line 330
    .local p2, "children":Ljava/util/Collection;, "Ljava/util/Collection<+Lorg/jsoup/nodes/Node;>;"
    const-string v3, "Children collection to be inserted must not be null."

    invoke-static {p2, v3}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 331
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->childNodeSize()I

    move-result v0

    .line 332
    .local v0, "currentSize":I
    if-gez p1, :cond_e

    add-int/lit8 v3, v0, 0x1

    add-int/2addr p1, v3

    .line 333
    :cond_e
    if-ltz p1, :cond_2d

    if-gt p1, v0, :cond_2d

    const/4 v3, 0x1

    :goto_13
    const-string v4, "Insert position out of bounds."

    invoke-static {v3, v4}, Lorg/jsoup/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 335
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 336
    .local v2, "nodes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Node;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Lorg/jsoup/nodes/Node;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/jsoup/nodes/Node;

    .line 337
    .local v1, "nodeArray":[Lorg/jsoup/nodes/Node;
    invoke-virtual {p0, p1, v1}, Lorg/jsoup/nodes/Element;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 338
    return-object p0

    .line 333
    .end local v1    # "nodeArray":[Lorg/jsoup/nodes/Node;
    .end local v2    # "nodes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jsoup/nodes/Node;>;"
    :cond_2d
    const/4 v3, 0x0

    goto :goto_13
.end method

.method public isBlock()Z
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->isBlock()Z

    move-result v0

    return v0
.end method

.method public lastElementSibling()Lorg/jsoup/nodes/Element;
    .registers 4

    .prologue
    .line 595
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 596
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

    .line 544
    iget-object v3, p0, Lorg/jsoup/nodes/Element;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v3, :cond_6

    .line 551
    :cond_5
    :goto_5
    return-object v2

    .line 545
    :cond_6
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v1

    .line 546
    .local v1, "siblings":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Element;>;"
    invoke-static {p0, v1}, Lorg/jsoup/nodes/Element;->indexInList(Lorg/jsoup/nodes/Element;Ljava/util/List;)Ljava/lang/Integer;

    move-result-object v0

    .line 547
    .local v0, "index":Ljava/lang/Integer;
    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 548
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    if-le v3, v4, :cond_5

    .line 549
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
    .line 69
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method outerHtmlHead(Ljava/lang/Appendable;ILorg/jsoup/nodes/Document$OutputSettings;)V
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
    .line 1152
    invoke-virtual {p3}, Lorg/jsoup/nodes/Document$OutputSettings;->prettyPrint()Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->formatAsBlock()Z

    move-result v0

    if-nez v0, :cond_28

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    if-eqz v0, :cond_22

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->tag()Lorg/jsoup/parser/Tag;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->formatAsBlock()Z

    move-result v0

    if-nez v0, :cond_28

    :cond_22
    invoke-virtual {p3}, Lorg/jsoup/nodes/Document$OutputSettings;->outline()Z

    move-result v0

    if-eqz v0, :cond_38

    .line 1153
    :cond_28
    instance-of v0, p1, Ljava/lang/StringBuilder;

    if-eqz v0, :cond_70

    move-object v0, p1

    .line 1154
    check-cast v0, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_38

    .line 1155
    invoke-virtual {p0, p1, p2, p3}, Lorg/jsoup/nodes/Element;->indent(Ljava/lang/Appendable;ILorg/jsoup/nodes/Document$OutputSettings;)V

    .line 1160
    :cond_38
    :goto_38
    const-string v0, "<"

    .line 1161
    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    .line 1162
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 1163
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0, p1, p3}, Lorg/jsoup/nodes/Attributes;->html(Ljava/lang/Appendable;Lorg/jsoup/nodes/Document$OutputSettings;)V

    .line 1166
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7a

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->isSelfClosing()Z

    move-result v0

    if-eqz v0, :cond_7a

    .line 1167
    invoke-virtual {p3}, Lorg/jsoup/nodes/Document$OutputSettings;->syntax()Lorg/jsoup/nodes/Document$OutputSettings$Syntax;

    move-result-object v0

    sget-object v1, Lorg/jsoup/nodes/Document$OutputSettings$Syntax;->html:Lorg/jsoup/nodes/Document$OutputSettings$Syntax;

    if-ne v0, v1, :cond_74

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_74

    .line 1168
    const/16 v0, 0x3e

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 1174
    :goto_6f
    return-void

    .line 1157
    :cond_70
    invoke-virtual {p0, p1, p2, p3}, Lorg/jsoup/nodes/Element;->indent(Ljava/lang/Appendable;ILorg/jsoup/nodes/Document$OutputSettings;)V

    goto :goto_38

    .line 1170
    :cond_74
    const-string v0, " />"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_6f

    .line 1173
    :cond_7a
    const-string v0, ">"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_6f
.end method

.method outerHtmlTail(Ljava/lang/Appendable;ILorg/jsoup/nodes/Document$OutputSettings;)V
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
    const/4 v1, 0x1

    .line 1177
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->isSelfClosing()Z

    move-result v0

    if-nez v0, :cond_5e

    .line 1178
    :cond_11
    invoke-virtual {p3}, Lorg/jsoup/nodes/Document$OutputSettings;->prettyPrint()Z

    move-result v0

    if-eqz v0, :cond_4b

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4b

    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    .line 1179
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

    .line 1181
    :cond_48
    invoke-virtual {p0, p1, p2, p3}, Lorg/jsoup/nodes/Element;->indent(Ljava/lang/Appendable;ILorg/jsoup/nodes/Document$OutputSettings;)V

    .line 1182
    :cond_4b
    const-string v0, "</"

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    const-string v1, ">"

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 1184
    :cond_5e
    return-void
.end method

.method public ownText()Ljava/lang/String;
    .registers 3

    .prologue
    .line 922
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 923
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-direct {p0, v0}, Lorg/jsoup/nodes/Element;->ownText(Ljava/lang/StringBuilder;)V

    .line 924
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public final parent()Lorg/jsoup/nodes/Element;
    .registers 2

    .prologue
    .line 167
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->parentNode:Lorg/jsoup/nodes/Node;

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic parent()Lorg/jsoup/nodes/Node;
    .registers 2

    .prologue
    .line 34
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public parents()Lorg/jsoup/select/Elements;
    .registers 2

    .prologue
    .line 175
    new-instance v0, Lorg/jsoup/select/Elements;

    invoke-direct {v0}, Lorg/jsoup/select/Elements;-><init>()V

    .line 176
    .local v0, "parents":Lorg/jsoup/select/Elements;
    invoke-static {p0, v0}, Lorg/jsoup/nodes/Element;->accumulateParents(Lorg/jsoup/nodes/Element;Lorg/jsoup/select/Elements;)V

    .line 177
    return-object v0
.end method

.method public prepend(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 414
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 416
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, p0, v1}, Lorg/jsoup/parser/Parser;->parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 417
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    const/4 v2, 0x0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lorg/jsoup/nodes/Node;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/jsoup/nodes/Node;

    invoke-virtual {p0, v2, v1}, Lorg/jsoup/nodes/Element;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 418
    return-object p0
.end method

.method public prependChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "child"    # Lorg/jsoup/nodes/Node;

    .prologue
    const/4 v1, 0x0

    .line 313
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 315
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/jsoup/nodes/Node;

    aput-object p1, v0, v1

    invoke-virtual {p0, v1, v0}, Lorg/jsoup/nodes/Element;->addChildren(I[Lorg/jsoup/nodes/Node;)V

    .line 316
    return-object p0
.end method

.method public prependElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "tagName"    # Ljava/lang/String;

    .prologue
    .line 362
    new-instance v0, Lorg/jsoup/nodes/Element;

    invoke-static {p1}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    .line 363
    .local v0, "child":Lorg/jsoup/nodes/Element;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->prependChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 364
    return-object v0
.end method

.method public prependText(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 387
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 388
    new-instance v0, Lorg/jsoup/nodes/TextNode;

    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->baseUri()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/jsoup/nodes/TextNode;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    .local v0, "node":Lorg/jsoup/nodes/TextNode;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->prependChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 390
    return-object p0
.end method

.method public previousElementSibling()Lorg/jsoup/nodes/Element;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 560
    iget-object v3, p0, Lorg/jsoup/nodes/Element;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v3, :cond_6

    .line 567
    :cond_5
    :goto_5
    return-object v2

    .line 561
    :cond_6
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v1

    .line 562
    .local v1, "siblings":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Element;>;"
    invoke-static {p0, v1}, Lorg/jsoup/nodes/Element;->indexInList(Lorg/jsoup/nodes/Element;Ljava/util/List;)Ljava/lang/Integer;

    move-result-object v0

    .line 563
    .local v0, "index":Ljava/lang/Integer;
    invoke-static {v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 564
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-lez v3, :cond_5

    .line 565
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
    .line 1100
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1102
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v0

    .line 1103
    .local v0, "classes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1104
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->classNames(Ljava/util/Set;)Lorg/jsoup/nodes/Element;

    .line 1106
    return-object p0
.end method

.method public select(Ljava/lang/String;)Lorg/jsoup/select/Elements;
    .registers 3
    .param p1, "cssQuery"    # Ljava/lang/String;

    .prologue
    .line 286
    invoke-static {p1, p0}, Lorg/jsoup/select/Selector;->select(Ljava/lang/String;Lorg/jsoup/nodes/Element;)Lorg/jsoup/select/Elements;

    move-result-object v0

    return-object v0
.end method

.method public siblingElements()Lorg/jsoup/select/Elements;
    .registers 6

    .prologue
    .line 523
    iget-object v3, p0, Lorg/jsoup/nodes/Element;->parentNode:Lorg/jsoup/nodes/Node;

    if-nez v3, :cond_b

    .line 524
    new-instance v2, Lorg/jsoup/select/Elements;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lorg/jsoup/select/Elements;-><init>(I)V

    .line 531
    :cond_a
    return-object v2

    .line 526
    :cond_b
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->children()Lorg/jsoup/select/Elements;

    move-result-object v1

    .line 527
    .local v1, "elements":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Element;>;"
    new-instance v2, Lorg/jsoup/select/Elements;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-direct {v2, v3}, Lorg/jsoup/select/Elements;-><init>(I)V

    .line 528
    .local v2, "siblings":Lorg/jsoup/select/Elements;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_22
    :goto_22
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 529
    .local v0, "el":Lorg/jsoup/nodes/Element;
    if-eq v0, p0, :cond_22

    .line 530
    invoke-virtual {v2, v0}, Lorg/jsoup/select/Elements;->add(Ljava/lang/Object;)Z

    goto :goto_22
.end method

.method public tag()Lorg/jsoup/parser/Tag;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    return-object v0
.end method

.method public tagName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    invoke-virtual {v0}, Lorg/jsoup/parser/Tag;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public tagName(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "tagName"    # Ljava/lang/String;

    .prologue
    .line 89
    const-string v0, "Tag name must not be empty."

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    invoke-static {p1}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/nodes/Element;->tag:Lorg/jsoup/parser/Tag;

    .line 91
    return-object p0
.end method

.method public text()Ljava/lang/String;
    .registers 4

    .prologue
    .line 889
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 890
    .local v0, "accum":Ljava/lang/StringBuilder;
    new-instance v1, Lorg/jsoup/select/NodeTraversor;

    new-instance v2, Lorg/jsoup/nodes/Element$1;

    invoke-direct {v2, p0, v0}, Lorg/jsoup/nodes/Element$1;-><init>(Lorg/jsoup/nodes/Element;Ljava/lang/StringBuilder;)V

    invoke-direct {v1, v2}, Lorg/jsoup/select/NodeTraversor;-><init>(Lorg/jsoup/select/NodeVisitor;)V

    .line 906
    invoke-virtual {v1, p0}, Lorg/jsoup/select/NodeTraversor;->traverse(Lorg/jsoup/nodes/Node;)V

    .line 907
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
    .line 968
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 970
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->empty()Lorg/jsoup/nodes/Element;

    .line 971
    new-instance v0, Lorg/jsoup/nodes/TextNode;

    iget-object v1, p0, Lorg/jsoup/nodes/Element;->baseUri:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Lorg/jsoup/nodes/TextNode;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 972
    .local v0, "textNode":Lorg/jsoup/nodes/TextNode;
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 974
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
    .line 239
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 240
    .local v1, "textNodes":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/TextNode;>;"
    iget-object v2, p0, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 241
    .local v0, "node":Lorg/jsoup/nodes/Node;
    instance-of v3, v0, Lorg/jsoup/nodes/TextNode;

    if-eqz v3, :cond_b

    .line 242
    check-cast v0, Lorg/jsoup/nodes/TextNode;

    .end local v0    # "node":Lorg/jsoup/nodes/Node;
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 244
    :cond_21
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1228
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toggleClass(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 4
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 1115
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 1117
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v0

    .line 1118
    .local v0, "classes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 1119
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1122
    :goto_10
    invoke-virtual {p0, v0}, Lorg/jsoup/nodes/Element;->classNames(Ljava/util/Set;)Lorg/jsoup/nodes/Element;

    .line 1124
    return-object p0

    .line 1121
    :cond_14
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_10
.end method

.method public val()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1132
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "textarea"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1133
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v0

    .line 1135
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
    .line 1144
    invoke-virtual {p0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "textarea"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 1145
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->text(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 1148
    :goto_f
    return-object p0

    .line 1147
    :cond_10
    const-string v0, "value"

    invoke-virtual {p0, v0, p1}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_f
.end method

.method public wrap(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 484
    invoke-super {p0, p1}, Lorg/jsoup/nodes/Node;->wrap(Ljava/lang/String;)Lorg/jsoup/nodes/Node;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public bridge synthetic wrap(Ljava/lang/String;)Lorg/jsoup/nodes/Node;
    .registers 3

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Element;->wrap(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method
