.class public Lezvcard/io/text/VCardReader;
.super Lezvcard/io/StreamReader;
.source "VCardReader.java"


# instance fields
.field private defaultQuotedPrintableCharset:Ljava/nio/charset/Charset;

.field private final reader:Lezvcard/io/text/VCardRawReader;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 110
    new-instance v0, Ljava/io/FileReader;

    invoke-direct {v0, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v0}, Lezvcard/io/text/VCardReader;-><init>(Ljava/io/Reader;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 101
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, v0}, Lezvcard/io/text/VCardReader;-><init>(Ljava/io/Reader;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .registers 3
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    .line 117
    invoke-direct {p0}, Lezvcard/io/StreamReader;-><init>()V

    .line 118
    new-instance v0, Lezvcard/io/text/VCardRawReader;

    invoke-direct {v0, p1}, Lezvcard/io/text/VCardRawReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    .line 119
    iget-object v0, p0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    invoke-virtual {v0}, Lezvcard/io/text/VCardRawReader;->getEncoding()Ljava/nio/charset/Charset;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/text/VCardReader;->defaultQuotedPrintableCharset:Ljava/nio/charset/Charset;

    .line 120
    iget-object v0, p0, Lezvcard/io/text/VCardReader;->defaultQuotedPrintableCharset:Ljava/nio/charset/Charset;

    if-nez v0, :cond_1c

    .line 121
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/text/VCardReader;->defaultQuotedPrintableCharset:Ljava/nio/charset/Charset;

    .line 123
    :cond_1c
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 93
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lezvcard/io/text/VCardReader;-><init>(Ljava/io/Reader;)V

    .line 94
    return-void
.end method

.method private decodeQuotedPrintable(Ljava/lang/String;Lezvcard/parameter/VCardParameters;Ljava/lang/String;)Ljava/lang/String;
    .registers 14
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "parameters"    # Lezvcard/parameter/VCardParameters;
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lezvcard/util/org/apache/commons/codec/DecoderException;
        }
    .end annotation

    .prologue
    .line 409
    invoke-virtual {p2}, Lezvcard/parameter/VCardParameters;->getEncoding()Lezvcard/parameter/Encoding;

    move-result-object v4

    sget-object v5, Lezvcard/parameter/Encoding;->QUOTED_PRINTABLE:Lezvcard/parameter/Encoding;

    if-eq v4, v5, :cond_9

    .line 433
    .end local p3    # "value":Ljava/lang/String;
    :goto_8
    return-object p3

    .line 414
    .restart local p3    # "value":Ljava/lang/String;
    :cond_9
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lezvcard/parameter/VCardParameters;->setEncoding(Lezvcard/parameter/Encoding;)V

    .line 417
    const/4 v0, 0x0

    .line 418
    .local v0, "charset":Ljava/nio/charset/Charset;
    invoke-virtual {p2}, Lezvcard/parameter/VCardParameters;->getCharset()Ljava/lang/String;

    move-result-object v1

    .line 419
    .local v1, "charsetStr":Ljava/lang/String;
    if-nez v1, :cond_24

    .line 420
    iget-object v0, p0, Lezvcard/io/text/VCardReader;->defaultQuotedPrintableCharset:Ljava/nio/charset/Charset;

    .line 432
    :goto_16
    new-instance v2, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;-><init>(Ljava/lang/String;)V

    .line 433
    .local v2, "codec":Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;
    invoke-virtual {v2, p3}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    goto :goto_8

    .line 423
    .end local v2    # "codec":Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;
    :cond_24
    :try_start_24
    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    :try_end_27
    .catch Ljava/lang/Throwable; {:try_start_24 .. :try_end_27} :catch_29

    move-result-object v0

    goto :goto_16

    .line 424
    :catch_29
    move-exception v3

    .line 425
    .local v3, "t":Ljava/lang/Throwable;
    iget-object v0, p0, Lezvcard/io/text/VCardReader;->defaultQuotedPrintableCharset:Ljava/nio/charset/Charset;

    .line 428
    iget-object v4, p0, Lezvcard/io/text/VCardReader;->warnings:Lezvcard/io/ParseWarnings;

    iget-object v5, p0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    invoke-virtual {v5}, Lezvcard/io/text/VCardRawReader;->getLineNum()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v6, 0x17

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v1, v7, v8

    const/4 v8, 0x1

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v4, v5, p1, v6, v7}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto :goto_16
.end method

