.class public Lezvcard/io/text/VCardWriter;
.super Lezvcard/io/StreamWriter;
.source "VCardWriter.java"

# interfaces
.implements Ljava/io/Flushable;


# instance fields
.field private final prodIdStack:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final writer:Lezvcard/io/text/VCardRawWriter;


# direct methods
.method public constructor <init>(Ljava/io/File;Lezvcard/VCardVersion;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .param p2, "targetVersion"    # Lezvcard/VCardVersion;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lezvcard/io/text/VCardWriter;-><init>(Ljava/io/File;ZLezvcard/VCardVersion;)V

    .line 121
    return-void
.end method

.method public constructor <init>(Ljava/io/File;ZLezvcard/VCardVersion;)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "append"    # Z
    .param p3, "targetVersion"    # Lezvcard/VCardVersion;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    if-ne p3, v0, :cond_c

    invoke-static {p1, p2}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/File;Z)Ljava/io/Writer;

    move-result-object v0

    :goto_8
    invoke-direct {p0, v0, p3}, Lezvcard/io/text/VCardWriter;-><init>(Ljava/io/Writer;Lezvcard/VCardVersion;)V

    .line 134
    return-void

    .line 133
    :cond_c
    new-instance v0, Ljava/io/FileWriter;

    invoke-direct {v0, p1, p2}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    goto :goto_8
.end method

