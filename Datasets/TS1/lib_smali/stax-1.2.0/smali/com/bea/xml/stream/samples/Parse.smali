.class public Lcom/bea/xml/stream/samples/Parse;
.super Ljava/lang/Object;
.source "Parse.java"


# static fields
.field private static filename:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    const/4 v0, 0x0

    sput-object v0, Lcom/bea/xml/stream/samples/Parse;->filename:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getEventTypeString(I)Ljava/lang/String;
    .registers 2
    .param p0, "eventType"    # I

    .prologue
    .line 62
    invoke-static {p0}, Lcom/bea/xml/stream/util/ElementTypeNames;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
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

    .line 24
    const/4 v4, 0x0

    :try_start_2
    aget-object v4, p0, v4

    sput-object v4, Lcom/bea/xml/stream/samples/Parse;->filename:Ljava/lang/String;
    :try_end_6
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_6} :catch_94

    .line 30
    :goto_6
    const-string v4, "javax.xml.stream.XMLInputFactory"

    const-string v5, "com.bea.xml.stream.MXParserFactory"

    invoke-static {v4, v5}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    invoke-static {}, Ljavax/xml/stream/XMLInputFactory;->newInstance()Ljavax/xml/stream/XMLInputFactory;

    move-result-object v2

    .line 34
    .local v2, "xmlif":Ljavax/xml/stream/XMLInputFactory;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "FACTORY: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 36
    new-instance v4, Ljava/io/FileReader;

    sget-object v5, Lcom/bea/xml/stream/samples/Parse;->filename:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Ljavax/xml/stream/XMLInputFactory;->createXMLStreamReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v3

    .line 37
    .local v3, "xmlr":Ljavax/xml/stream/XMLStreamReader;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "READER:  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 39
    invoke-interface {v3}, Ljavax/xml/stream/XMLStreamReader;->getEventType()I

    move-result v1

    .line 40
    .local v1, "eventType":I
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "PARSER STATE BEFORE FIRST next(): "

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 41
    invoke-static {v1}, Lcom/bea/xml/stream/samples/Parse;->printEventType(I)V

    .line 42
    invoke-static {v3}, Lcom/bea/xml/stream/samples/Parse;->printName(Ljavax/xml/stream/XMLStreamReader;)V

    .line 43
    invoke-static {v3}, Lcom/bea/xml/stream/samples/Parse;->printValue(Ljavax/xml/stream/XMLStreamReader;)V

    .line 44
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "-----------------------------"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 46
    :goto_6d
    invoke-interface {v3}, Ljavax/xml/stream/XMLStreamReader;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9d

    .line 47
    invoke-interface {v3}, Ljavax/xml/stream/XMLStreamReader;->next()I

    move-result v1

    .line 48
    invoke-static {v1}, Lcom/bea/xml/stream/samples/Parse;->printEventType(I)V

    .line 49
    invoke-static {v3}, Lcom/bea/xml/stream/samples/Parse;->printName(Ljavax/xml/stream/XMLStreamReader;)V

    .line 50
    invoke-static {v3}, Lcom/bea/xml/stream/samples/Parse;->printValue(Ljavax/xml/stream/XMLStreamReader;)V

    .line 51
    invoke-interface {v3}, Ljavax/xml/stream/XMLStreamReader;->isStartElement()Z

    move-result v4

    if-eqz v4, :cond_8c

    .line 52
    invoke-static {v3}, Lcom/bea/xml/stream/samples/Parse;->printAttributes(Ljavax/xml/stream/XMLStreamReader;)V

    .line 53
    invoke-static {v3}, Lcom/bea/xml/stream/samples/Parse;->printNamespaces(Ljavax/xml/stream/XMLStreamReader;)V

    .line 55
    :cond_8c
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "-----------------------------"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_6d

    .line 25
    .end local v1    # "eventType":I
    .end local v2    # "xmlif":Ljavax/xml/stream/XMLInputFactory;
    .end local v3    # "xmlr":Ljavax/xml/stream/XMLStreamReader;
    :catch_94
    move-exception v0

    .line 26
    .local v0, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    invoke-static {}, Lcom/bea/xml/stream/samples/Parse;->printUsage()V

    .line 27
    invoke-static {v5}, Ljava/lang/System;->exit(I)V

    goto/16 :goto_6

    .line 59
    .end local v0    # "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v1    # "eventType":I
    .restart local v2    # "xmlif":Ljavax/xml/stream/XMLInputFactory;
    .restart local v3    # "xmlr":Ljavax/xml/stream/XMLStreamReader;
    :cond_9d
    return-void
.end method

