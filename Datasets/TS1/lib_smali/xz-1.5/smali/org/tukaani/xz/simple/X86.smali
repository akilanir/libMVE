.class public final Lorg/tukaani/xz/simple/X86;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/tukaani/xz/simple/SimpleFilter;


# static fields
.field private static final MASK_TO_ALLOWED_STATUS:[Z

.field private static final MASK_TO_BIT_NUMBER:[I


# instance fields
.field private final isEncoder:Z

.field private pos:I

.field private prevMask:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/16 v1, 0x8

    new-array v0, v1, [Z

    fill-array-data v0, :array_12

    sput-object v0, Lorg/tukaani/xz/simple/X86;->MASK_TO_ALLOWED_STATUS:[Z

    new-array v0, v1, [I

    fill-array-data v0, :array_1a

    sput-object v0, Lorg/tukaani/xz/simple/X86;->MASK_TO_BIT_NUMBER:[I

    return-void

    nop

    :array_12
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x0t
    .end array-data

    :array_1a
    .array-data 4
        0x0
        0x1
        0x2
        0x2
        0x3
        0x3
        0x3
        0x3
    .end array-data
.end method

.method public constructor <init>(ZI)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    iput-boolean p1, p0, Lorg/tukaani/xz/simple/X86;->isEncoder:Z

    add-int/lit8 v0, p2, 0x5

    iput v0, p0, Lorg/tukaani/xz/simple/X86;->pos:I

    return-void
.end method

.method private static test86MSByte(B)Z
    .registers 3

    and-int/lit16 v0, p0, 0xff

    if-eqz v0, :cond_8

    const/16 v1, 0xff

    if-ne v0, v1, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method


# virtual methods
.method public code([BII)I
    .registers 11

    const/4 v2, 0x0

    add-int/lit8 v0, p2, -0x1

    add-int v1, p2, p3

    add-int/lit8 v3, v1, -0x5

    move v1, p2

    :goto_8
    if-gt v1, v3, :cond_de

    aget-byte v4, p1, v1

    and-int/lit16 v4, v4, 0xfe

    const/16 v5, 0xe8

    if-eq v4, v5, :cond_1b

    move v6, v1

    move v1, v0

    move v0, v6

    :goto_15
    add-int/lit8 v0, v0, 0x1

    move v6, v0

    move v0, v1

    move v1, v6

    goto :goto_8

    :cond_1b
    sub-int v0, v1, v0

    and-int/lit8 v4, v0, -0x4

    if-eqz v4, :cond_7e

    iput v2, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    :cond_23
    add-int/lit8 v0, v1, 0x4

    aget-byte v0, p1, v0

    invoke-static {v0}, Lorg/tukaani/xz/simple/X86;->test86MSByte(B)Z

    move-result v0

    if-eqz v0, :cond_d3

    add-int/lit8 v0, v1, 0x1

    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v4, v1, 0x2

    aget-byte v4, p1, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v0, v4

    add-int/lit8 v4, v1, 0x3

    aget-byte v4, p1, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x10

    or-int/2addr v0, v4

    add-int/lit8 v4, v1, 0x4

    aget-byte v4, p1, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x18

    or-int/2addr v0, v4

    :goto_4e
    iget-boolean v4, p0, Lorg/tukaani/xz/simple/X86;->isEncoder:Z

    if-eqz v4, :cond_b0

    iget v4, p0, Lorg/tukaani/xz/simple/X86;->pos:I

    add-int/2addr v4, v1

    sub-int/2addr v4, p2

    add-int/2addr v0, v4

    :goto_57
    iget v4, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    if-nez v4, :cond_b6

    :cond_5b
    add-int/lit8 v4, v1, 0x1

    int-to-byte v5, v0

    aput-byte v5, p1, v4

    add-int/lit8 v4, v1, 0x2

    ushr-int/lit8 v5, v0, 0x8

    int-to-byte v5, v5

    aput-byte v5, p1, v4

    add-int/lit8 v4, v1, 0x3

    ushr-int/lit8 v5, v0, 0x10

    int-to-byte v5, v5

    aput-byte v5, p1, v4

    add-int/lit8 v4, v1, 0x4

    ushr-int/lit8 v0, v0, 0x18

    and-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, -0x1

    xor-int/lit8 v0, v0, -0x1

    int-to-byte v0, v0

    aput-byte v0, p1, v4

    add-int/lit8 v0, v1, 0x4

    goto :goto_15

    :cond_7e
    iget v4, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    add-int/lit8 v0, v0, -0x1

    shl-int v0, v4, v0

    and-int/lit8 v0, v0, 0x7

    iput v0, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    iget v0, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    if-eqz v0, :cond_23

    sget-object v0, Lorg/tukaani/xz/simple/X86;->MASK_TO_ALLOWED_STATUS:[Z

    iget v4, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    aget-boolean v0, v0, v4

    if-eqz v0, :cond_a5

    add-int/lit8 v0, v1, 0x4

    sget-object v4, Lorg/tukaani/xz/simple/X86;->MASK_TO_BIT_NUMBER:[I

    iget v5, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    aget v4, v4, v5

    sub-int/2addr v0, v4

    aget-byte v0, p1, v0

    invoke-static {v0}, Lorg/tukaani/xz/simple/X86;->test86MSByte(B)Z

    move-result v0

    if-eqz v0, :cond_23

    :cond_a5
    iget v0, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    shl-int/lit8 v0, v0, 0x1

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    move v0, v1

    goto/16 :goto_15

    :cond_b0
    iget v4, p0, Lorg/tukaani/xz/simple/X86;->pos:I

    add-int/2addr v4, v1

    sub-int/2addr v4, p2

    sub-int/2addr v0, v4

    goto :goto_57

    :cond_b6
    sget-object v4, Lorg/tukaani/xz/simple/X86;->MASK_TO_BIT_NUMBER:[I

    iget v5, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    aget v4, v4, v5

    mul-int/lit8 v4, v4, 0x8

    rsub-int/lit8 v5, v4, 0x18

    ushr-int v5, v0, v5

    int-to-byte v5, v5

    invoke-static {v5}, Lorg/tukaani/xz/simple/X86;->test86MSByte(B)Z

    move-result v5

    if-eqz v5, :cond_5b

    const/4 v5, 0x1

    rsub-int/lit8 v4, v4, 0x20

    shl-int v4, v5, v4

    add-int/lit8 v4, v4, -0x1

    xor-int/2addr v0, v4

    goto/16 :goto_4e

    :cond_d3
    iget v0, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    shl-int/lit8 v0, v0, 0x1

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    move v0, v1

    goto/16 :goto_15

    :cond_de
    sub-int v0, v1, v0

    and-int/lit8 v3, v0, -0x4

    if-eqz v3, :cond_ef

    move v0, v2

    :goto_e5
    iput v0, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    sub-int v0, v1, p2

    iget v1, p0, Lorg/tukaani/xz/simple/X86;->pos:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/tukaani/xz/simple/X86;->pos:I

    return v0

    :cond_ef
    iget v2, p0, Lorg/tukaani/xz/simple/X86;->prevMask:I

    add-int/lit8 v0, v0, -0x1

    shl-int v0, v2, v0

    goto :goto_e5
.end method
