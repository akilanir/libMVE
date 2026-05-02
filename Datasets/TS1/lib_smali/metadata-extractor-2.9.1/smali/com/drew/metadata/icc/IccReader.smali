.class public Lcom/drew/metadata/icc/IccReader;
.super Ljava/lang/Object;
.source "IccReader.java"

# interfaces
.implements Lcom/drew/imaging/jpeg/JpegSegmentMetadataReader;
.implements Lcom/drew/metadata/MetadataReader;


# static fields
.field public static final JPEG_SEGMENT_PREAMBLE:Ljava/lang/String; = "ICC_PROFILE"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getStringFromInt32(I)Ljava/lang/String;
    .registers 4
    .param p0, "d"    # I
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 209
    const/4 v1, 0x4

    new-array v0, v1, [B

    const/4 v1, 0x0

    const/high16 v2, -0x1000000

    and-int/2addr v2, p0

    shr-int/lit8 v2, v2, 0x18

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x1

    const/high16 v2, 0xff0000

    and-int/2addr v2, p0

    shr-int/lit8 v2, v2, 0x10

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x2

    const v2, 0xff00

    and-int/2addr v2, p0

    shr-int/lit8 v2, v2, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x3

    and-int/lit16 v2, p0, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 215
    .local v0, "b":[B
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    return-object v1
.end method

.method private set4ByteString(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V
    .registers 6
    .param p1, "directory"    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "tagType"    # I
    .param p3, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 162
    invoke-virtual {p3, p2}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v0

    .line 163
    .local v0, "i":I
    if-eqz v0, :cond_d

    .line 164
    invoke-static {v0}, Lcom/drew/metadata/icc/IccReader;->getStringFromInt32(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Lcom/drew/metadata/Directory;->setString(ILjava/lang/String;)V

    .line 165
    :cond_d
    return-void
.end method

.method private setDate(Lcom/drew/metadata/icc/IccDirectory;ILcom/drew/lang/RandomAccessReader;)V
    .registers 15
    .param p1, "directory"    # Lcom/drew/metadata/icc/IccDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "tagType"    # I
    .param p3, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 185
    invoke-virtual {p3, p2}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v6

    .line 186
    .local v6, "y":I
    add-int/lit8 v7, p2, 0x2

    invoke-virtual {p3, v7}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v4

    .line 187
    .local v4, "m":I
    add-int/lit8 v7, p2, 0x4

    invoke-virtual {p3, v7}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v1

    .line 188
    .local v1, "d":I
    add-int/lit8 v7, p2, 0x6

    invoke-virtual {p3, v7}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    .line 189
    .local v3, "h":I
    add-int/lit8 v7, p2, 0x8

    invoke-virtual {p3, v7}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v0

    .line 190
    .local v0, "M":I
    add-int/lit8 v7, p2, 0xa

    invoke-virtual {p3, v7}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v5

    .line 192
    .local v5, "s":I
    add-int/lit8 v7, v4, -0x1

    invoke-static {v6, v7, v1}, Lcom/drew/lang/DateUtil;->isValidDate(III)Z

    move-result v7

    if-eqz v7, :cond_67

    invoke-static {v3, v0, v5}, Lcom/drew/lang/DateUtil;->isValidTime(III)Z

    move-result v7

    if-eqz v7, :cond_67

    .line 194
    const-string v7, "%04d:%02d:%02d %02d:%02d:%02d"

    const/4 v8, 0x6

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 195
    .local v2, "dateString":Ljava/lang/String;
    invoke-virtual {p1, p2, v2}, Lcom/drew/metadata/icc/IccDirectory;->setString(ILjava/lang/String;)V

    .line 203
    .end local v2    # "dateString":Ljava/lang/String;
    :goto_66
    return-void

    .line 199
    :cond_67
    const-string v7, "ICC data describes an invalid date/time: year=%d month=%d day=%d hour=%d minute=%d second=%d"

    const/4 v8, 0x6

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Lcom/drew/metadata/icc/IccDirectory;->addError(Ljava/lang/String;)V

    goto :goto_66
.end method

.method private setInt32(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V
    .registers 5
    .param p1, "directory"    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "tagType"    # I
    .param p3, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 169
    invoke-virtual {p3, p2}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v0

    .line 170
    .local v0, "i":I
    if-eqz v0, :cond_9

    .line 171
    invoke-virtual {p1, p2, v0}, Lcom/drew/metadata/Directory;->setInt(II)V

    .line 172
    :cond_9
    return-void
.end method

.method private setInt64(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V
    .registers 8
    .param p1, "directory"    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "tagType"    # I
    .param p3, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 177
    invoke-virtual {p3, p2}, Lcom/drew/lang/RandomAccessReader;->getInt64(I)J

    move-result-wide v0

    .line 178
    .local v0, "l":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_d

    .line 179
    invoke-virtual {p1, p2, v0, v1}, Lcom/drew/metadata/Directory;->setLong(IJ)V

    .line 180
    :cond_d
    return-void
.end method


# virtual methods
.method public extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;)V
    .registers 4
    .param p1, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 94
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/drew/metadata/icc/IccReader;->extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;Lcom/drew/metadata/Directory;)V

    .line 95
    return-void
.end method

.method public extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;Lcom/drew/metadata/Directory;)V
    .registers 19
    .param p1, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "parentDirectory"    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 101
    new-instance v2, Lcom/drew/metadata/icc/IccDirectory;

    invoke-direct {v2}, Lcom/drew/metadata/icc/IccDirectory;-><init>()V

    .line 103
    .local v2, "directory":Lcom/drew/metadata/icc/IccDirectory;
    if-eqz p3, :cond_c

    .line 104
    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Lcom/drew/metadata/icc/IccDirectory;->setParent(Lcom/drew/metadata/Directory;)V

    .line 107
    :cond_c
    const/4 v13, 0x0

    :try_start_d
    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v6

    .line 108
    .local v6, "profileByteCount":I
    const/4 v13, 0x0

    invoke-virtual {v2, v13, v6}, Lcom/drew/metadata/icc/IccDirectory;->setInt(II)V

    .line 111
    const/4 v13, 0x4

    move-object/from16 v0, p1

    invoke-direct {p0, v2, v13, v0}, Lcom/drew/metadata/icc/IccReader;->set4ByteString(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V

    .line 112
    const/16 v13, 0x8

    move-object/from16 v0, p1

    invoke-direct {p0, v2, v13, v0}, Lcom/drew/metadata/icc/IccReader;->setInt32(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V

    .line 113
    const/16 v13, 0xc

    move-object/from16 v0, p1

    invoke-direct {p0, v2, v13, v0}, Lcom/drew/metadata/icc/IccReader;->set4ByteString(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V

    .line 114
    const/16 v13, 0x10

    move-object/from16 v0, p1

    invoke-direct {p0, v2, v13, v0}, Lcom/drew/metadata/icc/IccReader;->set4ByteString(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V

    .line 115
    const/16 v13, 0x14

    move-object/from16 v0, p1

    invoke-direct {p0, v2, v13, v0}, Lcom/drew/metadata/icc/IccReader;->set4ByteString(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V

    .line 116
    const/16 v13, 0x18

    move-object/from16 v0, p1

    invoke-direct {p0, v2, v13, v0}, Lcom/drew/metadata/icc/IccReader;->setDate(Lcom/drew/metadata/icc/IccDirectory;ILcom/drew/lang/RandomAccessReader;)V

    .line 117
    const/16 v13, 0x24

    move-object/from16 v0, p1

    invoke-direct {p0, v2, v13, v0}, Lcom/drew/metadata/icc/IccReader;->set4ByteString(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V

    .line 118
    const/16 v13, 0x28

    move-object/from16 v0, p1

    invoke-direct {p0, v2, v13, v0}, Lcom/drew/metadata/icc/IccReader;->set4ByteString(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V

    .line 119
    const/16 v13, 0x2c

    move-object/from16 v0, p1

    invoke-direct {p0, v2, v13, v0}, Lcom/drew/metadata/icc/IccReader;->setInt32(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V

    .line 120
    const/16 v13, 0x30

    move-object/from16 v0, p1

    invoke-direct {p0, v2, v13, v0}, Lcom/drew/metadata/icc/IccReader;->set4ByteString(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V

    .line 122
    const/16 v13, 0x34

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v11

    .line 123
    .local v11, "temp":I
    if-eqz v11, :cond_70

    .line 124
    const v13, 0x20202020

    if-gt v11, v13, :cond_dd

    .line 125
    const/16 v13, 0x34

    invoke-virtual {v2, v13, v11}, Lcom/drew/metadata/icc/IccDirectory;->setInt(II)V

    .line 131
    :cond_70
    :goto_70
    const/16 v13, 0x40

    move-object/from16 v0, p1

    invoke-direct {p0, v2, v13, v0}, Lcom/drew/metadata/icc/IccReader;->setInt32(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V

    .line 132
    const/16 v13, 0x38

    move-object/from16 v0, p1

    invoke-direct {p0, v2, v13, v0}, Lcom/drew/metadata/icc/IccReader;->setInt64(Lcom/drew/metadata/Directory;ILcom/drew/lang/RandomAccessReader;)V

    .line 134
    const/4 v13, 0x3

    new-array v12, v13, [F

    const/4 v13, 0x0

    const/16 v14, 0x44

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/drew/lang/RandomAccessReader;->getS15Fixed16(I)F

    move-result v14

    aput v14, v12, v13

    const/4 v13, 0x1

    const/16 v14, 0x48

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/drew/lang/RandomAccessReader;->getS15Fixed16(I)F

    move-result v14

    aput v14, v12, v13

    const/4 v13, 0x2

    const/16 v14, 0x4c

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/drew/lang/RandomAccessReader;->getS15Fixed16(I)F

    move-result v14

    aput v14, v12, v13

    .line 139
    .local v12, "xyz":[F
    const/16 v13, 0x44

    invoke-virtual {v2, v13, v12}, Lcom/drew/metadata/icc/IccDirectory;->setObject(ILjava/lang/Object;)V

    .line 142
    const/16 v13, 0x80

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v7

    .line 143
    .local v7, "tagCount":I
    const/16 v13, 0x80

    invoke-virtual {v2, v13, v7}, Lcom/drew/metadata/icc/IccDirectory;->setInt(II)V

    .line 145
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_b5
    if-ge v4, v7, :cond_102

    .line 146
    mul-int/lit8 v13, v4, 0xc

    add-int/lit16 v5, v13, 0x84

    .line 147
    .local v5, "pos":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v10

    .line 148
    .local v10, "tagType":I
    add-int/lit8 v13, v5, 0x4

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v9

    .line 149
    .local v9, "tagPtr":I
    add-int/lit8 v13, v5, 0x8

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v8

    .line 150
    .local v8, "tagLen":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v9, v8}, Lcom/drew/lang/RandomAccessReader;->getBytes(II)[B

    move-result-object v1

    .line 151
    .local v1, "b":[B
    invoke-virtual {v2, v10, v1}, Lcom/drew/metadata/icc/IccDirectory;->setByteArray(I[B)V

    .line 145
    add-int/lit8 v4, v4, 0x1

    goto :goto_b5

    .line 127
    .end local v1    # "b":[B
    .end local v4    # "i":I
    .end local v5    # "pos":I
    .end local v7    # "tagCount":I
    .end local v8    # "tagLen":I
    .end local v9    # "tagPtr":I
    .end local v10    # "tagType":I
    .end local v12    # "xyz":[F
    :cond_dd
    const/16 v13, 0x34

    invoke-static {v11}, Lcom/drew/metadata/icc/IccReader;->getStringFromInt32(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lcom/drew/metadata/icc/IccDirectory;->setString(ILjava/lang/String;)V
    :try_end_e6
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_e6} :catch_e7

    goto :goto_70

    .line 153
    .end local v6    # "profileByteCount":I
    .end local v11    # "temp":I
    :catch_e7
    move-exception v3

    .line 154
    .local v3, "ex":Ljava/io/IOException;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Exception reading ICC profile: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Lcom/drew/metadata/icc/IccDirectory;->addError(Ljava/lang/String;)V

    .line 157
    .end local v3    # "ex":Ljava/io/IOException;
    :cond_102
    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 158
    return-void
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
    .line 57
    sget-object v0, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP2:Lcom/drew/imaging/jpeg/JpegSegmentType;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public readJpegSegments(Ljava/lang/Iterable;Lcom/drew/metadata/Metadata;Lcom/drew/imaging/jpeg/JpegSegmentType;)V
    .registers 13
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
    .local p1, "segments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    const/16 v8, 0xe

    const/4 v7, 0x0

    .line 62
    const-string v5, "ICC_PROFILE"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    .line 66
    .local v3, "preambleLength":I
    const/4 v0, 0x0

    .line 68
    .local v0, "buffer":[B
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_e
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    .line 70
    .local v4, "segmentBytes":[B
    array-length v5, v4

    if-lt v5, v3, :cond_e

    const-string v5, "ICC_PROFILE"

    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v4, v7, v3}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 76
    if-nez v0, :cond_38

    .line 77
    array-length v5, v4

    add-int/lit8 v5, v5, -0xe

    new-array v0, v5, [B

    .line 79
    array-length v5, v4

    add-int/lit8 v5, v5, -0xe

    invoke-static {v4, v8, v0, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_e

    .line 81
    :cond_38
    array-length v5, v0

    array-length v6, v4

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, -0xe

    new-array v2, v5, [B

    .line 82
    .local v2, "newBuffer":[B
    array-length v5, v0

    invoke-static {v0, v7, v2, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 83
    array-length v5, v0

    array-length v6, v4

    add-int/lit8 v6, v6, -0xe

    invoke-static {v4, v8, v2, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    move-object v0, v2

    goto :goto_e

    .line 88
    .end local v2    # "newBuffer":[B
    .end local v4    # "segmentBytes":[B
    :cond_4c
    if-eqz v0, :cond_56

    .line 89
    new-instance v5, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v5, v0}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    invoke-virtual {p0, v5, p2}, Lcom/drew/metadata/icc/IccReader;->extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;)V

    .line 90
    :cond_56
    return-void
.end method
