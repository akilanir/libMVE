.class public Lcom/mikepenz/iconics/IconicsDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "IconicsDrawable.java"


# static fields
.field public static final ANDROID_ACTIONBAR_ICON_SIZE_DP:I = 0x18

.field public static final ANDROID_ACTIONBAR_ICON_SIZE_PADDING_DP:I = 0x1


# instance fields
.field private mAlpha:I

.field private mBackgroundColor:I

.field private mBackgroundPaint:Landroid/graphics/Paint;

.field private mContext:Landroid/content/Context;

.field private mContourColor:I

.field private mContourPaint:Landroid/graphics/Paint;

.field private mContourWidth:I

.field private mDrawContour:Z

.field private mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

.field private mIconColor:I

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
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 97
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 66
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 67
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 76
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 77
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 87
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 88
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 90
    const/16 v0, 0xff

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 98
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 99
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 101
    const/16 v0, 0x20

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Ljava/lang/Character;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 102
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 124
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 66
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 67
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 76
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 77
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 87
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 88
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 90
    const/16 v0, 0xff

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 125
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 126
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 127
    invoke-virtual {p0, p2}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 128
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/ITypeface;Lcom/mikepenz/iconics/typeface/IIcon;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "typeface"    # Lcom/mikepenz/iconics/typeface/ITypeface;
    .param p3, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 130
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 66
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 67
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 76
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 77
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 87
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 88
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 90
    const/16 v0, 0xff

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 131
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 132
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 133
    invoke-virtual {p0, p2, p3}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/ITypeface;Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 134
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/Character;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "icon"    # Ljava/lang/Character;

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 104
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 66
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 67
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 76
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 77
    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 87
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 88
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 90
    const/16 v0, 0xff

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 105
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 106
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 108
    invoke-virtual {p0, p2}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Ljava/lang/Character;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 109
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "icon"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 111
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 66
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 67
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 76
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 77
    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 87
    iput v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 88
    iput v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 90
    const/16 v2, 0xff

    iput v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 112
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iput-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    .line 113
    invoke-direct {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->prepare()V

    .line 116
    const/4 v2, 0x0

    const/4 v3, 0x3

    :try_start_20
    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/mikepenz/iconics/Iconics;->findFont(Landroid/content/Context;Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/ITypeface;

    move-result-object v1

    .line 117
    .local v1, "font":Lcom/mikepenz/iconics/typeface/ITypeface;
    const-string v2, "-"

    const-string v3, "_"

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 118
    invoke-interface {v1, p2}, Lcom/mikepenz/iconics/typeface/ITypeface;->getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_37} :catch_38

    .line 122
    .end local v1    # "font":Lcom/mikepenz/iconics/typeface/ITypeface;
    :goto_37
    return-void

    .line 119
    :catch_38
    move-exception v0

    .line 120
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

    goto :goto_37
.end method

.method private offsetIcon(Landroid/graphics/Rect;)V
    .registers 9
    .param p1, "viewBounds"    # Landroid/graphics/Rect;

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    .line 931
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    div-float/2addr v5, v6

    sub-float v2, v4, v5

    .line 932
    .local v2, "startX":F
    iget-object v4, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    sub-float v0, v2, v4

    .line 934
    .local v0, "offsetX":F
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    div-float/2addr v5, v6

    sub-float v3, v4, v5

    .line 935
    .local v3, "startY":F
    iget-object v4, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    sub-float v1, v3, v4

    .line 937
    .local v1, "offsetY":F
    iget-object v4, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget v5, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    int-to-float v5, v5

    add-float/2addr v5, v0

    iget v6, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    int-to-float v6, v6

    add-float/2addr v6, v1

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Path;->offset(FF)V

    .line 938
    return-void
.end method

.method private prepare()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 137
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0, v2}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    .line 138
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 139
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 140
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 141
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 143
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 145
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    .line 146
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 148
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    .line 150
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    .line 151
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPaddingBounds:Landroid/graphics/Rect;

    .line 152
    return-void
.end method

