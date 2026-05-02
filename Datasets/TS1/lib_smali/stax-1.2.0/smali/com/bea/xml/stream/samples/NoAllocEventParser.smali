.class public Lcom/bea/xml/stream/samples/NoAllocEventParser;
.super Ljava/lang/Object;
.source "NoAllocEventParser.java"


# static fields
.field private static filename:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    const/4 v0, 0x0

    sput-object v0, Lcom/bea/xml/stream/samples/NoAllocEventParser;->filename:Ljava/lang/String;

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
    .registers 9
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 23
    const/4 v5, 0x0

    :try_start_2
    aget-object v5, p0, v5

    sput-object v5, Lcom/bea/xml/stream/samples/NoAllocEventParser;->filename:Ljava/lang/String;
    :try_end_6
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_6} :catch_62

    .line 28
    :goto_6
    const-string v5, "javax.xml.stream.XMLInputFactory"

    const-string v6, "com.bea.xml.stream.MXParserFactory"

    invoke-static {v5, v6}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    const-string v5, "javax.xml.stream.XMLEventFactory"

    const-string v6, "com.bea.xml.stream.EventFactory"

    invoke-static {v5, v6}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    invoke-static {}, Ljavax/xml/stream/XMLInputFactory;->newInstance()Ljavax/xml/stream/XMLInputFactory;

    move-result-object v3

    .line 34
    .local v3, "factory":Ljavax/xml/stream/XMLInputFactory;
    new-instance v1, Lcom/bea/xml/stream/StaticAllocator;

    invoke-direct {v1}, Lcom/bea/xml/stream/StaticAllocator;-><init>()V

    .line 35
    .local v1, "allocator":Ljavax/xml/stream/util/XMLEventAllocator;
    invoke-virtual {v3, v1}, Ljavax/xml/stream/XMLInputFactory;->setEventAllocator(Ljavax/xml/stream/util/XMLEventAllocator;)V

    .line 36
    new-instance v5, Ljava/io/FileReader;

    sget-object v6, Lcom/bea/xml/stream/samples/NoAllocEventParser;->filename:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Ljavax/xml/stream/XMLInputFactory;->createXMLEventReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLEventReader;

    move-result-object v4

    .line 38
    .local v4, "r":Ljavax/xml/stream/XMLEventReader;
    :goto_2b
    invoke-interface {v4}, Ljavax/xml/stream/XMLEventReader;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6a

    .line 39
    invoke-interface {v4}, Ljavax/xml/stream/XMLEventReader;->nextEvent()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v2

    .line 40
    .local v2, "e":Ljavax/xml/stream/events/XMLEvent;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "ID:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2b

    .line 24
    .end local v1    # "allocator":Ljavax/xml/stream/util/XMLEventAllocator;
    .end local v2    # "e":Ljavax/xml/stream/events/XMLEvent;
    .end local v3    # "factory":Ljavax/xml/stream/XMLInputFactory;
    .end local v4    # "r":Ljavax/xml/stream/XMLEventReader;
    :catch_62
    move-exception v0

    .line 25
    .local v0, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    invoke-static {}, Lcom/bea/xml/stream/samples/NoAllocEventParser;->printUsage()V

    .line 26
    invoke-static {v6}, Ljava/lang/System;->exit(I)V

    goto :goto_6

    .line 42
    .end local v0    # "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v1    # "allocator":Ljavax/xml/stream/util/XMLEventAllocator;
    .restart local v3    # "factory":Ljavax/xml/stream/XMLInputFactory;
    .restart local v4    # "r":Ljavax/xml/stream/XMLEventReader;
    :cond_6a
    return-void
.end method

.method private static printUsage()V
    .registers 2

    .prologue
    .line 18
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "usage: java com.bea.xml.stream.samples.EventParse <xmlfile>"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 19
    return-void
.end method
