.class public Lcom/mikepenz/iconics/IconicsDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "IconicsDrawable.java"


# static fields
.field public static final ANDROID_ACTIONBAR_ICON_SIZE_DP:I = 0x18

.field public static final ANDROID_ACTIONBAR_ICON_SIZE_PADDING_DP:I = 0x1


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

    .line 94
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 66
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 67
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 73
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 74
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 84
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 85
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 87
    const/16 v0, 0xff

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 95
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 96
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 98
    const/16 v0, 0x20

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Ljava/lang/Character;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 99
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 121
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 66
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 67
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 73
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 74
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 84
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 85
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 87
    const/16 v0, 0xff

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 122
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 123
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 124
    invoke-virtual {p0, p2}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 125
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/ITypeface;Lcom/mikepenz/iconics/typeface/IIcon;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "typeface"    # Lcom/mikepenz/iconics/typeface/ITypeface;
    .param p3, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 127
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 66
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 67
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 73
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 74
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 84
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 85
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 87
    const/16 v0, 0xff

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 128
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 129
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 130
    invoke-virtual {p0, p2, p3}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/ITypeface;Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 131
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/Character;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "icon"    # Ljava/lang/Character;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 101
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 66
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 67
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 73
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 74
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 84
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 85
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 87
    const/16 v0, 0xff

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 102
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 103
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 105
    invoke-virtual {p0, p2}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Ljava/lang/Character;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 106
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "icon"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 108
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 66
    iput v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 67
    iput v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 71
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 73
    iput v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 74
    iput v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 84
    iput v4, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 85
    iput v4, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 87
    const/16 v2, 0xff

    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 109
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iput-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 110
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 113
    const/4 v2, 0x0

    const/4 v3, 0x3

    :try_start_23
    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/mikepenz/iconics/Iconics;->findFont(Landroid/content/Context;Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/ITypeface;

    move-result-object v1

    .line 114
    .local v1, "font":Lcom/mikepenz/iconics/typeface/ITypeface;
    const-string v2, "-"

    const-string v3, "_"

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 115
    invoke-interface {v1, p2}, Lcom/mikepenz/iconics/typeface/ITypeface;->getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_3a} :catch_3b

    .line 119
    .end local v1    # "font":Lcom/mikepenz/iconics/typeface/ITypeface;
    :goto_3a
    return-void

    .line 116
    :catch_3b
    move-exception v0

    .line 117
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v2, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Wrong icon name: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3a
.end method

.method private offsetIcon(Landroid/graphics/Rect;)V
    .registers 9
    .param p1, "viewBounds"    # Landroid/graphics/Rect;

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    .line 880
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    div-float/2addr v5, v6

    sub-float v2, v4, v5

    .line 881
    .local v2, "startX":F
    iget-object v4, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float v0, v2, v4

    .line 883
    .local v0, "offsetX":F
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    div-float/2addr v5, v6

    sub-float v3, v4, v5

    .line 884
    .local v3, "startY":F
    iget-object v4, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    sub-float v1, v3, v4

    .line 886
    .local v1, "offsetY":F
    iget-object v4, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget v5, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    int-to-float v5, v5

    add-float/2addr v5, v0

    iget v6, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    int-to-float v6, v6

    add-float/2addr v6, v1

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Path;->offset(FF)V

    .line 887
    return-void
.end method

.method private prepare()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 134
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    .line 135
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 137
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    .line 138
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 140
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    .line 142
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    .line 143
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPaddingBounds:Landroid/graphics/Rect;

    .line 144
    return-void
.end method

.method private updatePaddingBounds(Landroid/graphics/Rect;)V
    .registers 8
    .param p1, "viewBounds"    # Landroid/graphics/Rect;

    .prologue
    .line 839
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    if-ltz v0, :cond_31

    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    mul-int/lit8 v0, v0, 0x2

    .line 840
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-gt v0, v1, :cond_31

    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    mul-int/lit8 v0, v0, 0x2

    .line 841
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-gt v0, v1, :cond_31

    .line 842
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

    .line 848
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

    .line 856
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    const/high16 v3, 0x40000000    # 2.0f

    mul-float v10, v0, v3

    .line 857
    .local v10, "textSize":F
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v10}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 859
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    if-eqz v0, :cond_77

    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    invoke-interface {v0}, Lcom/mikepenz/iconics/typeface/IIcon;->getCharacter()C

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    .line 860
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

    .line 861
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v0, v3, v11}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 863
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPaddingBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    div-float v9, v0, v3

    .line 864
    .local v9, "deltaWidth":F
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPaddingBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float v8, v0, v3

    .line 865
    .local v8, "deltaHeight":F
    cmpg-float v0, v9, v8

    if-gez v0, :cond_7e

    move v7, v9

    .line 866
    .local v7, "delta":F
    :goto_59
    mul-float/2addr v10, v7

    .line 868
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v10}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 870
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    iget-object v6, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Paint;->getTextPath(Ljava/lang/String;IIFFLandroid/graphics/Path;)V

    .line 871
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v0, v2, v11}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 872
    return-void

    .line 859
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

    .line 865
    goto :goto_59
