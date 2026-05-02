.class public Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "GoogleMusicDicesDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$2;,
        Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$Builder;,
        Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;,
        Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;,
        Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;
    }
.end annotation


# static fields
.field private static final ACCELERATE_INTERPOLATOR:Landroid/view/animation/Interpolator;

.field private static final ANIMATION_DURATION:I = 0x15e

.field private static final ANIMATION_START_DELAY:I = 0x96

.field private static final DICE_SIDE_COLOR:I

.field private static final DICE_SIDE_SHADOW_COLOR:I


# instance fields
.field private mDiceRotation:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;

.field private mDiceState:I

.field private mDiceStates:[Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

.field private mPaint:Landroid/graphics/Paint;

.field private mPaintCircle:Landroid/graphics/Paint;

.field private mPaintShadow:Landroid/graphics/Paint;

.field private mScale:F

.field private mSize:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 18
    const-string v0, "#FFDBDBDB"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->DICE_SIDE_COLOR:I

    .line 19
    const-string v0, "#FFB8B8B9"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->DICE_SIDE_SHADOW_COLOR:I

    .line 23
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    sput-object v0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->ACCELERATE_INTERPOLATOR:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 62
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 63
    invoke-direct {p0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->init()V

    .line 64
    return-void
.end method

.method static synthetic access$002(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;F)F
    .registers 2
    .param p0, "x0"    # Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;
    .param p1, "x1"    # F

    .prologue
    .line 16
    iput p1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mScale:F

    return p1
.end method

.method static synthetic access$100(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;)I
    .registers 2
    .param p0, "x0"    # Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

    .prologue
    .line 16
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceState:I

    return v0
.end method

.method static synthetic access$102(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;I)I
    .registers 2
    .param p0, "x0"    # Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;
    .param p1, "x1"    # I

    .prologue
    .line 16
    iput p1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceState:I

    return p1
.end method

.method static synthetic access$108(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;)I
    .registers 3
    .param p0, "x0"    # Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

    .prologue
    .line 16
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceState:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceState:I

    return v0
.end method

.method static synthetic access$200(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;)[Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;
    .registers 2
    .param p0, "x0"    # Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceStates:[Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    return-object v0
.end method

.method static synthetic access$300(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;)Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;
    .registers 2
    .param p0, "x0"    # Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceRotation:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;

    return-object v0
.end method

.method static synthetic access$302(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;)Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;
    .registers 2
    .param p0, "x0"    # Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;
    .param p1, "x1"    # Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;

    .prologue
    .line 16
    iput-object p1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceRotation:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;

    return-object p1
.end method

.method private drawDiceSide(Landroid/graphics/Canvas;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;Z)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "side"    # Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;
    .param p3, "shadow"    # Z

    .prologue
    const/4 v1, 0x0

    .line 205
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v6, v0, 0xa

    .line 206
    .local v6, "circleRadius":I
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    int-to-float v3, v0

    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    int-to-float v4, v0

    if-eqz p3, :cond_20

    iget-object v5, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintShadow:Landroid/graphics/Paint;

    :goto_f
    move-object v0, p1

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 207
    sget-object v0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$2;->$SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleMusicDicesDrawable$DiceSide:[I

    invoke-virtual {p2}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1b4

    .line 242
    :goto_1f
    return-void

    .line 206
    :cond_20
    iget-object v5, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaint:Landroid/graphics/Paint;

    goto :goto_f

    .line 209
    :pswitch_23
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_1f

    .line 212
    :pswitch_34
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v2, v2, 0x4

    sub-int/2addr v1, v2

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 213
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_1f

    .line 216
    :pswitch_5b
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 217
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 218
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v2, v2, 0x4

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v2, v2, 0xa

    int-to-float v2, v2

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_1f

    .line 221
    :pswitch_96
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 222
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v2, v2, 0x4

    sub-int/2addr v1, v2

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 223
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v2, v2, 0x4

    sub-int/2addr v1, v2

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 224
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_1f

    .line 227
    :pswitch_e4
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 228
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 229
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v2, v2, 0x4

    sub-int/2addr v1, v2

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 230
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v2, v2, 0x4

    sub-int/2addr v1, v2

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 231
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_1f

    .line 234
    :pswitch_142
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 235
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 236
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v0, v0, 0x4

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v2, v2, 0x4

    sub-int/2addr v1, v2

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 237
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 238
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 239
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v1, v1, 0x4

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v2, v2, 0x4

    sub-int/2addr v1, v2

    int-to-float v1, v1

    int-to-float v2, v6

    iget-object v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_1f

    .line 207
    nop

    :pswitch_data_1b4
    .packed-switch 0x1
        :pswitch_23
        :pswitch_34
        :pswitch_5b
        :pswitch_96
        :pswitch_e4
        :pswitch_142
    .end packed-switch
.end method

.method private drawScaleX(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v2, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    .line 173
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 174
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 175
    .local v0, "matrix":Landroid/graphics/Matrix;
    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mScale:F

    sub-float v1, v5, v1

    const/4 v3, 0x0

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {v0, v1, v5, v3, v4}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    .line 176
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 177
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceStates:[Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceState:I

    aget-object v1, v1, v3

    # getter for: Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;->side1:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;
    invoke-static {v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;->access$400(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;)Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    move-result-object v3

    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mScale:F

    const v4, 0x3dcccccd    # 0.1f

    cmpl-float v1, v1, v4

    if-lez v1, :cond_5e

    const/4 v1, 0x1

    :goto_2f
    invoke-direct {p0, p1, v3, v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->drawDiceSide(Landroid/graphics/Canvas;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;Z)V

    .line 178
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 180
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 181
    new-instance v0, Landroid/graphics/Matrix;

    .end local v0    # "matrix":Landroid/graphics/Matrix;
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 182
    .restart local v0    # "matrix":Landroid/graphics/Matrix;
    iget v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mScale:F

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    int-to-float v3, v3

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {v0, v1, v5, v3, v4}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    .line 183
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 184
    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceStates:[Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceState:I

    aget-object v1, v1, v3

    # getter for: Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;->side2:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;
    invoke-static {v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;->access$500(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;)Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    move-result-object v1

    invoke-direct {p0, p1, v1, v2}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->drawDiceSide(Landroid/graphics/Canvas;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;Z)V

    .line 185
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 186
    return-void

    :cond_5e
    move v1, v2

    .line 177
    goto :goto_2f
.end method

.method private drawScaleY(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v1, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    .line 189
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 190
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 191
    .local v0, "matrix":Landroid/graphics/Matrix;
    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mScale:F

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    const/4 v4, 0x0

    invoke-virtual {v0, v5, v2, v3, v4}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    .line 192
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 193
    iget-object v2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceStates:[Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceState:I

    aget-object v2, v2, v3

    # getter for: Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;->side1:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;
    invoke-static {v2}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;->access$400(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;)Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    move-result-object v2

    invoke-direct {p0, p1, v2, v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->drawDiceSide(Landroid/graphics/Canvas;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;Z)V

    .line 194
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 196
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 197
    new-instance v0, Landroid/graphics/Matrix;

    .end local v0    # "matrix":Landroid/graphics/Matrix;
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 198
    .restart local v0    # "matrix":Landroid/graphics/Matrix;
    iget v2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mScale:F

    sub-float v2, v5, v2

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    iget v4, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    int-to-float v4, v4

    invoke-virtual {v0, v5, v2, v3, v4}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    .line 199
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 200
    iget-object v2, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceStates:[Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceState:I

    aget-object v2, v2, v3

    # getter for: Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;->side2:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;
    invoke-static {v2}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;->access$500(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;)Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    move-result-object v2

    iget v3, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mScale:F

    const v4, 0x3dcccccd    # 0.1f

    cmpl-float v3, v3, v4

    if-lez v3, :cond_57

    const/4 v1, 0x1

    :cond_57
    invoke-direct {p0, p1, v2, v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->drawDiceSide(Landroid/graphics/Canvas;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;Z)V

    .line 201
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 202
    return-void
.end method

.method private init()V
    .registers 7

    .prologue
    const/4 v5, 0x1

    .line 67
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaint:Landroid/graphics/Paint;

    .line 68
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaint:Landroid/graphics/Paint;

    sget v1, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->DICE_SIDE_COLOR:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 70
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintShadow:Landroid/graphics/Paint;

    .line 71
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintShadow:Landroid/graphics/Paint;

    sget v1, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->DICE_SIDE_SHADOW_COLOR:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 73
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    .line 74
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 76
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    const/4 v1, 0x0

    new-instance v2, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    sget-object v3, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;->ONE:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    sget-object v4, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;->THREE:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    invoke-direct {v2, p0, v3, v4}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;-><init>(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;)V

    aput-object v2, v0, v1

    new-instance v1, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    sget-object v2, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;->TWO:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    sget-object v3, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;->THREE:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    invoke-direct {v1, p0, v2, v3}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;-><init>(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;)V

    aput-object v1, v0, v5

    const/4 v1, 0x2

    new-instance v2, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    sget-object v3, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;->TWO:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    sget-object v4, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;->SIX:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    invoke-direct {v2, p0, v3, v4}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;-><init>(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    sget-object v3, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;->FOUR:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    sget-object v4, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;->SIX:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    invoke-direct {v2, p0, v3, v4}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;-><init>(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;)V

    aput-object v2, v0, v1

    const/4 v1, 0x4

    new-instance v2, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    sget-object v3, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;->FOUR:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    sget-object v4, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;->FIVE:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    invoke-direct {v2, p0, v3, v4}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;-><init>(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;)V

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-instance v2, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    sget-object v3, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;->ONE:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    sget-object v4, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;->FIVE:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;

    invoke-direct {v2, p0, v3, v4}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;-><init>(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceSide;)V

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceStates:[Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceState;

    .line 84
    sget-object v0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;->LEFT:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;

    iput-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceRotation:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;

    .line 86
    invoke-direct {p0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->initObjectAnimator()V

    .line 87
    return-void
.end method

.method private initObjectAnimator()V
    .registers 4

    .prologue
    .line 90
    const-string v1, "scale"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_28

    invoke-static {p0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 91
    .local v0, "objectAnimator":Landroid/animation/ObjectAnimator;
    sget-object v1, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->ACCELERATE_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 92
    const-wide/16 v1, 0x15e

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 93
    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 94
    new-instance v1, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$1;

    invoke-direct {v1, p0, v0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$1;-><init>(Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;Landroid/animation/ObjectAnimator;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 106
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 107
    return-void

    .line 90
    nop

    :array_28
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceRotation:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;

    if-eqz v0, :cond_11

    .line 112
    sget-object v0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$2;->$SwitchMap$com$jpardogo$android$googleprogressbar$library$GoogleMusicDicesDrawable$DiceRotation:[I

    iget-object v1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mDiceRotation:Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;

    invoke-virtual {v1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable$DiceRotation;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1a

    .line 121
    :cond_11
    :goto_11
    return-void

    .line 114
    :pswitch_12
    invoke-direct {p0, p1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->drawScaleY(Landroid/graphics/Canvas;)V

    goto :goto_11

    .line 117
    :pswitch_16
    invoke-direct {p0, p1}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->drawScaleX(Landroid/graphics/Canvas;)V

    goto :goto_11

    .line 112
    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_12
        :pswitch_16
    .end packed-switch
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 139
    const/4 v0, -0x3

    return v0
.end method

.method getScale()F
    .registers 2

    .prologue
    .line 245
    iget v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mScale:F

    return v0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 150
    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    .line 151
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_9

    .line 152
    invoke-interface {v0, p0}, Landroid/graphics/drawable/Drawable$Callback;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 154
    :cond_9
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 144
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 145
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mSize:I

    .line 146
    return-void
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 6
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;
    .param p3, "when"    # J

    .prologue
    .line 158
    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    .line 159
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_9

    .line 160
    invoke-interface {v0, p0, p2, p3, p4}, Landroid/graphics/drawable/Drawable$Callback;->scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V

    .line 162
    :cond_9
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 125
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 126
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintShadow:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 127
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 128
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 132
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 133
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintShadow:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 134
    iget-object v0, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mPaintCircle:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 135
    return-void
.end method

.method setScale(F)V
    .registers 2
    .param p1, "scale"    # F

    .prologue
    .line 249
    iput p1, p0, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->mScale:F

    .line 250
    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 4
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;
    .param p2, "what"    # Ljava/lang/Runnable;

    .prologue
    .line 166
    invoke-virtual {p0}, Lcom/jpardogo/android/googleprogressbar/library/GoogleMusicDicesDrawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object v0

    .line 167
    .local v0, "callback":Landroid/graphics/drawable/Drawable$Callback;
    if-eqz v0, :cond_9

    .line 168
    invoke-interface {v0, p0, p2}, Landroid/graphics/drawable/Drawable$Callback;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V

    .line 170
    :cond_9
    return-void
.end method
