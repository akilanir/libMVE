.class public Lcom/drew/metadata/iptc/IptcReader;
.super Ljava/lang/Object;
.source "IptcReader.java"

# interfaces
.implements Lcom/drew/imaging/jpeg/JpegSegmentMetadataReader;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private processTag(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Directory;III)V
    .registers 16
    .param p1, "reader"    # Lcom/drew/lang/SequentialReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "directory"    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "directoryType"    # I
    .param p4, "tagType"    # I
    .param p5, "tagByteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 155
    shl-int/lit8 v8, p3, 0x8

    or-int v7, p4, v8

    .line 161
    .local v7, "tagIdentifier":I
    if-nez p5, :cond_d

    .line 162
    const-string v8, ""

    invoke-virtual {p2, v7, v8}, Lcom/drew/metadata/Directory;->setString(ILjava/lang/String;)V

    .line 230
    :goto_c
    return-void

    .line 166
    :cond_d
    const/4 v6, 0x0

    .line 168
    .local v6, "string":Ljava/lang/String;
    sparse-switch v7, :sswitch_data_90

    .line 203
    :cond_11
    :goto_11
    if-nez v6, :cond_1f

    .line 204
    const/16 v8, 0x15a

    invoke-virtual {p2, v8}, Lcom/drew/metadata/Directory;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 205
    .local v2, "encoding":Ljava/lang/String;
    if-eqz v2, :cond_6a

    .line 206
    invoke-virtual {p1, p5, v2}, Lcom/drew/lang/SequentialReader;->getString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 214
    .end local v2    # "encoding":Ljava/lang/String;
    :cond_1f
    :goto_1f
    invoke-virtual {p2, v7}, Lcom/drew/metadata/Directory;->containsTag(I)Z

    move-result v8

    if-eqz v8, :cond_8a

    .line 216
    invoke-virtual {p2, v7}, Lcom/drew/metadata/Directory;->getStringArray(I)[Ljava/lang/String;

    move-result-object v4

    .line 218
    .local v4, "oldStrings":[Ljava/lang/String;
    if-nez v4, :cond_80

    .line 220
    const/4 v8, 0x1

    new-array v3, v8, [Ljava/lang/String;

    .line 225
    .local v3, "newStrings":[Ljava/lang/String;
    :goto_2e
    array-length v8, v3

    add-int/lit8 v8, v8, -0x1

    aput-object v6, v3, v8

    .line 226
    invoke-virtual {p2, v7, v3}, Lcom/drew/metadata/Directory;->setStringArray(I[Ljava/lang/String;)V

    goto :goto_c

    .line 170
    .end local v3    # "newStrings":[Ljava/lang/String;
    .end local v4    # "oldStrings":[Ljava/lang/String;
    :sswitch_37
    invoke-virtual {p1, p5}, Lcom/drew/lang/SequentialReader;->getBytes(I)[B

    move-result-object v0

    .line 171
    .local v0, "bytes":[B
    invoke-static {v0}, Lcom/drew/metadata/iptc/Iso2022Converter;->convertISO2022CharsetToJavaCharset([B)Ljava/lang/String;

    move-result-object v1

    .line 172
    .local v1, "charset":Ljava/lang/String;
    if-nez v1, :cond_47

    .line 174
    new-instance v6, Ljava/lang/String;

    .end local v6    # "string":Ljava/lang/String;
    invoke-direct {v6, v0}, Ljava/lang/String;-><init>([B)V

    .line 175
    .restart local v6    # "string":Ljava/lang/String;
    goto :goto_11

    .line 177
    :cond_47
    invoke-virtual {p2, v7, v1}, Lcom/drew/metadata/Directory;->setString(ILjava/lang/String;)V

    goto :goto_c

    .line 185
    .end local v0    # "bytes":[B
    .end local v1    # "charset":Ljava/lang/String;
    :sswitch_4b
    const/4 v8, 0x2

    if-lt p5, v8, :cond_11

    .line 186
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v5

    .line 187
    .local v5, "shortValue":I
    add-int/lit8 v8, p5, -0x2

    int-to-long v8, v8

    invoke-virtual {p1, v8, v9}, Lcom/drew/lang/SequentialReader;->skip(J)V

    .line 188
    invoke-virtual {p2, v7, v5}, Lcom/drew/metadata/Directory;->setInt(II)V

    goto :goto_c

    .line 194
    .end local v5    # "shortValue":I
    :sswitch_5c
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt8()S

    move-result v8

    invoke-virtual {p2, v7, v8}, Lcom/drew/metadata/Directory;->setInt(II)V

    .line 195
    add-int/lit8 v8, p5, -0x1

    int-to-long v8, v8

    invoke-virtual {p1, v8, v9}, Lcom/drew/lang/SequentialReader;->skip(J)V

    goto :goto_c

    .line 208
    .restart local v2    # "encoding":Ljava/lang/String;
    :cond_6a
    invoke-virtual {p1, p5}, Lcom/drew/lang/SequentialReader;->getBytes(I)[B

    move-result-object v0

    .line 209
    .restart local v0    # "bytes":[B
    invoke-static {v0}, Lcom/drew/metadata/iptc/Iso2022Converter;->guessEncoding([B)Ljava/lang/String;

    move-result-object v2

    .line 210
    if-eqz v2, :cond_7a

    new-instance v6, Ljava/lang/String;

    .end local v6    # "string":Ljava/lang/String;
    invoke-direct {v6, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .restart local v6    # "string":Ljava/lang/String;
    :goto_79
    goto :goto_1f

    :cond_7a
    new-instance v6, Ljava/lang/String;

    .end local v6    # "string":Ljava/lang/String;
    invoke-direct {v6, v0}, Ljava/lang/String;-><init>([B)V

    goto :goto_79

    .line 222
    .end local v0    # "bytes":[B
    .end local v2    # "encoding":Ljava/lang/String;
    .restart local v4    # "oldStrings":[Ljava/lang/String;
    .restart local v6    # "string":Ljava/lang/String;
    :cond_80
    array-length v8, v4

    add-int/lit8 v8, v8, 0x1

    new-array v3, v8, [Ljava/lang/String;

    .line 223
    .restart local v3    # "newStrings":[Ljava/lang/String;
    array-length v8, v4

    invoke-static {v4, v9, v3, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2e

    .line 228
    .end local v3    # "newStrings":[Ljava/lang/String;
    .end local v4    # "oldStrings":[Ljava/lang/String;
    :cond_8a
    invoke-virtual {p2, v7, v6}, Lcom/drew/metadata/Directory;->setString(ILjava/lang/String;)V

    goto/16 :goto_c

    .line 168
    nop

    :sswitch_data_90
    .sparse-switch
        0x100 -> :sswitch_4b
        0x116 -> :sswitch_4b
        0x15a -> :sswitch_37
        0x17a -> :sswitch_4b
        0x200 -> :sswitch_4b
        0x20a -> :sswitch_5c
        0x246 -> :sswitch_4b
    .end sparse-switch
.end method


# virtual methods
.method public extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;J)V
    .registers 11
    .param p1, "reader"    # Lcom/drew/lang/SequentialReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "length"    # J

    .prologue
    .line 80
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/drew/metadata/iptc/IptcReader;->extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;JLcom/drew/metadata/Directory;)V

    .line 81
    return-void
.end method

.method public extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;JLcom/drew/metadata/Directory;)V
    .registers 15
    .param p1, "reader"    # Lcom/drew/lang/SequentialReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "length"    # J
    .param p5, "parentDirectory"    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 88
    new-instance v2, Lcom/drew/metadata/iptc/IptcDirectory;

    invoke-direct {v2}, Lcom/drew/metadata/iptc/IptcDirectory;-><init>()V

    .line 89
    .local v2, "directory":Lcom/drew/metadata/iptc/IptcDirectory;
    invoke-virtual {p2, v2}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 91
    if-eqz p5, :cond_d

    .line 92
    invoke-virtual {v2, p5}, Lcom/drew/metadata/iptc/IptcDirectory;->setParent(Lcom/drew/metadata/Directory;)V

    .line 94
    :cond_d
    const/4 v7, 0x0

    .line 97
    .local v7, "offset":I
    :goto_e
    int-to-long v0, v7

    cmp-long v0, v0, p3

    if-gez v0, :cond_4e

    .line 102
    :try_start_13
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt8()S
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_16} :catch_4f

    move-result v8

    .line 103
    .local v8, "startByte":S
    add-int/lit8 v7, v7, 0x1

    .line 109
    const/16 v0, 0x1c

    if-eq v8, v0, :cond_56

    .line 112
    int-to-long v0, v7

    cmp-long v0, v0, p3

    if-eqz v0, :cond_4e

    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid IPTC tag marker at offset "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v1, v7, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ". Expected \'0x1c\' but got \'0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/drew/metadata/iptc/IptcDirectory;->addError(Ljava/lang/String;)V

    .line 151
    .end local v8    # "startByte":S
    :cond_4e
    :goto_4e
    return-void

    .line 104
    :catch_4f
    move-exception v6

    .line 105
    .local v6, "e":Ljava/io/IOException;
    const-string v0, "Unable to read starting byte of IPTC tag"

    invoke-virtual {v2, v0}, Lcom/drew/metadata/iptc/IptcDirectory;->addError(Ljava/lang/String;)V

    goto :goto_4e

    .line 118
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v8    # "startByte":S
    :cond_56
    add-int/lit8 v0, v7, 0x5

    int-to-long v0, v0

    cmp-long v0, v0, p3

    if-lez v0, :cond_63

    .line 119
    const-string v0, "Too few bytes remain for a valid IPTC tag"

    invoke-virtual {v2, v0}, Lcom/drew/metadata/iptc/IptcDirectory;->addError(Ljava/lang/String;)V

    goto :goto_4e

    .line 127
    :cond_63
    :try_start_63
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt8()S

    move-result v3

    .line 128
    .local v3, "directoryType":I
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt8()S

    move-result v4

    .line 130
    .local v4, "tagType":I
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I
    :try_end_6e
    .catch Ljava/io/IOException; {:try_start_63 .. :try_end_6e} :catch_7e

    move-result v5

    .line 131
    .local v5, "tagByteCount":I
    add-int/lit8 v7, v7, 0x4

    .line 137
    add-int v0, v7, v5

    int-to-long v0, v0

    cmp-long v0, v0, p3

    if-lez v0, :cond_85

    .line 138
    const-string v0, "Data for tag extends beyond end of IPTC segment"

    invoke-virtual {v2, v0}, Lcom/drew/metadata/iptc/IptcDirectory;->addError(Ljava/lang/String;)V

    goto :goto_4e

    .line 132
    .end local v3    # "directoryType":I
    .end local v4    # "tagType":I
    .end local v5    # "tagByteCount":I
    :catch_7e
    move-exception v6

    .line 133
    .restart local v6    # "e":Ljava/io/IOException;
    const-string v0, "IPTC data segment ended mid-way through tag descriptor"

    invoke-virtual {v2, v0}, Lcom/drew/metadata/iptc/IptcDirectory;->addError(Ljava/lang/String;)V

    goto :goto_4e

    .end local v6    # "e":Ljava/io/IOException;
    .restart local v3    # "directoryType":I
    .restart local v4    # "tagType":I
    .restart local v5    # "tagByteCount":I
    :cond_85
    move-object v0, p0

    move-object v1, p1

    .line 143
    :try_start_87
    invoke-direct/range {v0 .. v5}, Lcom/drew/metadata/iptc/IptcReader;->processTag(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Directory;III)V
    :try_end_8a
    .catch Ljava/io/IOException; {:try_start_87 .. :try_end_8a} :catch_8c

    .line 149
    add-int/2addr v7, v5

    .line 150
    goto :goto_e

    .line 144
    :catch_8c
    move-exception v6

    .line 145
    .restart local v6    # "e":Ljava/io/IOException;
    const-string v0, "Error processing IPTC tag"

    invoke-virtual {v2, v0}, Lcom/drew/metadata/iptc/IptcDirectory;->addError(Ljava/lang/String;)V

    goto :goto_4e
.end method

.method public getSegmentTypes()Ljava/lang/Iterable;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/drew/imaging/jpeg/JpegSegmentType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 62
    sget-object v0, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPD:Lcom/drew/imaging/jpeg/JpegSegmentType;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public readJpegSegments(Ljava/lang/Iterable;Lcom/drew/metadata/Metadata;Lcom/drew/imaging/jpeg/JpegSegmentType;)V
    .registers 9
    .param p1    # Ljava/lang/Iterable;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "segmentType"    # Lcom/drew/imaging/jpeg/JpegSegmentType;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<[B>;",
            "Lcom/drew/metadata/Metadata;",
            "Lcom/drew/imaging/jpeg/JpegSegmentType;",
            ")V"
        }
    .end annotation

    .prologue
    .line 67
    .local p1, "segments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .line 69
    .local v1, "segmentBytes":[B
    array-length v2, v1

    if-eqz v2, :cond_4

    const/4 v2, 0x0

    aget-byte v2, v1, v2

    const/16 v3, 0x1c

    if-ne v2, v3, :cond_4

    .line 70
    new-instance v2, Lcom/drew/lang/SequentialByteArrayReader;

    invoke-direct {v2, v1}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    array-length v3, v1

    int-to-long v3, v3

    invoke-virtual {p0, v2, p2, v3, v4}, Lcom/drew/metadata/iptc/IptcReader;->extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;J)V

    goto :goto_4

    .line 73
    .end local v1    # "segmentBytes":[B
    :cond_25
    return-void
.end method
