.class public Lnl/siegmann/epublib/epub/EpubReader;
.super Ljava/lang/Object;
.source "EpubReader.java"


# static fields
.field private static final log:Lorg/slf4j/Logger;


# instance fields
.field private bookProcessor:Lnl/siegmann/epublib/epub/BookProcessor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    const-class v0, Lnl/siegmann/epublib/epub/EpubReader;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lnl/siegmann/epublib/epub/EpubReader;->log:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    sget-object v0, Lnl/siegmann/epublib/epub/BookProcessor;->IDENTITY_BOOKPROCESSOR:Lnl/siegmann/epublib/epub/BookProcessor;

    iput-object v0, p0, Lnl/siegmann/epublib/epub/EpubReader;->bookProcessor:Lnl/siegmann/epublib/epub/BookProcessor;

    return-void
.end method

.method private getPackageResourceHref(Lnl/siegmann/epublib/domain/Resources;)Ljava/lang/String;
    .registers 11
    .param p1, "resources"    # Lnl/siegmann/epublib/domain/Resources;

    .prologue
    .line 127
    const-string v1, "OEBPS/content.opf"

    .line 128
    .local v1, "defaultResult":Ljava/lang/String;
    move-object v4, v1

    .line 130
    .local v4, "result":Ljava/lang/String;
    const-string v7, "META-INF/container.xml"

    invoke-virtual {p1, v7}, Lnl/siegmann/epublib/domain/Resources;->remove(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    .line 131
    .local v0, "containerResource":Lnl/siegmann/epublib/domain/Resource;
    if-nez v0, :cond_d

    move-object v5, v4

    .line 144
    .end local v4    # "result":Ljava/lang/String;
    .local v5, "result":Ljava/lang/String;
    :goto_c
    return-object v5

    .line 135
    .end local v5    # "result":Ljava/lang/String;
    .restart local v4    # "result":Ljava/lang/String;
    :cond_d
    :try_start_d
    invoke-static {v0}, Lnl/siegmann/epublib/util/ResourceUtil;->getAsDocument(Lnl/siegmann/epublib/domain/Resource;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 136
    .local v2, "document":Lorg/w3c/dom/Document;
    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v7

    const-string v8, "rootfiles"

    invoke-interface {v7, v8}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v7, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    check-cast v7, Lorg/w3c/dom/Element;

    const-string v8, "rootfile"

    invoke-interface {v7, v8}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v7, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    check-cast v6, Lorg/w3c/dom/Element;

    .line 137
    .local v6, "rootFileElement":Lorg/w3c/dom/Element;
    const-string v7, "full-path"

    invoke-interface {v6, v7}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_34} :catch_3e

    move-result-object v4

    .line 141
    .end local v2    # "document":Lorg/w3c/dom/Document;
    .end local v6    # "rootFileElement":Lorg/w3c/dom/Element;
    :goto_35
    invoke-static {v4}, Lnl/siegmann/epublib/util/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3c

    .line 142
    move-object v4, v1

    :cond_3c
    move-object v5, v4

    .line 144
    .end local v4    # "result":Ljava/lang/String;
    .restart local v5    # "result":Ljava/lang/String;
    goto :goto_c

    .line 138
    .end local v5    # "result":Ljava/lang/String;
    .restart local v4    # "result":Ljava/lang/String;
    :catch_3e
    move-exception v3

    .line 139
    .local v3, "e":Ljava/lang/Exception;
    sget-object v7, Lnl/siegmann/epublib/epub/EpubReader;->log:Lorg/slf4j/Logger;

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_35
.end method

.method private handleMimeType(Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/domain/Resources;)V
    .registers 4
    .param p1, "result"    # Lnl/siegmann/epublib/domain/Book;
    .param p2, "resources"    # Lnl/siegmann/epublib/domain/Resources;

    .prologue
    .line 148
    const-string v0, "mimetype"

    invoke-virtual {p2, v0}, Lnl/siegmann/epublib/domain/Resources;->remove(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    .line 149
    return-void
.end method

.method private postProcessBook(Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Book;
    .registers 3
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;

    .prologue
    .line 106
    iget-object v0, p0, Lnl/siegmann/epublib/epub/EpubReader;->bookProcessor:Lnl/siegmann/epublib/epub/BookProcessor;

    if-eqz v0, :cond_a

    .line 107
    iget-object v0, p0, Lnl/siegmann/epublib/epub/EpubReader;->bookProcessor:Lnl/siegmann/epublib/epub/BookProcessor;

    invoke-interface {v0, p1}, Lnl/siegmann/epublib/epub/BookProcessor;->processBook(Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Book;

    move-result-object p1

    .line 109
    :cond_a
    return-object p1
.end method

.method private processNcxResource(Lnl/siegmann/epublib/domain/Resource;Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Resource;
    .registers 4
    .param p1, "packageResource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "book"    # Lnl/siegmann/epublib/domain/Book;

    .prologue
    .line 113
    invoke-static {p2, p0}, Lnl/siegmann/epublib/epub/NCXDocument;->read(Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/epub/EpubReader;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    return-object v0
.end method

.method private processPackageResource(Ljava/lang/String;Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/domain/Resources;)Lnl/siegmann/epublib/domain/Resource;
    .registers 8
    .param p1, "packageResourceHref"    # Ljava/lang/String;
    .param p2, "book"    # Lnl/siegmann/epublib/domain/Book;
    .param p3, "resources"    # Lnl/siegmann/epublib/domain/Resources;

    .prologue
    .line 117
    invoke-virtual {p3, p1}, Lnl/siegmann/epublib/domain/Resources;->remove(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    .line 119
    .local v1, "packageResource":Lnl/siegmann/epublib/domain/Resource;
    :try_start_4
    invoke-static {v1, p0, p2, p3}, Lnl/siegmann/epublib/epub/PackageDocumentReader;->read(Lnl/siegmann/epublib/domain/Resource;Lnl/siegmann/epublib/epub/EpubReader;Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/domain/Resources;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_7} :catch_8

    .line 123
    :goto_7
    return-object v1

    .line 120
    :catch_8
    move-exception v0

    .line 121
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lnl/siegmann/epublib/epub/EpubReader;->log:Lorg/slf4j/Logger;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_7
.end method

.method private readLazyResources(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lnl/siegmann/epublib/domain/Resources;
    .registers 12
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "defaultHtmlEncoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/MediaType;",
            ">;)",
            "Lnl/siegmann/epublib/domain/Resources;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 154
    .local p3, "lazyLoadedTypes":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/MediaType;>;"
    new-instance v1, Ljava/util/zip/ZipInputStream;

    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v6}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 156
    .local v1, "in":Ljava/util/zip/ZipInputStream;
    new-instance v4, Lnl/siegmann/epublib/domain/Resources;

    invoke-direct {v4}, Lnl/siegmann/epublib/domain/Resources;-><init>()V

    .line 157
    .local v4, "result":Lnl/siegmann/epublib/domain/Resources;
    invoke-virtual {v1}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v5

    .local v5, "zipEntry":Ljava/util/zip/ZipEntry;
    :goto_13
    if-eqz v5, :cond_4c

    .line 158
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_20

    .line 157
    :goto_1b
    invoke-virtual {v1}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v5

    goto :goto_13

    .line 162
    :cond_20
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    .line 163
    .local v0, "href":Ljava/lang/String;
    invoke-static {v0}, Lnl/siegmann/epublib/service/MediatypeService;->determineMediaType(Ljava/lang/String;)Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v2

    .line 167
    .local v2, "mediaType":Lnl/siegmann/epublib/domain/MediaType;
    invoke-interface {p3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_46

    .line 168
    new-instance v3, Lnl/siegmann/epublib/domain/Resource;

    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v6

    invoke-direct {v3, p1, v6, v7, v0}, Lnl/siegmann/epublib/domain/Resource;-><init>(Ljava/lang/String;JLjava/lang/String;)V

    .line 173
    .local v3, "resource":Lnl/siegmann/epublib/domain/Resource;
    :goto_37
    invoke-virtual {v3}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v6

    sget-object v7, Lnl/siegmann/epublib/service/MediatypeService;->XHTML:Lnl/siegmann/epublib/domain/MediaType;

    if-ne v6, v7, :cond_42

    .line 174
    invoke-virtual {v3, p2}, Lnl/siegmann/epublib/domain/Resource;->setInputEncoding(Ljava/lang/String;)V

    .line 176
    :cond_42
    invoke-virtual {v4, v3}, Lnl/siegmann/epublib/domain/Resources;->add(Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/Resource;

    goto :goto_1b

    .line 170
    .end local v3    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :cond_46
    new-instance v3, Lnl/siegmann/epublib/domain/Resource;

    invoke-direct {v3, v1, v0}, Lnl/siegmann/epublib/domain/Resource;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .restart local v3    # "resource":Lnl/siegmann/epublib/domain/Resource;
    goto :goto_37

    .line 179
    .end local v0    # "href":Ljava/lang/String;
    .end local v2    # "mediaType":Lnl/siegmann/epublib/domain/MediaType;
    .end local v3    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :cond_4c
    return-object v4
.end method

.method private readResources(Ljava/util/zip/ZipInputStream;Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resources;
    .registers 8
    .param p1, "in"    # Ljava/util/zip/ZipInputStream;
    .param p2, "defaultHtmlEncoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    new-instance v1, Lnl/siegmann/epublib/domain/Resources;

    invoke-direct {v1}, Lnl/siegmann/epublib/domain/Resources;-><init>()V

    .line 184
    .local v1, "result":Lnl/siegmann/epublib/domain/Resources;
    invoke-virtual {p1}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v2

    .local v2, "zipEntry":Ljava/util/zip/ZipEntry;
    :goto_9
    if-eqz v2, :cond_29

    .line 185
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_16

    .line 184
    :goto_11
    invoke-virtual {p1}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v2

    goto :goto_9

    .line 188
    :cond_16
    invoke-static {v2, p1}, Lnl/siegmann/epublib/util/ResourceUtil;->createResource(Ljava/util/zip/ZipEntry;Ljava/util/zip/ZipInputStream;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    .line 189
    .local v0, "resource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {v0}, Lnl/siegmann/epublib/domain/Resource;->getMediaType()Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v3

    sget-object v4, Lnl/siegmann/epublib/service/MediatypeService;->XHTML:Lnl/siegmann/epublib/domain/MediaType;

    if-ne v3, v4, :cond_25

    .line 190
    invoke-virtual {v0, p2}, Lnl/siegmann/epublib/domain/Resource;->setInputEncoding(Ljava/lang/String;)V

    .line 192
    :cond_25
    invoke-virtual {v1, v0}, Lnl/siegmann/epublib/domain/Resources;->add(Lnl/siegmann/epublib/domain/Resource;)Lnl/siegmann/epublib/domain/Resource;

    goto :goto_11

    .line 194
    .end local v0    # "resource":Lnl/siegmann/epublib/domain/Resource;
    :cond_29
    return-object v1
.end method


# virtual methods
.method public readEpub(Ljava/io/InputStream;)Lnl/siegmann/epublib/domain/Book;
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    const-string v0, "UTF-8"

    invoke-virtual {p0, p1, v0}, Lnl/siegmann/epublib/epub/EpubReader;->readEpub(Ljava/io/InputStream;Ljava/lang/String;)Lnl/siegmann/epublib/domain/Book;

    move-result-object v0

    return-object v0
.end method

.method public readEpub(Ljava/io/InputStream;Ljava/lang/String;)Lnl/siegmann/epublib/domain/Book;
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    new-instance v0, Ljava/util/zip/ZipInputStream;

    invoke-direct {v0, p1}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {p0, v0, p2}, Lnl/siegmann/epublib/epub/EpubReader;->readEpub(Ljava/util/zip/ZipInputStream;Ljava/lang/String;)Lnl/siegmann/epublib/domain/Book;

    move-result-object v0

    return-object v0
.end method

.method public readEpub(Ljava/util/zip/ZipInputStream;)Lnl/siegmann/epublib/domain/Book;
    .registers 3
    .param p1, "in"    # Ljava/util/zip/ZipInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    const-string v0, "UTF-8"

    invoke-virtual {p0, p1, v0}, Lnl/siegmann/epublib/epub/EpubReader;->readEpub(Ljava/util/zip/ZipInputStream;Ljava/lang/String;)Lnl/siegmann/epublib/domain/Book;

    move-result-object v0

    return-object v0
.end method

.method public readEpub(Ljava/util/zip/ZipInputStream;Ljava/lang/String;)Lnl/siegmann/epublib/domain/Book;
    .registers 8
    .param p1, "in"    # Ljava/util/zip/ZipInputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    new-instance v4, Lnl/siegmann/epublib/domain/Book;

    invoke-direct {v4}, Lnl/siegmann/epublib/domain/Book;-><init>()V

    .line 94
    .local v4, "result":Lnl/siegmann/epublib/domain/Book;
    invoke-direct {p0, p1, p2}, Lnl/siegmann/epublib/epub/EpubReader;->readResources(Ljava/util/zip/ZipInputStream;Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resources;

    move-result-object v3

    .line 95
    .local v3, "resources":Lnl/siegmann/epublib/domain/Resources;
    invoke-direct {p0, v4, v3}, Lnl/siegmann/epublib/epub/EpubReader;->handleMimeType(Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/domain/Resources;)V

    .line 96
    invoke-direct {p0, v3}, Lnl/siegmann/epublib/epub/EpubReader;->getPackageResourceHref(Lnl/siegmann/epublib/domain/Resources;)Ljava/lang/String;

    move-result-object v2

    .line 97
    .local v2, "packageResourceHref":Ljava/lang/String;
    invoke-direct {p0, v2, v4, v3}, Lnl/siegmann/epublib/epub/EpubReader;->processPackageResource(Ljava/lang/String;Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/domain/Resources;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    .line 98
    .local v1, "packageResource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {v4, v1}, Lnl/siegmann/epublib/domain/Book;->setOpfResource(Lnl/siegmann/epublib/domain/Resource;)V

    .line 99
    invoke-direct {p0, v1, v4}, Lnl/siegmann/epublib/epub/EpubReader;->processNcxResource(Lnl/siegmann/epublib/domain/Resource;Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    .line 100
    .local v0, "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {v4, v0}, Lnl/siegmann/epublib/domain/Book;->setNcxResource(Lnl/siegmann/epublib/domain/Resource;)V

    .line 101
    invoke-direct {p0, v4}, Lnl/siegmann/epublib/epub/EpubReader;->postProcessBook(Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Book;

    move-result-object v4

    .line 102
    return-object v4
.end method

.method public readEpubLazy(Ljava/lang/String;Ljava/lang/String;)Lnl/siegmann/epublib/domain/Book;
    .registers 4
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    sget-object v0, Lnl/siegmann/epublib/service/MediatypeService;->mediatypes:[Lnl/siegmann/epublib/domain/MediaType;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lnl/siegmann/epublib/epub/EpubReader;->readEpubLazy(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lnl/siegmann/epublib/domain/Book;

    move-result-object v0

    return-object v0
.end method

.method public readEpubLazy(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lnl/siegmann/epublib/domain/Book;
    .registers 9
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/domain/MediaType;",
            ">;)",
            "Lnl/siegmann/epublib/domain/Book;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    .local p3, "lazyLoadedTypes":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/domain/MediaType;>;"
    new-instance v4, Lnl/siegmann/epublib/domain/Book;

    invoke-direct {v4}, Lnl/siegmann/epublib/domain/Book;-><init>()V

    .line 67
    .local v4, "result":Lnl/siegmann/epublib/domain/Book;
    invoke-direct {p0, p1, p2, p3}, Lnl/siegmann/epublib/epub/EpubReader;->readLazyResources(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lnl/siegmann/epublib/domain/Resources;

    move-result-object v3

    .line 68
    .local v3, "resources":Lnl/siegmann/epublib/domain/Resources;
    invoke-direct {p0, v4, v3}, Lnl/siegmann/epublib/epub/EpubReader;->handleMimeType(Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/domain/Resources;)V

    .line 69
    invoke-direct {p0, v3}, Lnl/siegmann/epublib/epub/EpubReader;->getPackageResourceHref(Lnl/siegmann/epublib/domain/Resources;)Ljava/lang/String;

    move-result-object v2

    .line 70
    .local v2, "packageResourceHref":Ljava/lang/String;
    invoke-direct {p0, v2, v4, v3}, Lnl/siegmann/epublib/epub/EpubReader;->processPackageResource(Ljava/lang/String;Lnl/siegmann/epublib/domain/Book;Lnl/siegmann/epublib/domain/Resources;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v1

    .line 71
    .local v1, "packageResource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {v4, v1}, Lnl/siegmann/epublib/domain/Book;->setOpfResource(Lnl/siegmann/epublib/domain/Resource;)V

    .line 72
    invoke-direct {p0, v1, v4}, Lnl/siegmann/epublib/epub/EpubReader;->processNcxResource(Lnl/siegmann/epublib/domain/Resource;Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Resource;

    move-result-object v0

    .line 73
    .local v0, "ncxResource":Lnl/siegmann/epublib/domain/Resource;
    invoke-virtual {v4, v0}, Lnl/siegmann/epublib/domain/Book;->setNcxResource(Lnl/siegmann/epublib/domain/Resource;)V

    .line 74
    invoke-direct {p0, v4}, Lnl/siegmann/epublib/epub/EpubReader;->postProcessBook(Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Book;

    move-result-object v4

    .line 75
    return-object v4
.end method
