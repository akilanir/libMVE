.class final Lpl/droidsonroids/gif/GifViewUtils;
.super Ljava/lang/Object;
.source "GifViewUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lpl/droidsonroids/gif/GifViewUtils$InitResult;
    }
.end annotation


# static fields
.field static final ANDROID_NS:Ljava/lang/String; = "http://schemas.android.com/apk/res/android"

.field static final SUPPORTED_RESOURCE_TYPE_NAMES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 22
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "raw"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "drawable"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "mipmap"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lpl/droidsonroids/gif/GifViewUtils;->SUPPORTED_RESOURCE_TYPE_NAMES:Ljava/util/List;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method static getDensityScale(Landroid/content/res/Resources;I)F
    .registers 8
    .param p0, "res"    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation

        .annotation build Landroid/support/annotation/RawRes;
        .end annotation
    .end param

    .prologue
    .line 91
    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .line 92
    .local v3, "value":Landroid/util/TypedValue;
    const/4 v4, 0x1

    invoke-virtual {p0, p1, v3, v4}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 93
    iget v1, v3, Landroid/util/TypedValue;->density:I

    .line 95
    .local v1, "resourceDensity":I
    if-nez v1, :cond_1d

    .line 96
    const/16 v0, 0xa0

    .line 102
    .local v0, "density":I
    :goto_f
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v2, v4, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 104
    .local v2, "targetDensity":I
    if-lez v0, :cond_26

    if-lez v2, :cond_26

    .line 105
    int-to-float v4, v2

    int-to-float v5, v0

    div-float/2addr v4, v5

    .line 107
    :goto_1c
    return v4

    .line 97
    .end local v0    # "density":I
    .end local v2    # "targetDensity":I
    :cond_1d
    const v4, 0xffff

    if-eq v1, v4, :cond_24

    .line 98
    move v0, v1

    .restart local v0    # "density":I
    goto :goto_f

    .line 100
    .end local v0    # "density":I
    :cond_24
    const/4 v0, 0x0

    .restart local v0    # "density":I
    goto :goto_f

    .line 107
    .restart local v2    # "targetDensity":I
    :cond_26
    const/high16 v4, 0x3f800000    # 1.0f

    goto :goto_1c
.end method

.method private static getResourceId(Landroid/widget/ImageView;Landroid/util/AttributeSet;Z)I
    .registers 8
    .param p0, "view"    # Landroid/widget/ImageView;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "isSrc"    # Z

    .prologue
    const/4 v3, 0x0

    .line 38
    const-string v4, "http://schemas.android.com/apk/res/android"

    if-eqz p2, :cond_24

    const-string v2, "src"

    :goto_7
    invoke-interface {p1, v4, v2, v3}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 39
    .local v0, "resId":I
    if-lez v0, :cond_27

    .line 40
    invoke-virtual {p0}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v1

    .line 41
    .local v1, "resourceTypeName":Ljava/lang/String;
    sget-object v2, Lpl/droidsonroids/gif/GifViewUtils;->SUPPORTED_RESOURCE_TYPE_NAMES:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 42
    invoke-static {p0, p2, v0}, Lpl/droidsonroids/gif/GifViewUtils;->setResource(Landroid/widget/ImageView;ZI)Z

    move-result v2

    if-nez v2, :cond_27

    .line 47
    .end local v0    # "resId":I
    .end local v1    # "resourceTypeName":Ljava/lang/String;
    :goto_23
    return v0

    .line 38
    :cond_24
    const-string v2, "background"

    goto :goto_7

    .restart local v0    # "resId":I
    :cond_27
    move v0, v3

    .line 47
    goto :goto_23
.end method

