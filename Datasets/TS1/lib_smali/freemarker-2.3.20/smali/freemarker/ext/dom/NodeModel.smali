.class public abstract Lfreemarker/ext/dom/NodeModel;
.super Ljava/lang/Object;
.source "NodeModel.java"

# interfaces
.implements Lfreemarker/template/TemplateNodeModel;
.implements Lfreemarker/template/TemplateHashModel;
.implements Lfreemarker/template/TemplateSequenceModel;
.implements Lfreemarker/template/AdapterTemplateModel;
.implements Lfreemarker/ext/util/WrapperTemplateModel;


# static fields
.field private static final STATIC_LOCK:Ljava/lang/Object;

.field static class$freemarker$ext$dom$XPathSupport:Ljava/lang/Class;

.field private static docBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

.field private static errorHandler:Lorg/xml/sax/ErrorHandler;

.field private static jaxenXPathSupport:Lfreemarker/ext/dom/XPathSupport;

.field static final logger:Lfreemarker/log/Logger;

.field static xpathSupportClass:Ljava/lang/Class;

.field private static final xpathSupportMap:Ljava/util/Map;


# instance fields
.field private children:Lfreemarker/template/TemplateSequenceModel;

.field final node:Lorg/w3c/dom/Node;

.field private parent:Lfreemarker/ext/dom/NodeModel;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 102
    const-string v0, "freemarker.dom"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/dom/NodeModel;->logger:Lfreemarker/log/Logger;

    .line 104
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lfreemarker/ext/dom/NodeModel;->STATIC_LOCK:Ljava/lang/Object;

    .line 108
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/dom/NodeModel;->xpathSupportMap:Ljava/util/Map;

    .line 118
    :try_start_1a
    invoke-static {}, Lfreemarker/ext/dom/NodeModel;->useDefaultXPathSupport()V
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1d} :catch_31

    .line 122
    :goto_1d
    sget-object v0, Lfreemarker/ext/dom/NodeModel;->xpathSupportClass:Ljava/lang/Class;

    if-nez v0, :cond_30

    sget-object v0, Lfreemarker/ext/dom/NodeModel;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v0}, Lfreemarker/log/Logger;->isWarnEnabled()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 123
    sget-object v0, Lfreemarker/ext/dom/NodeModel;->logger:Lfreemarker/log/Logger;

    const-string v1, "No XPath support is available."

    invoke-virtual {v0, v1}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;)V

    .line 125
    :cond_30
    return-void

    .line 119
    :catch_31
    move-exception v0

    goto :goto_1d
.end method

.method protected constructor <init>(Lorg/w3c/dom/Node;)V
    .registers 2
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 266
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 267
    iput-object p1, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    .line 268
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 623
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getDocumentBuilderFactory()Ljavax/xml/parsers/DocumentBuilderFactory;
    .registers 3

    .prologue
    .line 149
    sget-object v2, Lfreemarker/ext/dom/NodeModel;->STATIC_LOCK:Ljava/lang/Object;

    monitor-enter v2

    .line 150
    :try_start_3
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->docBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    if-nez v1, :cond_15

    .line 151
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    .line 152
    .local v0, "newFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 153
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setIgnoringElementContentWhitespace(Z)V

    .line 154
    sput-object v0, Lfreemarker/ext/dom/NodeModel;->docBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    .line 156
    :cond_15
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->docBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    monitor-exit v2

    return-object v1

    .line 157
    :catchall_19
    move-exception v1

    monitor-exit v2
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    throw v1
.end method

