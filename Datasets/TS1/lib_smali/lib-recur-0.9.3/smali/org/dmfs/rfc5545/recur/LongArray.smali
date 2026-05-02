.class final Lorg/dmfs/rfc5545/recur/LongArray;
.super Ljava/lang/Object;


# static fields
.field private static final DEFAULT_SIZE:I = 0x30


# instance fields
.field private mCount:I

.field private mLongs:[J

.field private mPos:I

.field private mSorted:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    const/16 v0, 0x30

    invoke-direct {p0, v0}, Lorg/dmfs/rfc5545/recur/LongArray;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mCount:I

    iput v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mPos:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mSorted:Z

    new-array v0, p1, [J

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mLongs:[J

    return-void
.end method

.method private resizeBuffer(I)[J
    .registers 6

    const/4 v3, 0x0

    new-array v0, p1, [J

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mLongs:[J

    array-length v2, v1

    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mLongs:[J

    return-object v0
.end method


# virtual methods
.method public add(J)V
    .registers 9

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mLongs:[J

    array-length v1, v0

    iget v2, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mCount:I

    if-ne v2, v1, :cond_e

    shr-int/lit8 v0, v1, 0x1

    add-int/2addr v0, v1

    invoke-direct {p0, v0}, Lorg/dmfs/rfc5545/recur/LongArray;->resizeBuffer(I)[J

    move-result-object v0

    :cond_e
    iget-boolean v3, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mSorted:Z

    if-eqz v2, :cond_1a

    add-int/lit8 v1, v2, -0x1

    aget-wide v4, v0, v1

    cmp-long v1, p1, v4

    if-lez v1, :cond_25

    :cond_1a
    const/4 v1, 0x1

    :goto_1b
    and-int/2addr v1, v3

    iput-boolean v1, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mSorted:Z

    add-int/lit8 v1, v2, 0x1

    aput-wide p1, v0, v2

    iput v1, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mCount:I

    return-void

    :cond_25
    const/4 v1, 0x0

    goto :goto_1b
.end method

.method public clear()V
    .registers 2

    const/4 v0, 0x0

    iput v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mCount:I

    iput v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mPos:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mSorted:Z

    return-void
.end method

.method public deduplicate()V
    .registers 10

    const/4 v0, 0x1

    iget-boolean v1, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mSorted:Z

    if-eqz v1, :cond_6

    :goto_5
    return-void

    :cond_6
    iget v6, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mCount:I

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/LongArray;->sort()V

    iget-object v7, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mLongs:[J

    const/4 v1, 0x0

    aget-wide v2, v7, v1

    move v5, v0

    move v4, v0

    :goto_12
    if-ge v5, v6, :cond_24

    aget-wide v0, v7, v5

    cmp-long v8, v0, v2

    if-lez v8, :cond_27

    add-int/lit8 v2, v4, 0x1

    aput-wide v0, v7, v4

    :goto_1e
    add-int/lit8 v3, v5, 0x1

    move v5, v3

    move v4, v2

    move-wide v2, v0

    goto :goto_12

    :cond_24
    iput v4, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mCount:I

    goto :goto_5

    :cond_27
    move-wide v0, v2

    move v2, v4

    goto :goto_1e
.end method

.method public hasNext()Z
    .registers 3

    iget v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mPos:I

    iget v1, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mCount:I

    if-ge v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public next()J
    .registers 4

    iget v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mPos:I

    iget v1, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mCount:I

    if-lt v0, v1, :cond_e

    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v1, "no more elements"

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mLongs:[J

    iget v1, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mPos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mPos:I

    aget-wide v0, v0, v1

    return-wide v0
.end method

.method public peek()J
    .registers 3

    iget v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mPos:I

    iget v1, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mCount:I

    if-lt v0, v1, :cond_e

    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v1, "no more elements"

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mLongs:[J

    iget v1, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mPos:I

    aget-wide v0, v0, v1

    return-wide v0
.end method

.method public size()I
    .registers 2

    iget v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mCount:I

    return v0
.end method

.method public sort()V
    .registers 4

    iget-boolean v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mSorted:Z

    if-nez v0, :cond_f

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mLongs:[J

    const/4 v1, 0x0

    iget v2, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mCount:I

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->sort([JII)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recur/LongArray;->mSorted:Z

    :cond_f
    return-void
.end method
