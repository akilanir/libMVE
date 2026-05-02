.class public Lcom/makeramen/RoundedImageView;
.super Landroid/widget/ImageView;
.source "RoundedImageView.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DEFAULT_BORDER_WIDTH:F = 0.0f

.field public static final DEFAULT_RADIUS:F = 0.0f

.field public static final DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

.field private static final SCALE_TYPES:[Landroid/widget/ImageView$ScaleType;

.field public static final TAG:Ljava/lang/String; = "RoundedImageView"

.field private static final TILE_MODE_CLAMP:I = 0x0

.field private static final TILE_MODE_MIRROR:I = 0x2

.field private static final TILE_MODE_REPEAT:I = 0x1

.field private static final TILE_MODE_UNDEFINED:I = -0x2


# instance fields
.field private borderColor:Landroid/content/res/ColorStateList;

.field private borderWidth:F

.field private cornerRadius:F

.field private isOval:Z

.field private mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mResource:I

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private mutateBackground:Z

.field private tileModeX:Landroid/graphics/Shader$TileMode;

.field private tileModeY:Landroid/graphics/Shader$TileMode;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 16
    const-class v0, Lcom/makeramen/RoundedImageView;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_3e

    move v0, v1

    :goto_b
    sput-boolean v0, Lcom/makeramen/RoundedImageView;->$assertionsDisabled:Z

    .line 28
    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sput-object v0, Lcom/makeramen/RoundedImageView;->DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

    .line 29
    const/16 v0, 0x8

    new-array v0, v0, [Landroid/widget/ImageView$ScaleType;

    sget-object v3, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    aput-object v3, v0, v2

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_END:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/makeramen/RoundedImageView;->SCALE_TYPES:[Landroid/widget/ImageView$ScaleType;

    return-void

    :cond_3e
    move v0, v2

    .line 16
    goto :goto_b
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 56
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 40
    iput v0, p0, Lcom/makeramen/RoundedImageView;->cornerRadius:F

    .line 41
    iput v0, p0, Lcom/makeramen/RoundedImageView;->borderWidth:F

    .line 42
    const/high16 v0, -0x1000000

    .line 43
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    .line 44
    iput-boolean v1, p0, Lcom/makeramen/RoundedImageView;->isOval:Z

    .line 45
    iput-boolean v1, p0, Lcom/makeramen/RoundedImageView;->mutateBackground:Z

    .line 46
    sget-object v0, Lcom/makeramen/RoundedImageView;->DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

    iput-object v0, p0, Lcom/makeramen/RoundedImageView;->tileModeX:Landroid/graphics/Shader$TileMode;

    .line 47
    sget-object v0, Lcom/makeramen/RoundedImageView;->DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

    iput-object v0, p0, Lcom/makeramen/RoundedImageView;->tileModeY:Landroid/graphics/Shader$TileMode;

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/makeramen/RoundedImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 61
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 15
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/high16 v10, -0x1000000

    const/4 v9, -0x1

    const/4 v8, 0x0

    const/4 v7, -0x2

    const/4 v6, 0x0

    .line 64
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    iput v6, p0, Lcom/makeramen/RoundedImageView;->cornerRadius:F

    .line 41
    iput v6, p0, Lcom/makeramen/RoundedImageView;->borderWidth:F

    .line 43
    invoke-static {v10}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    iput-object v5, p0, Lcom/makeramen/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    .line 44
    iput-boolean v8, p0, Lcom/makeramen/RoundedImageView;->isOval:Z

    .line 45
    iput-boolean v8, p0, Lcom/makeramen/RoundedImageView;->mutateBackground:Z

    .line 46
    sget-object v5, Lcom/makeramen/RoundedImageView;->DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

    iput-object v5, p0, Lcom/makeramen/RoundedImageView;->tileModeX:Landroid/graphics/Shader$TileMode;

    .line 47
    sget-object v5, Lcom/makeramen/RoundedImageView;->DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

    iput-object v5, p0, Lcom/makeramen/RoundedImageView;->tileModeY:Landroid/graphics/Shader$TileMode;

    .line 66
    sget-object v5, Lcom/makeramen/R$styleable;->RoundedImageView:[I

    invoke-virtual {p1, p2, v5, p3, v8}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 68
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v5, Lcom/makeramen/R$styleable;->RoundedImageView_android_scaleType:I

    invoke-virtual {v0, v5, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    .line 69
    .local v1, "index":I
    if-ltz v1, :cond_b7

    .line 70
    sget-object v5, Lcom/makeramen/RoundedImageView;->SCALE_TYPES:[Landroid/widget/ImageView$ScaleType;

    aget-object v5, v5, v1

    invoke-virtual {p0, v5}, Lcom/makeramen/RoundedImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 76
    :goto_34
    sget v5, Lcom/makeramen/R$styleable;->RoundedImageView_riv_corner_radius:I

    invoke-virtual {v0, v5, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    int-to-float v5, v5

    iput v5, p0, Lcom/makeramen/RoundedImageView;->cornerRadius:F

    .line 77
    sget v5, Lcom/makeramen/R$styleable;->RoundedImageView_riv_border_width:I

    invoke-virtual {v0, v5, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    int-to-float v5, v5

    iput v5, p0, Lcom/makeramen/RoundedImageView;->borderWidth:F

    .line 80
    iget v5, p0, Lcom/makeramen/RoundedImageView;->cornerRadius:F

    cmpg-float v5, v5, v6

    if-gez v5, :cond_4e

    .line 81
    iput v6, p0, Lcom/makeramen/RoundedImageView;->cornerRadius:F

    .line 83
    :cond_4e
    iget v5, p0, Lcom/makeramen/RoundedImageView;->borderWidth:F

    cmpg-float v5, v5, v6

    if-gez v5, :cond_56

    .line 84
    iput v6, p0, Lcom/makeramen/RoundedImageView;->borderWidth:F

    .line 87
    :cond_56
    sget v5, Lcom/makeramen/R$styleable;->RoundedImageView_riv_border_color:I

    invoke-virtual {v0, v5}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    iput-object v5, p0, Lcom/makeramen/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    .line 88
    iget-object v5, p0, Lcom/makeramen/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    if-nez v5, :cond_68

    .line 89
    invoke-static {v10}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    iput-object v5, p0, Lcom/makeramen/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    .line 92
    :cond_68
    sget v5, Lcom/makeramen/R$styleable;->RoundedImageView_riv_mutate_background:I

    invoke-virtual {v0, v5, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    iput-boolean v5, p0, Lcom/makeramen/RoundedImageView;->mutateBackground:Z

    .line 93
    sget v5, Lcom/makeramen/R$styleable;->RoundedImageView_riv_oval:I

    invoke-virtual {v0, v5, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    iput-boolean v5, p0, Lcom/makeramen/RoundedImageView;->isOval:Z

    .line 95
    sget v5, Lcom/makeramen/R$styleable;->RoundedImageView_riv_tile_mode:I

    invoke-virtual {v0, v5, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    .line 96
    .local v2, "tileMode":I
    if-eq v2, v7, :cond_8e

    .line 97
    invoke-static {v2}, Lcom/makeramen/RoundedImageView;->parseTileMode(I)Landroid/graphics/Shader$TileMode;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/makeramen/RoundedImageView;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    .line 98
    invoke-static {v2}, Lcom/makeramen/RoundedImageView;->parseTileMode(I)Landroid/graphics/Shader$TileMode;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/makeramen/RoundedImageView;->setTileModeY(Landroid/graphics/Shader$TileMode;)V

    .line 101
    :cond_8e
    sget v5, Lcom/makeramen/R$styleable;->RoundedImageView_riv_tile_mode_x:I

    invoke-virtual {v0, v5, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    .line 102
    .local v3, "tileModeX":I
    if-eq v3, v7, :cond_9d

    .line 103
    invoke-static {v3}, Lcom/makeramen/RoundedImageView;->parseTileMode(I)Landroid/graphics/Shader$TileMode;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/makeramen/RoundedImageView;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    .line 106
    :cond_9d
    sget v5, Lcom/makeramen/R$styleable;->RoundedImageView_riv_tile_mode_y:I

    invoke-virtual {v0, v5, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    .line 107
    .local v4, "tileModeY":I
    if-eq v4, v7, :cond_ac

    .line 108
    invoke-static {v4}, Lcom/makeramen/RoundedImageView;->parseTileMode(I)Landroid/graphics/Shader$TileMode;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/makeramen/RoundedImageView;->setTileModeY(Landroid/graphics/Shader$TileMode;)V

    .line 111
    :cond_ac
    invoke-direct {p0}, Lcom/makeramen/RoundedImageView;->updateDrawableAttrs()V

    .line 112
    const/4 v5, 0x1

    invoke-direct {p0, v5}, Lcom/makeramen/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 114
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 115
    return-void

    .line 73
    .end local v2    # "tileMode":I
    .end local v3    # "tileModeX":I
    .end local v4    # "tileModeY":I
    :cond_b7
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v5}, Lcom/makeramen/RoundedImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto/16 :goto_34
.end method

.method private static parseTileMode(I)Landroid/graphics/Shader$TileMode;
    .registers 2
    .param p0, "tileMode"    # I

    .prologue
    .line 118
    packed-switch p0, :pswitch_data_e

    .line 126
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 120
    :pswitch_5
    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    goto :goto_4

    .line 122
    :pswitch_8
    sget-object v0, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    goto :goto_4

    .line 124
    :pswitch_b
    sget-object v0, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    goto :goto_4

    .line 118
    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_5
        :pswitch_8
        :pswitch_b
    .end packed-switch
.end method

.method private resolveResource()Landroid/graphics/drawable/Drawable;
    .registers 7

    .prologue
    .line 214
    invoke-virtual {p0}, Lcom/makeramen/RoundedImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 215
    .local v2, "rsrc":Landroid/content/res/Resources;
    if-nez v2, :cond_8

    const/4 v3, 0x0

    .line 228
    :goto_7
    return-object v3

    .line 217
    :cond_8
    const/4 v0, 0x0

    .line 219
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    iget v3, p0, Lcom/makeramen/RoundedImageView;->mResource:I

    if-eqz v3, :cond_13

    .line 221
    :try_start_d
    iget v3, p0, Lcom/makeramen/RoundedImageView;->mResource:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_12} :catch_18

    move-result-object v0

    .line 228
    :cond_13
    :goto_13
    invoke-static {v0}, Lcom/makeramen/RoundedDrawable;->fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_7

    .line 222
    :catch_18
    move-exception v1

    .line 223
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "RoundedImageView"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to find resource: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/makeramen/RoundedImageView;->mResource:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 225
    const/4 v3, 0x0

    iput v3, p0, Lcom/makeramen/RoundedImageView;->mResource:I

    goto :goto_13
.end method

.method private updateAttrs(Landroid/graphics/drawable/Drawable;)V
    .registers 7
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 250
    if-nez p1, :cond_3

    .line 268
    .end local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_2
    :goto_2
    return-void

    .line 252
    .restart local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_3
    instance-of v3, p1, Lcom/makeramen/RoundedDrawable;

    if-eqz v3, :cond_33

    .line 253
    check-cast p1, Lcom/makeramen/RoundedDrawable;

    .end local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    iget-object v3, p0, Lcom/makeramen/RoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 254
    invoke-virtual {p1, v3}, Lcom/makeramen/RoundedDrawable;->setScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/makeramen/RoundedDrawable;

    move-result-object v3

    iget v4, p0, Lcom/makeramen/RoundedImageView;->cornerRadius:F

    .line 255
    invoke-virtual {v3, v4}, Lcom/makeramen/RoundedDrawable;->setCornerRadius(F)Lcom/makeramen/RoundedDrawable;

    move-result-object v3

    iget v4, p0, Lcom/makeramen/RoundedImageView;->borderWidth:F

    .line 256
    invoke-virtual {v3, v4}, Lcom/makeramen/RoundedDrawable;->setBorderWidth(F)Lcom/makeramen/RoundedDrawable;

    move-result-object v3

    iget-object v4, p0, Lcom/makeramen/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    .line 257
    invoke-virtual {v3, v4}, Lcom/makeramen/RoundedDrawable;->setBorderColor(Landroid/content/res/ColorStateList;)Lcom/makeramen/RoundedDrawable;

    move-result-object v3

    iget-boolean v4, p0, Lcom/makeramen/RoundedImageView;->isOval:Z

    .line 258
    invoke-virtual {v3, v4}, Lcom/makeramen/RoundedDrawable;->setOval(Z)Lcom/makeramen/RoundedDrawable;

    move-result-object v3

    iget-object v4, p0, Lcom/makeramen/RoundedImageView;->tileModeX:Landroid/graphics/Shader$TileMode;

    .line 259
    invoke-virtual {v3, v4}, Lcom/makeramen/RoundedDrawable;->setTileModeX(Landroid/graphics/Shader$TileMode;)Lcom/makeramen/RoundedDrawable;

    move-result-object v3

    iget-object v4, p0, Lcom/makeramen/RoundedImageView;->tileModeY:Landroid/graphics/Shader$TileMode;

    .line 260
    invoke-virtual {v3, v4}, Lcom/makeramen/RoundedDrawable;->setTileModeY(Landroid/graphics/Shader$TileMode;)Lcom/makeramen/RoundedDrawable;

    goto :goto_2

    .line 261
    .restart local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_33
    instance-of v3, p1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v3, :cond_2

    move-object v2, p1

    .line 263
    check-cast v2, Landroid/graphics/drawable/LayerDrawable;

    .line 264
    .local v2, "ld":Landroid/graphics/drawable/LayerDrawable;
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {v2}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v1

    .local v1, "layers":I
    :goto_3f
    if-ge v0, v1, :cond_2

    .line 265
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/makeramen/RoundedImageView;->updateAttrs(Landroid/graphics/drawable/Drawable;)V

    .line 264
    add-int/lit8 v0, v0, 0x1

    goto :goto_3f
.end method

.method private updateBackgroundDrawableAttrs(Z)V
    .registers 3
    .param p1, "convert"    # Z

    .prologue
    .line 241
    iget-boolean v0, p0, Lcom/makeramen/RoundedImageView;->mutateBackground:Z

    if-eqz v0, :cond_13

    .line 242
    if-eqz p1, :cond_e

    .line 243
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v0}, Lcom/makeramen/RoundedDrawable;->fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/RoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 245
    :cond_e
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v0}, Lcom/makeramen/RoundedImageView;->updateAttrs(Landroid/graphics/drawable/Drawable;)V

    .line 247
    :cond_13
    return-void
.end method

.method private updateDrawableAttrs()V
    .registers 2

    .prologue
    .line 237
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v0}, Lcom/makeramen/RoundedImageView;->updateAttrs(Landroid/graphics/drawable/Drawable;)V

    .line 238
    return-void
.end method


# virtual methods
.method protected drawableStateChanged()V
    .registers 1

    .prologue
    .line 132
    invoke-super {p0}, Landroid/widget/ImageView;->drawableStateChanged()V

    .line 133
    invoke-virtual {p0}, Lcom/makeramen/RoundedImageView;->invalidate()V

    .line 134
    return-void
.end method

.method public getBorderColor()I
    .registers 2

    .prologue
    .line 312
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    return v0
.end method

.method public getBorderColors()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 320
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getBorderWidth()F
    .registers 2

    .prologue
    .line 295
    iget v0, p0, Lcom/makeramen/RoundedImageView;->borderWidth:F

    return v0
.end method

.method public getCornerRadius()F
    .registers 2

    .prologue
    .line 279
    iget v0, p0, Lcom/makeramen/RoundedImageView;->cornerRadius:F

    return v0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public getTileModeX()Landroid/graphics/Shader$TileMode;
    .registers 2

    .prologue
    .line 347
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->tileModeX:Landroid/graphics/Shader$TileMode;

    return-object v0
.end method

.method public getTileModeY()Landroid/graphics/Shader$TileMode;
    .registers 2

    .prologue
    .line 360
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->tileModeY:Landroid/graphics/Shader$TileMode;

    return-object v0
.end method

.method public isOval()Z
    .registers 2

    .prologue
    .line 336
    iget-boolean v0, p0, Lcom/makeramen/RoundedImageView;->isOval:Z

    return v0
.end method

.method public mutateBackground(Z)V
    .registers 3
    .param p1, "mutate"    # Z

    .prologue
    .line 377
    iget-boolean v0, p0, Lcom/makeramen/RoundedImageView;->mutateBackground:Z

    if-ne v0, p1, :cond_5

    .line 382
    :goto_4
    return-void

    .line 379
    :cond_5
    iput-boolean p1, p0, Lcom/makeramen/RoundedImageView;->mutateBackground:Z

    .line 380
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/makeramen/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 381
    invoke-virtual {p0}, Lcom/makeramen/RoundedImageView;->invalidate()V

    goto :goto_4
.end method

.method public mutatesBackground()Z
    .registers 2

    .prologue
    .line 373
    iget-boolean v0, p0, Lcom/makeramen/RoundedImageView;->mutateBackground:Z

    return v0
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 233
    invoke-virtual {p0, p1}, Lcom/makeramen/RoundedImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 234
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 273
    iput-object p1, p0, Lcom/makeramen/RoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 274
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/makeramen/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 275
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 276
    return-void
.end method

.method public setBorderColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 316
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/makeramen/RoundedImageView;->setBorderColor(Landroid/content/res/ColorStateList;)V

    .line 317
    return-void
.end method

.method public setBorderColor(Landroid/content/res/ColorStateList;)V
    .registers 4
    .param p1, "colors"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 324
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 333
    .end local p1    # "colors":Landroid/content/res/ColorStateList;
    :cond_8
    :goto_8
    return-void

    .line 326
    .restart local p1    # "colors":Landroid/content/res/ColorStateList;
    :cond_9
    if-eqz p1, :cond_1f

    .line 327
    .end local p1    # "colors":Landroid/content/res/ColorStateList;
    :goto_b
    iput-object p1, p0, Lcom/makeramen/RoundedImageView;->borderColor:Landroid/content/res/ColorStateList;

    .line 328
    invoke-direct {p0}, Lcom/makeramen/RoundedImageView;->updateDrawableAttrs()V

    .line 329
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 330
    iget v0, p0, Lcom/makeramen/RoundedImageView;->borderWidth:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_8

    .line 331
    invoke-virtual {p0}, Lcom/makeramen/RoundedImageView;->invalidate()V

    goto :goto_8

    .line 326
    .restart local p1    # "colors":Landroid/content/res/ColorStateList;
    :cond_1f
    const/high16 v0, -0x1000000

    .line 327
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    goto :goto_b
.end method

.method public setBorderWidth(F)V
    .registers 3
    .param p1, "width"    # F

    .prologue
    .line 303
    iget v0, p0, Lcom/makeramen/RoundedImageView;->borderWidth:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_7

    .line 309
    :goto_6
    return-void

    .line 305
    :cond_7
    iput p1, p0, Lcom/makeramen/RoundedImageView;->borderWidth:F

    .line 306
    invoke-direct {p0}, Lcom/makeramen/RoundedImageView;->updateDrawableAttrs()V

    .line 307
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 308
    invoke-virtual {p0}, Lcom/makeramen/RoundedImageView;->invalidate()V

    goto :goto_6
.end method

.method public setBorderWidth(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 299
    invoke-virtual {p0}, Lcom/makeramen/RoundedImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/makeramen/RoundedImageView;->setBorderWidth(F)V

    .line 300
    return-void
.end method

.method public setCornerRadius(F)V
    .registers 3
    .param p1, "radius"    # F

    .prologue
    .line 287
    iget v0, p0, Lcom/makeramen/RoundedImageView;->cornerRadius:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_7

    .line 292
    :goto_6
    return-void

    .line 289
    :cond_7
    iput p1, p0, Lcom/makeramen/RoundedImageView;->cornerRadius:F

    .line 290
    invoke-direct {p0}, Lcom/makeramen/RoundedImageView;->updateDrawableAttrs()V

    .line 291
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    goto :goto_6
.end method

.method public setCornerRadius(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 283
    invoke-virtual {p0}, Lcom/makeramen/RoundedImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/makeramen/RoundedImageView;->setCornerRadius(F)V

    .line 284
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "bm"    # Landroid/graphics/Bitmap;

    .prologue
    .line 192
    const/4 v0, 0x0

    iput v0, p0, Lcom/makeramen/RoundedImageView;->mResource:I

    .line 193
    invoke-static {p1}, Lcom/makeramen/RoundedDrawable;->fromBitmap(Landroid/graphics/Bitmap;)Lcom/makeramen/RoundedDrawable;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 194
    invoke-direct {p0}, Lcom/makeramen/RoundedImageView;->updateDrawableAttrs()V

    .line 195
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 196
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 184
    const/4 v0, 0x0

    iput v0, p0, Lcom/makeramen/RoundedImageView;->mResource:I

    .line 185
    invoke-static {p1}, Lcom/makeramen/RoundedDrawable;->fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 186
    invoke-direct {p0}, Lcom/makeramen/RoundedImageView;->updateDrawableAttrs()V

    .line 187
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 188
    return-void
.end method

.method public setImageResource(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 200
    iget v0, p0, Lcom/makeramen/RoundedImageView;->mResource:I

    if-eq v0, p1, :cond_14

    .line 201
    iput p1, p0, Lcom/makeramen/RoundedImageView;->mResource:I

    .line 202
    invoke-direct {p0}, Lcom/makeramen/RoundedImageView;->resolveResource()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 203
    invoke-direct {p0}, Lcom/makeramen/RoundedImageView;->updateDrawableAttrs()V

    .line 204
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 206
    :cond_14
    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .registers 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 209
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 210
    invoke-virtual {p0}, Lcom/makeramen/RoundedImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/makeramen/RoundedImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 211
    return-void
.end method

.method public setOval(Z)V
    .registers 3
    .param p1, "oval"    # Z

    .prologue
    .line 340
    iput-boolean p1, p0, Lcom/makeramen/RoundedImageView;->isOval:Z

    .line 341
    invoke-direct {p0}, Lcom/makeramen/RoundedImageView;->updateDrawableAttrs()V

    .line 342
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 343
    invoke-virtual {p0}, Lcom/makeramen/RoundedImageView;->invalidate()V

    .line 344
    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .registers 4
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 156
    sget-boolean v0, Lcom/makeramen/RoundedImageView;->$assertionsDisabled:Z

    if-nez v0, :cond_c

    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 158
    :cond_c
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-eq v0, p1, :cond_2a

    .line 159
    iput-object p1, p0, Lcom/makeramen/RoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 161
    sget-object v0, Lcom/makeramen/RoundedImageView$1;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    invoke-virtual {p1}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_32

    .line 172
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 176
    :goto_20
    invoke-direct {p0}, Lcom/makeramen/RoundedImageView;->updateDrawableAttrs()V

    .line 177
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 178
    invoke-virtual {p0}, Lcom/makeramen/RoundedImageView;->invalidate()V

    .line 180
    :cond_2a
    return-void

    .line 169
    :pswitch_2b
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    invoke-super {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_20

    .line 161
    nop

    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_2b
        :pswitch_2b
        :pswitch_2b
        :pswitch_2b
        :pswitch_2b
        :pswitch_2b
        :pswitch_2b
    .end packed-switch
.end method

.method public setTileModeX(Landroid/graphics/Shader$TileMode;)V
    .registers 3
    .param p1, "tileModeX"    # Landroid/graphics/Shader$TileMode;

    .prologue
    .line 351
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->tileModeX:Landroid/graphics/Shader$TileMode;

    if-ne v0, p1, :cond_5

    .line 357
    :goto_4
    return-void

    .line 353
    :cond_5
    iput-object p1, p0, Lcom/makeramen/RoundedImageView;->tileModeX:Landroid/graphics/Shader$TileMode;

    .line 354
    invoke-direct {p0}, Lcom/makeramen/RoundedImageView;->updateDrawableAttrs()V

    .line 355
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 356
    invoke-virtual {p0}, Lcom/makeramen/RoundedImageView;->invalidate()V

    goto :goto_4
.end method

.method public setTileModeY(Landroid/graphics/Shader$TileMode;)V
    .registers 3
    .param p1, "tileModeY"    # Landroid/graphics/Shader$TileMode;

    .prologue
    .line 364
    iget-object v0, p0, Lcom/makeramen/RoundedImageView;->tileModeY:Landroid/graphics/Shader$TileMode;

    if-ne v0, p1, :cond_5

    .line 370
    :goto_4
    return-void

    .line 366
    :cond_5
    iput-object p1, p0, Lcom/makeramen/RoundedImageView;->tileModeY:Landroid/graphics/Shader$TileMode;

    .line 367
    invoke-direct {p0}, Lcom/makeramen/RoundedImageView;->updateDrawableAttrs()V

    .line 368
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/makeramen/RoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 369
    invoke-virtual {p0}, Lcom/makeramen/RoundedImageView;->invalidate()V

    goto :goto_4
.end method
