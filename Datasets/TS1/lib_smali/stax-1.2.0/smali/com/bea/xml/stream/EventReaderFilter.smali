.class public Lcom/bea/xml/stream/EventReaderFilter;
.super Ljava/lang/Object;
.source "EventReaderFilter.java"

# interfaces
.implements Ljavax/xml/stream/XMLEventReader;


# instance fields
.field private filter:Ljavax/xml/stream/EventFilter;

.field private parent:Ljavax/xml/stream/XMLEventReader;


# direct methods
.method public constructor <init>(Ljavax/xml/stream/XMLEventReader;)V
    .registers 2
    .param p1, "reader"    # Ljavax/xml/stream/XMLEventReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/bea/xml/stream/EventReaderFilter;->parent:Ljavax/xml/stream/XMLEventReader;

    .line 38
    return-void
.end method

.method public constructor <init>(Ljavax/xml/stream/XMLEventReader;Ljavax/xml/stream/EventFilter;)V
    .registers 3
    .param p1, "reader"    # Ljavax/xml/stream/XMLEventReader;
    .param p2, "filter"    # Ljavax/xml/stream/EventFilter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/bea/xml/stream/EventReaderFilter;->parent:Ljavax/xml/stream/XMLEventReader;

    .line 44
    iput-object p2, p0, Lcom/bea/xml/stream/EventReaderFilter;->filter:Ljavax/xml/stream/EventFilter;

    .line 45
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 6
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 137
    const-string v3, "javax.xml.stream.XMLInputFactory"

    const-string v4, "com.bea.xml.stream.MXParserFactory"

    invoke-static {v3, v4}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 139
    const-string v3, "javax.xml.stream.XMLEventFactory"

    const-string v4, "com.bea.xml.stream.EventFactory"

    invoke-static {v3, v4}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 155
    invoke-static {}, Ljavax/xml/stream/XMLInputFactory;->newInstance()Ljavax/xml/stream/XMLInputFactory;

    move-result-object v1

    .line 157
    .local v1, "factory":Ljavax/xml/stream/XMLInputFactory;
    new-instance v0, Lcom/bea/xml/stream/filters/TypeFilter;

    invoke-direct {v0}, Lcom/bea/xml/stream/filters/TypeFilter;-><init>()V

    .line 158
    .local v0, "f":Lcom/bea/xml/stream/filters/TypeFilter;
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/bea/xml/stream/filters/TypeFilter;->addType(I)V

    .line 159
    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Lcom/bea/xml/stream/filters/TypeFilter;->addType(I)V

    .line 162
    new-instance v3, Ljava/io/FileReader;

    const/4 v4, 0x0

    aget-object v4, p0, v4

    invoke-direct {v3, v4}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljavax/xml/stream/XMLInputFactory;->createXMLEventReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLEventReader;

    move-result-object v3

    invoke-virtual {v1, v3, v0}, Ljavax/xml/stream/XMLInputFactory;->createFilteredReader(Ljavax/xml/stream/XMLEventReader;Ljavax/xml/stream/EventFilter;)Ljavax/xml/stream/XMLEventReader;

    move-result-object v2

    .line 166
    .local v2, "reader":Ljavax/xml/stream/XMLEventReader;
    :goto_2f
    invoke-interface {v2}, Ljavax/xml/stream/XMLEventReader;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3f

    .line 167
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-interface {v2}, Ljavax/xml/stream/XMLEventReader;->nextEvent()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_2f

    .line 169
    :cond_3f
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 129
    iget-object v0, p0, Lcom/bea/xml/stream/EventReaderFilter;->parent:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLEventReader;->close()V

    .line 130
    return-void
.end method

