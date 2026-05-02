.class public Lcom/drew/metadata/xmp/XmpDescriptor;
.super Lcom/drew/metadata/TagDescriptor;
.source "XmpDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/drew/metadata/TagDescriptor",
        "<",
        "Lcom/drew/metadata/xmp/XmpDirectory;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/drew/metadata/xmp/XmpDirectory;)V
    .registers 2
    .param p1, "directory"    # Lcom/drew/metadata/xmp/XmpDirectory;
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
.method public getApertureValueDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 149
    iget-object v3, p0, Lcom/drew/metadata/xmp/XmpDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v3, Lcom/drew/metadata/xmp/XmpDirectory;

    const/16 v4, 0xb

    invoke-virtual {v3, v4}, Lcom/drew/metadata/xmp/XmpDirectory;->getDoubleObject(I)Ljava/lang/Double;

    move-result-object v2

    .line 150
    .local v2, "value":Ljava/lang/Double;
    if-nez v2, :cond_e

    .line 151
    const/4 v3, 0x0

    .line 153
    :goto_d
    return-object v3

    .line 152
    :cond_e
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/drew/imaging/PhotographicConversions;->apertureToFStop(D)D

    move-result-wide v0

    .line 153
    .local v0, "fStop":D
    invoke-static {v0, v1}, Lcom/drew/metadata/xmp/XmpDescriptor;->getFStopDescription(D)Ljava/lang/String;

    move-result-object v3

    goto :goto_d
.end method

.method public getDescription(I)Ljava/lang/String;
    .registers 3
    .param p1, "tagType"    # I

    .prologue
    .line 51
    packed-switch p1, :pswitch_data_38

    .line 73
    invoke-super {p0, p1}, Lcom/drew/metadata/TagDescriptor;->getDescription(I)Ljava/lang/String;

    move-result-object v0

    :goto_7
    return-object v0

    .line 54
    :pswitch_8
    iget-object v0, p0, Lcom/drew/metadata/xmp/XmpDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v0, Lcom/drew/metadata/xmp/XmpDirectory;

    invoke-virtual {v0, p1}, Lcom/drew/metadata/xmp/XmpDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 56
    :pswitch_11
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDescriptor;->getExposureTimeDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 58
    :pswitch_16
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDescriptor;->getExposureProgramDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 60
    :pswitch_1b
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDescriptor;->getShutterSpeedDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 62
    :pswitch_20
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDescriptor;->getFNumberDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 67
    :pswitch_25
    iget-object v0, p0, Lcom/drew/metadata/xmp/XmpDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v0, Lcom/drew/metadata/xmp/XmpDirectory;

    invoke-virtual {v0, p1}, Lcom/drew/metadata/xmp/XmpDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 69
    :pswitch_2e
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDescriptor;->getFocalLengthDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 71
    :pswitch_33
    invoke-virtual {p0}, Lcom/drew/metadata/xmp/XmpDescriptor;->getApertureValueDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    .line 51
    :pswitch_data_38
    .packed-switch 0x1
        :pswitch_8
        :pswitch_8
        :pswitch_11
        :pswitch_1b
        :pswitch_20
        :pswitch_25
        :pswitch_25
        :pswitch_25
        :pswitch_25
        :pswitch_2e
        :pswitch_33
        :pswitch_16
    .end packed-switch
.end method

.method public getExposureProgramDescription()Ljava/lang/String;
    .registers 6
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 91
    const/16 v0, 0xc

    const/16 v1, 0x8

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Manual control"

    aput-object v3, v1, v2

    const-string v2, "Program normal"

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-string v3, "Aperture priority"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Shutter priority"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Program creative (slow program)"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "Program action (high-speed program)"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "Portrait mode"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "Landscape mode"

    aput-object v3, v1, v2

    invoke-virtual {p0, v0, v4, v1}, Lcom/drew/metadata/xmp/XmpDescriptor;->getIndexedDescription(II[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExposureTimeDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 81
    iget-object v1, p0, Lcom/drew/metadata/xmp/XmpDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/xmp/XmpDirectory;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/drew/metadata/xmp/XmpDirectory;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_d

    .line 83
    const/4 v1, 0x0

    .line 84
    :goto_c
    return-object v1

    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " sec"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getFNumberDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 131
    iget-object v1, p0, Lcom/drew/metadata/xmp/XmpDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/xmp/XmpDirectory;

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Lcom/drew/metadata/xmp/XmpDirectory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 132
    .local v0, "value":Lcom/drew/lang/Rational;
    if-nez v0, :cond_d

    .line 133
    const/4 v1, 0x0

    .line 134
    :goto_c
    return-object v1

    :cond_d
    invoke-virtual {v0}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/drew/metadata/xmp/XmpDescriptor;->getFStopDescription(D)Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method

.method public getFocalLengthDescription()Ljava/lang/String;
    .registers 4
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 141
    iget-object v1, p0, Lcom/drew/metadata/xmp/XmpDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v1, Lcom/drew/metadata/xmp/XmpDirectory;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Lcom/drew/metadata/xmp/XmpDirectory;->getRational(I)Lcom/drew/lang/Rational;

    move-result-object v0

    .line 142
    .local v0, "value":Lcom/drew/lang/Rational;
    if-nez v0, :cond_e

    const/4 v1, 0x0

    :goto_d
    return-object v1

    :cond_e
    invoke-virtual {v0}, Lcom/drew/lang/Rational;->doubleValue()D

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/drew/metadata/xmp/XmpDescriptor;->getFocalLengthDescription(D)Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public getShutterSpeedDescription()Ljava/lang/String;
    .registers 12
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    const-wide/high16 v9, 0x4000000000000000L    # 2.0

    .line 109
    iget-object v5, p0, Lcom/drew/metadata/xmp/XmpDescriptor;->_directory:Lcom/drew/metadata/Directory;

    check-cast v5, Lcom/drew/metadata/xmp/XmpDirectory;

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Lcom/drew/metadata/xmp/XmpDirectory;->getFloatObject(I)Ljava/lang/Float;

    move-result-object v4

    .line 110
    .local v4, "value":Ljava/lang/Float;
    if-nez v4, :cond_f

    .line 111
    const/4 v5, 0x0

    .line 123
    :goto_e
    return-object v5

    .line 116
    :cond_f
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    cmpg-float v5, v5, v6

    if-gtz v5, :cond_4c

    .line 117
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v7

    float-to-double v7, v7

    invoke-static {v9, v10}, Ljava/lang/Math;->log(D)D

    move-result-wide v9

    mul-double/2addr v7, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->exp(D)D

    move-result-wide v7

    div-double/2addr v5, v7

    double-to-float v0, v5

    .line 118
    .local v0, "apexPower":F
    float-to-double v5, v0

    const-wide/high16 v7, 0x4024000000000000L    # 10.0

    mul-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->round(D)J

    move-result-wide v1

    .line 119
    .local v1, "apexPower10":J
    long-to-float v5, v1

    const/high16 v6, 0x41200000    # 10.0f

    div-float v3, v5, v6

    .line 120
    .local v3, "fApexPower":F
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " sec"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_e

    .line 122
    .end local v0    # "apexPower":F
    .end local v1    # "apexPower10":J
    .end local v3    # "fApexPower":F
    :cond_4c
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v5

    float-to-double v5, v5

    invoke-static {v9, v10}, Ljava/lang/Math;->log(D)D

    move-result-wide v7

    mul-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->exp(D)D

    move-result-wide v5

    double-to-int v0, v5

    .line 123
    .local v0, "apexPower":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "1/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " sec"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_e
.end method