.method public constructor <init>(Ljava/io/OutputStream;Lezvcard/VCardVersion;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "targetVersion"    # Lezvcard/VCardVersion;

    .prologue
    .line 109
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    if-ne p2, v0, :cond_c

    invoke-static {p1}, Lezvcard/util/IOUtils;->utf8Writer(Ljava/io/OutputStream;)Ljava/io/Writer;

    move-result-object v0

    :goto_8
    invoke-direct {p0, v0, p2}, Lezvcard/io/text/VCardWriter;-><init>(Ljava/io/Writer;Lezvcard/VCardVersion;)V

    .line 110
    return-void

    .line 109
    :cond_c
    new-instance v0, Ljava/io/OutputStreamWriter;

    invoke-direct {v0, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    goto :goto_8
.end method

.method public constructor <init>(Ljava/io/Writer;Lezvcard/VCardVersion;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "targetVersion"    # Lezvcard/VCardVersion;

    .prologue
    .line 141
    invoke-direct {p0}, Lezvcard/io/StreamWriter;-><init>()V

    .line 100
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lezvcard/io/text/VCardWriter;->prodIdStack:Ljava/util/LinkedList;

    .line 142
    new-instance v0, Lezvcard/io/text/VCardRawWriter;

    invoke-direct {v0, p1, p2}, Lezvcard/io/text/VCardRawWriter;-><init>(Ljava/io/Writer;Lezvcard/VCardVersion;)V

    iput-object v0, p0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    .line 143
    return-void
.end method


# virtual methods
.method protected _write(Lezvcard/VCard;Ljava/util/List;)V
    .registers 20
    .param p1, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/VCard;",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/VCardProperty;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 211
    .local p2, "propertiesToAdd":Ljava/util/List;, "Ljava/util/List<Lezvcard/property/VCardProperty;>;"
    invoke-virtual/range {p0 .. p0}, Lezvcard/io/text/VCardWriter;->getTargetVersion()Lezvcard/VCardVersion;

    move-result-object v11

    .line 212
    .local v11, "targetVersion":Lezvcard/VCardVersion;
    move-object/from16 v0, p0

    iget-object v14, v0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    const-string v15, "VCARD"

    invoke-virtual {v14, v15}, Lezvcard/io/text/VCardRawWriter;->writeBeginComponent(Ljava/lang/String;)V

    .line 213
    move-object/from16 v0, p0

    iget-object v14, v0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    invoke-virtual {v14}, Lezvcard/io/text/VCardRawWriter;->writeVersion()V

    .line 215
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_18
    :goto_18
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_111

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lezvcard/property/VCardProperty;

    .line 216
    .local v8, "property":Lezvcard/property/VCardProperty;
    move-object/from16 v0, p0

    iget-object v14, v0, Lezvcard/io/text/VCardWriter;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v14, v8}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Lezvcard/property/VCardProperty;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v9

    .line 219
    .local v9, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;
    const/4 v13, 0x0

    .line 220
    .local v13, "value":Ljava/lang/String;
    const/4 v6, 0x0

    .line 222
    .local v6, "nestedVCard":Lezvcard/VCard;
    :try_start_2e
    invoke-virtual {v9, v8, v11}, Lezvcard/io/scribe/VCardPropertyScribe;->writeText(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Ljava/lang/String;
    :try_end_31
    .catch Lezvcard/io/SkipMeException; {:try_start_2e .. :try_end_31} :catch_7b
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_2e .. :try_end_31} :catch_7d

    move-result-object v13

    .line 230
    :goto_32
    move-object/from16 v0, p1

    invoke-virtual {v9, v8, v11, v0}, Lezvcard/io/scribe/VCardPropertyScribe;->prepareParameters(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;Lezvcard/VCard;)Lezvcard/parameter/VCardParameters;

    move-result-object v7

    .line 233
    .local v7, "parameters":Lezvcard/parameter/VCardParameters;
    if-eqz v6, :cond_dc

    .line 234
    sget-object v14, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    if-ne v11, v14, :cond_83

    .line 236
    move-object/from16 v0, p0

    iget-object v14, v0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    invoke-virtual {v8}, Lezvcard/property/VCardProperty;->getGroup()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9}, Lezvcard/io/scribe/VCardPropertyScribe;->getPropertyName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v14, v15, v0, v7, v13}, Lezvcard/io/text/VCardRawWriter;->writeProperty(Ljava/lang/String;Ljava/lang/String;Lezvcard/parameter/VCardParameters;Ljava/lang/String;)V

    .line 237
    move-object/from16 v0, p0

    iget-object v14, v0, Lezvcard/io/text/VCardWriter;->prodIdStack:Ljava/util/LinkedList;

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lezvcard/io/text/VCardWriter;->addProdId:Z

    invoke-static {v15}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 238
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lezvcard/io/text/VCardWriter;->addProdId:Z

    .line 239
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lezvcard/io/text/VCardWriter;->write(Lezvcard/VCard;)V

    .line 240
    move-object/from16 v0, p0

    iget-object v14, v0, Lezvcard/io/text/VCardWriter;->prodIdStack:Ljava/util/LinkedList;

    invoke-virtual {v14}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Boolean;

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v14

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lezvcard/io/text/VCardWriter;->addProdId:Z

    goto :goto_18

    .line 223
    .end local v7    # "parameters":Lezvcard/parameter/VCardParameters;
    :catch_7b
    move-exception v4

    .line 224
    .local v4, "e":Lezvcard/io/SkipMeException;
    goto :goto_18

    .line 225
    .end local v4    # "e":Lezvcard/io/SkipMeException;
    :catch_7d
    move-exception v4

    .line 226
    .local v4, "e":Lezvcard/io/EmbeddedVCardException;
    invoke-virtual {v4}, Lezvcard/io/EmbeddedVCardException;->getVCard()Lezvcard/VCard;

    move-result-object v6

    goto :goto_32

    .line 243
    .end local v4    # "e":Lezvcard/io/EmbeddedVCardException;
    .restart local v7    # "parameters":Lezvcard/parameter/VCardParameters;
    :cond_83
    new-instance v10, Ljava/io/StringWriter;

    invoke-direct {v10}, Ljava/io/StringWriter;-><init>()V

    .line 244
    .local v10, "sw":Ljava/io/StringWriter;
    new-instance v1, Lezvcard/io/text/VCardWriter;

    invoke-direct {v1, v10, v11}, Lezvcard/io/text/VCardWriter;-><init>(Ljava/io/Writer;Lezvcard/VCardVersion;)V

    .line 245
    .local v1, "agentWriter":Lezvcard/io/text/VCardWriter;
    invoke-virtual {v1}, Lezvcard/io/text/VCardWriter;->getRawWriter()Lezvcard/io/text/VCardRawWriter;

    move-result-object v14

    invoke-virtual {v14}, Lezvcard/io/text/VCardRawWriter;->getFoldedLineWriter()Lezvcard/io/text/FoldedLineWriter;

    move-result-object v14

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Lezvcard/io/text/FoldedLineWriter;->setLineLength(Ljava/lang/Integer;)V

    .line 246
    invoke-virtual {v1}, Lezvcard/io/text/VCardWriter;->getRawWriter()Lezvcard/io/text/VCardRawWriter;

    move-result-object v14

    invoke-virtual {v14}, Lezvcard/io/text/VCardRawWriter;->getFoldedLineWriter()Lezvcard/io/text/FoldedLineWriter;

    move-result-object v14

    const-string v15, "\n"

    invoke-virtual {v14, v15}, Lezvcard/io/text/FoldedLineWriter;->setNewline(Ljava/lang/String;)V

    .line 247
    const/4 v14, 0x0

    invoke-virtual {v1, v14}, Lezvcard/io/text/VCardWriter;->setAddProdId(Z)V

    .line 248
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lezvcard/io/text/VCardWriter;->versionStrict:Z

    invoke-virtual {v1, v14}, Lezvcard/io/text/VCardWriter;->setVersionStrict(Z)V

    .line 250
    :try_start_b1
    invoke-virtual {v1, v6}, Lezvcard/io/text/VCardWriter;->write(Lezvcard/VCard;)V
    :try_end_b4
    .catch Ljava/io/IOException; {:try_start_b1 .. :try_end_b4} :catch_d2
    .catchall {:try_start_b1 .. :try_end_b4} :catchall_d7

    .line 254
    invoke-static {v1}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 257
    :goto_b7
    invoke-virtual {v10}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v12

    .line 258
    .local v12, "vCardStr":Ljava/lang/String;
    invoke-static {v12}, Lezvcard/io/scribe/VCardPropertyScribe;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 259
    move-object/from16 v0, p0

    iget-object v14, v0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    invoke-virtual {v8}, Lezvcard/property/VCardProperty;->getGroup()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9}, Lezvcard/io/scribe/VCardPropertyScribe;->getPropertyName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v14, v15, v0, v7, v12}, Lezvcard/io/text/VCardRawWriter;->writeProperty(Ljava/lang/String;Ljava/lang/String;Lezvcard/parameter/VCardParameters;Ljava/lang/String;)V

    goto/16 :goto_18

    .line 251
    .end local v12    # "vCardStr":Ljava/lang/String;
    :catch_d2
    move-exception v14

    .line 254
    invoke-static {v1}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_b7

    :catchall_d7
    move-exception v14

    invoke-static {v1}, Lezvcard/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v14

    .line 264
    .end local v1    # "agentWriter":Lezvcard/io/text/VCardWriter;
    .end local v10    # "sw":Ljava/io/StringWriter;
    :cond_dc
    if-eqz v13, :cond_18

    .line 267
    invoke-virtual {v9, v8, v11}, Lezvcard/io/scribe/VCardPropertyScribe;->dataType(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;)Lezvcard/VCardDataType;

    move-result-object v2

    .line 268
    .local v2, "dataType":Lezvcard/VCardDataType;
    if-eqz v2, :cond_fa

    .line 269
    invoke-virtual {v9, v11}, Lezvcard/io/scribe/VCardPropertyScribe;->defaultDataType(Lezvcard/VCardVersion;)Lezvcard/VCardDataType;

    move-result-object v3

    .line 270
    .local v3, "defaultDataType":Lezvcard/VCardDataType;
    if-eq v2, v3, :cond_fa

    .line 271
    sget-object v14, Lezvcard/VCardDataType;->DATE_AND_OR_TIME:Lezvcard/VCardDataType;

    if-ne v3, v14, :cond_10d

    sget-object v14, Lezvcard/VCardDataType;->DATE:Lezvcard/VCardDataType;

    if-eq v2, v14, :cond_fa

    sget-object v14, Lezvcard/VCardDataType;->DATE_TIME:Lezvcard/VCardDataType;

    if-eq v2, v14, :cond_fa

    sget-object v14, Lezvcard/VCardDataType;->TIME:Lezvcard/VCardDataType;

    if-ne v2, v14, :cond_10d

    .line 279
    .end local v3    # "defaultDataType":Lezvcard/VCardDataType;
    :cond_fa
    :goto_fa
    move-object/from16 v0, p0

    iget-object v14, v0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    invoke-virtual {v8}, Lezvcard/property/VCardProperty;->getGroup()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9}, Lezvcard/io/scribe/VCardPropertyScribe;->getPropertyName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v14, v15, v0, v7, v13}, Lezvcard/io/text/VCardRawWriter;->writeProperty(Ljava/lang/String;Ljava/lang/String;Lezvcard/parameter/VCardParameters;Ljava/lang/String;)V

    goto/16 :goto_18

    .line 274
    .restart local v3    # "defaultDataType":Lezvcard/VCardDataType;
    :cond_10d
    invoke-virtual {v7, v2}, Lezvcard/parameter/VCardParameters;->setValue(Lezvcard/VCardDataType;)V

    goto :goto_fa

    .line 284
    .end local v2    # "dataType":Lezvcard/VCardDataType;
    .end local v3    # "defaultDataType":Lezvcard/VCardDataType;
    .end local v6    # "nestedVCard":Lezvcard/VCard;
    .end local v7    # "parameters":Lezvcard/parameter/VCardParameters;
    .end local v8    # "property":Lezvcard/property/VCardProperty;
    .end local v9    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;
    .end local v13    # "value":Ljava/lang/String;
    :cond_111
    move-object/from16 v0, p0

    iget-object v14, v0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    const-string v15, "VCARD"

    invoke-virtual {v14, v15}, Lezvcard/io/text/VCardRawWriter;->writeEndComponent(Ljava/lang/String;)V

    .line 285
    return-void
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 300
    iget-object v0, p0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    invoke-virtual {v0}, Lezvcard/io/text/VCardRawWriter;->close()V

    .line 301
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 292
    iget-object v0, p0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    invoke-virtual {v0}, Lezvcard/io/text/VCardRawWriter;->flush()V

    .line 293
    return-void
