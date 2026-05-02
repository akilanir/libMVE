.class public Lcom/bea/xml/stream/StreamReaderFilter;
.super Lcom/bea/xml/stream/ReaderDelegate;
.source "StreamReaderFilter.java"


# instance fields
.field private filter:Ljavax/xml/stream/StreamFilter;


# direct methods
.method public constructor <init>(Ljavax/xml/stream/XMLStreamReader;)V
    .registers 2
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/ReaderDelegate;-><init>(Ljavax/xml/stream/XMLStreamReader;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljavax/xml/stream/XMLStreamReader;Ljavax/xml/stream/StreamFilter;)V
    .registers 3
    .param p1, "reader"    # Ljavax/xml/stream/XMLStreamReader;
    .param p2, "filter"    # Ljavax/xml/stream/StreamFilter;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/ReaderDelegate;-><init>(Ljavax/xml/stream/XMLStreamReader;)V

    .line 44
    invoke-virtual {p0, p2}, Lcom/bea/xml/stream/StreamReaderFilter;->setFilter(Ljavax/xml/stream/StreamFilter;)V

    .line 45
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 11
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 73
    const-string v6, "javax.xml.stream.XMLInputFactory"

    const-string v7, "com.bea.xml.stream.MXParserFactory"

    invoke-static {v6, v7}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    invoke-static {}, Ljavax/xml/stream/XMLInputFactory;->newInstance()Ljavax/xml/stream/XMLInputFactory;

    move-result-object v1

    .line 78
    .local v1, "factory":Ljavax/xml/stream/XMLInputFactory;
    new-instance v0, Lcom/bea/xml/stream/filters/TypeFilter;

    invoke-direct {v0}, Lcom/bea/xml/stream/filters/TypeFilter;-><init>()V

    .line 79
    .local v0, "f":Lcom/bea/xml/stream/filters/TypeFilter;
    const/4 v6, 0x1

    invoke-virtual {v0, v6}, Lcom/bea/xml/stream/filters/TypeFilter;->addType(I)V

    .line 80
    const/4 v6, 0x2

    invoke-virtual {v0, v6}, Lcom/bea/xml/stream/filters/TypeFilter;->addType(I)V

    .line 81
    new-instance v6, Ljava/io/FileReader;

    aget-object v7, p0, v9

    invoke-direct {v6, v7}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Ljavax/xml/stream/XMLInputFactory;->createXMLStreamReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v6

    invoke-virtual {v1, v6, v0}, Ljavax/xml/stream/XMLInputFactory;->createFilteredReader(Ljavax/xml/stream/XMLStreamReader;Ljavax/xml/stream/StreamFilter;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v4

    .line 83
    .local v4, "reader":Ljavax/xml/stream/XMLStreamReader;
    :goto_28
    invoke-interface {v4}, Ljavax/xml/stream/XMLStreamReader;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3b

    .line 84
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-interface {v4}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 85
    invoke-interface {v4}, Ljavax/xml/stream/XMLStreamReader;->next()I

    goto :goto_28

    .line 89
    :cond_3b
    new-instance v2, Lcom/bea/xml/stream/filters/NameFilter;

    new-instance v6, Ljavax/xml/namespace/QName;

    const-string v7, "banana"

    const-string v8, "B"

    invoke-direct {v6, v7, v8}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v2, v6}, Lcom/bea/xml/stream/filters/NameFilter;-><init>(Ljavax/xml/namespace/QName;)V

    .line 90
    .local v2, "nf":Lcom/bea/xml/stream/filters/NameFilter;
    new-instance v6, Ljava/io/FileReader;

    aget-object v7, p0, v9

    invoke-direct {v6, v7}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Ljavax/xml/stream/XMLInputFactory;->createXMLStreamReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v6

    invoke-virtual {v1, v6, v2}, Ljavax/xml/stream/XMLInputFactory;->createFilteredReader(Ljavax/xml/stream/XMLStreamReader;Ljavax/xml/stream/StreamFilter;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v5

    .line 93
    .local v5, "reader2":Ljavax/xml/stream/XMLStreamReader;
    new-instance v3, Lcom/bea/xml/stream/XMLStreamRecorder;

    new-instance v6, Ljava/io/OutputStreamWriter;

    new-instance v7, Ljava/io/FileOutputStream;

    const-string v8, "out.stream"

    invoke-direct {v7, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v7}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v3, v6}, Lcom/bea/xml/stream/XMLStreamRecorder;-><init>(Ljava/io/Writer;)V

    .line 96
    .local v3, "r":Lcom/bea/xml/stream/XMLStreamRecorder;
    :goto_69
    invoke-interface {v5}, Ljavax/xml/stream/XMLStreamReader;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_76

    .line 97
    invoke-virtual {v3, v5}, Lcom/bea/xml/stream/XMLStreamRecorder;->write(Ljavax/xml/stream/XMLStreamReader;)V

    .line 98
    invoke-interface {v5}, Ljavax/xml/stream/XMLStreamReader;->next()I

    goto :goto_69

    .line 100
    :cond_76
    invoke-virtual {v3}, Lcom/bea/xml/stream/XMLStreamRecorder;->flush()V

    .line 102
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 64
    :goto_0
    invoke-super {p0}, Lcom/bea/xml/stream/ReaderDelegate;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 65
    iget-object v0, p0, Lcom/bea/xml/stream/StreamReaderFilter;->filter:Ljavax/xml/stream/StreamFilter;

    invoke-virtual {p0}, Lcom/bea/xml/stream/StreamReaderFilter;->getDelegate()Ljavax/xml/stream/XMLStreamReader;

    move-result-object v1

    invoke-interface {v0, v1}, Ljavax/xml/stream/StreamFilter;->accept(Ljavax/xml/stream/XMLStreamReader;)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    .line 68
    :goto_13
    return v0

    .line 66
    :cond_14
    invoke-super {p0}, Lcom/bea/xml/stream/ReaderDelegate;->next()I

    goto :goto_0

    .line 68
    :cond_18
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public next()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-virtual {p0}, Lcom/bea/xml/stream/StreamReaderFilter;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 55
    invoke-super {p0}, Lcom/bea/xml/stream/ReaderDelegate;->next()I

    move-result v0

    return v0

    .line 56
    :cond_b
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "next() may not be called  when there are no more  items to return"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setFilter(Ljavax/xml/stream/StreamFilter;)V
    .registers 2
    .param p1, "filter"    # Ljavax/xml/stream/StreamFilter;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/bea/xml/stream/StreamReaderFilter;->filter:Ljavax/xml/stream/StreamFilter;

    .line 49
    return-void
.end method
