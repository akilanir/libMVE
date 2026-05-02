.class public Lcom/drew/imaging/png/PngHeader;
.super Ljava/lang/Object;
.source "PngHeader.java"


# instance fields
.field private _bitsPerSample:B

.field private _colorType:Lcom/drew/imaging/png/PngColorType;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field private _compressionType:B

.field private _filterMethod:B

.field private _imageHeight:I

.field private _imageWidth:I

.field private _interlaceMethod:B


# direct methods
.method public constructor <init>([B)V
    .registers 9
    .param p1, "bytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/imaging/png/PngProcessingException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    array-length v4, p1

    const/16 v5, 0xd

    if-eq v4, v5, :cond_10

    .line 46
    new-instance v4, Lcom/drew/imaging/png/PngProcessingException;

    const-string v5, "PNG header chunk must have 13 data bytes"

    invoke-direct {v4, v5}, Lcom/drew/imaging/png/PngProcessingException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 48
    :cond_10
    new-instance v3, Lcom/drew/lang/SequentialByteArrayReader;

    invoke-direct {v3, p1}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    .line 50
    .local v3, "reader":Lcom/drew/lang/SequentialReader;
    :try_start_15
    invoke-virtual {v3}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v4

    iput v4, p0, Lcom/drew/imaging/png/PngHeader;->_imageWidth:I

    .line 51
    invoke-virtual {v3}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v4

    iput v4, p0, Lcom/drew/imaging/png/PngHeader;->_imageHeight:I

    .line 52
    invoke-virtual {v3}, Lcom/drew/lang/SequentialReader;->getInt8()B

    move-result v4

    iput-byte v4, p0, Lcom/drew/imaging/png/PngHeader;->_bitsPerSample:B

    .line 53
    invoke-virtual {v3}, Lcom/drew/lang/SequentialReader;->getInt8()B

    move-result v1

    .line 54
    .local v1, "colorTypeNumber":B
    invoke-static {v1}, Lcom/drew/imaging/png/PngColorType;->fromNumericValue(I)Lcom/drew/imaging/png/PngColorType;

    move-result-object v0

    .line 55
    .local v0, "colorType":Lcom/drew/imaging/png/PngColorType;
    if-nez v0, :cond_51

    .line 56
    new-instance v4, Lcom/drew/imaging/png/PngProcessingException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected PNG color type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/drew/imaging/png/PngProcessingException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_4a} :catch_4a

    .line 62
    .end local v0    # "colorType":Lcom/drew/imaging/png/PngColorType;
    .end local v1    # "colorTypeNumber":B
    :catch_4a
    move-exception v2

    .line 64
    .local v2, "e":Ljava/io/IOException;
    new-instance v4, Lcom/drew/imaging/png/PngProcessingException;

    invoke-direct {v4, v2}, Lcom/drew/imaging/png/PngProcessingException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 58
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "colorType":Lcom/drew/imaging/png/PngColorType;
    .restart local v1    # "colorTypeNumber":B
    :cond_51
    :try_start_51
    iput-object v0, p0, Lcom/drew/imaging/png/PngHeader;->_colorType:Lcom/drew/imaging/png/PngColorType;

    .line 59
    invoke-virtual {v3}, Lcom/drew/lang/SequentialReader;->getInt8()B

    move-result v4

    iput-byte v4, p0, Lcom/drew/imaging/png/PngHeader;->_compressionType:B

    .line 60
    invoke-virtual {v3}, Lcom/drew/lang/SequentialReader;->getInt8()B

    move-result v4

    iput-byte v4, p0, Lcom/drew/imaging/png/PngHeader;->_filterMethod:B

    .line 61
    invoke-virtual {v3}, Lcom/drew/lang/SequentialReader;->getInt8()B

    move-result v4

    iput-byte v4, p0, Lcom/drew/imaging/png/PngHeader;->_interlaceMethod:B
    :try_end_65
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_65} :catch_4a

    .line 66
    return-void
.end method


# virtual methods
.method public getBitsPerSample()B
    .registers 2

    .prologue
    .line 80
    iget-byte v0, p0, Lcom/drew/imaging/png/PngHeader;->_bitsPerSample:B

    return v0
.end method

.method public getColorType()Lcom/drew/imaging/png/PngColorType;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 86
    iget-object v0, p0, Lcom/drew/imaging/png/PngHeader;->_colorType:Lcom/drew/imaging/png/PngColorType;

    return-object v0
.end method

.method public getCompressionType()B
    .registers 2

    .prologue
    .line 91
    iget-byte v0, p0, Lcom/drew/imaging/png/PngHeader;->_compressionType:B

    return v0
.end method

.method public getFilterMethod()B
    .registers 2

    .prologue
    .line 96
    iget-byte v0, p0, Lcom/drew/imaging/png/PngHeader;->_filterMethod:B

    return v0
.end method

.method public getImageHeight()I
    .registers 2

    .prologue
    .line 75
    iget v0, p0, Lcom/drew/imaging/png/PngHeader;->_imageHeight:I

    return v0
.end method

.method public getImageWidth()I
    .registers 2

    .prologue
    .line 70
    iget v0, p0, Lcom/drew/imaging/png/PngHeader;->_imageWidth:I

    return v0
.end method

.method public getInterlaceMethod()B
    .registers 2

    .prologue
    .line 101
    iget-byte v0, p0, Lcom/drew/imaging/png/PngHeader;->_interlaceMethod:B

    return v0
.end method
