.class public Lfreemarker/ext/xml/_Dom4jNavigator;
.super Lfreemarker/ext/xml/Navigator;
.source "_Dom4jNavigator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/xml/_Dom4jNavigator$Dom4jXPathEx;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 81
    invoke-direct {p0}, Lfreemarker/ext/xml/Navigator;-><init>()V

    .line 82
    return-void
.end method

.method private getDescendants(Lorg/dom4j/Branch;Ljava/util/List;)V
    .registers 7
    .param p1, "node"    # Lorg/dom4j/Branch;
    .param p2, "result"    # Ljava/util/List;

    .prologue
    .line 151
    invoke-interface {p1}, Lorg/dom4j/Branch;->content()Ljava/util/List;

    move-result-object v0

    .line 152
    .local v0, "content":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 153
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/dom4j/Node;

    .line 154
    .local v2, "subnode":Lorg/dom4j/Node;
    instance-of v3, v2, Lorg/dom4j/Element;

    if-eqz v3, :cond_8

    .line 155
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    invoke-virtual {p0, v2, p2}, Lfreemarker/ext/xml/_Dom4jNavigator;->getDescendants(Ljava/lang/Object;Ljava/util/List;)V

    goto :goto_8

    .line 159
    .end local v2    # "subnode":Lorg/dom4j/Node;
    :cond_1f
    return-void
.end method


# virtual methods
.method createXPathEx(Ljava/lang/String;)Lfreemarker/ext/xml/Navigator$XPathEx;
    .registers 4
    .param p1, "xpathString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 249
    :try_start_0
    new-instance v1, Lfreemarker/ext/xml/_Dom4jNavigator$Dom4jXPathEx;

    invoke-direct {v1, p1}, Lfreemarker/ext/xml/_Dom4jNavigator$Dom4jXPathEx;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    return-object v1

    .line 251
    :catch_6
    move-exception v0

    .line 252
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method getAsString(Ljava/lang/Object;Ljava/io/StringWriter;)V
    .registers 5
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "sw"    # Ljava/io/StringWriter;

    .prologue
    .line 85
    invoke-virtual {p2}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v0

    check-cast p1, Lorg/dom4j/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/dom4j/Node;->asXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 86
    return-void
.end method