.method public static getErrorHandler()Lorg/xml/sax/ErrorHandler;
    .registers 2

    .prologue
    .line 173
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->STATIC_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 174
    :try_start_3
    sget-object v0, Lfreemarker/ext/dom/NodeModel;->errorHandler:Lorg/xml/sax/ErrorHandler;

    monitor-exit v1

    return-object v0

    .line 175
    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method private static getText(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .registers 6
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 643
    const-string v2, ""

    .line 644
    .local v2, "result":Ljava/lang/String;
    instance-of v3, p0, Lorg/w3c/dom/Text;

    if-nez v3, :cond_a

    instance-of v3, p0, Lorg/w3c/dom/CDATASection;

    if-eqz v3, :cond_11

    .line 645
    :cond_a
    check-cast p0, Lorg/w3c/dom/CharacterData;

    .end local p0    # "node":Lorg/w3c/dom/Node;
    invoke-interface {p0}, Lorg/w3c/dom/CharacterData;->getData()Ljava/lang/String;

    move-result-object v2

    .line 656
    :cond_10
    :goto_10
    return-object v2

    .line 647
    .restart local p0    # "node":Lorg/w3c/dom/Node;
    :cond_11
    instance-of v3, p0, Lorg/w3c/dom/Element;

    if-eqz v3, :cond_3c

    .line 648
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 649
    .local v0, "children":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1a
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_10

    .line 650
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-static {v4}, Lfreemarker/ext/dom/NodeModel;->getText(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 649
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    .line 653
    .end local v0    # "children":Lorg/w3c/dom/NodeList;
    .end local v1    # "i":I
    :cond_3c
    instance-of v3, p0, Lorg/w3c/dom/Document;

    if-eqz v3, :cond_10

    .line 654
    check-cast p0, Lorg/w3c/dom/Document;

    .end local p0    # "node":Lorg/w3c/dom/Node;
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v3

    invoke-static {v3}, Lfreemarker/ext/dom/NodeModel;->getText(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    goto :goto_10
.end method

.method public static getXPathSupportClass()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 637
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->STATIC_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 638
    :try_start_3
    sget-object v0, Lfreemarker/ext/dom/NodeModel;->xpathSupportClass:Ljava/lang/Class;

    monitor-exit v1

    return-object v0

    .line 639
    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public static mergeAdjacentText(Lorg/w3c/dom/Node;)V
    .registers 6
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 482
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v0

    .line 483
    .local v0, "child":Lorg/w3c/dom/Node;
    :goto_4
    if-eqz v0, :cond_45

    .line 484
    instance-of v3, v0, Lorg/w3c/dom/Text;

    if-nez v3, :cond_e

    instance-of v3, v0, Lorg/w3c/dom/CDATASection;

    if-eqz v3, :cond_41

    .line 485
    :cond_e
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v2

    .line 486
    .local v2, "next":Lorg/w3c/dom/Node;
    instance-of v3, v2, Lorg/w3c/dom/Text;

    if-nez v3, :cond_1a

    instance-of v3, v2, Lorg/w3c/dom/CDATASection;

    if-eqz v3, :cond_3c

    .line 487
    :cond_1a
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .local v1, "fullText":Ljava/lang/String;
    move-object v3, v0

    .line 488
    check-cast v3, Lorg/w3c/dom/CharacterData;

    invoke-interface {v3, v1}, Lorg/w3c/dom/CharacterData;->setData(Ljava/lang/String;)V

    .line 489
    invoke-interface {p0, v2}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 495
    .end local v1    # "fullText":Ljava/lang/String;
    .end local v2    # "next":Lorg/w3c/dom/Node;
    :cond_3c
    :goto_3c
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v0

    goto :goto_4

    .line 493
    :cond_41
    invoke-static {v0}, Lfreemarker/ext/dom/NodeModel;->mergeAdjacentText(Lorg/w3c/dom/Node;)V

    goto :goto_3c

    .line 497
    :cond_45
    return-void
.end method

.method public static parse(Ljava/io/File;)Lfreemarker/ext/dom/NodeModel;
    .registers 2
    .param p0, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Ljavax/xml/parsers/ParserConfigurationException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 263
    invoke-static {p0, v0, v0}, Lfreemarker/ext/dom/NodeModel;->parse(Ljava/io/File;ZZ)Lfreemarker/ext/dom/NodeModel;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/io/File;ZZ)Lfreemarker/ext/dom/NodeModel;
    .registers 7
    .param p0, "f"    # Ljava/io/File;
    .param p1, "removeComments"    # Z
    .param p2, "removePIs"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Ljavax/xml/parsers/ParserConfigurationException;
        }
    .end annotation

    .prologue
    .line 242
    invoke-static {}, Lfreemarker/ext/dom/NodeModel;->getDocumentBuilderFactory()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 243
    .local v0, "builder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-static {}, Lfreemarker/ext/dom/NodeModel;->getErrorHandler()Lorg/xml/sax/ErrorHandler;

    move-result-object v2

    .line 244
    .local v2, "errorHandler":Lorg/xml/sax/ErrorHandler;
    if-eqz v2, :cond_11

    invoke-virtual {v0, v2}, Ljavax/xml/parsers/DocumentBuilder;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 245
    :cond_11
    invoke-virtual {v0, p0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/File;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 246
    .local v1, "doc":Lorg/w3c/dom/Document;
    if-eqz p1, :cond_1a

    .line 247
    invoke-static {v1}, Lfreemarker/ext/dom/NodeModel;->removeComments(Lorg/w3c/dom/Node;)V

    .line 249
    :cond_1a
    if-eqz p2, :cond_1f

    .line 250
    invoke-static {v1}, Lfreemarker/ext/dom/NodeModel;->removePIs(Lorg/w3c/dom/Node;)V

    .line 252
    :cond_1f
    invoke-static {v1}, Lfreemarker/ext/dom/NodeModel;->mergeAdjacentText(Lorg/w3c/dom/Node;)V

    .line 253
    invoke-static {v1}, Lfreemarker/ext/dom/NodeModel;->wrap(Lorg/w3c/dom/Node;)Lfreemarker/ext/dom/NodeModel;

    move-result-object v3

    return-object v3
.end method

.method public static parse(Lorg/xml/sax/InputSource;)Lfreemarker/ext/dom/NodeModel;
    .registers 2
    .param p0, "is"    # Lorg/xml/sax/InputSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Ljavax/xml/parsers/ParserConfigurationException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 228
    invoke-static {p0, v0, v0}, Lfreemarker/ext/dom/NodeModel;->parse(Lorg/xml/sax/InputSource;ZZ)Lfreemarker/ext/dom/NodeModel;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Lorg/xml/sax/InputSource;ZZ)Lfreemarker/ext/dom/NodeModel;
    .registers 10
    .param p0, "is"    # Lorg/xml/sax/InputSource;
    .param p1, "removeComments"    # Z
    .param p2, "removePIs"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Ljavax/xml/parsers/ParserConfigurationException;
        }
    .end annotation

    .prologue
    .line 189
    invoke-static {}, Lfreemarker/ext/dom/NodeModel;->getDocumentBuilderFactory()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v4

    invoke-virtual {v4}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 190
    .local v0, "builder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-static {}, Lfreemarker/ext/dom/NodeModel;->getErrorHandler()Lorg/xml/sax/ErrorHandler;

    move-result-object v3

    .line 191
    .local v3, "errorHandler":Lorg/xml/sax/ErrorHandler;
    if-eqz v3, :cond_11

    invoke-virtual {v0, v3}, Ljavax/xml/parsers/DocumentBuilder;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 194
    :cond_11
    :try_start_11
    invoke-virtual {v0, p0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;
    :try_end_14
    .catch Ljava/net/MalformedURLException; {:try_start_11 .. :try_end_14} :catch_21

    move-result-object v1

    .line 207
    .local v1, "doc":Lorg/w3c/dom/Document;
    if-eqz p1, :cond_54

    if-eqz p2, :cond_54

    .line 208
    invoke-static {v1}, Lfreemarker/ext/dom/NodeModel;->simplify(Lorg/w3c/dom/Node;)V

    .line 218
    :goto_1c
    invoke-static {v1}, Lfreemarker/ext/dom/NodeModel;->wrap(Lorg/w3c/dom/Node;)Lfreemarker/ext/dom/NodeModel;

    move-result-object v4

    return-object v4

    .line 195
    .end local v1    # "doc":Lorg/w3c/dom/Document;
    :catch_21
    move-exception v2

    .line 197
    .local v2, "e":Ljava/net/MalformedURLException;
    invoke-virtual {p0}, Lorg/xml/sax/InputSource;->getSystemId()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_53

    invoke-virtual {p0}, Lorg/xml/sax/InputSource;->getCharacterStream()Ljava/io/Reader;

    move-result-object v4

    if-nez v4, :cond_53

    invoke-virtual {p0}, Lorg/xml/sax/InputSource;->getByteStream()Ljava/io/InputStream;

    move-result-object v4

    if-nez v4, :cond_53

    .line 198
    new-instance v4, Ljava/net/MalformedURLException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "The SAX InputSource has systemId == null && characterStream == null && byteStream == null. This is often because it was created with a null InputStream or Reader, which is often because the XML file it should point to was not found. (The original exception was: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 204
    :cond_53
    throw v2

    .line 210
    .end local v2    # "e":Ljava/net/MalformedURLException;
    .restart local v1    # "doc":Lorg/w3c/dom/Document;
    :cond_54
    if-eqz p1, :cond_59

    .line 211
    invoke-static {v1}, Lfreemarker/ext/dom/NodeModel;->removeComments(Lorg/w3c/dom/Node;)V

    .line 213
    :cond_59
    if-eqz p2, :cond_5e

    .line 214
    invoke-static {v1}, Lfreemarker/ext/dom/NodeModel;->removePIs(Lorg/w3c/dom/Node;)V

    .line 216
    :cond_5e
    invoke-static {v1}, Lfreemarker/ext/dom/NodeModel;->mergeAdjacentText(Lorg/w3c/dom/Node;)V

    goto :goto_1c
.end method

.method public static removeComments(Lorg/w3c/dom/Node;)V
    .registers 7
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 428
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 429
    .local v1, "children":Lorg/w3c/dom/NodeList;
    const/4 v2, 0x0

    .line 430
    .local v2, "i":I
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    .line 431
    .local v3, "len":I
    :goto_9
    if-ge v2, v3, :cond_2c

    .line 432
    invoke-interface {v1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 433
    .local v0, "child":Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->hasChildNodes()Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 434
    invoke-static {v0}, Lfreemarker/ext/dom/NodeModel;->removeComments(Lorg/w3c/dom/Node;)V

    .line 435
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 437
    :cond_1b
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_29

    .line 438
    invoke-interface {p0, v0}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 439
    add-int/lit8 v3, v3, -0x1

    goto :goto_9

    .line 441
    :cond_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 445
    .end local v0    # "child":Lorg/w3c/dom/Node;
    :cond_2c
    return-void
.end method

.method public static removePIs(Lorg/w3c/dom/Node;)V
    .registers 7
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 454
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 455
    .local v1, "children":Lorg/w3c/dom/NodeList;
    const/4 v2, 0x0

    .line 456
    .local v2, "i":I
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    .line 457
    .local v3, "len":I
    :goto_9
    if-ge v2, v3, :cond_2b

    .line 458
    invoke-interface {v1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 459
    .local v0, "child":Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->hasChildNodes()Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 460
    invoke-static {v0}, Lfreemarker/ext/dom/NodeModel;->removePIs(Lorg/w3c/dom/Node;)V

    .line 461
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 463
    :cond_1b
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    const/4 v5, 0x7

    if-ne v4, v5, :cond_28

    .line 464
    invoke-interface {p0, v0}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 465
    add-int/lit8 v3, v3, -0x1

    goto :goto_9

    .line 467
    :cond_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 471
    .end local v0    # "child":Lorg/w3c/dom/Node;
    :cond_2b
    return-void
.end method

.method public static setDocumentBuilderFactory(Ljavax/xml/parsers/DocumentBuilderFactory;)V
    .registers 3
    .param p0, "docBuilderFactory"    # Ljavax/xml/parsers/DocumentBuilderFactory;

    .prologue
    .line 139
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->STATIC_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 140
    :try_start_3
    sput-object p0, Lfreemarker/ext/dom/NodeModel;->docBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    .line 141
    monitor-exit v1

    .line 142
    return-void

    .line 141
    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public static setErrorHandler(Lorg/xml/sax/ErrorHandler;)V
    .registers 3
    .param p0, "errorHandler"    # Lorg/xml/sax/ErrorHandler;

    .prologue
    .line 164
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->STATIC_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 165
    :try_start_3
    sput-object p0, Lfreemarker/ext/dom/NodeModel;->errorHandler:Lorg/xml/sax/ErrorHandler;

    .line 166
    monitor-exit v1

    .line 167
    return-void

    .line 166
    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public static setXPathSupportClass(Ljava/lang/Class;)V
    .registers 4
    .param p0, "cl"    # Ljava/lang/Class;

    .prologue
    .line 623
    if-eqz p0, :cond_3a

    sget-object v0, Lfreemarker/ext/dom/NodeModel;->class$freemarker$ext$dom$XPathSupport:Ljava/lang/Class;

    if-nez v0, :cond_37

    const-string v0, "freemarker.ext.dom.XPathSupport"

    invoke-static {v0}, Lfreemarker/ext/dom/NodeModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/dom/NodeModel;->class$freemarker$ext$dom$XPathSupport:Ljava/lang/Class;

    :goto_e
    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_3a

    .line 624
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " does not implement freemarker.ext.dom.XPathSupport"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 623
    :cond_37
    sget-object v0, Lfreemarker/ext/dom/NodeModel;->class$freemarker$ext$dom$XPathSupport:Ljava/lang/Class;

    goto :goto_e

    .line 627
    :cond_3a
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->STATIC_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 628
    :try_start_3d
    sput-object p0, Lfreemarker/ext/dom/NodeModel;->xpathSupportClass:Ljava/lang/Class;

    .line 629
    monitor-exit v1

    .line 630
    return-void

    .line 629
    :catchall_41
    move-exception v0

    monitor-exit v1
    :try_end_43
    .catchall {:try_start_3d .. :try_end_43} :catchall_41

    throw v0
.end method

.method public static simplify(Lorg/w3c/dom/Node;)V
    .registers 10
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 504
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 505
    .local v1, "children":Lorg/w3c/dom/NodeList;
    const/4 v2, 0x0

    .line 506
    .local v2, "i":I
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    .line 507
    .local v3, "len":I
    const/4 v4, 0x0

    .line 508
    .local v4, "prevTextChild":Lorg/w3c/dom/Node;
    :goto_a
    if-ge v2, v3, :cond_69

    .line 509
    invoke-interface {v1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 510
    .local v0, "child":Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->hasChildNodes()Z

    move-result v7

    if-eqz v7, :cond_1d

    .line 511
    invoke-static {v0}, Lfreemarker/ext/dom/NodeModel;->simplify(Lorg/w3c/dom/Node;)V

    .line 512
    const/4 v4, 0x0

    .line 513
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 515
    :cond_1d
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v6

    .line 516
    .local v6, "type":I
    const/4 v7, 0x7

    if-ne v6, v7, :cond_2a

    .line 517
    invoke-interface {p0, v0}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 518
    add-int/lit8 v3, v3, -0x1

    goto :goto_a

    .line 519
    :cond_2a
    const/16 v7, 0x8

    if-ne v6, v7, :cond_34

    .line 520
    invoke-interface {p0, v0}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 521
    add-int/lit8 v3, v3, -0x1

    goto :goto_a

    .line 522
    :cond_34
    const/4 v7, 0x3

    if-eq v6, v7, :cond_3a

    const/4 v7, 0x4

    if-ne v6, v7, :cond_65

    .line 523
    :cond_3a
    if-eqz v4, :cond_61

    move-object v5, v4

    .line 524
    check-cast v5, Lorg/w3c/dom/CharacterData;

    .line 525
    .local v5, "ptc":Lorg/w3c/dom/CharacterData;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-interface {v5}, Lorg/w3c/dom/CharacterData;->getNodeValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Lorg/w3c/dom/CharacterData;->setData(Ljava/lang/String;)V

    .line 526
    invoke-interface {p0, v0}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 527
    add-int/lit8 v3, v3, -0x1

    .line 528
    goto :goto_a

    .line 529
    .end local v5    # "ptc":Lorg/w3c/dom/CharacterData;
    :cond_61
    move-object v4, v0

    .line 530
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 533
    :cond_65
    const/4 v4, 0x0

    .line 534
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 538
    .end local v0    # "child":Lorg/w3c/dom/Node;
    .end local v6    # "type":I
    :cond_69
    return-void
.end method

.method public static useDefaultXPathSupport()V
    .registers 2

    .prologue
    .line 554
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->STATIC_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 555
    const/4 v0, 0x0

    :try_start_4
    sput-object v0, Lfreemarker/ext/dom/NodeModel;->xpathSupportClass:Ljava/lang/Class;

    .line 556
    const/4 v0, 0x0

    sput-object v0, Lfreemarker/ext/dom/NodeModel;->jaxenXPathSupport:Lfreemarker/ext/dom/XPathSupport;
    :try_end_9
    .catchall {:try_start_4 .. :try_end_9} :catchall_1c

    .line 558
    :try_start_9
    invoke-static {}, Lfreemarker/ext/dom/NodeModel;->useXalanXPathSupport()V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_c} :catch_1f
    .catchall {:try_start_9 .. :try_end_c} :catchall_1c

    .line 562
    :goto_c
    :try_start_c
    sget-object v0, Lfreemarker/ext/dom/NodeModel;->xpathSupportClass:Ljava/lang/Class;
    :try_end_e
    .catchall {:try_start_c .. :try_end_e} :catchall_1c

    if-nez v0, :cond_13

    .line 563
    :try_start_10
    invoke-static {}, Lfreemarker/ext/dom/NodeModel;->useSunInternalXPathSupport()V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_13} :catch_21
    .catchall {:try_start_10 .. :try_end_13} :catchall_1c

    .line 567
    :cond_13
    :goto_13
    :try_start_13
    sget-object v0, Lfreemarker/ext/dom/NodeModel;->xpathSupportClass:Ljava/lang/Class;
    :try_end_15
    .catchall {:try_start_13 .. :try_end_15} :catchall_1c

    if-nez v0, :cond_1a

    .line 568
    :try_start_17
    invoke-static {}, Lfreemarker/ext/dom/NodeModel;->useJaxenXPathSupport()V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1a} :catch_23
    .catchall {:try_start_17 .. :try_end_1a} :catchall_1c

    .line 572
    :cond_1a
    :goto_1a
    :try_start_1a
    monitor-exit v1

    .line 573
    return-void

    .line 572
    :catchall_1c
    move-exception v0

    monitor-exit v1
    :try_end_1e
    .catchall {:try_start_1a .. :try_end_1e} :catchall_1c

    throw v0

    .line 559
    :catch_1f
    move-exception v0

    goto :goto_c

    .line 564
    :catch_21
    move-exception v0

    goto :goto_13

    .line 569
    :catch_23
    move-exception v0

    goto :goto_1a
.end method

.method public static useJaxenXPathSupport()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 580
    const-string v1, "org.jaxen.dom.DOMXPath"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 581
    const-string v1, "freemarker.ext.dom.JaxenXPathSupport"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 582
    .local v0, "c":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/ext/dom/XPathSupport;

    sput-object v1, Lfreemarker/ext/dom/NodeModel;->jaxenXPathSupport:Lfreemarker/ext/dom/XPathSupport;

    .line 583
    sget-object v2, Lfreemarker/ext/dom/NodeModel;->STATIC_LOCK:Ljava/lang/Object;

    monitor-enter v2

    .line 584
    :try_start_16
    sput-object v0, Lfreemarker/ext/dom/NodeModel;->xpathSupportClass:Ljava/lang/Class;

    .line 585
    monitor-exit v2
    :try_end_19
    .catchall {:try_start_16 .. :try_end_19} :catchall_29

    .line 586
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v1}, Lfreemarker/log/Logger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_28

    .line 587
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->logger:Lfreemarker/log/Logger;

    const-string v2, "Using Jaxen classes for XPath support"

    invoke-virtual {v1, v2}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 589
    :cond_28
    return-void

    .line 585
    :catchall_29
    move-exception v1

    :try_start_2a
    monitor-exit v2
    :try_end_2b
    .catchall {:try_start_2a .. :try_end_2b} :catchall_29

    throw v1
