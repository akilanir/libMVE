.class public Lcom/bea/xml/stream/XMLWriterBase;
.super Lcom/bea/xml/stream/ReaderToWriter;
.source "XMLWriterBase.java"

# interfaces
.implements Ljavax/xml/stream/XMLStreamWriter;


# static fields
.field protected static final DEFAULTNS:Ljava/lang/String; = ""


# instance fields
.field private config:Lcom/bea/xml/stream/ConfigurationContextBase;

.field protected context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

.field private defaultPrefixCount:I

.field private encoder:Ljava/nio/charset/CharsetEncoder;

.field private isEmpty:Z

.field private isPrefixDefaulting:Z

.field private localNameStack:Lcom/bea/xml/stream/util/Stack;

.field private needToWrite:Ljava/util/HashSet;

.field private prefixStack:Lcom/bea/xml/stream/util/Stack;

.field private setNeedsWritingNs:Ljava/util/HashSet;

.field private startElementOpened:Z

.field private uriStack:Lcom/bea/xml/stream/util/Stack;

.field private writer:Ljava/io/Writer;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 56
    invoke-direct {p0}, Lcom/bea/xml/stream/ReaderToWriter;-><init>()V

    .line 41
    iput-boolean v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->startElementOpened:Z

    .line 42
    iput-boolean v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->isEmpty:Z

    .line 48
    new-instance v0, Lcom/bea/xml/stream/util/Stack;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->localNameStack:Lcom/bea/xml/stream/util/Stack;

    .line 49
    new-instance v0, Lcom/bea/xml/stream/util/Stack;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->prefixStack:Lcom/bea/xml/stream/util/Stack;

    .line 50
    new-instance v0, Lcom/bea/xml/stream/util/Stack;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->uriStack:Lcom/bea/xml/stream/util/Stack;

    .line 51
    new-instance v0, Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/NamespaceContextImpl;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    .line 55
    iput v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->defaultPrefixCount:I

    .line 526
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->setNeedsWritingNs:Ljava/util/HashSet;

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/io/Writer;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;

    .prologue
    const/4 v1, 0x0

    .line 57
    invoke-direct {p0}, Lcom/bea/xml/stream/ReaderToWriter;-><init>()V

    .line 41
    iput-boolean v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->startElementOpened:Z

    .line 42
    iput-boolean v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->isEmpty:Z

    .line 48
    new-instance v0, Lcom/bea/xml/stream/util/Stack;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->localNameStack:Lcom/bea/xml/stream/util/Stack;

    .line 49
    new-instance v0, Lcom/bea/xml/stream/util/Stack;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->prefixStack:Lcom/bea/xml/stream/util/Stack;

    .line 50
    new-instance v0, Lcom/bea/xml/stream/util/Stack;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->uriStack:Lcom/bea/xml/stream/util/Stack;

    .line 51
    new-instance v0, Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/NamespaceContextImpl;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    .line 55
    iput v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->defaultPrefixCount:I

    .line 526
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->setNeedsWritingNs:Ljava/util/HashSet;

    .line 58
    iput-object p1, p0, Lcom/bea/xml/stream/XMLWriterBase;->writer:Ljava/io/Writer;

    .line 59
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->setWriter(Ljava/io/Writer;)V

    .line 60
    return-void
.end method

.method private clearNeedsWritingNs()V
    .registers 2

    .prologue
    .line 528
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->setNeedsWritingNs:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 529
    return-void
.end method

