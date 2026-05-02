.class public Lnl/siegmann/epublib/epub/EpubProcessorSupport;
.super Ljava/lang/Object;
.source "EpubProcessorSupport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnl/siegmann/epublib/epub/EpubProcessorSupport$EntityResolverImpl;
    }
.end annotation


# static fields
.field protected static documentBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

.field private static final log:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    const-class v0, Lnl/siegmann/epublib/epub/EpubProcessorSupport;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->log:Lorg/slf4j/Logger;

    .line 38
    invoke-static {}, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->init()V

    .line 39
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method

.method public static createDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;
    .registers 4

    .prologue
    .line 112
    const/4 v1, 0x0

    .line 114
    .local v1, "result":Ljavax/xml/parsers/DocumentBuilder;
    :try_start_1
    sget-object v2, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->documentBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    invoke-virtual {v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    .line 115
    invoke-static {}, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->getEntityResolver()Lorg/xml/sax/EntityResolver;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavax/xml/parsers/DocumentBuilder;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V
    :try_end_e
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_1 .. :try_end_e} :catch_f

    .line 119
    :goto_e
    return-object v1

    .line 116
    :catch_f
    move-exception v0

    .line 117
    .local v0, "e":Ljavax/xml/parsers/ParserConfigurationException;
    sget-object v2, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->log:Lorg/slf4j/Logger;

    invoke-virtual {v0}, Ljavax/xml/parsers/ParserConfigurationException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_e
.end method

.method public static createXmlSerializer(Ljava/io/OutputStream;)Lorg/xmlpull/v1/XmlSerializer;
    .registers 3
    .param p0, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 73
    new-instance v0, Ljava/io/OutputStreamWriter;

    const-string v1, "UTF-8"

    invoke-direct {v0, p0, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-static {v0}, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->createXmlSerializer(Ljava/io/Writer;)Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v0

    return-object v0
.end method

.method public static createXmlSerializer(Ljava/io/Writer;)Lorg/xmlpull/v1/XmlSerializer;
    .registers 7
    .param p0, "out"    # Ljava/io/Writer;

    .prologue
    .line 77
    const/4 v2, 0x0

    .line 79
    .local v2, "result":Lorg/xmlpull/v1/XmlSerializer;
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v1

    .line 80
    .local v1, "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lorg/xmlpull/v1/XmlPullParserFactory;->setValidating(Z)V

    .line 81
    invoke-virtual {v1}, Lorg/xmlpull/v1/XmlPullParserFactory;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v2

    .line 82
    const-string v3, "http://xmlpull.org/v1/doc/features.html#indent-output"

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Lorg/xmlpull/v1/XmlSerializer;->setFeature(Ljava/lang/String;Z)V

    .line 83
    invoke-interface {v2, p0}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/Writer;)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_16} :catch_17

    .line 87
    .end local v1    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    :goto_16
    return-object v2

    .line 84
    :catch_17
    move-exception v0

    .line 85
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->log:Lorg/slf4j/Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "When creating XmlSerializer: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_16
.end method

.method public static getEntityResolver()Lorg/xml/sax/EntityResolver;
    .registers 1

    .prologue
    .line 99
    new-instance v0, Lnl/siegmann/epublib/epub/EpubProcessorSupport$EntityResolverImpl;

    invoke-direct {v0}, Lnl/siegmann/epublib/epub/EpubProcessorSupport$EntityResolverImpl;-><init>()V

    return-object v0
.end method

.method private static init()V
    .registers 2

    .prologue
    .line 67
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    sput-object v0, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->documentBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    .line 68
    sget-object v0, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->documentBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 69
    sget-object v0, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->documentBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setValidating(Z)V

    .line 70
    return-void
.end method


# virtual methods
.method public getDocumentBuilderFactory()Ljavax/xml/parsers/DocumentBuilderFactory;
    .registers 2

    .prologue
    .line 103
    sget-object v0, Lnl/siegmann/epublib/epub/EpubProcessorSupport;->documentBuilderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    return-object v0
.end method
