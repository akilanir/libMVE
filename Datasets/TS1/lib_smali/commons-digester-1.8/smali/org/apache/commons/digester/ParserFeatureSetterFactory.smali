.class public Lorg/apache/commons/digester/ParserFeatureSetterFactory;
.super Ljava/lang/Object;
.source "ParserFeatureSetterFactory.java"


# static fields
.field private static isXercesUsed:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 55
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v1

    .line 56
    .local v1, "factory":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "org.apache.xerces"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 57
    const/4 v2, 0x1

    sput-boolean v2, Lorg/apache/commons/digester/ParserFeatureSetterFactory;->isXercesUsed:Z
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_17} :catch_18

    .line 49
    :cond_17
    :goto_17
    return-void

    .line 60
    :catch_18
    move-exception v0

    .local v0, "ex":Ljava/lang/Exception;
    const/4 v2, 0x0

    sput-boolean v2, Lorg/apache/commons/digester/ParserFeatureSetterFactory;->isXercesUsed:Z

    goto :goto_17
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newSAXParser(Ljava/util/Properties;)Ljavax/xml/parsers/SAXParser;
    .registers 2
    .param p0, "properties"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;,
            Lorg/xml/sax/SAXNotRecognizedException;,
            Lorg/xml/sax/SAXNotSupportedException;
        }
    .end annotation

    .prologue
    .line 76
    sget-boolean v0, Lorg/apache/commons/digester/ParserFeatureSetterFactory;->isXercesUsed:Z

    if-eqz v0, :cond_9

    .line 77
    invoke-static {p0}, Lorg/apache/commons/digester/parser/XercesParser;->newSAXParser(Ljava/util/Properties;)Ljavax/xml/parsers/SAXParser;

    move-result-object v0

    .line 79
    :goto_8
    return-object v0

    :cond_9
    invoke-static {p0}, Lorg/apache/commons/digester/parser/GenericParser;->newSAXParser(Ljava/util/Properties;)Ljavax/xml/parsers/SAXParser;

    move-result-object v0

    goto :goto_8
.end method
