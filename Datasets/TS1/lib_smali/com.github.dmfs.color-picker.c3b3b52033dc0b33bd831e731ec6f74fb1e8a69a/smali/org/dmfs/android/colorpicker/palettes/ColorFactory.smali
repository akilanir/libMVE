.class public interface abstract Lorg/dmfs/android/colorpicker/palettes/ColorFactory;
.super Ljava/lang/Object;
.source "ColorFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/android/colorpicker/palettes/ColorFactory$CombinedColorFactory;,
        Lorg/dmfs/android/colorpicker/palettes/ColorFactory$RainbowColorFactory;,
        Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;,
        Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorLigthnessFactory;
    }
.end annotation


# static fields
.field public static final BLUE:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

.field public static final CYAN:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

.field public static final GREEN:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

.field public static final GREY:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

.field public static final ORANGE:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

.field public static final PASTEL:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

.field public static final PINK:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

.field public static final PURPLE:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

.field public static final RAINBOW:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

.field public static final RED:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

.field public static final YELLOW:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 157
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorLigthnessFactory;

    invoke-direct {v0, v1, v1}, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorLigthnessFactory;-><init>(FF)V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory;->GREY:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    .line 162
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;

    invoke-direct {v0, v1}, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;-><init>(F)V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory;->RED:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    .line 167
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;

    const/high16 v1, 0x42140000    # 37.0f

    invoke-direct {v0, v1}, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;-><init>(F)V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory;->ORANGE:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    .line 172
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;

    const/high16 v1, 0x42700000    # 60.0f

    invoke-direct {v0, v1}, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;-><init>(F)V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory;->YELLOW:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    .line 177
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;

    const/high16 v1, 0x42f00000    # 120.0f

    invoke-direct {v0, v1}, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;-><init>(F)V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory;->GREEN:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    .line 182
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;

    const/high16 v1, 0x43340000    # 180.0f

    invoke-direct {v0, v1}, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;-><init>(F)V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory;->CYAN:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    .line 187
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;

    const/high16 v1, 0x43700000    # 240.0f

    invoke-direct {v0, v1}, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;-><init>(F)V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory;->BLUE:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    .line 192
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;

    const/high16 v1, 0x438c0000    # 280.0f

    invoke-direct {v0, v1}, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;-><init>(F)V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory;->PURPLE:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    .line 197
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;

    const/high16 v1, 0x43a00000    # 320.0f

    invoke-direct {v0, v1}, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$ColorShadeFactory;-><init>(F)V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory;->PINK:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    .line 202
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$RainbowColorFactory;

    invoke-direct {v0, v2, v2}, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$RainbowColorFactory;-><init>(FF)V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory;->RAINBOW:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    .line 207
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$RainbowColorFactory;

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-direct {v0, v1, v2}, Lorg/dmfs/android/colorpicker/palettes/ColorFactory$RainbowColorFactory;-><init>(FF)V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/ColorFactory;->PASTEL:Lorg/dmfs/android/colorpicker/palettes/ColorFactory;

    return-void
.end method


# virtual methods
.method public abstract getColor(II)I
.end method