.method private updatePaddingBounds(Landroid/graphics/Rect;)V
    .registers 8
    .param p1, "viewBounds"    # Landroid/graphics/Rect;

    .prologue
    .line 890
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    if-ltz v0, :cond_31

    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    mul-int/lit8 v0, v0, 0x2

    .line 891
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-gt v0, v1, :cond_31

    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    mul-int/lit8 v0, v0, 0x2

    .line 892
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-gt v0, v1, :cond_31

    .line 893
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

    .line 899
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

    .line 907
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    const/high16 v3, 0x40000000    # 2.0f

    mul-float v10, v0, v3

    .line 908
    .local v10, "textSize":F
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v10}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 910
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    if-eqz v0, :cond_77

    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    invoke-interface {v0}, Lcom/mikepenz/iconics/typeface/IIcon;->getCharacter()C

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    .line 911
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

    .line 912
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v0, v3, v11}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 914
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPaddingBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    div-float v9, v0, v3

    .line 915
    .local v9, "deltaWidth":F
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPaddingBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float v8, v0, v3

    .line 916
    .local v8, "deltaHeight":F
    cmpg-float v0, v9, v8

    if-gez v0, :cond_7e

    move v7, v9

    .line 917
    .local v7, "delta":F
    :goto_59
    mul-float/2addr v10, v7

    .line 919
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v10}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 921
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    iget-object v6, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Paint;->getTextPath(Ljava/lang/String;IIFFLandroid/graphics/Path;)V

    .line 922
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPathBounds:Landroid/graphics/RectF;

    invoke-virtual {v0, v2, v11}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 923
    return-void

    .line 910
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

    .line 916
    goto :goto_59
.end method


# virtual methods
.method public actionBar()Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2

    .prologue
    .line 401
    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 402
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 403
    return-object p0
.end method

