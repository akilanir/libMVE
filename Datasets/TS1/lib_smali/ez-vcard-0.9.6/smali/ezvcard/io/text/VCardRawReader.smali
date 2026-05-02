.class public Lezvcard/io/text/VCardRawReader;
.super Ljava/lang/Object;
.source "VCardRawReader.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private caretDecodingEnabled:Z

.field private final reader:Lezvcard/io/text/FoldedLineReader;

.field private version:Lezvcard/VCardVersion;


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .registers 3
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const/4 v0, 0x1

    iput-boolean v0, p0, Lezvcard/io/text/VCardRawReader;->caretDecodingEnabled:Z

    .line 50
    sget-object v0, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    iput-object v0, p0, Lezvcard/io/text/VCardRawReader;->version:Lezvcard/VCardVersion;

    .line 57
    new-instance v0, Lezvcard/io/text/FoldedLineReader;

    invoke-direct {v0, p1}, Lezvcard/io/text/FoldedLineReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lezvcard/io/text/VCardRawReader;->reader:Lezvcard/io/text/FoldedLineReader;

    .line 58
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 318
    iget-object v0, p0, Lezvcard/io/text/VCardRawReader;->reader:Lezvcard/io/text/FoldedLineReader;

    invoke-virtual {v0}, Lezvcard/io/text/FoldedLineReader;->close()V

    .line 319
    return-void
.end method

.method public getEncoding()Ljava/nio/charset/Charset;
    .registers 2

    .prologue
    .line 311
    iget-object v0, p0, Lezvcard/io/text/VCardRawReader;->reader:Lezvcard/io/text/FoldedLineReader;

    invoke-virtual {v0}, Lezvcard/io/text/FoldedLineReader;->getEncoding()Ljava/nio/charset/Charset;

    move-result-object v0

    return-object v0
.end method

.method public getLineNum()I
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lezvcard/io/text/VCardRawReader;->reader:Lezvcard/io/text/FoldedLineReader;

    invoke-virtual {v0}, Lezvcard/io/text/FoldedLineReader;->getLineNum()I

    move-result v0

    return v0
.end method

.method public getVersion()Lezvcard/VCardVersion;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lezvcard/io/text/VCardRawReader;->version:Lezvcard/VCardVersion;

    return-object v0
.end method

.method public isCaretDecodingEnabled()Z
    .registers 2

    .prologue
    .line 261
    iget-boolean v0, p0, Lezvcard/io/text/VCardRawReader;->caretDecodingEnabled:Z

    return v0
.end method

