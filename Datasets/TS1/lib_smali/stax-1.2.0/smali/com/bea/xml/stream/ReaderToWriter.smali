.class public Lcom/bea/xml/stream/ReaderToWriter;
.super Ljava/lang/Object;
.source "ReaderToWriter.java"


# instance fields
.field private writer:Ljavax/xml/stream/XMLStreamWriter;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljavax/xml/stream/XMLStreamWriter;)V
    .registers 2
    .param p1, "xmlw"    # Ljavax/xml/stream/XMLStreamWriter;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    .line 36
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
    .line 121
    invoke-static {}, Ljavax/xml/stream/XMLInputFactory;->newInstance()Ljavax/xml/stream/XMLInputFactory;

    move-result-object v1

    .line 122
    .local v1, "xmlif":Ljavax/xml/stream/XMLInputFactory;
    invoke-static {}, Ljavax/xml/stream/XMLOutputFactory;->newInstance()Ljavax/xml/stream/XMLOutputFactory;

    move-result-object v2

    .line 123
    .local v2, "xmlof":Ljavax/xml/stream/XMLOutputFactory;
    new-instance v5, Ljava/io/FileReader;

    const/4 v6, 0x0

    aget-object v6, p0, v6

    invoke-direct {v5, v6}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljavax/xml/stream/XMLInputFactory;->createXMLStreamReader(Ljava/io/Reader;)Ljavax/xml/stream/XMLStreamReader;

    move-result-object v3

    .line 124
    .local v3, "xmlr":Ljavax/xml/stream/XMLStreamReader;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, v5}, Ljavax/xml/stream/XMLOutputFactory;->createXMLStreamWriter(Ljava/io/OutputStream;)Ljavax/xml/stream/XMLStreamWriter;

    move-result-object v4

    .line 126
    .local v4, "xmlw":Ljavax/xml/stream/XMLStreamWriter;
    new-instance v0, Lcom/bea/xml/stream/ReaderToWriter;

    invoke-direct {v0, v4}, Lcom/bea/xml/stream/ReaderToWriter;-><init>(Ljavax/xml/stream/XMLStreamWriter;)V

    .line 127
    .local v0, "rtow":Lcom/bea/xml/stream/ReaderToWriter;
    :goto_1f
    invoke-interface {v3}, Ljavax/xml/stream/XMLStreamReader;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 128
    invoke-virtual {v0, v3}, Lcom/bea/xml/stream/ReaderToWriter;->write(Ljavax/xml/stream/XMLStreamReader;)V

    .line 129
    invoke-interface {v3}, Ljavax/xml/stream/XMLStreamReader;->next()I

    goto :goto_1f

    .line 131
    :cond_2c
    invoke-interface {v4}, Ljavax/xml/stream/XMLStreamWriter;->flush()V

    .line 132
    return-void
.end method


# virtual methods
.method public setStreamWriter(Ljavax/xml/stream/XMLStreamWriter;)V
    .registers 2
    .param p1, "xmlw"    # Ljavax/xml/stream/XMLStreamWriter;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    .line 40
    return-void
.end method

