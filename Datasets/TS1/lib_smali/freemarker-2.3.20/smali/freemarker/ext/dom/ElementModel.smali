.class Lfreemarker/ext/dom/ElementModel;
.super Lfreemarker/ext/dom/NodeModel;
.source "ElementModel.java"

# interfaces
.implements Lfreemarker/template/TemplateScalarModel;


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;)V
    .registers 2
    .param p1, "element"    # Lorg/w3c/dom/Element;

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lfreemarker/ext/dom/NodeModel;-><init>(Lorg/w3c/dom/Node;)V

    .line 73
    return-void
.end method

.method private getAttribute(Ljava/lang/String;)Lorg/w3c/dom/Attr;
    .registers 10
    .param p1, "qname"    # Ljava/lang/String;

    .prologue
    .line 195
    iget-object v1, p0, Lfreemarker/ext/dom/ElementModel;->node:Lorg/w3c/dom/Node;

    check-cast v1, Lorg/w3c/dom/Element;

    .line 196
    .local v1, "element":Lorg/w3c/dom/Element;
    invoke-interface {v1, p1}, Lorg/w3c/dom/Element;->getAttributeNode(Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v4

    .line 197
    .local v4, "result":Lorg/w3c/dom/Attr;
    if-eqz v4, :cond_c

    move-object v5, v4

    .line 213
    .end local v4    # "result":Lorg/w3c/dom/Attr;
    .local v5, "result":Lorg/w3c/dom/Attr;
    :goto_b
    return-object v5

    .line 199
    .end local v5    # "result":Lorg/w3c/dom/Attr;
    .restart local v4    # "result":Lorg/w3c/dom/Attr;
    :cond_c
    const/16 v7, 0x3a

    invoke-virtual {p1, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 200
    .local v0, "colonIndex":I
    if-lez v0, :cond_35

    .line 201
    const/4 v7, 0x0

    invoke-virtual {p1, v7, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 203
    .local v3, "prefix":Ljava/lang/String;
    const-string v7, "D"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_37

    .line 204
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v7

    invoke-virtual {v7}, Lfreemarker/core/Environment;->getDefaultNS()Ljava/lang/String;

    move-result-object v6

    .line 208
    .local v6, "uri":Ljava/lang/String;
    :goto_29
    add-int/lit8 v7, v0, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 209
    .local v2, "localName":Ljava/lang/String;
    if-eqz v6, :cond_35

    .line 210
    invoke-interface {v1, v6, v2}, Lorg/w3c/dom/Element;->getAttributeNodeNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v4

    .end local v2    # "localName":Ljava/lang/String;
    .end local v3    # "prefix":Ljava/lang/String;
    .end local v6    # "uri":Ljava/lang/String;
    :cond_35
    move-object v5, v4

    .line 213
    .end local v4    # "result":Lorg/w3c/dom/Attr;
    .restart local v5    # "result":Lorg/w3c/dom/Attr;
    goto :goto_b

    .line 206
    .end local v5    # "result":Lorg/w3c/dom/Attr;
    .restart local v3    # "prefix":Ljava/lang/String;
    .restart local v4    # "result":Lorg/w3c/dom/Attr;
    :cond_37
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v7

    invoke-virtual {v7, v3}, Lfreemarker/core/Environment;->getNamespaceForPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .restart local v6    # "uri":Ljava/lang/String;
    goto :goto_29
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 14
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 91
    const-string v10, "*"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2d

    .line 92
    new-instance v7, Lfreemarker/ext/dom/NodeListModel;

    invoke-direct {v7, p0}, Lfreemarker/ext/dom/NodeListModel;-><init>(Lfreemarker/ext/dom/NodeModel;)V

    .line 93
    .local v7, "ns":Lfreemarker/ext/dom/NodeListModel;
    invoke-virtual {p0}, Lfreemarker/ext/dom/ElementModel;->getChildNodes()Lfreemarker/template/TemplateSequenceModel;

    move-result-object v3

    .line 94
    .local v3, "children":Lfreemarker/template/TemplateSequenceModel;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_13
    invoke-interface {v3}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v10

    if-ge v5, v10, :cond_44

    .line 95
    invoke-interface {v3, v5}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v2

    check-cast v2, Lfreemarker/ext/dom/NodeModel;

    .line 96
    .local v2, "child":Lfreemarker/ext/dom/NodeModel;
    iget-object v10, v2, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v10

    if-ne v10, v11, :cond_2a

    .line 97
    invoke-virtual {v7, v2}, Lfreemarker/ext/dom/NodeListModel;->add(Ljava/lang/Object;)V

    .line 94
    :cond_2a
    add-int/lit8 v5, v5, 0x1

    goto :goto_13

    .line 102
    .end local v2    # "child":Lfreemarker/ext/dom/NodeModel;
    .end local v3    # "children":Lfreemarker/template/TemplateSequenceModel;
    .end local v5    # "i":I
    .end local v7    # "ns":Lfreemarker/ext/dom/NodeListModel;
    :cond_2d
    const-string v10, "**"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_45

    .line 103
    iget-object v4, p0, Lfreemarker/ext/dom/ElementModel;->node:Lorg/w3c/dom/Node;

    check-cast v4, Lorg/w3c/dom/Element;

    .line 104
    .local v4, "elem":Lorg/w3c/dom/Element;
    new-instance v7, Lfreemarker/ext/dom/NodeListModel;

    const-string v10, "*"

    invoke-interface {v4, v10}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v10

    invoke-direct {v7, v10, p0}, Lfreemarker/ext/dom/NodeListModel;-><init>(Lorg/w3c/dom/NodeList;Lfreemarker/ext/dom/NodeModel;)V

    .line 139
    .end local v4    # "elem":Lorg/w3c/dom/Element;
    :cond_44
    :goto_44
    return-object v7

    .line 106
    :cond_45
    const-string v10, "@"

    invoke-virtual {p1, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_f0

    .line 107
    const-string v10, "@@"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_5d

    const-string v10, "@*"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_69

    .line 108
    :cond_5d
    new-instance v7, Lfreemarker/ext/dom/NodeListModel;

    iget-object v10, p0, Lfreemarker/ext/dom/ElementModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v10

    invoke-direct {v7, v10, p0}, Lfreemarker/ext/dom/NodeListModel;-><init>(Lorg/w3c/dom/NamedNodeMap;Lfreemarker/ext/dom/NodeModel;)V

    goto :goto_44

    .line 110
    :cond_69
    const-string v10, "@@start_tag"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_86

    .line 111
    new-instance v6, Lfreemarker/ext/dom/NodeOutputter;

    iget-object v10, p0, Lfreemarker/ext/dom/ElementModel;->node:Lorg/w3c/dom/Node;

    invoke-direct {v6, v10}, Lfreemarker/ext/dom/NodeOutputter;-><init>(Lorg/w3c/dom/Node;)V

    .line 112
    .local v6, "nodeOutputter":Lfreemarker/ext/dom/NodeOutputter;
    new-instance v7, Lfreemarker/template/SimpleScalar;

    iget-object v10, p0, Lfreemarker/ext/dom/ElementModel;->node:Lorg/w3c/dom/Node;

    check-cast v10, Lorg/w3c/dom/Element;

    invoke-virtual {v6, v10}, Lfreemarker/ext/dom/NodeOutputter;->getOpeningTag(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v10}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto :goto_44

    .line 114
    .end local v6    # "nodeOutputter":Lfreemarker/ext/dom/NodeOutputter;
    :cond_86
    const-string v10, "@@end_tag"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_a3

    .line 115
    new-instance v6, Lfreemarker/ext/dom/NodeOutputter;

    iget-object v10, p0, Lfreemarker/ext/dom/ElementModel;->node:Lorg/w3c/dom/Node;

    invoke-direct {v6, v10}, Lfreemarker/ext/dom/NodeOutputter;-><init>(Lorg/w3c/dom/Node;)V

    .line 116
    .restart local v6    # "nodeOutputter":Lfreemarker/ext/dom/NodeOutputter;
    new-instance v7, Lfreemarker/template/SimpleScalar;

    iget-object v10, p0, Lfreemarker/ext/dom/ElementModel;->node:Lorg/w3c/dom/Node;

    check-cast v10, Lorg/w3c/dom/Element;

    invoke-virtual {v6, v10}, Lfreemarker/ext/dom/NodeOutputter;->getClosingTag(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v10}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto :goto_44

    .line 118
    .end local v6    # "nodeOutputter":Lfreemarker/ext/dom/NodeOutputter;
    :cond_a3
    const-string v10, "@@attributes_markup"

    invoke-virtual {p1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_cf

    .line 119
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 120
    .local v1, "buf":Ljava/lang/StringBuffer;
    new-instance v8, Lfreemarker/ext/dom/NodeOutputter;

    iget-object v10, p0, Lfreemarker/ext/dom/ElementModel;->node:Lorg/w3c/dom/Node;

    invoke-direct {v8, v10}, Lfreemarker/ext/dom/NodeOutputter;-><init>(Lorg/w3c/dom/Node;)V

    .line 121
    .local v8, "nu":Lfreemarker/ext/dom/NodeOutputter;
    iget-object v10, p0, Lfreemarker/ext/dom/ElementModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v10

    invoke-virtual {v8, v10, v1}, Lfreemarker/ext/dom/NodeOutputter;->outputContent(Lorg/w3c/dom/NamedNodeMap;Ljava/lang/StringBuffer;)V

    .line 122
    new-instance v7, Lfreemarker/template/SimpleScalar;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v10}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto/16 :goto_44

    .line 124
    .end local v1    # "buf":Ljava/lang/StringBuffer;
    .end local v8    # "nu":Lfreemarker/ext/dom/NodeOutputter;
    :cond_cf
    invoke-virtual {p1, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->isXMLID(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_f0

    .line 125
    invoke-virtual {p1, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lfreemarker/ext/dom/ElementModel;->getAttribute(Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v0

    .line 126
    .local v0, "att":Lorg/w3c/dom/Attr;
    if-nez v0, :cond_ea

    .line 127
    new-instance v7, Lfreemarker/ext/dom/NodeListModel;

    invoke-direct {v7, p0}, Lfreemarker/ext/dom/NodeListModel;-><init>(Lfreemarker/ext/dom/NodeModel;)V

    goto/16 :goto_44

    .line 129
    :cond_ea
    invoke-static {v0}, Lfreemarker/ext/dom/ElementModel;->wrap(Lorg/w3c/dom/Node;)Lfreemarker/ext/dom/NodeModel;

    move-result-object v7

    goto/16 :goto_44

    .line 132
    .end local v0    # "att":Lorg/w3c/dom/Attr;
    :cond_f0
    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->isXMLID(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_110

    .line 133
    invoke-virtual {p0}, Lfreemarker/ext/dom/ElementModel;->getChildNodes()Lfreemarker/template/TemplateSequenceModel;

    move-result-object v10

    check-cast v10, Lfreemarker/ext/dom/NodeListModel;

    invoke-virtual {v10, p1}, Lfreemarker/ext/dom/NodeListModel;->filterByName(Ljava/lang/String;)Lfreemarker/ext/dom/NodeListModel;

    move-result-object v9

    .line 134
    .local v9, "result":Lfreemarker/ext/dom/NodeListModel;
    invoke-virtual {v9}, Lfreemarker/ext/dom/NodeListModel;->size()I

    move-result v10

    if-ne v10, v11, :cond_10d

    .line 135
    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lfreemarker/ext/dom/NodeListModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v7

    goto/16 :goto_44

    :cond_10d
    move-object v7, v9

    .line 137
    goto/16 :goto_44

    .line 139
    .end local v9    # "result":Lfreemarker/ext/dom/NodeListModel;
    :cond_110
    invoke-super {p0, p1}, Lfreemarker/ext/dom/NodeModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v7

    goto/16 :goto_44
.end method

.method public getAsString()Ljava/lang/String;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 143
    iget-object v6, p0, Lfreemarker/ext/dom/ElementModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 144
    .local v3, "nl":Lorg/w3c/dom/NodeList;
    const-string v5, ""

    .line 145
    .local v5, "result":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-ge v1, v6, :cond_65

    .line 146
    invoke-interface {v3, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 147
    .local v0, "child":Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    .line 148
    .local v4, "nodeType":I
    const/4 v6, 0x1

    if-ne v4, v6, :cond_47

    .line 149
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Only elements with no child elements can be processed as text.\nThis element with name \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lfreemarker/ext/dom/ElementModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\" has a child element named: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 153
    .local v2, "msg":Ljava/lang/String;
    new-instance v6, Lfreemarker/template/TemplateModelException;

    invoke-direct {v6, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 155
    .end local v2    # "msg":Ljava/lang/String;
    :cond_47
    const/4 v6, 0x3

    if-eq v4, v6, :cond_4d

    const/4 v6, 0x4

    if-ne v4, v6, :cond_62

    .line 156
    :cond_4d
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 145
    :cond_62
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 159
    .end local v0    # "child":Lorg/w3c/dom/Node;
    .end local v4    # "nodeType":I
    :cond_65
    return-object v5
.end method

.method public getNodeName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 163
    iget-object v1, p0, Lfreemarker/ext/dom/ElementModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_10

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 165
    :cond_10
    iget-object v1, p0, Lfreemarker/ext/dom/ElementModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 167
    :cond_16
    return-object v0
.end method

.method getQualifiedName()Ljava/lang/String;
    .registers 8

    .prologue
    .line 171
    invoke-virtual {p0}, Lfreemarker/ext/dom/ElementModel;->getNodeName()Ljava/lang/String;

    move-result-object v2

    .line 172
    .local v2, "nodeName":Ljava/lang/String;
    invoke-virtual {p0}, Lfreemarker/ext/dom/ElementModel;->getNodeNamespace()Ljava/lang/String;

    move-result-object v3

    .line 173
    .local v3, "nsURI":Ljava/lang/String;
    if-eqz v3, :cond_10

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_11

    .line 191
    .end local v2    # "nodeName":Ljava/lang/String;
    :cond_10
    :goto_10
    return-object v2

    .line 176
    .restart local v2    # "nodeName":Ljava/lang/String;
    :cond_11
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v1

    .line 177
    .local v1, "env":Lfreemarker/core/Environment;
    invoke-virtual {v1}, Lfreemarker/core/Environment;->getDefaultNS()Ljava/lang/String;

    move-result-object v0

    .line 179
    .local v0, "defaultNS":Ljava/lang/String;
    if-eqz v0, :cond_27

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_27

    .line 180
    const-string v4, "D"

    .line 185
    .local v4, "prefix":Ljava/lang/String;
    :goto_23
    if-nez v4, :cond_2c

    .line 186
    const/4 v2, 0x0

    goto :goto_10

    .line 182
    .end local v4    # "prefix":Ljava/lang/String;
    :cond_27
    invoke-virtual {v1, v3}, Lfreemarker/core/Environment;->getPrefixForNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "prefix":Ljava/lang/String;
    goto :goto_23

    .line 188
    :cond_2c
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_45

    .line 189
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 191
    :cond_45
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_10
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 76
    const/4 v0, 0x0

    return v0
.end method

.method matchesName(Ljava/lang/String;Lfreemarker/core/Environment;)Z
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 217
    invoke-virtual {p0}, Lfreemarker/ext/dom/ElementModel;->getNodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lfreemarker/ext/dom/ElementModel;->getNodeNamespace()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1, p2}, Lfreemarker/template/utility/StringUtil;->matchesName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfreemarker/core/Environment;)Z

    move-result v0

    return v0
.end method
