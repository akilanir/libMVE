.class public Lcom/sun/mail/handlers/text_xml;
.super Lcom/sun/mail/handlers/text_plain;
.source "text_xml.java"


# instance fields
.field private final flavors:[Lkore/awt/datatransfer/DataFlavor;


# direct methods
.method public constructor <init>()V
    .registers 7

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/sun/mail/handlers/text_plain;-><init>()V

    .line 68
    const/4 v0, 0x4

    new-array v0, v0, [Lkore/awt/datatransfer/DataFlavor;

    const/4 v1, 0x0

    new-instance v2, Lkorex/activation/ActivationDataFlavor;

    const-class v3, Ljava/lang/String;

    const-string v4, "text/xml"

    const-string v5, "XML String"

    invoke-direct {v2, v3, v4, v5}, Lkorex/activation/ActivationDataFlavor;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lkorex/activation/ActivationDataFlavor;

    const-class v3, Ljava/lang/String;

    const-string v4, "application/xml"

    const-string v5, "XML String"

    invoke-direct {v2, v3, v4, v5}, Lkorex/activation/ActivationDataFlavor;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Lkorex/activation/ActivationDataFlavor;

    const-class v3, Ljavax/xml/transform/stream/StreamSource;

    const-string v4, "text/xml"

    const-string v5, "XML"

    invoke-direct {v2, v3, v4, v5}, Lkorex/activation/ActivationDataFlavor;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Lkorex/activation/ActivationDataFlavor;

    const-class v3, Ljavax/xml/transform/stream/StreamSource;

    const-string v4, "application/xml"

    const-string v5, "XML"

    invoke-direct {v2, v3, v4, v5}, Lkorex/activation/ActivationDataFlavor;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/sun/mail/handlers/text_xml;->flavors:[Lkore/awt/datatransfer/DataFlavor;

    .line 76
    return-void
.end method

.method private isXmlType(Ljava/lang/String;)Z
    .registers 7
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 157
    :try_start_1
    new-instance v0, Lkorex/mail/internet/ContentType;

    invoke-direct {v0, p1}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V

    .line 158
    .local v0, "ct":Lkorex/mail/internet/ContentType;
    invoke-virtual {v0}, Lkorex/mail/internet/ContentType;->getSubType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "xml"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 159
    invoke-virtual {v0}, Lkorex/mail/internet/ContentType;->getPrimaryType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "text"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2a

    .line 160
    invoke-virtual {v0}, Lkorex/mail/internet/ContentType;->getPrimaryType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "application"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_27
    .catch Lkorex/mail/internet/ParseException; {:try_start_1 .. :try_end_27} :catch_2c
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_27} :catch_2e

    move-result v3

    if-eqz v3, :cond_2b

    :cond_2a
    const/4 v2, 0x1

    .line 164
    .end local v0    # "ct":Lkorex/mail/internet/ContentType;
    :cond_2b
    :goto_2b
    return v2

    .line 161
    :catch_2c
    move-exception v1

    .line 162
    .local v1, "ex":Lkorex/mail/internet/ParseException;
    goto :goto_2b

    .line 163
    .end local v1    # "ex":Lkorex/mail/internet/ParseException;
    :catch_2e
    move-exception v1

    .line 164
    .local v1, "ex":Ljava/lang/RuntimeException;
    goto :goto_2b
.end method


# virtual methods
.method public getTransferData(Lkore/awt/datatransfer/DataFlavor;Lkorex/activation/DataSource;)Ljava/lang/Object;
    .registers 8
    .param p1, "df"    # Lkore/awt/datatransfer/DataFlavor;
    .param p2, "ds"    # Lkorex/activation/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 97
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    iget-object v3, p0, Lcom/sun/mail/handlers/text_xml;->flavors:[Lkore/awt/datatransfer/DataFlavor;

    array-length v3, v3

    if-ge v1, v3, :cond_1d

    .line 98
    iget-object v3, p0, Lcom/sun/mail/handlers/text_xml;->flavors:[Lkore/awt/datatransfer/DataFlavor;

    aget-object v0, v3, v1

    .line 99
    .local v0, "aFlavor":Lkore/awt/datatransfer/DataFlavor;
    invoke-virtual {v0, p1}, Lkore/awt/datatransfer/DataFlavor;->equals(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v3

    if-eqz v3, :cond_30

    .line 100
    invoke-virtual {v0}, Lkore/awt/datatransfer/DataFlavor;->getRepresentationClass()Ljava/lang/Class;

    move-result-object v3

    const-class v4, Ljava/lang/String;

    if-ne v3, v4, :cond_1e

    .line 101
    invoke-super {p0, p2}, Lcom/sun/mail/handlers/text_plain;->getContent(Lkorex/activation/DataSource;)Ljava/lang/Object;

    move-result-object v2

    .line 108
    .end local v0    # "aFlavor":Lkore/awt/datatransfer/DataFlavor;
    :cond_1d
    :goto_1d
    return-object v2

    .line 102
    .restart local v0    # "aFlavor":Lkore/awt/datatransfer/DataFlavor;
    :cond_1e
    invoke-virtual {v0}, Lkore/awt/datatransfer/DataFlavor;->getRepresentationClass()Ljava/lang/Class;

    move-result-object v3

    const-class v4, Ljavax/xml/transform/stream/StreamSource;

    if-ne v3, v4, :cond_1d

    .line 103
    new-instance v2, Ljavax/xml/transform/stream/StreamSource;

    invoke-interface {p2}, Lkorex/activation/DataSource;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavax/xml/transform/stream/StreamSource;-><init>(Ljava/io/InputStream;)V

    goto :goto_1d

    .line 97
    :cond_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method public getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/sun/mail/handlers/text_xml;->flavors:[Lkore/awt/datatransfer/DataFlavor;

    invoke-virtual {v0}, [Lkore/awt/datatransfer/DataFlavor;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkore/awt/datatransfer/DataFlavor;

    check-cast v0, [Lkore/awt/datatransfer/DataFlavor;

    return-object v0
.end method

.method public writeTo(Ljava/lang/Object;Ljava/lang/String;Ljava/io/OutputStream;)V
    .registers 11
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    invoke-direct {p0, p2}, Lcom/sun/mail/handlers/text_xml;->isXmlType(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_25

    .line 116
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid content type \""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\" for text/xml DCH"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 118
    :cond_25
    instance-of v4, p1, Ljava/lang/String;

    if-eqz v4, :cond_2d

    .line 119
    invoke-super {p0, p1, p2, p3}, Lcom/sun/mail/handlers/text_plain;->writeTo(Ljava/lang/Object;Ljava/lang/String;Ljava/io/OutputStream;)V

    .line 153
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_2c
    return-void

    .line 122
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_2d
    instance-of v4, p1, Lkorex/activation/DataSource;

    if-nez v4, :cond_58

    instance-of v4, p1, Ljavax/xml/transform/Source;

    if-nez v4, :cond_58

    .line 123
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Invalid Object type = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ". XmlDCH can only convert DataSource or Source to XML."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 129
    :cond_58
    :try_start_58
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v4

    invoke-virtual {v4}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v3

    .line 130
    .local v3, "transformer":Ljavax/xml/transform/Transformer;
    new-instance v2, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v2, p3}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/OutputStream;)V

    .line 131
    .local v2, "result":Ljavax/xml/transform/stream/StreamResult;
    instance-of v4, p1, Lkorex/activation/DataSource;

    if-eqz v4, :cond_99

    .line 134
    new-instance v4, Ljavax/xml/transform/stream/StreamSource;

    check-cast p1, Lkorex/activation/DataSource;

    .line 135
    .end local p1    # "obj":Ljava/lang/Object;
    invoke-interface {p1}, Lkorex/activation/DataSource;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavax/xml/transform/stream/StreamSource;-><init>(Ljava/io/InputStream;)V

    .line 134
    invoke-virtual {v3, v4, v2}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V
    :try_end_77
    .catch Ljavax/xml/transform/TransformerException; {:try_start_58 .. :try_end_77} :catch_78
    .catch Ljava/lang/RuntimeException; {:try_start_58 .. :try_end_77} :catch_9f

    goto :goto_2c

    .line 140
    .end local v2    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v3    # "transformer":Ljavax/xml/transform/Transformer;
    :catch_78
    move-exception v0

    .line 141
    .local v0, "ex":Ljavax/xml/transform/TransformerException;
    new-instance v1, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to run the JAXP transformer on a stream "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 143
    invoke-virtual {v0}, Ljavax/xml/transform/TransformerException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 144
    .local v1, "ioex":Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 145
    throw v1

    .line 138
    .end local v0    # "ex":Ljavax/xml/transform/TransformerException;
    .end local v1    # "ioex":Ljava/io/IOException;
    .restart local v2    # "result":Ljavax/xml/transform/stream/StreamResult;
    .restart local v3    # "transformer":Ljavax/xml/transform/Transformer;
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_99
    :try_start_99
    check-cast p1, Ljavax/xml/transform/Source;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {v3, p1, v2}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V
    :try_end_9e
    .catch Ljavax/xml/transform/TransformerException; {:try_start_99 .. :try_end_9e} :catch_78
    .catch Ljava/lang/RuntimeException; {:try_start_99 .. :try_end_9e} :catch_9f

    goto :goto_2c

    .line 146
    .end local v2    # "result":Ljavax/xml/transform/stream/StreamResult;
    .end local v3    # "transformer":Ljavax/xml/transform/Transformer;
    :catch_9f
    move-exception v0

    .line 147
    .local v0, "ex":Ljava/lang/RuntimeException;
    new-instance v1, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to run the JAXP transformer on a stream "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 149
    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 150
    .restart local v1    # "ioex":Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 151
    throw v1
.end method
