.class public Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/RecyclerView$SmoothScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Action"
.end annotation


# static fields
.field public static final UNDEFINED_DURATION:I = -0x80000000


# instance fields
.field private changed:Z

.field private consecutiveUpdates:I

.field private mDuration:I

.field private mDx:I

.field private mDy:I

.field private mInterpolator:Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>(II)V
    .registers 5
    .param p1, "dx"    # I
    .param p2, "dy"    # I

    .prologue
    .line 7235
    const/high16 v0, -0x80000000

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;-><init>(IIILandroid/view/animation/Interpolator;)V

    .line 7236
    return-void
.end method

.method public constructor <init>(III)V
    .registers 5
    .param p1, "dx"    # I
    .param p2, "dy"    # I
    .param p3, "duration"    # I

    .prologue
    .line 7244
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;-><init>(IIILandroid/view/animation/Interpolator;)V

    .line 7245
    return-void
.end method

.method public constructor <init>(IIILandroid/view/animation/Interpolator;)V
    .registers 6
    .param p1, "dx"    # I
    .param p2, "dy"    # I
    .param p3, "duration"    # I
    .param p4, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    const/4 v0, 0x0

    .line 7254
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7224
    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->changed:Z

    .line 7228
    iput v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->consecutiveUpdates:I

    .line 7255
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDx:I

    .line 7256
    iput p2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDy:I

    .line 7257
    iput p3, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    .line 7258
    iput-object p4, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 7259
    return-void
.end method

.method static synthetic access$5300(Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;Landroid/support/v7/widget/RecyclerView;)V
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;
    .param p1, "x1"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 7212
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->runIfNecessary(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method private runIfNecessary(Landroid/support/v7/widget/RecyclerView;)V
    .registers 8
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    const/4 v5, 0x0

    .line 7261
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->changed:Z

    if-eqz v0, :cond_51

    .line 7262
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->validate()V

    .line 7263
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mInterpolator:Landroid/view/animation/Interpolator;

    if-nez v0, :cond_41

    .line 7264
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_33

    .line 7265
    # getter for: Landroid/support/v7/widget/RecyclerView;->mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->access$5100(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDx:I

    iget v2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDy:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->smoothScrollBy(II)V

    .line 7272
    :goto_1d
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->consecutiveUpdates:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->consecutiveUpdates:I

    .line 7273
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->consecutiveUpdates:I

    const/16 v1, 0xa

    if-le v0, v1, :cond_30

    .line 7276
    const-string v0, "RecyclerView"

    const-string v1, "Smooth Scroll action is being updated too frequently. Make sure you are not changing it unless necessary"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 7279
    :cond_30
    iput-boolean v5, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->changed:Z

    .line 7283
    :goto_32
    return-void

    .line 7267
    :cond_33
    # getter for: Landroid/support/v7/widget/RecyclerView;->mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->access$5100(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDx:I

    iget v2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDy:I

    iget v3, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->smoothScrollBy(III)V

    goto :goto_1d

    .line 7270
    :cond_41
    # getter for: Landroid/support/v7/widget/RecyclerView;->mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->access$5100(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDx:I

    iget v2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDy:I

    iget v3, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->smoothScrollBy(IIILandroid/view/animation/Interpolator;)V

    goto :goto_1d

    .line 7281
    :cond_51
    iput v5, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->consecutiveUpdates:I

    goto :goto_32
.end method

.method private validate()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 7286
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mInterpolator:Landroid/view/animation/Interpolator;

    if-eqz v0, :cond_11

    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    if-ge v0, v1, :cond_11

    .line 7287
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "If you provide an interpolator, you must set a positive duration"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7289
    :cond_11
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    if-ge v0, v1, :cond_1d

    .line 7290
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Scroll duration must be a positive number"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7292
    :cond_1d
    return-void
.end method


# virtual methods
.method public getDuration()I
    .registers 2

    .prologue
    .line 7313
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    return v0
.end method

.method public getDx()I
    .registers 2

    .prologue
    .line 7295
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDx:I

    return v0
.end method

.method public getDy()I
    .registers 2

    .prologue
    .line 7304
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDy:I

    return v0
.end method

.method public getInterpolator()Landroid/view/animation/Interpolator;
    .registers 2

    .prologue
    .line 7322
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method public setDuration(I)V
    .registers 3
    .param p1, "duration"    # I

    .prologue
    .line 7317
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->changed:Z

    .line 7318
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    .line 7319
    return-void
.end method

.method public setDx(I)V
    .registers 3
    .param p1, "dx"    # I

    .prologue
    .line 7299
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->changed:Z

    .line 7300
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDx:I

    .line 7301
    return-void
.end method

.method public setDy(I)V
    .registers 3
    .param p1, "dy"    # I

    .prologue
    .line 7308
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->changed:Z

    .line 7309
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDy:I

    .line 7310
    return-void
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 3
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 7332
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->changed:Z

    .line 7333
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 7334
    return-void
.end method

.method public update(IIILandroid/view/animation/Interpolator;)V
    .registers 6
    .param p1, "dx"    # I
    .param p2, "dy"    # I
    .param p3, "duration"    # I
    .param p4, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 7345
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDx:I

    .line 7346
    iput p2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDy:I

    .line 7347
    iput p3, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    .line 7348
    iput-object p4, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 7349
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->changed:Z

    .line 7350
    return-void
.end method