.end method

.method public static useSunInternalXPathSupport()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 607
    const-string v1, "com.sun.org.apache.xpath.internal.XPath"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 608
    const-string v1, "freemarker.ext.dom.SunInternalXalanXPathSupport"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 609
    .local v0, "c":Ljava/lang/Class;
    sget-object v2, Lfreemarker/ext/dom/NodeModel;->STATIC_LOCK:Ljava/lang/Object;

    monitor-enter v2

    .line 610
    :try_start_e
    sput-object v0, Lfreemarker/ext/dom/NodeModel;->xpathSupportClass:Ljava/lang/Class;

    .line 611
    monitor-exit v2
    :try_end_11
    .catchall {:try_start_e .. :try_end_11} :catchall_21

    .line 612
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v1}, Lfreemarker/log/Logger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_20

    .line 613
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->logger:Lfreemarker/log/Logger;

    const-string v2, "Using Sun\'s internal Xalan classes for XPath support"

    invoke-virtual {v1, v2}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 615
    :cond_20
    return-void

    .line 611
    :catchall_21
    move-exception v1

    :try_start_22
    monitor-exit v2
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_21

    throw v1
.end method

.method public static useXalanXPathSupport()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 596
    const-string v1, "org.apache.xpath.XPath"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 597
    const-string v1, "freemarker.ext.dom.XalanXPathSupport"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 598
    .local v0, "c":Ljava/lang/Class;
    sget-object v2, Lfreemarker/ext/dom/NodeModel;->STATIC_LOCK:Ljava/lang/Object;

    monitor-enter v2

    .line 599
    :try_start_e
    sput-object v0, Lfreemarker/ext/dom/NodeModel;->xpathSupportClass:Ljava/lang/Class;

    .line 600
    monitor-exit v2
    :try_end_11
    .catchall {:try_start_e .. :try_end_11} :catchall_21

    .line 601
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v1}, Lfreemarker/log/Logger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_20

    .line 602
    sget-object v1, Lfreemarker/ext/dom/NodeModel;->logger:Lfreemarker/log/Logger;

    const-string v2, "Using Xalan classes for XPath support"

    invoke-virtual {v1, v2}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 604
    :cond_20
    return-void

    .line 600
    :catchall_21
    move-exception v1

    :try_start_22
    monitor-exit v2
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_21

    throw v1