.end method

.method public getRawWriter()Lezvcard/io/text/VCardRawWriter;
    .registers 2

    .prologue
    .line 150
    iget-object v0, p0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    return-object v0
.end method

.method public getTargetVersion()Lezvcard/VCardVersion;
    .registers 2

    .prologue
    .line 159
    iget-object v0, p0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    invoke-virtual {v0}, Lezvcard/io/text/VCardRawWriter;->getVersion()Lezvcard/VCardVersion;

    move-result-object v0

    return-object v0
.end method

.method public isCaretEncodingEnabled()Z
    .registers 2

    .prologue
    .line 186
    iget-object v0, p0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    invoke-virtual {v0}, Lezvcard/io/text/VCardRawWriter;->isCaretEncodingEnabled()Z

    move-result v0

    return v0
.end method

.method public setCaretEncodingEnabled(Z)V
    .registers 3
    .param p1, "enable"    # Z

    .prologue
    .line 205
    iget-object v0, p0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    invoke-virtual {v0, p1}, Lezvcard/io/text/VCardRawWriter;->setCaretEncodingEnabled(Z)V

    .line 206
    return-void
.end method

.method public setTargetVersion(Lezvcard/VCardVersion;)V
    .registers 3
    .param p1, "targetVersion"    # Lezvcard/VCardVersion;

    .prologue
    .line 167
    iget-object v0, p0, Lezvcard/io/text/VCardWriter;->writer:Lezvcard/io/text/VCardRawWriter;

    invoke-virtual {v0, p1}, Lezvcard/io/text/VCardRawWriter;->setVersion(Lezvcard/VCardVersion;)V

    .line 168
    return-void
.end method
