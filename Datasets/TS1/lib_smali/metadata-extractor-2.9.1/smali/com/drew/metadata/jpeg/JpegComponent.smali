.class public Lcom/drew/metadata/jpeg/JpegComponent;
.super Ljava/lang/Object;
.source "JpegComponent.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0xd92575d14ce7caL


# instance fields
.field private final _componentId:I

.field private final _quantizationTableNumber:I

.field private final _samplingFactorByte:I


# direct methods
.method public constructor <init>(III)V
    .registers 4
    .param p1, "componentId"    # I
    .param p2, "samplingFactorByte"    # I
    .param p3, "quantizationTableNumber"    # I

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput p1, p0, Lcom/drew/metadata/jpeg/JpegComponent;->_componentId:I

    .line 44
    iput p2, p0, Lcom/drew/metadata/jpeg/JpegComponent;->_samplingFactorByte:I

    .line 45
    iput p3, p0, Lcom/drew/metadata/jpeg/JpegComponent;->_quantizationTableNumber:I

    .line 46
    return-void
.end method


# virtual methods
.method public getComponentId()I
    .registers 2

    .prologue
    .line 50
    iget v0, p0, Lcom/drew/metadata/jpeg/JpegComponent;->_componentId:I

    return v0
.end method

.method public getComponentName()Ljava/lang/String;
    .registers 5
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 60
    iget v0, p0, Lcom/drew/metadata/jpeg/JpegComponent;->_componentId:I

    packed-switch v0, :pswitch_data_28

    .line 73
    const-string v0, "Unknown (%s)"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/drew/metadata/jpeg/JpegComponent;->_componentId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_17
    return-object v0

    .line 63
    :pswitch_18
    const-string v0, "Y"

    goto :goto_17

    .line 65
    :pswitch_1b
    const-string v0, "Cb"

    goto :goto_17

    .line 67
    :pswitch_1e
    const-string v0, "Cr"

    goto :goto_17

    .line 69
    :pswitch_21
    const-string v0, "I"

    goto :goto_17

    .line 71
    :pswitch_24
    const-string v0, "Q"

    goto :goto_17

    .line 60
    nop

    :pswitch_data_28
    .packed-switch 0x1
        :pswitch_18
        :pswitch_1b
        :pswitch_1e
        :pswitch_21
        :pswitch_24
    .end packed-switch
.end method

.method public getHorizontalSamplingFactor()I
    .registers 2

    .prologue
    .line 84
    iget v0, p0, Lcom/drew/metadata/jpeg/JpegComponent;->_samplingFactorByte:I

    shr-int/lit8 v0, v0, 0x4

    and-int/lit8 v0, v0, 0xf

    return v0
.end method

.method public getQuantizationTableNumber()I
    .registers 2

    .prologue
    .line 79
    iget v0, p0, Lcom/drew/metadata/jpeg/JpegComponent;->_quantizationTableNumber:I

    return v0
.end method

.method public getVerticalSamplingFactor()I
    .registers 2

    .prologue
    .line 89
    iget v0, p0, Lcom/drew/metadata/jpeg/JpegComponent;->_samplingFactorByte:I

    and-int/lit8 v0, v0, 0xf

    return v0
.end method