.method private static printAttribute(Ljavax/xml/stream/events/Attribute;)V
    .registers 4
    .param p0, "a"    # Ljavax/xml/stream/events/Attribute;

    .prologue
    .line 102
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "PREFIX: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Attribute;->getName()Ljavax/xml/namespace/QName;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 103
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "NAMESP: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Attribute;->getName()Ljavax/xml/namespace/QName;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 104
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "NAME:   "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Attribute;->getName()Ljavax/xml/namespace/QName;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 105
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "VALUE:  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Attribute;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 106
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "TYPE:   "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Attribute;->getDTDType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method private static printAttributes(Ljavax/xml/stream/XMLStreamReader;)V
    .registers 5
    .param p0, "xmlr"    # Ljavax/xml/stream/XMLStreamReader;

    .prologue
    .line 87
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getAttributeCount()I

    move-result v2

    if-lez v2, :cond_28

    .line 88
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "\nHAS ATTRIBUTES: "

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 89
    invoke-static {p0}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->getAttributes(Ljavax/xml/stream/XMLStreamReader;)Ljava/util/Iterator;

    move-result-object v1

    .line 91
    .local v1, "ai":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 92
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/xml/stream/events/Attribute;

    .line 93
    .local v0, "a":Ljavax/xml/stream/events/Attribute;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 94
    invoke-static {v0}, Lcom/bea/xml/stream/samples/Parse;->printAttribute(Ljavax/xml/stream/events/Attribute;)V

    goto :goto_11

    .line 97
    .end local v0    # "a":Ljavax/xml/stream/events/Attribute;
    .end local v1    # "ai":Ljava/util/Iterator;
    :cond_28
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "HAS NO ATTRIBUTES"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 99
    :cond_2f
    return-void
.end method

.method private static printEventType(I)V
    .registers 4
    .param p0, "eventType"    # I

    .prologue
    .line 66
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "EVENT TYPE("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "):"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 67
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lcom/bea/xml/stream/samples/Parse;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method private static printName(Ljavax/xml/stream/XMLStreamReader;)V
    .registers 4
    .param p0, "xmlr"    # Ljavax/xml/stream/XMLStreamReader;

    .prologue
    .line 71
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->hasName()Z

    move-result v0

    if-eqz v0, :cond_23

    .line 72
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "HAS NAME: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 76
    :goto_22
    return-void

    .line 74
    :cond_23
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "HAS NO NAME"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_22
.end method

.method private static printNamespace(Ljavax/xml/stream/events/Namespace;)V
    .registers 4
    .param p0, "a"    # Ljavax/xml/stream/events/Namespace;

    .prologue
    .line 125
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "PREFIX: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Namespace;->getName()Ljavax/xml/namespace/QName;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 126
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "NAMESP: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Namespace;->getName()Ljavax/xml/namespace/QName;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 127
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "NAME:   "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Namespace;->getName()Ljavax/xml/namespace/QName;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 128
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "VALUE:  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Namespace;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 129
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "TYPE:   "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Namespace;->getDTDType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 130
    return-void
.end method

.method private static printNamespaces(Ljavax/xml/stream/XMLStreamReader;)V
    .registers 5
    .param p0, "xmlr"    # Ljavax/xml/stream/XMLStreamReader;

    .prologue
    .line 110
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceCount()I

    move-result v2

    if-lez v2, :cond_28

    .line 111
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "\nHAS NAMESPACES: "

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 112
    invoke-static {p0}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->getNamespaces(Ljavax/xml/stream/XMLStreamReader;)Ljava/util/Iterator;

    move-result-object v1

    .line 114
    .local v1, "ni":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 115
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/xml/stream/events/Namespace;

    .line 116
    .local v0, "n":Ljavax/xml/stream/events/Namespace;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 117
    invoke-static {v0}, Lcom/bea/xml/stream/samples/Parse;->printNamespace(Ljavax/xml/stream/events/Namespace;)V

    goto :goto_11

    .line 120
    .end local v0    # "n":Ljavax/xml/stream/events/Namespace;
    .end local v1    # "ni":Ljava/util/Iterator;
    :cond_28
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "HAS NO NAMESPACES"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 122
    :cond_2f
    return-void
.end method

.method private static printUsage()V
    .registers 2

    .prologue
    .line 18
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "usage: java com.bea.xml.stream.samples.Parse <xmlfile>"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 19
    return-void
.end method

.method private static printValue(Ljavax/xml/stream/XMLStreamReader;)V
    .registers 4
    .param p0, "xmlr"    # Ljavax/xml/stream/XMLStreamReader;

    .prologue
    .line 79
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->hasText()Z

    move-result v0

    if-eqz v0, :cond_23

    .line 80
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "HAS VALUE: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 84
    :goto_22
    return-void

    .line 82
    :cond_23
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "HAS NO VALUE"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_22
.end method
