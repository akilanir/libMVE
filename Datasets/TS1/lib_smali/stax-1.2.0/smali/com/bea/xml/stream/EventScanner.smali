.class public Lcom/bea/xml/stream/EventScanner;
.super Ljava/lang/Object;
.source "EventScanner.java"


# instance fields
.field protected currentChar:C

.field protected currentLine:I

.field private readEndDocument:Z

.field protected reader:Ljava/io/Reader;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput v0, p0, Lcom/bea/xml/stream/EventScanner;->currentLine:I

    .line 46
    iput-boolean v0, p0, Lcom/bea/xml/stream/EventScanner;->readEndDocument:Z

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .registers 3
    .param p1, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput v0, p0, Lcom/bea/xml/stream/EventScanner;->currentLine:I

    .line 46
    iput-boolean v0, p0, Lcom/bea/xml/stream/EventScanner;->readEndDocument:Z

    .line 51
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/EventScanner;->setReader(Ljava/io/Reader;)V

    .line 52
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 4
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 383
    new-instance v0, Lcom/bea/xml/stream/EventScanner;

    new-instance v1, Ljava/io/FileReader;

    const/4 v2, 0x0

    aget-object v2, p0, v2

    invoke-direct {v1, v2}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/bea/xml/stream/EventScanner;-><init>(Ljava/io/Reader;)V

    .line 384
    .local v0, "reader":Lcom/bea/xml/stream/EventScanner;
    :goto_d
    invoke-virtual {v0}, Lcom/bea/xml/stream/EventScanner;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 385
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Lcom/bea/xml/stream/EventScanner;->readElement()Lcom/bea/xml/stream/EventState;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_d

    .line 387
    :cond_1d
    return-void
.end method


# virtual methods
.method public endDocumentIsPresent()Z
    .registers 2

    .prologue
    .line 372
    iget-boolean v0, p0, Lcom/bea/xml/stream/EventScanner;->readEndDocument:Z

    return v0
.end method

.method protected getChar()C
    .registers 2

    .prologue
    .line 82
    iget-char v0, p0, Lcom/bea/xml/stream/EventScanner;->currentChar:C

    return v0
.end method

