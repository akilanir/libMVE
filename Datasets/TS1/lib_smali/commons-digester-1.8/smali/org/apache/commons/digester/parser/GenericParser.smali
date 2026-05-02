.class public Lorg/apache/commons/digester/parser/GenericParser;
.super Ljava/lang/Object;
.source "GenericParser.java"


# static fields
.field protected static JAXP_SCHEMA_LANGUAGE:Ljava/lang/String; = null

.field private static final JAXP_SCHEMA_SOURCE:Ljava/lang/String; = "http://java.sun.com/xml/jaxp/properties/schemaSource"

.field protected static log:Lorg/apache/commons/logging/Log;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    const-string v0, "org.apache.commons.digester.Digester.sax"

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/String;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/digester/parser/GenericParser;->log:Lorg/apache/commons/logging/Log;

    .line 56
    const-string v0, "http://java.sun.com/xml/jaxp/properties/schemaLanguage"

    sput-object v0, Lorg/apache/commons/digester/parser/GenericParser;->JAXP_SCHEMA_LANGUAGE:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newSAXParser(Ljava/util/Properties;)Ljavax/xml/parsers/SAXParser;
    .registers 9
    .param p0, "properties"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;,
            Lorg/xml/sax/SAXNotRecognizedException;
        }
    .end annotation

    .prologue
    .line 69
    const-string v5, "SAXParserFactory"

    invoke-virtual {p0, v5}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/xml/parsers/SAXParserFactory;

    .line 71
    .local v1, "factory":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v2

    .line 72
    .local v2, "parser":Ljavax/xml/parsers/SAXParser;
    const-string v5, "schemaLocation"

    invoke-virtual {p0, v5}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 73
    .local v4, "schemaLocation":Ljava/lang/String;
    const-string v5, "schemaLanguage"

    invoke-virtual {p0, v5}, Ljava/util/Properties;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 76
    .local v3, "schemaLanguage":Ljava/lang/String;
    if-eqz v4, :cond_28

    .line 77
    :try_start_1e
    sget-object v5, Lorg/apache/commons/digester/parser/GenericParser;->JAXP_SCHEMA_LANGUAGE:Ljava/lang/String;

    invoke-virtual {v2, v5, v3}, Ljavax/xml/parsers/SAXParser;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 78
    const-string v5, "http://java.sun.com/xml/jaxp/properties/schemaSource"

    invoke-virtual {v2, v5, v4}, Ljavax/xml/parsers/SAXParser;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_28
    .catch Lorg/xml/sax/SAXNotRecognizedException; {:try_start_1e .. :try_end_28} :catch_29

    .line 84
    :cond_28
    :goto_28
    return-object v2

    .line 81
    :catch_29
    move-exception v0

    .local v0, "e":Lorg/xml/sax/SAXNotRecognizedException;
    sget-object v5, Lorg/apache/commons/digester/parser/GenericParser;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v0}, Lorg/xml/sax/SAXNotRecognizedException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " not supported."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    goto :goto_28
.end method