.method public write(Ljavax/xml/stream/XMLStreamReader;)V
    .registers 11
    .param p1, "xmlr"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 44
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "wrote event"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 45
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getEventType()I

    move-result v5

    packed-switch v5, :pswitch_data_d4

    .line 107
    :cond_e
    :goto_e
    :pswitch_e
    return-void

    .line 47
    :pswitch_f
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getPrefix()Ljava/lang/String;

    move-result-object v3

    .line 48
    .local v3, "prefix":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    .line 49
    .local v2, "namespaceURI":Ljava/lang/String;
    if-eqz v2, :cond_51

    .line 50
    if-eqz v3, :cond_43

    .line 51
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getPrefix()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceURI()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v6, v7, v8}, Ljavax/xml/stream/XMLStreamWriter;->writeStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    :goto_2c
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2d
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceCount()I

    move-result v5

    if-ge v1, v5, :cond_e

    .line 62
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1, v1}, Ljavax/xml/stream/XMLStreamReader;->getNamespacePrefix(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v1}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceURI(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Ljavax/xml/stream/XMLStreamWriter;->writeNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    add-int/lit8 v1, v1, 0x1

    goto :goto_2d

    .line 55
    .end local v1    # "i":I
    :cond_43
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getNamespaceURI()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Ljavax/xml/stream/XMLStreamWriter;->writeStartElement(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2c

    .line 58
    :cond_51
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljavax/xml/stream/XMLStreamWriter;->writeStartElement(Ljava/lang/String;)V

    goto :goto_2c

    .line 67
    .end local v2    # "namespaceURI":Ljava/lang/String;
    .end local v3    # "prefix":Ljava/lang/String;
    :pswitch_5b
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v5}, Ljavax/xml/stream/XMLStreamWriter;->writeEndElement()V

    goto :goto_e

    .line 71
    :pswitch_61
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getTextCharacters()[C

    move-result-object v6

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getTextStart()I

    move-result v7

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getTextLength()I

    move-result v8

    invoke-interface {v5, v6, v7, v8}, Ljavax/xml/stream/XMLStreamWriter;->writeCharacters([CII)V

    goto :goto_e

    .line 76
    :pswitch_73
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getPITarget()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getPIData()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Ljavax/xml/stream/XMLStreamWriter;->writeProcessingInstruction(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_e

    .line 80
    :pswitch_81
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljavax/xml/stream/XMLStreamWriter;->writeCData(Ljava/lang/String;)V

    goto :goto_e

    .line 84
    :pswitch_8b
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljavax/xml/stream/XMLStreamWriter;->writeComment(Ljava/lang/String;)V

    goto/16 :goto_e

    .line 87
    :pswitch_96
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getLocalName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljavax/xml/stream/XMLStreamWriter;->writeEntityRef(Ljava/lang/String;)V

    goto/16 :goto_e

    .line 90
    :pswitch_a1
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getCharacterEncodingScheme()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "encoding":Ljava/lang/String;
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getVersion()Ljava/lang/String;

    move-result-object v4

    .line 93
    .local v4, "version":Ljava/lang/String;
    if-eqz v0, :cond_b4

    if-eqz v4, :cond_b4

    .line 94
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v5, v0, v4}, Ljavax/xml/stream/XMLStreamWriter;->writeStartDocument(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_e

    .line 96
    :cond_b4
    if-eqz v4, :cond_e

    .line 97
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getVersion()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljavax/xml/stream/XMLStreamWriter;->writeStartDocument(Ljava/lang/String;)V

    goto/16 :goto_e

    .line 100
    .end local v0    # "encoding":Ljava/lang/String;
    .end local v4    # "version":Ljava/lang/String;
    :pswitch_c1
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v5}, Ljavax/xml/stream/XMLStreamWriter;->writeEndDocument()V

    goto/16 :goto_e

    .line 103
    :pswitch_c8
    iget-object v5, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->getText()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljavax/xml/stream/XMLStreamWriter;->writeDTD(Ljava/lang/String;)V

    goto/16 :goto_e

    .line 45
    nop

    :pswitch_data_d4
    .packed-switch 0x1
        :pswitch_f
        :pswitch_5b
        :pswitch_73
        :pswitch_61
        :pswitch_8b
        :pswitch_61
        :pswitch_a1
        :pswitch_c1
        :pswitch_96
        :pswitch_e
        :pswitch_c8
        :pswitch_81
    .end packed-switch
.end method

.method public writeAll(Ljavax/xml/stream/XMLStreamReader;)Ljavax/xml/stream/XMLStreamWriter;
    .registers 3
    .param p1, "xmlr"    # Ljavax/xml/stream/XMLStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 112
    :goto_0
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 113
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/ReaderToWriter;->write(Ljavax/xml/stream/XMLStreamReader;)V

    .line 114
    invoke-interface {p1}, Ljavax/xml/stream/XMLStreamReader;->next()I

    goto :goto_0

    .line 116
    :cond_d
    iget-object v0, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    invoke-interface {v0}, Ljavax/xml/stream/XMLStreamWriter;->flush()V

    .line 117
    iget-object v0, p0, Lcom/bea/xml/stream/ReaderToWriter;->writer:Ljavax/xml/stream/XMLStreamWriter;

    return-object v0
.end method
