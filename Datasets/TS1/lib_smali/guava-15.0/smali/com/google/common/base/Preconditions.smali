.class public final Lcom/google/common/base/Preconditions;
.super Ljava/lang/Object;
.source "Preconditions.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static badElementIndex(IILjava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "index"    # I
    .param p1, "size"    # I
    .param p2, "desc"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 312
    if-gez p0, :cond_16

    .line 313
    const-string v0, "%s (%s) must not be negative"

    new-array v1, v4, [Ljava/lang/Object;

    aput-object p2, v1, v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 317
    :goto_15
    return-object v0

    .line 314
    :cond_16
    if-gez p1, :cond_31

    .line 315
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "negative size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 317
    :cond_31
    const-string v0, "%s (%s) must be less than size (%s)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p2, v1, v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_15
.end method

.method private static badPositionIndex(IILjava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "index"    # I
    .param p1, "size"    # I
    .param p2, "desc"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 362
    if-gez p0, :cond_16

    .line 363
    const-string v0, "%s (%s) must not be negative"

    new-array v1, v4, [Ljava/lang/Object;

    aput-object p2, v1, v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 367
    :goto_15
    return-object v0

    .line 364
    :cond_16
    if-gez p1, :cond_31

    .line 365
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "negative size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 367
    :cond_31
    const-string v0, "%s (%s) must not be greater than size (%s)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p2, v1, v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_15
.end method

.method private static badPositionIndexes(III)Ljava/lang/String;
    .registers 7
    .param p0, "start"    # I
    .param p1, "end"    # I
    .param p2, "size"    # I

    .prologue
    .line 394
    if-ltz p0, :cond_4

    if-le p0, p2, :cond_b

    .line 395
    :cond_4
    const-string v0, "start index"

    invoke-static {p0, p2, v0}, Lcom/google/common/base/Preconditions;->badPositionIndex(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 401
    :goto_a
    return-object v0

    .line 397
    :cond_b
    if-ltz p1, :cond_f

    if-le p1, p2, :cond_16

    .line 398
    :cond_f
    const-string v0, "end index"

    invoke-static {p1, p2, v0}, Lcom/google/common/base/Preconditions;->badPositionIndex(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 401
    :cond_16
    const-string v0, "end index (%s) must not be less than start index (%s)"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/google/common/base/Preconditions;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method public static checkArgument(Z)V
    .registers 2
    .param p0, "expression"    # Z

    .prologue
    .line 76
    if-nez p0, :cond_8

    .line 77
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 79
    :cond_8
    return-void
.end method

.method public static checkArgument(ZLjava/lang/Object;)V
    .registers 4
    .param p0, "expression"    # Z
    .param p1, "errorMessage"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 92
    if-nez p0, :cond_c

    .line 93
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_c
    return-void
.end method

.method public static varargs checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p0, "expression"    # Z
    .param p1, "errorMessageTemplate"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "errorMessageArgs"    # [Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 119
    if-nez p0, :cond_c

    .line 120
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {p1, p2}, Lcom/google/common/base/Preconditions;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_c
    return-void
.end method

.method public static checkElementIndex(II)I
    .registers 3
    .param p0, "index"    # I
    .param p1, "size"    # I

    .prologue
    .line 285
    const-string v0, "index"

    invoke-static {p0, p1, v0}, Lcom/google/common/base/Preconditions;->checkElementIndex(IILjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static checkElementIndex(IILjava/lang/String;)I
    .registers 5
    .param p0, "index"    # I
    .param p1, "size"    # I
    .param p2, "desc"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 305
    if-ltz p0, :cond_4

    if-lt p0, p1, :cond_e

    .line 306
    :cond_4
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {p0, p1, p2}, Lcom/google/common/base/Preconditions;->badElementIndex(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 308
    :cond_e
    return p0
.end method

.method public static checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 191
    .local p0, "reference":Ljava/lang/Object;, "TT;"
    if-nez p0, :cond_8

    .line 192
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 194
    :cond_8
    return-object p0
.end method

.method public static checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "errorMessage"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 208
    .local p0, "reference":Ljava/lang/Object;, "TT;"
    if-nez p0, :cond_c

    .line 209
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 211
    :cond_c
    return-object p0
.end method

.method public static varargs checkNotNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "errorMessageTemplate"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "errorMessageArgs"    # [Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 234
    .local p0, "reference":Ljava/lang/Object;, "TT;"
    if-nez p0, :cond_c

    .line 236
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-static {p1, p2}, Lcom/google/common/base/Preconditions;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 239
    :cond_c
    return-object p0
.end method

.method public static checkPositionIndex(II)I
    .registers 3
    .param p0, "index"    # I
    .param p1, "size"    # I

    .prologue
    .line 335
    const-string v0, "index"

    invoke-static {p0, p1, v0}, Lcom/google/common/base/Preconditions;->checkPositionIndex(IILjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static checkPositionIndex(IILjava/lang/String;)I
    .registers 5
    .param p0, "index"    # I
    .param p1, "size"    # I
    .param p2, "desc"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 355
    if-ltz p0, :cond_4

    if-le p0, p1, :cond_e

    .line 356
    :cond_4
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {p0, p1, p2}, Lcom/google/common/base/Preconditions;->badPositionIndex(IILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 358
    :cond_e
    return p0
.end method

.method public static checkPositionIndexes(III)V
    .registers 5
    .param p0, "start"    # I
    .param p1, "end"    # I
    .param p2, "size"    # I

    .prologue
    .line 388
    if-ltz p0, :cond_6

    if-lt p1, p0, :cond_6

    if-le p1, p2, :cond_10

    .line 389
    :cond_6
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {p0, p1, p2}, Lcom/google/common/base/Preconditions;->badPositionIndexes(III)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 391
    :cond_10
    return-void
.end method

.method public static checkState(Z)V
    .registers 2
    .param p0, "expression"    # Z

    .prologue
    .line 133
    if-nez p0, :cond_8

    .line 134
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 136
    :cond_8
    return-void
.end method

.method public static checkState(ZLjava/lang/Object;)V
    .registers 4
    .param p0, "expression"    # Z
    .param p1, "errorMessage"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 149
    if-nez p0, :cond_c

    .line 150
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 152
    :cond_c
    return-void
.end method

.method public static varargs checkState(ZLjava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p0, "expression"    # Z
    .param p1, "errorMessageTemplate"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "errorMessageArgs"    # [Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 176
    if-nez p0, :cond_c

    .line 177
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {p1, p2}, Lcom/google/common/base/Preconditions;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 180
    :cond_c
    return-void
.end method

.method static varargs format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 9
    .param p0, "template"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation

    .prologue
    .line 419
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 422
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    array-length v6, p1

    mul-int/lit8 v6, v6, 0x10

    add-int/2addr v5, v6

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 424
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 425
    .local v4, "templateStart":I
    const/4 v1, 0x0

    .line 426
    .local v1, "i":I
    :goto_13
    array-length v5, p1

    if-ge v1, v5, :cond_1f

    .line 427
    const-string v5, "%s"

    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 428
    .local v3, "placeholderStart":I
    const/4 v5, -0x1

    if-ne v3, v5, :cond_47

    .line 435
    .end local v3    # "placeholderStart":I
    :cond_1f
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    array-length v5, p1

    if-ge v1, v5, :cond_5e

    .line 439
    const-string v5, " ["

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 440
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    aget-object v5, p1, v1

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move v1, v2

    .line 441
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :goto_36
    array-length v5, p1

    if-ge v1, v5, :cond_59

    .line 442
    const-string v5, ", "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 443
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    aget-object v5, p1, v1

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_36

    .line 431
    .restart local v3    # "placeholderStart":I
    :cond_47
    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    aget-object v5, p1, v1

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 433
    add-int/lit8 v4, v3, 0x2

    move v1, v2

    .line 434
    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_13

    .line 445
    .end local v3    # "placeholderStart":I
    :cond_59
    const/16 v5, 0x5d

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 448
    :cond_5e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method
