.class public Lfreemarker/ext/xml/_DomNavigator;
.super Lfreemarker/ext/xml/Navigator;
.source "_DomNavigator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/xml/_DomNavigator$DomXPathEx;
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

.method private createAttribute(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Attr;
    .registers 6
    .param p1, "node"    # Lorg/w3c/dom/Node;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 227
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    invoke-interface {v1, p2}, Lorg/w3c/dom/Document;->createAttribute(Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v0

    .line 228
    .local v0, "attr":Lorg/w3c/dom/Attr;
    invoke-interface {v0, p3}, Lorg/w3c/dom/Attr;->setNodeValue(Ljava/lang/String;)V

    .line 229
    return-object v0
.end method

.method private outputContent(Lorg/w3c/dom/NamedNodeMap;Ljava/lang/StringBuffer;)V
    .registers 5
    .param p1, "nodes"    # Lorg/w3c/dom/NamedNodeMap;
    .param p2, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 159
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {p1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_11

    .line 160
    invoke-interface {p1, v0}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lfreemarker/ext/xml/_DomNavigator;->outputContent(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V

    .line 159
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 162
    :cond_11
    return-void
.end method

.method private outputContent(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V
    .registers 9
    .param p1, "n"    # Lorg/w3c/dom/Node;
    .param p2, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    const/16 v5, 0x20

    const/16 v4, 0x3e

    const/16 v3, 0x22

    .line 89
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v1

    packed-switch v1, :pswitch_data_138

    .line 150
    :goto_d
    return-void

    .line 91
    :pswitch_e
    invoke-virtual {p2, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0, p1}, Lfreemarker/ext/xml/_DomNavigator;->getQualifiedName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lfreemarker/template/utility/StringUtil;->XMLEncNA(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_d

    .line 99
    :pswitch_30
    const-string v1, "<![CDATA["

    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "]]>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_d

    .line 103
    :pswitch_44
    const-string v1, "<!--"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "-->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_d

    .line 107
    :pswitch_58
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lfreemarker/ext/xml/_DomNavigator;->outputContent(Lorg/w3c/dom/NodeList;Ljava/lang/StringBuffer;)V

    goto :goto_d

    .line 111
    :pswitch_60
    const-string v1, "<!DOCTYPE "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-object v0, p1

    .line 112
    check-cast v0, Lorg/w3c/dom/DocumentType;

    .line 113
    .local v0, "dt":Lorg/w3c/dom/DocumentType;
    invoke-interface {v0}, Lorg/w3c/dom/DocumentType;->getPublicId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_87

    .line 114
    const-string v1, " PUBLIC \""

    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {v0}, Lorg/w3c/dom/DocumentType;->getPublicId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 116
    :cond_87
    invoke-interface {v0}, Lorg/w3c/dom/DocumentType;->getSystemId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_9c

    .line 117
    invoke-virtual {p2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {v0}, Lorg/w3c/dom/DocumentType;->getSystemId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 119
    :cond_9c
    invoke-interface {v0}, Lorg/w3c/dom/DocumentType;->getInternalSubset()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_b5

    .line 120
    const-string v1, " ["

    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {v0}, Lorg/w3c/dom/DocumentType;->getInternalSubset()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 122
    :cond_b5
    invoke-virtual {p2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_d

    .line 126
    .end local v0    # "dt":Lorg/w3c/dom/DocumentType;
    :pswitch_ba
    const/16 v1, 0x3c

    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0, p1}, Lfreemarker/ext/xml/_DomNavigator;->getQualifiedName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 127
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lfreemarker/ext/xml/_DomNavigator;->outputContent(Lorg/w3c/dom/NamedNodeMap;Ljava/lang/StringBuffer;)V

    .line 128
    invoke-virtual {p2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 129
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lfreemarker/ext/xml/_DomNavigator;->outputContent(Lorg/w3c/dom/NodeList;Ljava/lang/StringBuffer;)V

    .line 130
    const-string v1, "</"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0, p1}, Lfreemarker/ext/xml/_DomNavigator;->getQualifiedName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_d

    .line 134
    :pswitch_eb
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lfreemarker/ext/xml/_DomNavigator;->outputContent(Lorg/w3c/dom/NodeList;Ljava/lang/StringBuffer;)V

    goto/16 :goto_d

    .line 138
    :pswitch_f4
    const/16 v1, 0x26

    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/16 v2, 0x3b

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_d

    .line 142
    :pswitch_109
    const-string v1, "<?"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "?>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_d

    .line 146
    :pswitch_12a
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lfreemarker/template/utility/StringUtil;->XMLEncNQG(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_d

    .line 89
    nop

    :pswitch_data_138
    .packed-switch 0x1
        :pswitch_ba
        :pswitch_e
        :pswitch_12a
        :pswitch_30
        :pswitch_f4
        :pswitch_eb
        :pswitch_109
        :pswitch_44
        :pswitch_58
        :pswitch_60
    .end packed-switch
.end method

.method private outputContent(Lorg/w3c/dom/NodeList;Ljava/lang/StringBuffer;)V
    .registers 5
    .param p1, "nodes"    # Lorg/w3c/dom/NodeList;
    .param p2, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 153
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_11

    .line 154
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lfreemarker/ext/xml/_DomNavigator;->outputContent(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V

    .line 153
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 156
    :cond_11
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
    .line 333
    :try_start_0
    new-instance v1, Lfreemarker/ext/xml/_DomNavigator$DomXPathEx;

    invoke-direct {v1, p1}, Lfreemarker/ext/xml/_DomNavigator$DomXPathEx;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    return-object v1

    .line 335
    :catch_6
    move-exception v0

    .line 336
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method getAsString(Ljava/lang/Object;Ljava/io/StringWriter;)V
    .registers 4
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "sw"    # Ljava/io/StringWriter;

    .prologue
    .line 85
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lfreemarker/ext/xml/_DomNavigator;->outputContent(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V

    .line 86
    return-void
.end method

.method getAttributes(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 13
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "namespaceUri"    # Ljava/lang/String;
    .param p4, "result"    # Ljava/util/List;

    .prologue
    .line 181
    instance-of v6, p1, Lorg/w3c/dom/Element;

    if-eqz v6, :cond_31

    move-object v3, p1

    .line 182
    check-cast v3, Lorg/w3c/dom/Element;

    .line 183
    .local v3, "e":Lorg/w3c/dom/Element;
    if-nez p2, :cond_1e

    .line 184
    invoke-interface {v3}, Lorg/w3c/dom/Element;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    .line 185
    .local v1, "atts":Lorg/w3c/dom/NamedNodeMap;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_e
    invoke-interface {v1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v6

    if-ge v4, v6, :cond_30

    .line 186
    invoke-interface {v1, v4}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {p4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    .line 190
    .end local v1    # "atts":Lorg/w3c/dom/NamedNodeMap;
    .end local v4    # "i":I
    :cond_1e
    const-string v6, ""

    invoke-virtual {v6, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_27

    .line 191
    const/4 p3, 0x0

    .line 193
    :cond_27
    invoke-interface {v3, p3, p2}, Lorg/w3c/dom/Element;->getAttributeNodeNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v0

    .line 194
    .local v0, "attr":Lorg/w3c/dom/Attr;
    if-eqz v0, :cond_30

    .line 195
    invoke-interface {p4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    .end local v0    # "attr":Lorg/w3c/dom/Attr;
    .end local v3    # "e":Lorg/w3c/dom/Element;
    :cond_30
    :goto_30
    return-void

    .line 199
    :cond_31
    instance-of v6, p1, Lorg/w3c/dom/ProcessingInstruction;

    if-eqz v6, :cond_64

    move-object v5, p1

    .line 200
    check-cast v5, Lorg/w3c/dom/ProcessingInstruction;

    .line 201
    .local v5, "pi":Lorg/w3c/dom/ProcessingInstruction;
    const-string v6, "target"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4e

    .line 202
    const-string v6, "target"

    invoke-interface {v5}, Lorg/w3c/dom/ProcessingInstruction;->getTarget()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v5, v6, v7}, Lfreemarker/ext/xml/_DomNavigator;->createAttribute(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v6

    invoke-interface {p4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_30

    .line 204
    :cond_4e
    const-string v6, "data"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_30

    .line 205
    const-string v6, "data"

    invoke-interface {v5}, Lorg/w3c/dom/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v5, v6, v7}, Lfreemarker/ext/xml/_DomNavigator;->createAttribute(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v6

    invoke-interface {p4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_30

    .line 212
    .end local v5    # "pi":Lorg/w3c/dom/ProcessingInstruction;
    :cond_64
    instance-of v6, p1, Lorg/w3c/dom/DocumentType;

    if-eqz v6, :cond_30

    move-object v2, p1

    .line 213
    check-cast v2, Lorg/w3c/dom/DocumentType;

    .line 214
    .local v2, "doctype":Lorg/w3c/dom/DocumentType;
    const-string v6, "publicId"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_81

    .line 215
    const-string v6, "publicId"

    invoke-interface {v2}, Lorg/w3c/dom/DocumentType;->getPublicId()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v2, v6, v7}, Lfreemarker/ext/xml/_DomNavigator;->createAttribute(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v6

    invoke-interface {p4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_30

    .line 217
    :cond_81
    const-string v6, "systemId"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_97

    .line 218
    const-string v6, "systemId"

    invoke-interface {v2}, Lorg/w3c/dom/DocumentType;->getSystemId()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v2, v6, v7}, Lfreemarker/ext/xml/_DomNavigator;->createAttribute(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v6

    invoke-interface {p4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_30

    .line 220
    :cond_97
    const-string v6, "elementName"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_30

    .line 221
    const-string v6, "elementName"

    invoke-interface {v2}, Lorg/w3c/dom/DocumentType;->getNodeName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v2, v6, v7}, Lfreemarker/ext/xml/_DomNavigator;->createAttribute(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v6

    invoke-interface {p4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_30
.end method

.method getChildren(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 10
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "namespaceUri"    # Ljava/lang/String;
    .param p4, "result"    # Ljava/util/List;

    .prologue
    .line 165
    const-string v3, ""

    invoke-virtual {v3, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 166
    const/4 p3, 0x0

    .line 168
    :cond_9
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 169
    .local v0, "children":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_10
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_44

    .line 170
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 172
    .local v2, "subnode":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_28

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_41

    .line 173
    :cond_28
    if-eqz p2, :cond_3e

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, p2}, Lfreemarker/ext/xml/_DomNavigator;->equal(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_41

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, p3}, Lfreemarker/ext/xml/_DomNavigator;->equal(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_41

    .line 174
    :cond_3e
    invoke-interface {p4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    :cond_41
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 178
    .end local v2    # "subnode":Lorg/w3c/dom/Node;
    :cond_44
    return-void
.end method

.method getContent(Ljava/lang/Object;Ljava/util/List;)V
    .registers 6
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "result"    # Ljava/util/List;

    .prologue
    .line 259
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 260
    .local v0, "children":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_17

    .line 261
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 260
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 263
    :cond_17
    return-void
.end method

.method getDescendants(Ljava/lang/Object;Ljava/util/List;)V
    .registers 8
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "result"    # Ljava/util/List;

    .prologue
    .line 233
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 234
    .local v0, "children":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_21

    .line 235
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 236
    .local v2, "subnode":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1e

    .line 237
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    invoke-virtual {p0, v2, p2}, Lfreemarker/ext/xml/_DomNavigator;->getDescendants(Ljava/lang/Object;Ljava/util/List;)V

    .line 234
    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 241
    .end local v2    # "subnode":Lorg/w3c/dom/Node;
    :cond_21
    return-void
.end method

.method getDocument(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 248
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0
.end method

.method getDocumentType(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 252
    instance-of v0, p1, Lorg/w3c/dom/Document;

    if-eqz v0, :cond_b

    check-cast p1, Lorg/w3c/dom/Document;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/w3c/dom/Document;->getDoctype()Lorg/w3c/dom/DocumentType;

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
    .line 283
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getNamespacePrefix(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 287
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getNamespaceUri(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 291
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getParent(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 244
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    return-object v0
.end method

.method getText(Ljava/lang/Object;)Ljava/lang/String;
    .registers 7
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 266
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 267
    .local v0, "buf":Ljava/lang/StringBuffer;
    instance-of v4, p1, Lorg/w3c/dom/Element;

    if-eqz v4, :cond_2d

    .line 268
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 269
    .local v2, "children":Lorg/w3c/dom/NodeList;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_10
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-ge v3, v4, :cond_28

    .line 270
    invoke-interface {v2, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 271
    .local v1, "child":Lorg/w3c/dom/Node;
    instance-of v4, v1, Lorg/w3c/dom/Text;

    if-eqz v4, :cond_25

    .line 272
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 269
    :cond_25
    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    .line 275
    .end local v1    # "child":Lorg/w3c/dom/Node;
    :cond_28
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 278
    .end local v2    # "children":Lorg/w3c/dom/NodeList;
    .end local v3    # "i":I
    :goto_2c
    return-object v4

    .restart local p1    # "node":Ljava/lang/Object;
    :cond_2d
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    goto :goto_2c
.end method

.method getType(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 295
    check-cast p1, Lorg/w3c/dom/Node;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    packed-switch v0, :pswitch_data_2a

    .line 327
    const-string v0, "unknown"

    :goto_b
    return-object v0

    .line 297
    :pswitch_c
    const-string v0, "attribute"

    goto :goto_b

    .line 300
    :pswitch_f
    const-string v0, "cdata"

    goto :goto_b

    .line 303
    :pswitch_12
    const-string v0, "comment"

    goto :goto_b

    .line 306
    :pswitch_15
    const-string v0, "document"

    goto :goto_b

    .line 309
    :pswitch_18
    const-string v0, "documentType"

    goto :goto_b

    .line 312
    :pswitch_1b
    const-string v0, "element"

    goto :goto_b

    .line 315
    :pswitch_1e
    const-string v0, "entity"

    goto :goto_b

    .line 318
    :pswitch_21
    const-string v0, "entityReference"

    goto :goto_b

    .line 321
    :pswitch_24
    const-string v0, "processingInstruction"

    goto :goto_b

    .line 324
    :pswitch_27
    const-string v0, "text"

    goto :goto_b

    .line 295
    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_1b
        :pswitch_c
        :pswitch_27
        :pswitch_f
        :pswitch_21
        :pswitch_1e
        :pswitch_24
        :pswitch_12
        :pswitch_15
        :pswitch_18
    .end packed-switch
.end method
