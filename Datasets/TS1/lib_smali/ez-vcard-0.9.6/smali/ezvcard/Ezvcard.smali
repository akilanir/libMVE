.class public Lezvcard/Ezvcard;
.super Ljava/lang/Object;
.source "Ezvcard.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lezvcard/Ezvcard$1;,
        Lezvcard/Ezvcard$WriterChainJson;,
        Lezvcard/Ezvcard$WriterChainHtml;,
        Lezvcard/Ezvcard$WriterChainXml;,
        Lezvcard/Ezvcard$WriterChainText;,
        Lezvcard/Ezvcard$WriterChain;,
        Lezvcard/Ezvcard$ParserChainJsonString;,
        Lezvcard/Ezvcard$ParserChainJsonReader;,
        Lezvcard/Ezvcard$ParserChainJson;,
        Lezvcard/Ezvcard$ParserChainHtmlString;,
        Lezvcard/Ezvcard$ParserChainHtmlReader;,
        Lezvcard/Ezvcard$ParserChainHtml;,
        Lezvcard/Ezvcard$ParserChainXmlDom;,
        Lezvcard/Ezvcard$ParserChainXmlString;,
        Lezvcard/Ezvcard$ParserChainXmlReader;,
        Lezvcard/Ezvcard$ParserChainXml;,
        Lezvcard/Ezvcard$ParserChainTextString;,
        Lezvcard/Ezvcard$ParserChainTextReader;,
        Lezvcard/Ezvcard$ParserChainText;,
        Lezvcard/Ezvcard$ParserChain;
    }
.end annotation


# static fields
.field public static final URL:Ljava/lang/String;