.end method

.method public static wrap(Lorg/w3c/dom/Node;)Lfreemarker/ext/dom/NodeModel;
    .registers 3
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 404
    if-nez p0, :cond_4

    .line 405
    const/4 v0, 0x0

    .line 418
    .end local p0    # "node":Lorg/w3c/dom/Node;
    .local v0, "result":Lfreemarker/ext/dom/NodeModel;
    :goto_3
    return-object v0

    .line 407
    .end local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    .restart local p0    # "node":Lorg/w3c/dom/Node;
    :cond_4
    const/4 v0, 0x0

    .line 408
    .restart local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v1

    packed-switch v1, :pswitch_data_3e

    :pswitch_c
    goto :goto_3

    .line 410
    :pswitch_d
    new-instance v0, Lfreemarker/ext/dom/ElementModel;

    .end local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    check-cast p0, Lorg/w3c/dom/Element;

    .end local p0    # "node":Lorg/w3c/dom/Node;
    invoke-direct {v0, p0}, Lfreemarker/ext/dom/ElementModel;-><init>(Lorg/w3c/dom/Element;)V

    .restart local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    goto :goto_3

    .line 409
    .restart local p0    # "node":Lorg/w3c/dom/Node;
    :pswitch_15
    new-instance v0, Lfreemarker/ext/dom/DocumentModel;

    .end local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    check-cast p0, Lorg/w3c/dom/Document;

    .end local p0    # "node":Lorg/w3c/dom/Node;
    invoke-direct {v0, p0}, Lfreemarker/ext/dom/DocumentModel;-><init>(Lorg/w3c/dom/Document;)V

    .restart local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    goto :goto_3

    .line 411
    .restart local p0    # "node":Lorg/w3c/dom/Node;
    :pswitch_1d
    new-instance v0, Lfreemarker/ext/dom/AttributeNodeModel;

    .end local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    check-cast p0, Lorg/w3c/dom/Attr;

    .end local p0    # "node":Lorg/w3c/dom/Node;
    invoke-direct {v0, p0}, Lfreemarker/ext/dom/AttributeNodeModel;-><init>(Lorg/w3c/dom/Attr;)V

    .restart local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    goto :goto_3

    .line 414
    .restart local p0    # "node":Lorg/w3c/dom/Node;
    :pswitch_25
    new-instance v0, Lfreemarker/ext/dom/CharacterDataNodeModel;

    .end local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    check-cast p0, Lorg/w3c/dom/CharacterData;

    .end local p0    # "node":Lorg/w3c/dom/Node;
    invoke-direct {v0, p0}, Lfreemarker/ext/dom/CharacterDataNodeModel;-><init>(Lorg/w3c/dom/CharacterData;)V

    .restart local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    goto :goto_3

    .line 415
    .restart local p0    # "node":Lorg/w3c/dom/Node;
    :pswitch_2d
    new-instance v0, Lfreemarker/ext/dom/PINodeModel;

    .end local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    check-cast p0, Lorg/w3c/dom/ProcessingInstruction;

    .end local p0    # "node":Lorg/w3c/dom/Node;
    invoke-direct {v0, p0}, Lfreemarker/ext/dom/PINodeModel;-><init>(Lorg/w3c/dom/ProcessingInstruction;)V

    .restart local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    goto :goto_3

    .line 416
    .restart local p0    # "node":Lorg/w3c/dom/Node;
    :pswitch_35
    new-instance v0, Lfreemarker/ext/dom/DocumentTypeModel;

    .end local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    check-cast p0, Lorg/w3c/dom/DocumentType;

    .end local p0    # "node":Lorg/w3c/dom/Node;
    invoke-direct {v0, p0}, Lfreemarker/ext/dom/DocumentTypeModel;-><init>(Lorg/w3c/dom/DocumentType;)V

    .restart local v0    # "result":Lfreemarker/ext/dom/NodeModel;
    goto :goto_3

    .line 408
    nop

    :pswitch_data_3e
    .packed-switch 0x1
        :pswitch_d
        :pswitch_1d
        :pswitch_25
        :pswitch_25
        :pswitch_c
        :pswitch_c
        :pswitch_2d
        :pswitch_25
        :pswitch_15
        :pswitch_35
    .end packed-switch
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 398
    if-nez p1, :cond_4

    .line 399
    .end local p1    # "other":Ljava/lang/Object;
    :cond_3
    :goto_3
    return v0

    .restart local p1    # "other":Ljava/lang/Object;
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_3

    check-cast p1, Lfreemarker/ext/dom/NodeModel;

    .end local p1    # "other":Ljava/lang/Object;
    iget-object v1, p1, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    iget-object v2, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x1

    goto :goto_3
