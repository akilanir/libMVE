.class public Lcom/bea/xml/stream/samples/AllocEventParser;
.super Ljava/lang/Object;
.source "AllocEventParser.java"


# static fields
.field private static filename:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    const/4 v0, 0x0

    sput-object v0, Lcom/bea/xml/stream/samples/AllocEventParser;->filename:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 8
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 23
    const/4 v4, 0x0

    :try_start_2
    aget-object v4, p0, v4

    sput-object v4, Lcom/bea/xml/stream/samples/AllocEventParser;->filename:Ljava/lang/String;
    :try_end_6
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_6} :catch_68

    .line 28
    :goto_6
    const-string v4, "javax.xml.stream.XMLInputFactory"

    const-string v5, "com.bea.xml.stream.MXParserFactory"

    invoke-static {v4, v5}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    const-string v4, "javax.xml.stream.XMLOutputFactory"

    const-string v5, "com.bea.xml.stream.XMLOutputFactoryBase"

    invoke-static {v4, v5}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 32
    const-string v4, "javax.xml.stream.XMLEventFactory"

    const-string v5, "com.bea.xml.stream.EventFactory"

    invoke-static {v4, v5}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 36
    invoke-static {}, Ljavax/xml/stream/XMLInputFactory;->newInstance()Ljavax/xml/stream/XMLInputFactory;

    move-result-object v2

    .line 37
    .local v2, "factory":Ljavax/xml/stream/XMLInputFactory;
    const-string v4, "javax.xml.stream.isReplacingEntityReferences"

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v4, v5}, Ljavax/xml/stream/XMLInputFactory;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 40
    new-instance v4, Ljava/io/FileReader;

    sget-object v5, Lcom/bea/xml/stream/samples/AllocEventParser;->filename:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Ljavax/xml/stream/XMLInputFactory;->createXMLEventReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLEventReader;

    move-result-object v3

    .line 42
    .local v3, "r":Ljavax/xml/stream/XMLEventReader;
    :goto_31
    invoke-interface {v3}, Ljavax/xml/stream/XMLEventReader;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_70

    .line 43
    invoke-interface {v3}, Ljavax/xml/stream/XMLEventReader;->nextEvent()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v1

    .line 44
    .local v1, "e":Ljavax/xml/stream/events/XMLEvent;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "ID:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_31

    .line 24
    .end local v1    # "e":Ljavax/xml/stream/events/XMLEvent;
    .end local v2    # "factory":Ljavax/xml/stream/XMLInputFactory;
    .end local v3    # "r":Ljavax/xml/stream/XMLEventReader;
    :catch_68
    move-exception v0

    .line 25
    .local v0, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    invoke-static {}, Lcom/bea/xml/stream/samples/AllocEventParser;->printUsage()V

    .line 26
    invoke-static {v5}, Ljava/lang/System;->exit(I)V

    goto :goto_6

    .line 46
    .end local v0    # "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v2    # "factory":Ljavax/xml/stream/XMLInputFactory;
    .restart local v3    # "r":Ljavax/xml/stream/XMLEventReader;
    :cond_70
    return-void
.end method

.method private static printUsage()V
    .registers 2

    .prologue
    .line 18
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "usage: java com.bea.xml.stream.samples.AllocEventParse <xmlfile>"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 19
    return-void
.end method
