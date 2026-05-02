.class public Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;
.super Ljava/lang/Object;
.source "ColorFactory.java"

# interfaces
.implements Lorg/dmfs/android/colorpicker/palettes/ColorFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/colorpicker/palettes/ColorFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ColorShadeFactory"
.end annotation


# instance fields
.field private final mHSL:[F


# direct methods
.method public constructor <init>(F)V
    .registers 4
    .param p1, "hue"    # F

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/4 v0, 0x3

    new-array v0, v0, [F

    fill-array-data v0, :array_12

    iput-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;->mHSL:[F

    .line 74
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;->mHSL:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 75
    return-void

    .line 69
    nop

    :array_12
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data
.end method


# virtual methods
.method public getColor(II)I
    .registers 10
    .param p1, "index"    # I
    .param p2, "count"    # I

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v3, 0x40000000    # 2.0f

    .line 81
    add-int/lit8 p1, p1, 0x1

    .line 82
    add-int/lit8 p2, p2, 0x1

    .line 83
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;->mHSL:[F

    .line 85
    .local v0, "hsl":[F
    div-int/lit8 v1, p2, 0x2

    if-gt p1, v1, :cond_1f

    .line 87
    aput v4, v0, v5

    .line 88
    int-to-float v1, p1

    mul-float/2addr v1, v3

    int-to-float v2, p2

    div-float/2addr v1, v2

    aput v1, v0, v6

    .line 95
    :goto_18
    const/16 v1, 0xff

    invoke-static {v1, v0}, Landroid/graphics/Color;->HSVToColor(I[F)I

    move-result v1

    return v1

    .line 92
    :cond_1f
    int-to-float v1, p1

    mul-float/2addr v1, v3

    int-to-float v2, p2

    div-float/2addr v1, v2

    sub-float v1, v3, v1

    aput v1, v0, v5

    .line 93
    aput v4, v0, v6

    goto :goto_18
.end method
