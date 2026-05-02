.class public Lcom/bea/xml/stream/MXParserFactory;
.super Ljavax/xml/stream/XMLInputFactory;
.source "MXParserFactory.java"


# instance fields
.field config:Lcom/bea/xml/stream/ConfigurationContextBase;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 35
    invoke-direct {p0}, Ljavax/xml/stream/XMLInputFactory;-><init>()V

    .line 37
    new-instance v0, Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-direct {v0}, Lcom/bea/xml/stream/ConfigurationContextBase;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    return-void
.end method

.method public static newInstance()Ljavax/xml/stream/XMLInputFactory;
    .registers 1

    .prologue
    .line 41
    invoke-static {}, Ljavax/xml/stream/XMLInputFactory;->newInstance()Ljavax/xml/stream/XMLInputFactory;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public createFilteredReader(Ljavax/xml/stream/XMLEventReader;Ljavax/xml/stream/EventFilter;)Ljavax/xml/stream/XMLEventReader;
    .registers 4
    .param p1, "reader"    # Ljavax/xml/stream/XMLEventReader;
    .param p2, "filter"    # Ljavax/xml/stream/EventFilter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 200
    new-instance v0, Lcom/bea/xml/stream/EventReaderFilter;

    invoke-direct {v0, p1, p2}, Lcom/bea/xml/stream/EventReaderFilter;-><init>(Ljavax/xml/stream/XMLEventReader;Ljavax/xml/stream/EventFilter;)V

    return-object v0
.end method

.method public createFilteredReader(Ljavax/xml/stream/XMLStreamReader;Ljavax/xml/stream/StreamFilter;)Ljavax/xml/stream/XMLStreamReader;
    .registers 4
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .param p2, "filter"    # Ljavax/xml/stream/StreamFilter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 188
    new-instance v0, Lcom/bea/xml/stream/StreamReaderFilter;

    invoke-direct {v0, p1, p2}, Lcom/bea/xml/stream/StreamReaderFilter;-><init>(Ljavax/xml/stream/XMLStreamReader;Ljavax/xml/stream/StreamFilter;)V

    return-object v0
.end method

