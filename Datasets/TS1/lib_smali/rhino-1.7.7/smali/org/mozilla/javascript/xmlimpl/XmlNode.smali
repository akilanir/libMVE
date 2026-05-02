.class Lorg/mozilla/javascript/xmlimpl/XmlNode;
.super Ljava/lang/Object;
.source "XmlNode.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;,
        Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;,
        Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;,
        Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;,
        Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;,
        Lorg/mozilla/javascript/xmlimpl/XmlNode$XmlNodeUserDataHandler;
    }
.end annotation


# static fields
.field private static final DOM_LEVEL_3:Z = true

.field private static final USER_DATA_XMLNODE_KEY:Ljava/lang/String;

.field private static final XML_NAMESPACES_NAMESPACE_URI:Ljava/lang/String; = "http://www.w3.org/2000/xmlns/"

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private dom:Lorg/w3c/dom/Node;

.field private events:Lorg/w3c/dom/UserDataHandler;

.field private xml:Lorg/mozilla/javascript/xmlimpl/XML;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    const-class v0, Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->USER_DATA_XMLNODE_KEY:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XmlNode$XmlNodeUserDataHandler;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$XmlNodeUserDataHandler;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->events:Lorg/w3c/dom/UserDataHandler;

    .line 107
    return-void
.end method

.method private addNamespaces(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;Lorg/w3c/dom/Element;)V
    .registers 10
    .param p1, "rv"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;
    .param p2, "element"    # Lorg/w3c/dom/Element;

    .prologue
    const/4 v6, 0x0

    .line 242
    if-nez p2, :cond_b

    new-instance v5, Ljava/lang/RuntimeException;

    const-string v6, "element must not be null"

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 243
    :cond_b
    invoke-interface {p2, v6}, Lorg/w3c/dom/Element;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->toUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 244
    .local v3, "myDefaultNamespace":Ljava/lang/String;
    const-string v4, ""

    .line 245
    .local v4, "parentDefaultNamespace":Ljava/lang/String;
    invoke-interface {p2}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v5

    if-eqz v5, :cond_27

    .line 246
    invoke-interface {p2}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5, v6}, Lorg/w3c/dom/Node;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->toUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 248
    :cond_27
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_35

    invoke-interface {p2}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v5

    instance-of v5, v5, Lorg/w3c/dom/Element;

    if-nez v5, :cond_3e

    .line 249
    :cond_35
    const-string v5, ""

    invoke-static {v5, v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;->declare(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)V

    .line 251
    :cond_3e
    invoke-interface {p2}, Lorg/w3c/dom/Element;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    .line 252
    .local v1, "attributes":Lorg/w3c/dom/NamedNodeMap;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_43
    invoke-interface {v1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v5

    if-ge v2, v5, :cond_73

    .line 253
    invoke-interface {v1, v2}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Attr;

    .line 254
    .local v0, "attr":Lorg/w3c/dom/Attr;
    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getPrefix()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_70

    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getPrefix()Ljava/lang/String;

    move-result-object v5

    const-string v6, "xmlns"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_70

    .line 255
    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getLocalName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;->declare(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)V

    .line 252
    :cond_70
    add-int/lit8 v2, v2, 0x1

    goto :goto_43

    .line 258
    .end local v0    # "attr":Lorg/w3c/dom/Attr;
    :cond_73
    return-void
.end method

.method private static copy(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .registers 3
    .param p0, "other"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 95
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Node;->cloneNode(Z)Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-static {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    return-object v0
.end method

.method static createElement(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .registers 4
    .param p0, "processor"    # Lorg/mozilla/javascript/xmlimpl/XmlProcessor;
    .param p1, "namespaceUri"    # Ljava/lang/String;
    .param p2, "xml"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->toXml(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-static {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    return-object v0
.end method

.method static createElementFromNode(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .registers 2
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 81
    instance-of v0, p0, Lorg/w3c/dom/Document;

    if-eqz v0, :cond_a

    .line 82
    check-cast p0, Lorg/w3c/dom/Document;

    .end local p0    # "node":Lorg/w3c/dom/Node;
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object p0

    .line 83
    .restart local p0    # "node":Lorg/w3c/dom/Node;
    :cond_a
    invoke-static {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    return-object v0
.end method

.method static createEmpty(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;)Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .registers 2
    .param p0, "processor"    # Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    .prologue
    .line 91
    const-string v0, ""

    invoke-static {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createText(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    return-object v0
.end method

.method private static createImpl(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .registers 3
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 44
    instance-of v1, p0, Lorg/w3c/dom/Document;

    if-eqz v1, :cond_a

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 45
    :cond_a
    const/4 v0, 0x0

    .line 46
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XmlNode;
    invoke-static {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getUserData(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v1

    if-nez v1, :cond_1c

    .line 47
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .end local v0    # "rv":Lorg/mozilla/javascript/xmlimpl/XmlNode;
    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;-><init>()V

    .line 48
    .restart local v0    # "rv":Lorg/mozilla/javascript/xmlimpl/XmlNode;
    iput-object p0, v0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 49
    invoke-static {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->setUserData(Lorg/w3c/dom/Node;Lorg/mozilla/javascript/xmlimpl/XmlNode;)V

    .line 53
    :goto_1b
    return-object v0

    .line 51
    :cond_1c
    invoke-static {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getUserData(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    goto :goto_1b
.end method

.method static createText(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .registers 3
    .param p0, "processor"    # Lorg/mozilla/javascript/xmlimpl/XmlProcessor;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v0

    invoke-static {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    return-object v0
.end method

.method private declareNamespace(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "e"    # Lorg/w3c/dom/Element;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "uri"    # Ljava/lang/String;

    .prologue
    .line 403
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1f

    .line 404
    const-string v0, "http://www.w3.org/2000/xmlns/"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "xmlns:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1, p3}, Lorg/w3c/dom/Element;->setAttributeNS(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 408
    :goto_1e
    return-void

    .line 406
    :cond_1f
    const-string v0, "xmlns"

    invoke-interface {p1, v0, p3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1e
.end method

.method private getAllNamespaces()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;
    .registers 5

    .prologue
    .line 261
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;-><init>()V

    .line 263
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 264
    .local v1, "target":Lorg/w3c/dom/Node;
    instance-of v2, v1, Lorg/w3c/dom/Attr;

    if-eqz v2, :cond_11

    .line 265
    check-cast v1, Lorg/w3c/dom/Attr;

    .end local v1    # "target":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Attr;->getOwnerElement()Lorg/w3c/dom/Element;

    move-result-object v1

    .line 267
    .restart local v1    # "target":Lorg/w3c/dom/Node;
    :cond_11
    :goto_11
    if-eqz v1, :cond_22

    .line 268
    instance-of v2, v1, Lorg/w3c/dom/Element;

    if-eqz v2, :cond_1d

    move-object v2, v1

    .line 269
    check-cast v2, Lorg/w3c/dom/Element;

    invoke-direct {p0, v0, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->addNamespaces(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;Lorg/w3c/dom/Element;)V

    .line 271
    :cond_1d
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v1

    goto :goto_11

    .line 274
    :cond_22
    const-string v2, ""

    const-string v3, ""

    invoke-static {v2, v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;->declare(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)V

    .line 275
    return-object v0
.end method

.method private getDefaultNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 421
    const-string v0, ""

    .line 422
    .local v0, "prefix":Ljava/lang/String;
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2, v3}, Lorg/w3c/dom/Node;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_12

    const-string v1, ""

    .line 423
    .local v1, "uri":Ljava/lang/String;
    :goto_d
    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    return-object v2

    .line 422
    .end local v1    # "uri":Ljava/lang/String;
    :cond_12
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2, v3}, Lorg/w3c/dom/Node;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method private getExistingPrefixFor(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;
    .registers 4
    .param p1, "namespace"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    .prologue
    .line 427
    invoke-direct {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getDefaultNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 428
    const-string v0, ""

    .line 430
    :goto_14
    return-object v0

    :cond_15
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Node;->lookupPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_14
.end method

.method private getNodeNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .registers 4

    .prologue
    .line 434
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    .line 435
    .local v1, "uri":Ljava/lang/String;
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v0

    .line 436
    .local v0, "prefix":Ljava/lang/String;
    if-nez v1, :cond_10

    const-string v1, ""

    .line 437
    :cond_10
    if-nez v0, :cond_14

    const-string v0, ""

    .line 438
    :cond_14
    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    return-object v2
.end method

.method private static getUserData(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .registers 2
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 32
    sget-object v0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->USER_DATA_XMLNODE_KEY:Ljava/lang/String;

    invoke-interface {p0, v0}, Lorg/w3c/dom/Node;->getUserData(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/mozilla/javascript/xmlimpl/XmlNode;

    return-object v0
.end method

.method static newElementWithText(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;Lorg/mozilla/javascript/xmlimpl/XmlNode;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .registers 10
    .param p0, "processor"    # Lorg/mozilla/javascript/xmlimpl/XmlProcessor;
    .param p1, "reference"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .param p2, "qname"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 57
    instance-of v5, p1, Lorg/w3c/dom/Document;

    if-eqz v5, :cond_d

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Cannot use Document node as reference"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 58
    :cond_d
    const/4 v0, 0x0

    .line 59
    .local v0, "document":Lorg/w3c/dom/Document;
    if-eqz p1, :cond_40

    .line 60
    iget-object v5, p1, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    .line 64
    :goto_16
    if-eqz p1, :cond_45

    iget-object v3, p1, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 65
    .local v3, "referenceDom":Lorg/w3c/dom/Node;
    :goto_1a
    invoke-virtual {p2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    .line 66
    .local v2, "ns":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    if-eqz v2, :cond_2a

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_47

    :cond_2a
    invoke-virtual {p2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 70
    .local v1, "e":Lorg/w3c/dom/Element;
    :goto_32
    if-eqz p3, :cond_3b

    .line 71
    invoke-interface {v0, p3}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v4

    invoke-interface {v1, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 73
    :cond_3b
    invoke-static {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v4

    return-object v4

    .line 62
    .end local v1    # "e":Lorg/w3c/dom/Element;
    .end local v2    # "ns":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .end local v3    # "referenceDom":Lorg/w3c/dom/Node;
    :cond_40
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    goto :goto_16

    :cond_45
    move-object v3, v4

    .line 64
    goto :goto_1a

    .line 66
    .restart local v2    # "ns":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .restart local v3    # "referenceDom":Lorg/w3c/dom/Node;
    :cond_47
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->qualify(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    goto :goto_32
.end method

.method private setProcessingInstructionName(Ljava/lang/String;)V
    .registers 6
    .param p1, "localName"    # Ljava/lang/String;

    .prologue
    .line 474
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/ProcessingInstruction;

    .line 476
    .local v0, "pi":Lorg/w3c/dom/ProcessingInstruction;
    invoke-interface {v0}, Lorg/w3c/dom/ProcessingInstruction;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-interface {v0}, Lorg/w3c/dom/ProcessingInstruction;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v2

    invoke-interface {v0}, Lorg/w3c/dom/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, p1, v3}, Lorg/w3c/dom/Document;->createProcessingInstruction(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/ProcessingInstruction;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lorg/w3c/dom/Node;->replaceChild(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 480
    return-void
.end method

.method private static setUserData(Lorg/w3c/dom/Node;Lorg/mozilla/javascript/xmlimpl/XmlNode;)V
    .registers 4
    .param p0, "node"    # Lorg/w3c/dom/Node;
    .param p1, "wrap"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 39
    sget-object v0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->USER_DATA_XMLNODE_KEY:Ljava/lang/String;

    iget-object v1, p1, Lorg/mozilla/javascript/xmlimpl/XmlNode;->events:Lorg/w3c/dom/UserDataHandler;

    invoke-interface {p0, v0, p1, v1}, Lorg/w3c/dom/Node;->setUserData(Ljava/lang/String;Ljava/lang/Object;Lorg/w3c/dom/UserDataHandler;)Ljava/lang/Object;

    .line 41
    return-void
.end method

.method private toUri(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p1, "ns"    # Ljava/lang/String;

    .prologue
    .line 238
    if-nez p1, :cond_4

    const-string p1, ""

    .end local p1    # "ns":Ljava/lang/String;
    :cond_4
    return-object p1
.end method


# virtual methods
.method addMatchingChildren(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;)V
    .registers 9
    .param p1, "result"    # Lorg/mozilla/javascript/xmlimpl/XMLList;
    .param p2, "filter"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;

    .prologue
    .line 499
    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 500
    .local v4, "node":Lorg/w3c/dom/Node;
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 501
    .local v2, "children":Lorg/w3c/dom/NodeList;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_7
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-ge v3, v5, :cond_21

    .line 502
    invoke-interface {v2, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 503
    .local v1, "childnode":Lorg/w3c/dom/Node;
    invoke-static {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    .line 504
    .local v0, "child":Lorg/mozilla/javascript/xmlimpl/XmlNode;
    invoke-virtual {p2, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;->accept(Lorg/w3c/dom/Node;)Z

    move-result v5

    if-eqz v5, :cond_1e

    .line 505
    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 501
    :cond_1e
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 508
    .end local v0    # "child":Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .end local v1    # "childnode":Lorg/w3c/dom/Node;
    :cond_21
    return-void
.end method

.method final copy()Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .registers 2

    .prologue
    .line 357
    invoke-static {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->copy(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    return-object v0
.end method

.method debug()Ljava/lang/String;
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 110
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;-><init>()V

    .line 111
    .local v0, "raw":Lorg/mozilla/javascript/xmlimpl/XmlProcessor;
    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setIgnoreComments(Z)V

    .line 112
    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setIgnoreProcessingInstructions(Z)V

    .line 113
    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setIgnoreWhitespace(Z)V

    .line 114
    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setPrettyPrinting(Z)V

    .line 115
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->ecmaToXmlString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method declareNamespace(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 411
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v1, v1, Lorg/w3c/dom/Element;

    if-nez v1, :cond_c

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 412
    :cond_c
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1, p2}, Lorg/w3c/dom/Node;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_21

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1, p2}, Lorg/w3c/dom/Node;->lookupNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 418
    :goto_20
    return-void

    .line 415
    :cond_21
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Element;

    .line 416
    .local v0, "e":Lorg/w3c/dom/Element;
    invoke-direct {p0, v0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->declareNamespace(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_20
.end method

.method deleteMe()V
    .registers 5

    .prologue
    .line 181
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v1, v1, Lorg/w3c/dom/Attr;

    if-eqz v1, :cond_1e

    .line 182
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Attr;

    .line 183
    .local v0, "attr":Lorg/w3c/dom/Attr;
    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getOwnerElement()Lorg/w3c/dom/Element;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/Element;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getLocalName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/w3c/dom/NamedNodeMap;->removeNamedItemNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Node;

    .line 192
    .end local v0    # "attr":Lorg/w3c/dom/Attr;
    :cond_1d
    :goto_1d
    return-void

    .line 185
    :cond_1e
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v1

    if-eqz v1, :cond_1d

    .line 186
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v1

    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1, v2}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_1d
.end method

.method ecmaToXMLString(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;)Ljava/lang/String;
    .registers 7
    .param p1, "processor"    # Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    .prologue
    .line 551
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isElementType()Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 552
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    const/4 v4, 0x1

    invoke-interface {v3, v4}, Lorg/w3c/dom/Node;->cloneNode(Z)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 553
    .local v0, "copy":Lorg/w3c/dom/Element;
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getInScopeNamespaces()[Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    .line 554
    .local v2, "inScope":[Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_14
    array-length v3, v2

    if-ge v1, v3, :cond_29

    .line 555
    aget-object v3, v2, v1

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v3

    aget-object v4, v2, v1

    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v0, v3, v4}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->declareNamespace(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 554
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 557
    :cond_29
    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->ecmaToXmlString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    .line 559
    .end local v0    # "copy":Lorg/w3c/dom/Element;
    .end local v1    # "i":I
    .end local v2    # "inScope":[Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    :goto_2d
    return-object v3

    :cond_2e
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->ecmaToXmlString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    goto :goto_2d
.end method

.method ecmaValue()Ljava/lang/String;
    .registers 4

    .prologue
    .line 165
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isTextType()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 166
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Text;

    invoke-interface {v0}, Lorg/w3c/dom/Text;->getData()Ljava/lang/String;

    move-result-object v0

    .line 172
    :goto_e
    return-object v0

    .line 167
    :cond_f
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isAttributeType()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 168
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Attr;

    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 169
    :cond_1e
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isProcessingInstructionType()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 170
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/ProcessingInstruction;

    invoke-interface {v0}, Lorg/w3c/dom/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 171
    :cond_2d
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isCommentType()Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 172
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Comment;

    invoke-interface {v0}, Lorg/w3c/dom/Comment;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 173
    :cond_3c
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isElementType()Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 174
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Unimplemented ecmaValue() for elements."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 176
    :cond_4a
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unimplemented for node "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getAttributeValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 534
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Attr;

    invoke-interface {v0}, Lorg/w3c/dom/Attr;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getAttributes()[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .registers 6

    .prologue
    .line 523
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    .line 525
    .local v0, "attrs":Lorg/w3c/dom/NamedNodeMap;
    if-nez v0, :cond_10

    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Must be element."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 526
    :cond_10
    invoke-interface {v0}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v3

    new-array v2, v3, [Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .line 527
    .local v2, "rv":[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_17
    invoke-interface {v0}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_2a

    .line 528
    invoke-interface {v0, v1}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    invoke-static {v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v3

    aput-object v3, v2, v1

    .line 527
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .line 530
    :cond_2a
    return-object v2
.end method

.method getChild(I)Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 219
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1, p1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 220
    .local v0, "child":Lorg/w3c/dom/Node;
    invoke-static {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v1

    return-object v1
.end method

.method getChildCount()I
    .registers 2

    .prologue
    .line 132
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    return v0
.end method

.method getChildIndex()I
    .registers 5

    .prologue
    const/4 v0, -0x1

    .line 143
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isAttributeType()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 148
    :cond_7
    return v0

    .line 144
    :cond_8
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->parent()Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 145
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 146
    .local v1, "siblings":Lorg/w3c/dom/NodeList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_19
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v0, v2, :cond_2a

    .line 147
    invoke-interface {v1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    if-eq v2, v3, :cond_7

    .line 146
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 152
    :cond_2a
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Unreachable."

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method getInScopeNamespaces()[Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .registers 3

    .prologue
    .line 279
    invoke-direct {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getAllNamespaces()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;

    move-result-object v0

    .line 280
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;->getNamespaces()[Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    return-object v1
.end method

.method getMatchingChildren(Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;)[Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .registers 7
    .param p1, "filter"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;

    .prologue
    .line 511
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 512
    .local v3, "rv":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/mozilla/javascript/xmlimpl/XmlNode;>;"
    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 513
    .local v2, "nodes":Lorg/w3c/dom/NodeList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-ge v0, v4, :cond_26

    .line 514
    invoke-interface {v2, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 515
    .local v1, "node":Lorg/w3c/dom/Node;
    invoke-virtual {p1, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Filter;->accept(Lorg/w3c/dom/Node;)Z

    move-result v4

    if-eqz v4, :cond_23

    .line 516
    invoke-static {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 513
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 519
    .end local v1    # "node":Lorg/w3c/dom/Node;
    :cond_26
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Lorg/mozilla/javascript/xmlimpl/XmlNode;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lorg/mozilla/javascript/xmlimpl/XmlNode;

    return-object v4
.end method

.method getNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .registers 2

    .prologue
    .line 442
    invoke-direct {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getNodeNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    return-object v0
.end method

.method getNamespaceDeclaration()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .registers 2

    .prologue
    .line 304
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_f

    const-string v0, ""

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getNamespaceDeclaration(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    .line 305
    :goto_e
    return-object v0

    :cond_f
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getNamespaceDeclaration(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    goto :goto_e
.end method

.method getNamespaceDeclaration(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .registers 5
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 295
    const-string v1, ""

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v1, v1, Lorg/w3c/dom/Attr;

    if-eqz v1, :cond_17

    .line 297
    const-string v1, ""

    const-string v2, ""

    invoke-static {v1, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    .line 300
    :goto_16
    return-object v1

    .line 299
    :cond_17
    invoke-direct {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getAllNamespaces()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;

    move-result-object v0

    .line 300
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;
    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;->getNamespace(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    goto :goto_16
.end method

.method getNamespaceDeclarations()[Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .registers 3

    .prologue
    .line 285
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v1, v1, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_17

    .line 286
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;-><init>()V

    .line 287
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v1, Lorg/w3c/dom/Element;

    invoke-direct {p0, v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->addNamespaces(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;Lorg/w3c/dom/Element;)V

    .line 288
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;->getNamespaces()[Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    .line 290
    .end local v0    # "rv":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespaces;
    :goto_16
    return-object v1

    :cond_17
    const/4 v1, 0x0

    new-array v1, v1, [Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    goto :goto_16
.end method

.method final getQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    .registers 4

    .prologue
    .line 493
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1f

    const-string v1, ""

    .line 494
    .local v1, "uri":Ljava/lang/String;
    :goto_a
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_26

    const-string v0, ""

    .line 495
    .local v0, "prefix":Ljava/lang/String;
    :goto_14
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v2

    return-object v2

    .line 493
    .end local v0    # "prefix":Ljava/lang/String;
    .end local v1    # "uri":Ljava/lang/String;
    :cond_1f
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    goto :goto_a

    .line 494
    .restart local v1    # "uri":Ljava/lang/String;
    :cond_26
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v0

    goto :goto_14
.end method

.method getXml()Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->xml:Lorg/mozilla/javascript/xmlimpl/XML;

    return-object v0
.end method

.method hasChildElement()Z
    .registers 5

    .prologue
    const/4 v2, 0x1

    .line 225
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 226
    .local v1, "nodes":Lorg/w3c/dom/NodeList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v0, v3, :cond_1c

    .line 227
    invoke-interface {v1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    if-ne v3, v2, :cond_19

    .line 229
    :goto_18
    return v2

    .line 226
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 229
    :cond_1c
    const/4 v2, 0x0

    goto :goto_18
.end method

.method insertChildAt(ILorg/mozilla/javascript/xmlimpl/XmlNode;)V
    .registers 8
    .param p1, "index"    # I
    .param p2, "node"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 199
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 200
    .local v1, "parent":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v2

    iget-object v3, p2, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Lorg/w3c/dom/Document;->importNode(Lorg/w3c/dom/Node;Z)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 201
    .local v0, "child":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v2, p1, :cond_42

    .line 203
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "index="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " length="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 205
    :cond_42
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ne v2, p1, :cond_50

    .line 206
    invoke-interface {v1, v0}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 210
    :goto_4f
    return-void

    .line 208
    :cond_50
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-interface {v2, p1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lorg/w3c/dom/Node;->insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_4f
.end method

.method insertChildrenAt(I[Lorg/mozilla/javascript/xmlimpl/XmlNode;)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "nodes"    # [Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 213
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p2

    if-ge v0, v1, :cond_e

    .line 214
    add-int v1, p1, v0

    aget-object v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->insertChildAt(ILorg/mozilla/javascript/xmlimpl/XmlNode;)V

    .line 213
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 216
    :cond_e
    return-void
.end method

.method invalidateNamespacePrefix()V
    .registers 9

    .prologue
    const/4 v7, 0x0

    .line 390
    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v4, v4, Lorg/w3c/dom/Element;

    if-nez v4, :cond_d

    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 391
    :cond_d
    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    .line 392
    .local v3, "prefix":Ljava/lang/String;
    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v7}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v0

    .line 393
    .local v0, "after":Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->renameNode(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)V

    .line 394
    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    .line 395
    .local v1, "attrs":Lorg/w3c/dom/NamedNodeMap;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2d
    invoke-interface {v1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v4

    if-ge v2, v4, :cond_63

    .line 396
    invoke-interface {v1, v2}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    .line 397
    invoke-interface {v1, v2}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-static {v4}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v4

    invoke-interface {v1, v2}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v2}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v7}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->renameNode(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)V

    .line 395
    :cond_60
    add-int/lit8 v2, v2, 0x1

    goto :goto_2d

    .line 400
    :cond_63
    return-void
.end method

.method final isAttributeType()Z
    .registers 3

    .prologue
    .line 370
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method final isCommentType()Z
    .registers 3

    .prologue
    .line 378
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method final isElementType()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 382
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v1

    if-ne v1, v0, :cond_a

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method final isParentType()Z
    .registers 2

    .prologue
    .line 362
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->isElementType()Z

    move-result v0

    return v0
.end method

.method final isProcessingInstructionType()Z
    .registers 3

    .prologue
    .line 374
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method isSameNode(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Z
    .registers 4
    .param p1, "other"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 234
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    iget-object v1, p1, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method final isTextType()Z
    .registers 3

    .prologue
    .line 366
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_12

    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method normalize()V
    .registers 2

    .prologue
    .line 195
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->normalize()V

    .line 196
    return-void
.end method

.method parent()Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 136
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    .line 137
    .local v0, "domParent":Lorg/w3c/dom/Node;
    instance-of v2, v0, Lorg/w3c/dom/Document;

    if-eqz v2, :cond_c

    .line 139
    :cond_b
    :goto_b
    return-object v1

    .line 138
    :cond_c
    if-eqz v0, :cond_b

    .line 139
    invoke-static {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v1

    goto :goto_b
.end method

.method removeChild(I)V
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 156
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1, p1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 157
    return-void
.end method

.method removeNamespace(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)V
    .registers 8
    .param p1, "namespace"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    .prologue
    .line 446
    invoke-direct {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getNodeNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    .line 449
    .local v2, "current":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    invoke-virtual {p1, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->is(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 471
    :cond_a
    :goto_a
    return-void

    .line 450
    :cond_b
    iget-object v5, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    .line 451
    .local v1, "attrs":Lorg/w3c/dom/NamedNodeMap;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_12
    invoke-interface {v1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v5

    if-ge v4, v5, :cond_2d

    .line 452
    invoke-interface {v1, v4}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-static {v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createImpl(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    .line 453
    .local v0, "attr":Lorg/mozilla/javascript/xmlimpl/XmlNode;
    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getNodeNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->is(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Z

    move-result v5

    if-nez v5, :cond_a

    .line 451
    add-int/lit8 v4, v4, 0x1

    goto :goto_12

    .line 457
    .end local v0    # "attr":Lorg/mozilla/javascript/xmlimpl/XmlNode;
    :cond_2d
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getExistingPrefixFor(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Ljava/lang/String;

    move-result-object v3

    .line 458
    .local v3, "existingPrefix":Ljava/lang/String;
    if-eqz v3, :cond_a

    .line 459
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->isUnspecifiedPrefix()Z

    move-result v5

    if-eqz v5, :cond_45

    .line 462
    invoke-direct {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getDefaultNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v5

    invoke-virtual {v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v3, v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->declareNamespace(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a

    .line 464
    :cond_45
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 465
    invoke-direct {p0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getDefaultNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v5

    invoke-virtual {v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v3, v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->declareNamespace(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_a
.end method

.method final renameNode(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)V
    .registers 6
    .param p1, "qname"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    .prologue
    .line 386
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v2

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {p1, v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->qualify(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Lorg/w3c/dom/Document;->renameNode(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 387
    return-void
.end method

.method replaceWith(Lorg/mozilla/javascript/xmlimpl/XmlNode;)V
    .registers 5
    .param p1, "other"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 543
    iget-object v0, p1, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    .line 544
    .local v0, "replacement":Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v2

    if-eq v1, v2, :cond_19

    .line 545
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v1, v0, v2}, Lorg/w3c/dom/Document;->importNode(Lorg/w3c/dom/Node;Z)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 547
    :cond_19
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v1

    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1, v0, v2}, Lorg/w3c/dom/Node;->replaceChild(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 548
    return-void
.end method

.method setAttribute(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 538
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v0, v0, Lorg/w3c/dom/Element;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can only set attribute on elements."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 539
    :cond_e
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/Element;

    invoke-virtual {p1, v0, p2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->setAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    .line 540
    return-void
.end method

.method final setLocalName(Ljava/lang/String;)V
    .registers 7
    .param p1, "localName"    # Ljava/lang/String;

    .prologue
    .line 483
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    instance-of v1, v1, Lorg/w3c/dom/ProcessingInstruction;

    if-eqz v1, :cond_a

    .line 484
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->setProcessingInstructionName(Ljava/lang/String;)V

    .line 490
    :goto_9
    return-void

    .line 486
    :cond_a
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v0

    .line 487
    .local v0, "prefix":Ljava/lang/String;
    if-nez v0, :cond_14

    const-string v0, ""

    .line 488
    :cond_14
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->qualify(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v2, v3, v4}, Lorg/w3c/dom/Document;->renameNode(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    goto :goto_9
.end method

.method setXml(Lorg/mozilla/javascript/xmlimpl/XML;)V
    .registers 2
    .param p1, "xml"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 128
    iput-object p1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->xml:Lorg/mozilla/javascript/xmlimpl/XML;

    .line 129
    return-void
.end method

.method toDomNode()Lorg/w3c/dom/Node;
    .registers 2

    .prologue
    .line 881
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "XmlNode: type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " dom="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method toXmlString(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;)Ljava/lang/String;
    .registers 3
    .param p1, "processor"    # Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    .prologue
    .line 160
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XmlNode;->dom:Lorg/w3c/dom/Node;

    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->ecmaToXmlString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
