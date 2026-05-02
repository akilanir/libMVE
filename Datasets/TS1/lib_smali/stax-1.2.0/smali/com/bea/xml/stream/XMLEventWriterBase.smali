.class public Lcom/bea/xml/stream/XMLEventWriterBase;
.super Ljava/lang/Object;
.source "XMLEventWriterBase.java"

# interfaces
.implements Ljavax/xml/stream/XMLEventWriter;
.implements Ljavax/xml/stream/util/XMLEventConsumer;


# instance fields
.field writer:Ljavax/xml/stream/XMLStreamWriter;


# direct methods
.method public constructor <init>(Ljavax/xml/stream/XMLStreamWriter;)V
    .registers 2
    .param p1, "writer"    # Ljavax/xml/stream/XMLStreamWriter;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    .line 53
    return-void
.end method

.method private addEndElement(Ljavax/xml/stream/events/EndElement;)V
    .registers 6
    .param p1, "ee"    # Ljavax/xml/stream/events/EndElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-interface {p1}, Ljavax/xml/stream/events/EndElement;->getName()Ljavax/xml/namespace/QName;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v2

    .line 90
    .local v2, "prefix":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/events/EndElement;->getName()Ljavax/xml/namespace/QName;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    .line 91
    .local v1, "namespace":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/events/EndElement;->getName()Ljavax/xml/namespace/QName;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "localName":Ljava/lang/String;
    iget-object v3, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v3}, Ljavax/xml/stream/XMLStreamWriter;->writeEndElement()V

    .line 93
    return-void
.end method