.method getAttributes(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 12
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "namespaceUri"    # Ljava/lang/String;
    .param p4, "result"    # Ljava/util/List;

    .prologue
    .line 107
    instance-of v4, p1, Lorg/dom4j/Element;

    if-eqz v4, :cond_29

    move-object v2, p1

    .line 108
    check-cast v2, Lorg/dom4j/Element;

    .line 109
    .local v2, "e":Lorg/dom4j/Element;
    if-nez p2, :cond_11

    .line 110
    invoke-interface {v2}, Lorg/dom4j/Element;->attributes()Ljava/util/List;

    move-result-object v4

    invoke-interface {p4, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 142
    .end local v2    # "e":Lorg/dom4j/Element;
    :cond_10
    :goto_10
    return-void

    .line 113
    .restart local v2    # "e":Lorg/dom4j/Element;
    :cond_11
    invoke-interface {v2}, Lorg/dom4j/Element;->getQName()Lorg/dom4j/QName;

    move-result-object v4

    invoke-virtual {v4}, Lorg/dom4j/QName;->getDocumentFactory()Lorg/dom4j/DocumentFactory;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, p2, v5, p3}, Lorg/dom4j/DocumentFactory;->createQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/dom4j/QName;

    move-result-object v4

    invoke-interface {v2, v4}, Lorg/dom4j/Element;->attribute(Lorg/dom4j/QName;)Lorg/dom4j/Attribute;

    move-result-object v0

    .line 114
    .local v0, "attr":Lorg/dom4j/Attribute;
    if-eqz v0, :cond_10

    .line 115
    invoke-interface {p4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 119
    .end local v0    # "attr":Lorg/dom4j/Attribute;
    .end local v2    # "e":Lorg/dom4j/Element;
    :cond_29
    instance-of v4, p1, Lorg/dom4j/ProcessingInstruction;

    if-eqz v4, :cond_6b

    move-object v3, p1

    .line 120
    check-cast v3, Lorg/dom4j/ProcessingInstruction;

    .line 121
    .local v3, "pi":Lorg/dom4j/ProcessingInstruction;
    const-string v4, "target"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_47

    .line 122
    new-instance v4, Lorg/dom4j/tree/DefaultAttribute;

    const-string v5, "target"

    invoke-interface {v3}, Lorg/dom4j/ProcessingInstruction;->getTarget()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/dom4j/tree/DefaultAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 124
    :cond_47
    const-string v4, "data"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5e

    .line 125
    new-instance v4, Lorg/dom4j/tree/DefaultAttribute;

    const-string v5, "data"

    invoke-interface {v3}, Lorg/dom4j/ProcessingInstruction;->getText()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/dom4j/tree/DefaultAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 128
    :cond_5e
    new-instance v4, Lorg/dom4j/tree/DefaultAttribute;

    invoke-interface {v3, p2}, Lorg/dom4j/ProcessingInstruction;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p2, v5}, Lorg/dom4j/tree/DefaultAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 130
    .end local v3    # "pi":Lorg/dom4j/ProcessingInstruction;
    :cond_6b
    instance-of v4, p1, Lorg/dom4j/DocumentType;

    if-eqz v4, :cond_10

    move-object v1, p1

    .line 131
    check-cast v1, Lorg/dom4j/DocumentType;

    .line 132
    .local v1, "doctype":Lorg/dom4j/DocumentType;
    const-string v4, "publicId"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_89

    .line 133
    new-instance v4, Lorg/dom4j/tree/DefaultAttribute;

    const-string v5, "publicId"

    invoke-interface {v1}, Lorg/dom4j/DocumentType;->getPublicID()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/dom4j/tree/DefaultAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 135
    :cond_89
    const-string v4, "systemId"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a1

    .line 136
    new-instance v4, Lorg/dom4j/tree/DefaultAttribute;

    const-string v5, "systemId"

    invoke-interface {v1}, Lorg/dom4j/DocumentType;->getSystemID()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/dom4j/tree/DefaultAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_10

    .line 138
    :cond_a1
    const-string v4, "elementName"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 139
    new-instance v4, Lorg/dom4j/tree/DefaultAttribute;

    const-string v5, "elementName"

    invoke-interface {v1}, Lorg/dom4j/DocumentType;->getElementName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/dom4j/tree/DefaultAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p4, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_10
.end method

.method getChildren(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 9
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "namespaceUri"    # Ljava/lang/String;
    .param p4, "result"    # Ljava/util/List;

    .prologue
    .line 89
    instance-of v2, p1, Lorg/dom4j/Element;

    if-eqz v2, :cond_27

    move-object v0, p1

    .line 90
    check-cast v0, Lorg/dom4j/Element;

    .line 91
    .local v0, "e":Lorg/dom4j/Element;
    if-nez p2, :cond_11

    .line 92
    invoke-interface {v0}, Lorg/dom4j/Element;->elements()Ljava/util/List;

    move-result-object v2

    invoke-interface {p4, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 104
    .end local v0    # "e":Lorg/dom4j/Element;
    .end local p1    # "node":Ljava/lang/Object;
    :cond_10
    :goto_10
    return-void

    .line 95
    .restart local v0    # "e":Lorg/dom4j/Element;
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_11
    invoke-interface {v0}, Lorg/dom4j/Element;->getQName()Lorg/dom4j/QName;

    move-result-object v2

    invoke-virtual {v2}, Lorg/dom4j/QName;->getDocumentFactory()Lorg/dom4j/DocumentFactory;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, p2, v3, p3}, Lorg/dom4j/DocumentFactory;->createQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/dom4j/QName;

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/dom4j/Element;->elements(Lorg/dom4j/QName;)Ljava/util/List;

    move-result-object v2

    invoke-interface {p4, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_10

    .line 98
    .end local v0    # "e":Lorg/dom4j/Element;
    :cond_27
    instance-of v2, p1, Lorg/dom4j/Document;

    if-eqz v2, :cond_10

    .line 99
    check-cast p1, Lorg/dom4j/Document;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/dom4j/Document;->getRootElement()Lorg/dom4j/Element;

    move-result-object v1

    .line 100
    .local v1, "root":Lorg/dom4j/Element;
    if-eqz p2, :cond_47

    invoke-interface {v1}, Lorg/dom4j/Element;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p2}, Lfreemarker/ext/xml/_Dom4jNavigator;->equal(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-interface {v1}, Lorg/dom4j/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p3}, Lfreemarker/ext/xml/_Dom4jNavigator;->equal(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 101
    :cond_47
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10
.end method

.method getContent(Ljava/lang/Object;Ljava/util/List;)V
    .registers 4
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "result"    # Ljava/util/List;

    .prologue
    .line 177
    instance-of v0, p1, Lorg/dom4j/Branch;

    if-eqz v0, :cond_d

    .line 178
    check-cast p1, Lorg/dom4j/Branch;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/dom4j/Branch;->content()Ljava/util/List;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 180
    :cond_d
    return-void
.end method

.method getDescendants(Ljava/lang/Object;Ljava/util/List;)V
    .registers 4
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "result"    # Ljava/util/List;

    .prologue
    .line 145
    instance-of v0, p1, Lorg/dom4j/Branch;

    if-eqz v0, :cond_9

    .line 146
    check-cast p1, Lorg/dom4j/Branch;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/xml/_Dom4jNavigator;->getDescendants(Lorg/dom4j/Branch;Ljava/util/List;)V

    .line 148
    :cond_9
    return-void
.end method

.method getDocument(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 166
    check-cast p1, Lorg/dom4j/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/dom4j/Node;->getDocument()Lorg/dom4j/Document;

    move-result-object v0

    return-object v0
.end method

.method getDocumentType(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 170
    instance-of v0, p1, Lorg/dom4j/Document;

    if-eqz v0, :cond_b

    check-cast p1, Lorg/dom4j/Document;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/dom4j/Document;->getDocType()Lorg/dom4j/DocumentType;

    move-result-object v0

    :goto_a
    return-object v0

    .restart local p1    # "node":Ljava/lang/Object;
    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method getLocalName(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 187
    check-cast p1, Lorg/dom4j/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/dom4j/Node;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getNamespacePrefix(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 191
    instance-of v0, p1, Lorg/dom4j/Element;

    if-eqz v0, :cond_b

    .line 192
    check-cast p1, Lorg/dom4j/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/dom4j/Element;->getNamespacePrefix()Ljava/lang/String;

    move-result-object v0

    .line 197
    :goto_a
    return-object v0

    .line 194
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_b
    instance-of v0, p1, Lorg/dom4j/Attribute;

    if-eqz v0, :cond_16

    .line 195
    check-cast p1, Lorg/dom4j/Attribute;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/dom4j/Attribute;->getNamespacePrefix()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 197
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method getNamespaceUri(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 201
    instance-of v0, p1, Lorg/dom4j/Element;

    if-eqz v0, :cond_b

    .line 202
    check-cast p1, Lorg/dom4j/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/dom4j/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    .line 207
    :goto_a
    return-object v0

    .line 204
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_b
    instance-of v0, p1, Lorg/dom4j/Attribute;

    if-eqz v0, :cond_16

    .line 205
    check-cast p1, Lorg/dom4j/Attribute;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/dom4j/Attribute;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 207
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method getParent(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 162
    check-cast p1, Lorg/dom4j/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/dom4j/Node;->getParent()Lorg/dom4j/Element;

    move-result-object v0

    return-object v0
.end method

.method getText(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 183
    check-cast p1, Lorg/dom4j/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/dom4j/Node;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getType(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 211
    check-cast p1, Lorg/dom4j/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/dom4j/Node;->getNodeType()S

    move-result v0

    packed-switch v0, :pswitch_data_2a

    .line 243
    :pswitch_9
    const-string v0, "unknown"

    :goto_b
    return-object v0

    .line 213
    :pswitch_c
    const-string v0, "attribute"

    goto :goto_b

    .line 216
    :pswitch_f
    const-string v0, "cdata"

    goto :goto_b

    .line 219
    :pswitch_12
    const-string v0, "comment"

    goto :goto_b

    .line 222
    :pswitch_15
    const-string v0, "document"

    goto :goto_b

    .line 225
    :pswitch_18
    const-string v0, "documentType"

    goto :goto_b

    .line 228
    :pswitch_1b
    const-string v0, "element"

    goto :goto_b

    .line 231
    :pswitch_1e
    const-string v0, "entityReference"

    goto :goto_b

    .line 234
    :pswitch_21
    const-string v0, "namespace"

    goto :goto_b

    .line 237
    :pswitch_24
    const-string v0, "processingInstruction"

    goto :goto_b

    .line 240
    :pswitch_27
    const-string v0, "text"

    goto :goto_b

    .line 211
    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_1b
        :pswitch_c
        :pswitch_27
        :pswitch_f
        :pswitch_1e
        :pswitch_9
        :pswitch_24
        :pswitch_12
        :pswitch_15
        :pswitch_18
        :pswitch_9
        :pswitch_9
        :pswitch_21
    .end packed-switch
.end method