.field public static final VERSION:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 121
    const/4 v1, 0x0

    .line 123
    .local v1, "in":Ljava/io/InputStream;
    :try_start_1
    const-class v3, Lezvcard/Ezvcard;

    const-string v4, "/ez-vcard.properties"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 124
    new-instance v2, Ljava/util/Properties;

    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    .line 125
    .local v2, "props":Ljava/util/Properties;
    invoke-virtual {v2, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 127
    const-string v3, "version"

    invoke-virtual {v2, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lezvcard/Ezvcard;->VERSION:Ljava/lang/String;

    .line 128
    const-string v3, "url"

    invoke-virtual {v2, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lezvcard/Ezvcard;->URL:Ljava/lang/String;
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_21} :catch_25
    .catchall {:try_start_1 .. :try_end_21} :catchall_2c

    .line 132
    invoke-static {v1}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 134
    return-void

    .line 129
    .end local v2    # "props":Ljava/util/Properties;
    :catch_25
    move-exception v0

    .line 130
    .local v0, "e":Ljava/io/IOException;
    :try_start_26
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_2c
    .catchall {:try_start_26 .. :try_end_2c} :catchall_2c

    .line 132
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_2c
    move-exception v3

    invoke-static {v1}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v3
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1812
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1814
    return-void
.end method

.method public static parse(Ljava/io/File;)Lezvcard/Ezvcard$ParserChainTextReader;
    .registers 3
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 169
    new-instance v0, Lezvcard/Ezvcard$ParserChainTextReader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainTextReader;-><init>(Ljava/io/File;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parse(Ljava/io/InputStream;)Lezvcard/Ezvcard$ParserChainTextReader;
    .registers 2
    .param p0, "in"    # Ljava/io/InputStream;

    .prologue
    .line 187
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-static {v0}, Lezvcard/Ezvcard;->parse(Ljava/io/Reader;)Lezvcard/Ezvcard$ParserChainTextReader;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/io/Reader;)Lezvcard/Ezvcard$ParserChainTextReader;
    .registers 3
    .param p0, "reader"    # Ljava/io/Reader;

    .prologue
    .line 205
    new-instance v0, Lezvcard/Ezvcard$ParserChainTextReader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainTextReader;-><init>(Ljava/io/Reader;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parse(Ljava/lang/String;)Lezvcard/Ezvcard$ParserChainTextString;
    .registers 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 151
    new-instance v0, Lezvcard/Ezvcard$ParserChainTextString;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainTextString;-><init>(Ljava/lang/String;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parseHtml(Ljava/io/File;)Lezvcard/Ezvcard$ParserChainHtmlReader;
    .registers 3
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 335
    new-instance v0, Lezvcard/Ezvcard$ParserChainHtmlReader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainHtmlReader;-><init>(Ljava/io/File;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parseHtml(Ljava/io/InputStream;)Lezvcard/Ezvcard$ParserChainHtmlReader;
    .registers 2
    .param p0, "in"    # Ljava/io/InputStream;

    .prologue
    .line 351
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-static {v0}, Lezvcard/Ezvcard;->parseHtml(Ljava/io/Reader;)Lezvcard/Ezvcard$ParserChainHtmlReader;

    move-result-object v0

    return-object v0
.end method

.method public static parseHtml(Ljava/io/Reader;)Lezvcard/Ezvcard$ParserChainHtmlReader;
    .registers 3
    .param p0, "reader"    # Ljava/io/Reader;

    .prologue
    .line 367
    new-instance v0, Lezvcard/Ezvcard$ParserChainHtmlReader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainHtmlReader;-><init>(Ljava/io/Reader;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parseHtml(Ljava/net/URL;)Lezvcard/Ezvcard$ParserChainHtmlReader;
    .registers 3
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    .line 383
    new-instance v0, Lezvcard/Ezvcard$ParserChainHtmlReader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainHtmlReader;-><init>(Ljava/net/URL;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parseHtml(Ljava/lang/String;)Lezvcard/Ezvcard$ParserChainHtmlString;
    .registers 3
    .param p0, "html"    # Ljava/lang/String;

    .prologue
    .line 319
    new-instance v0, Lezvcard/Ezvcard$ParserChainHtmlString;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainHtmlString;-><init>(Ljava/lang/String;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parseJson(Ljava/io/File;)Lezvcard/Ezvcard$ParserChainJsonReader;
    .registers 3
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 415
    new-instance v0, Lezvcard/Ezvcard$ParserChainJsonReader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainJsonReader;-><init>(Ljava/io/File;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parseJson(Ljava/io/InputStream;)Lezvcard/Ezvcard$ParserChainJsonReader;
    .registers 3
    .param p0, "in"    # Ljava/io/InputStream;

    .prologue
    .line 431
    new-instance v0, Lezvcard/Ezvcard$ParserChainJsonReader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainJsonReader;-><init>(Ljava/io/InputStream;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parseJson(Ljava/io/Reader;)Lezvcard/Ezvcard$ParserChainJsonReader;
    .registers 3
    .param p0, "reader"    # Ljava/io/Reader;

    .prologue
    .line 447
    new-instance v0, Lezvcard/Ezvcard$ParserChainJsonReader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainJsonReader;-><init>(Ljava/io/Reader;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parseJson(Ljava/lang/String;)Lezvcard/Ezvcard$ParserChainJsonString;
    .registers 3
    .param p0, "json"    # Ljava/lang/String;

    .prologue
    .line 399
    new-instance v0, Lezvcard/Ezvcard$ParserChainJsonString;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainJsonString;-><init>(Ljava/lang/String;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parseXml(Lorg/w3c/dom/Document;)Lezvcard/Ezvcard$ParserChainXmlDom;
    .registers 3
    .param p0, "document"    # Lorg/w3c/dom/Document;

    .prologue
    .line 303
    new-instance v0, Lezvcard/Ezvcard$ParserChainXmlDom;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainXmlDom;-><init>(Lorg/w3c/dom/Document;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parseXml(Ljava/io/File;)Lezvcard/Ezvcard$ParserChainXmlReader;
    .registers 3
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 241
    new-instance v0, Lezvcard/Ezvcard$ParserChainXmlReader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainXmlReader;-><init>(Ljava/io/File;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parseXml(Ljava/io/InputStream;)Lezvcard/Ezvcard$ParserChainXmlReader;
    .registers 3
    .param p0, "in"    # Ljava/io/InputStream;

    .prologue
    .line 259
    new-instance v0, Lezvcard/Ezvcard$ParserChainXmlReader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainXmlReader;-><init>(Ljava/io/InputStream;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parseXml(Ljava/io/Reader;)Lezvcard/Ezvcard$ParserChainXmlReader;
    .registers 3
    .param p0, "reader"    # Ljava/io/Reader;

    .prologue
    .line 285
    new-instance v0, Lezvcard/Ezvcard$ParserChainXmlReader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainXmlReader;-><init>(Ljava/io/Reader;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static parseXml(Ljava/lang/String;)Lezvcard/Ezvcard$ParserChainXmlString;
    .registers 3
    .param p0, "xml"    # Ljava/lang/String;

    .prologue
    .line 223
    new-instance v0, Lezvcard/Ezvcard$ParserChainXmlString;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$ParserChainXmlString;-><init>(Ljava/lang/String;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static write(Ljava/util/Collection;)Lezvcard/Ezvcard$WriterChainText;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/VCard;",
            ">;)",
            "Lezvcard/Ezvcard$WriterChainText;"
        }
    .end annotation

    .prologue
    .line 487
    .local p0, "vcards":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/VCard;>;"
    new-instance v0, Lezvcard/Ezvcard$WriterChainText;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$WriterChainText;-><init>(Ljava/util/Collection;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static varargs write([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainText;
    .registers 2
    .param p0, "vcards"    # [Lezvcard/VCard;

    .prologue
    .line 467
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lezvcard/Ezvcard;->write(Ljava/util/Collection;)Lezvcard/Ezvcard$WriterChainText;

    move-result-object v0

    return-object v0
.end method

.method public static writeHtml(Ljava/util/Collection;)Lezvcard/Ezvcard$WriterChainHtml;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/VCard;",
            ">;)",
            "Lezvcard/Ezvcard$WriterChainHtml;"
        }
    .end annotation

    .prologue
    .line 559
    .local p0, "vcards":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/VCard;>;"
    new-instance v0, Lezvcard/Ezvcard$WriterChainHtml;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$WriterChainHtml;-><init>(Ljava/util/Collection;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static varargs writeHtml([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainHtml;
    .registers 2
    .param p0, "vcards"    # [Lezvcard/VCard;

    .prologue
    .line 542
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lezvcard/Ezvcard;->writeHtml(Ljava/util/Collection;)Lezvcard/Ezvcard$WriterChainHtml;

    move-result-object v0

    return-object v0
.end method

.method public static writeJson(Ljava/util/Collection;)Lezvcard/Ezvcard$WriterChainJson;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/VCard;",
            ">;)",
            "Lezvcard/Ezvcard$WriterChainJson;"
        }
    .end annotation

    .prologue
    .line 593
    .local p0, "vcards":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/VCard;>;"
    new-instance v0, Lezvcard/Ezvcard$WriterChainJson;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$WriterChainJson;-><init>(Ljava/util/Collection;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static varargs writeJson([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainJson;
    .registers 2
    .param p0, "vcards"    # [Lezvcard/VCard;

    .prologue
    .line 576
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lezvcard/Ezvcard;->writeJson(Ljava/util/Collection;)Lezvcard/Ezvcard$WriterChainJson;

    move-result-object v0

    return-object v0
.end method

.method public static writeXml(Ljava/util/Collection;)Lezvcard/Ezvcard$WriterChainXml;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/VCard;",
            ">;)",
            "Lezvcard/Ezvcard$WriterChainXml;"
        }
    .end annotation

    .prologue
    .line 525
    .local p0, "vcards":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/VCard;>;"
    new-instance v0, Lezvcard/Ezvcard$WriterChainXml;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lezvcard/Ezvcard$WriterChainXml;-><init>(Ljava/util/Collection;Lezvcard/Ezvcard$1;)V

    return-object v0
.end method

.method public static varargs writeXml([Lezvcard/VCard;)Lezvcard/Ezvcard$WriterChainXml;
    .registers 2
    .param p0, "vcards"    # [Lezvcard/VCard;

    .prologue
    .line 506
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lezvcard/Ezvcard;->writeXml(Ljava/util/Collection;)Lezvcard/Ezvcard$WriterChainXml;

    move-result-object v0

    return-object v0
.end method
