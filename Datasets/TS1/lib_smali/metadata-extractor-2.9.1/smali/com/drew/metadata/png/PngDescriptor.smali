.class public Lcom/drew/metadata/png/PngDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "PngDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/png/PngDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/png/PngDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/png/PngDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 45
    return-void
.end method


# virtual methods
.method public getBackgroundColorDescription()Ljava/lang/String;
    .registers 10
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 154
    iget-object v4, p0, Lcom/drew/metadata/png/PngDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v4, Lcom/drew/metadata/png/PngDirectory;

    const/16 v6, 0xf

    invoke-virtual {v4, v6}, Lcom/drew/metadata/png/PngDirectory;->getByteArray(I)[B

    move-result-object v0

    .line 155
    .local v0, "bytes":[B
    iget-object v4, p0, Lcom/drew/metadata/png/PngDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v4, Lcom/drew/metadata/png/PngDirectory;

    const/4 v6, 0x4

    invoke-virtual {v4, v6}, Lcom/drew/metadata/png/PngDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 156
    .local v1, "colorType":Ljava/lang/Integer;
    if-eqz v0, :cond_18

    if-nez v1, :cond_1a

    :cond_18
    move-object v4, v5

    .line 175
    :goto_19
    return-object v4

    .line 159
    :cond_1a
    new-instance v3, Lcom/drew/lang/SequentialByteArrayReader;

    invoke-direct {v3, v0}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    .line 162
    .local v3, "reader":Lcom/drew/lang/SequentialReader;
    :try_start_1f
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    packed-switch v4, :pswitch_data_80

    :pswitch_26
    move-object v4, v5

    .line 175
    goto :goto_19

    .line 165
    :pswitch_28
    const-string v4, "Greyscale Level %d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v3}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_19

    .line 168
    :pswitch_3d
    const-string v4, "R %d, G %d, B %d"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v3}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-virtual {v3}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    invoke-virtual {v3}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_19

    .line 170
    :pswitch_68
    const-string v4, "Palette Index %d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v3}, Lcom/drew/lang/SequentialReader;->getUInt8()S

    move-result v8

    invoke-static {v8}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_7b
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_7b} :catch_7d

    move-result-object v4

    goto :goto_19

    .line 172
    :catch_7d
    move-exception v2

    .local v2, "ex":Ljava/io/IOException;
    move-object v4, v5

    .line 173
    goto :goto_19

    .line 162
    :pswitch_data_80
    .packed-switch 0x0
        :pswitch_28
        :pswitch_26
        :pswitch_3d
        :pswitch_68
        :pswitch_28
        :pswitch_26
        :pswitch_3d
    .end packed-switch
.end method

.method public getColorTypeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 78
    iget-object v2, p0, Lcom/drew/metadata/png/PngDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v2, Lcom/drew/metadata/png/PngDirectory;

    const/4 v4, 0x4

    invoke-virtual {v2, v4}, Lcom/drew/metadata/png/PngDirectory;->getInteger(I)Ljava/lang/Integer;

    move-result-object v1

    .line 79
    .local v1, "value":Ljava/lang/Integer;
    if-nez v1, :cond_e

    move-object v2, v3

    .line 84
    :goto_d
    return-object v2

    .line 81
    :cond_e
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lcom/drew/imaging/png/PngColorType;->fromNumericValue(I)Lcom/drew/imaging/png/PngColorType;

    move-result-object v0

    .line 82
    .local v0, "colorType":Lcom/drew/imaging/png/PngColorType;
    if-nez v0, :cond_1a

    move-object v2, v3

    .line 83
    goto :goto_d

    .line 84
    :cond_1a
    invoke-virtual {v0}, Lcom/drew/imaging/png/PngColorType;->getDescription()Ljava/lang/String;

    move-result-object v2

    goto :goto_d
.end method