.method public actionBarSize()Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 392
    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public alpha(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 736
    invoke-virtual {p0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->setAlpha(I)V

    .line 737
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

    .line 544
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 545
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundColor:I

    .line 546
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 547
    iput v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 548
    return-object p0
.end method

.method public backgroundColorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "backgroundColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 558
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    return-object v0
.end method

.method public clearColorFilter()V
    .registers 3

    .prologue
    .line 856
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 857
    return-void
.end method

.method public clone()Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4

    .prologue
    .line 947
    new-instance v1, Lcom/mikepenz/iconics/IconicsDrawable;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;)V

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    .line 948
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 949
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersRxPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 950
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->roundedCornersRyPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 951
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePxX(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 952
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->sizePxY(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 953
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetXPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 954
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->iconOffsetYPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourColor:I

    .line 955
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->contourColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    .line 956
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->contourWidthPx(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundColor:I

    .line 957
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->backgroundColor(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconColor:I

    .line 958
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 959
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->alpha(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    .line 960
    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->drawContour(Z)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    .line 961
    invoke-virtual {v2}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->typeface(Landroid/graphics/Typeface;)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v0

    .line 963
    .local v0, "iconicsDrawable":Lcom/mikepenz/iconics/IconicsDrawable;
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    if-eqz v1, :cond_69

    .line 964
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 968
    :cond_68
    :goto_68
    return-object v0

    .line 965
    :cond_69
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    if-eqz v1, :cond_68

    .line 966
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->iconText(Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;

    goto :goto_68
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
    .line 231
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    .line 232
    .local v2, "red":I
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v1

    .line 233
    .local v1, "green":I
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    .line 234
    .local v0, "blue":I
    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-static {v2, v1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 235
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconColor:I

    .line 236
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->setAlpha(I)V

    .line 237
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 238
    return-object p0
.end method

.method public colorFilter(Landroid/graphics/ColorFilter;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 725
    invoke-virtual {p0, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 726
    return-object p0
.end method

.method public colorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 258
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
    .line 517
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    .line 518
    .local v2, "red":I
    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v1

    .line 519
    .local v1, "green":I
    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    .line 520
    .local v0, "blue":I
    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    invoke-static {v2, v1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 521
    iget-object v3, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 522
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourColor:I

    .line 523
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 524
    return-object p0
.end method

.method public contourColorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "contourColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 534
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
    .line 680
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
    .line 690
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    .line 691
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 692
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->drawContour(Z)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 693
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 694
    return-object p0
.end method

.method public contourWidthRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "contourWidthRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 670
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

    .line 765
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    if-nez v1, :cond_a

    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    if-eqz v1, :cond_5b

    .line 766
    :cond_a
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 768
    .local v0, "viewBounds":Landroid/graphics/Rect;
    invoke-direct {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->updatePaddingBounds(Landroid/graphics/Rect;)V

    .line 769
    invoke-direct {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->updateTextSize(Landroid/graphics/Rect;)V

    .line 770
    invoke-direct {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->offsetIcon(Landroid/graphics/Rect;)V

    .line 772
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    if-eqz v1, :cond_3d

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    if-le v1, v2, :cond_3d

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    if-le v1, v2, :cond_3d

    .line 773
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

    .line 776
    :cond_3d
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 778
    iget-boolean v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    if-eqz v1, :cond_4d

    .line 779
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 782
    :cond_4d
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 784
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 786
    .end local v0    # "viewBounds":Landroid/graphics/Rect;
    :cond_5b
    return-void
.end method

.method public drawContour(Z)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "drawContour"    # Z

    .prologue
    .line 704
    iget-boolean v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    if-eq v0, p1, :cond_14

    .line 705
    iput-boolean p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    .line 707
    iget-boolean v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    if-eqz v0, :cond_15

    .line 708
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    .line 713
    :goto_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 715
    :cond_14
    return-object p0

    .line 710
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
    .line 823
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    return v0
.end method

.method public getBackgroundColor()I
    .registers 2

    .prologue
    .line 280
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mBackgroundColor:I

    return v0
.end method

.method public getColor()I
    .registers 2

    .prologue
    .line 266
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconColor:I

    return v0
.end method

.method public getCompatAlpha()I
    .registers 2

    .prologue
    .line 846
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    return v0
.end method

.method public getContourColor()I
    .registers 2

    .prologue
    .line 273
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourColor:I

    return v0
.end method

.method public getIcon()Lcom/mikepenz/iconics/typeface/IIcon;
    .registers 2

    .prologue
    .line 830
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 806
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 801
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 811
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    return v0
.end method

.method public getPlainIcon()Ljava/lang/String;
    .registers 2

    .prologue
    .line 837
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    return-object v0
.end method

.method public icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 5
    .param p1, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 202
    iput-object p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 203
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    .line 204
    invoke-interface {p1}, Lcom/mikepenz/iconics/typeface/IIcon;->getTypeface()Lcom/mikepenz/iconics/typeface/ITypeface;

    move-result-object v0

    .line 205
    .local v0, "typeface":Lcom/mikepenz/iconics/typeface/ITypeface;
    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-interface {v0, v2}, Lcom/mikepenz/iconics/typeface/ITypeface;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 206
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 207
    return-object p0
.end method

.method protected icon(Lcom/mikepenz/iconics/typeface/ITypeface;Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 5
    .param p1, "typeface"    # Lcom/mikepenz/iconics/typeface/ITypeface;
    .param p2, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 218
    iput-object p2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 219
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-interface {p1, v1}, Lcom/mikepenz/iconics/typeface/ITypeface;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 220
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 221
    return-object p0
.end method

.method public icon(Ljava/lang/Character;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "icon"    # Ljava/lang/Character;

    .prologue
    .line 178
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
    .line 162
    :try_start_0
    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    const/4 v4, 0x3

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mikepenz/iconics/Iconics;->findFont(Landroid/content/Context;Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/ITypeface;

    move-result-object v1

    .line 163
    .local v1, "font":Lcom/mikepenz/iconics/typeface/ITypeface;
    const-string v2, "-"

    const-string v3, "_"

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 164
    invoke-interface {v1, p1}, Lcom/mikepenz/iconics/typeface/ITypeface;->getIcon(Ljava/lang/String;)Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_1c

    .line 168
    .end local v1    # "font":Lcom/mikepenz/iconics/typeface/ITypeface;
    :goto_1b
    return-object p0

    .line 165
    :catch_1c
    move-exception v0

    .line 166
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
    .line 300
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
    .line 310
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetX:I

    .line 311
    return-object p0
.end method

.method public iconOffsetXRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "iconOffsetXRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 290
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
    .line 331
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
    .line 341
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconOffsetY:I

    .line 342
    return-object p0
.end method

.method public iconOffsetYRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "iconOffsetYRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 321
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
    .line 188
    iput-object p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mPlainIcon:Ljava/lang/String;

    .line 189
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIcon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 190
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 191
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 192
    return-object p0
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 790
    const/4 v0, 0x1

    return v0
.end method

.method public paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "iconPadding"    # I

    .prologue
    .line 363
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
    .line 373
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    if-eq v0, p1, :cond_14

    .line 374
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    .line 375
    iget-boolean v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mDrawContour:Z

    if-eqz v0, :cond_11

    .line 376
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContourWidth:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPadding:I

    .line 379
    :cond_11
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 381
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
    .line 352
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
    .line 646
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 647
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 648
    return-object p0
.end method

.method public roundedCornersPx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "roundedCornerPx"    # I

    .prologue
    .line 658
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 659
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 660
    return-object p0
.end method

.method public roundedCornersRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "roundedCornerRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 634
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 635
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 636
    return-object p0
.end method

.method public roundedCornersRxDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "roundedCornerRxDp"    # I

    .prologue
    .line 579
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 580
    return-object p0
.end method

.method public roundedCornersRxPx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "roundedCornerRxPx"    # I

    .prologue
    .line 590
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 591
    return-object p0
.end method

.method public roundedCornersRxRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "roundedCornerRxRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 568
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRx:I

    .line 569
    return-object p0
.end method

.method public roundedCornersRyDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "roundedCornerRyDp"    # I

    .prologue
    .line 612
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    int-to-float v1, p1

    invoke-static {v0, v1}, Lcom/mikepenz/iconics/utils/Utils;->convertDpToPx(Landroid/content/Context;F)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 613
    return-object p0
.end method

.method public roundedCornersRyPx(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 2
    .param p1, "roundedCornerRyPx"    # I

    .prologue
    .line 623
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 624
    return-object p0
.end method

.method public roundedCornersRyRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "roundedCornerRyRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 601
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mRoundedCornerRy:I

    .line 602
    return-object p0
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 817
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 818
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    .line 819
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 851
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 852
    return-void
.end method

.method public setState([I)Z
    .registers 3
    .param p1, "stateSet"    # [I

    .prologue
    .line 795
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mAlpha:I

    invoke-virtual {p0, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->setAlpha(I)V

    .line 796
    const/4 v0, 0x1

    return v0
.end method

.method public sizeDp(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 4
    .param p1, "size"    # I

    .prologue
    .line 424
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
    .line 459
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
    .line 493
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

    .line 434
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 435
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 436
    invoke-virtual {p0, v0, v0, p1, p1}, Lcom/mikepenz/iconics/IconicsDrawable;->setBounds(IIII)V

    .line 437
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 438
    return-object p0
.end method

.method public sizePxX(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 5
    .param p1, "sizeX"    # I

    .prologue
    const/4 v2, 0x0

    .line 469
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    .line 470
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    invoke-virtual {p0, v2, v2, v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->setBounds(IIII)V

    .line 471
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 472
    return-object p0
.end method

.method public sizePxY(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 5
    .param p1, "sizeY"    # I

    .prologue
    const/4 v2, 0x0

    .line 503
    iput p1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    .line 504
    iget v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    iget v1, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    invoke-virtual {p0, v2, v2, v0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->setBounds(IIII)V

    .line 505
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->invalidateSelf()V

    .line 506
    return-object p0
.end method

.method public sizeRes(I)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "dimenRes"    # I
        .annotation build Landroid/support/annotation/DimenRes;
        .end annotation
    .end param

    .prologue
    .line 413
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
    .line 448
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
    .line 482
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
    .line 747
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 748
    return-object p0
.end method

.method public toBitmap()Landroid/graphics/Bitmap;
    .registers 7

    .prologue
    const/4 v5, 0x0

    const/4 v3, -0x1

    .line 865
    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeX:I

    if-eq v2, v3, :cond_a

    iget v2, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mSizeY:I

    if-ne v2, v3, :cond_d

    .line 866
    :cond_a
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->actionBar()Lcom/mikepenz/iconics/IconicsDrawable;

    .line 869
    :cond_d
    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/mikepenz/iconics/IconicsDrawable;->getIntrinsicHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 871
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p0, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->style(Landroid/graphics/Paint$Style;)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 873
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 874
    .local v1, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {v1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    invoke-virtual {p0, v5, v5, v2, v3}, Lcom/mikepenz/iconics/IconicsDrawable;->setBounds(IIII)V

    .line 875
    invoke-virtual {p0, v1}, Lcom/mikepenz/iconics/IconicsDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 877
    return-object v0
.end method

.method public typeface(Landroid/graphics/Typeface;)Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 3
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 759
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsDrawable;->mIconPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 760
    return-object p0
.end method