.end method


# virtual methods
.method public actionBar()Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2

    .prologue
    .line 371
    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 372
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 373
    return-object p0
.end method

.method public actionBarSize()Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 362
    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public alpha(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 704
    invoke-virtual {p0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->setAlpha(I)V

    .line 705
    return-object p0
.end method

.method public backgroundColor(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "backgroundColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 513
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 514
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 515
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 516
    return-object p0
.end method

.method public backgroundColorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "backgroundColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 526
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4

    .prologue
    .line 896
    new-instance v1, Lcom/mikepenz/iconics/IconicsDrawable;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;)V

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    .line 897
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 898
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersRxPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 899
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersRyPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 900
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePxX(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 901
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePxY(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 902
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetXPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 903
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetYPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    .line 904
    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->contourColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    .line 905
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 906
    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    .line 907
    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 908
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->alpha(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    .line 909
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->drawContour(Z)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    .line 910
    invoke-virtual {v2}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->typeface(Landroid/graphics/Typeface;)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    .line 912
    .local v0, "iconicsDrawable":Lcom/mikepenz/iconics/IconicsDrawable;
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    if-eqz v1, :cond_75

    .line 913
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 917
    :cond_74
    :goto_74
    return-object v0

    .line 914
    :cond_75
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    if-eqz v1, :cond_74

    .line 915
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->iconText(Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;

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
    .line 60
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->clone()Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public color(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 7
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 223
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    .line 224
    .local v2, "red":I
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v1

    .line 225
    .local v1, "green":I
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    .line 226
    .local v0, "blue":I
    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-static {v2, v1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 227
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->setAlpha(I)V

    .line 228
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 229
    return-object p0
.end method

.method public colorFilter(Landroid/graphics/ColorFilter;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 693
    invoke-virtual {p0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 694
    return-object p0
.end method

.method public colorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 249
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public contourColor(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 7
    .param p1, "contourColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 487
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    .line 488
    .local v2, "red":I
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v1

    .line 489
    .local v1, "green":I
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    .line 490
    .local v0, "blue":I
    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    invoke-static {v2, v1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 491
    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 492
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 493
    return-object p0
.end method

.method public contourColorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "contourColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 503
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->contourColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public contourWidthDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "contourWidthDp"    # I

    .prologue
    .line 648
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
    .line 658
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    .line 659
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 660
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->drawContour(Z)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 661
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 662
    return-object p0
.end method

.method public contourWidthRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "contourWidthRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 638
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

    .line 733
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    if-nez v1, :cond_a

    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    if-eqz v1, :cond_5b

    .line 734
    :cond_a
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 736
    .local v0, "viewBounds":Landroid/graphics/Rect;
    invoke-direct {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->updatePaddingBounds(Landroid/graphics/Rect;)V

    .line 737
    invoke-direct {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->updateTextSize(Landroid/graphics/Rect;)V

    .line 738
    invoke-direct {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->offsetIcon(Landroid/graphics/Rect;)V

    .line 740
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    if-eqz v1, :cond_3d

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    if-le v1, v2, :cond_3d

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    if-le v1, v2, :cond_3d

    .line 741
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

    .line 744
    :cond_3d
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 746
    iget-boolean v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    if-eqz v1, :cond_4d

    .line 747
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 750
    :cond_4d
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 752
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 754
    .end local v0    # "viewBounds":Landroid/graphics/Rect;
    :cond_5b
    return-void
.end method

.method public drawContour(Z)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "drawContour"    # Z

    .prologue
    .line 672
    iget-boolean v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    if-eq v0, p1, :cond_14

    .line 673
    iput-boolean p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    .line 675
    iget-boolean v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    if-eqz v0, :cond_15

    .line 676
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    .line 681
    :goto_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 683
    :cond_14
    return-object p0

    .line 678
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
    .line 791
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    return v0
.end method

.method public getCompatAlpha()I
    .registers 2

    .prologue
    .line 800
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    return v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 774
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 769
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 779
    const/4 v0, -0x1

    return v0
.end method

.method public icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 5
    .param p1, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 194
    iput-object p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 195
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    .line 196
    invoke-interface {p1}, Lcom/mikepenz/iconics/typeface/IIcon;->getTypeface()Lcom/mikepenz/iconics/typeface/ITypeface;

    move-result-object v0

    .line 197
    .local v0, "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-interface {v0, v2}, Lcom/mikepenz/iconics/typeface/ITypeface;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 198
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 199
    return-object p0
.end method

.method protected icon(Lcom/mikepenz/iconics/typeface/ITypeface;Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 5
    .param p1, "typeface"    # Lcom/mikepenz/iconics/typeface/ITypeface;
    .param p2, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 210
    iput-object p2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 211
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-interface {p1, v1}, Lcom/mikepenz/iconics/typeface/ITypeface;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 212
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 213
    return-object p0
.end method

.method public icon(Ljava/lang/Character;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "icon"    # Ljava/lang/Character;

    .prologue
    .line 170
    invoke-virtual {p1}, Ljava/lang/Character;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->iconText(Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public icon(Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 7
    .param p1, "icon"    # Ljava/lang/String;

    .prologue
    .line 154
    :try_start_0
    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    const/4 v4, 0x3

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mikepenz/iconics/Iconics;->findFont(Landroid/content/Context;Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/ITypeface;

    move-result-object v1

    .line 155
    .local v1, "font":Lcom/mikepenz/iconics/typeface/ITypeface;
    const-string v2, "-"

    const-string v3, "_"

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 156
    invoke-interface {v1, p1}, Lcom/mikepenz/iconics/typeface/ITypeface;->getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_1c

    .line 160
    .end local v1    # "font":Lcom/mikepenz/iconics/typeface/ITypeface;
    :goto_1b
    return-object p0

    .line 157
    :catch_1c
    move-exception v0

    .line 158
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v2, Lcom/mikepenz/iconics/Iconics;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Wrong icon name: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1b
.end method

.method public iconOffsetXDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "iconOffsetXDp"    # I

    .prologue
    .line 270
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
    .line 280
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 281
    return-object p0
.end method

.method public iconOffsetXRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "iconOffsetXRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 260
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
    .line 301
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
    .line 311
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 312
    return-object p0
.end method

.method public iconOffsetYRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "iconOffsetYRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 291
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetYPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public iconText(Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "icon"    # Ljava/lang/String;

    .prologue
    .line 180
    iput-object p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    .line 181
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 182
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 183
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 184
    return-object p0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 758
    const/4 v0, 0x1

    return v0
.end method

.method public paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "iconPadding"    # I

    .prologue
    .line 333
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
    .line 343
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    if-eq v0, p1, :cond_14

    .line 344
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    .line 345
    iget-boolean v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    if-eqz v0, :cond_11

    .line 346
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    .line 349
    :cond_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 351
    :cond_14
    return-object p0
.end method

.method public paddingRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "dimenRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 322
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
    .line 614
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 615
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 616
    return-object p0
.end method

.method public roundedCornersPx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "roundedCornerPx"    # I

    .prologue
    .line 626
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 627
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 628
    return-object p0
.end method

.method public roundedCornersRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "roundedCornerRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 602
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 603
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 604
    return-object p0
.end method

.method public roundedCornersRxDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "roundedCornerRxDp"    # I

    .prologue
    .line 547
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 548
    return-object p0
.end method

.method public roundedCornersRxPx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "roundedCornerRxPx"    # I

    .prologue
    .line 558
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 559
    return-object p0
.end method

.method public roundedCornersRxRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "roundedCornerRxRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 536
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 537
    return-object p0
.end method

.method public roundedCornersRyDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "roundedCornerRyDp"    # I

    .prologue
    .line 580
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 581
    return-object p0
.end method

.method public roundedCornersRyPx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "roundedCornerRyPx"    # I

    .prologue
    .line 591
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 592
    return-object p0
.end method

.method public roundedCornersRyRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "roundedCornerRyRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 569
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 570
    return-object p0
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 785
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 786
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 787
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 805
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 806
    return-void
.end method

.method public setState([I)Z
    .registers 3
    .param p1, "stateSet"    # [I

    .prologue
    .line 763
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->setAlpha(I)V

    .line 764
    const/4 v0, 0x1

    return v0
.end method

.method public sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "size"    # I

    .prologue
    .line 394
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
    .line 429
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
    .line 463
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

    .line 404
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 405
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 406
    invoke-virtual {p0, v0, v0, p1, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->setBounds(IIII)V

    .line 407
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 408
    return-object p0
.end method

.method public sizePxX(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 5
    .param p1, "sizeX"    # I

    .prologue
    const/4 v2, 0x0

    .line 439
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 440
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    invoke-virtual {p0, v2, v2, v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->setBounds(IIII)V

    .line 441
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 442
    return-object p0
.end method

.method public sizePxY(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 5
    .param p1, "sizeY"    # I

    .prologue
    const/4 v2, 0x0

    .line 473
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 474
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    invoke-virtual {p0, v2, v2, v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->setBounds(IIII)V

    .line 475
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 476
    return-object p0
.end method

.method public sizeRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "dimenRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 383
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
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 418
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
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 452
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
    .line 715
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 716
    return-object p0
.end method

.method public toBitmap()Landroid/graphics/Bitmap;
    .registers 7

    .prologue
    const/4 v5, 0x0

    const/4 v3, -0x1

    .line 814
    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    if-eq v2, v3, :cond_a

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    if-ne v2, v3, :cond_d

    .line 815
    :cond_a
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->actionBar()Lcom/mikepenz/iconics/IconicsDrawable;

    .line 818
    :cond_d
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->getIntrinsicHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 820
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p0, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->style(Landroid/graphics/Paint$Style;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 822
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 823
    .local v1, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    invoke-virtual {p0, v5, v5, v2, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->setBounds(IIII)V

    .line 824
    invoke-virtual {p0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 826
    return-object v0
.end method

.method public typeface(Landroid/graphics/Typeface;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 727
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 728
    return-object p0
.end method
