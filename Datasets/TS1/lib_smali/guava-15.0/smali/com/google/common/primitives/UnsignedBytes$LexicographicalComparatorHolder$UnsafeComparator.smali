.class final enum Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;
.super Ljava/lang/Enum;
.source "UnsignedBytes.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation build Lcom/google/common/annotations/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "UnsafeComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;",
        ">;",
        "Ljava/util/Comparator",
        "<[B>;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

.field static final BIG_ENDIAN:Z

.field static final BYTE_ARRAY_BASE_OFFSET:I

.field public static final enum INSTANCE:Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

.field static final theUnsafe:Lsun/misc/Unsafe;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 296
    new-instance v0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->INSTANCE:Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    .line 294
    new-array v0, v3, [Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    sget-object v1, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->INSTANCE:Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->$VALUES:[Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    .line 298
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->BIG_ENDIAN:Z

    .line 326
    invoke-static {}, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->getUnsafe()Lsun/misc/Unsafe;

    move-result-object v0

    sput-object v0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->theUnsafe:Lsun/misc/Unsafe;

    .line 328
    sget-object v0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->theUnsafe:Lsun/misc/Unsafe;

    const-class v1, [B

    invoke-virtual {v0, v1}, Lsun/misc/Unsafe;->arrayBaseOffset(Ljava/lang/Class;)I

    move-result v0

    sput v0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->BYTE_ARRAY_BASE_OFFSET:I

    .line 331
    sget-object v0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->theUnsafe:Lsun/misc/Unsafe;

    const-class v1, [B

    invoke-virtual {v0, v1}, Lsun/misc/Unsafe;->arrayIndexScale(Ljava/lang/Class;)I

    move-result v0

    if-eq v0, v3, :cond_3f

    .line 332
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 334
    :cond_3f
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 295
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method private static getUnsafe()Lsun/misc/Unsafe;
    .registers 4

    .prologue
    .line 345
    :try_start_0
    invoke-static {}, Lsun/misc/Unsafe;->getUnsafe()Lsun/misc/Unsafe;
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 348
    :goto_4
    return-object v1

    .line 346
    :catch_5
    move-exception v1

    .line 348
    :try_start_6
    new-instance v1, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator$1;

    invoke-direct {v1}, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator$1;-><init>()V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsun/misc/Unsafe;
    :try_end_11
    .catch Ljava/security/PrivilegedActionException; {:try_start_6 .. :try_end_11} :catch_12

    goto :goto_4

    .line 360
    :catch_12
    move-exception v0

    .line 361
    .local v0, "e":Ljava/security/PrivilegedActionException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Could not initialize intrinsics"

    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 294
    const-class v0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    return-object v0
.end method

.method public static values()[Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;
    .registers 1

    .prologue
    .line 294
    sget-object v0, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->$VALUES:[Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    invoke-virtual {v0}, [Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 294
    check-cast p1, [B

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, [B

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->compare([B[B)I

    move-result v0

    return v0
.end method

.method public compare([B[B)I
    .registers 19
    .param p1, "left"    # [B
    .param p2, "right"    # [B

    .prologue
    .line 367
    move-object/from16 v0, p1

    array-length v10, v0

    move-object/from16 v0, p2

    array-length v11, v0

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 368
    .local v4, "minLength":I
    div-int/lit8 v5, v4, 0x8

    .line 375
    .local v5, "minWords":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_d
    mul-int/lit8 v10, v5, 0x8

    if-ge v1, v10, :cond_50

    .line 376
    sget-object v10, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->theUnsafe:Lsun/misc/Unsafe;

    sget v11, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->BYTE_ARRAY_BASE_OFFSET:I

    int-to-long v11, v11

    int-to-long v13, v1

    add-long/2addr v11, v13

    move-object/from16 v0, p1

    invoke-virtual {v10, v0, v11, v12}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v2

    .line 377
    .local v2, "lw":J
    sget-object v10, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->theUnsafe:Lsun/misc/Unsafe;

    sget v11, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->BYTE_ARRAY_BASE_OFFSET:I

    int-to-long v11, v11

    int-to-long v13, v1

    add-long/2addr v11, v13

    move-object/from16 v0, p2

    invoke-virtual {v10, v0, v11, v12}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    move-result-wide v8

    .line 378
    .local v8, "rw":J
    cmp-long v10, v2, v8

    if-eqz v10, :cond_4d

    .line 379
    sget-boolean v10, Lcom/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$UnsafeComparator;->BIG_ENDIAN:Z

    if-eqz v10, :cond_38

    .line 380
    invoke-static {v2, v3, v8, v9}, Lcom/google/common/primitives/UnsignedLongs;->compare(JJ)I

    move-result v7

    .line 402
    .end local v2    # "lw":J
    .end local v8    # "rw":J
    :cond_37
    :goto_37
    return v7

    .line 390
    .restart local v2    # "lw":J
    .restart local v8    # "rw":J
    :cond_38
    xor-long v10, v2, v8

    invoke-static {v10, v11}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v10

    and-int/lit8 v6, v10, -0x8

    .line 391
    .local v6, "n":I
    ushr-long v10, v2, v6

    const-wide/16 v12, 0xff

    and-long/2addr v10, v12

    ushr-long v12, v8, v6

    const-wide/16 v14, 0xff

    and-long/2addr v12, v14

    sub-long/2addr v10, v12

    long-to-int v7, v10

    goto :goto_37

    .line 375
    .end local v6    # "n":I
    :cond_4d
    add-int/lit8 v1, v1, 0x8

    goto :goto_d

    .line 396
    .end local v2    # "lw":J
    .end local v8    # "rw":J
    :cond_50
    mul-int/lit8 v1, v5, 0x8

    :goto_52
    if-ge v1, v4, :cond_61

    .line 397
    aget-byte v10, p1, v1

    aget-byte v11, p2, v1

    invoke-static {v10, v11}, Lcom/google/common/primitives/UnsignedBytes;->compare(BB)I

    move-result v7

    .line 398
    .local v7, "result":I
    if-nez v7, :cond_37

    .line 396
    add-int/lit8 v1, v1, 0x1

    goto :goto_52

    .line 402
    .end local v7    # "result":I
    :cond_61
    move-object/from16 v0, p1

    array-length v10, v0

    move-object/from16 v0, p2

    array-length v11, v0

    sub-int v7, v10, v11

    goto :goto_37
.end method
