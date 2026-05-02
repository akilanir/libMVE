.class public Lorg/apache/commons/digester/NodeCreateRule;
.super Lorg/apache/commons/digester/Rule;
.source "NodeCreateRule.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;
    }
.end annotation


# instance fields
.field private documentBuilder:Ljavax/xml/parsers/DocumentBuilder;

.field private nodeType:I


# direct methods
.method public constructor <init>()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;
        }
    .end annotation

    .prologue
    .line 285
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/NodeCreateRule;-><init>(I)V

    .line 287
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "nodeType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;
        }
    .end annotation

    .prologue
    .line 318
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/digester/NodeCreateRule;-><init>(ILjavax/xml/parsers/DocumentBuilder;)V

    .line 321
    return-void
.end method

.method public constructor <init>(ILjavax/xml/parsers/DocumentBuilder;)V
    .registers 5
    .param p1, "nodeType"    # I
    .param p2, "documentBuilder"    # Ljavax/xml/parsers/DocumentBuilder;

    .prologue
    const/4 v1, 0x1

    .line 338
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 357
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/NodeCreateRule;->documentBuilder:Ljavax/xml/parsers/DocumentBuilder;

    .line 367
    iput v1, p0, Lorg/apache/commons/digester/NodeCreateRule;->nodeType:I

    .line 340
    const/16 v0, 0xb

    if-eq p1, v0, :cond_17

    if-eq p1, v1, :cond_17

    .line 342
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can only create nodes of type DocumentFragment and Element"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 345
    :cond_17
    iput p1, p0, Lorg/apache/commons/digester/NodeCreateRule;->nodeType:I

    .line 346
    iput-object p2, p0, Lorg/apache/commons/digester/NodeCreateRule;->documentBuilder:Ljavax/xml/parsers/DocumentBuilder;

    .line 348
    return-void
.end method

.method public constructor <init>(Ljavax/xml/parsers/DocumentBuilder;)V
    .registers 3
    .param p1, "documentBuilder"    # Ljavax/xml/parsers/DocumentBuilder;

    .prologue
    .line 300
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/digester/NodeCreateRule;-><init>(ILjavax/xml/parsers/DocumentBuilder;)V

    .line 302
    return-void
.end method


# virtual methods
.method public begin(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 11
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 392
    iget-object v4, p0, Lorg/apache/commons/digester/NodeCreateRule;->documentBuilder:Ljavax/xml/parsers/DocumentBuilder;

    invoke-virtual {v4}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    .line 393
    .local v1, "doc":Lorg/w3c/dom/Document;
    const/4 v0, 0x0

    .line 394
    .local v0, "builder":Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;
    iget v4, p0, Lorg/apache/commons/digester/NodeCreateRule;->nodeType:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_5a

    .line 395
    const/4 v2, 0x0

    .line 396
    .local v2, "element":Lorg/w3c/dom/Element;
    invoke-virtual {p0}, Lorg/apache/commons/digester/NodeCreateRule;->getDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/commons/digester/Digester;->getNamespaceAware()Z

    move-result v4

    if-eqz v4, :cond_41

    .line 397
    invoke-interface {v1, p1, p2}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 399
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1c
    invoke-interface {p3}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v4

    if-lt v3, v4, :cond_2f

    .line 411
    :cond_22
    new-instance v0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;

    .end local v0    # "builder":Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;
    invoke-direct {v0, p0, v1, v2}, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;-><init>(Lorg/apache/commons/digester/NodeCreateRule;Lorg/w3c/dom/Document;Lorg/w3c/dom/Node;)V

    .line 419
    .end local v2    # "element":Lorg/w3c/dom/Element;
    .end local v3    # "i":I
    .restart local v0    # "builder":Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;
    :goto_27
    invoke-virtual {p0}, Lorg/apache/commons/digester/NodeCreateRule;->getDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v4

    invoke-virtual {v4, v0}, Lorg/apache/commons/digester/Digester;->setCustomContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 420
    return-void

    .line 400
    .restart local v2    # "element":Lorg/w3c/dom/Element;
    .restart local v3    # "i":I
    :cond_2f
    invoke-interface {p3, v3}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p3, v3}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {p3, v3}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v4, v5, v6}, Lorg/w3c/dom/Element;->setAttributeNS(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    add-int/lit8 v3, v3, 0x1

    goto :goto_1c

    .line 405
    .end local v3    # "i":I
    :cond_41
    invoke-interface {v1, p2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 406
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_46
    invoke-interface {p3}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v4

    if-ge v3, v4, :cond_22

    .line 407
    invoke-interface {p3, v3}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p3, v3}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 406
    add-int/lit8 v3, v3, 0x1

    goto :goto_46

    .line 413
    .end local v2    # "element":Lorg/w3c/dom/Element;
    .end local v3    # "i":I
    :cond_5a
    new-instance v0, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;

    .end local v0    # "builder":Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;
    invoke-interface {v1}, Lorg/w3c/dom/Document;->createDocumentFragment()Lorg/w3c/dom/DocumentFragment;

    move-result-object v4

    invoke-direct {v0, p0, v1, v4}, Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;-><init>(Lorg/apache/commons/digester/NodeCreateRule;Lorg/w3c/dom/Document;Lorg/w3c/dom/Node;)V

    .restart local v0    # "builder":Lorg/apache/commons/digester/NodeCreateRule$NodeBuilder;
    goto :goto_27
.end method

.method public end()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 428
    iget-object v0, p0, Lorg/apache/commons/digester/NodeCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v0}, Lorg/apache/commons/digester/Digester;->pop()Ljava/lang/Object;

    .line 430
    return-void
.end method
