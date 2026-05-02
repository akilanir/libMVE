.class public Lcom/drew/metadata/jpeg/JpegDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "JpegDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/jpeg/JpegDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/jpeg/JpegDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/jpeg/JpegDirectory;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/drew/metadata/TagDescriptor;-><init>(Lcom/drew/metadata/Directory;)V

    .line 41
    return-void
.end method


# virtual methods
.method public getComponentDataDescription(I)Ljava/lang/String;
    .registers 5
    .param p1, "componentNumber"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 122
    iget-object v1, p0, Lcom/drew/metadata/jpeg/JpegDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/jpeg/JpegDirectory;

    invoke-virtual {v1, p1}, Lcom/drew/metadata/jpeg/JpegDirectory;->getComponent(I)Lcom/drew/metadata/jpeg/JpegComponent;

    move-result-object v0

    .line 124
    .local v0, "value":Lcom/drew/metadata/jpeg/JpegComponent;
    if-nez v0, :cond_c

    .line 125
    const/4 v1, 0x0

    .line 127
    :goto_b
    return-object v1

    :cond_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/drew/metadata/jpeg/JpegComponent;->getComponentName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " component: Quantization table "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/drew/metadata/jpeg/JpegComponent;->getQuantizationTableNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Sampling factors "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/drew/metadata/jpeg/JpegComponent;->getHorizontalSamplingFactor()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " horiz/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/drew/metadata/jpeg/JpegComponent;->getVerticalSamplingFactor()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " vert"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public getDataPrecisionDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 113
    iget-object v1, p0, Lcom/drew/metadata/jpeg/JpegDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/jpeg/JpegDirectory;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/drew/metadata/jpeg/JpegDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 114
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_d

    .line 115
    const/4 v1, 0x0

    .line 116
    :goto_c
    return-object v1

    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bits"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 47
    packed-switch p1, :pswitch_data_34

    .line 66
    :pswitch_3
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 50
    :pswitch_8
    invoke-virtual {p0}, Lcom/drew/metadata/jpeg/JpegDescriptor;->getImageCompressionTypeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 52
    :pswitch_d
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/drew/metadata/jpeg/JpegDescriptor;->getComponentDataDescription(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 54
    :pswitch_13
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/drew/metadata/jpeg/JpegDescriptor;->getComponentDataDescription(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 56
    :pswitch_19
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/drew/metadata/jpeg/JpegDescriptor;->getComponentDataDescription(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 58
    :pswitch_1f
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/drew/metadata/jpeg/JpegDescriptor;->getComponentDataDescription(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 60
    :pswitch_25
    invoke-virtual {p0}, Lcom/drew/metadata/jpeg/JpegDescriptor;->getDataPrecisionDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 62
    :pswitch_2a
    invoke-virtual {p0}, Lcom/drew/metadata/jpeg/JpegDescriptor;->getImageHeightDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 64
    :pswitch_2f
    invoke-virtual {p0}, Lcom/drew/metadata/jpeg/JpegDescriptor;->getImageWidthDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 47
    :pswitch_data_34
    .packed-switch -0x3
        :pswitch_8
        :pswitch_3
        :pswitch_3
        :pswitch_25
        :pswitch_2a
        :pswitch_3
        :pswitch_2f
        :pswitch_3
        :pswitch_3
        :pswitch_d
        :pswitch_13
        :pswitch_19
        :pswitch_1f
    .end packed-switch
.end method

.method public getImageCompressionTypeDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 73
    const/4 v0, -0x3

    const/16 v1, 0x10

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Baseline"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Extended sequential, Huffman"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Progressive, Huffman"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Lossless, Huffman"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    aput-object v4, v1, v2

    const/4 v2, 0x5

    const-string v3, "Differential sequential, Huffman"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "Differential progressive, Huffman"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "Differential lossless, Huffman"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "Reserved for JPEG extensions"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "Extended sequential, arithmetic"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string v3, "Progressive, arithmetic"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    const-string v3, "Lossless, arithmetic"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    aput-object v4, v1, v2

    const/16 v2, 0xd

    const-string v3, "Differential sequential, arithmetic"

    aput-object v3, v1, v2

    const/16 v2, 0xe

    const-string v3, "Differential progressive, arithmetic"

    aput-object v3, v1, v2

    const/16 v2, 0xf

    const-string v3, "Differential lossless, arithmetic"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/drew/metadata/jpeg/JpegDescriptor;->getIndexedDescription(I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImageHeightDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 104
    iget-object v1, p0, Lcom/drew/metadata/jpeg/JpegDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/jpeg/JpegDirectory;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/drew/metadata/jpeg/JpegDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 105
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_d

    .line 106
    const/4 v1, 0x0

    .line 107
    :goto_c
    return-object v1

    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pixels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getImageWidthDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 95
    iget-object v1, p0, Lcom/drew/metadata/jpeg/JpegDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/jpeg/JpegDirectory;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/drew/metadata/jpeg/JpegDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 96
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_d

    .line 97
    const/4 v1, 0x0

    .line 98
    :goto_c
    return-object v1

    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " pixels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method
