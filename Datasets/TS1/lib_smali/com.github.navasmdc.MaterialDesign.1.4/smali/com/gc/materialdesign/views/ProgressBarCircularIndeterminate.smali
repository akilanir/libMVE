.class public Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;
.super Lcom/gc/materialdesign/views/CustomView;
.source "ProgressBarCircularIndeterminate.java"


# static fields
.field static final ANDROIDXML:Ljava/lang/String; = "http://schemas.android.com/apk/res/android"


# instance fields
.field arcD:I

.field arcO:I

.field backgroundColor:I

.field cont:I

.field firstAnimationOver:Z

.field limite:I

.field radius1:F

.field radius2:F

.field rotateAngle:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 24
    invoke-direct {p0, p1, p2}, Lcom/gc/materialdesign/views/CustomView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    const-string v0, "#1E88E5"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->backgroundColor:I

    .line 80
    iput v2, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius1:F

    .line 81
    iput v2, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius2:F

    .line 82
    iput v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->cont:I

    .line 83
    iput-boolean v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->firstAnimationOver:Z

    .line 120
    const/4 v0, 0x1

    iput v0, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcD:I

    .line 121
    iput v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcO:I

    .line 122
    iput v2, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->rotateAngle:F

    .line 123
    iput v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->limite:I

    .line 25
    invoke-virtual {p0, p2}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->setAttributes(Landroid/util/AttributeSet;)V

    .line 27
    return-void
.end method

