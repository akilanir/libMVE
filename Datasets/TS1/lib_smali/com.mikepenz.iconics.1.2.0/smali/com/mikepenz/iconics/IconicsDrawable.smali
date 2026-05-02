.class public Lcom/mikepenz/iconics/IconicsDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "IconicsDrawable.java"


# static fields
.field public static final ANDROID_ACTIONBAR_ICON_SIZE_DP:I = 0x18

.field public static final ANDROID_ACTIONBAR_ICON_SIZE_PADDING_DP:I = 0x6


# instance fields
.field private mAlpha:I

.field private mBackgroundPaint:Landroid/graphics/Paint;

.field private mContext:Landroid/content/Context;

.field private mContourPaint:Landroid/graphics/Paint;

.field private mContourWidth:I

.field private mDrawContour:Z

.field private mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

.field private mIconOffsetX:I

.field private mIconOffsetY:I

.field private mIconPadding:I

.field private mIconPaint:Landroid/graphics/Paint;

.field private mPaddingBounds:Landroid/graphics/Rect;

.field private mPath:Landroid/graphics/Path;

.field private mPathBounds:Landroid/graphics/RectF;

.field private mPlainIcon:Ljava/lang/String;

.field private mRoundedCornerRx:I

.field private mRoundedCornerRy:I

.field private mSizeX:I

.field private mSizeY:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 89
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 61
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 62
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 68
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 69
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 79
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 80
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 82
    const/16 v0, 0xff

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 90
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 91
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 93
    const/16 v0, 0x20

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Ljava/lang/Character;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 94
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 112
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 61
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 62
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 68
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 69
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 79
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 80
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 82
    const/16 v0, 0xff

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 113
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 114
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 115
    invoke-virtual {p0, p2}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 116
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/ITypeface;Lcom/mikepenz/iconics/typeface/IIcon;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "typeface"    # Lcom/mikepenz/iconics/typeface/ITypeface;
    .param p3, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 118
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 61
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 62
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 68
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 69
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 79
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 80
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 82
    const/16 v0, 0xff

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 119
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 120
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 121
    invoke-virtual {p0, p2, p3}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/ITypeface;Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 122
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/Character;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "icon"    # Ljava/lang/Character;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 96
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 61
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 62
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 68
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 69
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 79
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 80
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 82
    const/16 v0, 0xff

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 97
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 98
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 100
    invoke-virtual {p0, p2}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Ljava/lang/Character;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 101
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "icon"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 103
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 61
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 62
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 66
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 68
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 69
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 79
    iput v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 80
    iput v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 82
    const/16 v1, 0xff

    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 104
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 105
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 107
    const/4 v1, 0x3

    invoke-virtual {p2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mikepenz/iconics/Iconics;->findFont(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/ITypeface;

    move-result-object v0

    .line 108
    .local v0, "font":Lcom/mikepenz/iconics/typeface/ITypeface;
    const-string v1, "-"

    const-string v2, "_"

    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 109
    invoke-interface {v0, p2}, Lcom/mikepenz/iconics/typeface/ITypeface;->getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 110
    return-void
.end method

.method private offsetIcon(Landroid/graphics/Rect;)V
    .registers 9
    .param p1, "viewBounds"    # Landroid/graphics/Rect;

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    .line 854
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    div-float/2addr v5, v6

    sub-float v2, v4, v5

    .line 855
    .local v2, "startX":F
    iget-object v4, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float v0, v2, v4

    .line 857
    .local v0, "offsetX":F
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    div-float/2addr v5, v6

    sub-float v3, v4, v5

    .line 858
    .local v3, "startY":F
    iget-object v4, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    sub-float v1, v3, v4

    .line 860
    .local v1, "offsetY":F
    iget-object v4, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget v5, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    int-to-float v5, v5

    add-float/2addr v5, v0

    iget v6, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    int-to-float v6, v6

    add-float/2addr v6, v1

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Path;->offset(FF)V

    .line 861
    return-void
.end method

.method private prepare()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 125
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    .line 126
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 128
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    .line 129
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 131
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    .line 133
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    .line 134
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPaddingBounds:Landroid/graphics/Rect;

    .line 135
    return-void
.end method

.method private updatePaddingBounds(Landroid/graphics/Rect;)V
    .registers 8
    .param p1, "viewBounds"    # Landroid/graphics/Rect;

    .prologue
    .line 813
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    if-ltz v0, :cond_31

    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    mul-int/lit8 v0, v0, 0x2

    .line 814
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-gt v0, v1, :cond_31

    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    mul-int/lit8 v0, v0, 0x2

    .line 815
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-gt v0, v1, :cond_31

    .line 816
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPaddingBounds:Landroid/graphics/Rect;

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    add-int/2addr v1, v2

    iget v2, p1, Landroid/graphics/Rect;->top:I

    iget v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    add-int/2addr v2, v3

    iget v3, p1, Landroid/graphics/Rect;->right:I

    iget v4, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    sub-int/2addr v3, v4

    iget v4, p1, Landroid/graphics/Rect;->bottom:I

    iget v5, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    sub-int/2addr v4, v5

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 822
    :cond_31
    return-void
.end method

.method private updateTextSize(Landroid/graphics/Rect;)V
    .registers 14
    .param p1, "viewBounds"    # Landroid/graphics/Rect;

    .prologue
    const/4 v11, 0x1

    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 830
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    const/high16 v3, 0x40000000    # 2.0f

    mul-float v10, v0, v3

    .line 831
    .local v10, "textSize":F
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v10}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 833
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    if-eqz v0, :cond_77

    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    invoke-interface {v0}, Lcom/mikepenz/iconics/typeface/IIcon;->getCharacter()C

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    .line 834
    .local v1, "textValue":Ljava/lang/String;
    :goto_1f
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    iget-object v6, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Paint;->getTextPath(Ljava/lang/String;IIFFLandroid/graphics/Path;)V

    .line 835
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v0, v3, v11}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 837
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPaddingBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    div-float v9, v0, v3

    .line 838
    .local v9, "deltaWidth":F
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPaddingBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float v8, v0, v3

    .line 839
    .local v8, "deltaHeight":F
    cmpg-float v0, v9, v8

    if-gez v0, :cond_7e

    move v7, v9

    .line 840
    .local v7, "delta":F
    :goto_59
    mul-float/2addr v10, v7

    .line 842
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v10}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 844
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    iget-object v6, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Paint;->getTextPath(Ljava/lang/String;IIFFLandroid/graphics/Path;)V

    .line 845
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v0, v2, v11}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 846
    return-void

    .line 833
    .end local v1    # "textValue":Ljava/lang/String;
    .end local v7    # "delta":F
    .end local v8    # "deltaHeight":F
    .end local v9    # "deltaWidth":F
    :cond_77
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1f

    .restart local v1    # "textValue":Ljava/lang/String;
    .restart local v8    # "deltaHeight":F
    .restart local v9    # "deltaWidth":F
    :cond_7e
    move v7, v8

    .line 839
    goto :goto_59
