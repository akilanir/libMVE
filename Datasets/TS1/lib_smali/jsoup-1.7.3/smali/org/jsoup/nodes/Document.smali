.class public Lorg/jsoup/nodes/Document;
.super Lorg/jsoup/nodes/Element;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/nodes/Document$QuirksMode;,
        Lorg/jsoup/nodes/Document$OutputSettings;
    }
.end annotation


# instance fields
.field private location:Ljava/lang/String;

.field private outputSettings:Lorg/jsoup/nodes/Document$OutputSettings;

.field private quirksMode:Lorg/jsoup/nodes/Document$QuirksMode;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 29
    const-string v0, "#root"

    invoke-static {v0}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    .line 18
    new-instance v0, Lorg/jsoup/nodes/Document$OutputSettings;

    invoke-direct {v0}, Lorg/jsoup/nodes/Document$OutputSettings;-><init>()V

    iput-object v0, p0, Lorg/jsoup/nodes/Document;->outputSettings:Lorg/jsoup/nodes/Document$OutputSettings;

    .line 19
    sget-object v0, Lorg/jsoup/nodes/Document$QuirksMode;->noQuirks:Lorg/jsoup/nodes/Document$QuirksMode;

    iput-object v0, p0, Lorg/jsoup/nodes/Document;->quirksMode:Lorg/jsoup/nodes/Document$QuirksMode;

    .line 30
    iput-object p1, p0, Lorg/jsoup/nodes/Document;->location:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public static createShell(Ljava/lang/String;)Lorg/jsoup/nodes/Document;
    .registers 4
    .param p0, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-static {p0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 41
    new-instance v0, Lorg/jsoup/nodes/Document;

    invoke-direct {v0, p0}, Lorg/jsoup/nodes/Document;-><init>(Ljava/lang/String;)V

    .line 42
    .local v0, "doc":Lorg/jsoup/nodes/Document;
    const-string v2, "html"

    invoke-virtual {v0, v2}, Lorg/jsoup/nodes/Document;->appendElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    .line 43
    .local v1, "html":Lorg/jsoup/nodes/Element;
    const-string v2, "head"

    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Element;->appendElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 44
    const-string v2, "body"

    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Element;->appendElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 46
    return-object v0
.end method

.method private findFirstElementByTagName(Ljava/lang/String;Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;
    .registers 7
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 177
    invoke-virtual {p2}, Lorg/jsoup/nodes/Node;->nodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 178
    check-cast p2, Lorg/jsoup/nodes/Element;

    .line 186
    .end local p2    # "node":Lorg/jsoup/nodes/Node;
    :goto_c
    return-object p2

    .line 180
    .restart local p2    # "node":Lorg/jsoup/nodes/Node;
    :cond_d
    iget-object v3, p2, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_13
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 181
    .local v0, "child":Lorg/jsoup/nodes/Node;
    invoke-direct {p0, p1, v0}, Lorg/jsoup/nodes/Document;->findFirstElementByTagName(Ljava/lang/String;Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    .line 182
    .local v1, "found":Lorg/jsoup/nodes/Element;
    if-eqz v1, :cond_13

    move-object p2, v1

    .line 183
    goto :goto_c

    .line 186
    .end local v0    # "child":Lorg/jsoup/nodes/Node;
    .end local v1    # "found":Lorg/jsoup/nodes/Element;
    :cond_27
    const/4 p2, 0x0

    goto :goto_c
.end method

.method private normaliseStructure(Ljava/lang/String;Lorg/jsoup/nodes/Element;)V
    .registers 12
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "htmlEl"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 155
    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Document;->getElementsByTag(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v1

    .line 156
    .local v1, "elements":Lorg/jsoup/select/Elements;
    invoke-virtual {v1}, Lorg/jsoup/select/Elements;->first()Lorg/jsoup/nodes/Element;

    move-result-object v4

    .line 157
    .local v4, "master":Lorg/jsoup/nodes/Element;
    invoke-virtual {v1}, Lorg/jsoup/select/Elements;->size()I

    move-result v7

    const/4 v8, 0x1

    if-le v7, v8, :cond_4f

    .line 158
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 159
    .local v6, "toMove":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_15
    invoke-virtual {v1}, Lorg/jsoup/select/Elements;->size()I

    move-result v7

    if-ge v2, v7, :cond_3b

    .line 160
    invoke-virtual {v1, v2}, Lorg/jsoup/select/Elements;->get(I)Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 161
    .local v0, "dupe":Lorg/jsoup/nodes/Node;
    iget-object v7, v0, Lorg/jsoup/nodes/Node;->childNodes:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_25
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_35

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jsoup/nodes/Node;

    .line 162
    .local v5, "node":Lorg/jsoup/nodes/Node;
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_25

    .line 163
    .end local v5    # "node":Lorg/jsoup/nodes/Node;
    :cond_35
    invoke-virtual {v0}, Lorg/jsoup/nodes/Node;->remove()V

    .line 159
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 166
    .end local v0    # "dupe":Lorg/jsoup/nodes/Node;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_3b
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :goto_3f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Node;

    .line 167
    .restart local v0    # "dupe":Lorg/jsoup/nodes/Node;
    invoke-virtual {v4, v0}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    goto :goto_3f

    .line 170
    .end local v0    # "dupe":Lorg/jsoup/nodes/Node;
    .end local v2    # "i":I
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v6    # "toMove":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    :cond_4f
    invoke-virtual {v4}, Lorg/jsoup/nodes/Element;->parent()Lorg/jsoup/nodes/Element;

    move-result-object v7

    invoke-virtual {v7, p2}, Lorg/jsoup/nodes/Element;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5c

    .line 171
    invoke-virtual {p2, v4}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 173
    :cond_5c
    return-void
.end method

.method private normaliseTextNodes(Lorg/jsoup/nodes/Element;)V
    .registers 11
    .param p1, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 136
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .local v4, "toMove":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    iget-object v5, p1, Lorg/jsoup/nodes/Element;->childNodes:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_28

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Node;

    .line 138
    .local v2, "node":Lorg/jsoup/nodes/Node;
    instance-of v5, v2, Lorg/jsoup/nodes/TextNode;

    if-eqz v5, :cond_b

    move-object v3, v2

    .line 139
    check-cast v3, Lorg/jsoup/nodes/TextNode;

    .line 140
    .local v3, "tn":Lorg/jsoup/nodes/TextNode;
    invoke-virtual {v3}, Lorg/jsoup/nodes/TextNode;->isBlank()Z

    move-result v5

    if-nez v5, :cond_b

    .line 141
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 145
    .end local v2    # "node":Lorg/jsoup/nodes/Node;
    .end local v3    # "tn":Lorg/jsoup/nodes/TextNode;
    :cond_28
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v0, v5, -0x1

    .local v0, "i":I
    :goto_2e
    if-ltz v0, :cond_53

    .line 146
    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Node;

    .line 147
    .restart local v2    # "node":Lorg/jsoup/nodes/Node;
    invoke-virtual {p1, v2}, Lorg/jsoup/nodes/Element;->removeChild(Lorg/jsoup/nodes/Node;)V

    .line 148
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->body()Lorg/jsoup/nodes/Element;

    move-result-object v5

    new-instance v6, Lorg/jsoup/nodes/TextNode;

    const-string v7, " "

    const-string v8, ""

    invoke-direct {v6, v7, v8}, Lorg/jsoup/nodes/TextNode;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Lorg/jsoup/nodes/Element;->prependChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 149
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->body()Lorg/jsoup/nodes/Element;

    move-result-object v5

    invoke-virtual {v5, v2}, Lorg/jsoup/nodes/Element;->prependChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 145
    add-int/lit8 v0, v0, -0x1

    goto :goto_2e

    .line 151
    .end local v2    # "node":Lorg/jsoup/nodes/Node;
    :cond_53
    return-void
.end method


# virtual methods
.method public body()Lorg/jsoup/nodes/Element;
    .registers 2

    .prologue
    .line 71
    const-string v0, "body"

    invoke-direct {p0, v0, p0}, Lorg/jsoup/nodes/Document;->findFirstElementByTagName(Ljava/lang/String;Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    move-result-object v0

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
    .line 17
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->clone()Lorg/jsoup/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/jsoup/nodes/Document;
    .registers 3

    .prologue
    .line 212
    invoke-super {p0}, Lorg/jsoup/nodes/Element;->clone()Lorg/jsoup/nodes/Element;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Document;

    .line 213
    .local v0, "clone":Lorg/jsoup/nodes/Document;
    iget-object v1, p0, Lorg/jsoup/nodes/Document;->outputSettings:Lorg/jsoup/nodes/Document$OutputSettings;

    invoke-virtual {v1}, Lorg/jsoup/nodes/Document$OutputSettings;->clone()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v1

    iput-object v1, v0, Lorg/jsoup/nodes/Document;->outputSettings:Lorg/jsoup/nodes/Document$OutputSettings;

    .line 214
    return-object v0
.end method

.method public bridge synthetic clone()Lorg/jsoup/nodes/Element;
    .registers 2

    .prologue
    .line 17
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->clone()Lorg/jsoup/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lorg/jsoup/nodes/Node;
    .registers 2

    .prologue
    .line 17
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->clone()Lorg/jsoup/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public createElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 5
    .param p1, "tagName"    # Ljava/lang/String;

    .prologue
    .line 105
    new-instance v0, Lorg/jsoup/nodes/Element;

    invoke-static {p1}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 396
    invoke-super {p0, p1}, Lorg/jsoup/nodes/Element;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public head()Lorg/jsoup/nodes/Element;
    .registers 2

    .prologue
    .line 63
    const-string v0, "head"

    invoke-direct {p0, v0, p0}, Lorg/jsoup/nodes/Document;->findFirstElementByTagName(Ljava/lang/String;Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    return-object v0
.end method

.method public location()Ljava/lang/String;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lorg/jsoup/nodes/Document;->location:Ljava/lang/String;

    return-object v0
.end method

.method public nodeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 207
    const-string v0, "#document"

    return-object v0
.end method

.method public normalise()Lorg/jsoup/nodes/Document;
    .registers 3

    .prologue
    .line 114
    const-string v1, "html"

    invoke-direct {p0, v1, p0}, Lorg/jsoup/nodes/Document;->findFirstElementByTagName(Ljava/lang/String;Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 115
    .local v0, "htmlEl":Lorg/jsoup/nodes/Element;
    if-nez v0, :cond_e

    .line 116
    const-string v1, "html"

    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Document;->appendElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 117
    :cond_e
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->head()Lorg/jsoup/nodes/Element;

    move-result-object v1

    if-nez v1, :cond_19

    .line 118
    const-string v1, "head"

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->prependElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 119
    :cond_19
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->body()Lorg/jsoup/nodes/Element;

    move-result-object v1

    if-nez v1, :cond_24

    .line 120
    const-string v1, "body"

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->appendElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 124
    :cond_24
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->head()Lorg/jsoup/nodes/Element;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/jsoup/nodes/Document;->normaliseTextNodes(Lorg/jsoup/nodes/Element;)V

    .line 125
    invoke-direct {p0, v0}, Lorg/jsoup/nodes/Document;->normaliseTextNodes(Lorg/jsoup/nodes/Element;)V

    .line 126
    invoke-direct {p0, p0}, Lorg/jsoup/nodes/Document;->normaliseTextNodes(Lorg/jsoup/nodes/Element;)V

    .line 128
    const-string v1, "head"

    invoke-direct {p0, v1, v0}, Lorg/jsoup/nodes/Document;->normaliseStructure(Ljava/lang/String;Lorg/jsoup/nodes/Element;)V

    .line 129
    const-string v1, "body"

    invoke-direct {p0, v1, v0}, Lorg/jsoup/nodes/Document;->normaliseStructure(Ljava/lang/String;Lorg/jsoup/nodes/Element;)V

    .line 131
    return-object p0
.end method

.method public outerHtml()Ljava/lang/String;
    .registers 2

    .prologue
    .line 191
    invoke-super {p0}, Lorg/jsoup/nodes/Element;->html()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public outputSettings()Lorg/jsoup/nodes/Document$OutputSettings;
    .registers 2

    .prologue
    .line 367
    iget-object v0, p0, Lorg/jsoup/nodes/Document;->outputSettings:Lorg/jsoup/nodes/Document$OutputSettings;

    return-object v0
.end method

.method public outputSettings(Lorg/jsoup/nodes/Document$OutputSettings;)Lorg/jsoup/nodes/Document;
    .registers 2
    .param p1, "outputSettings"    # Lorg/jsoup/nodes/Document$OutputSettings;

    .prologue
    .line 376
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 377
    iput-object p1, p0, Lorg/jsoup/nodes/Document;->outputSettings:Lorg/jsoup/nodes/Document$OutputSettings;

    .line 378
    return-object p0
.end method

.method public quirksMode()Lorg/jsoup/nodes/Document$QuirksMode;
    .registers 2

    .prologue
    .line 386
    iget-object v0, p0, Lorg/jsoup/nodes/Document;->quirksMode:Lorg/jsoup/nodes/Document$QuirksMode;

    return-object v0
.end method

.method public quirksMode(Lorg/jsoup/nodes/Document$QuirksMode;)Lorg/jsoup/nodes/Document;
    .registers 2
    .param p1, "quirksMode"    # Lorg/jsoup/nodes/Document$QuirksMode;

    .prologue
    .line 390
    iput-object p1, p0, Lorg/jsoup/nodes/Document;->quirksMode:Lorg/jsoup/nodes/Document$QuirksMode;

    .line 391
    return-object p0
.end method

.method public text(Ljava/lang/String;)Lorg/jsoup/nodes/Element;
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 201
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->body()Lorg/jsoup/nodes/Element;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->text(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 202
    return-object p0
.end method

.method public title()Ljava/lang/String;
    .registers 3

    .prologue
    .line 80
    const-string v1, "title"

    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Document;->getElementsByTag(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/select/Elements;->first()Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 81
    .local v0, "titleEl":Lorg/jsoup/nodes/Element;
    if-eqz v0, :cond_19

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/jsoup/helper/StringUtil;->normaliseWhitespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    :goto_18
    return-object v1

    :cond_19
    const-string v1, ""

    goto :goto_18
.end method

.method public title(Ljava/lang/String;)V
    .registers 5
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 91
    const-string v1, "title"

    invoke-virtual {p0, v1}, Lorg/jsoup/nodes/Document;->getElementsByTag(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/select/Elements;->first()Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 92
    .local v0, "titleEl":Lorg/jsoup/nodes/Element;
    if-nez v0, :cond_1d

    .line 93
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->head()Lorg/jsoup/nodes/Element;

    move-result-object v1

    const-string v2, "title"

    invoke-virtual {v1, v2}, Lorg/jsoup/nodes/Element;->appendElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/jsoup/nodes/Element;->text(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 97
    :goto_1c
    return-void

    .line 95
    :cond_1d
    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->text(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    goto :goto_1c
.end method
