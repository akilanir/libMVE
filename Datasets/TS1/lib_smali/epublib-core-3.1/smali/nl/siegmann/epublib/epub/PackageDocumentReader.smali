.class public Lnl/siegmann/epublib/epub/PackageDocumentReader;
.super Lnl/siegmann/epublib/epub/PackageDocumentBase;
.source "PackageDocumentReader.java"


# static fields
.field private static final POSSIBLE_NCX_ITEM_IDS:[Ljava/lang/String;

.field private static final log:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 45
    const-class v0, Lnl/siegmann/epublib/epub/PackageDocumentReader;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lnl/siegmann/epublib/epub/PackageDocumentReader;->log:Lorg/slf4j/Logger;

    .line 46
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "toc"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "ncx"

    aput-object v2, v0, v1

    sput-object v0, Lnl/siegmann/epublib/epub/PackageDocumentReader;->POSSIBLE_NCX_ITEM_IDS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Lnl/siegmann/epublib/epub/PackageDocumentBase;-><init>()V

    return-void
.end method

.method static findCoverHrefs(Lorg/w3c/dom/Document;)Ljava/util/Set;
    .registers 14
    .param p0, "packageDocument"    # Lorg/w3c/dom/Document;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Document;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 322
    new-instance v12, Ljava/util/HashSet;

    invoke-direct {v12}, Ljava/util/HashSet;-><init>()V

    .line 325
    .local v12, "result":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v1, "http://www.idpf.org/2007/opf"

    const-string v2, "meta"

    const-string v3, "name"

    const-string v4, "cover"

    const-string v5, "content"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lnl/siegmann/epublib/epub/DOMUtil;->getFindAttributeValue(Lorg/w3c/dom/Document;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 329
    .local v4, "coverResourceId":Ljava/lang/String;
    invoke-static {v4}, Lnl/siegmann/epublib/util/StringUtil;->isNotBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_30

    .line 330
    const-string v1, "http://www.idpf.org/2007/opf"

    const-string v2, "item"

    const-string v3, "id"

    const-string v5, "href"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lnl/siegmann/epublib/epub/DOMUtil;->getFindAttributeValue(Lorg/w3c/dom/Document;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 333
    .local v11, "coverHref":Ljava/lang/String;
    invoke-static {v11}, Lnl/siegmann/epublib/util/StringUtil;->isNotBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_49

    .line 334
    invoke-interface {v12, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 340
    .end local v11    # "coverHref":Ljava/lang/String;
    :cond_30
    :goto_30
    const-string v6, "http://www.idpf.org/2007/opf"

    const-string v7, "reference"

    const-string v8, "type"

    const-string v9, "cover"

    const-string v10, "href"

    move-object v5, p0

    invoke-static/range {v5 .. v10}, Lnl/siegmann/epublib/epub/DOMUtil;->getFindAttributeValue(Lorg/w3c/dom/Document;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 343
    .restart local v11    # "coverHref":Ljava/lang/String;
    invoke-static {v11}, Lnl/siegmann/epublib/util/StringUtil;->isNotBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_48

    .line 344
    invoke-interface {v12, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 346
    :cond_48
    return-object v12

    .line 336
    :cond_49
    invoke-interface {v12, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_30
.end method

.method private static findTableOfContentsResource(Lorg/w3c/dom/Element;Lnl/siegmann/epublib/domain/Resources;)Lnl/siegmann/epublib/domain/Resource;
    .registers 9
    .param p0, "spineElement"    # Lorg/w3c/dom/Element;
    .param p1, "resources"    # Lnl/siegmann/epublib/domain/Resources;

    .prologue
    .line 281
    const-string v4, "http://www.idpf.org/2007/opf"

    const-string v5, "toc"

    invoke-static {p0, v4, v5}, Lnl/siegmann/epublib/epub/DOMUtil;->getAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 282
    .local v3, "tocResourceId":Ljava/lang/String;
    const/4 v1, 0x0

    .line 283
    .local v1, "tocResource":Lnl/siegmann/epublib/domain/Resource;
    invoke-static {v3}, Lnl/siegmann/epublib/util/StringUtil;->isNotBlank(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 284
    invoke-virtual {p1, v3}, Lnl/siegmann/epublib/domain/Resources;->getByIdOrHref(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    .line 287
    :cond_13
    if-eqz v1, :cond_17

    move-object v2, v1

    .line 308
    .end local v1    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    .local v2, "tocResource":Lnl/siegmann/epublib/domain/Resource;
    :goto_16
    return-object v2

    .line 291
    .end local v2    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    .restart local v1    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    :cond_17
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_18
    sget-object v4, Lnl/siegmann/epublib/epub/PackageDocumentReader;->POSSIBLE_NCX_ITEM_IDS:[Ljava/lang/String;

    array-length v4, v4

    if-ge v0, v4, :cond_3c

    .line 292
    sget-object v4, Lnl/siegmann/epublib/epub/PackageDocumentReader;->POSSIBLE_NCX_ITEM_IDS:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-virtual {p1, v4}, Lnl/siegmann/epublib/domain/Resources;->getByIdOrHref(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    .line 293
    if-eqz v1, :cond_29

    move-object v2, v1

    .line 294
    .end local v1    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    .restart local v2    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    goto :goto_16

    .line 296
    .end local v2    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    .restart local v1    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    :cond_29
    sget-object v4, Lnl/siegmann/epublib/epub/PackageDocumentReader;->POSSIBLE_NCX_ITEM_IDS:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lnl/siegmann/epublib/domain/Resources;->getByIdOrHref(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    .line 297
    if-eqz v1, :cond_39

    move-object v2, v1

    .line 298
    .end local v1    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    .restart local v2    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    goto :goto_16

    .line 291
    .end local v2    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    .restart local v1    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    :cond_39
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    .line 303
    :cond_3c
    sget-object v4, Lnl/siegmann/epublib/service/MediatypeService;->NCX:Lnl/siegmann/epublib/domain/MediaType;

    invoke-virtual {p1, v4}, Lnl/siegmann/epublib/domain/Resources;->findFirstResourceByMediaType(Lnl/siegmann/epublib/domain/MediaType;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    .line 305
    if-nez v1, :cond_7e

    .line 306
    sget-object v4, Lnl/siegmann/epublib/epub/PackageDocumentReader;->log:Lorg/slf4j/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not find table of contents resource. Tried resource with id \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\', "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "toc"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "toc"

    invoke-virtual {v6}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " and any NCX resource."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    :cond_7e
    move-object v2, v1

    .line 308
    .end local v1    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    .restart local v2    # "tocResource":Lnl/siegmann/epublib/domain/Resource;
    goto :goto_16
.end method

.method private static fixHrefs(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resources;)Lnl/siegmann/epublib/domain/Resources;
    .registers 8
    .param p0, "packageHref"    # Ljava/lang/String;
    .param p1, "resourcesByHref"    # Lnl/siegmann/epublib/domain/Resources;

    .prologue
    .line 184
    const/16 v4, 0x2f

    invoke-virtual {p0, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 185
    .local v1, "lastSlashPos":I
    if-gez v1, :cond_9

    .line 196
    .end local p1    # "resourcesByHref":Lnl/siegmann/epublib/domain/Resources;
    :goto_8
    return-object p1

    .line 188
    .restart local p1    # "resourcesByHref":Lnl/siegmann/epublib/domain/Resources;
    :cond_9
    new-instance v3, Lnl/siegmann/epublib/domain/Resources;

    invoke-direct {v3}, Lnl/siegmann/epublib/domain/Resources;-><init>()V

    .line 189
    .local v3, "result":Lnl/siegmann/epublib/domain/Resources;
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Resources;->getAll()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_47

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnl/siegmann/epublib/domain/Resource;

    .line 190
    .local v2, "resource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lnl/siegmann/epublib/util/StringUtil;->isNotBlank(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_36

    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v1, :cond_43

    .line 192
    :cond_36
    invoke-virtual {v2}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v5, v1, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lnl/siegmann/epublib/domain/Resource;->setHref(Ljava/lang/String;)V

    .line 194
    :cond_43
    invoke-virtual {v3, v2}, Lnl/siegmann/epublib/domain/Resources;->add(Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/Resource;

    goto :goto_16

    .end local v2    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :cond_47
    move-object p1, v3

    .line 196
    goto :goto_8
.end method

.method private static generateSpineFromResources(Lnl/siegmann/epublib/domain/Resources;)Lnl/siegmann/epublib/domain/Spine;
    .registers 8
    .param p0, "resources"    # Lnl/siegmann/epublib/domain/Resources;

    .prologue
    .line 254
    new-instance v4, Lnl/siegmann/epublib/domain/Spine;

    invoke-direct {v4}, Lnl/siegmann/epublib/domain/Spine;-><init>()V

    .line 255
    .local v4, "result":Lnl/siegmann/epublib/domain/Spine;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 256
    .local v3, "resourceHrefs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Resources;->getAllHrefs()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 257
    sget-object v5, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-static {v3, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 258
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1a
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_47

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 259
    .local v2, "resourceHref":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lnl/siegmann/epublib/domain/Resources;->getByHref(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    .line 260
    .local v1, "resource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v5

    sget-object v6, Lnl/siegmann/epublib/service/MediatypeService;->NCX:Lnl/siegmann/epublib/domain/MediaType;

    if-ne v5, v6, :cond_36

    .line 261
    invoke-virtual {v4, v1}, Lnl/siegmann/epublib/domain/Spine;->setTocResource(Lnl/siegmann/epublib/domain/Resource;)V

    goto :goto_1a

    .line 262
    :cond_36
    invoke-virtual {v1}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v5

    sget-object v6, Lnl/siegmann/epublib/service/MediatypeService;->XHTML:Lnl/siegmann/epublib/domain/MediaType;

    if-ne v5, v6, :cond_1a

    .line 263
    new-instance v5, Lnl/siegmann/epublib/domain/SpineReference;

    invoke-direct {v5, v1}, Lnl/siegmann/epublib/domain/SpineReference;-><init>(Lnl/siegmann/epublib/domain/Resource;)V

    invoke-virtual {v4, v5}, Lnl/siegmann/epublib/domain/Spine;->addSpineReference(Lnl/siegmann/epublib/domain/SpineReference;)Lnl/siegmann/epublib/domain/SpineReference;

    goto :goto_1a

    .line 266
    .end local v1    # "resource":Lnl/siegmann/epublib/domain/Resource;
    .end local v2    # "resourceHref":Ljava/lang/String;
    :cond_47
    return-object v4
.end method

.method public static read(Lnl/siegmann/epublib/domain/Resource;Lnl/siegmann/epublib/epub/EpubReader;Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/domain/Resources;)V
    .registers 9
    .param p0, "packageResource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p1, "epubReader"    # Lnl/siegmann/epublib/epub/EpubReader;
    .param p2, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p3, "resources"    # Lnl/siegmann/epublib/domain/Resources;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Ljavax/xml/parsers/ParserConfigurationException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-static {p0}, Lnl/siegmann/epublib/util/ResourceUtil;->getAsDocument(Lnl/siegmann/epublib/domain/Resource;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 51
    .local v1, "packageDocument":Lorg/w3c/dom/Document;
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Resource;->getHref()Ljava/lang/String;

    move-result-object v2

    .line 52
    .local v2, "packageHref":Ljava/lang/String;
    invoke-static {v2, p3}, Lnl/siegmann/epublib/epub/PackageDocumentReader;->fixHrefs(Ljava/lang/String;Lnl/siegmann/epublib/domain/Resources;)Lnl/siegmann/epublib/domain/Resources;

    move-result-object p3

    .line 53
    invoke-static {v1, p1, p2, p3}, Lnl/siegmann/epublib/epub/PackageDocumentReader;->readGuide(Lorg/w3c/dom/Document;Lnl/siegmann/epublib/epub/EpubReader;Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/domain/Resources;)V

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 58
    .local v0, "idMapping":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {v1, v2, p1, p3, v0}, Lnl/siegmann/epublib/epub/PackageDocumentReader;->readManifest(Lorg/w3c/dom/Document;Ljava/lang/String;Lnl/siegmann/epublib/epub/EpubReader;Lnl/siegmann/epublib/domain/Resources;Ljava/util/Map;)Lnl/siegmann/epublib/domain/Resources;

    move-result-object p3

    .line 59
    invoke-virtual {p2, p3}, Lnl/siegmann/epublib/domain/Book;->setResources(Lnl/siegmann/epublib/domain/Resources;)V

    .line 60
    invoke-static {v1, p2}, Lnl/siegmann/epublib/epub/PackageDocumentReader;->readCover(Lorg/w3c/dom/Document;Lnl/siegmann/epublib/domain/Book;)V

    .line 61
    invoke-virtual {p2}, Lnl/siegmann/epublib/domain/Book;->getResources()Lnl/siegmann/epublib/domain/Resources;

    move-result-object v3

    invoke-static {v1, v3}, Lnl/siegmann/epublib/epub/PackageDocumentMetadataReader;->readMetadata(Lorg/w3c/dom/Document;Lnl/siegmann/epublib/domain/Resources;)Lnl/siegmann/epublib/domain/Metadata;

    move-result-object v3

    invoke-virtual {p2, v3}, Lnl/siegmann/epublib/domain/Book;->setMetadata(Lnl/siegmann/epublib/domain/Metadata;)V

    .line 62
    invoke-virtual {p2}, Lnl/siegmann/epublib/domain/Book;->getResources()Lnl/siegmann/epublib/domain/Resources;

    move-result-object v3

    invoke-static {v1, p1, v3, v0}, Lnl/siegmann/epublib/epub/PackageDocumentReader;->readSpine(Lorg/w3c/dom/Document;Lnl/siegmann/epublib/epub/EpubReader;Lnl/siegmann/epublib/domain/Resources;Ljava/util/Map;)Lnl/siegmann/epublib/domain/Spine;

    move-result-object v3

    invoke-virtual {p2, v3}, Lnl/siegmann/epublib/domain/Book;->setSpine(Lnl/siegmann/epublib/domain/Spine;)V

    .line 65
    invoke-virtual {p2}, Lnl/siegmann/epublib/domain/Book;->getCoverPage()Lnl/siegmann/epublib/domain/Resource;

    move-result-object v3

    if-nez v3, :cond_50

    invoke-virtual {p2}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v3

    invoke-virtual {v3}, Lnl/siegmann/epublib/domain/Spine;->size()I

    move-result v3

    if-lez v3, :cond_50

    .line 66
    invoke-virtual {p2}, Lnl/siegmann/epublib/domain/Book;->getSpine()Lnl/siegmann/epublib/domain/Spine;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lnl/siegmann/epublib/domain/Spine;->getResource(I)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v3

    invoke-virtual {p2, v3}, Lnl/siegmann/epublib/domain/Book;->setCoverPage(Lnl/siegmann/epublib/domain/Resource;)V

    .line 68
    :cond_50
    return-void
.end method

.method private static readCover(Lorg/w3c/dom/Document;Lnl/siegmann/epublib/domain/Book;)V
    .registers 9
    .param p0, "packageDocument"    # Lorg/w3c/dom/Document;
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;

    .prologue
    .line 359
    invoke-static {p0}, Lnl/siegmann/epublib/epub/PackageDocumentReader;->findCoverHrefs(Lorg/w3c/dom/Document;)Ljava/util/Set;

    move-result-object v1

    .line 360
    .local v1, "coverHrefs":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_57

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 361
    .local v0, "coverHref":Ljava/lang/String;
    invoke-virtual {p1}, Lnl/siegmann/epublib/domain/Book;->getResources()Lnl/siegmann/epublib/domain/Resources;

    move-result-object v4

    invoke-virtual {v4, v0}, Lnl/siegmann/epublib/domain/Resources;->getByHref(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v3

    .line 362
    .local v3, "resource":Lnl/siegmann/epublib/domain/Resource;
    if-nez v3, :cond_3d

    .line 363
    sget-object v4, Lnl/siegmann/epublib/epub/PackageDocumentReader;->log:Lorg/slf4j/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cover resource "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " not found"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_8

    .line 366
    :cond_3d
    invoke-virtual {v3}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v4

    sget-object v5, Lnl/siegmann/epublib/service/MediatypeService;->XHTML:Lnl/siegmann/epublib/domain/MediaType;

    if-ne v4, v5, :cond_49

    .line 367
    invoke-virtual {p1, v3}, Lnl/siegmann/epublib/domain/Book;->setCoverPage(Lnl/siegmann/epublib/domain/Resource;)V

    goto :goto_8

    .line 368
    :cond_49
    invoke-virtual {v3}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v4

    invoke-static {v4}, Lnl/siegmann/epublib/service/MediatypeService;->isBitmapImage(Lnl/siegmann/epublib/domain/MediaType;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 369
    invoke-virtual {p1, v3}, Lnl/siegmann/epublib/domain/Book;->setCoverImage(Lnl/siegmann/epublib/domain/Resource;)V

    goto :goto_8

    .line 372
    .end local v0    # "coverHref":Ljava/lang/String;
    .end local v3    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :cond_57
    return-void
.end method

.method private static readGuide(Lorg/w3c/dom/Document;Lnl/siegmann/epublib/epub/EpubReader;Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/domain/Resources;)V
    .registers 18
    .param p0, "packageDocument"    # Lorg/w3c/dom/Document;
    .param p1, "epubReader"    # Lnl/siegmann/epublib/epub/EpubReader;
    .param p2, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p3, "resources"    # Lnl/siegmann/epublib/domain/Resources;

    .prologue
    .line 140
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v11

    const-string v12, "http://www.idpf.org/2007/opf"

    const-string v13, "guide"

    invoke-static {v11, v12, v13}, Lnl/siegmann/epublib/epub/DOMUtil;->getFirstElementByTagNameNS(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 141
    .local v2, "guideElement":Lorg/w3c/dom/Element;
    if-nez v2, :cond_f

    .line 169
    :cond_e
    return-void

    .line 144
    :cond_f
    invoke-virtual/range {p2 .. p2}, Lnl/siegmann/epublib/domain/Book;->getGuide()Lnl/siegmann/epublib/domain/Guide;

    move-result-object v1

    .line 145
    .local v1, "guide":Lnl/siegmann/epublib/domain/Guide;
    const-string v11, "http://www.idpf.org/2007/opf"

    const-string v12, "reference"

    invoke-interface {v2, v11, v12}, Lorg/w3c/dom/Element;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 146
    .local v3, "guideReferences":Lorg/w3c/dom/NodeList;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1c
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v11

    if-ge v4, v11, :cond_e

    .line 147
    invoke-interface {v3, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    check-cast v6, Lorg/w3c/dom/Element;

    .line 148
    .local v6, "referenceElement":Lorg/w3c/dom/Element;
    const-string v11, "http://www.idpf.org/2007/opf"

    const-string v12, "href"

    invoke-static {v6, v11, v12}, Lnl/siegmann/epublib/epub/DOMUtil;->getAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 149
    .local v8, "resourceHref":Ljava/lang/String;
    invoke-static {v8}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_39

    .line 146
    :cond_36
    :goto_36
    add-int/lit8 v4, v4, 0x1

    goto :goto_1c

    .line 152
    :cond_39
    const/16 v11, 0x23

    invoke-static {v8, v11}, Lnl/siegmann/epublib/util/StringUtil;->substringBefore(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Lnl/siegmann/epublib/domain/Resources;->getByHref(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v7

    .line 153
    .local v7, "resource":Lnl/siegmann/epublib/domain/Resource;
    if-nez v7, :cond_66

    .line 154
    sget-object v11, Lnl/siegmann/epublib/epub/PackageDocumentReader;->log:Lorg/slf4j/Logger;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Guide is referencing resource with href "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " which could not be found"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_36

    .line 157
    :cond_66
    const-string v11, "http://www.idpf.org/2007/opf"

    const-string v12, "type"

    invoke-static {v6, v11, v12}, Lnl/siegmann/epublib/epub/DOMUtil;->getAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 158
    .local v10, "type":Ljava/lang/String;
    invoke-static {v10}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_93

    .line 159
    sget-object v11, Lnl/siegmann/epublib/epub/PackageDocumentReader;->log:Lorg/slf4j/Logger;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Guide is referencing resource with href "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " which is missing the \'type\' attribute"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_36

    .line 162
    :cond_93
    const-string v11, "http://www.idpf.org/2007/opf"

    const-string v12, "title"

    invoke-static {v6, v11, v12}, Lnl/siegmann/epublib/epub/DOMUtil;->getAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 163
    .local v9, "title":Ljava/lang/String;
    sget-object v11, Lnl/siegmann/epublib/domain/GuideReference;->COVER:Ljava/lang/String;

    invoke-virtual {v11, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_36

    .line 166
    new-instance v5, Lnl/siegmann/epublib/domain/GuideReference;

    const/16 v11, 0x23

    invoke-static {v8, v11}, Lnl/siegmann/epublib/util/StringUtil;->substringAfter(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v5, v7, v10, v9, v11}, Lnl/siegmann/epublib/domain/GuideReference;-><init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .local v5, "reference":Lnl/siegmann/epublib/domain/GuideReference;
    invoke-virtual {v1, v5}, Lnl/siegmann/epublib/domain/Guide;->addReference(Lnl/siegmann/epublib/domain/GuideReference;)Lnl/siegmann/epublib/domain/ResourceReference;

    goto :goto_36
.end method

.method private static readManifest(Lorg/w3c/dom/Document;Ljava/lang/String;Lnl/siegmann/epublib/epub/EpubReader;Lnl/siegmann/epublib/domain/Resources;Ljava/util/Map;)Lnl/siegmann/epublib/domain/Resources;
    .registers 20
    .param p0, "packageDocument"    # Lorg/w3c/dom/Document;
    .param p1, "packageHref"    # Ljava/lang/String;
    .param p2, "epubReader"    # Lnl/siegmann/epublib/epub/EpubReader;
    .param p3, "resources"    # Lnl/siegmann/epublib/domain/Resources;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Document;",
            "Ljava/lang/String;",
            "Lnl/siegmann/epublib/epub/EpubReader;",
            "Lnl/siegmann/epublib/domain/Resources;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lnl/siegmann/epublib/domain/Resources;"
        }
    .end annotation

    .prologue
    .line 93
    .local p4, "idMapping":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v12

    const-string v13, "http://www.idpf.org/2007/opf"

    const-string v14, "manifest"

    invoke-static {v12, v13, v14}, Lnl/siegmann/epublib/epub/DOMUtil;->getFirstElementByTagNameNS(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v7

    .line 94
    .local v7, "manifestElement":Lorg/w3c/dom/Element;
    new-instance v11, Lnl/siegmann/epublib/domain/Resources;

    invoke-direct {v11}, Lnl/siegmann/epublib/domain/Resources;-><init>()V

    .line 95
    .local v11, "result":Lnl/siegmann/epublib/domain/Resources;
    if-nez v7, :cond_1b

    .line 96
    sget-object v12, Lnl/siegmann/epublib/epub/PackageDocumentReader;->log:Lorg/slf4j/Logger;

    const-string v13, "Package document does not contain element manifest"

    invoke-interface {v12, v13}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 123
    :cond_1a
    return-object v11

    .line 99
    :cond_1b
    const-string v12, "http://www.idpf.org/2007/opf"

    const-string v13, "item"

    invoke-interface {v7, v12, v13}, Lorg/w3c/dom/Element;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v6

    .line 100
    .local v6, "itemElements":Lorg/w3c/dom/NodeList;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_24
    invoke-interface {v6}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v12

    if-ge v3, v12, :cond_1a

    .line 101
    invoke-interface {v6, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Element;

    .line 102
    .local v5, "itemElement":Lorg/w3c/dom/Element;
    const-string v12, "http://www.idpf.org/2007/opf"

    const-string v13, "id"

    invoke-static {v5, v12, v13}, Lnl/siegmann/epublib/epub/DOMUtil;->getAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 103
    .local v4, "id":Ljava/lang/String;
    const-string v12, "http://www.idpf.org/2007/opf"

    const-string v13, "href"

    invoke-static {v5, v12, v13}, Lnl/siegmann/epublib/epub/DOMUtil;->getAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 105
    .local v2, "href":Ljava/lang/String;
    :try_start_40
    const-string v12, "UTF-8"

    invoke-static {v2, v12}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_45
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_40 .. :try_end_45} :catch_77

    move-result-object v2

    .line 109
    :goto_46
    const-string v12, "http://www.idpf.org/2007/opf"

    const-string v13, "media-type"

    invoke-static {v5, v12, v13}, Lnl/siegmann/epublib/epub/DOMUtil;->getAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 110
    .local v9, "mediaTypeName":Ljava/lang/String;
    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Lnl/siegmann/epublib/domain/Resources;->remove(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v10

    .line 111
    .local v10, "resource":Lnl/siegmann/epublib/domain/Resource;
    if-nez v10, :cond_82

    .line 112
    sget-object v12, Lnl/siegmann/epublib/epub/PackageDocumentReader;->log:Lorg/slf4j/Logger;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "resource with href \'"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "\' not found"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 100
    :goto_74
    add-int/lit8 v3, v3, 0x1

    goto :goto_24

    .line 106
    .end local v9    # "mediaTypeName":Ljava/lang/String;
    .end local v10    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :catch_77
    move-exception v1

    .line 107
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    sget-object v12, Lnl/siegmann/epublib/epub/PackageDocumentReader;->log:Lorg/slf4j/Logger;

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_46

    .line 115
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v9    # "mediaTypeName":Ljava/lang/String;
    .restart local v10    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :cond_82
    invoke-virtual {v10, v4}, Lnl/siegmann/epublib/domain/Resource;->setId(Ljava/lang/String;)V

    .line 116
    invoke-static {v9}, Lnl/siegmann/epublib/service/MediatypeService;->getMediaTypeByName(Ljava/lang/String;)Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v8

    .line 117
    .local v8, "mediaType":Lnl/siegmann/epublib/domain/MediaType;
    if-eqz v8, :cond_8e

    .line 118
    invoke-virtual {v10, v8}, Lnl/siegmann/epublib/domain/Resource;->setMediaType(Lnl/siegmann/epublib/domain/MediaType;)V

    .line 120
    :cond_8e
    invoke-virtual {v11, v10}, Lnl/siegmann/epublib/domain/Resources;->add(Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/Resource;

    .line 121
    invoke-virtual {v10}, Lnl/siegmann/epublib/domain/Resource;->getId()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p4

    invoke-interface {v0, v4, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_74
.end method

.method private static readSpine(Lorg/w3c/dom/Document;Lnl/siegmann/epublib/epub/EpubReader;Lnl/siegmann/epublib/domain/Resources;Ljava/util/Map;)Lnl/siegmann/epublib/domain/Spine;
    .registers 18
    .param p0, "packageDocument"    # Lorg/w3c/dom/Document;
    .param p1, "epubReader"    # Lnl/siegmann/epublib/epub/EpubReader;
    .param p2, "resources"    # Lnl/siegmann/epublib/domain/Resources;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Document;",
            "Lnl/siegmann/epublib/epub/EpubReader;",
            "Lnl/siegmann/epublib/domain/Resources;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lnl/siegmann/epublib/domain/Spine;"
        }
    .end annotation

    .prologue
    .line 210
    .local p3, "idMapping":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v11

    const-string v12, "http://www.idpf.org/2007/opf"

    const-string v13, "spine"

    invoke-static {v11, v12, v13}, Lnl/siegmann/epublib/epub/DOMUtil;->getFirstElementByTagNameNS(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v6

    .line 211
    .local v6, "spineElement":Lorg/w3c/dom/Element;
    if-nez v6, :cond_1a

    .line 212
    sget-object v11, Lnl/siegmann/epublib/epub/PackageDocumentReader;->log:Lorg/slf4j/Logger;

    const-string v12, "Element spine not found in package document, generating one automatically"

    invoke-interface {v11, v12}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 213
    invoke-static/range {p2 .. p2}, Lnl/siegmann/epublib/epub/PackageDocumentReader;->generateSpineFromResources(Lnl/siegmann/epublib/domain/Resources;)Lnl/siegmann/epublib/domain/Spine;

    move-result-object v5

    .line 243
    :goto_19
    return-object v5

    .line 215
    :cond_1a
    new-instance v5, Lnl/siegmann/epublib/domain/Spine;

    invoke-direct {v5}, Lnl/siegmann/epublib/domain/Spine;-><init>()V

    .line 216
    .local v5, "result":Lnl/siegmann/epublib/domain/Spine;
    move-object/from16 v0, p2

    invoke-static {v6, v0}, Lnl/siegmann/epublib/epub/PackageDocumentReader;->findTableOfContentsResource(Lorg/w3c/dom/Element;Lnl/siegmann/epublib/domain/Resources;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v11

    invoke-virtual {v5, v11}, Lnl/siegmann/epublib/domain/Spine;->setTocResource(Lnl/siegmann/epublib/domain/Resource;)V

    .line 217
    const-string v11, "http://www.idpf.org/2007/opf"

    const-string v12, "itemref"

    invoke-interface {p0, v11, v12}, Lorg/w3c/dom/Document;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v8

    .line 218
    .local v8, "spineNodes":Lorg/w3c/dom/NodeList;
    new-instance v10, Ljava/util/ArrayList;

    invoke-interface {v8}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v11

    invoke-direct {v10, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 219
    .local v10, "spineReferences":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/SpineReference;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3a
    invoke-interface {v8}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v11

    if-ge v1, v11, :cond_ad

    .line 220
    invoke-interface {v8, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    check-cast v7, Lorg/w3c/dom/Element;

    .line 221
    .local v7, "spineItem":Lorg/w3c/dom/Element;
    const-string v11, "http://www.idpf.org/2007/opf"

    const-string v12, "idref"

    invoke-static {v7, v11, v12}, Lnl/siegmann/epublib/epub/DOMUtil;->getAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 222
    .local v3, "itemref":Ljava/lang/String;
    invoke-static {v3}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_5e

    .line 223
    sget-object v11, Lnl/siegmann/epublib/epub/PackageDocumentReader;->log:Lorg/slf4j/Logger;

    const-string v12, "itemref with missing or empty idref"

    invoke-interface {v11, v12}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 219
    :goto_5b
    add-int/lit8 v1, v1, 0x1

    goto :goto_3a

    .line 226
    :cond_5e
    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 227
    .local v2, "id":Ljava/lang/String;
    if-nez v2, :cond_69

    .line 228
    move-object v2, v3

    .line 230
    :cond_69
    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lnl/siegmann/epublib/domain/Resources;->getByIdOrHref(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v4

    .line 231
    .local v4, "resource":Lnl/siegmann/epublib/domain/Resource;
    if-nez v4, :cond_90

    .line 232
    sget-object v11, Lnl/siegmann/epublib/epub/PackageDocumentReader;->log:Lorg/slf4j/Logger;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "resource with id \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\' not found"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_5b

    .line 236
    :cond_90
    new-instance v9, Lnl/siegmann/epublib/domain/SpineReference;

    invoke-direct {v9, v4}, Lnl/siegmann/epublib/domain/SpineReference;-><init>(Lnl/siegmann/epublib/domain/Resource;)V

    .line 237
    .local v9, "spineReference":Lnl/siegmann/epublib/domain/SpineReference;
    const-string v11, "no"

    const-string v12, "http://www.idpf.org/2007/opf"

    const-string v13, "linear"

    invoke-static {v7, v12, v13}, Lnl/siegmann/epublib/epub/DOMUtil;->getAttribute(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_a9

    .line 238
    const/4 v11, 0x0

    invoke-virtual {v9, v11}, Lnl/siegmann/epublib/domain/SpineReference;->setLinear(Z)V

    .line 240
    :cond_a9
    invoke-interface {v10, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5b

    .line 242
    .end local v2    # "id":Ljava/lang/String;
    .end local v3    # "itemref":Ljava/lang/String;
    .end local v4    # "resource":Lnl/siegmann/epublib/domain/Resource;
    .end local v7    # "spineItem":Lorg/w3c/dom/Element;
    .end local v9    # "spineReference":Lnl/siegmann/epublib/domain/SpineReference;
    :cond_ad
    invoke-virtual {v5, v10}, Lnl/siegmann/epublib/domain/Spine;->setSpineReferences(Ljava/util/List;)V

    goto/16 :goto_19
.end method
