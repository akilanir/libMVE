.class public abstract Lnl/siegmann/epublib/utilities/StreamWriterDelegate;
.super Ljava/lang/Object;
.source "StreamWriterDelegate.java"

# interfaces
.implements Ljavax/xml/stream/XMLStreamWriter;


# instance fields
.field protected out:Ljavax/xml/stream/XMLStreamWriter;


# direct methods
.method protected constructor <init>(Ljavax/xml/stream/XMLStreamWriter;)V
    .registers 2
    .param p1, "out"    # Ljavax/xml/stream/XMLStreamWriter;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    .line 49
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
    .line 198
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamWriter;->close()V

    .line 199
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
    .line 194
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamWriter;->flush()V

    .line 195
    return-void
.end method

.method public getNamespaceContext()Ljavax/xml/namespace/NamespaceContext;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

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
    .line 145
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->getPrefix(Ljava/lang/String;)Ljava/lang/String;

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
    .line 55
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

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
    .line 69
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->setDefaultNamespace(Ljava/lang/String;)V

    .line 70
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
    .line 64
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->setNamespaceContext(Ljavax/xml/namespace/NamespaceContext;)V

    .line 65
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
    .line 150
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1, p2}, Ljavax/xml/stream/XMLStreamWriter;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    return-void
.end method

.method public writeAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "localName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 155
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1, p2}, Ljavax/xml/stream/XMLStreamWriter;->writeAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    return-void
.end method

.method public writeAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 160
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1, p2, p3}, Ljavax/xml/stream/XMLStreamWriter;->writeAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    return-void
.end method

.method public writeAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceURI"    # Ljava/lang/String;
    .param p3, "localName"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 165
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1, p2, p3, p4}, Ljavax/xml/stream/XMLStreamWriter;->writeAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    return-void
.end method

.method public writeCData(Ljava/lang/String;)V
    .registers 3
    .param p1, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 178
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->writeCData(Ljava/lang/String;)V

    .line 179
    return-void
.end method

.method public writeCharacters(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 169
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->writeCharacters(Ljava/lang/String;)V

    .line 170
    return-void
.end method

.method public writeCharacters([CII)V
    .registers 5
    .param p1, "text"    # [C
    .param p2, "start"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 174
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1, p2, p3}, Ljavax/xml/stream/XMLStreamWriter;->writeCharacters([CII)V

    .line 175
    return-void
.end method

.method public writeComment(Ljava/lang/String;)V
    .registers 3
    .param p1, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->writeComment(Ljava/lang/String;)V

    .line 102
    return-void
.end method

.method public writeDTD(Ljava/lang/String;)V
    .registers 3
    .param p1, "dtd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->writeDTD(Ljava/lang/String;)V

    .line 88
    return-void
.end method

.method public writeDefaultNamespace(Ljava/lang/String;)V
    .registers 3
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 136
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->writeDefaultNamespace(Ljava/lang/String;)V

    .line 137
    return-void
.end method

.method public writeEmptyElement(Ljava/lang/String;)V
    .registers 3
    .param p1, "localName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 106
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->writeEmptyElement(Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method public writeEmptyElement(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1, p2}, Ljavax/xml/stream/XMLStreamWriter;->writeEmptyElement(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    return-void
.end method

.method public writeEmptyElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "namespaceURI"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 116
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1, p2, p3}, Ljavax/xml/stream/XMLStreamWriter;->writeEmptyElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    return-void
.end method

.method public writeEndDocument()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 190
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamWriter;->writeEndDocument()V

    .line 191
    return-void
.end method

.method public writeEndElement()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 186
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamWriter;->writeEndElement()V

    .line 187
    return-void
.end method

.method public writeEntityRef(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 182
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->writeEntityRef(Ljava/lang/String;)V

    .line 183
    return-void
.end method

.method public writeNamespace(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceURI"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 141
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1, p2}, Ljavax/xml/stream/XMLStreamWriter;->writeNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    return-void
.end method

.method public writeProcessingInstruction(Ljava/lang/String;)V
    .registers 3
    .param p1, "target"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 92
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->writeProcessingInstruction(Ljava/lang/String;)V

    .line 93
    return-void
.end method

.method public writeProcessingInstruction(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 97
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1, p2}, Ljavax/xml/stream/XMLStreamWriter;->writeProcessingInstruction(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    return-void
.end method

.method public writeStartDocument()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamWriter;->writeStartDocument()V

    .line 74
    return-void
.end method

.method public writeStartDocument(Ljava/lang/String;)V
    .registers 3
    .param p1, "version"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->writeStartDocument(Ljava/lang/String;)V

    .line 79
    return-void
.end method

.method public writeStartDocument(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "version"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1, p2}, Ljavax/xml/stream/XMLStreamWriter;->writeStartDocument(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method public writeStartElement(Ljava/lang/String;)V
    .registers 3
    .param p1, "localName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 121
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1}, Ljavax/xml/stream/XMLStreamWriter;->writeStartElement(Ljava/lang/String;)V

    .line 122
    return-void
.end method

.method public writeStartElement(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 126
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1, p2}, Ljavax/xml/stream/XMLStreamWriter;->writeStartElement(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    return-void
.end method

.method public writeStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "namespaceURI"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 131
    iget-object v0, p0, Lnl/siegmann/epublib/utilities/StreamWriterDelegate;->out:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0, p1, p2, p3}, Ljavax/xml/stream/XMLStreamWriter;->writeStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    return-void
.end method
