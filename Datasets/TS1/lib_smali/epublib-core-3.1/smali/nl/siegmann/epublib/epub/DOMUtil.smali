.class Lnl/siegmann/epublib/epub/DOMUtil;
.super Ljava/lang/Object;
.source "DOMUtil.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "element"    # Lorg/w3c/dom/Element;
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "attribute"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-interface {p0, p1, p2}, Lorg/w3c/dom/Element;->getAttributeNS(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 34
    .local v0, "result":Ljava/lang/String;
    invoke-static {v0}, Lnl/siegmann/epublib/util/StringUtil;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 35
    invoke-interface {p0, p2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 37
    :cond_e
    return-object v0
.end method

.method public static getElementsTextChild(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 7
    .param p0, "parentElement"    # Lorg/w3c/dom/Element;
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "tagname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 49
    invoke-interface {p0, p1, p2}, Lorg/w3c/dom/Element;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 50
    .local v0, "elements":Lorg/w3c/dom/NodeList;
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 51
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_24

    .line 52
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    invoke-static {v3}, Lnl/siegmann/epublib/epub/DOMUtil;->getTextChildrenContent(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 54
    :cond_24
    return-object v2
.end method

.method public static getFindAttributeValue(Lorg/w3c/dom/Document;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "document"    # Lorg/w3c/dom/Document;
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "elementName"    # Ljava/lang/String;
    .param p3, "findAttributeName"    # Ljava/lang/String;
    .param p4, "findAttributeValue"    # Ljava/lang/String;
    .param p5, "resultAttributeName"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-interface {p0, p1, p2}, Lorg/w3c/dom/Document;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 71
    .local v2, "metaTags":Lorg/w3c/dom/NodeList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v0, v3, :cond_2d

    .line 72
    invoke-interface {v2, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 73
    .local v1, "metaElement":Lorg/w3c/dom/Element;
    invoke-interface {v1, p3}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v1, p5}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lnl/siegmann/epublib/util/StringUtil;->isNotBlank(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 75
    invoke-interface {v1, p5}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 78
    .end local v1    # "metaElement":Lorg/w3c/dom/Element;
    :goto_29
    return-object v3

    .line 71
    .restart local v1    # "metaElement":Lorg/w3c/dom/Element;
    :cond_2a
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 78
    .end local v1    # "metaElement":Lorg/w3c/dom/Element;
    :cond_2d
    const/4 v3, 0x0

    goto :goto_29
.end method

.method public static getFirstElementByTagNameNS(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .registers 5
    .param p0, "parentElement"    # Lorg/w3c/dom/Element;
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "tagName"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-interface {p0, p1, p2}, Lorg/w3c/dom/Element;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 91
    .local v0, "nodes":Lorg/w3c/dom/NodeList;
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-nez v1, :cond_c

    .line 92
    const/4 v1, 0x0

    .line 94
    :goto_b
    return-object v1

    :cond_c
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    goto :goto_b
.end method

.method public static getTextChildrenContent(Lorg/w3c/dom/Element;)Ljava/lang/String;
    .registers 7
    .param p0, "parentElement"    # Lorg/w3c/dom/Element;

    .prologue
    .line 109
    if-nez p0, :cond_4

    .line 110
    const/4 v4, 0x0

    .line 122
    :goto_3
    return-object v4

    .line 112
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .local v3, "result":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 114
    .local v0, "childNodes":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-ge v1, v4, :cond_2e

    .line 115
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 116
    .local v2, "node":Lorg/w3c/dom/Node;
    if-eqz v2, :cond_21

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    const/4 v5, 0x3

    if-eq v4, v5, :cond_24

    .line 114
    .end local v2    # "node":Lorg/w3c/dom/Node;
    :cond_21
    :goto_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 120
    .restart local v2    # "node":Lorg/w3c/dom/Node;
    :cond_24
    check-cast v2, Lorg/w3c/dom/Text;

    .end local v2    # "node":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Text;->getData()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_21

    .line 122
    :cond_2e
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    goto :goto_3
.end method
