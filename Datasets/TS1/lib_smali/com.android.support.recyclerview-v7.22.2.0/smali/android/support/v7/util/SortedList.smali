.class public Landroid/support/v7/util/SortedList;
.super Ljava/lang/Object;
.source "SortedList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/util/SortedList$BatchedCallback;,
        Landroid/support/v7/util/SortedList$Callback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final CAPACITY_GROWTH:I = 0xa

.field private static final DELETION:I = 0x2

.field private static final INSERTION:I = 0x1

.field public static final INVALID_POSITION:I = -0x1

.field private static final LOOKUP:I = 0x4

.field private static final MIN_CAPACITY:I = 0xa


# instance fields
.field private mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

.field private mCallback:Landroid/support/v7/util/SortedList$Callback;

.field mData:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field private mSize:I

.field private final mTClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Landroid/support/v7/util/SortedList$Callback;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Landroid/support/v7/util/SortedList$Callback",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "callback":Landroid/support/v7/util/SortedList$Callback;, "Landroid/support/v7/util/SortedList$Callback<TT;>;"
    const/16 v0, 0xa

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/util/SortedList;-><init>(Ljava/lang/Class;Landroid/support/v7/util/SortedList$Callback;I)V

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Landroid/support/v7/util/SortedList$Callback;I)V
    .registers 5
    .param p3, "initialCapacity"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Landroid/support/v7/util/SortedList$Callback",
            "<TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 77
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "callback":Landroid/support/v7/util/SortedList$Callback;, "Landroid/support/v7/util/SortedList$Callback<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput-object p1, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    .line 79
    invoke-static {p1, p3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    .line 80
    iput-object p2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    .line 81
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 82
    return-void
.end method

.method private add(Ljava/lang/Object;Z)I
    .registers 8
    .param p2, "notify"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)I"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    const/4 v4, 0x1

    .line 176
    invoke-direct {p0, p1, v4}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;I)I

    move-result v1

    .line 177
    .local v1, "index":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_15

    .line 178
    const/4 v1, 0x0

    .line 193
    :cond_9
    invoke-direct {p0, v1, p1}, Landroid/support/v7/util/SortedList;->addToData(ILjava/lang/Object;)V

    .line 194
    if-eqz p2, :cond_13

    .line 195
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v1, v4}, Landroid/support/v7/util/SortedList$Callback;->onInserted(II)V

    :cond_13
    move v2, v1

    .line 197
    .end local v1    # "index":I
    .local v2, "index":I
    :goto_14
    return v2

    .line 179
    .end local v2    # "index":I
    .restart local v1    # "index":I
    :cond_15
    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-ge v1, v3, :cond_9

    .line 180
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v0, v3, v1

    .line 181
    .local v0, "existing":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v0, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 182
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v0, p1}, Landroid/support/v7/util/SortedList$Callback;->areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_33

    .line 184
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p1, v3, v1

    move v2, v1

    .line 185
    .end local v1    # "index":I
    .restart local v2    # "index":I
    goto :goto_14

    .line 187
    .end local v2    # "index":I
    .restart local v1    # "index":I
    :cond_33
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p1, v3, v1

    .line 188
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v1, v4}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    move v2, v1

    .line 189
    .end local v1    # "index":I
    .restart local v2    # "index":I
    goto :goto_14
.end method

