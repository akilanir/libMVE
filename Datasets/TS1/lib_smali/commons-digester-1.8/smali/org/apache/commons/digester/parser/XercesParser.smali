.class public Lorg/apache/commons/digester/parser/XercesParser;
.super Ljava/lang/Object;
.source "XercesParser.java"


# static fields
.field protected static JAXP_SCHEMA_LANGUAGE:Ljava/lang/String; = null

.field private static final JAXP_SCHEMA_SOURCE:Ljava/lang/String; = "http://java.sun.com/xml/jaxp/properties/schemaSource"

.field protected static XERCES_DYNAMIC:Ljava/lang/String;

.field protected static XERCES_SCHEMA:Ljava/lang/String;

.field protected static log:Lorg/apache/commons/logging/Log;

.field protected static version:F

.field protected static versionNumber:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 49
    const-string v0, "org.apache.commons.digester.Digester.sax"

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/String;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/digester/parser/XercesParser;->log:Lorg/apache/commons/logging/Log;

    .line 63
    const-string v0, "http://java.sun.com/xml/jaxp/properties/schemaLanguage"

    sput-object v0, Lorg/apache/commons/digester/parser/XercesParser;->JAXP_SCHEMA_LANGUAGE:Ljava/lang/String;

    .line 70
    const-string v0, "http://apache.org/xml/features/validation/dynamic"

    sput-object v0, Lorg/apache/commons/digester/parser/XercesParser;->XERCES_DYNAMIC:Ljava/lang/String;

    .line 77
    const-string v0, "http://apache.org/xml/features/validation/schema"

    sput-object v0, Lorg/apache/commons/digester/parser/XercesParser;->XERCES_SCHEMA:Ljava/lang/String;

    .line 90
    const/4 v0, 0x0

    sput-object v0, Lorg/apache/commons/digester/parser/XercesParser;->versionNumber:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static configureOldXerces(Ljavax/xml/parsers/SAXParser;Ljava/util/Properties;)V
    .registers 8
    .param p0, "parser"    # Ljavax/xml/parsers/SAXParser;
    .param p1, "properties"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXNotSupportedException;
        }
    .end annotation

    .prologue
    .line 160
    const-string v3, "schemaLocation"

    invoke-virtual {p1, v3}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 161
    .local v2, "schemaLocation":Ljava/lang/String;
    const-string v3, "schemaLanguage"

    invoke-virtual {p1, v3}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 164
    .local v1, "schemaLanguage":Ljava/lang/String;
    if-eqz v2, :cond_1c

    .line 165
    :try_start_12
    sget-object v3, Lorg/apache/commons/digester/parser/XercesParser;->JAXP_SCHEMA_LANGUAGE:Ljava/lang/String;

    invoke-virtual {p0, v3, v1}, Ljavax/xml/parsers/SAXParser;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 166
    const-string v3, "http://java.sun.com/xml/jaxp/properties/schemaSource"

    invoke-virtual {p0, v3, v2}, Ljavax/xml/parsers/SAXParser;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1c
    .catch Lorg/xml/sax/SAXNotRecognizedException; {:try_start_12 .. :try_end_1c} :catch_1d

    .line 173
    :cond_1c
    :goto_1c
    return-void

    .line 169
    :catch_1d
    move-exception v0

    .local v0, "e":Lorg/xml/sax/SAXNotRecognizedException;
    sget-object v3, Lorg/apache/commons/digester/parser/XercesParser;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Lorg/xml/sax/SAXNotRecognizedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " not supported."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    goto :goto_1c
.end method

.method private static configureXerces(Ljavax/xml/parsers/SAXParserFactory;)V
    .registers 3
    .param p0, "factory"    # Ljavax/xml/parsers/SAXParserFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXNotRecognizedException;,
            Lorg/xml/sax/SAXNotSupportedException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 191
    sget-object v0, Lorg/apache/commons/digester/parser/XercesParser;->XERCES_DYNAMIC:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljavax/xml/parsers/SAXParserFactory;->setFeature(Ljava/lang/String;Z)V

    .line 192
    sget-object v0, Lorg/apache/commons/digester/parser/XercesParser;->XERCES_SCHEMA:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljavax/xml/parsers/SAXParserFactory;->setFeature(Ljava/lang/String;Z)V

    .line 194
    return-void
.end method

.method private static getXercesVersion()Ljava/lang/String;
    .registers 6

    .prologue
    .line 99
    const-string v3, "1.0"

    .line 102
    .local v3, "versionNumber":Ljava/lang/String;
    :try_start_2
    const-string v4, "org.apache.xerces.impl.Version"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 105
    .local v2, "versionClass":Ljava/lang/Class;
    const-string v5, "getVersion"

    const/4 v4, 0x0

    check-cast v4, [Ljava/lang/Class;

    invoke-virtual {v2, v5, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 107
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v5, 0x0

    const/4 v4, 0x0

    check-cast v4, [Ljava/lang/Object;

    invoke-virtual {v0, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 108
    .local v1, "version":Ljava/lang/String;
    const-string v4, "Xerces-J"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const-string v5, "."

    invoke-virtual {v1, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2a} :catch_2c

    move-result-object v3

    .line 113
    .end local v0    # "method":Ljava/lang/reflect/Method;
    .end local v1    # "version":Ljava/lang/String;
    .end local v2    # "versionClass":Ljava/lang/Class;
    :goto_2b
    return-object v3

    .line 110
    :catch_2c
    move-exception v4

    goto :goto_2b
.end method

.method public static newSAXParser(Ljava/util/Properties;)Ljavax/xml/parsers/SAXParser;
    .registers 7
    .param p0, "properties"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;,
            Lorg/xml/sax/SAXNotSupportedException;
        }
    .end annotation

    .prologue
    .line 128
    const-string v2, "SAXParserFactory"

    invoke-virtual {p0, v2}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/xml/parsers/SAXParserFactory;

    .line 131
    .local v0, "factory":Ljavax/xml/parsers/SAXParserFactory;
    sget-object v2, Lorg/apache/commons/digester/parser/XercesParser;->versionNumber:Ljava/lang/String;

    if-nez v2, :cond_1f

    .line 132
    invoke-static {}, Lorg/apache/commons/digester/parser/XercesParser;->getXercesVersion()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/digester/parser/XercesParser;->versionNumber:Ljava/lang/String;

    .line 133
    new-instance v2, Ljava/lang/Float;

    sget-object v3, Lorg/apache/commons/digester/parser/XercesParser;->versionNumber:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/lang/Float;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    sput v2, Lorg/apache/commons/digester/parser/XercesParser;->version:F

    .line 137
    :cond_1f
    sget v2, Lorg/apache/commons/digester/parser/XercesParser;->version:F

    float-to-double v2, v2

    const-wide v4, 0x4000cccccccccccdL    # 2.1

    cmpl-double v2, v2, v4

    if-lez v2, :cond_33

    .line 139
    invoke-static {v0}, Lorg/apache/commons/digester/parser/XercesParser;->configureXerces(Ljavax/xml/parsers/SAXParserFactory;)V

    .line 140
    invoke-virtual {v0}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v1

    .line 144
    :goto_32
    return-object v1

    .line 142
    :cond_33
    invoke-virtual {v0}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v1

    .line 143
    .local v1, "parser":Ljavax/xml/parsers/SAXParser;
    invoke-static {v1, p0}, Lorg/apache/commons/digester/parser/XercesParser;->configureOldXerces(Ljavax/xml/parsers/SAXParser;Ljava/util/Properties;)V

    goto :goto_32
.end method
