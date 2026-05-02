.class public Landroid/support/v7/internal/widget/ProgressBarCompat;
.super Landroid/view/View;
.source "ProgressBarCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/internal/widget/ProgressBarCompat$1;,
        Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;,
        Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;
    }
.end annotation


# static fields
.field private static final ANIMATION_RESOLUTION:I = 0xc8

.field private static final MAX_LEVEL:I = 0x2710

.field private static final android_R_styleable_ProgressBar:[I


# instance fields
.field private mAnimation:Landroid/view/animation/AlphaAnimation;

.field private mBehavior:I

.field private mCurrentDrawable:Landroid/graphics/drawable/Drawable;

.field private mDuration:I

.field private mInDrawing:Z

.field private mIndeterminate:Z

.field private mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mLastDrawTime:J

.field private mMax:I

.field mMaxHeight:I

.field mMaxWidth:I

.field mMinHeight:I

.field mMinWidth:I

.field private mNoInvalidate:Z

.field private mOnlyIndeterminate:Z

.field private mProgress:I

.field private mProgressDrawable:Landroid/graphics/drawable/Drawable;

.field private mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;

.field mSampleTile:Landroid/graphics/Bitmap;

.field private mSecondaryProgress:I

.field private mShouldStartAnimationDrawable:Z

.field private mTransformation:Landroid/view/animation/Transformation;

.field private mUiThreadId:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 61
    const/16 v0, 0xe

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Landroid/support/v7/internal/widget/ProgressBarCompat;->android_R_styleable_ProgressBar:[I

    return-void

    :array_a
    .array-data 4
        0x1010136
        0x1010137
        0x1010138
        0x1010139
        0x101013a
        0x101013b
        0x101013c
        0x101013d
        0x101013e
        0x101013f
        0x101011f
        0x1010140
        0x1010120
        0x1010141
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .param p4, "styleRes"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 110
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 111
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    iput-wide v6, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mUiThreadId:J

    .line 112
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->initProgressBar()V

    .line 114
    sget-object v6, Landroid/support/v7/internal/widget/ProgressBarCompat;->android_R_styleable_ProgressBar:[I

    invoke-virtual {p1, p2, v6, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 117
    .local v0, "a":Landroid/content/res/TypedArray;
    iput-boolean v5, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mNoInvalidate:Z

    .line 119
    iget v6, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMax:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    invoke-virtual {p0, v6}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setMax(I)V

    .line 120
    iget v6, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgress:I

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    invoke-virtual {p0, v6}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setProgress(I)V

    .line 121
    const/4 v6, 0x2

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mSecondaryProgress:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    invoke-virtual {p0, v6}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setSecondaryProgress(I)V

    .line 123
    const/4 v6, 0x3

    iget-boolean v7, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    .line 124
    .local v2, "indeterminate":Z
    const/4 v6, 0x4

    iget-boolean v7, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mOnlyIndeterminate:Z

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    iput-boolean v6, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mOnlyIndeterminate:Z

    .line 126
    const/4 v6, 0x5

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 127
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_54

    .line 128
    invoke-direct {p0, v1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->tileifyIndeterminate(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 129
    invoke-virtual {p0, v1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 132
    :cond_54
    const/4 v6, 0x6

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 133
    if-eqz v1, :cond_62

    .line 134
    invoke-direct {p0, v1, v4}, Landroid/support/v7/internal/widget/ProgressBarCompat;->tileify(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 137
    invoke-virtual {p0, v1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 140
    :cond_62
    const/4 v6, 0x7

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mDuration:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    iput v6, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mDuration:I

    .line 141
    const/16 v6, 0x8

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mBehavior:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    iput v6, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mBehavior:I

    .line 142
    const/16 v6, 0x9

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMinWidth:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMinWidth:I

    .line 143
    const/16 v6, 0xa

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMaxWidth:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMaxWidth:I

    .line 144
    const/16 v6, 0xb

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMinHeight:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMinHeight:I

    .line 145
    const/16 v6, 0xc

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMaxHeight:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMaxHeight:I

    .line 147
    const/16 v6, 0xd

    const v7, 0x10a000b

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    .line 148
    .local v3, "resID":I
    if-lez v3, :cond_ab

    .line 149
    invoke-virtual {p0, p1, v3}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setInterpolator(Landroid/content/Context;I)V

    .line 152
    :cond_ab
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 154
    iput-boolean v4, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mNoInvalidate:Z

    .line 155
    iget-boolean v6, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mOnlyIndeterminate:Z

    if-nez v6, :cond_b6

    if-eqz v2, :cond_b7

    :cond_b6
    move v4, v5

    :cond_b7
    invoke-virtual {p0, v4}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setIndeterminate(Z)V

    .line 156
    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/internal/widget/ProgressBarCompat;IIZZ)V
    .registers 5
    .param p0, "x0"    # Landroid/support/v7/internal/widget/ProgressBarCompat;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # Z
    .param p4, "x4"    # Z

    .prologue
    .line 53
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/internal/widget/ProgressBarCompat;->doRefreshProgress(IIZZ)V

    return-void
.end method

.method static synthetic access$102(Landroid/support/v7/internal/widget/ProgressBarCompat;Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;)Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/widget/ProgressBarCompat;
    .param p1, "x1"    # Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;

    .prologue
    .line 53
    iput-object p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;

    return-object p1
.end method

.method private declared-synchronized doRefreshProgress(IIZZ)V
    .registers 12
    .param p1, "id"    # I
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z
    .param p4, "callBackToApp"    # Z

    .prologue
    .line 419
    monitor-enter p0

    :try_start_1
    iget v5, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMax:I

    if-lez v5, :cond_28

    int-to-float v5, p2

    iget v6, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMax:I

    int-to-float v6, v6

    div-float v4, v5, v6

    .line 420
    .local v4, "scale":F
    :goto_b
    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 421
    .local v1, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_2c

    .line 422
    const/4 v3, 0x0

    .line 424
    .local v3, "progressDrawable":Landroid/graphics/drawable/Drawable;
    instance-of v5, v1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v5, :cond_1c

    .line 425
    move-object v0, v1

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    move-object v5, v0

    invoke-virtual {v5, p1}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 428
    :cond_1c
    const v5, 0x461c4000    # 10000.0f

    mul-float/2addr v5, v4

    float-to-int v2, v5

    .line 429
    .local v2, "level":I
    if-eqz v3, :cond_2a

    .end local v3    # "progressDrawable":Landroid/graphics/drawable/Drawable;
    :goto_23
    invoke-virtual {v3, v2}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z
    :try_end_26
    .catchall {:try_start_1 .. :try_end_26} :catchall_30

    .line 433
    .end local v2    # "level":I
    :goto_26
    monitor-exit p0

    return-void

    .line 419
    .end local v1    # "d":Landroid/graphics/drawable/Drawable;
    .end local v4    # "scale":F
    :cond_28
    const/4 v4, 0x0

    goto :goto_b

    .restart local v1    # "d":Landroid/graphics/drawable/Drawable;
    .restart local v2    # "level":I
    .restart local v3    # "progressDrawable":Landroid/graphics/drawable/Drawable;
    .restart local v4    # "scale":F
    :cond_2a
    move-object v3, v1

    .line 429
    goto :goto_23

    .line 431
    .end local v2    # "level":I
    .end local v3    # "progressDrawable":Landroid/graphics/drawable/Drawable;
    :cond_2c
    :try_start_2c
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->invalidate()V
    :try_end_2f
    .catchall {:try_start_2c .. :try_end_2f} :catchall_30

    goto :goto_26

    .line 419
    .end local v1    # "d":Landroid/graphics/drawable/Drawable;
    .end local v4    # "scale":F
    :catchall_30
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method private initProgressBar()V
    .registers 5

    .prologue
    const/16 v3, 0x30

    const/16 v2, 0x18

    const/4 v1, 0x0

    .line 243
    const/16 v0, 0x64

    iput v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMax:I

    .line 244
    iput v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgress:I

    .line 245
    iput v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mSecondaryProgress:I

    .line 246
    iput-boolean v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z

    .line 247
    iput-boolean v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mOnlyIndeterminate:Z

    .line 248
    const/16 v0, 0xfa0

    iput v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mDuration:I

    .line 249
    const/4 v0, 0x1

    iput v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mBehavior:I

    .line 250
    iput v2, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMinWidth:I

    .line 251
    iput v3, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMaxWidth:I

    .line 252
    iput v2, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMinHeight:I

    .line 253
    iput v3, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMaxHeight:I

    .line 254
    return-void
.end method

.method private declared-synchronized refreshProgress(IIZ)V
    .registers 9
    .param p1, "id"    # I
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 436
    monitor-enter p0

    :try_start_1
    iget-wide v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mUiThreadId:J

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_15

    .line 437
    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, p3, v1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->doRefreshProgress(IIZZ)V
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_25

    .line 452
    :goto_13
    monitor-exit p0

    return-void

    .line 440
    :cond_15
    :try_start_15
    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;

    if-eqz v1, :cond_28

    .line 442
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;

    .line 444
    .local v0, "r":Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;

    .line 445
    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;->setup(IIZ)V

    .line 450
    :goto_21
    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->post(Ljava/lang/Runnable;)Z
    :try_end_24
    .catchall {:try_start_15 .. :try_end_24} :catchall_25

    goto :goto_13

    .line 436
    .end local v0    # "r":Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;
    :catchall_25
    move-exception v1

    monitor-exit p0

    throw v1

    .line 448
    :cond_28
    :try_start_28
    new-instance v0, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;

    invoke-direct {v0, p0, p1, p2, p3}, Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;-><init>(Landroid/support/v7/internal/widget/ProgressBarCompat;IIZ)V
    :try_end_2d
    .catchall {:try_start_28 .. :try_end_2d} :catchall_25

    .restart local v0    # "r":Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;
    goto :goto_21
.end method

.method private tileify(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;
    .registers 15
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "clip"    # Z

    .prologue
    const/4 v10, 0x1

    .line 164
    instance-of v9, p1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v9, :cond_41

    move-object v1, p1

    .line 165
    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    .line 166
    .local v1, "background":Landroid/graphics/drawable/LayerDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v0

    .line 167
    .local v0, "N":I
    new-array v6, v0, [Landroid/graphics/drawable/Drawable;

    .line 169
    .local v6, "outDrawables":[Landroid/graphics/drawable/Drawable;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_f
    if-ge v3, v0, :cond_2f

    .line 170
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    move-result v4

    .line 171
    .local v4, "id":I
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v11

    const v9, 0x102000d

    if-eq v4, v9, :cond_23

    const v9, 0x102000f

    if-ne v4, v9, :cond_2d

    :cond_23
    move v9, v10

    :goto_24
    invoke-direct {p0, v11, v9}, Landroid/support/v7/internal/widget/ProgressBarCompat;->tileify(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    aput-object v9, v6, v3

    .line 169
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 171
    :cond_2d
    const/4 v9, 0x0

    goto :goto_24

    .line 175
    .end local v4    # "id":I
    :cond_2f
    new-instance v5, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v5, v6}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 177
    .local v5, "newBg":Landroid/graphics/drawable/LayerDrawable;
    const/4 v3, 0x0

    :goto_35
    if-ge v3, v0, :cond_74

    .line 178
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    move-result v9

    invoke-virtual {v5, v3, v9}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    .line 177
    add-int/lit8 v3, v3, 0x1

    goto :goto_35

    .line 183
    .end local v0    # "N":I
    .end local v1    # "background":Landroid/graphics/drawable/LayerDrawable;
    .end local v3    # "i":I
    .end local v5    # "newBg":Landroid/graphics/drawable/LayerDrawable;
    .end local v6    # "outDrawables":[Landroid/graphics/drawable/Drawable;
    :cond_41
    instance-of v9, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v9, :cond_75

    .line 184
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .end local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v8

    .line 185
    .local v8, "tileBitmap":Landroid/graphics/Bitmap;
    iget-object v9, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mSampleTile:Landroid/graphics/Bitmap;

    if-nez v9, :cond_51

    .line 186
    iput-object v8, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mSampleTile:Landroid/graphics/Bitmap;

    .line 189
    :cond_51
    new-instance v7, Landroid/graphics/drawable/ShapeDrawable;

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getDrawableShape()Landroid/graphics/drawable/shapes/Shape;

    move-result-object v9

    invoke-direct {v7, v9}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 191
    .local v7, "shapeDrawable":Landroid/graphics/drawable/ShapeDrawable;
    new-instance v2, Landroid/graphics/BitmapShader;

    sget-object v9, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    sget-object v11, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v2, v8, v9, v11}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 193
    .local v2, "bitmapShader":Landroid/graphics/BitmapShader;
    invoke-virtual {v7}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v9

    invoke-virtual {v9, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 195
    if-eqz p2, :cond_73

    new-instance v9, Landroid/graphics/drawable/ClipDrawable;

    const/4 v11, 0x3

    invoke-direct {v9, v7, v11, v10}, Landroid/graphics/drawable/ClipDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V

    move-object v7, v9

    .end local v7    # "shapeDrawable":Landroid/graphics/drawable/ShapeDrawable;
    :cond_73
    move-object v5, v7

    .line 199
    .end local v2    # "bitmapShader":Landroid/graphics/BitmapShader;
    .end local v8    # "tileBitmap":Landroid/graphics/Bitmap;
    :cond_74
    :goto_74
    return-object v5

    .restart local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_75
    move-object v5, p1

    goto :goto_74
.end method

.method private tileifyIndeterminate(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 10
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/16 v7, 0x2710

    .line 213
    instance-of v5, p1, Landroid/graphics/drawable/AnimationDrawable;

    if-eqz v5, :cond_36

    move-object v1, p1

    .line 214
    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    .line 215
    .local v1, "background":Landroid/graphics/drawable/AnimationDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->getNumberOfFrames()I

    move-result v0

    .line 216
    .local v0, "N":I
    new-instance v4, Landroid/graphics/drawable/AnimationDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/AnimationDrawable;-><init>()V

    .line 217
    .local v4, "newBg":Landroid/graphics/drawable/AnimationDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->isOneShot()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/AnimationDrawable;->setOneShot(Z)V

    .line 219
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1a
    if-ge v3, v0, :cond_32

    .line 220
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/AnimationDrawable;->getFrame(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    const/4 v6, 0x1

    invoke-direct {p0, v5, v6}, Landroid/support/v7/internal/widget/ProgressBarCompat;->tileify(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 221
    .local v2, "frame":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v2, v7}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 222
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/AnimationDrawable;->getDuration(I)I

    move-result v5

    invoke-virtual {v4, v2, v5}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 219
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    .line 224
    .end local v2    # "frame":Landroid/graphics/drawable/Drawable;
    :cond_32
    invoke-virtual {v4, v7}, Landroid/graphics/drawable/AnimationDrawable;->setLevel(I)Z

    .line 225
    move-object p1, v4

    .line 227
    .end local v0    # "N":I
    .end local v1    # "background":Landroid/graphics/drawable/AnimationDrawable;
    .end local v3    # "i":I
    .end local v4    # "newBg":Landroid/graphics/drawable/AnimationDrawable;
    :cond_36
    return-object p1
.end method

.method private updateDrawableBounds(II)V
    .registers 16
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    const/4 v12, 0x0

    .line 735
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getPaddingRight()I

    move-result v10

    sub-int v10, p1, v10

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getPaddingLeft()I

    move-result v11

    sub-int v7, v10, v11

    .line 736
    .local v7, "right":I
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getPaddingBottom()I

    move-result v10

    sub-int v10, p2, v10

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getPaddingTop()I

    move-result v11

    sub-int v0, v10, v11

    .line 737
    .local v0, "bottom":I
    const/4 v8, 0x0

    .line 738
    .local v8, "top":I
    const/4 v6, 0x0

    .line 740
    .local v6, "left":I
    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v10, :cond_53

    .line 742
    iget-boolean v10, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mOnlyIndeterminate:Z

    if-eqz v10, :cond_4e

    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v10, v10, Landroid/graphics/drawable/AnimationDrawable;

    if-nez v10, :cond_4e

    .line 745
    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    .line 746
    .local v5, "intrinsicWidth":I
    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    .line 747
    .local v4, "intrinsicHeight":I
    int-to-float v10, v5

    int-to-float v11, v4

    div-float v3, v10, v11

    .line 748
    .local v3, "intrinsicAspect":F
    int-to-float v10, p1

    int-to-float v11, p2

    div-float v1, v10, v11

    .line 749
    .local v1, "boundAspect":F
    cmpl-float v10, v3, v1

    if-eqz v10, :cond_4e

    .line 750
    cmpl-float v10, v1, v3

    if-lez v10, :cond_5d

    .line 752
    int-to-float v10, p2

    mul-float/2addr v10, v3

    float-to-int v9, v10

    .line 753
    .local v9, "width":I
    sub-int v10, p1, v9

    div-int/lit8 v6, v10, 0x2

    .line 754
    add-int v7, v6, v9

    .line 763
    .end local v1    # "boundAspect":F
    .end local v3    # "intrinsicAspect":F
    .end local v4    # "intrinsicHeight":I
    .end local v5    # "intrinsicWidth":I
    .end local v9    # "width":I
    :cond_4e
    :goto_4e
    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10, v6, v8, v7, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 766
    :cond_53
    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v10, :cond_5c

    .line 767
    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10, v12, v12, v7, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 769
    :cond_5c
    return-void

    .line 757
    .restart local v1    # "boundAspect":F
    .restart local v3    # "intrinsicAspect":F
    .restart local v4    # "intrinsicHeight":I
    .restart local v5    # "intrinsicWidth":I
    :cond_5d
    int-to-float v10, p1

    const/high16 v11, 0x3f800000    # 1.0f

    div-float/2addr v11, v3

    mul-float/2addr v10, v11

    float-to-int v2, v10

    .line 758
    .local v2, "height":I
    sub-int v10, p2, v2

    div-int/lit8 v8, v10, 0x2

    .line 759
    add-int v0, v8, v2

    goto :goto_4e
.end method

.method private updateDrawableState()V
    .registers 3

    .prologue
    .line 830
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getDrawableState()[I

    move-result-object v0

    .line 832
    .local v0, "state":[I
    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_15

    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 833
    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 836
    :cond_15
    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_26

    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 837
    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 839
    :cond_26
    return-void
.end method


# virtual methods
.method protected drawableStateChanged()V
    .registers 1

    .prologue
    .line 825
    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    .line 826
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->updateDrawableState()V

    .line 827
    return-void
.end method

.method getDrawableShape()Landroid/graphics/drawable/shapes/Shape;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 203
    const/16 v1, 0x8

    new-array v0, v1, [F

    fill-array-data v0, :array_e

    .line 204
    .local v0, "roundedCorners":[F
    new-instance v1, Landroid/graphics/drawable/shapes/RoundRectShape;

    invoke-direct {v1, v0, v2, v2}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    return-object v1

    .line 203
    :array_e
    .array-data 4
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
    .end array-data
.end method

.method public getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 300
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getInterpolator()Landroid/view/animation/Interpolator;
    .registers 2

    .prologue
    .line 677
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method public declared-synchronized getMax()I
    .registers 2

    .prologue
    .line 561
    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMax:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getProgress()I
    .registers 2

    .prologue
    .line 532
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_b

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    :try_start_8
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgress:I
    :try_end_a
    .catchall {:try_start_8 .. :try_end_a} :catchall_b

    goto :goto_6

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getProgressDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 333
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public declared-synchronized getSecondaryProgress()I
    .registers 2

    .prologue
    .line 548
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_b

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    :try_start_8
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mSecondaryProgress:I
    :try_end_a
    .catchall {:try_start_8 .. :try_end_a} :catchall_b

    goto :goto_6

    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized incrementProgressBy(I)V
    .registers 3
    .param p1, "diff"    # I

    .prologue
    .line 596
    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgress:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setProgress(I)V
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 597
    monitor-exit p0

    return-void

    .line 596
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized incrementSecondaryProgressBy(I)V
    .registers 3
    .param p1, "diff"    # I

    .prologue
    .line 607
    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mSecondaryProgress:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setSecondaryProgress(I)V
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 608
    monitor-exit p0

    return-void

    .line 607
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 9
    .param p1, "dr"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 714
    iget-boolean v3, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mInDrawing:Z

    if-nez v3, :cond_31

    .line 715
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v3

    if-eqz v3, :cond_32

    .line 716
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 717
    .local v0, "dirty":Landroid/graphics/Rect;
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getScrollX()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getPaddingLeft()I

    move-result v4

    add-int v1, v3, v4

    .line 718
    .local v1, "scrollX":I
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getScrollY()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getPaddingTop()I

    move-result v4

    add-int v2, v3, v4

    .line 720
    .local v2, "scrollY":I
    iget v3, v0, Landroid/graphics/Rect;->left:I

    add-int/2addr v3, v1

    iget v4, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v4, v2

    iget v5, v0, Landroid/graphics/Rect;->right:I

    add-int/2addr v5, v1

    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v6, v2

    invoke-virtual {p0, v3, v4, v5, v6}, Landroid/support/v7/internal/widget/ProgressBarCompat;->invalidate(IIII)V

    .line 726
    .end local v0    # "dirty":Landroid/graphics/Rect;
    .end local v1    # "scrollX":I
    .end local v2    # "scrollY":I
    :cond_31
    :goto_31
    return-void

    .line 723
    :cond_32
    invoke-super {p0, p1}, Landroid/view/View;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_31
.end method

.method public declared-synchronized isIndeterminate()Z
    .registers 2

    .prologue
    .line 262
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 903
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 904
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z

    if-eqz v0, :cond_a

    .line 905
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->startAnimation()V

    .line 907
    :cond_a
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 911
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z

    if-eqz v0, :cond_7

    .line 912
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->stopAnimation()V

    .line 914
    :cond_7
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;

    if-eqz v0, :cond_10

    .line 915
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarCompat$RefreshProgressRunnable;

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 920
    :cond_10
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 921
    return-void
.end method

.method protected declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .registers 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const-wide/16 v8, 0xc8

    .line 773
    monitor-enter p0

    :try_start_3
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 775
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 776
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_69

    .line 779
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 780
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getPaddingLeft()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getPaddingTop()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 781
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getDrawingTime()J

    move-result-wide v2

    .line 782
    .local v2, "time":J
    iget-object v4, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mAnimation:Landroid/view/animation/AlphaAnimation;

    if-eqz v4, :cond_53

    .line 783
    iget-object v4, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mAnimation:Landroid/view/animation/AlphaAnimation;

    iget-object v5, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v4, v2, v3, v5}, Landroid/view/animation/AlphaAnimation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    .line 784
    iget-object v4, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v4}, Landroid/view/animation/Transformation;->getAlpha()F
    :try_end_2e
    .catchall {:try_start_3 .. :try_end_2e} :catchall_70

    move-result v1

    .line 786
    .local v1, "scale":F
    const/4 v4, 0x1

    :try_start_30
    iput-boolean v4, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mInDrawing:Z

    .line 787
    const v4, 0x461c4000    # 10000.0f

    mul-float/2addr v4, v1

    float-to-int v4, v4

    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z
    :try_end_3a
    .catchall {:try_start_30 .. :try_end_3a} :catchall_6b

    .line 789
    const/4 v4, 0x0

    :try_start_3b
    iput-boolean v4, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mInDrawing:Z

    .line 791
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mLastDrawTime:J

    sub-long/2addr v4, v6

    cmp-long v4, v4, v8

    if-ltz v4, :cond_53

    .line 792
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mLastDrawTime:J

    .line 793
    const-wide/16 v4, 0xc8

    invoke-virtual {p0, v4, v5}, Landroid/support/v7/internal/widget/ProgressBarCompat;->postInvalidateDelayed(J)V

    .line 796
    .end local v1    # "scale":F
    :cond_53
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 797
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 798
    iget-boolean v4, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mShouldStartAnimationDrawable:Z

    if-eqz v4, :cond_69

    instance-of v4, v0, Landroid/graphics/drawable/Animatable;

    if-eqz v4, :cond_69

    .line 799
    check-cast v0, Landroid/graphics/drawable/Animatable;

    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->start()V

    .line 800
    const/4 v4, 0x0

    iput-boolean v4, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mShouldStartAnimationDrawable:Z
    :try_end_69
    .catchall {:try_start_3b .. :try_end_69} :catchall_70

    .line 803
    .end local v2    # "time":J
    :cond_69
    monitor-exit p0

    return-void

    .line 789
    .restart local v0    # "d":Landroid/graphics/drawable/Drawable;
    .restart local v1    # "scale":F
    .restart local v2    # "time":J
    :catchall_6b
    move-exception v4

    const/4 v5, 0x0

    :try_start_6d
    iput-boolean v5, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mInDrawing:Z

    throw v4
    :try_end_70
    .catchall {:try_start_6d .. :try_end_70} :catchall_70

    .line 773
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    .end local v1    # "scale":F
    .end local v2    # "time":J
    :catchall_70
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method protected declared-synchronized onMeasure(II)V
    .registers 9
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 807
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 809
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    const/4 v2, 0x0

    .line 810
    .local v2, "dw":I
    const/4 v1, 0x0

    .line 811
    .local v1, "dh":I
    if-eqz v0, :cond_27

    .line 812
    iget v3, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMinWidth:I

    iget v4, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMaxWidth:I

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 813
    iget v3, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMinHeight:I

    iget v4, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMaxHeight:I

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 815
    :cond_27
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->updateDrawableState()V

    .line 816
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getPaddingLeft()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getPaddingRight()I

    move-result v4

    add-int/2addr v3, v4

    add-int/2addr v2, v3

    .line 817
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getPaddingTop()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getPaddingBottom()I

    move-result v4

    add-int/2addr v3, v4

    add-int/2addr v1, v3

    .line 819
    invoke-static {v2, p1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->resolveSize(II)I

    move-result v3

    invoke-static {v1, p2}, Landroid/support/v7/internal/widget/ProgressBarCompat;->resolveSize(II)I

    move-result v4

    invoke-virtual {p0, v3, v4}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setMeasuredDimension(II)V
    :try_end_49
    .catchall {:try_start_1 .. :try_end_49} :catchall_4b

    .line 821
    monitor-exit p0

    return-void

    .line 807
    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    .end local v1    # "dh":I
    .end local v2    # "dw":I
    :catchall_4b
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 894
    move-object v0, p1

    check-cast v0, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;

    .line 895
    .local v0, "ss":Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 897
    iget v1, v0, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;->progress:I

    invoke-virtual {p0, v1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setProgress(I)V

    .line 898
    iget v1, v0, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;->secondaryProgress:I

    invoke-virtual {p0, v1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setSecondaryProgress(I)V

    .line 899
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 883
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 884
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;

    invoke-direct {v0, v1}, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 886
    .local v0, "ss":Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;
    iget v2, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgress:I

    iput v2, v0, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;->progress:I

    .line 887
    iget v2, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mSecondaryProgress:I

    iput v2, v0, Landroid/support/v7/internal/widget/ProgressBarCompat$SavedState;->secondaryProgress:I

    .line 889
    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .registers 5
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 730
    invoke-direct {p0, p1, p2}, Landroid/support/v7/internal/widget/ProgressBarCompat;->updateDrawableBounds(II)V

    .line 731
    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .registers 5
    .param p1, "changedView"    # Landroid/view/View;
    .param p2, "visibility"    # I

    .prologue
    const/16 v1, 0x8

    .line 698
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v1, :cond_9

    .line 699
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 702
    :cond_9
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z

    if-eqz v0, :cond_15

    .line 704
    if-eq p2, v1, :cond_12

    const/4 v0, 0x4

    if-ne p2, v0, :cond_16

    .line 705
    :cond_12
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->stopAnimation()V

    .line 710
    :cond_15
    :goto_15
    return-void

    .line 707
    :cond_16
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->startAnimation()V

    goto :goto_15
.end method

.method public postInvalidate()V
    .registers 2

    .prologue
    .line 386
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mNoInvalidate:Z

    if-nez v0, :cond_7

    .line 387
    invoke-super {p0}, Landroid/view/View;->postInvalidate()V

    .line 389
    :cond_7
    return-void
.end method

.method public declared-synchronized setIndeterminate(Z)V
    .registers 3
    .param p1, "indeterminate"    # Z

    .prologue
    .line 276
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mOnlyIndeterminate:Z

    if-eqz v0, :cond_9

    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z

    if-nez v0, :cond_18

    :cond_9
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z

    if-eq p1, v0, :cond_18

    .line 277
    iput-boolean p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z

    .line 279
    if-eqz p1, :cond_1a

    .line 281
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 282
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->startAnimation()V
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_22

    .line 288
    :cond_18
    :goto_18
    monitor-exit p0

    return-void

    .line 284
    :cond_1a
    :try_start_1a
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 285
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->stopAnimation()V
    :try_end_21
    .catchall {:try_start_1a .. :try_end_21} :catchall_22

    goto :goto_18

    .line 276
    :catchall_22
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 313
    if-eqz p1, :cond_5

    .line 314
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 316
    :cond_5
    iput-object p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    .line 317
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z

    if-eqz v0, :cond_10

    .line 318
    iput-object p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 319
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->postInvalidate()V

    .line 321
    :cond_10
    return-void
.end method

.method public setInterpolator(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resID"    # I

    .prologue
    .line 658
    invoke-static {p1, p2}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 659
    return-void
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 668
    iput-object p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 669
    return-void
.end method

.method public declared-synchronized setMax(I)V
    .registers 5
    .param p1, "max"    # I

    .prologue
    .line 574
    monitor-enter p0

    if-gez p1, :cond_4

    .line 575
    const/4 p1, 0x0

    .line 577
    :cond_4
    :try_start_4
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMax:I

    if-eq p1, v0, :cond_1c

    .line 578
    iput p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMax:I

    .line 579
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->postInvalidate()V

    .line 581
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgress:I

    if-le v0, p1, :cond_13

    .line 582
    iput p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgress:I

    .line 584
    :cond_13
    const v0, 0x102000d

    iget v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgress:I

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Landroid/support/v7/internal/widget/ProgressBarCompat;->refreshProgress(IIZ)V
    :try_end_1c
    .catchall {:try_start_4 .. :try_end_1c} :catchall_1e

    .line 586
    :cond_1c
    monitor-exit p0

    return-void

    .line 574
    :catchall_1e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setProgress(I)V
    .registers 3
    .param p1, "progress"    # I

    .prologue
    .line 466
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {p0, p1, v0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setProgress(IZ)V
    :try_end_5
    .catchall {:try_start_2 .. :try_end_5} :catchall_7

    .line 467
    monitor-exit p0

    return-void

    .line 466
    :catchall_7
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized setProgress(IZ)V
    .registers 5
    .param p1, "progress"    # I
    .param p2, "fromUser"    # Z

    .prologue
    .line 470
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_1f

    if-eqz v0, :cond_7

    .line 486
    :cond_5
    :goto_5
    monitor-exit p0

    return-void

    .line 474
    :cond_7
    if-gez p1, :cond_a

    .line 475
    const/4 p1, 0x0

    .line 478
    :cond_a
    :try_start_a
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMax:I

    if-le p1, v0, :cond_10

    .line 479
    iget p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMax:I

    .line 482
    :cond_10
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgress:I

    if-eq p1, v0, :cond_5

    .line 483
    iput p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgress:I

    .line 484
    const v0, 0x102000d

    iget v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgress:I

    invoke-direct {p0, v0, v1, p2}, Landroid/support/v7/internal/widget/ProgressBarCompat;->refreshProgress(IIZ)V
    :try_end_1e
    .catchall {:try_start_a .. :try_end_1e} :catchall_1f

    goto :goto_5

    .line 470
    :catchall_1f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setProgressDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 7
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v4, 0x0

    .line 347
    iget-object v2, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_4e

    iget-object v2, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-eq p1, v2, :cond_4e

    .line 348
    iget-object v2, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 349
    const/4 v1, 0x1

    .line 354
    .local v1, "needUpdate":Z
    :goto_10
    if-eqz p1, :cond_22

    .line 355
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 358
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v0

    .line 359
    .local v0, "drawableHeight":I
    iget v2, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMaxHeight:I

    if-ge v2, v0, :cond_22

    .line 360
    iput v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMaxHeight:I

    .line 361
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->requestLayout()V

    .line 364
    .end local v0    # "drawableHeight":I
    :cond_22
    iput-object p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    .line 365
    iget-boolean v2, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z

    if-nez v2, :cond_2d

    .line 366
    iput-object p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 367
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->postInvalidate()V

    .line 370
    :cond_2d
    if-eqz v1, :cond_4d

    .line 371
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getHeight()I

    move-result v3

    invoke-direct {p0, v2, v3}, Landroid/support/v7/internal/widget/ProgressBarCompat;->updateDrawableBounds(II)V

    .line 372
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->updateDrawableState()V

    .line 373
    const v2, 0x102000d

    iget v3, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgress:I

    invoke-direct {p0, v2, v3, v4, v4}, Landroid/support/v7/internal/widget/ProgressBarCompat;->doRefreshProgress(IIZZ)V

    .line 374
    const v2, 0x102000f

    iget v3, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mSecondaryProgress:I

    invoke-direct {p0, v2, v3, v4, v4}, Landroid/support/v7/internal/widget/ProgressBarCompat;->doRefreshProgress(IIZZ)V

    .line 376
    :cond_4d
    return-void

    .line 351
    .end local v1    # "needUpdate":Z
    :cond_4e
    const/4 v1, 0x0

    .restart local v1    # "needUpdate":Z
    goto :goto_10
.end method

.method public declared-synchronized setSecondaryProgress(I)V
    .registers 5
    .param p1, "secondaryProgress"    # I

    .prologue
    .line 501
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_20

    if-eqz v0, :cond_7

    .line 517
    :cond_5
    :goto_5
    monitor-exit p0

    return-void

    .line 505
    :cond_7
    if-gez p1, :cond_a

    .line 506
    const/4 p1, 0x0

    .line 509
    :cond_a
    :try_start_a
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMax:I

    if-le p1, v0, :cond_10

    .line 510
    iget p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mMax:I

    .line 513
    :cond_10
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mSecondaryProgress:I

    if-eq p1, v0, :cond_5

    .line 514
    iput p1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mSecondaryProgress:I

    .line 515
    const v0, 0x102000f

    iget v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mSecondaryProgress:I

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Landroid/support/v7/internal/widget/ProgressBarCompat;->refreshProgress(IIZ)V
    :try_end_1f
    .catchall {:try_start_a .. :try_end_1f} :catchall_20

    goto :goto_5

    .line 501
    :catchall_20
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setVisibility(I)V
    .registers 3
    .param p1, "v"    # I

    .prologue
    .line 682
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getVisibility()I

    move-result v0

    if-eq v0, p1, :cond_17

    .line 683
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 685
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminate:Z

    if-eqz v0, :cond_17

    .line 687
    const/16 v0, 0x8

    if-eq p1, v0, :cond_14

    const/4 v0, 0x4

    if-ne p1, v0, :cond_18

    .line 688
    :cond_14
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->stopAnimation()V

    .line 694
    :cond_17
    :goto_17
    return-void

    .line 690
    :cond_18
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->startAnimation()V

    goto :goto_17
.end method

.method startAnimation()V
    .registers 4

    .prologue
    .line 614
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_7

    .line 635
    :goto_6
    return-void

    .line 618
    :cond_7
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v0, v0, Landroid/graphics/drawable/Animatable;

    if-eqz v0, :cond_17

    .line 619
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mShouldStartAnimationDrawable:Z

    .line 620
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mAnimation:Landroid/view/animation/AlphaAnimation;

    .line 634
    :goto_13
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->postInvalidate()V

    goto :goto_6

    .line 622
    :cond_17
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mInterpolator:Landroid/view/animation/Interpolator;

    if-nez v0, :cond_22

    .line 623
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 626
    :cond_22
    new-instance v0, Landroid/view/animation/Transformation;

    invoke-direct {v0}, Landroid/view/animation/Transformation;-><init>()V

    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mTransformation:Landroid/view/animation/Transformation;

    .line 627
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mAnimation:Landroid/view/animation/AlphaAnimation;

    .line 628
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mAnimation:Landroid/view/animation/AlphaAnimation;

    iget v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mBehavior:I

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setRepeatMode(I)V

    .line 629
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mAnimation:Landroid/view/animation/AlphaAnimation;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setRepeatCount(I)V

    .line 630
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mAnimation:Landroid/view/animation/AlphaAnimation;

    iget v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mDuration:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 631
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mAnimation:Landroid/view/animation/AlphaAnimation;

    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 632
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mAnimation:Landroid/view/animation/AlphaAnimation;

    const-wide/16 v1, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setStartTime(J)V

    goto :goto_13
.end method

.method stopAnimation()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 641
    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mAnimation:Landroid/view/animation/AlphaAnimation;

    .line 642
    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mTransformation:Landroid/view/animation/Transformation;

    .line 643
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v0, v0, Landroid/graphics/drawable/Animatable;

    if-eqz v0, :cond_15

    .line 644
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Landroid/graphics/drawable/Animatable;

    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->stop()V

    .line 645
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mShouldStartAnimationDrawable:Z

    .line 647
    :cond_15
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarCompat;->postInvalidate()V

    .line 648
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 380
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-eq p1, v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarCompat;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    if-eq p1, v0, :cond_e

    invoke-super {p0, p1}, Landroid/view/View;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method
