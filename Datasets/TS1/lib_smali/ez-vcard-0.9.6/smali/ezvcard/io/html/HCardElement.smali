.class public Lezvcard/io/html/HCardElement;
.super Ljava/lang/Object;
.source "HCardElement.java"


# instance fields
.field private final element:Lorg/jsoup/nodes/Element;


# direct methods
.method public constructor <init>(Lorg/jsoup/nodes/Element;)V
    .registers 2
    .param p1, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lezvcard/io/html/HCardElement;->element:Lorg/jsoup/nodes/Element;

    .line 58
    return-void
.end method

.method private value(Lorg/jsoup/nodes/Element;)Ljava/lang/String;
    .registers 9
    .param p1, "element"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 188
    const-string v5, "abbr"

    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    .line 189
    const-string v5, "title"

    invoke-virtual {p1, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 190
    .local v1, "title":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_19

    .line 218
    .end local v1    # "title":Ljava/lang/String;
    :goto_18
    return-object v1

    .line 195
    :cond_19
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 196
    .local v2, "value":Ljava/lang/StringBuilder;
    const-string v5, "value"

    invoke-virtual {p1, v5}, Lorg/jsoup/nodes/Element;->getElementsByClass(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v4

    .line 197
    .local v4, "valueElements":Lorg/jsoup/select/Elements;
    invoke-virtual {v4}, Lorg/jsoup/select/Elements;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_36

    .line 199
    invoke-direct {p0, p1, v2}, Lezvcard/io/html/HCardElement;->visitForValue(Lorg/jsoup/nodes/Element;Ljava/lang/StringBuilder;)V

    .line 218
    :cond_2d
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    goto :goto_18

    .line 202
    :cond_36
    invoke-virtual {v4}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_3a
    :goto_3a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    .line 203
    .local v3, "valueElement":Lorg/jsoup/nodes/Element;
    invoke-static {v3, v4}, Lezvcard/util/HtmlUtils;->isChildOf(Lorg/jsoup/nodes/Element;Lorg/jsoup/select/Elements;)Z

    move-result v5

    if-nez v5, :cond_3a

    .line 208
    const-string v5, "abbr"

    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_68

    .line 209
    const-string v5, "title"

    invoke-virtual {v3, v5}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 210
    .restart local v1    # "title":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_68

    .line 211
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3a

    .line 215
    .end local v1    # "title":Ljava/lang/String;
    :cond_68
    invoke-direct {p0, v3, v2}, Lezvcard/io/html/HCardElement;->visitForValue(Lorg/jsoup/nodes/Element;Ljava/lang/StringBuilder;)V

    goto :goto_3a
.end method

.method private visitForValue(Lorg/jsoup/nodes/Element;Ljava/lang/StringBuilder;)V
    .registers 9
    .param p1, "element"    # Lorg/jsoup/nodes/Element;
    .param p2, "value"    # Ljava/lang/StringBuilder;

    .prologue
    .line 222
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->childNodes()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_58

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Node;

    .line 223
    .local v2, "node":Lorg/jsoup/nodes/Node;
    instance-of v4, v2, Lorg/jsoup/nodes/Element;

    if-eqz v4, :cond_49

    move-object v0, v2

    .line 224
    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 225
    .local v0, "e":Lorg/jsoup/nodes/Element;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v4

    const-string v5, "type"

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    .line 230
    const-string v4, "br"

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_39

    .line 232
    sget-object v4, Lezvcard/util/StringUtils;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_8

    .line 236
    :cond_39
    const-string v4, "del"

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    .line 241
    invoke-direct {p0, v0, p2}, Lezvcard/io/html/HCardElement;->visitForValue(Lorg/jsoup/nodes/Element;Ljava/lang/StringBuilder;)V

    goto :goto_8

    .line 245
    .end local v0    # "e":Lorg/jsoup/nodes/Element;
    :cond_49
    instance-of v4, v2, Lorg/jsoup/nodes/TextNode;

    if-eqz v4, :cond_8

    move-object v3, v2

    .line 246
    check-cast v3, Lorg/jsoup/nodes/TextNode;

    .line 247
    .local v3, "t":Lorg/jsoup/nodes/TextNode;
    invoke-virtual {v3}, Lorg/jsoup/nodes/TextNode;->text()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_8

    .line 251
    .end local v2    # "node":Lorg/jsoup/nodes/Node;
    .end local v3    # "t":Lorg/jsoup/nodes/TextNode;
    :cond_58
    return-void
.end method


# virtual methods
.method public absUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 83
    iget-object v1, p0, Lezvcard/io/html/HCardElement;->element:Lorg/jsoup/nodes/Element;

    invoke-virtual {v1, p1}, Lorg/jsoup/nodes/Element;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 84
    .local v0, "url":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_12

    .line 85
    iget-object v1, p0, Lezvcard/io/html/HCardElement;->element:Lorg/jsoup/nodes/Element;

    invoke-virtual {v1, p1}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 87
    :cond_12
    return-object v0
.end method

.method public allValues(Ljava/lang/String;)Ljava/util/List;
    .registers 7
    .param p1, "cssClass"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 135
    iget-object v4, p0, Lezvcard/io/html/HCardElement;->element:Lorg/jsoup/nodes/Element;

    invoke-virtual {v4, p1}, Lorg/jsoup/nodes/Element;->getElementsByClass(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v1

    .line 136
    .local v1, "elements":Lorg/jsoup/select/Elements;
    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v1}, Lorg/jsoup/select/Elements;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 137
    .local v3, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v1}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 138
    .local v0, "element":Lorg/jsoup/nodes/Element;
    invoke-direct {p0, v0}, Lezvcard/io/html/HCardElement;->value(Lorg/jsoup/nodes/Element;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 140
    .end local v0    # "element":Lorg/jsoup/nodes/Element;
    :cond_27
    return-object v3
.end method

.method public append(Ljava/lang/String;)V
    .registers 10
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 161
    const/4 v1, 0x1

    .line 162
    .local v1, "first":Z
    const-string v6, "\\r\\n|\\n|\\r"

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 163
    .local v5, "lines":[Ljava/lang/String;
    move-object v0, v5

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_a
    if-ge v2, v3, :cond_26

    aget-object v4, v0, v2

    .line 164
    .local v4, "line":Ljava/lang/String;
    if-nez v1, :cond_17

    .line 166
    iget-object v6, p0, Lezvcard/io/html/HCardElement;->element:Lorg/jsoup/nodes/Element;

    const-string v7, "br"

    invoke-virtual {v6, v7}, Lorg/jsoup/nodes/Element;->appendElement(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 169
    :cond_17
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_22

    .line 170
    iget-object v6, p0, Lezvcard/io/html/HCardElement;->element:Lorg/jsoup/nodes/Element;

    invoke-virtual {v6, v4}, Lorg/jsoup/nodes/Element;->appendText(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    .line 173
    :cond_22
    const/4 v1, 0x0

    .line 163
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 175
    .end local v4    # "line":Ljava/lang/String;
    :cond_26
    return-void
.end method

.method public attr(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 74
    iget-object v0, p0, Lezvcard/io/html/HCardElement;->element:Lorg/jsoup/nodes/Element;

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public classNames()Ljava/util/Set;
    .registers 2
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
    .line 95
    iget-object v0, p0, Lezvcard/io/html/HCardElement;->element:Lorg/jsoup/nodes/Element;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->classNames()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public firstValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "cssClass"    # Ljava/lang/String;

    .prologue
    .line 124
    iget-object v1, p0, Lezvcard/io/html/HCardElement;->element:Lorg/jsoup/nodes/Element;

    invoke-virtual {v1, p1}, Lorg/jsoup/nodes/Element;->getElementsByClass(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object v0

    .line 125
    .local v0, "elements":Lorg/jsoup/select/Elements;
    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_e

    const/4 v1, 0x0

    :goto_d
    return-object v1

    :cond_e
    invoke-virtual {v0}, Lorg/jsoup/select/Elements;->first()Lorg/jsoup/nodes/Element;

    move-result-object v1

    invoke-direct {p0, v1}, Lezvcard/io/html/HCardElement;->value(Lorg/jsoup/nodes/Element;)Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getElement()Lorg/jsoup/nodes/Element;
    .registers 2

    .prologue
    .line 182
    iget-object v0, p0, Lezvcard/io/html/HCardElement;->element:Lorg/jsoup/nodes/Element;

    return-object v0
.end method

.method public tagName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lezvcard/io/html/HCardElement;->element:Lorg/jsoup/nodes/Element;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public types()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 148
    const-string v4, "type"

    invoke-virtual {p0, v4}, Lezvcard/io/html/HCardElement;->allValues(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 149
    .local v3, "types":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 150
    .local v1, "lowerCaseTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 151
    .local v2, "type":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 153
    .end local v2    # "type":Ljava/lang/String;
    :cond_27
    return-object v1
.end method

.method public value()Ljava/lang/String;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lezvcard/io/html/HCardElement;->element:Lorg/jsoup/nodes/Element;

    invoke-direct {p0, v0}, Lezvcard/io/html/HCardElement;->value(Lorg/jsoup/nodes/Element;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