.method private processNamelessParameters(Lezvcard/parameter/VCardParameters;)V
    .registers 8
    .param p1, "parameters"    # Lezvcard/parameter/VCardParameters;

    .prologue
    const/4 v5, 0x0

    .line 355
    invoke-virtual {p1, v5}, Lezvcard/parameter/VCardParameters;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 356
    .local v1, "namelessParamValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 358
    .local v3, "paramValue":Ljava/lang/String;
    invoke-static {v3}, Lezvcard/VCardDataType;->find(Ljava/lang/String;)Lezvcard/VCardDataType;

    move-result-object v4

    if-eqz v4, :cond_21

    .line 359
    const-string v2, "VALUE"

    .line 366
    .local v2, "paramName":Ljava/lang/String;
    :goto_1d
    invoke-virtual {p1, v2, v3}, Lezvcard/parameter/VCardParameters;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_9

    .line 360
    .end local v2    # "paramName":Ljava/lang/String;
    :cond_21
    invoke-static {v3}, Lezvcard/parameter/Encoding;->find(Ljava/lang/String;)Lezvcard/parameter/Encoding;

    move-result-object v4

    if-eqz v4, :cond_2a

    .line 361
    const-string v2, "ENCODING"

    .restart local v2    # "paramName":Ljava/lang/String;
    goto :goto_1d

    .line 364
    .end local v2    # "paramName":Ljava/lang/String;
    :cond_2a
    const-string v2, "TYPE"

    .restart local v2    # "paramName":Ljava/lang/String;
    goto :goto_1d

    .line 368
    .end local v2    # "paramName":Ljava/lang/String;
    .end local v3    # "paramValue":Ljava/lang/String;
    :cond_2d
    invoke-virtual {p1, v5}, Lezvcard/parameter/VCardParameters;->removeAll(Ljava/lang/Object;)Ljava/util/List;

    .line 369
    return-void
.end method

.method private processQuotedMultivaluedTypeParams(Lezvcard/parameter/VCardParameters;)V
    .registers 9
    .param p1, "parameters"    # Lezvcard/parameter/VCardParameters;

    .prologue
    .line 387
    invoke-virtual {p1}, Lezvcard/parameter/VCardParameters;->getTypes()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_31

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 388
    .local v5, "typeParameter":Ljava/lang/String;
    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 392
    invoke-virtual {p1}, Lezvcard/parameter/VCardParameters;->removeTypes()V

    .line 393
    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_27
    if-ge v2, v3, :cond_8

    aget-object v4, v0, v2

    .line 394
    .local v4, "splitValue":Ljava/lang/String;
    invoke-virtual {p1, v4}, Lezvcard/parameter/VCardParameters;->addType(Ljava/lang/String;)V

    .line 393
    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    .line 397
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "splitValue":Ljava/lang/String;
    .end local v5    # "typeParameter":Ljava/lang/String;
    :cond_31
    return-void
.end method