.method private flushNamespace()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 317
    iget-boolean v3, p0, Lcom/bea/xml/stream/XMLWriterBase;->isPrefixDefaulting:Z

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/bea/xml/stream/XMLWriterBase;->needToWrite:Ljava/util/HashSet;

    if-nez v3, :cond_9

    .line 329
    :cond_8
    :goto_8
    return-void

    .line 318
    :cond_9
    iget-object v3, p0, Lcom/bea/xml/stream/XMLWriterBase;->needToWrite:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 319
    .local v0, "i":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_40

    .line 320
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 321
    .local v2, "uri":Ljava/lang/String;
    iget-object v3, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-virtual {v3, v2}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->getPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 322
    .local v1, "prefix":Ljava/lang/String;
    if-nez v1, :cond_3c

    .line 323
    new-instance v3, Ljavax/xml/stream/XMLStreamException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Unable to default prefix with uri:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 326
    :cond_3c
    invoke-virtual {p0, v1, v2}, Lcom/bea/xml/stream/XMLWriterBase;->writeNamespace(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_f

    .line 328
    .end local v1    # "prefix":Ljava/lang/String;
    .end local v2    # "uri":Ljava/lang/String;
    :cond_40
    iget-object v3, p0, Lcom/bea/xml/stream/XMLWriterBase;->needToWrite:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->clear()V

    goto :goto_8
.end method

.method private getPrefixInternal(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "namespaceURI"    # Ljava/lang/String;

    .prologue
    .line 265
    iget-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-virtual {v1, p1}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->getPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 266
    .local v0, "prefix":Ljava/lang/String;
    if-nez v0, :cond_a

    .line 267
    const-string v0, ""

    .line 269
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_a
    return-object v0
.end method

.method public static main([Ljava/lang/String;)V
    .registers 10
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 711
    invoke-static {}, Lcom/bea/xml/stream/XMLOutputFactoryBase;->newInstance()Ljavax/xml/stream/XMLOutputFactory;

    move-result-object v3

    .line 712
    .local v3, "output":Ljavax/xml/stream/XMLOutputFactory;
    const-string v5, "javax.xml.stream.isRepairingNamespaces"

    new-instance v6, Ljava/lang/Boolean;

    invoke-direct {v6, v8}, Ljava/lang/Boolean;-><init>(Z)V

    invoke-virtual {v3, v5, v6}, Ljavax/xml/stream/XMLOutputFactory;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 713
    new-instance v2, Ljava/io/OutputStreamWriter;

    new-instance v5, Ljava/io/FileOutputStream;

    const-string v6, "tmp"

    invoke-direct {v5, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const-string v6, "us-ascii"

    invoke-direct {v2, v5, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 715
    .local v2, "myWriter":Ljava/io/Writer;
    invoke-virtual {v3, v2}, Ljavax/xml/stream/XMLOutputFactory;->createXMLStreamWriter(Ljava/io/Writer;)Ljavax/xml/stream/XMLStreamWriter;

    move-result-object v4

    .line 716
    .local v4, "writer2":Ljavax/xml/stream/XMLStreamWriter;
    invoke-interface {v4}, Ljavax/xml/stream/XMLStreamWriter;->writeStartDocument()V

    .line 717
    const-string v5, "c"

    const-string v6, "http://c"

    invoke-interface {v4, v5, v6}, Ljavax/xml/stream/XMLStreamWriter;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    .line 718
    const-string v5, "http://d"

    invoke-interface {v4, v5}, Ljavax/xml/stream/XMLStreamWriter;->setDefaultNamespace(Ljava/lang/String;)V

    .line 719
    const-string v5, "http://c"

    const-string v6, "a"

    invoke-interface {v4, v5, v6}, Ljavax/xml/stream/XMLStreamWriter;->writeStartElement(Ljava/lang/String;Ljava/lang/String;)V

    .line 720
    const-string v5, "b"

    const-string v6, "blah"

    invoke-interface {v4, v5, v6}, Ljavax/xml/stream/XMLStreamWriter;->writeAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 721
    const-string v5, "http://c"

    const-string v6, "d"

    invoke-interface {v4, v5, v6}, Ljavax/xml/stream/XMLStreamWriter;->writeEmptyElement(Ljava/lang/String;Ljava/lang/String;)V

    .line 722
    const-string v5, "http://d"

    const-string v6, "e"

    invoke-interface {v4, v5, v6}, Ljavax/xml/stream/XMLStreamWriter;->writeEmptyElement(Ljava/lang/String;Ljava/lang/String;)V

    .line 723
    const-string v5, "http://e"

    const-string v6, "f"

    invoke-interface {v4, v5, v6}, Ljavax/xml/stream/XMLStreamWriter;->writeEmptyElement(Ljava/lang/String;Ljava/lang/String;)V

    .line 724
    const-string v5, "http://f"

    const-string v6, "g"

    invoke-interface {v4, v5, v6}, Ljavax/xml/stream/XMLStreamWriter;->writeEmptyElement(Ljava/lang/String;Ljava/lang/String;)V

    .line 725
    const-string v5, "http://c"

    const-string v6, "chris"

    const-string v7, "fry"

    invoke-interface {v4, v5, v6, v7}, Ljavax/xml/stream/XMLStreamWriter;->writeAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 726
    const-string v5, "foo bar foo"

    invoke-interface {v4, v5}, Ljavax/xml/stream/XMLStreamWriter;->writeCharacters(Ljava/lang/String;)V

    .line 727
    const-string v5, "bad char coming["

    invoke-interface {v4, v5}, Ljavax/xml/stream/XMLStreamWriter;->writeCharacters(Ljava/lang/String;)V

    .line 728
    const/16 v1, 0x1024

    .line 729
    .local v1, "c":C
    new-array v0, v8, [C

    .line 730
    .local v0, "array":[C
    const/4 v5, 0x0

    aput-char v1, v0, v5

    .line 731
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v0}, Ljava/lang/String;-><init>([C)V

    invoke-interface {v4, v5}, Ljavax/xml/stream/XMLStreamWriter;->writeCharacters(Ljava/lang/String;)V

    .line 732
    const-string v5, "]"

    invoke-interface {v4, v5}, Ljavax/xml/stream/XMLStreamWriter;->writeCharacters(Ljava/lang/String;)V

    .line 733
    invoke-interface {v4}, Ljavax/xml/stream/XMLStreamWriter;->writeEndElement()V

    .line 734
    invoke-interface {v4}, Ljavax/xml/stream/XMLStreamWriter;->flush()V

    .line 737
    return-void
.end method

.method private needToWrite(Ljava/lang/String;)Z
    .registers 4
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 287
    iget-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->needToWrite:Ljava/util/HashSet;

    if-nez v1, :cond_b

    .line 288
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->needToWrite:Ljava/util/HashSet;

    .line 290
    :cond_b
    iget-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->needToWrite:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 291
    .local v0, "needs":Z
    iget-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->needToWrite:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 292
    return v0
.end method

.method private needsWritingNs(Ljava/lang/String;)Z
    .registers 4
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 531
    iget-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->setNeedsWritingNs:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    const/4 v0, 0x1

    .line 532
    .local v0, "needs":Z
    :goto_9
    if-eqz v0, :cond_10

    .line 533
    iget-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->setNeedsWritingNs:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 535
    :cond_10
    return v0

    .line 531
    .end local v0    # "needs":Z
    :cond_11
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private openStartElement()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 243
    iget-boolean v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->startElementOpened:Z

    if-eqz v0, :cond_8

    .line 244
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->closeStartTag()V

    .line 247
    :goto_7
    return-void

    .line 246
    :cond_8
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->startElementOpened:Z

    goto :goto_7
.end method

.method private prepareNamespace(Ljava/lang/String;)V
    .registers 5
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 298
    iget-boolean v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->isPrefixDefaulting:Z

    if-nez v1, :cond_5

    .line 307
    :cond_4
    :goto_4
    return-void

    .line 299
    :cond_5
    const-string v1, ""

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 300
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->getPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 302
    .local v0, "prefix":Ljava/lang/String;
    if-nez v0, :cond_4

    .line 304
    iget v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->defaultPrefixCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->defaultPrefixCount:I

    .line 305
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "ns"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lcom/bea/xml/stream/XMLWriterBase;->defaultPrefixCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 306
    invoke-virtual {p0, v0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4
.end method

.method private removeNamespace(Ljava/lang/String;)V
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 310
    iget-boolean v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->isPrefixDefaulting:Z

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->needToWrite:Ljava/util/HashSet;

    if-nez v0, :cond_9

    .line 312
    :cond_8
    :goto_8
    return-void

    .line 311
    :cond_9
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->needToWrite:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_8
.end method

.method private slowWriteCharacters([CIIZ)V
    .registers 9
    .param p1, "chars"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .param p4, "isAttributeValue"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x3b

    .line 176
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    if-ge v1, p3, :cond_6a

    .line 177
    add-int v2, v1, p2

    aget-char v0, p1, v2

    .line 178
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_6c

    .line 195
    const/16 v2, 0x20

    if-ge v0, v2, :cond_46

    .line 196
    if-nez p4, :cond_1a

    const/16 v2, 0x9

    if-eq v0, v2, :cond_66

    const/16 v2, 0xa

    if-eq v0, v2, :cond_66

    .line 197
    :cond_1a
    const-string v2, "&#"

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 198
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 199
    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/XMLWriterBase;->write(C)V

    .line 176
    :goto_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 180
    :sswitch_2c
    const-string v2, "&amp;"

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    goto :goto_29

    .line 183
    :sswitch_32
    const-string v2, "&lt;"

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    goto :goto_29

    .line 186
    :sswitch_38
    const-string v2, "&gt;"

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    goto :goto_29

    .line 189
    :sswitch_3e
    if-eqz p4, :cond_66

    .line 190
    const-string v2, "&quot;"

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    goto :goto_29

    .line 202
    :cond_46
    const/16 v2, 0x7f

    if-le v0, v2, :cond_66

    iget-object v2, p0, Lcom/bea/xml/stream/XMLWriterBase;->encoder:Ljava/nio/charset/CharsetEncoder;

    if-eqz v2, :cond_66

    iget-object v2, p0, Lcom/bea/xml/stream/XMLWriterBase;->encoder:Ljava/nio/charset/CharsetEncoder;

    invoke-virtual {v2, v0}, Ljava/nio/charset/CharsetEncoder;->canEncode(C)Z

    move-result v2

    if-nez v2, :cond_66

    .line 204
    const-string v2, "&#"

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 205
    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 206
    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/XMLWriterBase;->write(C)V

    goto :goto_29

    .line 210
    :cond_66
    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(C)V

    goto :goto_29

    .line 212
    .end local v0    # "c":C
    :cond_6a
    return-void

    .line 178
    nop

    :sswitch_data_6c
    .sparse-switch
        0x22 -> :sswitch_3e
        0x26 -> :sswitch_2c
        0x3c -> :sswitch_32
        0x3e -> :sswitch_38
    .end sparse-switch
.end method


# virtual methods
.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 453
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->flush()V

    .line 454
    return-void
.end method

.method protected closeEndTag()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 419
    const-string v0, ">"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 420
    return-void
.end method

.method protected closeStartElement()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 217
    iget-boolean v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->startElementOpened:Z

    if-eqz v0, :cond_a

    .line 218
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->closeStartTag()V

    .line 219
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->startElementOpened:Z

    .line 221
    :cond_a
    return-void
.end method

.method protected closeStartTag()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 230
    invoke-direct {p0}, Lcom/bea/xml/stream/XMLWriterBase;->flushNamespace()V

    .line 231
    invoke-direct {p0}, Lcom/bea/xml/stream/XMLWriterBase;->clearNeedsWritingNs()V

    .line 232
    iget-boolean v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->isEmpty:Z

    if-eqz v0, :cond_13

    .line 233
    const-string v0, "/>"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 234
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->isEmpty:Z

    .line 238
    :goto_12
    return-void

    .line 237
    :cond_13
    const-string v0, ">"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    goto :goto_12
.end method

.method public flush()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 457
    :try_start_0
    iget-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->writer:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->flush()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 461
    return-void

    .line 458
    :catch_6
    move-exception v0

    .line 459
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljavax/xml/stream/XMLStreamException;

    invoke-direct {v1, v0}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getNamespaceContext()Ljavax/xml/namespace/NamespaceContext;
    .registers 2

    .prologue
    .line 681
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

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
    .line 652
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->getPrefix(Ljava/lang/String;)Ljava/lang/String;

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
    .line 687
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/ConfigurationContextBase;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected getURIInternal(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 272
    iget-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-virtual {v1, p1}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 273
    .local v0, "uri":Ljava/lang/String;
    if-nez v0, :cond_a

    .line 274
    const-string v0, ""

    .line 276
    .end local v0    # "uri":Ljava/lang/String;
    :cond_a
    return-object v0
.end method

.method protected isOpen()Z
    .registers 2

    .prologue
    .line 224
    iget-boolean v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->startElementOpened:Z

    return v0
.end method

.method protected openEndTag()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 414
    const-string v0, "</"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 415
    return-void
.end method

.method protected openStartTag()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 283
    const-string v0, "<"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 284
    return-void
.end method

.method public setConfigurationContext(Lcom/bea/xml/stream/ConfigurationContextBase;)V
    .registers 3
    .param p1, "c"    # Lcom/bea/xml/stream/ConfigurationContextBase;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/bea/xml/stream/XMLWriterBase;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    .line 75
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->config:Lcom/bea/xml/stream/ConfigurationContextBase;

    invoke-virtual {v0}, Lcom/bea/xml/stream/ConfigurationContextBase;->isPrefixDefaulting()Z

    move-result v0

    iput-boolean v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->isPrefixDefaulting:Z

    .line 76
    return-void
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
    .line 667
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->needToWrite(Ljava/lang/String;)Z

    .line 668
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->bindDefaultNameSpace(Ljava/lang/String;)V

    .line 669
    return-void
.end method

.method public setNamespaceContext(Ljavax/xml/namespace/NamespaceContext;)V
    .registers 4
    .param p1, "context"    # Ljavax/xml/namespace/NamespaceContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 674
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "The namespace  context may not be null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 677
    :cond_a
    new-instance v0, Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-direct {v0, p1}, Lcom/bea/xml/stream/util/NamespaceContextImpl;-><init>(Ljavax/xml/namespace/NamespaceContext;)V

    iput-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    .line 678
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
    .line 659
    invoke-direct {p0, p2}, Lcom/bea/xml/stream/XMLWriterBase;->needToWrite(Ljava/lang/String;)Z

    .line 660
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-virtual {v0, p1, p2}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->bindNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 662
    return-void
.end method

.method public setWriter(Ljava/io/Writer;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/bea/xml/stream/XMLWriterBase;->writer:Ljava/io/Writer;

    .line 64
    invoke-virtual {p0, p0}, Lcom/bea/xml/stream/XMLWriterBase;->setStreamWriter(Ljavax/xml/stream/XMLStreamWriter;)V

    .line 65
    instance-of v1, p1, Ljava/io/OutputStreamWriter;

    if-eqz v1, :cond_1a

    .line 66
    check-cast p1, Ljava/io/OutputStreamWriter;

    .end local p1    # "writer":Ljava/io/Writer;
    invoke-virtual {p1}, Ljava/io/OutputStreamWriter;->getEncoding()Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, "charsetName":Ljava/lang/String;
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v1

    iput-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->encoder:Ljava/nio/charset/CharsetEncoder;

    .line 71
    .end local v0    # "charsetName":Ljava/lang/String;
    :goto_19
    return-void

    .line 69
    .restart local p1    # "writer":Ljava/io/Writer;
    :cond_1a
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->encoder:Ljava/nio/charset/CharsetEncoder;

    goto :goto_19
.end method

.method protected write(C)V
    .registers 4
    .param p1, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 92
    :try_start_0
    iget-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->writer:Ljava/io/Writer;

    invoke-virtual {v1, p1}, Ljava/io/Writer;->write(I)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 96
    return-void

    .line 93
    :catch_6
    move-exception v0

    .line 94
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljavax/xml/stream/XMLStreamException;

    invoke-direct {v1, v0}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected write(Ljava/lang/String;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 82
    :try_start_0
    iget-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->writer:Ljava/io/Writer;

    invoke-virtual {v1, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 86
    return-void

    .line 83
    :catch_6
    move-exception v0

    .line 84
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljavax/xml/stream/XMLStreamException;

    invoke-direct {v1, v0}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected write([C)V
    .registers 4
    .param p1, "c"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 102
    :try_start_0
    iget-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->writer:Ljava/io/Writer;

    invoke-virtual {v1, p1}, Ljava/io/Writer;->write([C)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 106
    return-void

    .line 103
    :catch_6
    move-exception v0

    .line 104
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljavax/xml/stream/XMLStreamException;

    invoke-direct {v1, v0}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected write([CII)V
    .registers 6
    .param p1, "c"    # [C
    .param p2, "start"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 112
    :try_start_0
    iget-object v1, p0, Lcom/bea/xml/stream/XMLWriterBase;->writer:Ljava/io/Writer;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/Writer;->write([CII)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 116
    return-void

    .line 113
    :catch_6
    move-exception v0

    .line 114
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljavax/xml/stream/XMLStreamException;

    invoke-direct {v1, v0}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/Throwable;)V

    throw v1
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
    .line 473
    const-string v0, ""

    invoke-virtual {p0, v0, p1, p2}, Lcom/bea/xml/stream/XMLWriterBase;->writeAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 474
    return-void
.end method

.method public writeAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 480
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->isOpen()Z

    move-result v0

    if-nez v0, :cond_e

    .line 481
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    const-string v1, "A start element must be written before an attribute"

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 482
    :cond_e
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->prepareNamespace(Ljava/lang/String;)V

    .line 483
    const-string v0, " "

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 484
    const-string v0, ""

    invoke-virtual {p0, v0, p1, p2}, Lcom/bea/xml/stream/XMLWriterBase;->writeName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 485
    const-string v0, "=\""

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 486
    invoke-virtual {p3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/bea/xml/stream/XMLWriterBase;->writeCharactersInternal([CIIZ)V

    .line 487
    const-string v0, "\""

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 488
    return-void
.end method

.method public writeAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
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
    .line 496
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->isOpen()Z

    move-result v0

    if-nez v0, :cond_e

    .line 497
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    const-string v1, "A start element must be written before an attribute"

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 498
    :cond_e
    invoke-direct {p0, p2}, Lcom/bea/xml/stream/XMLWriterBase;->prepareNamespace(Ljava/lang/String;)V

    .line 499
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-virtual {v0, p1, p2}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->bindNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 500
    const-string v0, " "

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 501
    invoke-virtual {p0, p1, p2, p3}, Lcom/bea/xml/stream/XMLWriterBase;->writeName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 502
    const-string v0, "=\""

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 503
    invoke-virtual {p4}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/bea/xml/stream/XMLWriterBase;->writeCharactersInternal([CIIZ)V

    .line 504
    const-string v0, "\""

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 505
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
    .line 594
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->closeStartElement()V

    .line 595
    const-string v0, "<![CDATA["

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 596
    if-eqz p1, :cond_d

    .line 597
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 598
    :cond_d
    const-string v0, "]]>"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 599
    return-void
.end method

.method public writeCharacters(Ljava/lang/String;)V
    .registers 5
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 638
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->closeStartElement()V

    .line 639
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v0, v2, v1, v2}, Lcom/bea/xml/stream/XMLWriterBase;->writeCharactersInternal([CIIZ)V

    .line 640
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
    .line 645
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->closeStartElement()V

    .line 646
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/bea/xml/stream/XMLWriterBase;->writeCharactersInternal([CIIZ)V

    .line 647
    return-void
.end method

.method protected writeCharactersInternal([CIIZ)V
    .registers 8
    .param p1, "characters"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .param p4, "isAttributeValue"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 124
    if-nez p3, :cond_3

    .line 167
    :goto_2
    return-void

    .line 132
    :cond_3
    const/4 v1, 0x0

    .line 135
    .local v1, "i":I
    :goto_4
    if-ge v1, p3, :cond_1b

    .line 136
    add-int v2, v1, p2

    aget-char v0, p1, v2

    .line 137
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_3c

    .line 147
    const/16 v2, 0x20

    if-ge v0, v2, :cond_26

    .line 152
    if-nez p4, :cond_1b

    const/16 v2, 0x9

    if-eq v0, v2, :cond_23

    const/16 v2, 0xa

    if-eq v0, v2, :cond_23

    .line 162
    .end local v0    # "c":C
    :cond_1b
    :goto_1b
    :sswitch_1b
    if-ge v1, p3, :cond_37

    .line 163
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/bea/xml/stream/XMLWriterBase;->slowWriteCharacters([CIIZ)V

    goto :goto_2

    .line 139
    .restart local v0    # "c":C
    :sswitch_21
    if-nez p4, :cond_1b

    .line 135
    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 155
    :cond_26
    const/16 v2, 0x7f

    if-le v0, v2, :cond_23

    .line 156
    iget-object v2, p0, Lcom/bea/xml/stream/XMLWriterBase;->encoder:Ljava/nio/charset/CharsetEncoder;

    if-eqz v2, :cond_23

    iget-object v2, p0, Lcom/bea/xml/stream/XMLWriterBase;->encoder:Ljava/nio/charset/CharsetEncoder;

    invoke-virtual {v2, v0}, Ljava/nio/charset/CharsetEncoder;->canEncode(C)Z

    move-result v2

    if-nez v2, :cond_23

    goto :goto_1b

    .line 165
    .end local v0    # "c":C
    :cond_37
    invoke-virtual {p0, p1, p2, p3}, Lcom/bea/xml/stream/XMLWriterBase;->write([CII)V

    goto :goto_2

    .line 137
    nop

    :sswitch_data_3c
    .sparse-switch
        0x22 -> :sswitch_21
        0x26 -> :sswitch_1b
        0x3c -> :sswitch_1b
        0x3e -> :sswitch_1b
    .end sparse-switch
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
    .line 555
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->closeStartElement()V

    .line 556
    const-string v0, "<!--"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 557
    if-eqz p1, :cond_d

    .line 558
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 559
    :cond_d
    const-string v0, "-->"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 560
    return-void
.end method

.method public writeDTD(Ljava/lang/String;)V
    .registers 2
    .param p1, "dtd"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 589
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 590
    return-void
.end method

.method public writeDefaultNamespace(Ljava/lang/String;)V
    .registers 4
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 541
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->isOpen()Z

    move-result v0

    if-nez v0, :cond_e

    .line 542
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    const-string v1, "A start element must be written before the default namespace"

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 543
    :cond_e
    const-string v0, ""

    invoke-direct {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->needsWritingNs(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 544
    const-string v0, " xmlns"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 545
    const-string v0, "=\""

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 546
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 547
    const-string v0, "\""

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 548
    const-string v0, ""

    invoke-virtual {p0, v0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    .line 550
    :cond_2d
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
    .line 408
    const-string v0, ""

    invoke-virtual {p0, v0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->writeEmptyElement(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
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
    .line 384
    invoke-direct {p0}, Lcom/bea/xml/stream/XMLWriterBase;->openStartElement()V

    .line 385
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->prepareNamespace(Ljava/lang/String;)V

    .line 386
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->isEmpty:Z

    .line 387
    const-string v0, "<"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 388
    const-string v0, ""

    invoke-virtual {p0, v0, p1, p2}, Lcom/bea/xml/stream/XMLWriterBase;->writeName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 389
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
    .line 396
    invoke-direct {p0}, Lcom/bea/xml/stream/XMLWriterBase;->openStartElement()V

    .line 397
    invoke-direct {p0, p3}, Lcom/bea/xml/stream/XMLWriterBase;->prepareNamespace(Ljava/lang/String;)V

    .line 398
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->isEmpty:Z

    .line 399
    const-string v0, "<"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 400
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 401
    const-string v0, ":"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 402
    invoke-virtual {p0, p2}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 403
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
    .line 466
    :goto_0
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->localNameStack:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v0}, Lcom/bea/xml/stream/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_c

    .line 467
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->writeEndElement()V

    goto :goto_0

    .line 468
    :cond_c
    return-void
.end method

.method public writeEndElement()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 431
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->isOpen()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 432
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->closeStartElement()V

    .line 434
    :cond_9
    iget-object v2, p0, Lcom/bea/xml/stream/XMLWriterBase;->prefixStack:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v2}, Lcom/bea/xml/stream/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 435
    .local v1, "prefix":Ljava/lang/String;
    iget-object v2, p0, Lcom/bea/xml/stream/XMLWriterBase;->localNameStack:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v2}, Lcom/bea/xml/stream/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 436
    .local v0, "local":Ljava/lang/String;
    iget-object v2, p0, Lcom/bea/xml/stream/XMLWriterBase;->uriStack:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v2}, Lcom/bea/xml/stream/util/Stack;->pop()Ljava/lang/Object;

    .line 438
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->openEndTag()V

    .line 439
    const-string v2, ""

    invoke-virtual {p0, v1, v2, v0}, Lcom/bea/xml/stream/XMLWriterBase;->writeName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 440
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->closeEndTag()V

    .line 442
    iget-object v2, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-virtual {v2}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->closeScope()V

    .line 443
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
    .line 604
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->closeStartElement()V

    .line 605
    const-string v0, "&"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 606
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 607
    const-string v0, ";"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 608
    return-void
.end method

.method protected writeName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceURI"    # Ljava/lang/String;
    .param p3, "localName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 253
    const-string v0, ""

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 254
    invoke-direct {p0, p2}, Lcom/bea/xml/stream/XMLWriterBase;->getPrefixInternal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 255
    :cond_c
    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    .line 256
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 257
    const-string v0, ":"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 259
    :cond_1c
    invoke-virtual {p0, p3}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 260
    return-object p1
.end method

.method public writeNamespace(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespaceURI"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 510
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->isOpen()Z

    move-result v0

    if-nez v0, :cond_e

    .line 511
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    const-string v1, "A start element must be written before a namespace"

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 512
    :cond_e
    if-eqz p1, :cond_20

    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "xmlns"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 513
    :cond_20
    invoke-virtual {p0, p2}, Lcom/bea/xml/stream/XMLWriterBase;->writeDefaultNamespace(Ljava/lang/String;)V

    .line 524
    :cond_23
    :goto_23
    return-void

    .line 516
    :cond_24
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->needsWritingNs(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 517
    const-string v0, " xmlns:"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 518
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 519
    const-string v0, "=\""

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 520
    invoke-virtual {p0, p2}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 521
    const-string v0, "\""

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 522
    invoke-virtual {p0, p1, p2}, Lcom/bea/xml/stream/XMLWriterBase;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_23
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
    .line 565
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->closeStartElement()V

    .line 566
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/bea/xml/stream/XMLWriterBase;->writeProcessingInstruction(Ljava/lang/String;Ljava/lang/String;)V

    .line 567
    return-void
.end method

.method public writeProcessingInstruction(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 573
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->closeStartElement()V

    .line 574
    const-string v0, "<?"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 575
    if-eqz p1, :cond_d

    .line 576
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 578
    :cond_d
    if-eqz p2, :cond_17

    .line 580
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(C)V

    .line 581
    invoke-virtual {p0, p2}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 583
    :cond_17
    const-string v0, "?>"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 584
    return-void
.end method

.method public writeRaw(Ljava/lang/String;)V
    .registers 2
    .param p1, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 448
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->closeStartElement()V

    .line 449
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 450
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
    .line 613
    const-string v0, "<?xml version=\'1.0\' encoding=\'utf-8\'?>"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 614
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
    .line 619
    const-string v0, "<?xml version=\'"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 620
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 621
    const-string v0, "\'?>"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 622
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
    .line 628
    const-string v0, "<?xml version=\'"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 629
    invoke-virtual {p0, p2}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 630
    const-string v0, "\' encoding=\'"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 631
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 632
    const-string v0, "\'?>"

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/XMLWriterBase;->write(Ljava/lang/String;)V

    .line 633
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
    .line 377
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-virtual {v0}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->openScope()V

    .line 378
    const-string v0, ""

    invoke-virtual {p0, v0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->writeStartElement(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
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
    .line 351
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-virtual {v0}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->openScope()V

    .line 352
    invoke-virtual {p0, p1, p2}, Lcom/bea/xml/stream/XMLWriterBase;->writeStartElementInternal(Ljava/lang/String;Ljava/lang/String;)V

    .line 353
    return-void
.end method

.method public writeStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "namespaceURI"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 362
    if-nez p3, :cond_a

    .line 363
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The namespace URI may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 364
    :cond_a
    if-nez p2, :cond_14

    .line 365
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The local name may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 366
    :cond_14
    if-nez p1, :cond_1e

    .line 367
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The prefix may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 368
    :cond_1e
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-virtual {v0}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->openScope()V

    .line 369
    invoke-direct {p0, p3}, Lcom/bea/xml/stream/XMLWriterBase;->prepareNamespace(Ljava/lang/String;)V

    .line 370
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->context:Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-virtual {v0, p1, p3}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->bindNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    invoke-virtual {p0, p3, p2}, Lcom/bea/xml/stream/XMLWriterBase;->writeStartElementInternal(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    return-void
.end method

.method protected writeStartElementInternal(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 335
    if-nez p1, :cond_a

    .line 336
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The namespace URI may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 337
    :cond_a
    if-nez p2, :cond_14

    .line 338
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The local name  may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 340
    :cond_14
    invoke-direct {p0}, Lcom/bea/xml/stream/XMLWriterBase;->openStartElement()V

    .line 341
    invoke-virtual {p0}, Lcom/bea/xml/stream/XMLWriterBase;->openStartTag()V

    .line 342
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/XMLWriterBase;->prepareNamespace(Ljava/lang/String;)V

    .line 343
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->prefixStack:Lcom/bea/xml/stream/util/Stack;

    const-string v1, ""

    invoke-virtual {p0, v1, p1, p2}, Lcom/bea/xml/stream/XMLWriterBase;->writeName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/util/Stack;->push(Ljava/lang/Object;)V

    .line 344
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->localNameStack:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v0, p2}, Lcom/bea/xml/stream/util/Stack;->push(Ljava/lang/Object;)V

    .line 345
    iget-object v0, p0, Lcom/bea/xml/stream/XMLWriterBase;->uriStack:Lcom/bea/xml/stream/util/Stack;

    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/util/Stack;->push(Ljava/lang/Object;)V

    .line 346
    return-void
.end method
