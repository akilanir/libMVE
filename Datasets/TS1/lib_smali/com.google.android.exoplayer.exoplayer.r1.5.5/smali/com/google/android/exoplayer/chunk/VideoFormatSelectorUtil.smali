.class public final Lcom/google/android/exoplayer/chunk/VideoFormatSelectorUtil;
.super Ljava/lang/Object;
.source "VideoFormatSelectorUtil.java"


# static fields
.field private static final FRACTION_TO_CONSIDER_FULLSCREEN:F = 0.98f


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getDisplaySize(Landroid/view/Display;)Landroid/graphics/Point;
    .registers 4
    .param p0, "display"    # Landroid/view/Display;

    .prologue
    .line 214
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 215
    .local v0, "displaySize":Landroid/graphics/Point;
    sget v1, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_f

    .line 216
    invoke-static {p0, v0}, Lcom/google/android/exoplayer/chunk/VideoFormatSelectorUtil;->getDisplaySizeV23(Landroid/view/Display;Landroid/graphics/Point;)V

    .line 224
    :goto_e
    return-object v0

    .line 217
    :cond_f
    sget v1, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_19

    .line 218
    invoke-static {p0, v0}, Lcom/google/android/exoplayer/chunk/VideoFormatSelectorUtil;->getDisplaySizeV17(Landroid/view/Display;Landroid/graphics/Point;)V

    goto :goto_e

    .line 219
    :cond_19
    sget v1, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_23

    .line 220
    invoke-static {p0, v0}, Lcom/google/android/exoplayer/chunk/VideoFormatSelectorUtil;->getDisplaySizeV16(Landroid/view/Display;Landroid/graphics/Point;)V

    goto :goto_e

    .line 222
    :cond_23
    invoke-static {p0, v0}, Lcom/google/android/exoplayer/chunk/VideoFormatSelectorUtil;->getDisplaySizeV9(Landroid/view/Display;Landroid/graphics/Point;)V

    goto :goto_e
.end method

