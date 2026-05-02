.class public Lcom/bea/xml/stream/samples/EventWrite;
.super Ljava/lang/Object;
.source "EventWrite.java"


# static fields
.field private static filename:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 14
    const/4 v0, 0x0

    sput-object v0, Lcom/bea/xml/stream/samples/EventWrite;->filename:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
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
    const/4 v6, 0x0

    .line 22
    const/4 v5, 0x0

    :try_start_2
    aget-object v5, p0, v5

    sput-object v5, Lcom/bea/xml/stream/samples/EventWrite;->filename:Ljava/lang/String;
    :try_end_6
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_6} :catch_42

    .line 28
    :goto_6
    const-string v5, "javax.xml.stream.XMLInputFactory"

    const-string v6, "com.bea.xml.stream.MXParserFactory"

    invoke-static {v5, v6}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    const-string v5, "javax.xml.stream.XMLOutputFactory"

    const-string v6, "com.bea.xml.stream.XMLOutputFactoryBase"

    invoke-static {v5, v6}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 32
    const-string v5, "javax.xml.stream.XMLEventFactory"

    const-string v6, "com.bea.xml.stream.EventFactory"

    invoke-static {v5, v6}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 35
    invoke-static {}, Ljavax/xml/stream/XMLInputFactory;->newInstance()Ljavax/xml/stream/XMLInputFactory;

    move-result-object v1

    .line 36
    .local v1, "xmlif":Ljavax/xml/stream/XMLInputFactory;
    invoke-static {}, Ljavax/xml/stream/XMLOutputFactory;->newInstance()Ljavax/xml/stream/XMLOutputFactory;

    move-result-object v2

    .line 37
    .local v2, "xmlof":Ljavax/xml/stream/XMLOutputFactory;
    const-string v5, "javax.xml.stream.isReplacingEntityReferences"

    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v5, v6}, Ljavax/xml/stream/XMLInputFactory;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 41
    new-instance v5, Ljava/io/FileReader;

    sget-object v6, Lcom/bea/xml/stream/samples/EventWrite;->filename:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljavax/xml/stream/XMLInputFactory;->createXMLEventReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLEventReader;

    move-result-object v3

    .line 42
    .local v3, "xmlr":Ljavax/xml/stream/XMLEventReader;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, v5}, Ljavax/xml/stream/XMLOutputFactory;->createXMLEventWriter(Ljava/io/OutputStream;)Ljavax/xml/stream/XMLEventWriter;

    move-result-object v4

    .line 44
    .local v4, "xmlw":Ljavax/xml/stream/XMLEventWriter;
    invoke-interface {v4, v3}, Ljavax/xml/stream/XMLEventWriter;->add(Ljavax/xml/stream/XMLEventReader;)V

    .line 45
    invoke-interface {v4}, Ljavax/xml/stream/XMLEventWriter;->flush()V

    .line 46
    return-void

    .line 23
    .end local v1    # "xmlif":Ljavax/xml/stream/XMLInputFactory;
    .end local v2    # "xmlof":Ljavax/xml/stream/XMLOutputFactory;
    .end local v3    # "xmlr":Ljavax/xml/stream/XMLEventReader;
    .end local v4    # "xmlw":Ljavax/xml/stream/XMLEventWriter;
    :catch_42
    move-exception v0

    .line 24
    .local v0, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    invoke-static {}, Lcom/bea/xml/stream/samples/EventWrite;->printUsage()V

    .line 25
    invoke-static {v6}, Ljava/lang/System;->exit(I)V

    goto :goto_6
.end method

.method private static printUsage()V
    .registers 2

    .prologue
    .line 17
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "usage: java com.bea.xml.stream.samples.EventWrite <xmlfile>"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 18
    return-void
.end method