.method public getCompressionTypeDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 90
    const/4 v0, 0x5

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Deflate"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/png/PngDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 51
    packed-switch p1, :pswitch_data_36

    .line 71
    :pswitch_3
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 53
    :pswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/png/PngDescriptor;->getColorTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 55
    :pswitch_d
    invoke-virtual {p0}, Lcom/drew/metadata/png/PngDescriptor;->getCompressionTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 57
    :pswitch_12
    invoke-virtual {p0}, Lcom/drew/metadata/png/PngDescriptor;->getFilterMethodDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 59
    :pswitch_17
    invoke-virtual {p0}, Lcom/drew/metadata/png/PngDescriptor;->getInterlaceMethodDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 61
    :pswitch_1c
    invoke-virtual {p0}, Lcom/drew/metadata/png/PngDescriptor;->getPaletteHasTransparencyDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 63
    :pswitch_21
    invoke-virtual {p0}, Lcom/drew/metadata/png/PngDescriptor;->getIsSrgbColorSpaceDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 65
    :pswitch_26
    invoke-virtual {p0}, Lcom/drew/metadata/png/PngDescriptor;->getTextualDataDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 67
    :pswitch_2b
    invoke-virtual {p0}, Lcom/drew/metadata/png/PngDescriptor;->getBackgroundColorDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 69
    :pswitch_30
    invoke-virtual {p0}, Lcom/drew/metadata/png/PngDescriptor;->getUnitSpecifierDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 51
    nop

    :pswitch_data_36
    .packed-switch 0x4
        :pswitch_8
        :pswitch_d
        :pswitch_12
        :pswitch_17
        :pswitch_3
        :pswitch_1c
        :pswitch_21
        :pswitch_3
        :pswitch_3
        :pswitch_26
        :pswitch_3
        :pswitch_2b
        :pswitch_3
        :pswitch_3
        :pswitch_30
    .end packed-switch
.end method

.method public getFilterMethodDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 96
    const/4 v0, 0x6

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Adaptive"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/png/PngDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInterlaceMethodDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 102
    const/4 v0, 0x7

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "No Interlace"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Adam7 Interlace"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/png/PngDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIsSrgbColorSpaceDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 114
    const/16 v0, 0xa

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Perceptual"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Relative Colorimetric"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Saturation"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Absolute Colorimetric"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/png/PngDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPaletteHasTransparencyDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 108
    const/16 v0, 0x9

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Yes"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/png/PngDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTextualDataDescription()Ljava/lang/String;
    .registers 10
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 136
    iget-object v5, p0, Lcom/drew/metadata/png/PngDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v5, Lcom/drew/metadata/png/PngDirectory;

    const/16 v6, 0xd

    invoke-virtual {v5, v6}, Lcom/drew/metadata/png/PngDirectory;->getObject(I)Ljava/lang/Object;

    move-result-object v3

    .line 137
    .local v3, "object":Ljava/lang/Object;
    if-nez v3, :cond_e

    .line 138
    const/4 v5, 0x0

    .line 148
    :goto_d
    return-object v5

    :cond_e
    move-object v2, v3

    .line 141
    check-cast v2, Ljava/util/List;

    .line 142
    .local v2, "keyValues":Ljava/util/List;, "Ljava/util/List<Lcom/drew/lang/KeyValuePair;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 143
    .local v4, "sb":Ljava/lang/StringBuilder;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/drew/lang/KeyValuePair;

    .line 144
    .local v1, "keyValue":Lcom/drew/lang/KeyValuePair;
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-eqz v5, :cond_31

    .line 145
    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 146
    :cond_31
    const-string v5, "%s: %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v1}, Lcom/drew/lang/KeyValuePair;->getKey()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-virtual {v1}, Lcom/drew/lang/KeyValuePair;->getValue()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1a

    .line 148
    .end local v1    # "keyValue":Lcom/drew/lang/KeyValuePair;
    :cond_4c
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_d
.end method

.method public getUnitSpecifierDescription()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 126
    const/16 v0, 0x12

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Unspecified"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Metres"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/png/PngDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