.method private addToData(ILjava/lang/Object;)V
    .registers 8
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p2, "item":Ljava/lang/Object;, "TT;"
    const/4 v3, 0x0

    .line 403
    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-le p1, v1, :cond_2a

    .line 404
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot add item to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " because size is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 407
    :cond_2a
    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    array-length v2, v2

    if-ne v1, v2, :cond_5b

    .line 409
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    array-length v2, v2

    add-int/lit8 v2, v2, 0xa

    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    move-object v0, v1

    check-cast v0, [Ljava/lang/Object;

    .line 410
    .local v0, "newData":[Ljava/lang/Object;, "[TT;"
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    invoke-static {v1, v3, v0, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 411
    aput-object p2, v0, p1

    .line 412
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    add-int/lit8 v2, p1, 0x1

    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    sub-int/2addr v3, p1

    invoke-static {v1, p1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 413
    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    .line 419
    .end local v0    # "newData":[Ljava/lang/Object;, "[TT;"
    :goto_54
    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 420
    return-void

    .line 416
    :cond_5b
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    add-int/lit8 v3, p1, 0x1

    iget v4, p0, Landroid/support/v7/util/SortedList;->mSize:I

    sub-int/2addr v4, p1

    invoke-static {v1, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 417
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p2, v1, p1

    goto :goto_54
.end method

.method private findIndexOf(Ljava/lang/Object;I)I
    .registers 12
    .param p2, "reason"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)I"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    const/4 v8, 0x1

    const/4 v6, -0x1

    .line 351
    const/4 v2, 0x0

    .line 352
    .local v2, "left":I
    iget v5, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 353
    .local v5, "right":I
    :goto_5
    if-ge v2, v5, :cond_33

    .line 354
    add-int v7, v2, v5

    div-int/lit8 v3, v7, 0x2

    .line 355
    .local v3, "middle":I
    iget-object v7, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v4, v7, v3

    .line 356
    .local v4, "myItem":Ljava/lang/Object;, "TT;"
    iget-object v7, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v7, v4, p1}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 357
    .local v0, "cmp":I
    if-gez v0, :cond_1a

    .line 358
    add-int/lit8 v2, v3, 0x1

    goto :goto_5

    .line 359
    :cond_1a
    if-nez v0, :cond_31

    .line 360
    iget-object v7, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v7, v4, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_25

    .line 374
    .end local v0    # "cmp":I
    .end local v2    # "left":I
    .end local v3    # "middle":I
    .end local v4    # "myItem":Ljava/lang/Object;, "TT;"
    :cond_24
    :goto_24
    return v3

    .line 363
    .restart local v0    # "cmp":I
    .restart local v2    # "left":I
    .restart local v3    # "middle":I
    .restart local v4    # "myItem":Ljava/lang/Object;, "TT;"
    :cond_25
    invoke-direct {p0, p1, v3, v2, v5}, Landroid/support/v7/util/SortedList;->linearEqualitySearch(Ljava/lang/Object;III)I

    move-result v1

    .line 364
    .local v1, "exact":I
    if-ne p2, v8, :cond_2f

    .line 365
    if-eq v1, v6, :cond_24

    move v3, v1

    goto :goto_24

    :cond_2f
    move v3, v1

    .line 367
    goto :goto_24

    .line 371
    .end local v1    # "exact":I
    :cond_31
    move v5, v3

    goto :goto_5

    .line 374
    .end local v0    # "cmp":I
    .end local v3    # "middle":I
    .end local v4    # "myItem":Ljava/lang/Object;, "TT;"
    :cond_33
    if-ne p2, v8, :cond_37

    .end local v2    # "left":I
    :goto_35
    move v3, v2

    goto :goto_24

    .restart local v2    # "left":I
    :cond_37
    move v2, v6

    goto :goto_35
.end method

.method private linearEqualitySearch(Ljava/lang/Object;III)I
    .registers 9
    .param p2, "middle"    # I
    .param p3, "left"    # I
    .param p4, "right"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;III)I"
        }
    .end annotation

    .prologue
    .line 379
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    add-int/lit8 v1, p2, -0x1

    .local v1, "next":I
    :goto_2
    if-lt v1, p3, :cond_10

    .line 380
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v2, v3, v1

    .line 381
    .local v2, "nextItem":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 382
    .local v0, "cmp":I
    if-eqz v0, :cond_22

    .line 389
    .end local v0    # "cmp":I
    .end local v2    # "nextItem":Ljava/lang/Object;, "TT;"
    :cond_10
    add-int/lit8 v1, p2, 0x1

    :goto_12
    if-ge v1, p4, :cond_20

    .line 390
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v2, v3, v1

    .line 391
    .restart local v2    # "nextItem":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 392
    .restart local v0    # "cmp":I
    if-eqz v0, :cond_2f

    .line 399
    .end local v0    # "cmp":I
    .end local v2    # "nextItem":Ljava/lang/Object;, "TT;"
    :cond_20
    const/4 v3, -0x1

    :goto_21
    return v3

    .line 385
    .restart local v0    # "cmp":I
    .restart local v2    # "nextItem":Ljava/lang/Object;, "TT;"
    :cond_22
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2c

    move v3, v1

    .line 386
    goto :goto_21

    .line 379
    :cond_2c
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    .line 395
    :cond_2f
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_39

    move v3, v1

    .line 396
    goto :goto_21

    .line 389
    :cond_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_12
.end method

.method private remove(Ljava/lang/Object;Z)Z
    .registers 5
    .param p2, "notify"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)Z"
        }
    .end annotation

    .prologue
    .line 223
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x2

    invoke-direct {p0, p1, v1}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;I)I

    move-result v0

    .line 224
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    .line 225
    const/4 v1, 0x0

    .line 228
    :goto_9
    return v1

    .line 227
    :cond_a
    invoke-direct {p0, v0, p2}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    .line 228
    const/4 v1, 0x1

    goto :goto_9
.end method

