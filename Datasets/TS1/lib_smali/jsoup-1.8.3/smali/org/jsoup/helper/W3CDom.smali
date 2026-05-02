.class public Lorg/jsoup/helper/W3CDom;
.super Ljava/lang/Object;
.source "W3CDom.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/helper/W3CDom$W3CBuilder;
    }
.end annotation


# instance fields
.field protected factory:Ljavax/xml/parsers/DocumentBuilderFactory;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    iput-object v0, p0, Lorg/jsoup/helper/W3CDom;->factory:Ljavax/xml/parsers/DocumentBuilderFactory;

    .line 68
    return-void
.end method


# virtual methods
.method public asString(Lorg/w3c/dom/Document;)Ljava/lang/String;
    .registers 9
    .param p1, "doc"    # Lorg/w3c/dom/Document;

    .prologue
    .line 124
    :try_start_0
    new-instance v0, Ljavax/xml/transform/dom/DOMSource;

    invoke-direct {v0, p1}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    .line 125
    .local v0, "domSource":Ljavax/xml/transform/dom/DOMSource;
    new-instance v5, Ljava/io/StringWriter;

    invoke-direct {v5}, Ljava/io/StringWriter;-><init>()V

    .line 126
    .local v5, "writer":Ljava/io/StringWriter;
    new-instance v2, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v2, v5}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 127
    .local v2, "result":Ljavax/xml/transform/stream/StreamResult;
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v3

    .line 128
    .local v3, "tf":Ljavax/xml/transform/TransformerFactory;
    invoke-virtual {v3}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v4

    .line 129
    .local v4, "transformer":Ljavax/xml/transform/Transformer;
    invoke-virtual {v4, v0, v2}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 130
    invoke-virtual {v5}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_1d
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_1d} :catch_1f

    move-result-object v6

    return-object v6

    .line 131
    .end local v0    # "domSource":Ljavax/xml/transform/dom/DOMSource;
    .end local v2    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v3    # "tf":Ljavax/xml/transform/TransformerFactory;
    .end local v4    # "transformer":Ljavax/xml/transform/Transformer;
    .end local v5    # "writer":Ljava/io/StringWriter;
    :catch_1f
    move-exception v1

    .line 132
    .local v1, "e":Ljavax/xml/transform/TransformerException;
    new-instance v6, Ljava/lang/IllegalStateException;

    invoke-direct {v6, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method

.method public convert(Lorg/jsoup/nodes/Document;Lorg/w3c/dom/Document;)V
    .registers 6
    .param p1, "in"    # Lorg/jsoup/nodes/Document;
    .param p2, "out"    # Lorg/w3c/dom/Document;

    .prologue
    .line 57
    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jsoup/helper/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_11

    .line 58
    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->location()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v2}, Lorg/w3c/dom/Document;->setDocumentURI(Ljava/lang/String;)V

    .line 60
    :cond_11
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lorg/jsoup/nodes/Document;->child(I)Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 61
    .local v0, "rootEl":Lorg/jsoup/nodes/Element;
    new-instance v1, Lorg/jsoup/select/NodeTraversor;

    new-instance v2, Lorg/jsoup/helper/W3CDom$W3CBuilder;

    invoke-direct {v2, p0, p2}, Lorg/jsoup/helper/W3CDom$W3CBuilder;-><init>(Lorg/jsoup/helper/W3CDom;Lorg/w3c/dom/Document;)V

    invoke-direct {v1, v2}, Lorg/jsoup/select/NodeTraversor;-><init>(Lorg/jsoup/select/NodeVisitor;)V

    .line 62
    .local v1, "traversor":Lorg/jsoup/select/NodeTraversor;
    invoke-virtual {v1, v0}, Lorg/jsoup/select/NodeTraversor;->traverse(Lorg/jsoup/nodes/Node;)V

    .line 63
    return-void
.end method

.method public fromJsoup(Lorg/jsoup/nodes/Document;)Lorg/w3c/dom/Document;
    .registers 6
    .param p1, "in"    # Lorg/jsoup/nodes/Document;

    .prologue
    .line 37
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 40
    :try_start_3
    iget-object v3, p0, Lorg/jsoup/helper/W3CDom;->factory:Ljavax/xml/parsers/DocumentBuilderFactory;

    invoke-virtual {v3}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 41
    .local v0, "builder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v2

    .line 42
    .local v2, "out":Lorg/w3c/dom/Document;
    invoke-virtual {p0, p1, v2}, Lorg/jsoup/helper/W3CDom;->convert(Lorg/jsoup/nodes/Document;Lorg/w3c/dom/Document;)V
    :try_end_10
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_3 .. :try_end_10} :catch_11

    .line 43
    return-object v2

    .line 44
    .end local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v2    # "out":Lorg/w3c/dom/Document;
    :catch_11
    move-exception v1

    .line 45
    .local v1, "e":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method