.end method


# virtual methods
.method public actionBar()Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2

    .prologue
    .line 345
    const/16 v0, 0x24

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 346
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 347
    return-object p0
.end method

.method public actionBarSize()Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 336
    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public alpha(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 678
    invoke-virtual {p0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->setAlpha(I)V

    .line 679
    return-object p0
.end method

.method public backgroundColor(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "backgroundColor"    # I

    .prologue
    const/4 v1, 0x0

    .line 487
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 488
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 489
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 490
    return-object p0
.end method

.method public backgroundColorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "backgroundColorRes"    # I

    .prologue
    .line 500
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4

    .prologue
    .line 870
    new-instance v1, Lcom/mikepenz/iconics/IconicsDrawable;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;)V

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    .line 871
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 872
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersRxPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 873
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersRyPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 874
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePxX(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 875
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePxY(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 876
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetXPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 877
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetYPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    .line 878
    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->contourColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    .line 879
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 880
    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    .line 881
    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 882
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->alpha(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    .line 883
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->drawContour(Z)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    .line 884
    invoke-virtual {v2}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->typeface(Landroid/graphics/Typeface;)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    .line 886
    .local v0, "iconicsDrawable":Lcom/mikepenz/iconics/IconicsDrawable;
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    if-eqz v1, :cond_75

    .line 887
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 891
    :cond_74
    :goto_74
    return-object v0

    .line 888
    :cond_75
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    if-eqz v1, :cond_74

    .line 889
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;

    goto :goto_74
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->clone()Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public color(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 7
    .param p1, "color"    # I

    .prologue
    .line 197
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    .line 198
    .local v2, "red":I
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v1

    .line 199
    .local v1, "green":I
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    .line 200
    .local v0, "blue":I
    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-static {v2, v1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 201
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->setAlpha(I)V

    .line 202
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 203
    return-object p0
.end method

.method public colorFilter(Landroid/graphics/ColorFilter;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 667
    invoke-virtual {p0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 668
    return-object p0
.end method

.method public colorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "colorRes"    # I

    .prologue
    .line 223
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public contourColor(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "contourColor"    # I

    .prologue
    .line 461
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 462
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->drawContour(Z)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 463
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 464
    return-object p0
.end method

.method public contourColorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "contourColorRes"    # I

    .prologue
    .line 474
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 475
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->drawContour(Z)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 476
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 477
    return-object p0
.end method

.method public contourWidthDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "contourWidthDp"    # I

    .prologue
    .line 622
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public contourWidthPx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "contourWidth"    # I

    .prologue
    .line 632
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    .line 633
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 634
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->drawContour(Z)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 635
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 636
    return-object p0
.end method

.method public contourWidthRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "contourWidthRes"    # I

    .prologue
    .line 612
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v2, -0x1

    const/4 v4, 0x0

    .line 707
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    if-nez v1, :cond_a

    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    if-eqz v1, :cond_5b

    .line 708
    :cond_a
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 710
    .local v0, "viewBounds":Landroid/graphics/Rect;
    invoke-direct {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->updatePaddingBounds(Landroid/graphics/Rect;)V

    .line 711
    invoke-direct {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->updateTextSize(Landroid/graphics/Rect;)V

    .line 712
    invoke-direct {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->offsetIcon(Landroid/graphics/Rect;)V

    .line 714
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    if-eqz v1, :cond_3d

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    if-le v1, v2, :cond_3d

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    if-le v1, v2, :cond_3d

    .line 715
    new-instance v1, Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    int-to-float v2, v2

    iget v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 718
    :cond_3d
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 720
    iget-boolean v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    if-eqz v1, :cond_4d

    .line 721
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 724
    :cond_4d
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 726
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 728
    .end local v0    # "viewBounds":Landroid/graphics/Rect;
    :cond_5b
    return-void
.end method

.method public drawContour(Z)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "drawContour"    # Z

    .prologue
    .line 646
    iget-boolean v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    if-eq v0, p1, :cond_14

    .line 647
    iput-boolean p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    .line 649
    iget-boolean v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    if-eqz v0, :cond_15

    .line 650
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    .line 655
    :goto_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 657
    :cond_14
    return-object p0

    .line 652
    :cond_15
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    goto :goto_11
.end method

.method public getAlpha()I
    .registers 2

    .prologue
    .line 765
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    return v0
.end method

.method public getCompatAlpha()I
    .registers 2

    .prologue
    .line 774
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    return v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 748
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 743
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 753
    const/4 v0, -0x1

    return v0
.end method

.method public icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 5
    .param p1, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 168
    iput-object p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 169
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    .line 170
    invoke-interface {p1}, Lcom/mikepenz/iconics/typeface/IIcon;->getTypeface()Lcom/mikepenz/iconics/typeface/ITypeface;

    move-result-object v0

    .line 171
    .local v0, "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-interface {v0, v2}, Lcom/mikepenz/iconics/typeface/ITypeface;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 172
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 173
    return-object p0
.end method

.method public icon(Lcom/mikepenz/iconics/typeface/ITypeface;Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 5
    .param p1, "typeface"    # Lcom/mikepenz/iconics/typeface/ITypeface;
    .param p2, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 184
    iput-object p2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 185
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-interface {p1, v1}, Lcom/mikepenz/iconics/typeface/ITypeface;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 186
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 187
    return-object p0
.end method

.method public icon(Ljava/lang/Character;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "icon"    # Ljava/lang/Character;

    .prologue
    .line 144
    invoke-virtual {p1}, Ljava/lang/Character;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public icon(Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "icon"    # Ljava/lang/String;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    .line 155
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 156
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 157
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 158
    return-object p0
.end method

.method public iconOffsetXDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "iconOffsetXDp"    # I

    .prologue
    .line 244
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetXPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public iconOffsetXPx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "iconOffsetX"    # I

    .prologue
    .line 254
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 255
    return-object p0
.end method

.method public iconOffsetXRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "iconOffsetXRes"    # I

    .prologue
    .line 234
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetXPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public iconOffsetYDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "iconOffsetYDp"    # I

    .prologue
    .line 275
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetYPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public iconOffsetYPx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "iconOffsetY"    # I

    .prologue
    .line 285
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 286
    return-object p0
.end method

.method public iconOffsetYRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "iconOffsetYRes"    # I

    .prologue
    .line 265
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetYPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 732
    const/4 v0, 0x1

    return v0
.end method

.method public paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "iconPadding"    # I

    .prologue
    .line 307
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public paddingPx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "iconPadding"    # I

    .prologue
    .line 317
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    if-eq v0, p1, :cond_14

    .line 318
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    .line 319
    iget-boolean v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    if-eqz v0, :cond_11

    .line 320
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    .line 323
    :cond_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 325
    :cond_14
    return-object p0
.end method

.method public paddingRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "dimenRes"    # I

    .prologue
    .line 296
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public roundedCornersDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "roundedCornerDp"    # I

    .prologue
    .line 588
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 589
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 590
    return-object p0
.end method

.method public roundedCornersPx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "roundedCornerPx"    # I

    .prologue
    .line 600
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 601
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 602
    return-object p0
.end method

.method public roundedCornersRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "roundedCornerRes"    # I

    .prologue
    .line 576
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 577
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 578
    return-object p0
.end method

.method public roundedCornersRxDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "roundedCornerRxDp"    # I

    .prologue
    .line 521
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 522
    return-object p0
.end method

.method public roundedCornersRxPx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "roundedCornerRxPx"    # I

    .prologue
    .line 532
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 533
    return-object p0
.end method

.method public roundedCornersRxRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "roundedCornerRxRes"    # I

    .prologue
    .line 510
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 511
    return-object p0
.end method

.method public roundedCornersRyDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "roundedCornerRyDp"    # I

    .prologue
    .line 554
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 555
    return-object p0
.end method

.method public roundedCornersRyPx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "roundedCornerRyPx"    # I

    .prologue
    .line 565
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 566
    return-object p0
.end method

.method public roundedCornersRyRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "roundedCornerRyRes"    # I

    .prologue
    .line 543
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 544
    return-object p0
.end method

.method public setAlpha(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 760
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 761
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 779
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 780
    return-void
.end method

.method public setState([I)Z
    .registers 3
    .param p1, "stateSet"    # [I

    .prologue
    .line 737
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->setAlpha(I)V

    .line 738
    const/4 v0, 0x1

    return v0
.end method

.method public sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "size"    # I

    .prologue
    .line 368
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public sizeDpX(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "sizeX"    # I

    .prologue
    .line 403
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePxX(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public sizeDpY(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "sizeY"    # I

    .prologue
    .line 437
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePxY(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public sizePx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "size"    # I

    .prologue
    const/4 v0, 0x0

    .line 378
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 379
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 380
    invoke-virtual {p0, v0, v0, p1, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->setBounds(IIII)V

    .line 381
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 382
    return-object p0
.end method

.method public sizePxX(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 5
    .param p1, "sizeX"    # I

    .prologue
    const/4 v2, 0x0

    .line 413
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 414
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    invoke-virtual {p0, v2, v2, v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->setBounds(IIII)V

    .line 415
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 416
    return-object p0
.end method

.method public sizePxY(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 5
    .param p1, "sizeY"    # I

    .prologue
    const/4 v2, 0x0

    .line 447
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 448
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    invoke-virtual {p0, v2, v2, v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->setBounds(IIII)V

    .line 449
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 450
    return-object p0
.end method

.method public sizeRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "dimenRes"    # I

    .prologue
    .line 357
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public sizeResX(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "dimenResX"    # I

    .prologue
    .line 392
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePxX(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public sizeResY(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "dimenResY"    # I

    .prologue
    .line 426
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePxY(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public style(Landroid/graphics/Paint$Style;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "style"    # Landroid/graphics/Paint$Style;

    .prologue
    .line 689
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 690
    return-object p0
.end method

.method public toBitmap()Landroid/graphics/Bitmap;
    .registers 7

    .prologue
    const/4 v5, 0x0

    const/4 v3, -0x1

    .line 788
    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    if-eq v2, v3, :cond_a

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    if-ne v2, v3, :cond_d

    .line 789
    :cond_a
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->actionBar()Lcom/mikepenz/iconics/IconicsDrawable;

    .line 792
    :cond_d
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->getIntrinsicHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 794
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p0, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->style(Landroid/graphics/Paint$Style;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 796
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 797
    .local v1, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    invoke-virtual {p0, v5, v5, v2, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->setBounds(IIII)V

    .line 798
    invoke-virtual {p0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 800
    return-object v0
.end method

.method public typeface(Landroid/graphics/Typeface;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 701
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 702
    return-object p0
.end method