.end method

.method public exec(Ljava/util/List;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 361
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_f

    .line 362
    new-instance v2, Lfreemarker/template/TemplateModelException;

    const-string v3, "Expecting exactly one arguments"

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 364
    :cond_f
    const/4 v2, 0x0

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 366
    .local v0, "query":Ljava/lang/String;
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeModel;->getXPathSupport()Lfreemarker/ext/dom/XPathSupport;

    move-result-object v1

    .line 367
    .local v1, "xps":Lfreemarker/ext/dom/XPathSupport;
    if-nez v1, :cond_24

    .line 368
    new-instance v2, Lfreemarker/template/TemplateModelException;

    const-string v3, "No XPath support available"

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 370
    :cond_24
    iget-object v2, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v1, v2, v0}, Lfreemarker/ext/dom/XPathSupport;->executeQuery(Ljava/lang/Object;Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    return-object v2
.end method

.method public final get(I)Lfreemarker/template/TemplateModel;
    .registers 2
    .param p1, "i"    # I

    .prologue
    .line 376
    if-nez p1, :cond_3

    .end local p0    # "this":Lfreemarker/ext/dom/NodeModel;
    :goto_2
    return-object p0

    .restart local p0    # "this":Lfreemarker/ext/dom/NodeModel;
    :cond_3
    const/4 p0, 0x0

    goto :goto_2
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 11
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 279
    const-string v7, "@@"

    invoke-virtual {p1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_ac

    .line 280
    const-string v7, "@@text"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1d

    .line 281
    new-instance v6, Lfreemarker/template/SimpleScalar;

    iget-object v7, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-static {v7}, Lfreemarker/ext/dom/NodeModel;->getText(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    .line 313
    :cond_1c
    :goto_1c
    return-object v6

    .line 283
    :cond_1d
    const-string v7, "@@namespace"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_33

    .line 284
    iget-object v7, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    .line 285
    .local v2, "nsURI":Ljava/lang/String;
    if-eqz v2, :cond_1c

    new-instance v6, Lfreemarker/template/SimpleScalar;

    invoke-direct {v6, v2}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto :goto_1c

    .line 287
    .end local v2    # "nsURI":Ljava/lang/String;
    :cond_33
    const-string v7, "@@local_name"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4d

    .line 288
    iget-object v6, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v1

    .line 289
    .local v1, "localName":Ljava/lang/String;
    if-nez v1, :cond_47

    .line 290
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeModel;->getNodeName()Ljava/lang/String;

    move-result-object v1

    .line 292
    :cond_47
    new-instance v6, Lfreemarker/template/SimpleScalar;

    invoke-direct {v6, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto :goto_1c

    .line 294
    .end local v1    # "localName":Ljava/lang/String;
    :cond_4d
    const-string v7, "@@markup"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_70

    .line 295
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 296
    .local v0, "buf":Ljava/lang/StringBuffer;
    new-instance v3, Lfreemarker/ext/dom/NodeOutputter;

    iget-object v6, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-direct {v3, v6}, Lfreemarker/ext/dom/NodeOutputter;-><init>(Lorg/w3c/dom/Node;)V

    .line 297
    .local v3, "nu":Lfreemarker/ext/dom/NodeOutputter;
    iget-object v6, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-virtual {v3, v6, v0}, Lfreemarker/ext/dom/NodeOutputter;->outputContent(Lorg/w3c/dom/Node;Ljava/lang/StringBuffer;)V

    .line 298
    new-instance v6, Lfreemarker/template/SimpleScalar;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto :goto_1c

    .line 300
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v3    # "nu":Lfreemarker/ext/dom/NodeOutputter;
    :cond_70
    const-string v7, "@@nested_markup"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_97

    .line 301
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 302
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    new-instance v3, Lfreemarker/ext/dom/NodeOutputter;

    iget-object v6, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-direct {v3, v6}, Lfreemarker/ext/dom/NodeOutputter;-><init>(Lorg/w3c/dom/Node;)V

    .line 303
    .restart local v3    # "nu":Lfreemarker/ext/dom/NodeOutputter;
    iget-object v6, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-virtual {v3, v6, v0}, Lfreemarker/ext/dom/NodeOutputter;->outputContent(Lorg/w3c/dom/NodeList;Ljava/lang/StringBuffer;)V

    .line 304
    new-instance v6, Lfreemarker/template/SimpleScalar;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto :goto_1c

    .line 306
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v3    # "nu":Lfreemarker/ext/dom/NodeOutputter;
    :cond_97
    const-string v7, "@@qname"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_ac

    .line 307
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeModel;->getQualifiedName()Ljava/lang/String;

    move-result-object v4

    .line 308
    .local v4, "qname":Ljava/lang/String;
    if-eqz v4, :cond_1c

    new-instance v6, Lfreemarker/template/SimpleScalar;

    invoke-direct {v6, v4}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto/16 :goto_1c

    .line 311
    .end local v4    # "qname":Ljava/lang/String;
    :cond_ac
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeModel;->getXPathSupport()Lfreemarker/ext/dom/XPathSupport;

    move-result-object v5

    .line 312
    .local v5, "xps":Lfreemarker/ext/dom/XPathSupport;
    if-eqz v5, :cond_ba

    .line 313
    iget-object v6, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v5, v6, p1}, Lfreemarker/ext/dom/XPathSupport;->executeQuery(Ljava/lang/Object;Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v6

    goto/16 :goto_1c

    .line 315
    :cond_ba
    new-instance v6, Lfreemarker/template/TemplateModelException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Can\'t try to resolve the XML query key, because no XPath support is available. It\'s either malformed or an XPath expression: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public getAdaptedObject(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p1, "hint"    # Ljava/lang/Class;

    .prologue
    .line 691
    iget-object v0, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    return-object v0
.end method

.method public getChildNodes()Lfreemarker/template/TemplateSequenceModel;
    .registers 3

    .prologue
    .line 335
    iget-object v0, p0, Lfreemarker/ext/dom/NodeModel;->children:Lfreemarker/template/TemplateSequenceModel;

    if-nez v0, :cond_11

    .line 336
    new-instance v0, Lfreemarker/ext/dom/NodeListModel;

    iget-object v1, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lfreemarker/ext/dom/NodeListModel;-><init>(Lorg/w3c/dom/NodeList;Lfreemarker/ext/dom/NodeModel;)V

    iput-object v0, p0, Lfreemarker/ext/dom/NodeModel;->children:Lfreemarker/template/TemplateSequenceModel;

    .line 338
    :cond_11
    iget-object v0, p0, Lfreemarker/ext/dom/NodeModel;->children:Lfreemarker/template/TemplateSequenceModel;

    return-object v0
.end method

.method getDocumentNodeModel()Lfreemarker/ext/dom/NodeModel;
    .registers 2

    .prologue
    .line 541
    iget-object v0, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    instance-of v0, v0, Lorg/w3c/dom/Document;

    if-eqz v0, :cond_7

    .line 545
    .end local p0    # "this":Lfreemarker/ext/dom/NodeModel;
    :goto_6
    return-object p0

    .restart local p0    # "this":Lfreemarker/ext/dom/NodeModel;
    :cond_7
    iget-object v0, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/ext/dom/NodeModel;->wrap(Lorg/w3c/dom/Node;)Lfreemarker/ext/dom/NodeModel;

    move-result-object p0

    goto :goto_6
.end method

.method public getNode()Lorg/w3c/dom/Node;
    .registers 2

    .prologue
    .line 275
    iget-object v0, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    return-object v0
.end method

.method public getNodeNamespace()Ljava/lang/String;
    .registers 6

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 380
    iget-object v2, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    .line 381
    .local v0, "nodeType":I
    if-eq v0, v4, :cond_e

    if-eq v0, v3, :cond_e

    .line 382
    const/4 v1, 0x0

    .line 390
    :cond_d
    :goto_d
    return-object v1

    .line 384
    :cond_e
    iget-object v2, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    .line 385
    .local v1, "result":Ljava/lang/String;
    if-nez v1, :cond_1b

    if-ne v0, v3, :cond_1b

    .line 386
    const-string v1, ""

    goto :goto_d

    .line 387
    :cond_1b
    const-string v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    if-ne v0, v4, :cond_d

    .line 388
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public final getNodeType()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 342
    iget-object v1, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    .line 343
    .local v0, "nodeType":S
    packed-switch v0, :pswitch_data_4c

    .line 357
    new-instance v1, Lfreemarker/template/TemplateModelException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Unknown node type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ". This should be impossible!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 344
    :pswitch_28
    const-string v1, "attribute"

    .line 355
    :goto_2a
    return-object v1

    .line 345
    :pswitch_2b
    const-string v1, "text"

    goto :goto_2a

    .line 346
    :pswitch_2e
    const-string v1, "comment"

    goto :goto_2a

    .line 347
    :pswitch_31
    const-string v1, "document_fragment"

    goto :goto_2a

    .line 348
    :pswitch_34
    const-string v1, "document"

    goto :goto_2a

    .line 349
    :pswitch_37
    const-string v1, "document_type"

    goto :goto_2a

    .line 350
    :pswitch_3a
    const-string v1, "element"

    goto :goto_2a

    .line 351
    :pswitch_3d
    const-string v1, "entity"

    goto :goto_2a

    .line 352
    :pswitch_40
    const-string v1, "entity_reference"

    goto :goto_2a

    .line 353
    :pswitch_43
    const-string v1, "notation"

    goto :goto_2a

    .line 354
    :pswitch_46
    const-string v1, "pi"

    goto :goto_2a

    .line 355
    :pswitch_49
    const-string v1, "text"

    goto :goto_2a

    .line 343
    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_3a
        :pswitch_28
        :pswitch_49
        :pswitch_2b
        :pswitch_40
        :pswitch_3d
        :pswitch_46
        :pswitch_2e
        :pswitch_34
        :pswitch_37
        :pswitch_31
        :pswitch_43
    .end packed-switch
.end method

.method public getParentNode()Lfreemarker/template/TemplateNodeModel;
    .registers 3

    .prologue
    .line 322
    iget-object v1, p0, Lfreemarker/ext/dom/NodeModel;->parent:Lfreemarker/ext/dom/NodeModel;

    if-nez v1, :cond_20

    .line 323
    iget-object v1, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    .line 324
    .local v0, "parentNode":Lorg/w3c/dom/Node;
    if-nez v0, :cond_1a

    .line 325
    iget-object v1, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    instance-of v1, v1, Lorg/w3c/dom/Attr;

    if-eqz v1, :cond_1a

    .line 326
    iget-object v1, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    check-cast v1, Lorg/w3c/dom/Attr;

    invoke-interface {v1}, Lorg/w3c/dom/Attr;->getOwnerElement()Lorg/w3c/dom/Element;

    move-result-object v0

    .line 329
    :cond_1a
    invoke-static {v0}, Lfreemarker/ext/dom/NodeModel;->wrap(Lorg/w3c/dom/Node;)Lfreemarker/ext/dom/NodeModel;

    move-result-object v1

    iput-object v1, p0, Lfreemarker/ext/dom/NodeModel;->parent:Lfreemarker/ext/dom/NodeModel;

    .line 331
    .end local v0    # "parentNode":Lorg/w3c/dom/Node;
    :cond_20
    iget-object v1, p0, Lfreemarker/ext/dom/NodeModel;->parent:Lfreemarker/ext/dom/NodeModel;

    return-object v1
.end method

.method getQualifiedName()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 687
    invoke-virtual {p0}, Lfreemarker/ext/dom/NodeModel;->getNodeName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWrappedObject()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 695
    iget-object v0, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    return-object v0
.end method

.method getXPathSupport()Lfreemarker/ext/dom/XPathSupport;
    .registers 8

    .prologue
    .line 660
    sget-object v5, Lfreemarker/ext/dom/NodeModel;->jaxenXPathSupport:Lfreemarker/ext/dom/XPathSupport;

    if-eqz v5, :cond_7

    .line 661
    sget-object v4, Lfreemarker/ext/dom/NodeModel;->jaxenXPathSupport:Lfreemarker/ext/dom/XPathSupport;

    .line 682
    :goto_6
    return-object v4

    .line 663
    :cond_7
    const/4 v4, 0x0

    .line 664
    .local v4, "xps":Lfreemarker/ext/dom/XPathSupport;
    iget-object v5, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    .line 665
    .local v1, "doc":Lorg/w3c/dom/Document;
    if-nez v1, :cond_14

    .line 666
    iget-object v1, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    .end local v1    # "doc":Lorg/w3c/dom/Document;
    check-cast v1, Lorg/w3c/dom/Document;

    .line 668
    .restart local v1    # "doc":Lorg/w3c/dom/Document;
    :cond_14
    monitor-enter v1

    .line 669
    :try_start_15
    sget-object v5, Lfreemarker/ext/dom/NodeModel;->xpathSupportMap:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/WeakReference;

    .line 670
    .local v3, "ref":Ljava/lang/ref/WeakReference;
    if-eqz v3, :cond_27

    .line 671
    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Lfreemarker/ext/dom/XPathSupport;

    move-object v4, v0
    :try_end_27
    .catchall {:try_start_15 .. :try_end_27} :catchall_3f

    .line 673
    :cond_27
    if-nez v4, :cond_3d

    .line 675
    :try_start_29
    sget-object v5, Lfreemarker/ext/dom/NodeModel;->xpathSupportClass:Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Lfreemarker/ext/dom/XPathSupport;

    move-object v4, v0

    .line 676
    sget-object v5, Lfreemarker/ext/dom/NodeModel;->xpathSupportMap:Ljava/util/Map;

    new-instance v6, Ljava/lang/ref/WeakReference;

    invoke-direct {v6, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v5, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_3d} :catch_42
    .catchall {:try_start_29 .. :try_end_3d} :catchall_3f

    .line 681
    :cond_3d
    :goto_3d
    :try_start_3d
    monitor-exit v1

    goto :goto_6

    .end local v3    # "ref":Ljava/lang/ref/WeakReference;
    :catchall_3f
    move-exception v5

    monitor-exit v1
    :try_end_41
    .catchall {:try_start_3d .. :try_end_41} :catchall_3f

    throw v5

    .line 677
    .restart local v3    # "ref":Ljava/lang/ref/WeakReference;
    :catch_42
    move-exception v2

    .line 678
    .local v2, "e":Ljava/lang/Exception;
    :try_start_43
    sget-object v5, Lfreemarker/ext/dom/NodeModel;->logger:Lfreemarker/log/Logger;

    const-string v6, "Error instantiating xpathSupport class"

    invoke-virtual {v5, v6, v2}, Lfreemarker/log/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4a
    .catchall {:try_start_43 .. :try_end_4a} :catchall_3f

    goto :goto_3d
.end method

.method public final hashCode()I
    .registers 2

    .prologue
    .line 394
    iget-object v0, p0, Lfreemarker/ext/dom/NodeModel;->node:Lorg/w3c/dom/Node;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public final size()I
    .registers 2

    .prologue
    .line 373
    const/4 v0, 0x1

    return v0
.end method