.method static initImageView(Landroid/widget/ImageView;Landroid/util/AttributeSet;II)Lpl/droidsonroids/gif/GifViewUtils$InitResult;
    .registers 9
    .param p0, "view"    # Landroid/widget/ImageView;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyleAttr"    # I
    .param p3, "defStyleRes"    # I

    .prologue
    const/4 v4, 0x0

    .line 28
    if-eqz p1, :cond_1c

    invoke-virtual {p0}, Landroid/widget/ImageView;->isInEditMode()Z

    move-result v3

    if-nez v3, :cond_1c

    .line 29
    const/4 v3, 0x1

    invoke-static {p0, p1, v3}, Lpl/droidsonroids/gif/GifViewUtils;->getResourceId(Landroid/widget/ImageView;Landroid/util/AttributeSet;Z)I

    move-result v2

    .line 30
    .local v2, "sourceResId":I
    invoke-static {p0, p1, v4}, Lpl/droidsonroids/gif/GifViewUtils;->getResourceId(Landroid/widget/ImageView;Landroid/util/AttributeSet;Z)I

    move-result v0

    .line 31
    .local v0, "backgroundResId":I
    invoke-static {p0, p1, p2, p3}, Lpl/droidsonroids/gif/GifViewUtils;->isFreezingAnimation(Landroid/view/View;Landroid/util/AttributeSet;II)Z

    move-result v1

    .line 32
    .local v1, "freezesAnimation":Z
    new-instance v3, Lpl/droidsonroids/gif/GifViewUtils$InitResult;

    invoke-direct {v3, v2, v0, v1}, Lpl/droidsonroids/gif/GifViewUtils$InitResult;-><init>(IIZ)V

    .line 34
    .end local v0    # "backgroundResId":I
    .end local v1    # "freezesAnimation":Z
    .end local v2    # "sourceResId":I
    :goto_1b
    return-object v3

    :cond_1c
    new-instance v3, Lpl/droidsonroids/gif/GifViewUtils$InitResult;

    invoke-direct {v3, v4, v4, v4}, Lpl/droidsonroids/gif/GifViewUtils$InitResult;-><init>(IIZ)V

    goto :goto_1b
.end method

.method static isFreezingAnimation(Landroid/view/View;Landroid/util/AttributeSet;II)Z
    .registers 8
    .param p0, "view"    # Landroid/view/View;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyleAttr"    # I
    .param p3, "defStyleRes"    # I

    .prologue
    .line 72
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lpl/droidsonroids/gif/R$styleable;->GifView:[I

    invoke-virtual {v2, p1, v3, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 73
    .local v1, "gifViewAttributes":Landroid/content/res/TypedArray;
    sget v2, Lpl/droidsonroids/gif/R$styleable;->GifView_freezesAnimation:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    .line 74
    .local v0, "freezesAnimation":Z
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 75
    return v0
.end method

.method static setGifImageUri(Landroid/widget/ImageView;Landroid/net/Uri;)Z
    .registers 4
    .param p0, "imageView"    # Landroid/widget/ImageView;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 79
    if-eqz p1, :cond_15

    .line 81
    :try_start_2
    new-instance v0, Lpl/droidsonroids/gif/GifDrawable;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_12} :catch_14

    .line 82
    const/4 v0, 0x1

    .line 87
    :goto_13
    return v0

    .line 83
    :catch_14
    move-exception v0

    .line 87
    :cond_15
    const/4 v0, 0x0

    goto :goto_13
.end method

.method static setResource(Landroid/widget/ImageView;ZI)Z
    .registers 7
    .param p0, "view"    # Landroid/widget/ImageView;
    .param p1, "isSrc"    # Z
    .param p2, "resId"    # I

    .prologue
    .line 52
    invoke-virtual {p0}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 53
    .local v1, "res":Landroid/content/res/Resources;
    if-eqz v1, :cond_1d

    .line 55
    :try_start_6
    new-instance v0, Lpl/droidsonroids/gif/GifDrawable;

    invoke-direct {v0, v1, p2}, Lpl/droidsonroids/gif/GifDrawable;-><init>(Landroid/content/res/Resources;I)V

    .line 56
    .local v0, "d":Lpl/droidsonroids/gif/GifDrawable;
    if-eqz p1, :cond_12

    .line 57
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 63
    :goto_10
    const/4 v2, 0x1

    .line 68
    .end local v0    # "d":Lpl/droidsonroids/gif/GifDrawable;
    :goto_11
    return v2

    .line 58
    .restart local v0    # "d":Lpl/droidsonroids/gif/GifDrawable;
    :cond_12
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v2, v3, :cond_1f

    .line 59
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_10

    .line 64
    .end local v0    # "d":Lpl/droidsonroids/gif/GifDrawable;
    :catch_1c
    move-exception v2

    .line 68
    :cond_1d
    const/4 v2, 0x0

    goto :goto_11

    .line 61
    .restart local v0    # "d":Lpl/droidsonroids/gif/GifDrawable;
    :cond_1f
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_22} :catch_1c
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_6 .. :try_end_22} :catch_1c

    goto :goto_10
.end method
