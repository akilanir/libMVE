.class public Lcom/bea/xml/stream/samples/EventParse;
.super Ljava/lang/Object;
.source "EventParse.java"


# static fields
.field private static filename:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    const/4 v0, 0x0

    sput-object v0, Lcom/bea/xml/stream/samples/EventParse;->filename:Ljava/lang/String;

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
    .line 48
    invoke-static {p0}, Lcom/bea/xml/stream/util/ElementTypeNames;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static main([Ljava/lang/String;)V
    .registers 7
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 23
    const/4 v3, 0x0

    :try_start_2
    aget-object v3, p0, v3

    sput-object v3, Lcom/bea/xml/stream/samples/EventParse;->filename:Ljava/lang/String;
    :try_end_6
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_6} :catch_66

    .line 29
    :goto_6
    const-string v3, "javax.xml.stream.XMLInputFactory"

    const-string v4, "com.bea.xml.stream.MXParserFactory"

    invoke-static {v3, v4}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 32
    invoke-static {}, Ljavax/xml/stream/XMLInputFactory;->newInstance()Ljavax/xml/stream/XMLInputFactory;

    move-result-object v1

    .line 33
    .local v1, "xmlif":Ljavax/xml/stream/XMLInputFactory;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "FACTORY: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 35
    const-string v3, "javax.xml.stream.isReplacingEntityReferences"

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v3, v4}, Ljavax/xml/stream/XMLInputFactory;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 38
    new-instance v3, Ljava/io/FileReader;

    sget-object v4, Lcom/bea/xml/stream/samples/EventParse;->filename:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljavax/xml/stream/XMLInputFactory;->createXMLStreamReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v2

    .line 39
    .local v2, "xmlr":Ljavax/xml/stream/XMLStreamReader;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "READER:  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 41
    :goto_59
    invoke-interface {v2}, Ljavax/xml/stream/XMLStreamReader;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6e

    .line 42
    invoke-static {v2}, Lcom/bea/xml/stream/samples/EventParse;->printEvent(Ljavax/xml/stream/XMLStreamReader;)V

    .line 43
    invoke-interface {v2}, Ljavax/xml/stream/XMLStreamReader;->next()I

    goto :goto_59

    .line 24
    .end local v1    # "xmlif":Ljavax/xml/stream/XMLInputFactory;
    .end local v2    # "xmlr":Ljavax/xml/stream/XMLStreamReader;
    :catch_66
    move-exception v0

    .line 25
    .local v0, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    invoke-static {}, Lcom/bea/xml/stream/samples/EventParse;->printUsage()V

    .line 26
    invoke-static {v4}, Ljava/lang/System;->exit(I)V

    goto :goto_6

    .line 45
    .end local v0    # "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v1    # "xmlif":Ljavax/xml/stream/XMLInputFactory;
    .restart local v2    # "xmlr":Ljavax/xml/stream/XMLStreamReader;
    :cond_6e
    return-void
.end method

.method private static printAttribute(Ljavax/xml/stream/events/Attribute;)V
    .registers 4
    .param p0, "a"    # Ljavax/xml/stream/events/Attribute;

    .prologue
    .line 159
    invoke-interface {p0}, Ljavax/xml/stream/events/Attribute;->getName()Ljavax/xml/namespace/QName;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Ljavax/xml/stream/events/Attribute;->getName()Ljavax/xml/namespace/QName;

    move-result-object v1

    invoke-virtual {v1}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Attribute;->getName()Ljavax/xml/namespace/QName;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/bea/xml/stream/samples/EventParse;->printName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Attribute;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method private static printAttributes(Ljavax/xml/stream/XMLStreamReader;)V
    .registers 5
    .param p0, "xmlr"    # Ljavax/xml/stream/XMLStreamReader;

    .prologue
    .line 148
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getAttributeCount()I

    move-result v2

    if-lez v2, :cond_21

    .line 149
    invoke-static {p0}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->getAttributes(Ljavax/xml/stream/XMLStreamReader;)Ljava/util/Iterator;

    move-result-object v1

    .line 150
    .local v1, "ai":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    .line 151
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 152
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/xml/stream/events/Attribute;

    .line 153
    .local v0, "a":Ljavax/xml/stream/events/Attribute;
    invoke-static {v0}, Lcom/bea/xml/stream/samples/EventParse;->printAttribute(Ljavax/xml/stream/events/Attribute;)V

    goto :goto_a

    .line 156
    .end local v0    # "a":Ljavax/xml/stream/events/Attribute;
    .end local v1    # "ai":Ljava/util/Iterator;
    :cond_21
    return-void