.method private removeItemAtIndex(IZ)V
    .registers 7
    .param p1, "index"    # I
    .param p2, "notify"    # Z

    .prologue
    .line 232
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    add-int/lit8 v1, p1, 0x1

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    sub-int/2addr v3, p1

    add-int/lit8 v3, v3, -0x1

    invoke-static {v0, v1, v2, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 233
    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 234
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 235
    if-eqz p2, :cond_23

    .line 236
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/support/v7/util/SortedList$Callback;->onRemoved(II)V

    .line 238
    :cond_23
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 118
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/support/v7/util/SortedList;->add(Ljava/lang/Object;Z)I

    move-result v0

    return v0
.end method

.method public beginBatchedUpdates()V
    .registers 3

    .prologue
    .line 154
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    instance-of v0, v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    if-eqz v0, :cond_7

    .line 161
    :goto_6
    return-void

    .line 157
    :cond_7
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    if-nez v0, :cond_14

    .line 158
    new-instance v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-direct {v0, v1}, Landroid/support/v7/util/SortedList$BatchedCallback;-><init>(Landroid/support/v7/util/SortedList$Callback;)V

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    .line 160
    :cond_14
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    goto :goto_6
.end method

.method public clear()V
    .registers 5

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    const/4 v3, 0x0

    .line 426
    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-nez v1, :cond_6

    .line 433
    :goto_5
    return-void

    .line 429
    :cond_6
    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 430
    .local v0, "prevSize":I
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {v1, v3, v0, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 431
    iput v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 432
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v1, v3, v0}, Landroid/support/v7/util/SortedList$Callback;->onRemoved(II)V

    goto :goto_5
.end method

.method public endBatchedUpdates()V
    .registers 3

    .prologue
    .line 167
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    instance-of v0, v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    if-eqz v0, :cond_d

    .line 168
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    check-cast v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    invoke-virtual {v0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    .line 170
    :cond_d
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    if-ne v0, v1, :cond_1b

    .line 171
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    # getter for: Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;
    invoke-static {v0}, Landroid/support/v7/util/SortedList$BatchedCallback;->access$000(Landroid/support/v7/util/SortedList$BatchedCallback;)Landroid/support/v7/util/SortedList$Callback;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    .line 173
    :cond_1b
    return-void
.end method

.method public get(I)Ljava/lang/Object;
    .registers 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IndexOutOfBoundsException;
        }
    .end annotation

    .prologue
    .line 332
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-ge p1, v0, :cond_6

    if-gez p1, :cond_2b

    .line 333
    :cond_6
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Asked to get item at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " but size is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/util/SortedList;->mSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 336
    :cond_2b
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 347
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x4

    invoke-direct {p0, p1, v0}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method public recalculatePositionOfItemAt(I)V
    .registers 5
    .param p1, "index"    # I

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    const/4 v2, 0x0

    .line 315
    invoke-virtual {p0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 316
    .local v0, "item":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, p1, v2}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    .line 317
    invoke-direct {p0, v0, v2}, Landroid/support/v7/util/SortedList;->add(Ljava/lang/Object;Z)I

    move-result v1

    .line 318
    .local v1, "newIndex":I
    if-eq p1, v1, :cond_13

    .line 319
    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v2, p1, v1}, Landroid/support/v7/util/SortedList$Callback;->onMoved(II)V

    .line 321
    :cond_13
    return-void
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 207
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/support/v7/util/SortedList;->remove(Ljava/lang/Object;Z)Z

    move-result v0

    return v0
.end method

.method public removeItemAt(I)Ljava/lang/Object;
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 217
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    invoke-virtual {p0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 218
    .local v0, "item":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x1

    invoke-direct {p0, p1, v1}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    .line 219
    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 90
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    return v0
.end method

.method public updateItemAt(ILjava/lang/Object;)V
    .registers 10
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p2, "item":Ljava/lang/Object;, "TT;"
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 261
    invoke-virtual {p0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 263
    .local v2, "existing":Ljava/lang/Object;, "TT;"
    if-eq v2, p2, :cond_10

    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, v2, p2}, Landroid/support/v7/util/SortedList$Callback;->areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_27

    :cond_10
    move v1, v5

    .line 264
    .local v1, "contentsChanged":Z
    :goto_11
    if-eq v2, p2, :cond_29

    .line 266
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, v2, p2}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 267
    .local v0, "cmp":I
    if-nez v0, :cond_29

    .line 268
    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p2, v4, p1

    .line 269
    if-eqz v1, :cond_26

    .line 270
    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v4, p1, v5}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    .line 284
    .end local v0    # "cmp":I
    :cond_26
    :goto_26
    return-void

    .end local v1    # "contentsChanged":Z
    :cond_27
    move v1, v4

    .line 263
    goto :goto_11

    .line 275
    .restart local v1    # "contentsChanged":Z
    :cond_29
    if-eqz v1, :cond_30

    .line 276
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, p1, v5}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    .line 279
    :cond_30
    invoke-direct {p0, p1, v4}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    .line 280
    invoke-direct {p0, p2, v4}, Landroid/support/v7/util/SortedList;->add(Ljava/lang/Object;Z)I

    move-result v3

    .line 281
    .local v3, "newIndex":I
    if-eq p1, v3, :cond_26

    .line 282
    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v4, p1, v3}, Landroid/support/v7/util/SortedList$Callback;->onMoved(II)V

    goto :goto_26
.end method
