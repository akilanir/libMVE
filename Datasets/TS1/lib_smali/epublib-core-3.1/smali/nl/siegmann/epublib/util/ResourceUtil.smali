.class public Lnl/siegmann/epublib/util/ResourceUtil;
.super Ljava/lang/Object;
.source "ResourceUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createResource(Ljava/io/File;)Lnl/siegmann/epublib/domain/Resource;
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    if-nez p0, :cond_4

    .line 34
    const/4 v2, 0x0

    .line 39
    :goto_3
    return-object v2

    .line 36
    :cond_4
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lnl/siegmann/epublib/service/MediatypeService;->determineMediaType(Ljava/lang/String;)Lnl/siegmann/epublib/domain/MediaType;

    move-result-object v1

    .line 37
    .local v1, "mediaType":Lnl/siegmann/epublib/domain/MediaType;
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v3}, Lnl/siegmann/epublib/util/IOUtil;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 38
    .local v0, "data":[B
    new-instance v2, Lnl/siegmann/epublib/domain/Resource;

    invoke-direct {v2, v0, v1}, Lnl/siegmann/epublib/domain/Resource;-><init>([BLnl/siegmann/epublib/domain/MediaType;)V

    .line 39
    .local v2, "result":Lnl/siegmann/epublib/domain/Resource;
    goto :goto_3
.end method

.method public static createResource(Ljava/lang/String;Ljava/lang/String;)Lnl/siegmann/epublib/domain/Resource;
    .registers 9
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "href"    # Ljava/lang/String;

    .prologue
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<html><head><title>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</title></head><body><h1>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</h1></body></html>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 52
    .local v6, "content":Ljava/lang/String;
    new-instance v0, Lnl/siegmann/epublib/domain/Resource;

    const/4 v1, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    sget-object v4, Lnl/siegmann/epublib/service/MediatypeService;->XHTML:Lnl/siegmann/epublib/domain/MediaType;

    const-string v5, "UTF-8"

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lnl/siegmann/epublib/domain/Resource;-><init>(Ljava/lang/String;[BLjava/lang/String;Lnl/siegmann/epublib/domain/MediaType;Ljava/lang/String;)V

    return-object v0
.end method

.method public static createResource(Ljava/util/zip/ZipEntry;Ljava/util/zip/ZipInputStream;)Lnl/siegmann/epublib/domain/Resource;
    .registers 4
    .param p0, "zipEntry"    # Ljava/util/zip/ZipEntry;
    .param p1, "zipInputStream"    # Ljava/util/zip/ZipInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    new-instance v0, Lnl/siegmann/epublib/domain/Resource;

    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lnl/siegmann/epublib/domain/Resource;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getAsDocument(Lnl/siegmann/epublib/domain/Resource;)Lorg/w3c/dom/Document;
    .registers 2
    .param p0, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Ljavax/xml/parsers/ParserConfigurationException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-static {}, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->createDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    invoke-static {p0, v0}, Lnl/siegmann/epublib/util/ResourceUtil;->getAsDocument(Lnl/siegmann/epublib/domain/Resource;Ljavax/xml/parsers/DocumentBuilder;)Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0
.end method

.method public static getAsDocument(Lnl/siegmann/epublib/domain/Resource;Ljavax/xml/parsers/DocumentBuilder;)Lorg/w3c/dom/Document;
    .registers 4
    .param p0, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p1, "documentBuilder"    # Ljavax/xml/parsers/DocumentBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Ljavax/xml/parsers/ParserConfigurationException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-static {p0}, Lnl/siegmann/epublib/util/ResourceUtil;->getInputSource(Lnl/siegmann/epublib/domain/Resource;)Lorg/xml/sax/InputSource;

    move-result-object v0

    .line 120
    .local v0, "inputSource":Lorg/xml/sax/InputSource;
    if-nez v0, :cond_8

    .line 121
    const/4 v1, 0x0

    .line 124
    :goto_7
    return-object v1

    .line 123
    :cond_8
    invoke-virtual {p1, v0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 124
    .local v1, "result":Lorg/w3c/dom/Document;
    goto :goto_7
.end method

.method public static getInputSource(Lnl/siegmann/epublib/domain/Resource;)Lorg/xml/sax/InputSource;
    .registers 3
    .param p0, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 87
    if-nez p0, :cond_4

    .line 95
    :cond_3
    :goto_3
    return-object v0

    .line 90
    :cond_4
    invoke-virtual {p0}, Lnl/siegmann/epublib/domain/Resource;->getReader()Ljava/io/Reader;

    move-result-object v1

    .line 91
    .local v1, "reader":Ljava/io/Reader;
    if-eqz v1, :cond_3

    .line 94
    new-instance v0, Lorg/xml/sax/InputSource;

    invoke-direct {v0, v1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    .line 95
    .local v0, "inputSource":Lorg/xml/sax/InputSource;
    goto :goto_3
.end method

.method public static recode(Ljava/lang/String;Ljava/lang/String;[B)[B
    .registers 4
    .param p0, "inputEncoding"    # Ljava/lang/String;
    .param p1, "outputEncoding"    # Ljava/lang/String;
    .param p2, "input"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 79
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p2, p0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method
