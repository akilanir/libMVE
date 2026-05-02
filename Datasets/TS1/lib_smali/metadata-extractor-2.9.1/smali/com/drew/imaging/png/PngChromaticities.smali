.class public Lcom/drew/imaging/png/PngChromaticities;
.super Ljava/lang/Object;
.source "PngChromaticities.java"


# instance fields
.field private final _blueX:I

.field private final _blueY:I

.field private final _greenX:I

.field private final _greenY:I

.field private final _redX:I

.field private final _redY:I

.field private final _whitePointX:I

.field private final _whitePointY:I


# direct methods
.method public constructor <init>([B)V
    .registers 6
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
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    array-length v2, p1

    const/16 v3, 0x20

    if-eq v2, v3, :cond_10

    .line 45
    new-instance v2, Lcom/drew/imaging/png/PngProcessingException;

    const-string v3, "Invalid number of bytes"

    invoke-direct {v2, v3}, Lcom/drew/imaging/png/PngProcessingException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 48
    :cond_10
    new-instance v1, Lcom/drew/lang/SequentialByteArrayReader;

    invoke-direct {v1, p1}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    .line 50
    .local v1, "reader":Lcom/drew/lang/SequentialByteArrayReader;
    :try_start_15
    invoke-virtual {v1}, Lcom/drew/lang/SequentialByteArrayReader;->getInt32()I

    move-result v2

    iput v2, p0, Lcom/drew/imaging/png/PngChromaticities;->_whitePointX:I

    .line 51
    invoke-virtual {v1}, Lcom/drew/lang/SequentialByteArrayReader;->getInt32()I

    move-result v2

    iput v2, p0, Lcom/drew/imaging/png/PngChromaticities;->_whitePointY:I

    .line 52
    invoke-virtual {v1}, Lcom/drew/lang/SequentialByteArrayReader;->getInt32()I

    move-result v2

    iput v2, p0, Lcom/drew/imaging/png/PngChromaticities;->_redX:I

    .line 53
    invoke-virtual {v1}, Lcom/drew/lang/SequentialByteArrayReader;->getInt32()I

    move-result v2

    iput v2, p0, Lcom/drew/imaging/png/PngChromaticities;->_redY:I

    .line 54
    invoke-virtual {v1}, Lcom/drew/lang/SequentialByteArrayReader;->getInt32()I

    move-result v2

    iput v2, p0, Lcom/drew/imaging/png/PngChromaticities;->_greenX:I

    .line 55
    invoke-virtual {v1}, Lcom/drew/lang/SequentialByteArrayReader;->getInt32()I

    move-result v2

    iput v2, p0, Lcom/drew/imaging/png/PngChromaticities;->_greenY:I

    .line 56
    invoke-virtual {v1}, Lcom/drew/lang/SequentialByteArrayReader;->getInt32()I

    move-result v2

    iput v2, p0, Lcom/drew/imaging/png/PngChromaticities;->_blueX:I

    .line 57
    invoke-virtual {v1}, Lcom/drew/lang/SequentialByteArrayReader;->getInt32()I

    move-result v2

    iput v2, p0, Lcom/drew/imaging/png/PngChromaticities;->_blueY:I
    :try_end_45
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_45} :catch_46

    .line 61
    return-void

    .line 58
    :catch_46
    move-exception v0

    .line 59
    .local v0, "ex":Ljava/io/IOException;
    new-instance v2, Lcom/drew/imaging/png/PngProcessingException;

    invoke-direct {v2, v0}, Lcom/drew/imaging/png/PngProcessingException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public getBlueX()I
    .registers 2

    .prologue
    .line 95
    iget v0, p0, Lcom/drew/imaging/png/PngChromaticities;->_blueX:I

    return v0
.end method

.method public getBlueY()I
    .registers 2

    .prologue
    .line 100
    iget v0, p0, Lcom/drew/imaging/png/PngChromaticities;->_blueY:I

    return v0
.end method

.method public getGreenX()I
    .registers 2

    .prologue
    .line 85
    iget v0, p0, Lcom/drew/imaging/png/PngChromaticities;->_greenX:I

    return v0
.end method

.method public getGreenY()I
    .registers 2

    .prologue
    .line 90
    iget v0, p0, Lcom/drew/imaging/png/PngChromaticities;->_greenY:I

    return v0
.end method

.method public getRedX()I
    .registers 2

    .prologue
    .line 75
    iget v0, p0, Lcom/drew/imaging/png/PngChromaticities;->_redX:I

    return v0
.end method

.method public getRedY()I
    .registers 2

    .prologue
    .line 80
    iget v0, p0, Lcom/drew/imaging/png/PngChromaticities;->_redY:I

    return v0
.end method

.method public getWhitePointX()I
    .registers 2

    .prologue
    .line 65
    iget v0, p0, Lcom/drew/imaging/png/PngChromaticities;->_whitePointX:I

    return v0
.end method

.method public getWhitePointY()I
    .registers 2

    .prologue
    .line 70
    iget v0, p0, Lcom/drew/imaging/png/PngChromaticities;->_whitePointY:I

    return v0
.end method
