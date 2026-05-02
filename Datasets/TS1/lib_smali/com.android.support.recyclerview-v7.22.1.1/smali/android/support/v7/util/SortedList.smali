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
    .line 66
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "callback":Landroid/support/v7/util/SortedList$Callback;, "Landroid/support/v7/util/SortedList$Callback<TT;>;"
    const/16 v0, 0xa

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/util/SortedList;-><init>(Ljava/lang/Class;Landroid/support/v7/util/SortedList$Callback;I)V

    .line 67
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
    .line 76
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "callback":Landroid/support/v7/util/SortedList$Callback;, "Landroid/support/v7/util/SortedList$Callback<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    .line 78
    invoke-static {p1, p3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    .line 79
    iput-object p2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    .line 80
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 81
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

    .line 175
    invoke-direct {p0, p1, v4}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;I)I

    move-result v1

    .line 176
    .local v1, "index":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_15

    .line 177
    const/4 v1, 0x0

    .line 192
    :cond_9
    invoke-direct {p0, v1, p1}, Landroid/support/v7/util/SortedList;->addToData(ILjava/lang/Object;)V

    .line 193
    if-eqz p2, :cond_13

    .line 194
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v1, v4}, Landroid/support/v7/util/SortedList$Callback;->onInserted(II)V

    :cond_13
    move v2, v1

    .line 196
    .end local v1    # "index":I
    .local v2, "index":I
    :goto_14
    return v2

    .line 178
    .end local v2    # "index":I
    .restart local v1    # "index":I
    :cond_15
    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-ge v1, v3, :cond_9

    .line 179
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v0, v3, v1

    .line 180
    .local v0, "existing":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v0, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 181
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v0, p1}, Landroid/support/v7/util/SortedList$Callback;->areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_33

    .line 183
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p1, v3, v1

    move v2, v1

    .line 184
    .end local v1    # "index":I
    .restart local v2    # "index":I
    goto :goto_14

    .line 186
    .end local v2    # "index":I
    .restart local v1    # "index":I
    :cond_33
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p1, v3, v1

    .line 187
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v1, v4}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    move v2, v1

    .line 188
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

    .line 402
    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-le p1, v1, :cond_2a

    .line 403
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

    .line 406
    :cond_2a
    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    array-length v2, v2

    if-ne v1, v2, :cond_5b

    .line 408
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mTClass:Ljava/lang/Class;

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    array-length v2, v2

    add-int/lit8 v2, v2, 0xa

    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    move-object v0, v1

    check-cast v0, [Ljava/lang/Object;

    .line 409
    .local v0, "newData":[Ljava/lang/Object;, "[TT;"
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    invoke-static {v1, v3, v0, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 410
    aput-object p2, v0, p1

    .line 411
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    add-int/lit8 v2, p1, 0x1

    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    sub-int/2addr v3, p1

    invoke-static {v1, p1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 412
    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    .line 418
    .end local v0    # "newData":[Ljava/lang/Object;, "[TT;"
    :goto_54
    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 419
    return-void

    .line 415
    :cond_5b
    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    add-int/lit8 v3, p1, 0x1

    iget v4, p0, Landroid/support/v7/util/SortedList;->mSize:I

    sub-int/2addr v4, p1

    invoke-static {v1, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 416
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

    .line 350
    const/4 v2, 0x0

    .line 351
    .local v2, "left":I
    iget v5, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 352
    .local v5, "right":I
    :goto_5
    if-ge v2, v5, :cond_33

    .line 353
    add-int v7, v2, v5

    div-int/lit8 v3, v7, 0x2

    .line 354
    .local v3, "middle":I
    iget-object v7, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v4, v7, v3

    .line 355
    .local v4, "myItem":Ljava/lang/Object;, "TT;"
    iget-object v7, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v7, v4, p1}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 356
    .local v0, "cmp":I
    if-gez v0, :cond_1a

    .line 357
    add-int/lit8 v2, v3, 0x1

    goto :goto_5

    .line 358
    :cond_1a
    if-nez v0, :cond_31

    .line 359
    iget-object v7, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v7, v4, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_25

    .line 373
    .end local v0    # "cmp":I
    .end local v2    # "left":I
    .end local v3    # "middle":I
    .end local v4    # "myItem":Ljava/lang/Object;, "TT;"
    :cond_24
    :goto_24
    return v3

    .line 362
    .restart local v0    # "cmp":I
    .restart local v2    # "left":I
    .restart local v3    # "middle":I
    .restart local v4    # "myItem":Ljava/lang/Object;, "TT;"
    :cond_25
    invoke-direct {p0, p1, v3, v2, v5}, Landroid/support/v7/util/SortedList;->linearEqualitySearch(Ljava/lang/Object;III)I

    move-result v1

    .line 363
    .local v1, "exact":I
    if-ne p2, v8, :cond_2f

    .line 364
    if-eq v1, v6, :cond_24

    move v3, v1

    goto :goto_24

    :cond_2f
    move v3, v1

    .line 366
    goto :goto_24

    .line 370
    .end local v1    # "exact":I
    :cond_31
    move v5, v3

    goto :goto_5

    .line 373
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
    .line 378
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    add-int/lit8 v1, p2, -0x1

    .local v1, "next":I
    :goto_2
    if-lt v1, p3, :cond_10

    .line 379
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v2, v3, v1

    .line 380
    .local v2, "nextItem":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 381
    .local v0, "cmp":I
    if-eqz v0, :cond_22

    .line 388
    .end local v0    # "cmp":I
    .end local v2    # "nextItem":Ljava/lang/Object;, "TT;"
    :cond_10
    add-int/lit8 v1, p2, 0x1

    :goto_12
    if-ge v1, p4, :cond_20

    .line 389
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aget-object v2, v3, v1

    .line 390
    .restart local v2    # "nextItem":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 391
    .restart local v0    # "cmp":I
    if-eqz v0, :cond_2f

    .line 398
    .end local v0    # "cmp":I
    .end local v2    # "nextItem":Ljava/lang/Object;, "TT;"
    :cond_20
    const/4 v3, -0x1

    :goto_21
    return v3

    .line 384
    .restart local v0    # "cmp":I
    .restart local v2    # "nextItem":Ljava/lang/Object;, "TT;"
    :cond_22
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2c

    move v3, v1

    .line 385
    goto :goto_21

    .line 378
    :cond_2c
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    .line 394
    :cond_2f
    iget-object v3, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v3, v2, p1}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_39

    move v3, v1

    .line 395
    goto :goto_21

    .line 388
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
    .line 222
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x2

    invoke-direct {p0, p1, v1}, Landroid/support/v7/util/SortedList;->findIndexOf(Ljava/lang/Object;I)I

    move-result v0

    .line 223
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_a

    .line 224
    const/4 v1, 0x0

    .line 227
    :goto_9
    return v1

    .line 226
    :cond_a
    invoke-direct {p0, v0, p2}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    .line 227
    const/4 v1, 0x1

    goto :goto_9
.end method

.method private removeItemAtIndex(IZ)V
    .registers 7
    .param p1, "index"    # I
    .param p2, "notify"    # Z

    .prologue
    .line 231
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    add-int/lit8 v1, p1, 0x1

    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v7/util/SortedList;->mSize:I

    sub-int/2addr v3, p1

    add-int/lit8 v3, v3, -0x1

    invoke-static {v0, v1, v2, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 232
    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    .line 233
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    iget v1, p0, Landroid/support/v7/util/SortedList;->mSize:I

    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 234
    if-eqz p2, :cond_23

    .line 235
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/support/v7/util/SortedList$Callback;->onRemoved(II)V

    .line 237
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
    .line 117
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
    .line 153
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    instance-of v0, v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    if-eqz v0, :cond_7

    .line 160
    :goto_6
    return-void

    .line 156
    :cond_7
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    if-nez v0, :cond_14

    .line 157
    new-instance v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-direct {v0, v1}, Landroid/support/v7/util/SortedList$BatchedCallback;-><init>(Landroid/support/v7/util/SortedList$Callback;)V

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    .line 159
    :cond_14
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    goto :goto_6
.end method

.method public endBatchedUpdates()V
    .registers 3

    .prologue
    .line 166
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    instance-of v0, v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    if-eqz v0, :cond_d

    .line 167
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    check-cast v0, Landroid/support/v7/util/SortedList$BatchedCallback;

    invoke-virtual {v0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    .line 169
    :cond_d
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    iget-object v1, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    if-ne v0, v1, :cond_1b

    .line 170
    iget-object v0, p0, Landroid/support/v7/util/SortedList;->mBatchedCallback:Landroid/support/v7/util/SortedList$BatchedCallback;

    # getter for: Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;
    invoke-static {v0}, Landroid/support/v7/util/SortedList$BatchedCallback;->access$000(Landroid/support/v7/util/SortedList$BatchedCallback;)Landroid/support/v7/util/SortedList$Callback;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    .line 172
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
    .line 331
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    iget v0, p0, Landroid/support/v7/util/SortedList;->mSize:I

    if-ge p1, v0, :cond_6

    if-gez p1, :cond_2b

    .line 332
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

    .line 335
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
    .line 346
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

    .line 314
    invoke-virtual {p0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 315
    .local v0, "item":Ljava/lang/Object;, "TT;"
    invoke-direct {p0, p1, v2}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    .line 316
    invoke-direct {p0, v0, v2}, Landroid/support/v7/util/SortedList;->add(Ljava/lang/Object;Z)I

    move-result v1

    .line 317
    .local v1, "newIndex":I
    if-eq p1, v1, :cond_13

    .line 318
    iget-object v2, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v2, p1, v1}, Landroid/support/v7/util/SortedList$Callback;->onMoved(II)V

    .line 320
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
    .line 206
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
    .line 216
    .local p0, "this":Landroid/support/v7/util/SortedList;, "Landroid/support/v7/util/SortedList<TT;>;"
    invoke-virtual {p0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 217
    .local v0, "item":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x1

    invoke-direct {p0, p1, v1}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    .line 218
    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 89
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

    .line 260
    invoke-virtual {p0, p1}, Landroid/support/v7/util/SortedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 262
    .local v2, "existing":Ljava/lang/Object;, "TT;"
    if-eq v2, p2, :cond_10

    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, v2, p2}, Landroid/support/v7/util/SortedList$Callback;->areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_27

    :cond_10
    move v1, v5

    .line 263
    .local v1, "contentsChanged":Z
    :goto_11
    if-eq v2, p2, :cond_29

    .line 265
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, v2, p2}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 266
    .local v0, "cmp":I
    if-nez v0, :cond_29

    .line 267
    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mData:[Ljava/lang/Object;

    aput-object p2, v4, p1

    .line 268
    if-eqz v1, :cond_26

    .line 269
    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v4, p1, v5}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    .line 283
    .end local v0    # "cmp":I
    :cond_26
    :goto_26
    return-void

    .end local v1    # "contentsChanged":Z
    :cond_27
    move v1, v4

    .line 262
    goto :goto_11

    .line 274
    .restart local v1    # "contentsChanged":Z
    :cond_29
    if-eqz v1, :cond_30

    .line 275
    iget-object v6, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v6, p1, v5}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    .line 278
    :cond_30
    invoke-direct {p0, p1, v4}, Landroid/support/v7/util/SortedList;->removeItemAtIndex(IZ)V

    .line 279
    invoke-direct {p0, p2, v4}, Landroid/support/v7/util/SortedList;->add(Ljava/lang/Object;Z)I

    move-result v3

    .line 280
    .local v3, "newIndex":I
    if-eq p1, v3, :cond_26

    .line 281
    iget-object v4, p0, Landroid/support/v7/util/SortedList;->mCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v4, p1, v3}, Landroid/support/v7/util/SortedList$Callback;->onMoved(II)V

    goto :goto_26
.end method
