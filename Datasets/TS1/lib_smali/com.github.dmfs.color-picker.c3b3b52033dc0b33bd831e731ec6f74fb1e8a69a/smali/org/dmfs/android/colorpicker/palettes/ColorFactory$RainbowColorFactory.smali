.class public Lorg/dmfs/android/colorpicker/palettes/ColorFactory$RainbowColorFactory;
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
    name = "RainbowColorFactory"
.end annotation


# instance fields
.field private final mHSL:[F


# direct methods
.method public constructor <init>(FF)V
    .registers 5
    .param p1, "saturation"    # F
    .param p2, "lightness"    # F

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    const/4 v0, 0x3

    new-array v0, v0, [F

    fill-array-data v0, :array_16

    iput-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$RainbowColorFactory;->mHSL:[F

    .line 111
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$RainbowColorFactory;->mHSL:[F

    const/4 v1, 0x1

    aput p1, v0, v1

    .line 112
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$RainbowColorFactory;->mHSL:[F

    const/4 v1, 0x2

    aput p2, v0, v1

    .line 113
    return-void

    .line 106
    :array_16
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data
.end method


# virtual methods
.method public getColor(II)I
    .registers 7
    .param p1, "index"    # I
    .param p2, "count"    # I

    .prologue
    .line 119
    add-int/lit8 p2, p2, 0x1

    .line 120
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$RainbowColorFactory;->mHSL:[F

    .line 122
    .local v0, "hsl":[F
    const/4 v1, 0x0

    int-to-float v2, p1

    const/high16 v3, 0x43b40000    # 360.0f

    mul-float/2addr v2, v3

    int-to-float v3, p2

    div-float/2addr v2, v3

    aput v2, v0, v1

    .line 124
    const/16 v1, 0xff

    invoke-static {v1, v0}, Landroid/graphics/Color;->HSVToColor(I[F)I

    move-result v1

    return v1
.end method