.end method

.method private static printEvent(Ljavax/xml/stream/XMLStreamReader;)V
    .registers 6
    .param p0, "xmlr"    # Ljavax/xml/stream/XMLStreamReader;

    .prologue
    .line 52
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "EVENT:["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v4

    invoke-interface {v4}, Ljavax/xml/stream/Location;->getLineNumber()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "]["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getLocation()Ljavax/xml/stream/Location;

    move-result-object v4

    invoke-interface {v4}, Ljavax/xml/stream/Location;->getColumnNumber()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "] "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 54
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getEventType()I

    move-result v3

    invoke-static {v3}, Lcom/bea/xml/stream/samples/EventParse;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 55
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, " ["

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 56
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getEventType()I

    move-result v2

    packed-switch v2, :pswitch_data_1b2

    .line 115
    :cond_53
    :goto_53
    :pswitch_53
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 116
    return-void

    .line 58
    :pswitch_5b
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "<"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 59
    invoke-static {p0}, Lcom/bea/xml/stream/samples/EventParse;->printName(Ljavax/xml/stream/XMLStreamReader;)V

    .line 60
    invoke-static {p0}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->getNamespaces(Ljavax/xml/stream/XMLStreamReader;)Ljava/util/Iterator;

    move-result-object v2

    invoke-static {v2}, Lcom/bea/xml/stream/samples/EventParse;->printNamespaces(Ljava/util/Iterator;)V

    .line 61
    invoke-static {p0}, Lcom/bea/xml/stream/samples/EventParse;->printAttributes(Ljavax/xml/stream/XMLStreamReader;)V

    .line 62
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, ">"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_53

    .line 65
    :pswitch_77
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "</"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 66
    invoke-static {p0}, Lcom/bea/xml/stream/samples/EventParse;->printName(Ljavax/xml/stream/XMLStreamReader;)V

    .line 67
    invoke-static {p0}, Lcom/bea/xml/stream/XMLEventAllocatorBase;->getNamespaces(Ljavax/xml/stream/XMLStreamReader;)Ljava/util/Iterator;

    move-result-object v2

    invoke-static {v2}, Lcom/bea/xml/stream/samples/EventParse;->printNamespaces(Ljava/util/Iterator;)V

    .line 68
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, ">"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_53

    .line 73
    :pswitch_90
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getTextStart()I

    move-result v1

    .line 74
    .local v1, "start":I
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getTextLength()I

    move-result v0

    .line 75
    .local v0, "length":I
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/String;

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getTextCharacters()[C

    move-result-object v4

    invoke-direct {v3, v4, v1, v0}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_53

    .line 80
    .end local v0    # "length":I
    .end local v1    # "start":I
    :pswitch_a7
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "<?"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 81
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->hasText()Z

    move-result v2

    if-eqz v2, :cond_bd

    .line 82
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 83
    :cond_bd
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "?>"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_53

    .line 86
    :pswitch_c5
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "<![CDATA["

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 87
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->hasText()Z

    move-result v2

    if-eqz v2, :cond_db

    .line 88
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 89
    :cond_db
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "]]>"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_53

    .line 93
    :pswitch_e4
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "<!--"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 94
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->hasText()Z

    move-result v2

    if-eqz v2, :cond_fa

    .line 95
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 96
    :cond_fa
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "-->"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_53

    .line 99
    :pswitch_103
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 100
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->hasText()Z

    move-result v2

    if-eqz v2, :cond_53

    .line 101
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_53

    .line 104
    :pswitch_149
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "<?xml"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 105
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, " version=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 106
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, " encoding=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getCharacterEncodingScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 107
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->isStandalone()Z

    move-result v2

    if-eqz v2, :cond_1aa

    .line 108
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, " standalone=\'yes\'"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 111
    :goto_1a1
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "?>"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_53

    .line 110
    :cond_1aa
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, " standalone=\'no\'"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_1a1

    .line 56
    :pswitch_data_1b2
    .packed-switch 0x1
        :pswitch_5b
        :pswitch_77
        :pswitch_a7
        :pswitch_90
        :pswitch_e4
        :pswitch_90
        :pswitch_149
        :pswitch_53
        :pswitch_103
        :pswitch_53
        :pswitch_53
        :pswitch_c5
    .end packed-switch
.end method

.method private static printEventType(I)V
    .registers 4
    .param p0, "eventType"    # I

    .prologue
    .line 118
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

    .line 119
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lcom/bea/xml/stream/samples/EventParse;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 120
    return-void
.end method

.method private static printName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;

    .prologue
    .line 134
    if-eqz p1, :cond_28

    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "[\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\']:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 135
    :cond_28
    if-eqz p0, :cond_42

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 136
    :cond_42
    if-eqz p2, :cond_49

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 137
    :cond_49
    return-void
.end method

.method private static printName(Ljavax/xml/stream/XMLStreamReader;)V
    .registers 5
    .param p0, "xmlr"    # Ljavax/xml/stream/XMLStreamReader;

    .prologue
    .line 123
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->hasName()Z

    move-result v3

    if-eqz v3, :cond_15

    .line 124
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getPrefix()Ljava/lang/String;

    move-result-object v1

    .line 125
    .local v1, "prefix":Ljava/lang/String;
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    .line 126
    .local v2, "uri":Ljava/lang/String;
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, "localName":Ljava/lang/String;
    invoke-static {v1, v2, v0}, Lcom/bea/xml/stream/samples/EventParse;->printName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .end local v0    # "localName":Ljava/lang/String;
    .end local v1    # "prefix":Ljava/lang/String;
    .end local v2    # "uri":Ljava/lang/String;
    :cond_15
    return-void
.end method

.method private static printNamespace(Ljavax/xml/stream/events/Namespace;)V
    .registers 4
    .param p0, "n"    # Ljavax/xml/stream/events/Namespace;

    .prologue
    .line 173
    invoke-interface {p0}, Ljavax/xml/stream/events/Namespace;->isDefaultNamespaceDeclaration()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 174
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "xmlns=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Namespace;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 177
    :goto_28
    return-void

    .line 176
    :cond_29
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "xmlns:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p0}, Ljavax/xml/stream/events/Namespace;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_28
.end method

.method private static printNamespaces(Ljava/util/Iterator;)V
    .registers 4
    .param p0, "ni"    # Ljava/util/Iterator;

    .prologue
    .line 165
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 166
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 167
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/xml/stream/events/Namespace;

    .line 168
    .local v0, "n":Ljavax/xml/stream/events/Namespace;
    invoke-static {v0}, Lcom/bea/xml/stream/samples/EventParse;->printNamespace(Ljavax/xml/stream/events/Namespace;)V

    goto :goto_0

    .line 170
    .end local v0    # "n":Ljavax/xml/stream/events/Namespace;
    :cond_17
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

.method private static printValue(Ljavax/xml/stream/XMLStreamReader;)V
    .registers 4
    .param p0, "xmlr"    # Ljavax/xml/stream/XMLStreamReader;

    .prologue
    .line 140
    invoke-interface {p0}, Ljavax/xml/stream/XMLStreamReader;->hasText()Z

    move-result v0

    if-eqz v0, :cond_23

    .line 141
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

    .line 145
    :goto_22
    return-void

    .line 143
    :cond_23
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "HAS NO VALUE"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_22
.end method