.method private drawFirstAnimation(Landroid/graphics/Canvas;)V
    .registers 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v11, 0x0

    const/high16 v10, 0x40800000    # 4.0f

    const/high16 v9, 0x40000000    # 2.0f

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v7, 0x1

    .line 89
    iget v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius1:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    cmpg-float v4, v4, v5

    if-gez v4, :cond_51

    .line 90
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 91
    .local v1, "paint":Landroid/graphics/Paint;
    invoke-virtual {v1, v7}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 92
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->makePressColor()I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 93
    iget v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius1:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_4d

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v9

    :goto_37
    iput v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius1:F

    .line 94
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    iget v6, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius1:F

    invoke-virtual {p1, v4, v5, v6, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 118
    :cond_4c
    :goto_4c
    return-void

    .line 93
    :cond_4d
    iget v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius1:F

    add-float/2addr v4, v8

    goto :goto_37

    .line 96
    .end local v1    # "paint":Landroid/graphics/Paint;
    :cond_51
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v5

    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 97
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 98
    .local v2, "temp":Landroid/graphics/Canvas;
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 99
    .restart local v1    # "paint":Landroid/graphics/Paint;
    invoke-virtual {v1, v7}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 100
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->makePressColor()I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 101
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getHeight()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    int-to-float v6, v6

    invoke-virtual {v2, v4, v5, v6, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 102
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 103
    .local v3, "transparentPaint":Landroid/graphics/Paint;
    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 104
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x106000d

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 105
    new-instance v4, Landroid/graphics/PorterDuffXfermode;

    sget-object v5, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v4, v5}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 106
    iget v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->cont:I

    const/16 v5, 0x32

    if-lt v4, v5, :cond_112

    .line 107
    iget v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius2:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_10e

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v9

    :goto_c4
    iput v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius2:F

    .line 111
    :goto_c6
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    iget v6, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius2:F

    invoke-virtual {v2, v4, v5, v6, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 112
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    invoke-virtual {p1, v0, v11, v11, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 113
    iget v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius2:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-static {v10, v6}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_fd

    .line 114
    iget v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->cont:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->cont:I

    .line 115
    :cond_fd
    iget v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius2:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_4c

    .line 116
    iput-boolean v7, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->firstAnimationOver:Z

    goto/16 :goto_4c

    .line 107
    :cond_10e
    iget v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius2:F

    add-float/2addr v4, v8

    goto :goto_c4

    .line 109
    :cond_112
    iget v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius2:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-static {v10, v6}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v6

    sub-int/2addr v5, v6

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_13b

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v9

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v10, v5}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v4, v5

    :goto_138
    iput v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius2:F

    goto :goto_c6

    :cond_13b
    iget v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->radius2:F

    add-float/2addr v4, v8

    goto :goto_138
.end method

.method private drawSecondAnimation(Landroid/graphics/Canvas;)V
    .registers 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v9, 0x40800000    # 4.0f

    const/4 v4, 0x1

    const/4 v8, 0x0

    .line 129
    iget v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcO:I

    iget v2, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->limite:I

    if-ne v1, v2, :cond_10

    .line 130
    iget v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcD:I

    add-int/lit8 v1, v1, 0x6

    iput v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcD:I

    .line 131
    :cond_10
    iget v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcD:I

    const/16 v2, 0x122

    if-ge v1, v2, :cond_1c

    iget v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcO:I

    iget v2, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->limite:I

    if-le v1, v2, :cond_28

    .line 132
    :cond_1c
    iget v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcO:I

    add-int/lit8 v1, v1, 0x6

    iput v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcO:I

    .line 133
    iget v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcD:I

    add-int/lit8 v1, v1, -0x6

    iput v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcD:I

    .line 135
    :cond_28
    iget v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcO:I

    iget v2, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->limite:I

    add-int/lit16 v2, v2, 0x122

    if-le v1, v2, :cond_3a

    .line 136
    iget v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcO:I

    iput v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->limite:I

    .line 137
    iget v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->limite:I

    iput v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcO:I

    .line 138
    iput v4, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcD:I

    .line 140
    :cond_3a
    iget v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->rotateAngle:F

    add-float/2addr v1, v9

    iput v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->rotateAngle:F

    .line 141
    iget v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->rotateAngle:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 143
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 144
    .local v6, "bitmap":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v6}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 145
    .local v0, "temp":Landroid/graphics/Canvas;
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    .line 146
    .local v5, "paint":Landroid/graphics/Paint;
    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 147
    iget v1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->backgroundColor:I

    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 149
    new-instance v1, Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-direct {v1, v8, v8, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget v2, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcO:I

    int-to-float v2, v2

    iget v3, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->arcD:I

    int-to-float v3, v3

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 150
    new-instance v7, Landroid/graphics/Paint;

    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    .line 151
    .local v7, "transparentPaint":Landroid/graphics/Paint;
    invoke-virtual {v7, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 152
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x106000d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 153
    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v7, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 154
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v9, v4}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    invoke-virtual {v0, v1, v2, v3, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 156
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    invoke-virtual {p1, v6, v8, v8, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 157
    return-void
.end method


# virtual methods
.method protected makePressColor()I
    .registers 5

    .prologue
    .line 59
    iget v3, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->backgroundColor:I

    shr-int/lit8 v3, v3, 0x10

    and-int/lit16 v2, v3, 0xff

    .line 60
    .local v2, "r":I
    iget v3, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->backgroundColor:I

    shr-int/lit8 v3, v3, 0x8

    and-int/lit16 v1, v3, 0xff

    .line 61
    .local v1, "g":I
    iget v3, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->backgroundColor:I

    shr-int/lit8 v3, v3, 0x0

    and-int/lit16 v0, v3, 0xff

    .line 65
    .local v0, "b":I
    const/16 v3, 0x80

    invoke-static {v3, v2, v1, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    return v3
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 71
    invoke-super {p0, p1}, Lcom/gc/materialdesign/views/CustomView;->onDraw(Landroid/graphics/Canvas;)V

    .line 72
    iget-boolean v0, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->firstAnimationOver:Z

    if-nez v0, :cond_a

    .line 73
    invoke-direct {p0, p1}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->drawFirstAnimation(Landroid/graphics/Canvas;)V

    .line 74
    :cond_a
    iget v0, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->cont:I

    if-lez v0, :cond_11

    .line 75
    invoke-direct {p0, p1}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->drawSecondAnimation(Landroid/graphics/Canvas;)V

    .line 76
    :cond_11
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->invalidate()V

    .line 78
    return-void
.end method

.method protected setAttributes(Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/high16 v3, 0x42000000    # 32.0f

    const/4 v4, -0x1

    .line 32
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->setMinimumHeight(I)V

    .line 33
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->setMinimumWidth(I)V

    .line 37
    const-string v2, "http://schemas.android.com/apk/res/android"

    const-string v3, "background"

    invoke-interface {p1, v2, v3, v4}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 38
    .local v0, "bacgroundColor":I
    if-eq v0, v4, :cond_3c

    .line 39
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->setBackgroundColor(I)V

    .line 49
    :goto_2e
    const/high16 v2, 0x40400000    # 3.0f

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->setMinimumHeight(I)V

    .line 52
    return-void

    .line 42
    :cond_3c
    const-string v2, "http://schemas.android.com/apk/res/android"

    const-string v3, "background"

    invoke-interface {p1, v2, v3, v4}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 43
    .local v1, "background":I
    if-eq v1, v4, :cond_4a

    .line 44
    invoke-virtual {p0, v1}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->setBackgroundColor(I)V

    goto :goto_2e

    .line 46
    :cond_4a
    const-string v2, "#1E88E5"

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->setBackgroundColor(I)V

    goto :goto_2e
.end method

.method public setBackgroundColor(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-super {p0, v0}, Lcom/gc/materialdesign/views/CustomView;->setBackgroundColor(I)V

    .line 166
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 167
    iget v0, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->backgroundColor:I

    iput v0, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->beforeBackground:I

    .line 168
    :cond_18
    iput p1, p0, Lcom/gc/materialdesign/views/ProgressBarCircularIndeterminate;->backgroundColor:I

    .line 169
    return-void
.end method
