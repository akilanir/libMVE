.class public Landroid/support/v7/internal/widget/ProgressBarICS;
.super Landroid/view/View;
.source "ProgressBarICS.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/internal/widget/ProgressBarICS$1;,
        Landroid/support/v7/internal/widget/ProgressBarICS$SavedState;,
        Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;
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

.field private mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;

.field mSampleTile:Landroid/graphics/Bitmap;

.field private mSecondaryProgress:I

.field private mShouldStartAnimationDrawable:Z

.field private mTransformation:Landroid/view/animation/Transformation;

.field private mUiThreadId:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    const/16 v0, 0xe

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Landroid/support/v7/internal/widget/ProgressBarICS;->android_R_styleable_ProgressBar:[I

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

    .line 109
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 110
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    iput-wide v6, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mUiThreadId:J

    .line 111
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->initProgressBar()V

    .line 113
    sget-object v6, Landroid/support/v7/internal/widget/ProgressBarICS;->android_R_styleable_ProgressBar:[I

    invoke-virtual {p1, p2, v6, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 116
    .local v0, "a":Landroid/content/res/TypedArray;
    iput-boolean v5, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mNoInvalidate:Z

    .line 118
    iget v6, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMax:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    invoke-virtual {p0, v6}, Landroid/support/v7/internal/widget/ProgressBarICS;->setMax(I)V

    .line 119
    iget v6, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgress:I

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    invoke-virtual {p0, v6}, Landroid/support/v7/internal/widget/ProgressBarICS;->setProgress(I)V

    .line 120
    const/4 v6, 0x2

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mSecondaryProgress:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    invoke-virtual {p0, v6}, Landroid/support/v7/internal/widget/ProgressBarICS;->setSecondaryProgress(I)V

    .line 122
    const/4 v6, 0x3

    iget-boolean v7, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    .line 123
    .local v2, "indeterminate":Z
    const/4 v6, 0x4

    iget-boolean v7, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mOnlyIndeterminate:Z

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    iput-boolean v6, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mOnlyIndeterminate:Z

    .line 125
    const/4 v6, 0x5

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 126
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_54

    .line 127
    invoke-direct {p0, v1}, Landroid/support/v7/internal/widget/ProgressBarICS;->tileifyIndeterminate(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 128
    invoke-virtual {p0, v1}, Landroid/support/v7/internal/widget/ProgressBarICS;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 131
    :cond_54
    const/4 v6, 0x6

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 132
    if-eqz v1, :cond_62

    .line 133
    invoke-direct {p0, v1, v4}, Landroid/support/v7/internal/widget/ProgressBarICS;->tileify(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 136
    invoke-virtual {p0, v1}, Landroid/support/v7/internal/widget/ProgressBarICS;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 139
    :cond_62
    const/4 v6, 0x7

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mDuration:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    iput v6, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mDuration:I

    .line 140
    const/16 v6, 0x8

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mBehavior:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    iput v6, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mBehavior:I

    .line 141
    const/16 v6, 0x9

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMinWidth:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMinWidth:I

    .line 142
    const/16 v6, 0xa

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMaxWidth:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMaxWidth:I

    .line 143
    const/16 v6, 0xb

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMinHeight:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMinHeight:I

    .line 144
    const/16 v6, 0xc

    iget v7, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMaxHeight:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMaxHeight:I

    .line 146
    const/16 v6, 0xd

    const v7, 0x10a000b

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    .line 147
    .local v3, "resID":I
    if-lez v3, :cond_ab

    .line 148
    invoke-virtual {p0, p1, v3}, Landroid/support/v7/internal/widget/ProgressBarICS;->setInterpolator(Landroid/content/Context;I)V

    .line 151
    :cond_ab
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 153
    iput-boolean v4, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mNoInvalidate:Z

    .line 154
    iget-boolean v6, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mOnlyIndeterminate:Z

    if-nez v6, :cond_b6

    if-eqz v2, :cond_b7

    :cond_b6
    move v4, v5

    :cond_b7
    invoke-virtual {p0, v4}, Landroid/support/v7/internal/widget/ProgressBarICS;->setIndeterminate(Z)V

    .line 155
    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/internal/widget/ProgressBarICS;IIZZ)V
    .registers 5
    .param p0, "x0"    # Landroid/support/v7/internal/widget/ProgressBarICS;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # Z
    .param p4, "x4"    # Z

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/internal/widget/ProgressBarICS;->doRefreshProgress(IIZZ)V

    return-void
.end method

.method static synthetic access$102(Landroid/support/v7/internal/widget/ProgressBarICS;Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;)Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/widget/ProgressBarICS;
    .param p1, "x1"    # Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;

    .prologue
    .line 52
    iput-object p1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;

    return-object p1
.end method

.method private declared-synchronized doRefreshProgress(IIZZ)V
    .registers 12
    .param p1, "id"    # I
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z
    .param p4, "callBackToApp"    # Z

    .prologue
    .line 418
    monitor-enter p0

    :try_start_1
    iget v5, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMax:I

    if-lez v5, :cond_28

    int-to-float v5, p2

    iget v6, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMax:I

    int-to-float v6, v6

    div-float v4, v5, v6

    .line 419
    .local v4, "scale":F
    :goto_b
    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 420
    .local v1, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_2c

    .line 421
    const/4 v3, 0x0

    .line 423
    .local v3, "progressDrawable":Landroid/graphics/drawable/Drawable;
    instance-of v5, v1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v5, :cond_1c

    .line 424
    move-object v0, v1

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    move-object v5, v0

    invoke-virtual {v5, p1}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 427
    :cond_1c
    const v5, 0x461c4000    # 10000.0f

    mul-float/2addr v5, v4

    float-to-int v2, v5

    .line 428
    .local v2, "level":I
    if-eqz v3, :cond_2a

    .end local v3    # "progressDrawable":Landroid/graphics/drawable/Drawable;
    :goto_23
    invoke-virtual {v3, v2}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z
    :try_end_26
    .catchall {:try_start_1 .. :try_end_26} :catchall_30

    .line 432
    .end local v2    # "level":I
    :goto_26
    monitor-exit p0

    return-void

    .line 418
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

    .line 428
    goto :goto_23

    .line 430
    .end local v2    # "level":I
    .end local v3    # "progressDrawable":Landroid/graphics/drawable/Drawable;
    :cond_2c
    :try_start_2c
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->invalidate()V
    :try_end_2f
    .catchall {:try_start_2c .. :try_end_2f} :catchall_30

    goto :goto_26

    .line 418
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

    .line 242
    const/16 v0, 0x64

    iput v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMax:I

    .line 243
    iput v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgress:I

    .line 244
    iput v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mSecondaryProgress:I

    .line 245
    iput-boolean v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z

    .line 246
    iput-boolean v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mOnlyIndeterminate:Z

    .line 247
    const/16 v0, 0xfa0

    iput v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mDuration:I

    .line 248
    const/4 v0, 0x1

    iput v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mBehavior:I

    .line 249
    iput v2, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMinWidth:I

    .line 250
    iput v3, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMaxWidth:I

    .line 251
    iput v2, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMinHeight:I

    .line 252
    iput v3, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMaxHeight:I

    .line 253
    return-void
.end method

.method private declared-synchronized refreshProgress(IIZ)V
    .registers 9
    .param p1, "id"    # I
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 435
    monitor-enter p0

    :try_start_1
    iget-wide v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mUiThreadId:J

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_15

    .line 436
    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, p3, v1}, Landroid/support/v7/internal/widget/ProgressBarICS;->doRefreshProgress(IIZZ)V
    :try_end_13
    .catchall {:try_start_1 .. :try_end_13} :catchall_25

    .line 451
    :goto_13
    monitor-exit p0

    return-void

    .line 439
    :cond_15
    :try_start_15
    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;

    if-eqz v1, :cond_28

    .line 441
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;

    .line 443
    .local v0, "r":Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;
    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;

    .line 444
    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;->setup(IIZ)V

    .line 449
    :goto_21
    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ProgressBarICS;->post(Ljava/lang/Runnable;)Z
    :try_end_24
    .catchall {:try_start_15 .. :try_end_24} :catchall_25

    goto :goto_13

    .line 435
    .end local v0    # "r":Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;
    :catchall_25
    move-exception v1

    monitor-exit p0

    throw v1

    .line 447
    :cond_28
    :try_start_28
    new-instance v0, Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;

    invoke-direct {v0, p0, p1, p2, p3}, Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;-><init>(Landroid/support/v7/internal/widget/ProgressBarICS;IIZ)V
    :try_end_2d
    .catchall {:try_start_28 .. :try_end_2d} :catchall_25

    .restart local v0    # "r":Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;
    goto :goto_21
.end method

.method private tileify(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;
    .registers 15
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "clip"    # Z

    .prologue
    const/4 v10, 0x1

    .line 163
    instance-of v9, p1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz v9, :cond_41

    move-object v1, p1

    .line 164
    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    .line 165
    .local v1, "background":Landroid/graphics/drawable/LayerDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    move-result v0

    .line 166
    .local v0, "N":I
    new-array v6, v0, [Landroid/graphics/drawable/Drawable;

    .line 168
    .local v6, "outDrawables":[Landroid/graphics/drawable/Drawable;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_f
    if-ge v3, v0, :cond_2f

    .line 169
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    move-result v4

    .line 170
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
    invoke-direct {p0, v11, v9}, Landroid/support/v7/internal/widget/ProgressBarICS;->tileify(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    aput-object v9, v6, v3

    .line 168
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 170
    :cond_2d
    const/4 v9, 0x0

    goto :goto_24

    .line 174
    .end local v4    # "id":I
    :cond_2f
    new-instance v5, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v5, v6}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 176
    .local v5, "newBg":Landroid/graphics/drawable/LayerDrawable;
    const/4 v3, 0x0

    :goto_35
    if-ge v3, v0, :cond_74

    .line 177
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    move-result v9

    invoke-virtual {v5, v3, v9}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    .line 176
    add-int/lit8 v3, v3, 0x1

    goto :goto_35

    .line 182
    .end local v0    # "N":I
    .end local v1    # "background":Landroid/graphics/drawable/LayerDrawable;
    .end local v3    # "i":I
    .end local v5    # "newBg":Landroid/graphics/drawable/LayerDrawable;
    .end local v6    # "outDrawables":[Landroid/graphics/drawable/Drawable;
    :cond_41
    instance-of v9, p1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v9, :cond_75

    .line 183
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .end local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v8

    .line 184
    .local v8, "tileBitmap":Landroid/graphics/Bitmap;
    iget-object v9, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mSampleTile:Landroid/graphics/Bitmap;

    if-nez v9, :cond_51

    .line 185
    iput-object v8, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mSampleTile:Landroid/graphics/Bitmap;

    .line 188
    :cond_51
    new-instance v7, Landroid/graphics/drawable/ShapeDrawable;

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getDrawableShape()Landroid/graphics/drawable/shapes/Shape;

    move-result-object v9

    invoke-direct {v7, v9}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 190
    .local v7, "shapeDrawable":Landroid/graphics/drawable/ShapeDrawable;
    new-instance v2, Landroid/graphics/BitmapShader;

    sget-object v9, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    sget-object v11, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v2, v8, v9, v11}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 192
    .local v2, "bitmapShader":Landroid/graphics/BitmapShader;
    invoke-virtual {v7}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v9

    invoke-virtual {v9, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 194
    if-eqz p2, :cond_73

    new-instance v9, Landroid/graphics/drawable/ClipDrawable;

    const/4 v11, 0x3

    invoke-direct {v9, v7, v11, v10}, Landroid/graphics/drawable/ClipDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V

    move-object v7, v9

    .end local v7    # "shapeDrawable":Landroid/graphics/drawable/ShapeDrawable;
    :cond_73
    move-object v5, v7

    .line 198
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

    .line 212
    instance-of v5, p1, Landroid/graphics/drawable/AnimationDrawable;

    if-eqz v5, :cond_36

    move-object v1, p1

    .line 213
    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    .line 214
    .local v1, "background":Landroid/graphics/drawable/AnimationDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->getNumberOfFrames()I

    move-result v0

    .line 215
    .local v0, "N":I
    new-instance v4, Landroid/graphics/drawable/AnimationDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/AnimationDrawable;-><init>()V

    .line 216
    .local v4, "newBg":Landroid/graphics/drawable/AnimationDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->isOneShot()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/AnimationDrawable;->setOneShot(Z)V

    .line 218
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1a
    if-ge v3, v0, :cond_32

    .line 219
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/AnimationDrawable;->getFrame(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    const/4 v6, 0x1

    invoke-direct {p0, v5, v6}, Landroid/support/v7/internal/widget/ProgressBarICS;->tileify(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 220
    .local v2, "frame":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v2, v7}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 221
    invoke-virtual {v1, v3}, Landroid/graphics/drawable/AnimationDrawable;->getDuration(I)I

    move-result v5

    invoke-virtual {v4, v2, v5}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 218
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    .line 223
    .end local v2    # "frame":Landroid/graphics/drawable/Drawable;
    :cond_32
    invoke-virtual {v4, v7}, Landroid/graphics/drawable/AnimationDrawable;->setLevel(I)Z

    .line 224
    move-object p1, v4

    .line 226
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

    .line 732
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getPaddingRight()I

    move-result v10

    sub-int v10, p1, v10

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getPaddingLeft()I

    move-result v11

    sub-int v7, v10, v11

    .line 733
    .local v7, "right":I
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getPaddingBottom()I

    move-result v10

    sub-int v10, p2, v10

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getPaddingTop()I

    move-result v11

    sub-int v0, v10, v11

    .line 734
    .local v0, "bottom":I
    const/4 v8, 0x0

    .line 735
    .local v8, "top":I
    const/4 v6, 0x0

    .line 737
    .local v6, "left":I
    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v10, :cond_53

    .line 739
    iget-boolean v10, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mOnlyIndeterminate:Z

    if-eqz v10, :cond_4e

    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v10, v10, Landroid/graphics/drawable/AnimationDrawable;

    if-nez v10, :cond_4e

    .line 742
    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    .line 743
    .local v5, "intrinsicWidth":I
    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    .line 744
    .local v4, "intrinsicHeight":I
    int-to-float v10, v5

    int-to-float v11, v4

    div-float v3, v10, v11

    .line 745
    .local v3, "intrinsicAspect":F
    int-to-float v10, p1

    int-to-float v11, p2

    div-float v1, v10, v11

    .line 746
    .local v1, "boundAspect":F
    cmpl-float v10, v3, v1

    if-eqz v10, :cond_4e

    .line 747
    cmpl-float v10, v1, v3

    if-lez v10, :cond_5d

    .line 749
    int-to-float v10, p2

    mul-float/2addr v10, v3

    float-to-int v9, v10

    .line 750
    .local v9, "width":I
    sub-int v10, p1, v9

    div-int/lit8 v6, v10, 0x2

    .line 751
    add-int v7, v6, v9

    .line 760
    .end local v1    # "boundAspect":F
    .end local v3    # "intrinsicAspect":F
    .end local v4    # "intrinsicHeight":I
    .end local v5    # "intrinsicWidth":I
    .end local v9    # "width":I
    :cond_4e
    :goto_4e
    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10, v6, v8, v7, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 763
    :cond_53
    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v10, :cond_5c

    .line 764
    iget-object v10, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v10, v12, v12, v7, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 766
    :cond_5c
    return-void

    .line 754
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

    .line 755
    .local v2, "height":I
    sub-int v10, p2, v2

    div-int/lit8 v8, v10, 0x2

    .line 756
    add-int v0, v8, v2

    goto :goto_4e
.end method

.method private updateDrawableState()V
    .registers 3

    .prologue
    .line 827
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getDrawableState()[I

    move-result-object v0

    .line 829
    .local v0, "state":[I
    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_15

    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 830
    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 833
    :cond_15
    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_26

    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 834
    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 836
    :cond_26
    return-void
.end method


# virtual methods
.method protected drawableStateChanged()V
    .registers 1

    .prologue
    .line 822
    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    .line 823
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->updateDrawableState()V

    .line 824
    return-void
.end method

.method getDrawableShape()Landroid/graphics/drawable/shapes/Shape;
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 202
    const/16 v1, 0x8

    new-array v0, v1, [F

    fill-array-data v0, :array_e

    .line 203
    .local v0, "roundedCorners":[F
    new-instance v1, Landroid/graphics/drawable/shapes/RoundRectShape;

    invoke-direct {v1, v0, v2, v2}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    return-object v1

    .line 202
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
    .line 299
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getInterpolator()Landroid/view/animation/Interpolator;
    .registers 2

    .prologue
    .line 676
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method public declared-synchronized getMax()I
    .registers 2

    .prologue
    .line 560
    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMax:I
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
    .line 531
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_b

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    :try_start_8
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgress:I
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
    .line 332
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public declared-synchronized getSecondaryProgress()I
    .registers 2

    .prologue
    .line 547
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_b

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    :try_start_8
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mSecondaryProgress:I
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
    .line 595
    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgress:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ProgressBarICS;->setProgress(I)V
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 596
    monitor-exit p0

    return-void

    .line 595
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized incrementSecondaryProgressBy(I)V
    .registers 3
    .param p1, "diff"    # I

    .prologue
    .line 606
    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mSecondaryProgress:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ProgressBarICS;->setSecondaryProgress(I)V
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_9

    .line 607
    monitor-exit p0

    return-void

    .line 606
    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 9
    .param p1, "dr"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 711
    iget-boolean v3, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mInDrawing:Z

    if-nez v3, :cond_31

    .line 712
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/widget/ProgressBarICS;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v3

    if-eqz v3, :cond_32

    .line 713
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 714
    .local v0, "dirty":Landroid/graphics/Rect;
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getScrollX()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getPaddingLeft()I

    move-result v4

    add-int v1, v3, v4

    .line 715
    .local v1, "scrollX":I
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getScrollY()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getPaddingTop()I

    move-result v4

    add-int v2, v3, v4

    .line 717
    .local v2, "scrollY":I
    iget v3, v0, Landroid/graphics/Rect;->left:I

    add-int/2addr v3, v1

    iget v4, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v4, v2

    iget v5, v0, Landroid/graphics/Rect;->right:I

    add-int/2addr v5, v1

    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v6, v2

    invoke-virtual {p0, v3, v4, v5, v6}, Landroid/support/v7/internal/widget/ProgressBarICS;->invalidate(IIII)V

    .line 723
    .end local v0    # "dirty":Landroid/graphics/Rect;
    .end local v1    # "scrollX":I
    .end local v2    # "scrollY":I
    :cond_31
    :goto_31
    return-void

    .line 720
    :cond_32
    invoke-super {p0, p1}, Landroid/view/View;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_31
.end method

.method public declared-synchronized isIndeterminate()Z
    .registers 2

    .prologue
    .line 261
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z
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
    .line 900
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 901
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z

    if-eqz v0, :cond_a

    .line 902
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->startAnimation()V

    .line 904
    :cond_a
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 908
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z

    if-eqz v0, :cond_7

    .line 909
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->stopAnimation()V

    .line 911
    :cond_7
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;

    if-eqz v0, :cond_10

    .line 912
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mRefreshProgressRunnable:Landroid/support/v7/internal/widget/ProgressBarICS$RefreshProgressRunnable;

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ProgressBarICS;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 917
    :cond_10
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 918
    return-void
.end method

.method protected declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .registers 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const-wide/16 v8, 0xc8

    .line 770
    monitor-enter p0

    :try_start_3
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 772
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 773
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_69

    .line 776
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 777
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getPaddingLeft()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getPaddingTop()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 778
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getDrawingTime()J

    move-result-wide v2

    .line 779
    .local v2, "time":J
    iget-object v4, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mAnimation:Landroid/view/animation/AlphaAnimation;

    if-eqz v4, :cond_53

    .line 780
    iget-object v4, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mAnimation:Landroid/view/animation/AlphaAnimation;

    iget-object v5, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v4, v2, v3, v5}, Landroid/view/animation/AlphaAnimation;->getTransformation(JLandroid/view/animation/Transformation;)Z

    .line 781
    iget-object v4, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mTransformation:Landroid/view/animation/Transformation;

    invoke-virtual {v4}, Landroid/view/animation/Transformation;->getAlpha()F
    :try_end_2e
    .catchall {:try_start_3 .. :try_end_2e} :catchall_70

    move-result v1

    .line 783
    .local v1, "scale":F
    const/4 v4, 0x1

    :try_start_30
    iput-boolean v4, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mInDrawing:Z

    .line 784
    const v4, 0x461c4000    # 10000.0f

    mul-float/2addr v4, v1

    float-to-int v4, v4

    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z
    :try_end_3a
    .catchall {:try_start_30 .. :try_end_3a} :catchall_6b

    .line 786
    const/4 v4, 0x0

    :try_start_3b
    iput-boolean v4, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mInDrawing:Z

    .line 788
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mLastDrawTime:J

    sub-long/2addr v4, v6

    cmp-long v4, v4, v8

    if-ltz v4, :cond_53

    .line 789
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mLastDrawTime:J

    .line 790
    const-wide/16 v4, 0xc8

    invoke-virtual {p0, v4, v5}, Landroid/support/v7/internal/widget/ProgressBarICS;->postInvalidateDelayed(J)V

    .line 793
    .end local v1    # "scale":F
    :cond_53
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 794
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 795
    iget-boolean v4, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mShouldStartAnimationDrawable:Z

    if-eqz v4, :cond_69

    instance-of v4, v0, Landroid/graphics/drawable/Animatable;

    if-eqz v4, :cond_69

    .line 796
    check-cast v0, Landroid/graphics/drawable/Animatable;

    .end local v0    # "d":Landroid/graphics/drawable/Drawable;
    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->start()V

    .line 797
    const/4 v4, 0x0

    iput-boolean v4, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mShouldStartAnimationDrawable:Z
    :try_end_69
    .catchall {:try_start_3b .. :try_end_69} :catchall_70

    .line 800
    .end local v2    # "time":J
    :cond_69
    monitor-exit p0

    return-void

    .line 786
    .restart local v0    # "d":Landroid/graphics/drawable/Drawable;
    .restart local v1    # "scale":F
    .restart local v2    # "time":J
    :catchall_6b
    move-exception v4

    const/4 v5, 0x0

    :try_start_6d
    iput-boolean v5, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mInDrawing:Z

    throw v4
    :try_end_70
    .catchall {:try_start_6d .. :try_end_70} :catchall_70

    .line 770
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
    .line 804
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 806
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    const/4 v2, 0x0

    .line 807
    .local v2, "dw":I
    const/4 v1, 0x0

    .line 808
    .local v1, "dh":I
    if-eqz v0, :cond_27

    .line 809
    iget v3, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMinWidth:I

    iget v4, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMaxWidth:I

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 810
    iget v3, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMinHeight:I

    iget v4, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMaxHeight:I

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 812
    :cond_27
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->updateDrawableState()V

    .line 813
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getPaddingLeft()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getPaddingRight()I

    move-result v4

    add-int/2addr v3, v4

    add-int/2addr v2, v3

    .line 814
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getPaddingTop()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getPaddingBottom()I

    move-result v4

    add-int/2addr v3, v4

    add-int/2addr v1, v3

    .line 816
    invoke-static {v2, p1}, Landroid/support/v7/internal/widget/ProgressBarICS;->resolveSize(II)I

    move-result v3

    invoke-static {v1, p2}, Landroid/support/v7/internal/widget/ProgressBarICS;->resolveSize(II)I

    move-result v4

    invoke-virtual {p0, v3, v4}, Landroid/support/v7/internal/widget/ProgressBarICS;->setMeasuredDimension(II)V
    :try_end_49
    .catchall {:try_start_1 .. :try_end_49} :catchall_4b

    .line 818
    monitor-exit p0

    return-void

    .line 804
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
    .line 891
    move-object v0, p1

    check-cast v0, Landroid/support/v7/internal/widget/ProgressBarICS$SavedState;

    .line 892
    .local v0, "ss":Landroid/support/v7/internal/widget/ProgressBarICS$SavedState;
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ProgressBarICS$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 894
    iget v1, v0, Landroid/support/v7/internal/widget/ProgressBarICS$SavedState;->progress:I

    invoke-virtual {p0, v1}, Landroid/support/v7/internal/widget/ProgressBarICS;->setProgress(I)V

    .line 895
    iget v1, v0, Landroid/support/v7/internal/widget/ProgressBarICS$SavedState;->secondaryProgress:I

    invoke-virtual {p0, v1}, Landroid/support/v7/internal/widget/ProgressBarICS;->setSecondaryProgress(I)V

    .line 896
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 880
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 881
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Landroid/support/v7/internal/widget/ProgressBarICS$SavedState;

    invoke-direct {v0, v1}, Landroid/support/v7/internal/widget/ProgressBarICS$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 883
    .local v0, "ss":Landroid/support/v7/internal/widget/ProgressBarICS$SavedState;
    iget v2, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgress:I

    iput v2, v0, Landroid/support/v7/internal/widget/ProgressBarICS$SavedState;->progress:I

    .line 884
    iget v2, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mSecondaryProgress:I

    iput v2, v0, Landroid/support/v7/internal/widget/ProgressBarICS$SavedState;->secondaryProgress:I

    .line 886
    return-object v0
.end method

.method protected onSizeChanged(IIII)V
    .registers 5
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 727
    invoke-direct {p0, p1, p2}, Landroid/support/v7/internal/widget/ProgressBarICS;->updateDrawableBounds(II)V

    .line 728
    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .registers 4
    .param p1, "changedView"    # Landroid/view/View;
    .param p2, "visibility"    # I

    .prologue
    .line 697
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 699
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z

    if-eqz v0, :cond_11

    .line 701
    const/16 v0, 0x8

    if-eq p2, v0, :cond_e

    const/4 v0, 0x4

    if-ne p2, v0, :cond_12

    .line 702
    :cond_e
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->stopAnimation()V

    .line 707
    :cond_11
    :goto_11
    return-void

    .line 704
    :cond_12
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->startAnimation()V

    goto :goto_11
.end method

.method public postInvalidate()V
    .registers 2

    .prologue
    .line 385
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mNoInvalidate:Z

    if-nez v0, :cond_7

    .line 386
    invoke-super {p0}, Landroid/view/View;->postInvalidate()V

    .line 388
    :cond_7
    return-void
.end method

.method public declared-synchronized setIndeterminate(Z)V
    .registers 3
    .param p1, "indeterminate"    # Z

    .prologue
    .line 275
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mOnlyIndeterminate:Z

    if-eqz v0, :cond_9

    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z

    if-nez v0, :cond_18

    :cond_9
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z

    if-eq p1, v0, :cond_18

    .line 276
    iput-boolean p1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z

    .line 278
    if-eqz p1, :cond_1a

    .line 280
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 281
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->startAnimation()V
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_22

    .line 287
    :cond_18
    :goto_18
    monitor-exit p0

    return-void

    .line 283
    :cond_1a
    :try_start_1a
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 284
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->stopAnimation()V
    :try_end_21
    .catchall {:try_start_1a .. :try_end_21} :catchall_22

    goto :goto_18

    .line 275
    :catchall_22
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 312
    if-eqz p1, :cond_5

    .line 313
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 315
    :cond_5
    iput-object p1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    .line 316
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z

    if-eqz v0, :cond_10

    .line 317
    iput-object p1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 318
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->postInvalidate()V

    .line 320
    :cond_10
    return-void
.end method

.method public setInterpolator(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resID"    # I

    .prologue
    .line 657
    invoke-static {p1, p2}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ProgressBarICS;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 658
    return-void
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 667
    iput-object p1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 668
    return-void
.end method

.method public declared-synchronized setMax(I)V
    .registers 5
    .param p1, "max"    # I

    .prologue
    .line 573
    monitor-enter p0

    if-gez p1, :cond_4

    .line 574
    const/4 p1, 0x0

    .line 576
    :cond_4
    :try_start_4
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMax:I

    if-eq p1, v0, :cond_1c

    .line 577
    iput p1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMax:I

    .line 578
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->postInvalidate()V

    .line 580
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgress:I

    if-le v0, p1, :cond_13

    .line 581
    iput p1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgress:I

    .line 583
    :cond_13
    const v0, 0x102000d

    iget v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgress:I

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Landroid/support/v7/internal/widget/ProgressBarICS;->refreshProgress(IIZ)V
    :try_end_1c
    .catchall {:try_start_4 .. :try_end_1c} :catchall_1e

    .line 585
    :cond_1c
    monitor-exit p0

    return-void

    .line 573
    :catchall_1e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setProgress(I)V
    .registers 3
    .param p1, "progress"    # I

    .prologue
    .line 465
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {p0, p1, v0}, Landroid/support/v7/internal/widget/ProgressBarICS;->setProgress(IZ)V
    :try_end_5
    .catchall {:try_start_2 .. :try_end_5} :catchall_7

    .line 466
    monitor-exit p0

    return-void

    .line 465
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
    .line 469
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_1f

    if-eqz v0, :cond_7

    .line 485
    :cond_5
    :goto_5
    monitor-exit p0

    return-void

    .line 473
    :cond_7
    if-gez p1, :cond_a

    .line 474
    const/4 p1, 0x0

    .line 477
    :cond_a
    :try_start_a
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMax:I

    if-le p1, v0, :cond_10

    .line 478
    iget p1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMax:I

    .line 481
    :cond_10
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgress:I

    if-eq p1, v0, :cond_5

    .line 482
    iput p1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgress:I

    .line 483
    const v0, 0x102000d

    iget v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgress:I

    invoke-direct {p0, v0, v1, p2}, Landroid/support/v7/internal/widget/ProgressBarICS;->refreshProgress(IIZ)V
    :try_end_1e
    .catchall {:try_start_a .. :try_end_1e} :catchall_1f

    goto :goto_5

    .line 469
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

    .line 346
    iget-object v2, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_4e

    iget-object v2, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-eq p1, v2, :cond_4e

    .line 347
    iget-object v2, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 348
    const/4 v1, 0x1

    .line 353
    .local v1, "needUpdate":Z
    :goto_10
    if-eqz p1, :cond_22

    .line 354
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 357
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v0

    .line 358
    .local v0, "drawableHeight":I
    iget v2, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMaxHeight:I

    if-ge v2, v0, :cond_22

    .line 359
    iput v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMaxHeight:I

    .line 360
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->requestLayout()V

    .line 363
    .end local v0    # "drawableHeight":I
    :cond_22
    iput-object p1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    .line 364
    iget-boolean v2, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z

    if-nez v2, :cond_2d

    .line 365
    iput-object p1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mCurrentDrawable:Landroid/graphics/drawable/Drawable;

    .line 366
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->postInvalidate()V

    .line 369
    :cond_2d
    if-eqz v1, :cond_4d

    .line 370
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getHeight()I

    move-result v3

    invoke-direct {p0, v2, v3}, Landroid/support/v7/internal/widget/ProgressBarICS;->updateDrawableBounds(II)V

    .line 371
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->updateDrawableState()V

    .line 372
    const v2, 0x102000d

    iget v3, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgress:I

    invoke-direct {p0, v2, v3, v4, v4}, Landroid/support/v7/internal/widget/ProgressBarICS;->doRefreshProgress(IIZZ)V

    .line 373
    const v2, 0x102000f

    iget v3, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mSecondaryProgress:I

    invoke-direct {p0, v2, v3, v4, v4}, Landroid/support/v7/internal/widget/ProgressBarICS;->doRefreshProgress(IIZZ)V

    .line 375
    :cond_4d
    return-void

    .line 350
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
    .line 500
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_20

    if-eqz v0, :cond_7

    .line 516
    :cond_5
    :goto_5
    monitor-exit p0

    return-void

    .line 504
    :cond_7
    if-gez p1, :cond_a

    .line 505
    const/4 p1, 0x0

    .line 508
    :cond_a
    :try_start_a
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMax:I

    if-le p1, v0, :cond_10

    .line 509
    iget p1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mMax:I

    .line 512
    :cond_10
    iget v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mSecondaryProgress:I

    if-eq p1, v0, :cond_5

    .line 513
    iput p1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mSecondaryProgress:I

    .line 514
    const v0, 0x102000f

    iget v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mSecondaryProgress:I

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Landroid/support/v7/internal/widget/ProgressBarICS;->refreshProgress(IIZ)V
    :try_end_1f
    .catchall {:try_start_a .. :try_end_1f} :catchall_20

    goto :goto_5

    .line 500
    :catchall_20
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setVisibility(I)V
    .registers 3
    .param p1, "v"    # I

    .prologue
    .line 681
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getVisibility()I

    move-result v0

    if-eq v0, p1, :cond_17

    .line 682
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 684
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminate:Z

    if-eqz v0, :cond_17

    .line 686
    const/16 v0, 0x8

    if-eq p1, v0, :cond_14

    const/4 v0, 0x4

    if-ne p1, v0, :cond_18

    .line 687
    :cond_14
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->stopAnimation()V

    .line 693
    :cond_17
    :goto_17
    return-void

    .line 689
    :cond_18
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->startAnimation()V

    goto :goto_17
.end method

.method startAnimation()V
    .registers 4

    .prologue
    .line 613
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_7

    .line 634
    :goto_6
    return-void

    .line 617
    :cond_7
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v0, v0, Landroid/graphics/drawable/Animatable;

    if-eqz v0, :cond_17

    .line 618
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mShouldStartAnimationDrawable:Z

    .line 619
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mAnimation:Landroid/view/animation/AlphaAnimation;

    .line 633
    :goto_13
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->postInvalidate()V

    goto :goto_6

    .line 621
    :cond_17
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mInterpolator:Landroid/view/animation/Interpolator;

    if-nez v0, :cond_22

    .line 622
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 625
    :cond_22
    new-instance v0, Landroid/view/animation/Transformation;

    invoke-direct {v0}, Landroid/view/animation/Transformation;-><init>()V

    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mTransformation:Landroid/view/animation/Transformation;

    .line 626
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mAnimation:Landroid/view/animation/AlphaAnimation;

    .line 627
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mAnimation:Landroid/view/animation/AlphaAnimation;

    iget v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mBehavior:I

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setRepeatMode(I)V

    .line 628
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mAnimation:Landroid/view/animation/AlphaAnimation;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setRepeatCount(I)V

    .line 629
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mAnimation:Landroid/view/animation/AlphaAnimation;

    iget v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mDuration:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 630
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mAnimation:Landroid/view/animation/AlphaAnimation;

    iget-object v1, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 631
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mAnimation:Landroid/view/animation/AlphaAnimation;

    const-wide/16 v1, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setStartTime(J)V

    goto :goto_13
.end method

.method stopAnimation()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 640
    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mAnimation:Landroid/view/animation/AlphaAnimation;

    .line 641
    iput-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mTransformation:Landroid/view/animation/Transformation;

    .line 642
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v0, v0, Landroid/graphics/drawable/Animatable;

    if-eqz v0, :cond_15

    .line 643
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Landroid/graphics/drawable/Animatable;

    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->stop()V

    .line 644
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mShouldStartAnimationDrawable:Z

    .line 646
    :cond_15
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ProgressBarICS;->postInvalidate()V

    .line 647
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 379
    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mProgressDrawable:Landroid/graphics/drawable/Drawable;

    if-eq p1, v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/internal/widget/ProgressBarICS;->mIndeterminateDrawable:Landroid/graphics/drawable/Drawable;

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