# virtual methods
.method protected _readNext()Lezvcard/VCard;
    .registers 35
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    const/16 v19, 0x0

    .line 184
    .local v19, "root":Lezvcard/VCard;
    new-instance v23, Ljava/util/LinkedList;

    invoke-direct/range {v23 .. v23}, Ljava/util/LinkedList;-><init>()V

    .line 185
    .local v23, "vcardStack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lezvcard/VCard;>;"
    new-instance v11, Ljava/util/LinkedList;

    invoke-direct {v11}, Ljava/util/LinkedList;-><init>()V

    .line 186
    .local v11, "labelStack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/util/List<Lezvcard/property/Label;>;>;"
    const/4 v8, 0x0

    .line 191
    .local v8, "embeddedVCardException":Lezvcard/io/EmbeddedVCardException;
    :cond_d
    :goto_d
    :try_start_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lezvcard/io/text/VCardRawReader;->readLine()Lezvcard/io/text/VCardRawLine;
    :try_end_16
    .catch Lezvcard/io/text/VCardParseException; {:try_start_d .. :try_end_16} :catch_1a

    move-result-object v13

    .line 200
    .local v13, "line":Lezvcard/io/text/VCardRawLine;
    if-nez v13, :cond_4d

    .line 346
    :goto_19
    return-object v19

    .line 192
    .end local v13    # "line":Lezvcard/io/text/VCardRawLine;
    :catch_1a
    move-exception v7

    .line 193
    .local v7, "e":Lezvcard/io/text/VCardParseException;
    invoke-virtual/range {v23 .. v23}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v27

    if-nez v27, :cond_d

    .line 194
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lezvcard/io/text/VCardRawReader;->getLineNum()I

    move-result v28

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    const/16 v29, 0x0

    const/16 v30, 0x1b

    const/16 v31, 0x1

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    invoke-virtual {v7}, Lezvcard/io/text/VCardParseException;->getLine()Ljava/lang/String;

    move-result-object v33

    aput-object v33, v31, v32

    invoke-virtual/range {v27 .. v31}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto :goto_d

    .line 205
    .end local v7    # "e":Lezvcard/io/text/VCardParseException;
    .restart local v13    # "line":Lezvcard/io/text/VCardRawLine;
    :cond_4d
    const-string v27, "BEGIN"

    invoke-virtual {v13}, Lezvcard/io/text/VCardRawLine;->getName()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v27

    if-eqz v27, :cond_9a

    const-string v27, "VCARD"

    invoke-virtual {v13}, Lezvcard/io/text/VCardRawLine;->getValue()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v27

    if-eqz v27, :cond_9a

    .line 206
    new-instance v22, Lezvcard/VCard;

    invoke-direct/range {v22 .. v22}, Lezvcard/VCard;-><init>()V

    .line 207
    .local v22, "vcard":Lezvcard/VCard;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lezvcard/io/text/VCardRawReader;->getVersion()Lezvcard/VCardVersion;

    move-result-object v27

    move-object/from16 v0, v22

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lezvcard/VCard;->setVersion(Lezvcard/VCardVersion;)V

    .line 208
    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 209
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v11, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 211
    if-nez v19, :cond_90

    .line 212
    move-object/from16 v19, v22

    .line 215
    :cond_90
    if-eqz v8, :cond_d

    .line 216
    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Lezvcard/io/EmbeddedVCardException;->injectVCard(Lezvcard/VCard;)V

    .line 217
    const/4 v8, 0x0

    goto/16 :goto_d

    .line 223
    .end local v22    # "vcard":Lezvcard/VCard;
    :cond_9a
    invoke-virtual/range {v23 .. v23}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v27

    if-nez v27, :cond_d

    .line 229
    const-string v27, "VERSION"

    invoke-virtual {v13}, Lezvcard/io/text/VCardRawLine;->getName()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v27

    if-eqz v27, :cond_c1

    .line 230
    invoke-virtual/range {v23 .. v23}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lezvcard/VCard;

    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lezvcard/io/text/VCardRawReader;->getVersion()Lezvcard/VCardVersion;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Lezvcard/VCard;->setVersion(Lezvcard/VCardVersion;)V

    goto/16 :goto_d

    .line 235
    :cond_c1
    const-string v27, "END"

    invoke-virtual {v13}, Lezvcard/io/text/VCardRawLine;->getName()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v27

    if-eqz v27, :cond_f2

    const-string v27, "VCARD"

    invoke-virtual {v13}, Lezvcard/io/text/VCardRawLine;->getValue()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v27

    if-eqz v27, :cond_f2

    .line 236
    invoke-virtual/range {v23 .. v23}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lezvcard/VCard;

    .line 237
    .local v5, "curVCard":Lezvcard/VCard;
    invoke-virtual {v11}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    .line 238
    .local v12, "labels":Ljava/util/List;, "Ljava/util/List<Lezvcard/property/Label;>;"
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v12}, Lezvcard/io/text/VCardReader;->assignLabels(Lezvcard/VCard;Ljava/util/List;)V

    .line 240
    invoke-virtual/range {v23 .. v23}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v27

    if-eqz v27, :cond_d

    goto/16 :goto_19

    .line 249
    .end local v5    # "curVCard":Lezvcard/VCard;
    .end local v12    # "labels":Ljava/util/List;, "Ljava/util/List<Lezvcard/property/Label;>;"
    :cond_f2
    invoke-virtual {v13}, Lezvcard/io/text/VCardRawLine;->getGroup()Ljava/lang/String;

    move-result-object v9

    .line 250
    .local v9, "group":Ljava/lang/String;
    invoke-virtual {v13}, Lezvcard/io/text/VCardRawLine;->getParameters()Lezvcard/parameter/VCardParameters;

    move-result-object v16

    .line 251
    .local v16, "parameters":Lezvcard/parameter/VCardParameters;
    invoke-virtual {v13}, Lezvcard/io/text/VCardRawLine;->getName()Ljava/lang/String;

    move-result-object v14

    .line 252
    .local v14, "name":Ljava/lang/String;
    invoke-virtual {v13}, Lezvcard/io/text/VCardRawLine;->getValue()Ljava/lang/String;

    move-result-object v21

    .line 254
    .local v21, "value":Ljava/lang/String;
    if-eqz v8, :cond_10c

    .line 256
    const/16 v27, 0x0

    move-object/from16 v0, v27

    invoke-virtual {v8, v0}, Lezvcard/io/EmbeddedVCardException;->injectVCard(Lezvcard/VCard;)V

    .line 257
    const/4 v8, 0x0

    .line 260
    :cond_10c
    invoke-virtual/range {v23 .. v23}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lezvcard/VCard;

    .line 261
    .restart local v5    # "curVCard":Lezvcard/VCard;
    invoke-virtual {v5}, Lezvcard/VCard;->getVersion()Lezvcard/VCardVersion;

    move-result-object v24

    .line 264
    .local v24, "version":Lezvcard/VCardVersion;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lezvcard/io/text/VCardReader;->processNamelessParameters(Lezvcard/parameter/VCardParameters;)V

    .line 265
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lezvcard/io/text/VCardReader;->processQuotedMultivaluedTypeParams(Lezvcard/parameter/VCardParameters;)V

    .line 269
    :try_start_124
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v21

    invoke-direct {v0, v14, v1, v2}, Lezvcard/io/text/VCardReader;->decodeQuotedPrintable(Ljava/lang/String;Lezvcard/parameter/VCardParameters;Ljava/lang/String;)Ljava/lang/String;
    :try_end_12d
    .catch Lezvcard/util/org/apache/commons/codec/DecoderException; {:try_start_124 .. :try_end_12d} :catch_1c3

    move-result-object v21

    .line 275
    :goto_12e
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->index:Lezvcard/io/scribe/ScribeIndex;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    invoke-virtual {v0, v14}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/String;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v20

    .line 276
    .local v20, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    if-nez v20, :cond_143

    .line 277
    new-instance v20, Lezvcard/io/scribe/RawPropertyScribe;

    .end local v20    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    move-object/from16 v0, v20

    invoke-direct {v0, v14}, Lezvcard/io/scribe/RawPropertyScribe;-><init>(Ljava/lang/String;)V

    .line 281
    .restart local v20    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    :cond_143
    invoke-virtual/range {v16 .. v16}, Lezvcard/parameter/VCardParameters;->getValue()Lezvcard/VCardDataType;

    move-result-object v6

    .line 282
    .local v6, "dataType":Lezvcard/VCardDataType;
    if-nez v6, :cond_1f7

    .line 284
    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lezvcard/io/scribe/VCardPropertyScribe;->defaultDataType(Lezvcard/VCardVersion;)Lezvcard/VCardDataType;

    move-result-object v6

    .line 292
    :goto_151
    :try_start_151
    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v24

    move-object/from16 v3, v16

    invoke-virtual {v0, v1, v6, v2, v3}, Lezvcard/io/scribe/VCardPropertyScribe;->parseText(Ljava/lang/String;Lezvcard/VCardDataType;Lezvcard/VCardVersion;Lezvcard/parameter/VCardParameters;)Lezvcard/io/scribe/VCardPropertyScribe$Result;

    move-result-object v18

    .line 294
    .local v18, "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    invoke-virtual/range {v18 .. v18}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getWarnings()Ljava/util/List;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_165
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_202

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Ljava/lang/String;

    .line 295
    .local v26, "warning":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lezvcard/io/text/VCardRawReader;->getLineNum()I

    move-result v28

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v14, v2}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_18e
    .catch Lezvcard/io/SkipMeException; {:try_start_151 .. :try_end_18e} :catch_18f
    .catch Lezvcard/io/CannotParseException; {:try_start_151 .. :try_end_18e} :catch_224
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_151 .. :try_end_18e} :catch_276

    goto :goto_165

    .line 307
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v18    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    .end local v26    # "warning":Ljava/lang/String;
    :catch_18f
    move-exception v7

    .line 308
    .local v7, "e":Lezvcard/io/SkipMeException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lezvcard/io/text/VCardRawReader;->getLineNum()I

    move-result v28

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    const/16 v29, 0x16

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-virtual {v7}, Lezvcard/io/SkipMeException;->getMessage()Ljava/lang/String;

    move-result-object v32

    aput-object v32, v30, v31

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move/from16 v2, v29

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v14, v2, v3}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto/16 :goto_d

    .line 270
    .end local v6    # "dataType":Lezvcard/VCardDataType;
    .end local v7    # "e":Lezvcard/io/SkipMeException;
    .end local v20    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    :catch_1c3
    move-exception v7

    .line 271
    .local v7, "e":Lezvcard/util/org/apache/commons/codec/DecoderException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lezvcard/io/text/VCardRawReader;->getLineNum()I

    move-result v28

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    const/16 v29, 0x26

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-virtual {v7}, Lezvcard/util/org/apache/commons/codec/DecoderException;->getMessage()Ljava/lang/String;

    move-result-object v32

    aput-object v32, v30, v31

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move/from16 v2, v29

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v14, v2, v3}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto/16 :goto_12e

    .line 287
    .end local v7    # "e":Lezvcard/util/org/apache/commons/codec/DecoderException;
    .restart local v6    # "dataType":Lezvcard/VCardDataType;
    .restart local v20    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    :cond_1f7
    const/16 v27, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lezvcard/parameter/VCardParameters;->setValue(Lezvcard/VCardDataType;)V

    goto/16 :goto_151

    .line 298
    .restart local v10    # "i$":Ljava/util/Iterator;
    .restart local v18    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    :cond_202
    :try_start_202
    invoke-virtual/range {v18 .. v18}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getProperty()Lezvcard/property/VCardProperty;

    move-result-object v17

    .line 299
    .local v17, "property":Lezvcard/property/VCardProperty;
    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Lezvcard/property/VCardProperty;->setGroup(Ljava/lang/String;)V

    .line 301
    move-object/from16 v0, v17

    instance-of v0, v0, Lezvcard/property/Label;

    move/from16 v27, v0

    if-eqz v27, :cond_26f

    .line 303
    invoke-virtual {v11}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Ljava/util/List;

    check-cast v17, Lezvcard/property/Label;

    .end local v17    # "property":Lezvcard/property/VCardProperty;
    move-object/from16 v0, v27

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_222
    .catch Lezvcard/io/SkipMeException; {:try_start_202 .. :try_end_222} :catch_18f
    .catch Lezvcard/io/CannotParseException; {:try_start_202 .. :try_end_222} :catch_224
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_202 .. :try_end_222} :catch_276

    goto/16 :goto_d

    .line 309
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v18    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    :catch_224
    move-exception v7

    .line 310
    .local v7, "e":Lezvcard/io/CannotParseException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lezvcard/io/text/VCardRawReader;->getLineNum()I

    move-result v28

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    const/16 v29, 0x19

    const/16 v30, 0x2

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aput-object v21, v30, v31

    const/16 v31, 0x1

    invoke-virtual {v7}, Lezvcard/io/CannotParseException;->getMessage()Ljava/lang/String;

    move-result-object v32

    aput-object v32, v30, v31

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move/from16 v2, v29

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v14, v2, v3}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 311
    new-instance v17, Lezvcard/property/RawProperty;

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-direct {v0, v14, v1}, Lezvcard/property/RawProperty;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    .restart local v17    # "property":Lezvcard/property/VCardProperty;
    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Lezvcard/property/VCardProperty;->setGroup(Ljava/lang/String;)V

    .line 313
    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    goto/16 :goto_d

    .line 305
    .end local v7    # "e":Lezvcard/io/CannotParseException;
    .restart local v10    # "i$":Ljava/util/Iterator;
    .restart local v18    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    :cond_26f
    :try_start_26f
    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V
    :try_end_274
    .catch Lezvcard/io/SkipMeException; {:try_start_26f .. :try_end_274} :catch_18f
    .catch Lezvcard/io/CannotParseException; {:try_start_26f .. :try_end_274} :catch_224
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_26f .. :try_end_274} :catch_276

    goto/16 :goto_d

    .line 314
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v17    # "property":Lezvcard/property/VCardProperty;
    .end local v18    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    :catch_276
    move-exception v7

    .line 316
    .local v7, "e":Lezvcard/io/EmbeddedVCardException;
    invoke-virtual {v7}, Lezvcard/io/EmbeddedVCardException;->getProperty()Lezvcard/property/VCardProperty;

    move-result-object v17

    .line 318
    .restart local v17    # "property":Lezvcard/property/VCardProperty;
    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v27

    if-eqz v27, :cond_289

    sget-object v27, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    move-object/from16 v0, v24

    move-object/from16 v1, v27

    if-ne v0, v1, :cond_291

    .line 320
    :cond_289
    move-object v8, v7

    .line 341
    :goto_28a
    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    goto/16 :goto_d

    .line 323
    :cond_291
    invoke-static/range {v21 .. v21}, Lezvcard/io/scribe/VCardPropertyScribe;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 325
    new-instance v4, Lezvcard/io/text/VCardReader;

    move-object/from16 v0, v21

    invoke-direct {v4, v0}, Lezvcard/io/text/VCardReader;-><init>(Ljava/lang/String;)V

    .line 327
    .local v4, "agentReader":Lezvcard/io/text/VCardReader;
    :try_start_29c
    invoke-virtual {v4}, Lezvcard/io/text/VCardReader;->readNext()Lezvcard/VCard;

    move-result-object v15

    .line 328
    .local v15, "nestedVCard":Lezvcard/VCard;
    if-eqz v15, :cond_2a5

    .line 329
    invoke-virtual {v7, v15}, Lezvcard/io/EmbeddedVCardException;->injectVCard(Lezvcard/VCard;)V
    :try_end_2a5
    .catch Ljava/io/IOException; {:try_start_29c .. :try_end_2a5} :catch_2eb
    .catchall {:try_start_29c .. :try_end_2a5} :catchall_333

    .line 334
    :cond_2a5
    invoke-virtual {v4}, Lezvcard/io/text/VCardReader;->getWarnings()Ljava/util/List;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .restart local v10    # "i$":Ljava/util/Iterator;
    :goto_2ad
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_2e7

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;

    .line 335
    .local v25, "w":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lezvcard/io/text/VCardRawReader;->getLineNum()I

    move-result v28

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    const/16 v29, 0x1a

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aput-object v25, v30, v31

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move/from16 v2, v29

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v14, v2, v3}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto :goto_2ad

    .line 337
    .end local v25    # "w":Ljava/lang/String;
    :cond_2e7
    invoke-static {v4}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_28a

    .line 331
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v15    # "nestedVCard":Lezvcard/VCard;
    :catch_2eb
    move-exception v27

    .line 334
    invoke-virtual {v4}, Lezvcard/io/text/VCardReader;->getWarnings()Ljava/util/List;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .restart local v10    # "i$":Ljava/util/Iterator;
    :goto_2f4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_32e

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;

    .line 335
    .restart local v25    # "w":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Lezvcard/io/text/VCardRawReader;->getLineNum()I

    move-result v28

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    const/16 v29, 0x1a

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aput-object v25, v30, v31

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move/from16 v2, v29

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v14, v2, v3}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto :goto_2f4

    .line 337
    .end local v25    # "w":Ljava/lang/String;
    :cond_32e
    invoke-static {v4}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto/16 :goto_28a

    .line 334
    .end local v10    # "i$":Ljava/util/Iterator;
    :catchall_333
    move-exception v27

    invoke-virtual {v4}, Lezvcard/io/text/VCardReader;->getWarnings()Ljava/util/List;

    move-result-object v28

    invoke-interface/range {v28 .. v28}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .restart local v10    # "i$":Ljava/util/Iterator;
    :goto_33c
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_376

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;

    .line 335
    .restart local v25    # "w":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->warnings:Lezvcard/io/ParseWarnings;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Lezvcard/io/text/VCardRawReader;->getLineNum()I

    move-result v29

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    const/16 v30, 0x1a

    const/16 v31, 0x1

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    aput-object v25, v31, v32

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move/from16 v2, v30

    move-object/from16 v3, v31

    invoke-virtual {v0, v1, v14, v2, v3}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto :goto_33c

    .line 337
    .end local v25    # "w":Ljava/lang/String;
    :cond_376
    invoke-static {v4}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v27
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 440
    iget-object v0, p0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    invoke-virtual {v0}, Lezvcard/io/text/VCardRawReader;->close()V

    .line 441
    return-void
.end method

.method public getDefaultQuotedPrintableCharset()Ljava/nio/charset/Charset;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lezvcard/io/text/VCardReader;->defaultQuotedPrintableCharset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public isCaretDecodingEnabled()Z
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    invoke-virtual {v0}, Lezvcard/io/text/VCardRawReader;->isCaretDecodingEnabled()Z

    move-result v0

    return v0
.end method

.method public setCaretDecodingEnabled(Z)V
    .registers 3
    .param p1, "enable"    # Z

    .prologue
    .line 144
    iget-object v0, p0, Lezvcard/io/text/VCardReader;->reader:Lezvcard/io/text/VCardRawReader;

    invoke-virtual {v0, p1}, Lezvcard/io/text/VCardRawReader;->setCaretDecodingEnabled(Z)V

    .line 145
    return-void
.end method

.method public setDefaultQuotedPrintableCharset(Ljava/nio/charset/Charset;)V
    .registers 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 178
    iput-object p1, p0, Lezvcard/io/text/VCardReader;->defaultQuotedPrintableCharset:Ljava/nio/charset/Charset;

    .line 179
    return-void
.end method
