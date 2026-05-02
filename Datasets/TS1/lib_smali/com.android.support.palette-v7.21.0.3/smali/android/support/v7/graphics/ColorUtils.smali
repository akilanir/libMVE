.class final Landroid/support/v7/graphics/ColorUtils;
.super Ljava/lang/Object;
.source "ColorUtils.java"


# static fields
.field private static final MIN_ALPHA_SEARCH_MAX_ITERATIONS:I = 0xa

.field private static final MIN_ALPHA_SEARCH_PRECISION:I = 0xa


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static HSLtoRGB([F)I
    .registers 14
    .param p0, "hsl"    # [F

    .prologue
    .line 181
    const/4 v10, 0x0

    aget v3, p0, v10

    .line 182
    .local v3, "h":F
    const/4 v10, 0x1

    aget v8, p0, v10

    .line 183
    .local v8, "s":F
    const/4 v10, 0x2

    aget v5, p0, v10

    .line 185
    .local v5, "l":F
    const/high16 v10, 0x3f800000    # 1.0f

    const/high16 v11, 0x40000000    # 2.0f

    mul-float/2addr v11, v5

    const/high16 v12, 0x3f800000    # 1.0f

    sub-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    sub-float/2addr v10, v11

    mul-float v1, v10, v8

    .line 186
    .local v1, "c":F
    const/high16 v10, 0x3f000000    # 0.5f

    mul-float/2addr v10, v1

    sub-float v6, v5, v10

    .line 187
    .local v6, "m":F
    const/high16 v10, 0x3f800000    # 1.0f

    const/high16 v11, 0x42700000    # 60.0f

    div-float v11, v3, v11

    const/high16 v12, 0x40000000    # 2.0f

    rem-float/2addr v11, v12

    const/high16 v12, 0x3f800000    # 1.0f

    sub-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    sub-float/2addr v10, v11

    mul-float v9, v1, v10

    .line 189
    .local v9, "x":F
    float-to-int v10, v3

    div-int/lit8 v4, v10, 0x3c

    .line 191
    .local v4, "hueSegment":I
    const/4 v7, 0x0

    .local v7, "r":I
    const/4 v2, 0x0

    .local v2, "g":I
    const/4 v0, 0x0

    .line 193
    .local v0, "b":I
    packed-switch v4, :pswitch_data_fe

    .line 227
    :goto_39
    const/4 v10, 0x0

    const/16 v11, 0xff

    invoke-static {v11, v7}, Ljava/lang/Math;->min(II)I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 228
    const/4 v10, 0x0

    const/16 v11, 0xff

    invoke-static {v11, v2}, Ljava/lang/Math;->min(II)I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 229
    const/4 v10, 0x0

    const/16 v11, 0xff

    invoke-static {v11, v0}, Ljava/lang/Math;->min(II)I

    move-result v11

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 231
    invoke-static {v7, v2, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v10

    return v10

    .line 195
    :pswitch_5f
    const/high16 v10, 0x437f0000    # 255.0f

    add-float v11, v1, v6

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 196
    const/high16 v10, 0x437f0000    # 255.0f

    add-float v11, v9, v6

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 197
    const/high16 v10, 0x437f0000    # 255.0f

    mul-float/2addr v10, v6

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 198
    goto :goto_39

    .line 200
    :pswitch_79
    const/high16 v10, 0x437f0000    # 255.0f

    add-float v11, v9, v6

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 201
    const/high16 v10, 0x437f0000    # 255.0f

    add-float v11, v1, v6

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 202
    const/high16 v10, 0x437f0000    # 255.0f

    mul-float/2addr v10, v6

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 203
    goto :goto_39

    .line 205
    :pswitch_93
    const/high16 v10, 0x437f0000    # 255.0f

    mul-float/2addr v10, v6

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 206
    const/high16 v10, 0x437f0000    # 255.0f

    add-float v11, v1, v6

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 207
    const/high16 v10, 0x437f0000    # 255.0f

    add-float v11, v9, v6

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 208
    goto :goto_39

    .line 210
    :pswitch_ad
    const/high16 v10, 0x437f0000    # 255.0f

    mul-float/2addr v10, v6

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 211
    const/high16 v10, 0x437f0000    # 255.0f

    add-float v11, v9, v6

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 212
    const/high16 v10, 0x437f0000    # 255.0f

    add-float v11, v1, v6

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 213
    goto/16 :goto_39

    .line 215
    :pswitch_c8
    const/high16 v10, 0x437f0000    # 255.0f

    add-float v11, v9, v6

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 216
    const/high16 v10, 0x437f0000    # 255.0f

    mul-float/2addr v10, v6

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 217
    const/high16 v10, 0x437f0000    # 255.0f

    add-float v11, v1, v6

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 218
    goto/16 :goto_39

    .line 221
    :pswitch_e3
    const/high16 v10, 0x437f0000    # 255.0f

    add-float v11, v1, v6

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 222
    const/high16 v10, 0x437f0000    # 255.0f

    mul-float/2addr v10, v6

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 223
    const/high16 v10, 0x437f0000    # 255.0f

    add-float v11, v9, v6

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v0

    goto/16 :goto_39

    .line 193
    :pswitch_data_fe
    .packed-switch 0x0
        :pswitch_5f
        :pswitch_79
        :pswitch_93
        :pswitch_ad
        :pswitch_c8
        :pswitch_e3
        :pswitch_e3
    .end packed-switch
.end method

.method static RGBtoHSL(III[F)V
    .registers 16
    .param p0, "r"    # I
    .param p1, "g"    # I
    .param p2, "b"    # I
    .param p3, "hsl"    # [F

    .prologue
    .line 149
    int-to-float v9, p0

    const/high16 v10, 0x437f0000    # 255.0f

    div-float v7, v9, v10

    .line 150
    .local v7, "rf":F
    int-to-float v9, p1

    const/high16 v10, 0x437f0000    # 255.0f

    div-float v2, v9, v10

    .line 151
    .local v2, "gf":F
    int-to-float v9, p2

    const/high16 v10, 0x437f0000    # 255.0f

    div-float v0, v9, v10

    .line 153
    .local v0, "bf":F
    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v9

    invoke-static {v7, v9}, Ljava/lang/Math;->max(FF)F

    move-result v5

    .line 154
    .local v5, "max":F
    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v9

    invoke-static {v7, v9}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .line 155
    .local v6, "min":F
    sub-float v1, v5, v6

    .line 158
    .local v1, "deltaMaxMin":F
    add-float v9, v5, v6

    const/high16 v10, 0x40000000    # 2.0f

    div-float v4, v9, v10

    .line 160
    .local v4, "l":F
    cmpl-float v9, v5, v6

    if-nez v9, :cond_3d

    .line 162
    const/4 v8, 0x0

    .local v8, "s":F
    move v3, v8

    .line 175
    .local v3, "h":F
    :goto_2d
    const/4 v9, 0x0

    const/high16 v10, 0x42700000    # 60.0f

    mul-float/2addr v10, v3

    const/high16 v11, 0x43b40000    # 360.0f

    rem-float/2addr v10, v11

    aput v10, p3, v9

    .line 176
    const/4 v9, 0x1

    aput v8, p3, v9

    .line 177
    const/4 v9, 0x2

    aput v4, p3, v9

    .line 178
    return-void

    .line 164
    .end local v3    # "h":F
    .end local v8    # "s":F
    :cond_3d
    cmpl-float v9, v5, v7

    if-nez v9, :cond_58

    .line 165
    sub-float v9, v2, v0

    div-float/2addr v9, v1

    const/high16 v10, 0x40c00000    # 6.0f

    rem-float v3, v9, v10

    .line 172
    .restart local v3    # "h":F
    :goto_48
    const/high16 v9, 0x3f800000    # 1.0f

    const/high16 v10, 0x40000000    # 2.0f

    mul-float/2addr v10, v4

    const/high16 v11, 0x3f800000    # 1.0f

    sub-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    sub-float/2addr v9, v10

    div-float v8, v1, v9

    .restart local v8    # "s":F
    goto :goto_2d

    .line 166
    .end local v3    # "h":F
    .end local v8    # "s":F
    :cond_58
    cmpl-float v9, v5, v2

    if-nez v9, :cond_64

    .line 167
    sub-float v9, v0, v7

    div-float/2addr v9, v1

    const/high16 v10, 0x40000000    # 2.0f

    add-float v3, v9, v10

    .restart local v3    # "h":F
    goto :goto_48

    .line 169
    .end local v3    # "h":F
    :cond_64
    sub-float v9, v7, v2

    div-float/2addr v9, v1

    const/high16 v10, 0x40800000    # 4.0f

    add-float v3, v9, v10

    .restart local v3    # "h":F
    goto :goto_48
.end method

.method private static calculateContrast(II)D
    .registers 10
    .param p0, "foreground"    # I
    .param p1, "background"    # I

    .prologue
    const/16 v5, 0xff

    const-wide v6, 0x3fa999999999999aL    # 0.05

    .line 67
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    if-eq v4, v5, :cond_15

    .line 68
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "background can not be translucent"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 70
    :cond_15
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    if-ge v4, v5, :cond_1f

    .line 72
    invoke-static {p0, p1}, Landroid/support/v7/graphics/ColorUtils;->compositeColors(II)I

    move-result p0

    .line 75
    :cond_1f
    invoke-static {p0}, Landroid/support/v7/graphics/ColorUtils;->calculateLuminance(I)D

    move-result-wide v4

    add-double v0, v4, v6

    .line 76
    .local v0, "luminance1":D
    invoke-static {p1}, Landroid/support/v7/graphics/ColorUtils;->calculateLuminance(I)D

    move-result-wide v4

    add-double v2, v4, v6

    .line 79
    .local v2, "luminance2":D
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    div-double/2addr v4, v6

    return-wide v4
.end method

.method private static calculateLuminance(I)D
    .registers 11
    .param p0, "color"    # I

    .prologue
    .line 49
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v6

    int-to-double v6, v6

    const-wide v8, 0x406fe00000000000L    # 255.0

    div-double v4, v6, v8

    .line 50
    .local v4, "red":D
    const-wide v6, 0x3fa41c8216c61523L    # 0.03928

    cmpg-double v6, v4, v6

    if-gez v6, :cond_66

    const-wide v6, 0x4029d70a3d70a3d7L    # 12.92

    div-double/2addr v4, v6

    .line 52
    :goto_1b
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v6

    int-to-double v6, v6

    const-wide v8, 0x406fe00000000000L    # 255.0

    div-double v2, v6, v8

    .line 53
    .local v2, "green":D
    const-wide v6, 0x3fa41c8216c61523L    # 0.03928

    cmpg-double v6, v2, v6

    if-gez v6, :cond_7c

    const-wide v6, 0x4029d70a3d70a3d7L    # 12.92

    div-double/2addr v2, v6

    .line 55
    :goto_36
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v6

    int-to-double v6, v6

    const-wide v8, 0x406fe00000000000L    # 255.0

    div-double v0, v6, v8

    .line 56
    .local v0, "blue":D
    const-wide v6, 0x3fa41c8216c61523L    # 0.03928

    cmpg-double v6, v0, v6

    if-gez v6, :cond_92

    const-wide v6, 0x4029d70a3d70a3d7L    # 12.92

    div-double/2addr v0, v6

    .line 58
    :goto_51
    const-wide v6, 0x3fcb367a0f9096bcL    # 0.2126

    mul-double/2addr v6, v4

    const-wide v8, 0x3fe6e2eb1c432ca5L    # 0.7152

    mul-double/2addr v8, v2

    add-double/2addr v6, v8

    const-wide v8, 0x3fb27bb2fec56d5dL    # 0.0722

    mul-double/2addr v8, v0

    add-double/2addr v6, v8

    return-wide v6

    .line 50
    .end local v0    # "blue":D
    .end local v2    # "green":D
    :cond_66
    const-wide v6, 0x3fac28f5c28f5c29L    # 0.055

    add-double/2addr v6, v4

    const-wide v8, 0x3ff0e147ae147ae1L    # 1.055

    div-double/2addr v6, v8

    const-wide v8, 0x4003333333333333L    # 2.4

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    goto :goto_1b

    .line 53
    .restart local v2    # "green":D
    :cond_7c
    const-wide v6, 0x3fac28f5c28f5c29L    # 0.055

    add-double/2addr v6, v2

    const-wide v8, 0x3ff0e147ae147ae1L    # 1.055

    div-double/2addr v6, v8

    const-wide v8, 0x4003333333333333L    # 2.4

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    goto :goto_36

    .line 56
    .restart local v0    # "blue":D
    :cond_92
    const-wide v6, 0x3fac28f5c28f5c29L    # 0.055

    add-double/2addr v6, v0

    const-wide v8, 0x3ff0e147ae147ae1L    # 1.055

    div-double/2addr v6, v8

    const-wide v8, 0x4003333333333333L    # 2.4

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    goto :goto_51
.end method

.method private static compositeColors(II)I
    .registers 12
    .param p0, "fg"    # I
    .param p1, "bg"    # I

    .prologue
    const/high16 v7, 0x437f0000    # 255.0f

    const/high16 v9, 0x3f800000    # 1.0f

    .line 32
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v6

    int-to-float v6, v6

    div-float v1, v6, v7

    .line 33
    .local v1, "alpha1":F
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v6

    int-to-float v6, v6

    div-float v2, v6, v7

    .line 35
    .local v2, "alpha2":F
    add-float v6, v1, v2

    sub-float v7, v9, v1

    mul-float v0, v6, v7

    .line 36
    .local v0, "a":F
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v1

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v2

    sub-float v8, v9, v1

    mul-float/2addr v7, v8

    add-float v5, v6, v7

    .line 37
    .local v5, "r":F
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v1

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v2

    sub-float v8, v9, v1

    mul-float/2addr v7, v8

    add-float v4, v6, v7

    .line 38
    .local v4, "g":F
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v1

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v2

    sub-float v8, v9, v1

    mul-float/2addr v7, v8

    add-float v3, v6, v7

    .line 40
    .local v3, "b":F
    float-to-int v6, v0

    float-to-int v7, v5

    float-to-int v8, v4

    float-to-int v9, v3

    invoke-static {v6, v7, v8, v9}, Landroid/graphics/Color;->argb(IIII)I

    move-result v6

    return v6
.end method

.method private static findMinimumAlpha(IID)I
    .registers 14
    .param p0, "foreground"    # I
    .param p1, "background"    # I
    .param p2, "minContrastRatio"    # D

    .prologue
    const/16 v9, 0xff

    const/16 v8, 0xa

    .line 89
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v7

    if-eq v7, v9, :cond_12

    .line 90
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "background can not be translucent"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 94
    :cond_12
    invoke-static {p0, v9}, Landroid/support/v7/graphics/ColorUtils;->modifyAlpha(II)I

    move-result v4

    .line 95
    .local v4, "testForeground":I
    invoke-static {v4, p1}, Landroid/support/v7/graphics/ColorUtils;->calculateContrast(II)D

    move-result-wide v5

    .line 96
    .local v5, "testRatio":D
    cmpg-double v7, v5, p2

    if-gez v7, :cond_20

    .line 98
    const/4 v0, -0x1

    .line 123
    :cond_1f
    return v0

    .line 102
    :cond_20
    const/4 v2, 0x0

    .line 103
    .local v2, "numIterations":I
    const/4 v1, 0x0

    .line 104
    .local v1, "minAlpha":I
    const/16 v0, 0xff

    .line 106
    .local v0, "maxAlpha":I
    :goto_24
    if-gt v2, v8, :cond_1f

    sub-int v7, v0, v1

    if-le v7, v8, :cond_1f

    .line 108
    add-int v7, v1, v0

    div-int/lit8 v3, v7, 0x2

    .line 110
    .local v3, "testAlpha":I
    invoke-static {p0, v3}, Landroid/support/v7/graphics/ColorUtils;->modifyAlpha(II)I

    move-result v4

    .line 111
    invoke-static {v4, p1}, Landroid/support/v7/graphics/ColorUtils;->calculateContrast(II)D

    move-result-wide v5

    .line 113
    cmpg-double v7, v5, p2

    if-gez v7, :cond_3e

    .line 114
    move v1, v3

    .line 119
    :goto_3b
    add-int/lit8 v2, v2, 0x1

    .line 120
    goto :goto_24

    .line 116
    :cond_3e
    move v0, v3

    goto :goto_3b
.end method

.method static getTextColorForBackground(IF)I
    .registers 8
    .param p0, "backgroundColor"    # I
    .param p1, "minContrastRatio"    # F

    .prologue
    const/high16 v5, -0x1000000

    const/4 v2, -0x1

    .line 128
    float-to-double v3, p1

    invoke-static {v2, p0, v3, v4}, Landroid/support/v7/graphics/ColorUtils;->findMinimumAlpha(IID)I

    move-result v1

    .line 131
    .local v1, "whiteMinAlpha":I
    if-ltz v1, :cond_f

    .line 132
    invoke-static {v2, v1}, Landroid/support/v7/graphics/ColorUtils;->modifyAlpha(II)I

    move-result v2

    .line 145
    :cond_e
    :goto_e
    return v2

    .line 137
    :cond_f
    float-to-double v3, p1

    invoke-static {v5, p0, v3, v4}, Landroid/support/v7/graphics/ColorUtils;->findMinimumAlpha(IID)I

    move-result v0

    .line 140
    .local v0, "blackMinAlpha":I
    if-ltz v0, :cond_e

    .line 141
    invoke-static {v5, v0}, Landroid/support/v7/graphics/ColorUtils;->modifyAlpha(II)I

    move-result v2

    goto :goto_e
.end method

.method static modifyAlpha(II)I
    .registers 4
    .param p0, "color"    # I
    .param p1, "alpha"    # I

    .prologue
    .line 238
    const v0, 0xffffff

    and-int/2addr v0, p0

    shl-int/lit8 v1, p1, 0x18

    or-int/2addr v0, v1

    return v0
.end method