.method private addStartElement(Ljavax/xml/stream/events/StartElement;)V
    .registers 8
    .param p1, "se"    # Ljavax/xml/stream/events/StartElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 70
    invoke-interface {p1}, Ljavax/xml/stream/events/StartElement;->getName()Ljavax/xml/namespace/QName;

    move-result-object v5

    invoke-virtual {v5}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v4

    .line 71
    .local v4, "prefix":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/events/StartElement;->getName()Ljavax/xml/namespace/QName;

    move-result-object v5

    invoke-virtual {v5}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    .line 72
    .local v2, "namespace":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/events/StartElement;->getName()Ljavax/xml/namespace/QName;

    move-result-object v5

    invoke-virtual {v5}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v1

    .line 73
    .local v1, "localName":Ljava/lang/String;
    iget-object v5, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v5, v4, v1, v2}, Ljavax/xml/stream/XMLStreamWriter;->writeStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    invoke-interface {p1}, Ljavax/xml/stream/events/StartElement;->getNamespaces()Ljava/util/Iterator;

    move-result-object v3

    .line 75
    .local v3, "ni":Ljava/util/Iterator;
    :goto_21
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_31

    .line 76
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljavax/xml/stream/events/Namespace;

    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/XMLEventWriterBase;->writeNamespace(Ljavax/xml/stream/events/Namespace;)V

    goto :goto_21

    .line 79
    :cond_31
    invoke-interface {p1}, Ljavax/xml/stream/events/StartElement;->getAttributes()Ljava/util/Iterator;

    move-result-object v0

    .line 80
    .local v0, "ai":Ljava/util/Iterator;
    :goto_35
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_45

    .line 81
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljavax/xml/stream/events/Attribute;

    invoke-direct {p0, v5}, Lcom/bea/xml/stream/XMLEventWriterBase;->writeAttribute(Ljavax/xml/stream/events/Attribute;)V

    goto :goto_35

    .line 84
    :cond_45
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
    .line 252
    const-string v5, "javax.xml.stream.XMLInputFactory"

    const-string v6, "com.bea.xml.stream.MXParserFactory"

    invoke-static {v5, v6}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 254
    const-string v5, "javax.xml.stream.XMLEventFactory"

    const-string v6, "com.bea.xml.stream.EventFactory"

    invoke-static {v5, v6}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 257
    new-instance v3, Ljava/io/OutputStreamWriter;

    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct {v3, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 258
    .local v3, "w":Ljava/io/Writer;
    new-instance v4, Lcom/bea/xml/stream/XMLEventWriterBase;

    new-instance v5, Lcom/bea/xml/stream/XMLWriterBase;

    invoke-direct {v5, v3}, Lcom/bea/xml/stream/XMLWriterBase;-><init>(Ljava/io/Writer;)V

    invoke-direct {v4, v5}, Lcom/bea/xml/stream/XMLEventWriterBase;-><init>(Ljavax/xml/stream/XMLStreamWriter;)V

    .line 261
    .local v4, "writer":Lcom/bea/xml/stream/XMLEventWriterBase;
    new-instance v1, Lcom/bea/xml/stream/MXParser;

    invoke-direct {v1}, Lcom/bea/xml/stream/MXParser;-><init>()V

    .line 262
    .local v1, "parser":Lcom/bea/xml/stream/MXParser;
    new-instance v5, Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-direct {v5}, Lcom/bea/xml/stream/ConfigurationContextBase;-><init>()V

    invoke-virtual {v1, v5}, Lcom/bea/xml/stream/MXParser;->setConfigurationContext(Lcom/bea/xml/stream/ConfigurationContextBase;)V

    .line 263
    new-instance v5, Ljava/io/FileReader;

    const/4 v6, 0x0

    aget-object v6, p0, v6

    invoke-direct {v5, v6}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Lcom/bea/xml/stream/MXParser;->setInput(Ljava/io/Reader;)V

    .line 265
    new-instance v2, Lcom/bea/xml/stream/XMLEventReaderBase;

    invoke-direct {v2, v1}, Lcom/bea/xml/stream/XMLEventReaderBase;-><init>(Ljavax/xml/stream/XMLStreamReader;)V

    .line 267
    .local v2, "reader":Lcom/bea/xml/stream/XMLEventReaderBase;
    :goto_3c
    invoke-virtual {v2}, Lcom/bea/xml/stream/XMLEventReaderBase;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_68

    .line 268
    invoke-virtual {v2}, Lcom/bea/xml/stream/XMLEventReaderBase;->nextEvent()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v0

    .line 269
    .local v0, "e":Ljavax/xml/stream/events/XMLEvent;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "about to add:["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "];"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 270
    invoke-virtual {v4, v0}, Lcom/bea/xml/stream/XMLEventWriterBase;->add(Ljavax/xml/stream/events/XMLEvent;)V

    goto :goto_3c

    .line 272
    .end local v0    # "e":Ljavax/xml/stream/events/XMLEvent;
    :cond_68
    invoke-virtual {v4}, Lcom/bea/xml/stream/XMLEventWriterBase;->flush()V

    .line 273
    return-void
.end method

.method private writeAttribute(Ljavax/xml/stream/events/Attribute;)V
    .registers 6
    .param p1, "a"    # Ljavax/xml/stream/events/Attribute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 141
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/events/Attribute;->getName()Ljavax/xml/namespace/QName;

    move-result-object v1

    invoke-virtual {v1}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Ljavax/xml/stream/events/Attribute;->getName()Ljavax/xml/namespace/QName;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Ljavax/xml/stream/events/Attribute;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Ljavax/xml/stream/XMLStreamWriter;->writeAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    return-void
.end method


# virtual methods
.method public add(Ljavax/xml/stream/XMLEventReader;)V
    .registers 3
    .param p1, "stream"    # Ljavax/xml/stream/XMLEventReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 218
    :goto_0
    invoke-interface {p1}, Ljavax/xml/stream/XMLEventReader;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 219
    invoke-interface {p1}, Ljavax/xml/stream/XMLEventReader;->nextEvent()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLEventWriterBase;->add(Ljavax/xml/stream/events/XMLEvent;)V

    goto :goto_0

    .line 220
    :cond_e
    return-void
.end method

.method public add(Ljavax/xml/stream/events/XMLEvent;)V
    .registers 5
    .param p1, "e"    # Ljavax/xml/stream/events/XMLEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 175
    invoke-interface {p1}, Ljavax/xml/stream/events/XMLEvent;->getEventType()I

    move-result v0

    packed-switch v0, :pswitch_data_70

    .line 210
    :pswitch_7
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unable to add event["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p1}, Ljavax/xml/stream/events/XMLEvent;->getEventType()I

    move-result v2

    invoke-static {v2}, Lcom/bea/xml/stream/util/ElementTypeNames;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 177
    :pswitch_2e
    check-cast p1, Ljavax/xml/stream/events/StartElement;

    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/XMLEventWriterBase;->addStartElement(Ljavax/xml/stream/events/StartElement;)V

    .line 213
    :goto_33
    return-void

    .line 180
    .restart local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    :pswitch_34
    check-cast p1, Ljavax/xml/stream/events/EndElement;

    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/XMLEventWriterBase;->addEndElement(Ljavax/xml/stream/events/EndElement;)V

    goto :goto_33

    .line 183
    .restart local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    :pswitch_3a
    check-cast p1, Ljavax/xml/stream/events/Characters;

    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventWriterBase;->addCharacters(Ljavax/xml/stream/events/Characters;)V

    goto :goto_33

    .line 186
    .restart local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    :pswitch_40
    check-cast p1, Ljavax/xml/stream/events/EntityReference;

    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventWriterBase;->addEntityReference(Ljavax/xml/stream/events/EntityReference;)V

    goto :goto_33

    .line 189
    .restart local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    :pswitch_46
    check-cast p1, Ljavax/xml/stream/events/ProcessingInstruction;

    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventWriterBase;->addProcessingInstruction(Ljavax/xml/stream/events/ProcessingInstruction;)V

    goto :goto_33

    .line 192
    .restart local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    :pswitch_4c
    check-cast p1, Ljavax/xml/stream/events/Comment;

    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventWriterBase;->addComment(Ljavax/xml/stream/events/Comment;)V

    goto :goto_33

    .line 195
    .restart local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    :pswitch_52
    check-cast p1, Ljavax/xml/stream/events/StartDocument;

    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventWriterBase;->addStartDocument(Ljavax/xml/stream/events/StartDocument;)V

    goto :goto_33

    .line 198
    .restart local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    :pswitch_58
    check-cast p1, Ljavax/xml/stream/events/EndDocument;

    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventWriterBase;->addEndDocument(Ljavax/xml/stream/events/EndDocument;)V

    goto :goto_33

    .line 201
    .restart local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    :pswitch_5e
    check-cast p1, Ljavax/xml/stream/events/Attribute;

    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventWriterBase;->addAttribute(Ljavax/xml/stream/events/Attribute;)V

    goto :goto_33

    .line 204
    .restart local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    :pswitch_64
    check-cast p1, Ljavax/xml/stream/events/Namespace;

    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventWriterBase;->addNamespace(Ljavax/xml/stream/events/Namespace;)V

    goto :goto_33

    .line 207
    .restart local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    :pswitch_6a
    check-cast p1, Ljavax/xml/stream/events/DTD;

    .end local p1    # "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventWriterBase;->addDTD(Ljavax/xml/stream/events/DTD;)V

    goto :goto_33

    .line 175
    :pswitch_data_70
    .packed-switch 0x1
        :pswitch_2e
        :pswitch_34
        :pswitch_46
        :pswitch_3a
        :pswitch_4c
        :pswitch_7
        :pswitch_52
        :pswitch_58
        :pswitch_40
        :pswitch_5e
        :pswitch_6a
        :pswitch_7
        :pswitch_64
    .end packed-switch
.end method

.method public addAttribute(Ljavax/xml/stream/events/Attribute;)V
    .registers 2
    .param p1, "a"    # Ljavax/xml/stream/events/Attribute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 148
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/XMLEventWriterBase;->writeAttribute(Ljavax/xml/stream/events/Attribute;)V

    .line 149
    return-void
.end method

.method public addCharacters(Ljavax/xml/stream/events/Characters;)V
    .registers 4
    .param p1, "cd"    # Ljavax/xml/stream/events/Characters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 98
    invoke-interface {p1}, Ljavax/xml/stream/events/Characters;->isCData()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 99
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/events/Characters;->getData()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljavax/xml/stream/XMLStreamWriter;->writeCData(Ljava/lang/String;)V

    .line 102
    :goto_f
    return-void

    .line 101
    :cond_10
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/events/Characters;->getData()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljavax/xml/stream/XMLStreamWriter;->writeCharacters(Ljava/lang/String;)V

    goto :goto_f
.end method

.method public addComment(Ljavax/xml/stream/events/Comment;)V
    .registers 4
    .param p1, "c"    # Ljavax/xml/stream/events/Comment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/events/Comment;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljavax/xml/stream/XMLStreamWriter;->writeComment(Ljava/lang/String;)V

    .line 121
    return-void
.end method

.method public addDTD(Ljavax/xml/stream/events/DTD;)V
    .registers 4
    .param p1, "dtd"    # Ljavax/xml/stream/events/DTD;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 169
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/events/DTD;->getDocumentTypeDeclaration()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljavax/xml/stream/XMLStreamWriter;->writeDTD(Ljava/lang/String;)V

    .line 170
    return-void
.end method

.method public addEndDocument(Ljavax/xml/stream/events/EndDocument;)V
    .registers 2
    .param p1, "ed"    # Ljavax/xml/stream/events/EndDocument;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 136
    return-void
.end method

.method public addEntityReference(Ljavax/xml/stream/events/EntityReference;)V
    .registers 4
    .param p1, "er"    # Ljavax/xml/stream/events/EntityReference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 107
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/events/EntityReference;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljavax/xml/stream/XMLStreamWriter;->writeEntityRef(Ljava/lang/String;)V

    .line 108
    return-void
.end method

.method public addNamespace(Ljavax/xml/stream/events/Namespace;)V
    .registers 2
    .param p1, "ns"    # Ljavax/xml/stream/events/Namespace;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 163
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLEventWriterBase;->writeNamespace(Ljavax/xml/stream/events/Namespace;)V

    .line 164
    return-void
.end method

.method public addProcessingInstruction(Ljavax/xml/stream/events/ProcessingInstruction;)V
    .registers 5
    .param p1, "pi"    # Ljavax/xml/stream/events/ProcessingInstruction;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 113
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/events/ProcessingInstruction;->getTarget()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Ljavax/xml/stream/events/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljavax/xml/stream/XMLStreamWriter;->writeProcessingInstruction(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    return-void
.end method

.method public addStartDocument(Ljavax/xml/stream/events/StartDocument;)V
    .registers 6
    .param p1, "sd"    # Ljavax/xml/stream/events/StartDocument;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 126
    invoke-interface {p1}, Ljavax/xml/stream/events/StartDocument;->getCharacterEncodingScheme()Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, "encoding":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/events/StartDocument;->getVersion()Ljava/lang/String;

    move-result-object v2

    .line 128
    .local v2, "version":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/events/StartDocument;->isStandalone()Z

    move-result v1

    .line 129
    .local v1, "standalone":Z
    iget-object v3, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v3, v0, v2}, Ljavax/xml/stream/XMLStreamWriter;->writeStartDocument(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    return-void
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamWriter;->close()V

    .line 65
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 58
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamWriter;->flush()V

    .line 59
    return-void
.end method

.method public getNamespaceContext()Ljavax/xml/namespace/NamespaceContext;
    .registers 2

    .prologue
    .line 247
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamWriter;->getNamespaceContext()Ljavax/xml/namespace/NamespaceContext;

    move-result-object v0

    return-object v0
.end method

.method public getPrefix(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 225
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->getPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setDefaultNamespace(Ljava/lang/String;)V
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 237
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->setDefaultNamespace(Ljava/lang/String;)V

    .line 238
    return-void
.end method

.method public setNamespaceContext(Ljavax/xml/namespace/NamespaceContext;)V
    .registers 3
    .param p1, "context"    # Ljavax/xml/namespace/NamespaceContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 243
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->setNamespaceContext(Ljavax/xml/namespace/NamespaceContext;)V

    .line 244
    return-void
.end method

.method public setPrefix(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 231
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1, p2}, Ljavax/xml/stream/XMLStreamWriter;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    return-void
.end method

.method public writeNamespace(Ljavax/xml/stream/events/Namespace;)V
    .registers 5
    .param p1, "n"    # Ljavax/xml/stream/events/Namespace;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 154
    invoke-interface {p1}, Ljavax/xml/stream/events/Namespace;->isDefaultNamespaceDeclaration()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 155
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/events/Namespace;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljavax/xml/stream/XMLStreamWriter;->writeDefaultNamespace(Ljava/lang/String;)V

    .line 159
    :goto_f
    return-void

    .line 157
    :cond_10
    iget-object v0, p0, Lcom/bea/xml/stream/XMLEventWriterBase;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/events/Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Ljavax/xml/stream/events/Namespace;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljavax/xml/stream/XMLStreamWriter;->writeNamespace(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_f
.end method
