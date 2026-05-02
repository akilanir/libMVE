.class Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "NodeCreateRule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/NodeCreateRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NodeBuilder"
.end annotation


# instance fields
.field protected depth:I

.field protected doc:Lorg/w3c/dom/Document;

.field protected oldContentHandler:Lorg/xml/sax/ContentHandler;

.field protected root:Lorg/w3c/dom/Node;

.field private final this$0:Lorg/apache/commons/digester/NodeCreateRule;

.field protected top:Lorg/w3c/dom/Node;


# direct methods
.method public constructor <init>(Lorg/apache/commons/digester/NodeCreateRule;Lorg/w3c/dom/Document;Lorg/w3c/dom/Node;)V
    .registers 6
    .param p1, "this$0"    # Lorg/apache/commons/digester/NodeCreateRule;
    .param p2, "doc"    # Lorg/w3c/dom/Document;
    .param p3, "root"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 108
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->this$0:Lorg/apache/commons/digester/NodeCreateRule;

    .line 126
    iput-object v1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->oldContentHandler:Lorg/xml/sax/ContentHandler;

    .line 133
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->depth:I

    .line 139
    iput-object v1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->doc:Lorg/w3c/dom/Document;

    .line 145
    iput-object v1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->root:Lorg/w3c/dom/Node;

    .line 151
    iput-object v1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->top:Lorg/w3c/dom/Node;

    .line 110
    iput-object p2, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->doc:Lorg/w3c/dom/Document;

    .line 111
    iput-object p3, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->root:Lorg/w3c/dom/Node;

    .line 112
    iput-object p3, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->top:Lorg/w3c/dom/Node;

    .line 114
    iget-object v0, p1, Lorg/apache/commons/digester/NodeCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v0}, Lorg/apache/commons/digester/Digester;->getCustomContentHandler()Lorg/xml/sax/ContentHandler;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->oldContentHandler:Lorg/xml/sax/ContentHandler;

    .line 116
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .registers 8
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 169
    :try_start_0
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 170
    .local v1, "str":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1a

    .line 171
    iget-object v2, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->top:Lorg/w3c/dom/Node;

    iget-object v3, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-interface {v3, v1}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    :try_end_1a
    .catch Lorg/w3c/dom/DOMException; {:try_start_0 .. :try_end_1a} :catch_1b

    .line 177
    :cond_1a
    return-void

    .line 174
    .end local v1    # "str":Ljava/lang/String;
    :catch_1b
    move-exception v0

    .local v0, "e":Lorg/w3c/dom/DOMException;
    new-instance v2, Lorg/xml/sax/SAXException;

    invoke-virtual {v0}, Lorg/w3c/dom/DOMException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 193
    :try_start_0
    iget v1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->depth:I

    if-nez v1, :cond_23

    .line 194
    iget-object v1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->this$0:Lorg/apache/commons/digester/NodeCreateRule;

    invoke-virtual {v1}, Lorg/apache/commons/digester/NodeCreateRule;->getDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->oldContentHandler:Lorg/xml/sax/ContentHandler;

    invoke-virtual {v1, v2}, Lorg/apache/commons/digester/Digester;->setCustomContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 195
    iget-object v1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->this$0:Lorg/apache/commons/digester/NodeCreateRule;

    invoke-virtual {v1}, Lorg/apache/commons/digester/NodeCreateRule;->getDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->root:Lorg/w3c/dom/Node;

    invoke-virtual {v1, v2}, Lorg/apache/commons/digester/Digester;->push(Ljava/lang/Object;)V

    .line 196
    iget-object v1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->this$0:Lorg/apache/commons/digester/NodeCreateRule;

    invoke-virtual {v1}, Lorg/apache/commons/digester/NodeCreateRule;->getDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p3}, Lorg/apache/commons/digester/Digester;->endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    :cond_23
    iget-object v1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->top:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->top:Lorg/w3c/dom/Node;

    .line 200
    iget v1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->depth:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->depth:I
    :try_end_31
    .catch Lorg/w3c/dom/DOMException; {:try_start_0 .. :try_end_31} :catch_32

    .line 205
    return-void

    .line 202
    :catch_32
    move-exception v0

    .local v0, "e":Lorg/w3c/dom/DOMException;
    new-instance v1, Lorg/xml/sax/SAXException;

    invoke-virtual {v0}, Lorg/w3c/dom/DOMException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public processingInstruction(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 222
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->top:Lorg/w3c/dom/Node;

    iget-object v2, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-interface {v2, p1, p2}, Lorg/w3c/dom/Document;->createProcessingInstruction(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/ProcessingInstruction;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    :try_end_b
    .catch Lorg/w3c/dom/DOMException; {:try_start_0 .. :try_end_b} :catch_c

    .line 227
    return-void

    .line 224
    :catch_c
    move-exception v0

    .local v0, "e":Lorg/w3c/dom/DOMException;
    new-instance v1, Lorg/xml/sax/SAXException;

    invoke-virtual {v0}, Lorg/w3c/dom/DOMException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 12
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "atts"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 245
    :try_start_0
    iget-object v3, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->top:Lorg/w3c/dom/Node;

    .line 246
    .local v3, "previousTop":Lorg/w3c/dom/Node;
    if-eqz p2, :cond_a

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_25

    .line 247
    :cond_a
    iget-object v4, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-interface {v4, p3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->top:Lorg/w3c/dom/Node;

    .line 251
    :goto_12
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_13
    invoke-interface {p4}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v4

    if-lt v2, v4, :cond_39

    .line 265
    iget-object v4, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->top:Lorg/w3c/dom/Node;

    invoke-interface {v3, v4}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 266
    iget v4, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->depth:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->depth:I

    .line 271
    return-void

    .line 249
    .end local v2    # "i":I
    :cond_25
    iget-object v4, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-interface {v4, p1, p2}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->top:Lorg/w3c/dom/Node;
    :try_end_2d
    .catch Lorg/w3c/dom/DOMException; {:try_start_0 .. :try_end_2d} :catch_2e

    goto :goto_12

    .line 268
    .end local v3    # "previousTop":Lorg/w3c/dom/Node;
    :catch_2e
    move-exception v1

    .local v1, "e":Lorg/w3c/dom/DOMException;
    new-instance v4, Lorg/xml/sax/SAXException;

    invoke-virtual {v1}, Lorg/w3c/dom/DOMException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 252
    .end local v1    # "e":Lorg/w3c/dom/DOMException;
    .restart local v2    # "i":I
    .restart local v3    # "previousTop":Lorg/w3c/dom/Node;
    :cond_39
    const/4 v0, 0x0

    .line 253
    .local v0, "attr":Lorg/w3c/dom/Attr;
    :try_start_3a
    invoke-interface {p4, v2}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_4a

    invoke-interface {p4, v2}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_65

    .line 255
    :cond_4a
    iget-object v4, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-interface {p4, v2}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/w3c/dom/Document;->createAttribute(Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v0

    .line 256
    invoke-interface {p4, v2}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lorg/w3c/dom/Attr;->setNodeValue(Ljava/lang/String;)V

    .line 257
    iget-object v4, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->top:Lorg/w3c/dom/Node;

    check-cast v4, Lorg/w3c/dom/Element;

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->setAttributeNode(Lorg/w3c/dom/Attr;)Lorg/w3c/dom/Attr;

    .line 251
    :goto_62
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 259
    :cond_65
    iget-object v4, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-interface {p4, v2}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {p4, v2}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lorg/w3c/dom/Document;->createAttributeNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Attr;

    move-result-object v0

    .line 261
    invoke-interface {p4, v2}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lorg/w3c/dom/Attr;->setNodeValue(Ljava/lang/String;)V

    .line 262
    iget-object v4, p0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;->top:Lorg/w3c/dom/Node;

    check-cast v4, Lorg/w3c/dom/Element;

    invoke-interface {v4, v0}, Lorg/w3c/dom/Element;->setAttributeNodeNS(Lorg/w3c/dom/Attr;)Lorg/w3c/dom/Attr;
    :try_end_81
    .catch Lorg/w3c/dom/DOMException; {:try_start_3a .. :try_end_81} :catch_2e

    goto :goto_62
.end method