.method public getElementText()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 70
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 71
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventReaderFilter;->nextEvent()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v1

    .line 72
    .local v1, "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-interface {v1}, Ljavax/xml/stream/events/XMLEvent;->isStartElement()Z

    move-result v2

    if-nez v2, :cond_1a

    .line 73
    new-instance v2, Ljavax/xml/stream/XMLStreamException;

    const-string v3, "Precondition for readText is nextEvent().getTypeEventType() == START_ELEMENT"

    invoke-direct {v2, v3}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 84
    :cond_17
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventReaderFilter;->nextEvent()Ljavax/xml/stream/events/XMLEvent;

    .line 76
    :cond_1a
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventReaderFilter;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4d

    .line 77
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventReaderFilter;->peek()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v1

    .line 78
    invoke-interface {v1}, Ljavax/xml/stream/events/XMLEvent;->isStartElement()Z

    move-result v2

    if-eqz v2, :cond_32

    .line 79
    new-instance v2, Ljavax/xml/stream/XMLStreamException;

    const-string v3, "Unexpected Element start"

    invoke-direct {v2, v3}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 80
    :cond_32
    invoke-interface {v1}, Ljavax/xml/stream/events/XMLEvent;->isCharacters()Z

    move-result v2

    if-eqz v2, :cond_42

    move-object v2, v1

    .line 81
    check-cast v2, Ljavax/xml/stream/events/Characters;

    invoke-interface {v2}, Ljavax/xml/stream/events/Characters;->getData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 82
    :cond_42
    invoke-interface {v1}, Ljavax/xml/stream/events/XMLEvent;->isEndElement()Z

    move-result v2

    if-eqz v2, :cond_17

    .line 83
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 86
    :cond_4d
    new-instance v2, Ljavax/xml/stream/XMLStreamException;

    const-string v3, "Unexpected end of Document"

    invoke-direct {v2, v3}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 133
    iget-object v0, p0, Lcom/bea/xml/stream/EventReaderFilter;->parent:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLEventReader;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public hasNext()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 104
    :goto_1
    :try_start_1
    iget-object v2, p0, Lcom/bea/xml/stream/EventReaderFilter;->parent:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v2}, Ljavax/xml/stream/XMLEventReader;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    .line 105
    iget-object v2, p0, Lcom/bea/xml/stream/EventReaderFilter;->filter:Ljavax/xml/stream/EventFilter;

    iget-object v3, p0, Lcom/bea/xml/stream/EventReaderFilter;->parent:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v3}, Ljavax/xml/stream/XMLEventReader;->peek()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v3

    invoke-interface {v2, v3}, Ljavax/xml/stream/EventFilter;->accept(Ljavax/xml/stream/events/XMLEvent;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/4 v1, 0x1

    .line 110
    :cond_18
    :goto_18
    return v1

    .line 106
    :cond_19
    iget-object v2, p0, Lcom/bea/xml/stream/EventReaderFilter;->parent:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v2}, Ljavax/xml/stream/XMLEventReader;->nextEvent()Ljavax/xml/stream/events/XMLEvent;
    :try_end_1e
    .catch Ljavax/xml/stream/XMLStreamException; {:try_start_1 .. :try_end_1e} :catch_1f

    goto :goto_1

    .line 109
    :catch_1f
    move-exception v0

    .line 110
    .local v0, "e":Ljavax/xml/stream/XMLStreamException;
    goto :goto_18
.end method

.method public next()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 53
    :try_start_0
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventReaderFilter;->nextEvent()Ljavax/xml/stream/events/XMLEvent;
    :try_end_3
    .catch Ljavax/xml/stream/XMLStreamException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 55
    :goto_4
    return-object v1

    .line 54
    :catch_5
    move-exception v0

    .line 55
    .local v0, "e":Ljavax/xml/stream/XMLStreamException;
    const/4 v1, 0x0

    goto :goto_4
.end method

.method public nextEvent()Ljavax/xml/stream/events/XMLEvent;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventReaderFilter;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 63
    iget-object v0, p0, Lcom/bea/xml/stream/EventReaderFilter;->parent:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLEventReader;->nextEvent()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v0

    .line 64
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public nextTag()Ljavax/xml/stream/events/XMLEvent;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 90
    :cond_0
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventReaderFilter;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 91
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventReaderFilter;->nextEvent()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v0

    .line 92
    .local v0, "e":Ljavax/xml/stream/events/XMLEvent;
    invoke-interface {v0}, Ljavax/xml/stream/events/XMLEvent;->isCharacters()Z

    move-result v1

    if-eqz v1, :cond_21

    move-object v1, v0

    check-cast v1, Ljavax/xml/stream/events/Characters;

    invoke-interface {v1}, Ljavax/xml/stream/events/Characters;->isWhiteSpace()Z

    move-result v1

    if-nez v1, :cond_21

    .line 93
    new-instance v1, Ljavax/xml/stream/XMLStreamException;

    const-string v2, "Unexpected text"

    invoke-direct {v1, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 94
    :cond_21
    invoke-interface {v0}, Ljavax/xml/stream/events/XMLEvent;->isStartElement()Z

    move-result v1

    if-nez v1, :cond_2d

    invoke-interface {v0}, Ljavax/xml/stream/events/XMLEvent;->isEndElement()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 95
    :cond_2d
    return-object v0

    .line 97
    .end local v0    # "e":Ljavax/xml/stream/events/XMLEvent;
    :cond_2e
    new-instance v1, Ljavax/xml/stream/XMLStreamException;

    const-string v2, "Unexpected end of Document"

    invoke-direct {v1, v2}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public peek()Ljavax/xml/stream/events/XMLEvent;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 121
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventReaderFilter;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 122
    iget-object v0, p0, Lcom/bea/xml/stream/EventReaderFilter;->parent:Ljavax/xml/stream/XMLEventReader;

    invoke-interface {v0}, Ljavax/xml/stream/XMLEventReader;->peek()Ljavax/xml/stream/events/XMLEvent;

    move-result-object v0

    .line 123
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 115
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setFilter(Ljavax/xml/stream/EventFilter;)V
    .registers 2
    .param p1, "filter"    # Ljavax/xml/stream/EventFilter;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/bea/xml/stream/EventReaderFilter;->filter:Ljavax/xml/stream/EventFilter;

    .line 49
    return-void
.end method
