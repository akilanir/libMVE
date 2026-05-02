.class public Lnl/siegmann/epublib/epub/NCXDocument;
.super Ljava/lang/Object;
.source "NCXDocument.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/siegmann/epublib/epub/NCXDocument$NCXAttributeValues;,
        Lnl/siegmann/epublib/epub/NCXDocument$NCXAttributes;,
        Lnl/siegmann/epublib/epub/NCXDocument$NCXTags;
    }
.end annotation


# static fields
.field public static final DEFAULT_NCX_HREF:Ljava/lang/String; = "toc.ncx"

.field public static final NAMESPACE_NCX:Ljava/lang/String; = "http://www.daisy.org/z3986/2005/ncx/"

.field public static final NCX_ITEM_ID:Ljava/lang/String; = "ncx"

.field public static final PREFIX_DTB:Ljava/lang/String; = "dtb"

.field public static final PREFIX_NCX:Ljava/lang/String; = "ncx"

.field private static final log:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    const-class v0, Lnl/siegmann/epublib/epub/NCXDocument;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lnl/siegmann/epublib/epub/NCXDocument;->log:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    return-void
.end method

.method public static createNCXResource(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Lnl/siegmann/epublib/domain/TableOfContents;)Lnl/siegmann/epublib/domain/Resource;
    .registers 11
    .param p1, "title"    # Ljava/lang/String;
    .param p3, "tableOfContents"    # Lnl/siegmann/epublib/domain/TableOfContents;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Identifier;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Author;",
            ">;",
            "Lnl/siegmann/epublib/domain/TableOfContents;",
            ")",
            "Lnl/siegmann/epublib/domain/Resource;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 180
    .local p0, "identifiers":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Identifier;>;"
    .local p2, "authors":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Author;>;"
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 181
    .local v0, "data":Ljava/io/ByteArrayOutputStream;
    invoke-static {v0}, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->createXmlSerializer(Ljava/io/OutputStream;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v1

    .line 182
    .local v1, "out":Lorg/xmlpull/v1/XmlSerializer;
    invoke-static {v1, p0, p1, p2, p3}, Lnl/siegmann/epublib/epub/NCXDocument;->write(Lorg/xmlpull/v1/XmlSerializer;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Lnl/siegmann/epublib/domain/TableOfContents;)V

    .line 183
    new-instance v2, Lnl/siegmann/epublib/domain/Resource;

    const-string v3, "ncx"

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    const-string v5, "toc.ncx"

    sget-object v6, Lnl/siegmann/epublib/service/MediatypeService;->NCX:Lnl/siegmann/epublib/domain/MediaType;

    invoke-direct {v2, v3, v4, v5, v6}, Lnl/siegmann/epublib/domain/Resource;-><init>(Ljava/lang/String;[BLjava/lang/String;Lnl/siegmann/epublib/domain/MediaType;)V

    .line 184
    .local v2, "resource":Lnl/siegmann/epublib/domain/Resource;
    return-object v2
.end method

.method public static createNCXResource(Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Resource;
    .registers 5
    .param p0, "book"    # Lnl/siegmann/epublib/domain/Book;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 177
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v0

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Metadata;->getIdentifiers()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v2

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Metadata;->getAuthors()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getTableOfContents()Lnl/siegmann/epublib/domain/TableOfContents;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lnl/siegmann/epublib/epub/NCXDocument;->createNCXResource(Ljava/util/List;Ljava/lang/String;Ljava/util/List;Lnl/siegmann/epublib/domain/TableOfContents;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    return-object v0
.end method

.method public static read(Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/epub/EpubReader;)Lnl/siegmann/epublib/domain/Resource;
    .registers 11
    .param p0, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p1, "epubReader"    # Lnl/siegmann/epublib/epub/EpubReader;

    .prologue
    .line 80
    const/4 v3, 0x0

    .line 81
    .local v3, "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v6

    invoke-virtual {v6}, Lnl/siegmann/epublib/domain/Spine;->getTocResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v6

    if-nez v6, :cond_14

    .line 82
    sget-object v6, Lnl/siegmann/epublib/epub/NCXDocument;->log:Lorg/slf4j/Logger;

    const-string v7, "Book does not contain a table of contents file"

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    move-object v4, v3

    .line 97
    .end local v3    # "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    .local v4, "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    :goto_13
    return-object v4

    .line 86
    .end local v4    # "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    .restart local v3    # "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    :cond_14
    :try_start_14
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v6

    invoke-virtual {v6}, Lnl/siegmann/epublib/domain/Spine;->getTocResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v3

    .line 87
    if-nez v3, :cond_20

    move-object v4, v3

    .line 88
    .end local v3    # "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    .restart local v4    # "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    goto :goto_13

    .line 90
    .end local v4    # "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    .restart local v3    # "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    :cond_20
    invoke-static {v3}, Lnl/siegmann/epublib/util/ResourceUtil;->getAsDocument(Lnl/siegmann/epublib/domain/Resource;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 91
    .local v2, "ncxDocument":Lorg/w3c/dom/Document;
    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v6

    const-string v7, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v8, "navMap"

    invoke-static {v6, v7, v8}, Lnl/siegmann/epublib/epub/DOMUtil;->getFirstElementByTagNameNS(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 92
    .local v1, "navMapElement":Lorg/w3c/dom/Element;
    new-instance v5, Lnl/siegmann/epublib/domain/TableOfContents;

    invoke-interface {v1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-static {v6, p0}, Lnl/siegmann/epublib/epub/NCXDocument;->readTOCReferences(Lorg/w3c/dom/NodeList;Lnl/siegmann/epublib/domain/Book;)Ljava/util/List;

    move-result-object v6

    invoke-direct {v5, v6}, Lnl/siegmann/epublib/domain/TableOfContents;-><init>(Ljava/util/List;)V

    .line 93
    .local v5, "tableOfContents":Lnl/siegmann/epublib/domain/TableOfContents;
    invoke-virtual {p0, v5}, Lnl/siegmann/epublib/domain/Book;->setTableOfContents(Lnl/siegmann/epublib/domain/TableOfContents;)V
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_40} :catch_42

    .end local v1    # "navMapElement":Lorg/w3c/dom/Element;
    .end local v2    # "ncxDocument":Lorg/w3c/dom/Document;
    .end local v5    # "tableOfContents":Lnl/siegmann/epublib/domain/TableOfContents;
    :goto_40
    move-object v4, v3

    .line 97
    .end local v3    # "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    .restart local v4    # "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    goto :goto_13

    .line 94
    .end local v4    # "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    .restart local v3    # "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    :catch_42
    move-exception v0

    .line 95
    .local v0, "e":Ljava/lang/Exception;
    sget-object v6, Lnl/siegmann/epublib/epub/NCXDocument;->log:Lorg/slf4j/Logger;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_40
.end method

.method private static readNavLabel(Lorg/w3c/dom/Element;)Ljava/lang/String;
    .registers 4
    .param p0, "navpointElement"    # Lorg/w3c/dom/Element;

    .prologue
    .line 147
    const-string v1, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v2, "navLabel"

    invoke-static {p0, v1, v2}, Lnl/siegmann/epublib/epub/DOMUtil;->getFirstElementByTagNameNS(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 148
    .local v0, "navLabel":Lorg/w3c/dom/Element;
    const-string v1, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v2, "text"

    invoke-static {v0, v1, v2}, Lnl/siegmann/epublib/epub/DOMUtil;->getFirstElementByTagNameNS(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    invoke-static {v1}, Lnl/siegmann/epublib/epub/DOMUtil;->getTextChildrenContent(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static readNavReference(Lorg/w3c/dom/Element;)Ljava/lang/String;
    .registers 6
    .param p0, "navpointElement"    # Lorg/w3c/dom/Element;

    .prologue
    .line 136
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "content"

    invoke-static {p0, v3, v4}, Lnl/siegmann/epublib/epub/DOMUtil;->getFirstElementByTagNameNS(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 137
    .local v0, "contentElement":Lorg/w3c/dom/Element;
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "src"

    invoke-static {v0, v3, v4}, Lnl/siegmann/epublib/epub/DOMUtil;->getAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 139
    .local v2, "result":Ljava/lang/String;
    :try_start_10
    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_15
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_10 .. :try_end_15} :catch_17

    move-result-object v2

    .line 143
    :goto_16
    return-object v2

    .line 140
    :catch_17
    move-exception v1

    .line 141
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    sget-object v3, Lnl/siegmann/epublib/epub/NCXDocument;->log:Lorg/slf4j/Logger;

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_16
.end method

.method private static readTOCReference(Lorg/w3c/dom/Element;Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/TOCReference;
    .registers 11
    .param p0, "navpointElement"    # Lorg/w3c/dom/Element;
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;

    .prologue
    const/16 v6, 0x23

    .line 120
    invoke-static {p0}, Lnl/siegmann/epublib/epub/NCXDocument;->readNavLabel(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v2

    .line 121
    .local v2, "label":Ljava/lang/String;
    invoke-static {p0}, Lnl/siegmann/epublib/epub/NCXDocument;->readNavReference(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v3

    .line 122
    .local v3, "reference":Ljava/lang/String;
    invoke-static {v3, v6}, Lnl/siegmann/epublib/util/StringUtil;->substringBefore(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v1

    .line 123
    .local v1, "href":Ljava/lang/String;
    invoke-static {v3, v6}, Lnl/siegmann/epublib/util/StringUtil;->substringAfter(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v0

    .line 124
    .local v0, "fragmentId":Ljava/lang/String;
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getResources()Lnl/siegmann/epublib/domain/Resources;

    move-result-object v6

    invoke-virtual {v6, v1}, Lnl/siegmann/epublib/domain/Resources;->getByHref(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v4

    .line 125
    .local v4, "resource":Lnl/siegmann/epublib/domain/Resource;
    if-nez v4, :cond_3a

    .line 126
    sget-object v6, Lnl/siegmann/epublib/epub/NCXDocument;->log:Lorg/slf4j/Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Resource with href "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " in NCX document not found"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 128
    :cond_3a
    new-instance v5, Lnl/siegmann/epublib/domain/TOCReference;

    invoke-direct {v5, v2, v4, v0}, Lnl/siegmann/epublib/domain/TOCReference;-><init>(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;)V

    .line 129
    .local v5, "result":Lnl/siegmann/epublib/domain/TOCReference;
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-static {v6, p1}, Lnl/siegmann/epublib/epub/NCXDocument;->readTOCReferences(Lorg/w3c/dom/NodeList;Lnl/siegmann/epublib/domain/Book;)Ljava/util/List;

    .line 130
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-static {v6, p1}, Lnl/siegmann/epublib/epub/NCXDocument;->readTOCReferences(Lorg/w3c/dom/NodeList;Lnl/siegmann/epublib/domain/Book;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5, v6}, Lnl/siegmann/epublib/domain/TOCReference;->setChildren(Ljava/util/List;)V

    .line 131
    return-object v5
.end method

.method private static readTOCReferences(Lorg/w3c/dom/NodeList;Lnl/siegmann/epublib/domain/Book;)Ljava/util/List;
    .registers 8
    .param p0, "navpoints"    # Lorg/w3c/dom/NodeList;
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/NodeList;",
            "Lnl/siegmann/epublib/domain/Book;",
            ")",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;"
        }
    .end annotation

    .prologue
    .line 101
    if-nez p0, :cond_8

    .line 102
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 116
    :cond_7
    return-object v2

    .line 104
    :cond_8
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 105
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/TOCReference;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    invoke-interface {p0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-ge v0, v4, :cond_7

    .line 106
    invoke-interface {p0, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 107
    .local v1, "node":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_26

    .line 105
    .end local v1    # "node":Lorg/w3c/dom/Node;
    :cond_23
    :goto_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 110
    .restart local v1    # "node":Lorg/w3c/dom/Node;
    :cond_26
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "navPoint"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_23

    .line 113
    check-cast v1, Lorg/w3c/dom/Element;

    .end local v1    # "node":Lorg/w3c/dom/Node;
    invoke-static {v1, p1}, Lnl/siegmann/epublib/epub/NCXDocument;->readTOCReference(Lorg/w3c/dom/Element;Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/TOCReference;

    move-result-object v3

    .line 114
    .local v3, "tocReference":Lnl/siegmann/epublib/domain/TOCReference;
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_23
.end method

.method public static write(Lnl/siegmann/epublib/epub/EpubWriter;Lnl/siegmann/epublib/domain/Book;Ljava/util/zip/ZipOutputStream;)V
    .registers 6
    .param p0, "epubWriter"    # Lnl/siegmann/epublib/epub/EpubWriter;
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p2, "resultStream"    # Ljava/util/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    new-instance v1, Ljava/util/zip/ZipEntry;

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v2

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Spine;->getTocResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v2

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 154
    invoke-static {p2}, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->createXmlSerializer(Ljava/io/OutputStream;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v0

    .line 155
    .local v0, "out":Lorg/xmlpull/v1/XmlSerializer;
    invoke-static {v0, p1}, Lnl/siegmann/epublib/epub/NCXDocument;->write(Lorg/xmlpull/v1/XmlSerializer;Lnl/siegmann/epublib/domain/Book;)V

    .line 156
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlSerializer;->flush()V

    .line 157
    return-void
.end method

.method public static write(Lorg/xmlpull/v1/XmlSerializer;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Lnl/siegmann/epublib/domain/TableOfContents;)V
    .registers 11
    .param p0, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .param p2, "title"    # Ljava/lang/String;
    .param p4, "tableOfContents"    # Lnl/siegmann/epublib/domain/TableOfContents;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlSerializer;",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Identifier;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/Author;",
            ">;",
            "Lnl/siegmann/epublib/domain/TableOfContents;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    .local p1, "identifiers":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Identifier;>;"
    .local p3, "authors":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/Author;>;"
    const-string v3, "UTF-8"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 189
    const-string v3, ""

    const-string v4, "http://www.daisy.org/z3986/2005/ncx/"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "ncx"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 193
    const-string v3, ""

    const-string v4, "version"

    const-string v5, "2005-1"

    invoke-interface {p0, v3, v4, v5}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 194
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "head"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 196
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_2c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_44

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnl/siegmann/epublib/domain/Identifier;

    .line 197
    .local v2, "identifier":Lnl/siegmann/epublib/domain/Identifier;
    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Identifier;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Identifier;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, p0}, Lnl/siegmann/epublib/epub/NCXDocument;->writeMetaElement(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlSerializer;)V

    goto :goto_2c

    .line 200
    .end local v2    # "identifier":Lnl/siegmann/epublib/domain/Identifier;
    :cond_44
    const-string v3, "generator"

    const-string v4, "EPUBLib version 3.0"

    invoke-static {v3, v4, p0}, Lnl/siegmann/epublib/epub/NCXDocument;->writeMetaElement(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 201
    const-string v3, "depth"

    invoke-virtual {p4}, Lnl/siegmann/epublib/domain/TableOfContents;->calculateDepth()I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, p0}, Lnl/siegmann/epublib/epub/NCXDocument;->writeMetaElement(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 202
    const-string v3, "totalPageCount"

    const-string v4, "0"

    invoke-static {v3, v4, p0}, Lnl/siegmann/epublib/epub/NCXDocument;->writeMetaElement(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 203
    const-string v3, "maxPageNumber"

    const-string v4, "0"

    invoke-static {v3, v4, p0}, Lnl/siegmann/epublib/epub/NCXDocument;->writeMetaElement(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlSerializer;)V

    .line 205
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "head"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 207
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "docTitle"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 208
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "text"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 210
    invoke-static {p2}, Lnl/siegmann/epublib/util/StringUtil;->defaultIfNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v3}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 211
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "text"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 212
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "docTitle"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 214
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_94
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_df

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/Author;

    .line 215
    .local v0, "author":Lnl/siegmann/epublib/domain/Author;
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "docAuthor"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 216
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "text"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 217
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Author;->getLastname()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Author;->getFirstname()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v3}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 218
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "text"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 219
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "docAuthor"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    goto :goto_94

    .line 222
    .end local v0    # "author":Lnl/siegmann/epublib/domain/Author;
    :cond_df
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "navMap"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 223
    invoke-virtual {p4}, Lnl/siegmann/epublib/domain/TableOfContents;->getTocReferences()Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v3, v4, p0}, Lnl/siegmann/epublib/epub/NCXDocument;->writeNavPoints(Ljava/util/List;ILorg/xmlpull/v1/XmlSerializer;)I

    .line 224
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "navMap"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 226
    const-string v3, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v4, "ncx"

    invoke-interface {p0, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 227
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    .line 228
    return-void
.end method

.method public static write(Lorg/xmlpull/v1/XmlSerializer;Lnl/siegmann/epublib/domain/Book;)V
    .registers 6
    .param p0, "xmlSerializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 173
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v0

    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Metadata;->getIdentifiers()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getMetadata()Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v2

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Metadata;->getAuthors()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getTableOfContents()Lnl/siegmann/epublib/domain/TableOfContents;

    move-result-object v3

    invoke-static {p0, v0, v1, v2, v3}, Lnl/siegmann/epublib/epub/NCXDocument;->write(Lorg/xmlpull/v1/XmlSerializer;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Lnl/siegmann/epublib/domain/TableOfContents;)V

    .line 174
    return-void
.end method

.method private static writeMetaElement(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 7
    .param p0, "dtbName"    # Ljava/lang/String;
    .param p1, "content"    # Ljava/lang/String;
    .param p2, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    const-string v0, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v1, "meta"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 233
    const-string v0, ""

    const-string v1, "name"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dtb:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 234
    const-string v0, ""

    const-string v1, "content"

    invoke-interface {p2, v0, v1, p1}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 235
    const-string v0, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v1, "meta"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 236
    return-void
.end method

.method private static writeNavPointEnd(Lnl/siegmann/epublib/domain/TOCReference;Lorg/xmlpull/v1/XmlSerializer;)V
    .registers 4
    .param p0, "tocReference"    # Lnl/siegmann/epublib/domain/TOCReference;
    .param p1, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 272
    const-string v0, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v1, "navPoint"

    invoke-interface {p1, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 273
    return-void
.end method

.method private static writeNavPointStart(Lnl/siegmann/epublib/domain/TOCReference;ILorg/xmlpull/v1/XmlSerializer;)V
    .registers 7
    .param p0, "tocReference"    # Lnl/siegmann/epublib/domain/TOCReference;
    .param p1, "playOrder"    # I
    .param p2, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 257
    const-string v0, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v1, "navPoint"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 258
    const-string v0, ""

    const-string v1, "id"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "navPoint-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 259
    const-string v0, ""

    const-string v1, "playOrder"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 260
    const-string v0, ""

    const-string v1, "class"

    const-string v2, "chapter"

    invoke-interface {p2, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 261
    const-string v0, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v1, "navLabel"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 262
    const-string v0, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v1, "text"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 263
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/TOCReference;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 264
    const-string v0, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v1, "text"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 265
    const-string v0, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v1, "navLabel"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 266
    const-string v0, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v1, "content"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 267
    const-string v0, ""

    const-string v1, "src"

    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/TOCReference;->getCompleteHref()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v0, v1, v2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 268
    const-string v0, "http://www.daisy.org/z3986/2005/ncx/"

    const-string v1, "content"

    invoke-interface {p2, v0, v1}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    .line 269
    return-void
.end method

.method private static writeNavPoints(Ljava/util/List;ILorg/xmlpull/v1/XmlSerializer;)I
    .registers 6
    .param p1, "playOrder"    # I
    .param p2, "serializer"    # Lorg/xmlpull/v1/XmlSerializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/TOCReference;",
            ">;I",
            "Lorg/xmlpull/v1/XmlSerializer;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 240
    .local p0, "tocReferences":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/TOCReference;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/domain/TOCReference;

    .line 241
    .local v1, "tocReference":Lnl/siegmann/epublib/domain/TOCReference;
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/TOCReference;->getResource()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v2

    if-nez v2, :cond_1f

    .line 242
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/TOCReference;->getChildren()Ljava/util/List;

    move-result-object v2

    invoke-static {v2, p1, p2}, Lnl/siegmann/epublib/epub/NCXDocument;->writeNavPoints(Ljava/util/List;ILorg/xmlpull/v1/XmlSerializer;)I

    move-result p1

    .line 243
    goto :goto_4

    .line 245
    :cond_1f
    invoke-static {v1, p1, p2}, Lnl/siegmann/epublib/epub/NCXDocument;->writeNavPointStart(Lnl/siegmann/epublib/domain/TOCReference;ILorg/xmlpull/v1/XmlSerializer;)V

    .line 246
    add-int/lit8 p1, p1, 0x1

    .line 247
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/TOCReference;->getChildren()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_36

    .line 248
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/TOCReference;->getChildren()Ljava/util/List;

    move-result-object v2

    invoke-static {v2, p1, p2}, Lnl/siegmann/epublib/epub/NCXDocument;->writeNavPoints(Ljava/util/List;ILorg/xmlpull/v1/XmlSerializer;)I

    move-result p1

    .line 250
    :cond_36
    invoke-static {v1, p2}, Lnl/siegmann/epublib/epub/NCXDocument;->writeNavPointEnd(Lnl/siegmann/epublib/domain/TOCReference;Lorg/xmlpull/v1/XmlSerializer;)V

    goto :goto_4

    .line 252
    .end local v1    # "tocReference":Lnl/siegmann/epublib/domain/TOCReference;
    :cond_3a
    return p1
.end method
