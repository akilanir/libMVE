.class public Lezvcard/util/XmlUtils;
.super Ljava/lang/Object;
.source "XmlUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 265
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 267
    return-void
.end method

.method public static createDocument()Lorg/w3c/dom/Document;
    .registers 4

    .prologue
    .line 72
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v2

    .line 73
    .local v2, "fact":Ljavax/xml/parsers/DocumentBuilderFactory;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 74
    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 75
    .local v0, "db":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;
    :try_end_f
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_f} :catch_11

    move-result-object v3

    return-object v3

    .line 76
    .end local v0    # "db":Ljavax/xml/parsers/DocumentBuilder;
    :catch_11
    move-exception v1

    .line 78
    .local v1, "e":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public static getFirstChildElement(Lorg/w3c/dom/Element;)Lorg/w3c/dom/Element;
    .registers 2
    .param p0, "parent"    # Lorg/w3c/dom/Element;

    .prologue
    .line 246
    invoke-static {p0}, Lezvcard/util/XmlUtils;->getFirstChildElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;

    move-result-object v0

    return-object v0
.end method

.method private static getFirstChildElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;
    .registers 5
    .param p0, "parent"    # Lorg/w3c/dom/Node;

    .prologue
    .line 255
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 256
    .local v2, "nodeList":Lorg/w3c/dom/NodeList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v0, v3, :cond_19

    .line 257
    invoke-interface {v2, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 258
    .local v1, "node":Lorg/w3c/dom/Node;
    instance-of v3, v1, Lorg/w3c/dom/Element;

    if-eqz v3, :cond_16

    .line 259
    check-cast v1, Lorg/w3c/dom/Element;

    .line 262
    .end local v1    # "node":Lorg/w3c/dom/Node;
    :goto_15
    return-object v1

    .line 256
    .restart local v1    # "node":Lorg/w3c/dom/Node;
    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 262
    .end local v1    # "node":Lorg/w3c/dom/Node;
    :cond_19
    const/4 v1, 0x0

    goto :goto_15
.end method

.method public static getRootElement(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Element;
    .registers 2
    .param p0, "parent"    # Lorg/w3c/dom/Document;

    .prologue
    .line 237
    invoke-static {p0}, Lezvcard/util/XmlUtils;->getFirstChildElement(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Element;

    move-result-object v0

    return-object v0
.end method

.method public static toDocument(Ljava/io/InputStream;)Lorg/w3c/dom/Document;
    .registers 2
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    new-instance v0, Lorg/xml/sax/InputSource;

    invoke-direct {v0, p0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-static {v0}, Lezvcard/util/XmlUtils;->toDocument(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0
.end method

.method public static toDocument(Ljava/io/Reader;)Lorg/w3c/dom/Document;
    .registers 2
    .param p0, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    new-instance v0, Lorg/xml/sax/InputSource;

    invoke-direct {v0, p0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-static {v0}, Lezvcard/util/XmlUtils;->toDocument(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0
.end method

.method public static toDocument(Ljava/lang/String;)Lorg/w3c/dom/Document;
    .registers 3
    .param p0, "xml"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 90
    :try_start_0
    new-instance v1, Ljava/io/StringReader;

    invoke-direct {v1, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lezvcard/util/XmlUtils;->toDocument(Ljava/io/Reader;)Lorg/w3c/dom/Document;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_8} :catch_a

    move-result-object v1

    return-object v1

    .line 91
    :catch_a
    move-exception v0

    .line 93
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static toDocument(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;
    .registers 5
    .param p0, "in"    # Lorg/xml/sax/InputSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 132
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v2

    .line 133
    .local v2, "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v2, v3}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 134
    invoke-virtual {v2, v3}, Ljavax/xml/parsers/DocumentBuilderFactory;->setIgnoringComments(Z)V

    .line 138
    :try_start_b
    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;
    :try_end_e
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_b .. :try_end_e} :catch_14

    move-result-object v0

    .line 144
    .local v0, "builder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v0, p0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v3

    return-object v3

    .line 139
    .end local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    :catch_14
    move-exception v1

    .line 141
    .local v1, "e":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public static toElementList(Lorg/w3c/dom/NodeList;)Ljava/util/List;
    .registers 5
    .param p0, "nodeList"    # Lorg/w3c/dom/NodeList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/NodeList;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation

    .prologue
    .line 221
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 222
    .local v0, "elements":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Element;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    invoke-interface {p0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_1c

    .line 223
    invoke-interface {p0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 224
    .local v2, "node":Lorg/w3c/dom/Node;
    instance-of v3, v2, Lorg/w3c/dom/Element;

    if-eqz v3, :cond_19

    .line 225
    check-cast v2, Lorg/w3c/dom/Element;

    .end local v2    # "node":Lorg/w3c/dom/Node;
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 228
    :cond_1c
    return-object v0
.end method

.method public static toString(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .registers 2
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 153
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, v0}, Lezvcard/util/XmlUtils;->toString(Lorg/w3c/dom/Node;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Lorg/w3c/dom/Node;Ljava/util/Map;)Ljava/lang/String;
    .registers 5
    .param p0, "node"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Node;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 164
    .local p1, "outputProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 165
    .local v1, "writer":Ljava/io/StringWriter;
    invoke-static {p0, v1, p1}, Lezvcard/util/XmlUtils;->toWriter(Lorg/w3c/dom/Node;Ljava/io/Writer;Ljava/util/Map;)V

    .line 166
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_b
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v2

    return-object v2

    .line 167
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_d
    move-exception v0

    .line 169
    .local v0, "e":Ljavax/xml/transform/TransformerException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static toWriter(Lorg/w3c/dom/Node;Ljava/io/Writer;)V
    .registers 3
    .param p0, "node"    # Lorg/w3c/dom/Node;
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 180
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, p1, v0}, Lezvcard/util/XmlUtils;->toWriter(Lorg/w3c/dom/Node;Ljava/io/Writer;Ljava/util/Map;)V

    .line 181
    return-void
.end method

.method public static toWriter(Lorg/w3c/dom/Node;Ljava/io/Writer;Ljava/util/Map;)V
    .registers 11
    .param p0, "node"    # Lorg/w3c/dom/Node;
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Node;",
            "Ljava/io/Writer;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 193
    .local p2, "outputProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v6

    invoke-virtual {v6}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;
    :try_end_7
    .catch Ljavax/xml/transform/TransformerConfigurationException; {:try_start_0 .. :try_end_7} :catch_2e
    .catch Ljavax/xml/transform/TransformerFactoryConfigurationError; {:try_start_0 .. :try_end_7} :catch_35

    move-result-object v5

    .line 202
    .local v5, "transformer":Ljavax/xml/transform/Transformer;
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 204
    .local v2, "property":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_1c
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1c .. :try_end_2b} :catch_2c

    goto :goto_10

    .line 205
    :catch_2c
    move-exception v6

    goto :goto_10

    .line 194
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "property":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "transformer":Ljavax/xml/transform/Transformer;
    :catch_2e
    move-exception v0

    .line 196
    .local v0, "e":Ljavax/xml/transform/TransformerConfigurationException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 197
    .end local v0    # "e":Ljavax/xml/transform/TransformerConfigurationException;
    :catch_35
    move-exception v0

    .line 199
    .local v0, "e":Ljavax/xml/transform/TransformerFactoryConfigurationError;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 210
    .end local v0    # "e":Ljavax/xml/transform/TransformerFactoryConfigurationError;
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v5    # "transformer":Ljavax/xml/transform/Transformer;
    :cond_3c
    new-instance v4, Ljavax/xml/transform/dom/DOMSource;

    invoke-direct {v4, p0}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    .line 211
    .local v4, "source":Ljavax/xml/transform/dom/DOMSource;
    new-instance v3, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v3, p1}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 212
    .local v3, "result":Ljavax/xml/transform/stream/StreamResult;
    invoke-virtual {v5, v4, v3}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 213
    return-void
.end method
