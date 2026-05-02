.class public Lcom/drew/metadata/photoshop/PhotoshopDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "PhotoshopDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/photoshop/PhotoshopDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/photoshop/PhotoshopDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/photoshop/PhotoshopDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 44
    return-void
.end method

.method private get32BitNumberString(I)Ljava/lang/String;
    .registers 10
    .param p1, "tag"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 294
    iget-object v3, p0, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/photoshop/PhotoshopDirectory;

    invoke-virtual {v3, p1}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->getByteArray(I)[B

    move-result-object v0

    .line 295
    .local v0, "bytes":[B
    if-nez v0, :cond_d

    move-object v3, v4

    .line 301
    :goto_c
    return-object v3

    .line 297
    :cond_d
    new-instance v2, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v2, v0}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 299
    .local v2, "reader":Lcom/drew/lang/RandomAccessReader;
    :try_start_12
    const-string v3, "%d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_26} :catch_28

    move-result-object v3

    goto :goto_c

    .line 300
    :catch_28
    move-exception v1

    .local v1, "e":Ljava/io/IOException;
    move-object v3, v4

    .line 301
    goto :goto_c
.end method

.method private getBinaryDataString(I)Ljava/lang/String;
    .registers 7
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 317
    iget-object v1, p0, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/photoshop/PhotoshopDirectory;

    invoke-virtual {v1, p1}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->getByteArray(I)[B

    move-result-object v0

    .line 318
    .local v0, "bytes":[B
    if-nez v0, :cond_c

    .line 319
    const/4 v1, 0x0

    .line 320
    :goto_b
    return-object v1

    :cond_c
    const-string v1, "%d bytes binary data"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    array-length v4, v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method private getBooleanString(I)Ljava/lang/String;
    .registers 4
    .param p1, "tag"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 285
    iget-object v1, p0, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/photoshop/PhotoshopDirectory;

    invoke-virtual {v1, p1}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->getByteArray(I)[B

    move-result-object v0

    .line 286
    .local v0, "bytes":[B
    if-eqz v0, :cond_d

    array-length v1, v0

    if-nez v1, :cond_f

    .line 287
    :cond_d
    const/4 v1, 0x0

    .line 288
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    aget-byte v1, v0, v1

    if-nez v1, :cond_17

    const-string v1, "No"

    goto :goto_e

    :cond_17
    const-string v1, "Yes"

    goto :goto_e
.end method

.method private getSimpleString(I)Ljava/lang/String;
    .registers 4
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 308
    iget-object v1, p0, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/photoshop/PhotoshopDirectory;

    invoke-virtual {v1, p1}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->getByteArray(I)[B

    move-result-object v0

    .line 309
    .local v0, "bytes":[B
    if-nez v0, :cond_c

    .line 310
    const/4 v1, 0x0

    .line 311
    :goto_b
    return-object v1

    :cond_c
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    goto :goto_b
.end method


# virtual methods
.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I

    .prologue
    .line 49
    sparse-switch p1, :sswitch_data_40

    .line 78
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 52
    :sswitch_8
    invoke-virtual {p0, p1}, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->getThumbnailDescription(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 55
    :sswitch_d
    invoke-direct {p0, p1}, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->getSimpleString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 57
    :sswitch_12
    invoke-direct {p0, p1}, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->getBinaryDataString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 59
    :sswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->getSlicesDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 61
    :sswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->getVersionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 63
    :sswitch_21
    invoke-direct {p0, p1}, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->getBooleanString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 65
    :sswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->getResolutionInfoDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 70
    :sswitch_2b
    invoke-direct {p0, p1}, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->get32BitNumberString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 72
    :sswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->getJpegQualityString()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 74
    :sswitch_35
    invoke-virtual {p0}, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->getPrintScaleDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 76
    :sswitch_3a
    invoke-virtual {p0}, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->getPixelAspectRatioString()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 49
    nop

    :sswitch_data_40
    .sparse-switch
        0x3ea -> :sswitch_d
        0x3ed -> :sswitch_26
        0x404 -> :sswitch_12
        0x406 -> :sswitch_30
        0x409 -> :sswitch_8
        0x40a -> :sswitch_21
        0x40b -> :sswitch_d
        0x40c -> :sswitch_8
        0x40d -> :sswitch_2b
        0x414 -> :sswitch_2b
        0x419 -> :sswitch_2b
        0x41a -> :sswitch_17
        0x41e -> :sswitch_2b
        0x421 -> :sswitch_1c
        0x426 -> :sswitch_35
        0x428 -> :sswitch_3a
    .end sparse-switch
.end method

.method public getJpegQualityString()Ljava/lang/String;
    .registers 15
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 86
    :try_start_0
    iget-object v10, p0, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v10, Lcom/drew/metadata/photoshop/PhotoshopDirectory;

    const/16 v11, 0x406

    invoke-virtual {v10, v11}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->getByteArray(I)[B

    move-result-object v0

    .line 88
    .local v0, "b":[B
    if-nez v0, :cond_17

    .line 89
    iget-object v10, p0, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v10, Lcom/drew/metadata/photoshop/PhotoshopDirectory;

    const/16 v11, 0x406

    invoke-virtual {v10, v11}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 149
    .end local v0    # "b":[B
    :goto_16
    return-object v10

    .line 91
    .restart local v0    # "b":[B
    :cond_17
    new-instance v7, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v7, v0}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 92
    .local v7, "reader":Lcom/drew/lang/RandomAccessReader;
    const/4 v10, 0x0

    invoke-virtual {v7, v10}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v4

    .line 93
    .local v4, "q":I
    const/4 v10, 0x2

    invoke-virtual {v7, v10}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v2

    .line 94
    .local v2, "f":I
    const/4 v10, 0x4

    invoke-virtual {v7, v10}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v8

    .line 96
    .local v8, "s":I
    const v10, 0xffff

    if-gt v4, v10, :cond_84

    const v10, 0xfffd

    if-lt v4, v10, :cond_84

    const v10, 0xfffc

    sub-int v5, v4, v10

    .line 103
    .local v5, "q1":I
    :goto_3a
    sparse-switch v4, :sswitch_data_b8

    .line 125
    const-string v6, "Unknown"

    .line 129
    .local v6, "quality":Ljava/lang/String;
    :goto_3f
    sparse-switch v2, :sswitch_data_ea

    .line 140
    const-string v10, "Unknown 0x%04X"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 143
    .local v3, "format":Ljava/lang/String;
    :goto_52
    const/4 v10, 0x1

    if-lt v8, v10, :cond_a2

    const/4 v10, 0x3

    if-gt v8, v10, :cond_a2

    const-string v10, "%d"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    add-int/lit8 v13, v8, 0x2

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 147
    .local v9, "scans":Ljava/lang/String;
    :goto_6a
    const-string v10, "%d (%s), %s format, %s scans"

    const/4 v11, 0x4

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    aput-object v6, v11, v12

    const/4 v12, 0x2

    aput-object v3, v11, v12

    const/4 v12, 0x3

    aput-object v9, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    goto :goto_16

    .line 96
    .end local v3    # "format":Ljava/lang/String;
    .end local v5    # "q1":I
    .end local v6    # "quality":Ljava/lang/String;
    .end local v9    # "scans":Ljava/lang/String;
    :cond_84
    const/16 v10, 0x8

    if-gt v4, v10, :cond_8b

    add-int/lit8 v5, v4, 0x4

    goto :goto_3a

    :cond_8b
    move v5, v4

    goto :goto_3a

    .line 108
    .restart local v5    # "q1":I
    :sswitch_8d
    const-string v6, "Low"

    .line 109
    .restart local v6    # "quality":Ljava/lang/String;
    goto :goto_3f

    .line 113
    .end local v6    # "quality":Ljava/lang/String;
    :sswitch_90
    const-string v6, "Medium"

    .line 114
    .restart local v6    # "quality":Ljava/lang/String;
    goto :goto_3f

    .line 117
    .end local v6    # "quality":Ljava/lang/String;
    :sswitch_93
    const-string v6, "High"

    .line 118
    .restart local v6    # "quality":Ljava/lang/String;
    goto :goto_3f

    .line 122
    .end local v6    # "quality":Ljava/lang/String;
    :sswitch_96
    const-string v6, "Maximum"

    .line 123
    .restart local v6    # "quality":Ljava/lang/String;
    goto :goto_3f

    .line 131
    :sswitch_99
    const-string v3, "Standard"

    .line 132
    .restart local v3    # "format":Ljava/lang/String;
    goto :goto_52

    .line 134
    .end local v3    # "format":Ljava/lang/String;
    :sswitch_9c
    const-string v3, "Optimised"

    .line 135
    .restart local v3    # "format":Ljava/lang/String;
    goto :goto_52

    .line 137
    .end local v3    # "format":Ljava/lang/String;
    :sswitch_9f
    const-string v3, "Progressive"

    .line 138
    .restart local v3    # "format":Ljava/lang/String;
    goto :goto_52

    .line 143
    :cond_a2
    const-string v10, "Unknown 0x%04X"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_b1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_b1} :catch_b3

    move-result-object v9

    goto :goto_6a

    .line 148
    .end local v0    # "b":[B
    .end local v2    # "f":I
    .end local v3    # "format":Ljava/lang/String;
    .end local v4    # "q":I
    .end local v5    # "q1":I
    .end local v6    # "quality":Ljava/lang/String;
    .end local v7    # "reader":Lcom/drew/lang/RandomAccessReader;
    .end local v8    # "s":I
    :catch_b3
    move-exception v1

    .line 149
    .local v1, "e":Ljava/io/IOException;
    const/4 v10, 0x0

    goto/16 :goto_16

    .line 103
    nop

    :sswitch_data_b8
    .sparse-switch
        0x0 -> :sswitch_8d
        0x1 -> :sswitch_90
        0x2 -> :sswitch_90
        0x3 -> :sswitch_90
        0x4 -> :sswitch_93
        0x5 -> :sswitch_93
        0x6 -> :sswitch_96
        0x7 -> :sswitch_96
        0x8 -> :sswitch_96
        0xfffd -> :sswitch_8d
        0xfffe -> :sswitch_8d
        0xffff -> :sswitch_8d
    .end sparse-switch

    .line 129
    :sswitch_data_ea
    .sparse-switch
        0x0 -> :sswitch_99
        0x1 -> :sswitch_9c
        0x101 -> :sswitch_9f
    .end sparse-switch
.end method

.method public getPixelAspectRatioString()Ljava/lang/String;
    .registers 9
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 157
    :try_start_1
    iget-object v5, p0, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v5, Lcom/drew/metadata/photoshop/PhotoshopDirectory;

    const/16 v7, 0x428

    invoke-virtual {v5, v7}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->getByteArray(I)[B

    move-result-object v0

    .line 158
    .local v0, "bytes":[B
    if-nez v0, :cond_f

    move-object v5, v6

    .line 164
    .end local v0    # "bytes":[B
    :goto_e
    return-object v5

    .line 160
    .restart local v0    # "bytes":[B
    :cond_f
    new-instance v4, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v4, v0}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 161
    .local v4, "reader":Lcom/drew/lang/RandomAccessReader;
    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Lcom/drew/lang/RandomAccessReader;->getDouble64(I)D

    move-result-wide v1

    .line 162
    .local v1, "d":D
    invoke-static {v1, v2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1c} :catch_1e

    move-result-object v5

    goto :goto_e

    .line 163
    .end local v0    # "bytes":[B
    .end local v1    # "d":D
    .end local v4    # "reader":Lcom/drew/lang/RandomAccessReader;
    :catch_1e
    move-exception v3

    .local v3, "e":Ljava/lang/Exception;
    move-object v5, v6

    .line 164
    goto :goto_e
.end method

.method public getPrintScaleDescription()Ljava/lang/String;
    .registers 13
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 172
    :try_start_1
    iget-object v7, p0, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v7, Lcom/drew/metadata/photoshop/PhotoshopDirectory;

    const/16 v9, 0x426

    invoke-virtual {v7, v9}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->getByteArray(I)[B

    move-result-object v0

    .line 173
    .local v0, "bytes":[B
    if-nez v0, :cond_f

    move-object v7, v8

    .line 191
    .end local v0    # "bytes":[B
    :goto_e
    return-object v7

    .line 175
    .restart local v0    # "bytes":[B
    :cond_f
    new-instance v4, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v4, v0}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 176
    .local v4, "reader":Lcom/drew/lang/RandomAccessReader;
    const/4 v7, 0x0

    invoke-virtual {v4, v7}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v6

    .line 177
    .local v6, "style":I
    const/4 v7, 0x2

    invoke-virtual {v4, v7}, Lcom/drew/lang/RandomAccessReader;->getFloat32(I)F

    move-result v2

    .line 178
    .local v2, "locX":F
    const/4 v7, 0x6

    invoke-virtual {v4, v7}, Lcom/drew/lang/RandomAccessReader;->getFloat32(I)F

    move-result v3

    .line 179
    .local v3, "locY":F
    const/16 v7, 0xa

    invoke-virtual {v4, v7}, Lcom/drew/lang/RandomAccessReader;->getFloat32(I)F

    move-result v5

    .line 180
    .local v5, "scale":F
    packed-switch v6, :pswitch_data_8c

    .line 188
    const-string v7, "Unknown %04X, X:%s Y:%s, Scale:%s"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x2

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x3

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto :goto_e

    .line 182
    :pswitch_52
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Centered, Scale "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_e

    .line 184
    :pswitch_66
    const-string v7, "Size to fit"

    goto :goto_e

    .line 186
    :pswitch_69
    const-string v7, "User defined, X:%s Y:%s, Scale:%s"

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x2

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_86} :catch_88

    move-result-object v7

    goto :goto_e

    .line 190
    .end local v0    # "bytes":[B
    .end local v2    # "locX":F
    .end local v3    # "locY":F
    .end local v4    # "reader":Lcom/drew/lang/RandomAccessReader;
    .end local v5    # "scale":F
    .end local v6    # "style":I
    :catch_88
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    move-object v7, v8

    .line 191
    goto :goto_e

    .line 180
    nop

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_52
        :pswitch_66
        :pswitch_69
    .end packed-switch
.end method

.method public getResolutionInfoDescription()Ljava/lang/String;
    .registers 11
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 199
    :try_start_1
    iget-object v6, p0, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v6, Lcom/drew/metadata/photoshop/PhotoshopDirectory;

    const/16 v8, 0x3ed

    invoke-virtual {v6, v8}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->getByteArray(I)[B

    move-result-object v0

    .line 200
    .local v0, "bytes":[B
    if-nez v0, :cond_f

    move-object v6, v7

    .line 208
    .end local v0    # "bytes":[B
    :goto_e
    return-object v6

    .line 202
    .restart local v0    # "bytes":[B
    :cond_f
    new-instance v3, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v3, v0}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 203
    .local v3, "reader":Lcom/drew/lang/RandomAccessReader;
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Lcom/drew/lang/RandomAccessReader;->getS15Fixed16(I)F

    move-result v4

    .line 204
    .local v4, "resX":F
    const/16 v6, 0x8

    invoke-virtual {v3, v6}, Lcom/drew/lang/RandomAccessReader;->getS15Fixed16(I)F

    move-result v5

    .line 205
    .local v5, "resY":F
    new-instance v2, Ljava/text/DecimalFormat;

    const-string v6, "0.##"

    invoke-direct {v2, v6}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 206
    .local v2, "format":Ljava/text/DecimalFormat;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    float-to-double v8, v4

    invoke-virtual {v2, v8, v9}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, "x"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    float-to-double v8, v5

    invoke-virtual {v2, v8, v9}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, " DPI"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4c} :catch_4e

    move-result-object v6

    goto :goto_e

    .line 207
    .end local v0    # "bytes":[B
    .end local v2    # "format":Ljava/text/DecimalFormat;
    .end local v3    # "reader":Lcom/drew/lang/RandomAccessReader;
    .end local v4    # "resX":F
    .end local v5    # "resY":F
    :catch_4e
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    move-object v6, v7

    .line 208
    goto :goto_e
.end method

.method public getSlicesDescription()Ljava/lang/String;
    .registers 13
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 243
    :try_start_1
    iget-object v7, p0, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v7, Lcom/drew/metadata/photoshop/PhotoshopDirectory;

    const/16 v9, 0x41a

    invoke-virtual {v7, v9}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->getByteArray(I)[B

    move-result-object v0

    .line 244
    .local v0, "bytes":[B
    if-nez v0, :cond_f

    move-object v7, v8

    .line 254
    .end local v0    # "bytes":[B
    :goto_e
    return-object v7

    .line 246
    .restart local v0    # "bytes":[B
    :cond_f
    new-instance v5, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v5, v0}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 247
    .local v5, "reader":Lcom/drew/lang/RandomAccessReader;
    const/16 v7, 0x14

    invoke-virtual {v5, v7}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v3

    .line 248
    .local v3, "nameLength":I
    const/16 v7, 0x18

    mul-int/lit8 v9, v3, 0x2

    const-string v10, "UTF-16"

    invoke-virtual {v5, v7, v9, v10}, Lcom/drew/lang/RandomAccessReader;->getString(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 249
    .local v2, "name":Ljava/lang/String;
    mul-int/lit8 v7, v3, 0x2

    add-int/lit8 v4, v7, 0x18

    .line 250
    .local v4, "pos":I
    invoke-virtual {v5, v4}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v6

    .line 251
    .local v6, "sliceCount":I
    const-string v7, "%s (%d,%d,%d,%d) %d Slices"

    const/4 v9, 0x6

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v2, v9, v10

    const/4 v10, 0x1

    const/4 v11, 0x4

    invoke-virtual {v5, v11}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x2

    const/16 v11, 0x8

    invoke-virtual {v5, v11}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x3

    const/16 v11, 0xc

    invoke-virtual {v5, v11}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x4

    const/16 v11, 0x10

    invoke-virtual {v5, v11}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x5

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_71
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_71} :catch_73

    move-result-object v7

    goto :goto_e

    .line 253
    .end local v0    # "bytes":[B
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "nameLength":I
    .end local v4    # "pos":I
    .end local v5    # "reader":Lcom/drew/lang/RandomAccessReader;
    .end local v6    # "sliceCount":I
    :catch_73
    move-exception v1

    .local v1, "e":Ljava/io/IOException;
    move-object v7, v8

    .line 254
    goto :goto_e
.end method

.method public getThumbnailDescription(I)Ljava/lang/String;
    .registers 15
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 262
    :try_start_0
    iget-object v9, p0, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v9, Lcom/drew/metadata/photoshop/PhotoshopDirectory;

    invoke-virtual {v9, p1}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->getByteArray(I)[B

    move-result-object v7

    .line 263
    .local v7, "v":[B
    if-nez v7, :cond_c

    .line 264
    const/4 v9, 0x0

    .line 278
    .end local v7    # "v":[B
    :goto_b
    return-object v9

    .line 265
    .restart local v7    # "v":[B
    :cond_c
    new-instance v5, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v5, v7}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 266
    .local v5, "reader":Lcom/drew/lang/RandomAccessReader;
    const/4 v9, 0x0

    invoke-virtual {v5, v9}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v3

    .line 267
    .local v3, "format":I
    const/4 v9, 0x4

    invoke-virtual {v5, v9}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v8

    .line 268
    .local v8, "width":I
    const/16 v9, 0x8

    invoke-virtual {v5, v9}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v4

    .line 270
    .local v4, "height":I
    const/16 v9, 0x10

    invoke-virtual {v5, v9}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v6

    .line 271
    .local v6, "totalSize":I
    const/16 v9, 0x14

    invoke-virtual {v5, v9}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v1

    .line 272
    .local v1, "compSize":I
    const/16 v9, 0x18

    invoke-virtual {v5, v9}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v0

    .line 274
    .local v0, "bpp":I
    const-string v10, "%s, %dx%d, Decomp %d bytes, %d bpp, %d bytes"

    const/4 v9, 0x6

    new-array v11, v9, [Ljava/lang/Object;

    const/4 v12, 0x0

    const/4 v9, 0x1

    if-ne v3, v9, :cond_68

    const-string v9, "JpegRGB"

    :goto_3e
    aput-object v9, v11, v12

    const/4 v9, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v9

    const/4 v9, 0x2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v9

    const/4 v9, 0x3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v9

    const/4 v9, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v9

    const/4 v9, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v9

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    goto :goto_b

    :cond_68
    const-string v9, "RawRGB"
    :try_end_6a
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_6a} :catch_6b

    goto :goto_3e

    .line 277
    .end local v0    # "bpp":I
    .end local v1    # "compSize":I
    .end local v3    # "format":I
    .end local v4    # "height":I
    .end local v5    # "reader":Lcom/drew/lang/RandomAccessReader;
    .end local v6    # "totalSize":I
    .end local v7    # "v":[B
    .end local v8    # "width":I
    :catch_6b
    move-exception v2

    .line 278
    .local v2, "e":Ljava/io/IOException;
    const/4 v9, 0x0

    goto :goto_b
.end method

.method public getVersionDescription()Ljava/lang/String;
    .registers 16
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 216
    :try_start_1
    iget-object v10, p0, Lcom/drew/metadata/photoshop/PhotoshopDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v10, Lcom/drew/metadata/photoshop/PhotoshopDirectory;

    const/16 v12, 0x421

    invoke-virtual {v10, v12}, Lcom/drew/metadata/photoshop/PhotoshopDirectory;->getByteArray(I)[B

    move-result-object v0

    .line 217
    .local v0, "bytes":[B
    if-nez v0, :cond_f

    move-object v10, v11

    .line 235
    .end local v0    # "bytes":[B
    :goto_e
    return-object v10

    .line 219
    .restart local v0    # "bytes":[B
    :cond_f
    new-instance v4, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v4, v0}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    .line 220
    .local v4, "reader":Lcom/drew/lang/RandomAccessReader;
    const/4 v3, 0x0

    .line 221
    .local v3, "pos":I
    const/4 v10, 0x0

    invoke-virtual {v4, v10}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v7

    .line 222
    .local v7, "ver":I
    add-int/lit8 v3, v3, 0x4

    .line 223
    add-int/lit8 v3, v3, 0x1

    .line 224
    const/4 v10, 0x5

    invoke-virtual {v4, v10}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v5

    .line 225
    .local v5, "readerLength":I
    add-int/lit8 v3, v3, 0x4

    .line 226
    const/16 v10, 0x9

    mul-int/lit8 v12, v5, 0x2

    const-string v13, "UTF-16"

    invoke-virtual {v4, v10, v12, v13}, Lcom/drew/lang/RandomAccessReader;->getString(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 227
    .local v6, "readerStr":Ljava/lang/String;
    mul-int/lit8 v10, v5, 0x2

    add-int/lit8 v3, v10, 0x9

    .line 228
    invoke-virtual {v4, v3}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v8

    .line 229
    .local v8, "writerLength":I
    add-int/lit8 v3, v3, 0x4

    .line 230
    mul-int/lit8 v10, v8, 0x2

    const-string v12, "UTF-16"

    invoke-virtual {v4, v3, v10, v12}, Lcom/drew/lang/RandomAccessReader;->getString(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 231
    .local v9, "writerStr":Ljava/lang/String;
    mul-int/lit8 v10, v8, 0x2

    add-int/2addr v3, v10

    .line 232
    invoke-virtual {v4, v3}, Lcom/drew/lang/RandomAccessReader;->getInt32(I)I

    move-result v2

    .line 233
    .local v2, "fileVersion":I
    const-string v10, "%d (%s, %s) %d"

    const/4 v12, 0x4

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x1

    aput-object v6, v12, v13

    const/4 v13, 0x2

    aput-object v9, v12, v13

    const/4 v13, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v10, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_64} :catch_66

    move-result-object v10

    goto :goto_e

    .line 234
    .end local v0    # "bytes":[B
    .end local v2    # "fileVersion":I
    .end local v3    # "pos":I
    .end local v4    # "reader":Lcom/drew/lang/RandomAccessReader;
    .end local v5    # "readerLength":I
    .end local v6    # "readerStr":Ljava/lang/String;
    .end local v7    # "ver":I
    .end local v8    # "writerLength":I
    .end local v9    # "writerStr":Ljava/lang/String;
    :catch_66
    move-exception v1

    .local v1, "e":Ljava/io/IOException;
    move-object v10, v11

    .line 235
    goto :goto_e
.end method