.method private static getDisplaySizeV16(Landroid/view/Display;Landroid/graphics/Point;)V
    .registers 2
    .param p0, "display"    # Landroid/view/Display;
    .param p1, "outSize"    # Landroid/graphics/Point;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 241
    invoke-virtual {p0, p1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 242
    return-void
.end method

.method private static getDisplaySizeV17(Landroid/view/Display;Landroid/graphics/Point;)V
    .registers 2
    .param p0, "display"    # Landroid/view/Display;
    .param p1, "outSize"    # Landroid/graphics/Point;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 236
    invoke-virtual {p0, p1}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 237
    return-void
.end method

.method private static getDisplaySizeV23(Landroid/view/Display;Landroid/graphics/Point;)V
    .registers 4
    .param p0, "display"    # Landroid/view/Display;
    .param p1, "outSize"    # Landroid/graphics/Point;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .prologue
    .line 229
    invoke-virtual {p0}, Landroid/view/Display;->getMode()Landroid/view/Display$Mode;

    move-result-object v0

    .line 230
    .local v0, "mode":Landroid/view/Display$Mode;
    invoke-virtual {v0}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v1

    iput v1, p1, Landroid/graphics/Point;->x:I

    .line 231
    invoke-virtual {v0}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result v1

    iput v1, p1, Landroid/graphics/Point;->y:I

    .line 232
    return-void
.end method

.method private static getDisplaySizeV9(Landroid/view/Display;Landroid/graphics/Point;)V
    .registers 3
    .param p0, "display"    # Landroid/view/Display;
    .param p1, "outSize"    # Landroid/graphics/Point;

    .prologue
    .line 246
    invoke-virtual {p0}, Landroid/view/Display;->getWidth()I

    move-result v0

    iput v0, p1, Landroid/graphics/Point;->x:I

    .line 247
    invoke-virtual {p0}, Landroid/view/Display;->getHeight()I

    move-result v0

    iput v0, p1, Landroid/graphics/Point;->y:I

    .line 248
    return-void
.end method

.method private static getMaxVideoSizeInViewport(ZIIII)Landroid/graphics/Point;
    .registers 9
    .param p0, "orientationMayChange"    # Z
    .param p1, "viewportWidth"    # I
    .param p2, "viewportHeight"    # I
    .param p3, "videoWidth"    # I
    .param p4, "videoHeight"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 184
    if-eqz p0, :cond_e

    if-le p3, p4, :cond_20

    move v3, v1

    :goto_7
    if-le p1, p2, :cond_22

    :goto_9
    if-eq v3, v1, :cond_e

    .line 186
    move v0, p1

    .line 187
    .local v0, "tempViewportWidth":I
    move p1, p2

    .line 188
    move p2, v0

    .line 191
    .end local v0    # "tempViewportWidth":I
    :cond_e
    mul-int v1, p3, p2

    mul-int v2, p4, p1

    if-lt v1, v2, :cond_24

    .line 193
    new-instance v1, Landroid/graphics/Point;

    mul-int v2, p1, p4

    invoke-static {v2, p3}, Lcom/google/android/exoplayer/util/Util;->ceilDivide(II)I

    move-result v2

    invoke-direct {v1, p1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 196
    :goto_1f
    return-object v1

    :cond_20
    move v3, v2

    .line 184
    goto :goto_7

    :cond_22
    move v1, v2

    goto :goto_9

    .line 196
    :cond_24
    new-instance v1, Landroid/graphics/Point;

    mul-int v2, p2, p3

    invoke-static {v2, p4}, Lcom/google/android/exoplayer/util/Util;->ceilDivide(II)I

    move-result v2

    invoke-direct {v1, v2, p2}, Landroid/graphics/Point;-><init>(II)V

    goto :goto_1f
.end method

.method private static getViewportSize(Landroid/content/Context;)Landroid/graphics/Point;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 204
    sget v1, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v2, 0x17

    if-ge v1, v2, :cond_2a

    sget-object v1, Lcom/google/android/exoplayer/util/Util;->MODEL:Ljava/lang/String;

    if-eqz v1, :cond_2a

    sget-object v1, Lcom/google/android/exoplayer/util/Util;->MODEL:Ljava/lang/String;

    const-string v2, "BRAVIA"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2a

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v2, "com.sony.dtv.hardware.panel.qfhd"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 206
    new-instance v1, Landroid/graphics/Point;

    const/16 v2, 0xf00

    const/16 v3, 0x870

    invoke-direct {v1, v2, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 210
    :goto_29
    return-object v1

    .line 209
    :cond_2a
    const-string v1, "window"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 210
    .local v0, "windowManager":Landroid/view/WindowManager;
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/exoplayer/chunk/VideoFormatSelectorUtil;->getDisplaySize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object v1

    goto :goto_29
.end method

.method private static isFormatPlayable(Lcom/google/android/exoplayer/chunk/Format;[Ljava/lang/String;ZI)Z
    .registers 10
    .param p0, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p1, "allowedContainerMimeTypes"    # [Ljava/lang/String;
    .param p2, "filterHdFormats"    # Z
    .param p3, "maxDecodableFrameSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 145
    if-eqz p1, :cond_c

    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/Format;->mimeType:Ljava/lang/String;

    invoke-static {p1, v2}, Lcom/google/android/exoplayer/util/Util;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 175
    :cond_b
    :goto_b
    return v1

    .line 150
    :cond_c
    if-eqz p2, :cond_1a

    iget v2, p0, Lcom/google/android/exoplayer/chunk/Format;->width:I

    const/16 v3, 0x500

    if-ge v2, v3, :cond_b

    iget v2, p0, Lcom/google/android/exoplayer/chunk/Format;->height:I

    const/16 v3, 0x2d0

    if-ge v2, v3, :cond_b

    .line 154
    :cond_1a
    iget v2, p0, Lcom/google/android/exoplayer/chunk/Format;->width:I

    if-lez v2, :cond_5b

    iget v2, p0, Lcom/google/android/exoplayer/chunk/Format;->height:I

    if-lez v2, :cond_5b

    .line 155
    sget v2, Lcom/google/android/exoplayer/util/Util;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_54

    .line 156
    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/Format;->codecs:Ljava/lang/String;

    invoke-static {v2}, Lcom/google/android/exoplayer/util/MimeTypes;->getVideoMediaMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 157
    .local v0, "videoMediaMimeType":Ljava/lang/String;
    const-string v2, "video/x-unknown"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_38

    .line 159
    const-string v0, "video/avc"

    .line 161
    :cond_38
    iget v2, p0, Lcom/google/android/exoplayer/chunk/Format;->frameRate:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_4b

    .line 162
    iget v2, p0, Lcom/google/android/exoplayer/chunk/Format;->width:I

    iget v3, p0, Lcom/google/android/exoplayer/chunk/Format;->height:I

    iget v4, p0, Lcom/google/android/exoplayer/chunk/Format;->frameRate:F

    float-to-double v4, v4

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer/MediaCodecUtil;->isSizeAndRateSupportedV21(Ljava/lang/String;ZIID)Z

    move-result v1

    goto :goto_b

    .line 165
    :cond_4b
    iget v2, p0, Lcom/google/android/exoplayer/chunk/Format;->width:I

    iget v3, p0, Lcom/google/android/exoplayer/chunk/Format;->height:I

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/exoplayer/MediaCodecUtil;->isSizeSupportedV21(Ljava/lang/String;ZII)Z

    move-result v1

    goto :goto_b

    .line 170
    .end local v0    # "videoMediaMimeType":Ljava/lang/String;
    :cond_54
    iget v2, p0, Lcom/google/android/exoplayer/chunk/Format;->width:I

    iget v3, p0, Lcom/google/android/exoplayer/chunk/Format;->height:I

    mul-int/2addr v2, v3

    if-gt v2, p3, :cond_b

    .line 175
    :cond_5b
    const/4 v1, 0x1

    goto :goto_b
.end method

.method public static selectVideoFormats(Ljava/util/List;[Ljava/lang/String;ZZII)[I
    .registers 20
    .param p1, "allowedContainerMimeTypes"    # [Ljava/lang/String;
    .param p2, "filterHdFormats"    # Z
    .param p3, "orientationMayChange"    # Z
    .param p4, "viewportWidth"    # I
    .param p5, "viewportHeight"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/exoplayer/chunk/FormatWrapper;",
            ">;[",
            "Ljava/lang/String;",
            "ZZII)[I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "formatWrappers":Ljava/util/List;, "Ljava/util/List<+Lcom/google/android/exoplayer/chunk/FormatWrapper;>;"
    const v7, 0x7fffffff

    .line 96
    .local v7, "maxVideoPixelsToRetain":I
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .local v9, "selectedIndexList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {}, Lcom/google/android/exoplayer/MediaCodecUtil;->maxH264DecodableFrameSize()I

    move-result v6

    .line 100
    .local v6, "maxDecodableFrameSize":I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    .line 101
    .local v4, "formatWrapperCount":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_11
    if-ge v5, v4, :cond_6a

    .line 102
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/android/exoplayer/chunk/FormatWrapper;

    invoke-interface {v11}, Lcom/google/android/exoplayer/chunk/FormatWrapper;->getFormat()Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v3

    .line 103
    .local v3, "format":Lcom/google/android/exoplayer/chunk/Format;
    move/from16 v0, p2

    invoke-static {v3, p1, v0, v6}, Lcom/google/android/exoplayer/chunk/VideoFormatSelectorUtil;->isFormatPlayable(Lcom/google/android/exoplayer/chunk/Format;[Ljava/lang/String;ZI)Z

    move-result v11

    if-eqz v11, :cond_67

    .line 106
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    iget v11, v3, Lcom/google/android/exoplayer/chunk/Format;->width:I

    if-lez v11, :cond_67

    iget v11, v3, Lcom/google/android/exoplayer/chunk/Format;->height:I

    if-lez v11, :cond_67

    if-lez p4, :cond_67

    if-lez p5, :cond_67

    .line 111
    iget v11, v3, Lcom/google/android/exoplayer/chunk/Format;->width:I

    iget v12, v3, Lcom/google/android/exoplayer/chunk/Format;->height:I

    move/from16 v0, p3

    move/from16 v1, p4

    move/from16 v2, p5

    invoke-static {v0, v1, v2, v11, v12}, Lcom/google/android/exoplayer/chunk/VideoFormatSelectorUtil;->getMaxVideoSizeInViewport(ZIIII)Landroid/graphics/Point;

    move-result-object v8

    .line 113
    .local v8, "maxVideoSizeInViewport":Landroid/graphics/Point;
    iget v11, v3, Lcom/google/android/exoplayer/chunk/Format;->width:I

    iget v12, v3, Lcom/google/android/exoplayer/chunk/Format;->height:I

    mul-int v10, v11, v12

    .line 114
    .local v10, "videoPixels":I
    iget v11, v3, Lcom/google/android/exoplayer/chunk/Format;->width:I

    iget v12, v8, Landroid/graphics/Point;->x:I

    int-to-float v12, v12

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v12, v13

    float-to-int v12, v12

    if-lt v11, v12, :cond_67

    iget v11, v3, Lcom/google/android/exoplayer/chunk/Format;->height:I

    iget v12, v8, Landroid/graphics/Point;->y:I

    int-to-float v12, v12

    const v13, 0x3f7ae148    # 0.98f

    mul-float/2addr v12, v13

    float-to-int v12, v12

    if-lt v11, v12, :cond_67

    if-ge v10, v7, :cond_67

    .line 117
    move v7, v10

    .line 101
    .end local v8    # "maxVideoSizeInViewport":Landroid/graphics/Point;
    .end local v10    # "videoPixels":I
    :cond_67
    add-int/lit8 v5, v5, 0x1

    goto :goto_11

    .line 126
    .end local v3    # "format":Lcom/google/android/exoplayer/chunk/Format;
    :cond_6a
    const v11, 0x7fffffff

    if-eq v7, v11, :cond_a0

    .line 127
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v11

    add-int/lit8 v5, v11, -0x1

    :goto_75
    if-ltz v5, :cond_a0

    .line 128
    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    invoke-interface {p0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/android/exoplayer/chunk/FormatWrapper;

    invoke-interface {v11}, Lcom/google/android/exoplayer/chunk/FormatWrapper;->getFormat()Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v3

    .line 129
    .restart local v3    # "format":Lcom/google/android/exoplayer/chunk/Format;
    iget v11, v3, Lcom/google/android/exoplayer/chunk/Format;->width:I

    if-lez v11, :cond_9d

    iget v11, v3, Lcom/google/android/exoplayer/chunk/Format;->height:I

    if-lez v11, :cond_9d

    iget v11, v3, Lcom/google/android/exoplayer/chunk/Format;->width:I

    iget v12, v3, Lcom/google/android/exoplayer/chunk/Format;->height:I

    mul-int/2addr v11, v12

    if-le v11, v7, :cond_9d

    .line 131
    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 127
    :cond_9d
    add-int/lit8 v5, v5, -0x1

    goto :goto_75

    .line 136
    .end local v3    # "format":Lcom/google/android/exoplayer/chunk/Format;
    :cond_a0
    invoke-static {v9}, Lcom/google/android/exoplayer/util/Util;->toArray(Ljava/util/List;)[I

    move-result-object v11

    return-object v11
.end method

.method public static selectVideoFormatsForDefaultDisplay(Landroid/content/Context;Ljava/util/List;[Ljava/lang/String;Z)[I
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
    .param p2, "allowedContainerMimeTypes"    # [Ljava/lang/String;
    .param p3, "filterHdFormats"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/exoplayer/chunk/FormatWrapper;",
            ">;[",
            "Ljava/lang/String;",
            "Z)[I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 59
    .local p1, "formatWrappers":Ljava/util/List;, "Ljava/util/List<+Lcom/google/android/exoplayer/chunk/FormatWrapper;>;"
    invoke-static {p0}, Lcom/google/android/exoplayer/chunk/VideoFormatSelectorUtil;->getViewportSize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v6

    .line 60
    .local v6, "viewportSize":Landroid/graphics/Point;
    const/4 v3, 0x1

    iget v4, v6, Landroid/graphics/Point;->x:I

    iget v5, v6, Landroid/graphics/Point;->y:I

    move-object v0, p1

    move-object v1, p2

    move v2, p3

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer/chunk/VideoFormatSelectorUtil;->selectVideoFormats(Ljava/util/List;[Ljava/lang/String;ZZII)[I

    move-result-object v0

    return-object v0
.end method
