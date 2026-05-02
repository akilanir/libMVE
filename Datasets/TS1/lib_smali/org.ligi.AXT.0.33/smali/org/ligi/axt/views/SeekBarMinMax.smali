.class public Lorg/ligi/axt/views/SeekBarMinMax;
.super Landroid/widget/SeekBar;
.source "SeekBarMinMax.java"


# instance fields
.field private final min:I


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "min"    # I
    .param p3, "max"    # I

    .prologue
    .line 14
    invoke-direct {p0, p1}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 16
    if-le p2, p3, :cond_d

    .line 17
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "max must be bigger than min for SeegBarMinMax"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 20
    :cond_d
    iput p2, p0, Lorg/ligi/axt/views/SeekBarMinMax;->min:I

    .line 21
    sub-int v0, p3, p2

    invoke-virtual {p0, v0}, Lorg/ligi/axt/views/SeekBarMinMax;->setMax(I)V

    .line 22
    return-void
.end method


# virtual methods
.method public declared-synchronized getProgress()I
    .registers 3

    .prologue
    .line 26
    monitor-enter p0

    :try_start_1
    invoke-super {p0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    iget v1, p0, Lorg/ligi/axt/views/SeekBarMinMax;->min:I
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_a

    add-int/2addr v0, v1

    monitor-exit p0

    return v0

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setProgress(I)V
    .registers 3
    .param p1, "progress"    # I

    .prologue
    .line 31
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lorg/ligi/axt/views/SeekBarMinMax;->min:I

    sub-int v0, p1, v0

    invoke-super {p0, v0}, Landroid/widget/SeekBar;->setProgress(I)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    .line 32
    monitor-exit p0

    return-void

    .line 31
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method
