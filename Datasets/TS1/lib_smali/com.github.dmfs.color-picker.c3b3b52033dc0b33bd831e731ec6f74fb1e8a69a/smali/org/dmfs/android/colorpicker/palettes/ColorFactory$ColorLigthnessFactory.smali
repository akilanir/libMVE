.class public Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorLigthnessFactory;
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
    name = "ColorLigthnessFactory"
.end annotation


# instance fields
.field private final mHSL:[F


# direct methods
.method public constructor <init>(FF)V
    .registers 5
    .param p1, "hue"    # F
    .param p2, "saturation"    # F

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v0, 0x3

    new-array v0, v0, [F

    fill-array-data v0, :array_16

    iput-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorLigthnessFactory;->mHSL:[F

    .line 41
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorLigthnessFactory;->mHSL:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 42
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorLigthnessFactory;->mHSL:[F

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 43
    return-void

    .line 36
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
    .line 49
    const/4 v1, 0x1

    if-gt p2, v1, :cond_5

    .line 51
    const/4 v1, -0x1

    .line 58
    :goto_4
    return v1

    .line 54
    :cond_5
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorLigthnessFactory;->mHSL:[F

    .line 56
    .local v0, "hsl":[F
    const/4 v1, 0x2

    int-to-float v2, p1

    add-int/lit8 v3, p2, -0x1

    int-to-float v3, v3

    div-float/2addr v2, v3

    aput v2, v0, v1

    .line 58
    const/16 v1, 0xff

    invoke-static {v1, v0}, Landroid/graphics/Color;->HSVToColor(I[F)I

    move-result v1

    goto :goto_4
.end method