.method public getName(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 248
    const/16 v1, 0x3a

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 249
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    .line 250
    .end local p1    # "name":Ljava/lang/String;
    :goto_9
    return-object p1

    .restart local p1    # "name":Ljava/lang/String;
    :cond_a
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_9
.end method

.method public getPrefix(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 243
    const/16 v1, 0x3a

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 244
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_b

    const/4 v1, 0x0

    .line 245
    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_a
.end method

.method public hasNext()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 377
    iget-object v0, p0, Lcom/bea/xml/stream/EventScanner;->reader:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->ready()Z

    move-result v0

    if-eqz v0, :cond_e

    iget-boolean v0, p0, Lcom/bea/xml/stream/EventScanner;->readEndDocument:Z

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected read()C
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    iget-object v0, p0, Lcom/bea/xml/stream/EventScanner;->reader:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->read()I

    move-result v0

    int-to-char v0, v0

    iput-char v0, p0, Lcom/bea/xml/stream/EventScanner;->currentChar:C

    .line 94
    iget-char v0, p0, Lcom/bea/xml/stream/EventScanner;->currentChar:C

    const/16 v1, 0xa

    if-ne v0, v1, :cond_15

    iget v0, p0, Lcom/bea/xml/stream/EventScanner;->currentLine:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/bea/xml/stream/EventScanner;->currentLine:I

    .line 95
    :cond_15
    iget-char v0, p0, Lcom/bea/xml/stream/EventScanner;->currentChar:C

    return v0
.end method

.method protected read(C)C
    .registers 5
    .param p1, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    iget-char v0, p0, Lcom/bea/xml/stream/EventScanner;->currentChar:C

    if-ne v0, p1, :cond_9

    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->read()C

    move-result v0

    return v0

    .line 102
    :cond_9
    new-instance v0, Ljavax/xml/stream/XMLStreamException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unexpected character \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-char v2, p0, Lcom/bea/xml/stream/EventScanner;->currentChar:C

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' , expected \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' at line "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lcom/bea/xml/stream/EventScanner;->currentLine:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected read(Ljava/lang/String;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_11

    .line 108
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 107
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 109
    :cond_11
    return-void
.end method

.method public readAttribute()Ljavax/xml/stream/events/Attribute;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x5b

    const/16 v4, 0x5d

    .line 292
    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 293
    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 294
    invoke-virtual {p0, v4}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v1

    .line 295
    .local v1, "type":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 296
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readName()Ljavax/xml/namespace/QName;

    move-result-object v0

    .line 297
    .local v0, "n":Ljavax/xml/namespace/QName;
    const-string v3, "=["

    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/EventScanner;->read(Ljava/lang/String;)V

    .line 298
    invoke-virtual {p0, v4}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v2

    .line 299
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 300
    invoke-virtual {p0, v4}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 301
    const-string v3, "ATTRIBUTE"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_32

    .line 302
    new-instance v3, Lcom/bea/xml/stream/AttributeBase;

    invoke-direct {v3, v0, v2}, Lcom/bea/xml/stream/AttributeBase;-><init>(Ljavax/xml/namespace/QName;Ljava/lang/String;)V

    .line 306
    :goto_31
    return-object v3

    .line 303
    :cond_32
    const-string v3, "DEFAULT"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_40

    .line 304
    new-instance v3, Lcom/bea/xml/stream/NamespaceBase;

    invoke-direct {v3, v2}, Lcom/bea/xml/stream/NamespaceBase;-><init>(Ljava/lang/String;)V

    goto :goto_31

    .line 305
    :cond_40
    const-string v3, "NAMESPACE"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_52

    .line 306
    new-instance v3, Lcom/bea/xml/stream/NamespaceBase;

    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lcom/bea/xml/stream/NamespaceBase;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_31

    .line 308
    :cond_52
    new-instance v3, Ljavax/xml/stream/XMLStreamException;

    const-string v4, "Parser Error expected (ATTRIBUTE||DEFAULT|NAMESPACE"

    invoke-direct {v3, v4}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public readAttributes()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 282
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 283
    .local v0, "attributes":Ljava/util/List;
    :goto_5
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->getChar()C

    move-result v1

    const/16 v2, 0x5b

    if-ne v1, v2, :cond_15

    .line 284
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readAttribute()Ljavax/xml/stream/events/Attribute;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 286
    :cond_15
    return-object v0
.end method

.method public readCDATA()Lcom/bea/xml/stream/EventState;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x5d

    .line 183
    new-instance v0, Lcom/bea/xml/stream/EventState;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lcom/bea/xml/stream/EventState;-><init>(I)V

    .line 185
    .local v0, "state":Lcom/bea/xml/stream/EventState;
    const/16 v1, 0x5b

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 186
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    .line 187
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 188
    return-object v0
.end method

.method public readCharacterData()Lcom/bea/xml/stream/EventState;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x5d

    .line 173
    new-instance v0, Lcom/bea/xml/stream/EventState;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/bea/xml/stream/EventState;-><init>(I)V

    .line 175
    .local v0, "state":Lcom/bea/xml/stream/EventState;
    const/16 v1, 0x5b

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 176
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/EventState;->setData(Ljava/lang/String;)V

    .line 177
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 178
    return-object v0
.end method

.method public readComment()Lcom/bea/xml/stream/EventState;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x5d

    .line 235
    new-instance v0, Lcom/bea/xml/stream/EventState;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lcom/bea/xml/stream/EventState;-><init>(I)V

    .line 237
    .local v0, "state":Lcom/bea/xml/stream/EventState;
    const/16 v1, 0x5b

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 238
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/EventState;->setData(Ljava/lang/String;)V

    .line 239
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 240
    return-object v0
.end method

.method public readDTD()Lcom/bea/xml/stream/EventState;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x5d

    .line 217
    new-instance v1, Lcom/bea/xml/stream/EventState;

    const/16 v2, 0xb

    invoke-direct {v1, v2}, Lcom/bea/xml/stream/EventState;-><init>(I)V

    .line 219
    .local v1, "state":Lcom/bea/xml/stream/EventState;
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 220
    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v0

    .line 221
    .local v0, "dtd":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 222
    invoke-virtual {v1, v0}, Lcom/bea/xml/stream/EventState;->setData(Ljava/lang/String;)V

    .line 223
    return-object v1
.end method

.method public readElement()Lcom/bea/xml/stream/EventState;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 337
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readType()I

    move-result v1

    .line 339
    .local v1, "type":I
    packed-switch v1, :pswitch_data_68

    .line 364
    :pswitch_7
    new-instance v2, Ljavax/xml/stream/XMLStreamException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Attempt to read unknown element ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavax/xml/stream/XMLStreamException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 341
    :pswitch_26
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readStartElement()Lcom/bea/xml/stream/EventState;

    move-result-object v0

    .line 366
    .local v0, "state":Lcom/bea/xml/stream/EventState;
    :goto_2a
    const/16 v2, 0x3b

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 367
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->skipSpace()V

    .line 368
    return-object v0

    .line 343
    .end local v0    # "state":Lcom/bea/xml/stream/EventState;
    :pswitch_33
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readEndElement()Lcom/bea/xml/stream/EventState;

    move-result-object v0

    .restart local v0    # "state":Lcom/bea/xml/stream/EventState;
    goto :goto_2a

    .line 345
    .end local v0    # "state":Lcom/bea/xml/stream/EventState;
    :pswitch_38
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readProcessingInstruction()Lcom/bea/xml/stream/EventState;

    move-result-object v0

    .restart local v0    # "state":Lcom/bea/xml/stream/EventState;
    goto :goto_2a

    .line 347
    .end local v0    # "state":Lcom/bea/xml/stream/EventState;
    :pswitch_3d
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readCharacterData()Lcom/bea/xml/stream/EventState;

    move-result-object v0

    .restart local v0    # "state":Lcom/bea/xml/stream/EventState;
    goto :goto_2a

    .line 349
    .end local v0    # "state":Lcom/bea/xml/stream/EventState;
    :pswitch_42
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readComment()Lcom/bea/xml/stream/EventState;

    move-result-object v0

    .restart local v0    # "state":Lcom/bea/xml/stream/EventState;
    goto :goto_2a

    .line 351
    .end local v0    # "state":Lcom/bea/xml/stream/EventState;
    :pswitch_47
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readStartDocument()Lcom/bea/xml/stream/EventState;

    move-result-object v0

    .restart local v0    # "state":Lcom/bea/xml/stream/EventState;
    goto :goto_2a

    .line 353
    .end local v0    # "state":Lcom/bea/xml/stream/EventState;
    :pswitch_4c
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/bea/xml/stream/EventScanner;->readEndDocument:Z

    .line 354
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readEndDocument()Lcom/bea/xml/stream/EventState;

    move-result-object v0

    .restart local v0    # "state":Lcom/bea/xml/stream/EventState;
    goto :goto_2a

    .line 356
    .end local v0    # "state":Lcom/bea/xml/stream/EventState;
    :pswitch_54
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readEntityReference()Lcom/bea/xml/stream/EventState;

    move-result-object v0

    .restart local v0    # "state":Lcom/bea/xml/stream/EventState;
    goto :goto_2a

    .line 358
    .end local v0    # "state":Lcom/bea/xml/stream/EventState;
    :pswitch_59
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readSpace()Lcom/bea/xml/stream/EventState;

    move-result-object v0

    .restart local v0    # "state":Lcom/bea/xml/stream/EventState;
    goto :goto_2a

    .line 360
    .end local v0    # "state":Lcom/bea/xml/stream/EventState;
    :pswitch_5e
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readDTD()Lcom/bea/xml/stream/EventState;

    move-result-object v0

    .restart local v0    # "state":Lcom/bea/xml/stream/EventState;
    goto :goto_2a

    .line 362
    .end local v0    # "state":Lcom/bea/xml/stream/EventState;
    :pswitch_63
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readCDATA()Lcom/bea/xml/stream/EventState;

    move-result-object v0

    .restart local v0    # "state":Lcom/bea/xml/stream/EventState;
    goto :goto_2a

    .line 339
    :pswitch_data_68
    .packed-switch 0x1
        :pswitch_26
        :pswitch_33
        :pswitch_38
        :pswitch_3d
        :pswitch_42
        :pswitch_59
        :pswitch_47
        :pswitch_4c
        :pswitch_54
        :pswitch_7
        :pswitch_5e
        :pswitch_63
    .end packed-switch
.end method

.method public readEndDocument()Lcom/bea/xml/stream/EventState;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    .line 228
    new-instance v0, Lcom/bea/xml/stream/EventState;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lcom/bea/xml/stream/EventState;-><init>(I)V

    .line 230
    .local v0, "state":Lcom/bea/xml/stream/EventState;
    return-object v0
.end method

.method public readEndElement()Lcom/bea/xml/stream/EventState;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    new-instance v0, Lcom/bea/xml/stream/EventState;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcom/bea/xml/stream/EventState;-><init>(I)V

    .line 146
    .local v0, "state":Lcom/bea/xml/stream/EventState;
    const/16 v1, 0x5b

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 147
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readName()Ljavax/xml/namespace/QName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/EventState;->setName(Ljavax/xml/namespace/QName;)V

    .line 148
    const/16 v1, 0x5d

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 149
    return-object v0
.end method

.method public readEntityReference()Lcom/bea/xml/stream/EventState;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x5d

    .line 315
    new-instance v0, Lcom/bea/xml/stream/EventState;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lcom/bea/xml/stream/EventState;-><init>(I)V

    .line 317
    .local v0, "state":Lcom/bea/xml/stream/EventState;
    const/16 v1, 0x5b

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 318
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bea/xml/stream/EventState;->setData(Ljava/lang/String;)V

    .line 319
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 320
    return-object v0
.end method

.method public readName()Ljavax/xml/namespace/QName;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x5d

    .line 255
    const/16 v1, 0x5b

    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 256
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->readName(C)Ljavax/xml/namespace/QName;

    move-result-object v0

    .line 257
    .local v0, "n":Ljavax/xml/namespace/QName;
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 258
    return-object v0
.end method

.method public readName(C)Ljavax/xml/namespace/QName;
    .registers 8
    .param p1, "delim"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x27

    .line 264
    const-string v3, ""

    .line 265
    .local v3, "uri":Ljava/lang/String;
    const-string v2, ""

    .line 266
    .local v2, "prefix":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->getChar()C

    move-result v4

    if-ne v4, v5, :cond_1b

    .line 267
    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 268
    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v3

    .line 269
    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 270
    const/16 v4, 0x3a

    invoke-virtual {p0, v4}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 272
    :cond_1b
    invoke-virtual {p0, p1}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v1

    .line 273
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/EventScanner;->getPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 274
    if-nez v2, :cond_27

    const-string v2, ""

    .line 275
    :cond_27
    invoke-virtual {p0, v1}, Lcom/bea/xml/stream/EventScanner;->getName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 276
    .local v0, "localName":Ljava/lang/String;
    new-instance v4, Ljavax/xml/namespace/QName;

    invoke-direct {v4, v3, v0, v2}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v4
.end method

.method public readProcessingInstruction()Lcom/bea/xml/stream/EventState;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x5d

    .line 155
    new-instance v2, Lcom/bea/xml/stream/EventState;

    const/4 v3, 0x3

    invoke-direct {v2, v3}, Lcom/bea/xml/stream/EventState;-><init>(I)V

    .line 157
    .local v2, "state":Lcom/bea/xml/stream/EventState;
    const/16 v3, 0x5b

    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 158
    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v0

    .line 159
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 160
    const/4 v1, 0x0

    .line 161
    .local v1, "s":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->getChar()C

    move-result v3

    const/16 v4, 0x2c

    if-ne v3, v4, :cond_29

    .line 162
    const-string v3, ",["

    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/EventScanner;->read(Ljava/lang/String;)V

    .line 163
    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v1

    .line 164
    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 166
    :cond_29
    invoke-virtual {v2, v0}, Lcom/bea/xml/stream/EventState;->setData(Ljava/lang/String;)V

    .line 167
    invoke-virtual {v2, v1}, Lcom/bea/xml/stream/EventState;->setExtraData(Ljava/lang/String;)V

    .line 168
    return-object v2
.end method

.method public readSpace()Lcom/bea/xml/stream/EventState;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x5d

    .line 325
    new-instance v1, Lcom/bea/xml/stream/EventState;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Lcom/bea/xml/stream/EventState;-><init>(I)V

    .line 327
    .local v1, "state":Lcom/bea/xml/stream/EventState;
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 328
    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v0

    .line 329
    .local v0, "content":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 330
    invoke-virtual {v1, v0}, Lcom/bea/xml/stream/EventState;->setData(Ljava/lang/String;)V

    .line 331
    return-object v1
.end method

.method public readStartDocument()Lcom/bea/xml/stream/EventState;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x5b

    const/16 v5, 0x5d

    .line 195
    new-instance v1, Lcom/bea/xml/stream/EventState;

    const/4 v3, 0x7

    invoke-direct {v1, v3}, Lcom/bea/xml/stream/EventState;-><init>(I)V

    .line 197
    .local v1, "state":Lcom/bea/xml/stream/EventState;
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->getChar()C

    move-result v3

    const/16 v4, 0x3b

    if-eq v3, v4, :cond_37

    .line 198
    invoke-virtual {p0, v6}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 199
    invoke-virtual {p0, v6}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 200
    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v2

    .line 201
    .local v2, "version":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 202
    const/16 v3, 0x2c

    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 203
    invoke-virtual {p0, v6}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 204
    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v0

    .line 205
    .local v0, "encoding":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 206
    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 207
    invoke-virtual {v1, v2}, Lcom/bea/xml/stream/EventState;->setData(Ljava/lang/String;)V

    .line 208
    invoke-virtual {v1, v0}, Lcom/bea/xml/stream/EventState;->setExtraData(Ljava/lang/String;)V

    .line 210
    .end local v0    # "encoding":Ljava/lang/String;
    .end local v2    # "version":Ljava/lang/String;
    :cond_37
    return-object v1
.end method

.method public readStartElement()Lcom/bea/xml/stream/EventState;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x5b

    .line 123
    new-instance v3, Lcom/bea/xml/stream/EventState;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Lcom/bea/xml/stream/EventState;-><init>(I)V

    .line 124
    .local v3, "state":Lcom/bea/xml/stream/EventState;
    invoke-virtual {p0, v5}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 125
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readName()Ljavax/xml/namespace/QName;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/bea/xml/stream/EventState;->setName(Ljavax/xml/namespace/QName;)V

    .line 126
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->getChar()C

    move-result v4

    if-ne v4, v5, :cond_36

    .line 127
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->readAttributes()Ljava/util/List;

    move-result-object v0

    .line 128
    .local v0, "atts":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 129
    .local v1, "i":Ljava/util/Iterator;
    :goto_20
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_36

    .line 130
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 131
    .local v2, "obj":Ljava/lang/Object;
    instance-of v4, v2, Ljavax/xml/stream/events/Namespace;

    if-eqz v4, :cond_32

    .line 132
    invoke-virtual {v3, v2}, Lcom/bea/xml/stream/EventState;->addNamespace(Ljava/lang/Object;)V

    goto :goto_20

    .line 134
    :cond_32
    invoke-virtual {v3, v2}, Lcom/bea/xml/stream/EventState;->addAttribute(Ljava/lang/Object;)V

    goto :goto_20

    .line 138
    .end local v0    # "atts":Ljava/util/List;
    .end local v1    # "i":Ljava/util/Iterator;
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_36
    const/16 v4, 0x5d

    invoke-virtual {p0, v4}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 139
    return-object v3
.end method

.method protected readString(C)Ljava/lang/String;
    .registers 6
    .param p1, "delim"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/xml/stream/XMLStreamException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x5b

    const/16 v2, 0x5d

    .line 64
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 65
    .local v0, "buf":Ljava/lang/StringBuffer;
    :goto_9
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->getChar()C

    move-result v1

    if-eq v1, p1, :cond_3c

    .line 66
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->getChar()C

    move-result v1

    if-ne v1, v3, :cond_31

    if-ne p1, v2, :cond_31

    .line 67
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->read()C

    .line 68
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 69
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->getChar()C

    move-result v1

    if-eq v1, v2, :cond_2a

    .line 70
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 71
    :cond_2a
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 72
    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    goto :goto_9

    .line 74
    :cond_31
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->getChar()C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 75
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->read()C

    goto :goto_9

    .line 78
    :cond_3c
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected readType()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/stream/XMLStreamException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x5d

    .line 114
    const/16 v2, 0x5b

    invoke-virtual {p0, v2}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 115
    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/EventScanner;->readString(C)Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, "typeName":Ljava/lang/String;
    invoke-static {v1}, Lcom/bea/xml/stream/util/ElementTypeNames;->getEventType(Ljava/lang/String;)I

    move-result v0

    .line 117
    .local v0, "type":I
    invoke-virtual {p0, v3}, Lcom/bea/xml/stream/EventScanner;->read(C)C

    .line 118
    return v0
.end method

.method public setReader(Ljava/io/Reader;)V
    .registers 2
    .param p1, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    iput-object p1, p0, Lcom/bea/xml/stream/EventScanner;->reader:Ljava/io/Reader;

    .line 57
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->read()C

    .line 58
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->skipSpace()V

    .line 59
    return-void
.end method

.method protected skipSpace()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 87
    :goto_2
    iget-char v0, p0, Lcom/bea/xml/stream/EventScanner;->currentChar:C

    const/16 v3, 0x20

    if-ne v0, v3, :cond_27

    move v0, v1

    :goto_9
    iget-char v3, p0, Lcom/bea/xml/stream/EventScanner;->currentChar:C

    const/16 v4, 0xa

    if-ne v3, v4, :cond_29

    move v3, v1

    :goto_10
    or-int/2addr v3, v0

    iget-char v0, p0, Lcom/bea/xml/stream/EventScanner;->currentChar:C

    const/16 v4, 0x9

    if-ne v0, v4, :cond_2b

    move v0, v1

    :goto_18
    or-int/2addr v3, v0

    iget-char v0, p0, Lcom/bea/xml/stream/EventScanner;->currentChar:C

    const/16 v4, 0xd

    if-ne v0, v4, :cond_2d

    move v0, v1

    :goto_20
    or-int/2addr v0, v3

    if-eqz v0, :cond_2f

    .line 88
    invoke-virtual {p0}, Lcom/bea/xml/stream/EventScanner;->read()C

    goto :goto_2

    :cond_27
    move v0, v2

    .line 87
    goto :goto_9

    :cond_29
    move v3, v2

    goto :goto_10

    :cond_2b
    move v0, v2

    goto :goto_18

    :cond_2d
    move v0, v2

    goto :goto_20

    .line 89
    :cond_2f
    return-void
.end method