.method public readLine()Lezvcard/io/text/VCardRawLine;
    .registers 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawReader;->reader:Lezvcard/io/text/FoldedLineReader;

    invoke-virtual {v15}, Lezvcard/io/text/FoldedLineReader;->readLine()Ljava/lang/String;

    move-result-object v8

    .line 86
    .local v8, "line":Ljava/lang/String;
    if-nez v8, :cond_c

    .line 87
    const/4 v15, 0x0

    .line 219
    :goto_b
    return-object v15

    .line 90
    :cond_c
    const/4 v5, 0x0

    .line 91
    .local v5, "group":Ljava/lang/String;
    const/4 v12, 0x0

    .line 92
    .local v12, "propertyName":Ljava/lang/String;
    new-instance v11, Lezvcard/parameter/VCardParameters;

    invoke-direct {v11}, Lezvcard/parameter/VCardParameters;-><init>()V

    .line 93
    .local v11, "parameters":Lezvcard/parameter/VCardParameters;
    const/4 v13, 0x0

    .line 95
    .local v13, "value":Ljava/lang/String;
    const/4 v4, 0x0

    .line 96
    .local v4, "escapeChar":C
    const/4 v7, 0x0

    .line 97
    .local v7, "inQuotes":Z
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .local v1, "buffer":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .line 99
    .local v3, "curParamName":Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1d
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v15

    if-ge v6, v15, :cond_ec

    .line 100
    invoke-virtual {v8, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 102
    .local v2, "ch":C
    if-eqz v4, :cond_9a

    .line 104
    const/16 v15, 0x5c

    if-ne v4, v15, :cond_72

    .line 105
    const/16 v15, 0x5c

    if-ne v2, v15, :cond_38

    .line 106
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 133
    :cond_34
    :goto_34
    const/4 v4, 0x0

    .line 99
    :cond_35
    :goto_35
    add-int/lit8 v6, v6, 0x1

    goto :goto_1d

    .line 107
    :cond_38
    const/16 v15, 0x6e

    if-eq v2, v15, :cond_40

    const/16 v15, 0x4e

    if-ne v2, v15, :cond_46

    .line 109
    :cond_40
    sget-object v15, Lezvcard/util/StringUtils;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_34

    .line 110
    :cond_46
    const/16 v15, 0x22

    if-ne v2, v15, :cond_58

    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawReader;->version:Lezvcard/VCardVersion;

    sget-object v16, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    move-object/from16 v0, v16

    if-eq v15, v0, :cond_58

    .line 112
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_34

    .line 113
    :cond_58
    const/16 v15, 0x3b

    if-ne v2, v15, :cond_6a

    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawReader;->version:Lezvcard/VCardVersion;

    sget-object v16, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_6a

    .line 116
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_34

    .line 119
    :cond_6a
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_34

    .line 121
    :cond_72
    const/16 v15, 0x5e

    if-ne v4, v15, :cond_34

    .line 122
    const/16 v15, 0x5e

    if-ne v2, v15, :cond_7e

    .line 123
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_34

    .line 124
    :cond_7e
    const/16 v15, 0x6e

    if-ne v2, v15, :cond_88

    .line 125
    sget-object v15, Lezvcard/util/StringUtils;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_34

    .line 126
    :cond_88
    const/16 v15, 0x27

    if-ne v2, v15, :cond_92

    .line 127
    const/16 v15, 0x22

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_34

    .line 130
    :cond_92
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_34

    .line 137
    :cond_9a
    const/16 v15, 0x5c

    if-eq v2, v15, :cond_b2

    const/16 v15, 0x5e

    if-ne v2, v15, :cond_b4

    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawReader;->version:Lezvcard/VCardVersion;

    sget-object v16, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    move-object/from16 v0, v16

    if-eq v15, v0, :cond_b4

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lezvcard/io/text/VCardRawReader;->caretDecodingEnabled:Z

    if-eqz v15, :cond_b4

    .line 139
    :cond_b2
    move v4, v2

    .line 140
    goto :goto_35

    .line 143
    :cond_b4
    const/16 v15, 0x2e

    if-ne v2, v15, :cond_c6

    if-nez v5, :cond_c6

    if-nez v12, :cond_c6

    .line 145
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 146
    const/4 v15, 0x0

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->setLength(I)V

    goto/16 :goto_35

    .line 150
    :cond_c6
    const/16 v15, 0x3b

    if-eq v2, v15, :cond_ce

    const/16 v15, 0x3a

    if-ne v2, v15, :cond_110

    :cond_ce
    if-nez v7, :cond_110

    .line 151
    if-nez v12, :cond_f6

    .line 153
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 164
    :goto_d6
    const/4 v15, 0x0

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 166
    const/16 v15, 0x3a

    if-ne v2, v15, :cond_35

    .line 168
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v15

    add-int/lit8 v15, v15, -0x1

    if-ge v6, v15, :cond_10d

    .line 169
    add-int/lit8 v15, v6, 0x1

    invoke-virtual {v8, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    .line 206
    .end local v2    # "ch":C
    :cond_ec
    :goto_ec
    if-eqz v12, :cond_f0

    if-nez v13, :cond_166

    .line 207
    :cond_f0
    new-instance v15, Lezvcard/io/text/VCardParseException;

    invoke-direct {v15, v8}, Lezvcard/io/text/VCardParseException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 156
    .restart local v2    # "ch":C
    :cond_f6
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 157
    .local v10, "paramValue":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawReader;->version:Lezvcard/VCardVersion;

    sget-object v16, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_108

    .line 159
    invoke-static {v10}, Lezvcard/util/StringUtils;->ltrim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 161
    :cond_108
    invoke-virtual {v11, v3, v10}, Lezvcard/parameter/VCardParameters;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 162
    const/4 v3, 0x0

    goto :goto_d6

    .line 171
    .end local v10    # "paramValue":Ljava/lang/String;
    :cond_10d
    const-string v13, ""

    .line 173
    goto :goto_ec

    .line 178
    :cond_110
    const/16 v15, 0x2c

    if-ne v2, v15, :cond_12d

    if-nez v7, :cond_12d

    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawReader;->version:Lezvcard/VCardVersion;

    sget-object v16, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    move-object/from16 v0, v16

    if-eq v15, v0, :cond_12d

    .line 180
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v3, v15}, Lezvcard/parameter/VCardParameters;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 181
    const/4 v15, 0x0

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->setLength(I)V

    goto/16 :goto_35

    .line 185
    :cond_12d
    const/16 v15, 0x3d

    if-ne v2, v15, :cond_14c

    if-nez v3, :cond_14c

    .line 187
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 188
    .local v9, "paramName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawReader;->version:Lezvcard/VCardVersion;

    sget-object v16, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_145

    .line 190
    invoke-static {v9}, Lezvcard/util/StringUtils;->rtrim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 192
    :cond_145
    move-object v3, v9

    .line 193
    const/4 v15, 0x0

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->setLength(I)V

    goto/16 :goto_35

    .line 197
    .end local v9    # "paramName":Ljava/lang/String;
    :cond_14c
    const/16 v15, 0x22

    if-ne v2, v15, :cond_161

    move-object/from16 v0, p0

    iget-object v15, v0, Lezvcard/io/text/VCardRawReader;->version:Lezvcard/VCardVersion;

    sget-object v16, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    move-object/from16 v0, v16

    if-eq v15, v0, :cond_161

    .line 199
    if-nez v7, :cond_15f

    const/4 v7, 0x1

    .line 200
    :goto_15d
    goto/16 :goto_35

    .line 199
    :cond_15f
    const/4 v7, 0x0

    goto :goto_15d

    .line 203
    :cond_161
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_35

    .line 210
    .end local v2    # "ch":C
    :cond_166
    const-string v15, "VERSION"

    invoke-virtual {v15, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_17e

    .line 211
    invoke-static {v13}, Lezvcard/VCardVersion;->valueOfByStr(Ljava/lang/String;)Lezvcard/VCardVersion;

    move-result-object v14

    .line 212
    .local v14, "version":Lezvcard/VCardVersion;
    if-nez v14, :cond_17a

    .line 213
    new-instance v15, Lezvcard/io/text/InvalidVersionException;

    invoke-direct {v15, v13, v8}, Lezvcard/io/text/InvalidVersionException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v15

    .line 215
    :cond_17a
    move-object/from16 v0, p0

    iput-object v14, v0, Lezvcard/io/text/VCardRawReader;->version:Lezvcard/VCardVersion;

    .line 218
    .end local v14    # "version":Lezvcard/VCardVersion;
    :cond_17e
    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v13

    .line 219
    new-instance v15, Lezvcard/io/text/VCardRawLine;

    invoke-direct {v15, v5, v12, v11, v13}, Lezvcard/io/text/VCardRawLine;-><init>(Ljava/lang/String;Ljava/lang/String;Lezvcard/parameter/VCardParameters;Ljava/lang/String;)V

    goto/16 :goto_b
.end method

.method public setCaretDecodingEnabled(Z)V
    .registers 2
    .param p1, "enable"    # Z

    .prologue
    .line 303
    iput-boolean p1, p0, Lezvcard/io/text/VCardRawReader;->caretDecodingEnabled:Z

    .line 304
    return-void
.end method