.method public createXMLEventReader(Ljava/io/InputStream;)Ljavax/xml/stream/XMLEventReader;
    .registers 3
    .param p1, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 151
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParserFactory;->createXMLStreamReader(Ljava/io/InputStream;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParserFactory;->createXMLEventReader(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/XMLEventReader;

    move-result-object v0

    return-object v0
.end method

.method public createXMLEventReader(Ljava/io/InputStream;Ljava/lang/String;)Ljavax/xml/stream/XMLEventReader;
    .registers 4
    .param p1, "stream"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 160
    invoke-virtual {p0, p1, p2}, Lcom/bea/xml/stream/MXParserFactory;->createXMLStreamReader(Ljava/io/InputStream;Ljava/lang/String;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParserFactory;->createXMLEventReader(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/XMLEventReader;

    move-result-object v0

    return-object v0
.end method

.method public createXMLEventReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLEventReader;
    .registers 3
    .param p1, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 118
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParserFactory;->createXMLStreamReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParserFactory;->createXMLEventReader(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/XMLEventReader;

    move-result-object v0

    return-object v0
.end method

.method public createXMLEventReader(Ljava/lang/String;Ljava/io/InputStream;)Ljavax/xml/stream/XMLEventReader;
    .registers 4
    .param p1, "systemId"    # Ljava/lang/String;
    .param p2, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 110
    invoke-virtual {p0, p2}, Lcom/bea/xml/stream/MXParserFactory;->createXMLEventReader(Ljava/io/InputStream;)Ljavax/xml/stream/XMLEventReader;

    move-result-object v0

    return-object v0
.end method

.method public createXMLEventReader(Ljava/lang/String;Ljava/io/Reader;)Ljavax/xml/stream/XMLEventReader;
    .registers 4
    .param p1, "systemId"    # Ljava/lang/String;
    .param p2, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-virtual {p0, p2}, Lcom/bea/xml/stream/MXParserFactory;->createXMLEventReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLEventReader;

    move-result-object v0

    return-object v0
.end method

.method public createXMLEventReader(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/XMLEventReader;
    .registers 4
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 129
    iget-object v1, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v1}, Lcom/bea/xml/stream/ConfigurationContextBase;->getEventAllocator()Ljavax/xml/stream/util/XMLEventAllocator;

    move-result-object v1

    if-nez v1, :cond_e

    .line 130
    new-instance v0, Lcom/bea/xml/stream/XMLEventReaderBase;

    invoke-direct {v0, p1}, Lcom/bea/xml/stream/XMLEventReaderBase;-><init>(Ljavax/xml/stream/XMLStreamReader;)V

    .line 135
    .local v0, "base":Lcom/bea/xml/stream/XMLEventReaderBase;
    :goto_d
    return-object v0

    .line 132
    .end local v0    # "base":Lcom/bea/xml/stream/XMLEventReaderBase;
    :cond_e
    new-instance v0, Lcom/bea/xml/stream/XMLEventReaderBase;

    iget-object v1, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v1}, Lcom/bea/xml/stream/ConfigurationContextBase;->getEventAllocator()Ljavax/xml/stream/util/XMLEventAllocator;

    move-result-object v1

    invoke-interface {v1}, Ljavax/xml/stream/util/XMLEventAllocator;->newInstance()Ljavax/xml/stream/util/XMLEventAllocator;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/bea/xml/stream/XMLEventReaderBase;-><init>(Ljavax/xml/stream/XMLStreamReader;Ljavax/xml/stream/util/XMLEventAllocator;)V

    .restart local v0    # "base":Lcom/bea/xml/stream/XMLEventReaderBase;
    goto :goto_d
.end method

.method public createXMLEventReader(Ljavax/xml/transform/Source;)Ljavax/xml/stream/XMLEventReader;
    .registers 3
    .param p1, "source"    # Ljavax/xml/transform/Source;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/MXParserFactory;->createXMLStreamReader(Ljavax/xml/transform/Source;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/MXParserFactory;->createXMLEventReader(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/XMLEventReader;

    move-result-object v0

    return-object v0
.end method

.method public createXMLStreamReader(Ljava/io/InputStream;)Ljavax/xml/stream/XMLStreamReader;
    .registers 4
    .param p1, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 78
    new-instance v0, Lcom/bea/xml/stream/MXParser;

    invoke-direct {v0}, Lcom/bea/xml/stream/MXParser;-><init>()V

    .line 79
    .local v0, "pp":Lcom/bea/xml/stream/MXParser;
    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/MXParser;->setInput(Ljava/io/InputStream;)V

    .line 80
    iget-object v1, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->setConfigurationContext(Lcom/bea/xml/stream/ConfigurationContextBase;)V

    .line 81
    return-object v0
.end method

.method public createXMLStreamReader(Ljava/io/InputStream;Ljava/lang/String;)Ljavax/xml/stream/XMLStreamReader;
    .registers 5
    .param p1, "stream"    # Ljava/io/InputStream;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 90
    new-instance v0, Lcom/bea/xml/stream/MXParser;

    invoke-direct {v0}, Lcom/bea/xml/stream/MXParser;-><init>()V

    .line 91
    .local v0, "pp":Lcom/bea/xml/stream/MXParser;
    invoke-virtual {v0, p1, p2}, Lcom/bea/xml/stream/MXParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 92
    iget-object v1, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->setConfigurationContext(Lcom/bea/xml/stream/ConfigurationContextBase;)V

    .line 93
    return-object v0
.end method

.method public createXMLStreamReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLStreamReader;
    .registers 4
    .param p1, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 260
    new-instance v0, Lcom/bea/xml/stream/MXParser;

    invoke-direct {v0}, Lcom/bea/xml/stream/MXParser;-><init>()V

    .line 261
    .local v0, "pp":Lcom/bea/xml/stream/MXParser;
    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/MXParser;->setInput(Ljava/io/Reader;)V

    .line 262
    iget-object v1, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/MXParser;->setConfigurationContext(Lcom/bea/xml/stream/ConfigurationContextBase;)V

    .line 263
    return-object v0
.end method

.method public createXMLStreamReader(Ljava/lang/String;Ljava/io/InputStream;)Ljavax/xml/stream/XMLStreamReader;
    .registers 4
    .param p1, "systemId"    # Ljava/lang/String;
    .param p2, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 98
    invoke-virtual {p0, p2}, Lcom/bea/xml/stream/MXParserFactory;->createXMLStreamReader(Ljava/io/InputStream;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v0

    return-object v0
.end method

.method public createXMLStreamReader(Ljava/lang/String;Ljava/io/Reader;)Ljavax/xml/stream/XMLStreamReader;
    .registers 4
    .param p1, "systemId"    # Ljava/lang/String;
    .param p2, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-virtual {p0, p2}, Lcom/bea/xml/stream/MXParserFactory;->createXMLStreamReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v0

    return-object v0
.end method

.method public createXMLStreamReader(Ljavax/xml/transform/Source;)Ljavax/xml/stream/XMLStreamReader;
    .registers 10
    .param p1, "source"    # Ljavax/xml/transform/Source;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 49
    instance-of v5, p1, Ljavax/xml/transform/sax/SAXSource;

    if-eqz v5, :cond_2f

    move-object v3, p1

    .line 50
    check-cast v3, Ljavax/xml/transform/sax/SAXSource;

    .line 51
    .local v3, "ss":Ljavax/xml/transform/sax/SAXSource;
    invoke-virtual {v3}, Ljavax/xml/transform/sax/SAXSource;->getInputSource()Lorg/xml/sax/InputSource;

    move-result-object v1

    .line 52
    .local v1, "isource":Lorg/xml/sax/InputSource;
    if-eqz v1, :cond_27

    .line 53
    invoke-virtual {v1}, Lorg/xml/sax/InputSource;->getSystemId()Ljava/lang/String;

    move-result-object v4

    .line 54
    .local v4, "sysId":Ljava/lang/String;
    invoke-virtual {v1}, Lorg/xml/sax/InputSource;->getCharacterStream()Ljava/io/Reader;

    move-result-object v2

    .line 55
    .local v2, "r":Ljava/io/Reader;
    if-eqz v2, :cond_1c

    .line 56
    invoke-virtual {p0, v4, v2}, Lcom/bea/xml/stream/MXParserFactory;->createXMLStreamReader(Ljava/lang/String;Ljava/io/Reader;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v5

    .line 60
    :goto_1b
    return-object v5

    .line 58
    :cond_1c
    invoke-virtual {v1}, Lorg/xml/sax/InputSource;->getByteStream()Ljava/io/InputStream;

    move-result-object v0

    .line 59
    .local v0, "in":Ljava/io/InputStream;
    if-eqz v0, :cond_27

    .line 60
    invoke-virtual {p0, v4, v0}, Lcom/bea/xml/stream/MXParserFactory;->createXMLStreamReader(Ljava/lang/String;Ljava/io/InputStream;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v5

    goto :goto_1b

    .line 63
    .end local v0    # "in":Ljava/io/InputStream;
    .end local v2    # "r":Ljava/io/Reader;
    .end local v4    # "sysId":Ljava/lang/String;
    :cond_27
    new-instance v5, Ljavax/xml/stream/XMLStreamException;

    const-string v6, "Can only create STaX reader for a SAXSource if Reader or InputStream exposed via getSource(); can not use -- not implemented."

    invoke-direct {v5, v6}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 66
    .end local v1    # "isource":Lorg/xml/sax/InputSource;
    .end local v3    # "ss":Ljavax/xml/transform/sax/SAXSource;
    :cond_2f
    instance-of v5, p1, Ljavax/xml/transform/dom/DOMSource;

    if-eqz v5, :cond_33

    .line 70
    :cond_33
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "XMLInputFactory.createXMLStreamReader("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ") not yet implemented"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public getEventAllocator()Ljavax/xml/stream/util/XMLEventAllocator;
    .registers 2

    .prologue
    .line 231
    iget-object v0, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0}, Lcom/bea/xml/stream/ConfigurationContextBase;->getEventAllocator()Ljavax/xml/stream/util/XMLEventAllocator;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 254
    iget-object v0, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/ConfigurationContextBase;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getXMLReporter()Ljavax/xml/stream/XMLReporter;
    .registers 2

    .prologue
    .line 207
    iget-object v0, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0}, Lcom/bea/xml/stream/ConfigurationContextBase;->getXMLReporter()Ljavax/xml/stream/XMLReporter;

    move-result-object v0

    return-object v0
.end method

.method public getXMLResolver()Ljavax/xml/stream/XMLResolver;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0}, Lcom/bea/xml/stream/ConfigurationContextBase;->getXMLResolver()Ljavax/xml/stream/XMLResolver;

    move-result-object v0

    return-object v0
.end method

.method public isCoalescing()Z
    .registers 2

    .prologue
    .line 245
    iget-object v0, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0}, Lcom/bea/xml/stream/ConfigurationContextBase;->isCoalescing()Z

    move-result v0

    return v0
.end method

.method public isPropertySupported(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 267
    iget-object v0, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/ConfigurationContextBase;->isPropertySupported(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setCoalescing(Z)V
    .registers 3
    .param p1, "coalescing"    # Z

    .prologue
    .line 238
    iget-object v0, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/ConfigurationContextBase;->setCoalescing(Z)V

    .line 239
    return-void
.end method

.method public setEventAllocator(Ljavax/xml/stream/util/XMLEventAllocator;)V
    .registers 3
    .param p1, "allocator"    # Ljavax/xml/stream/util/XMLEventAllocator;

    .prologue
    .line 224
    iget-object v0, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/ConfigurationContextBase;->setEventAllocator(Ljavax/xml/stream/util/XMLEventAllocator;)V

    .line 225
    return-void
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 250
    iget-object v0, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0, p1, p2}, Lcom/bea/xml/stream/ConfigurationContextBase;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 251
    return-void
.end method

.method public setXMLReporter(Ljavax/xml/stream/XMLReporter;)V
    .registers 3
    .param p1, "reporter"    # Ljavax/xml/stream/XMLReporter;

    .prologue
    .line 215
    iget-object v0, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/ConfigurationContextBase;->setXMLReporter(Ljavax/xml/stream/XMLReporter;)V

    .line 216
    return-void
.end method

.method public setXMLResolver(Ljavax/xml/stream/XMLResolver;)V
    .registers 3
    .param p1, "resolver"    # Ljavax/xml/stream/XMLResolver;

    .prologue
    .line 176
    iget-object v0, p0, Lcom/bea/xml/stream/MXParserFactory;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/ConfigurationContextBase;->setXMLResolver(Ljavax/xml/stream/XMLResolver;)V

    .line 177
    return-void
.end method
