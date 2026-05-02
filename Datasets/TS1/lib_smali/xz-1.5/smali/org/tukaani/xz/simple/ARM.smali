.class public final Lorg/tukaani/xz/simple/ARM;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/tukaani/xz/simple/SimpleFilter;


# instance fields
.field private final isEncoder:Z

.field private pos:I


# direct methods
.method public constructor <init>(ZI)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lorg/tukaani/xz/simple/ARM;->isEncoder:Z

    add-int/lit8 v0, p2, 0x8

    iput v0, p0, Lorg/tukaani/xz/simple/ARM;->pos:I

    return-void
.end method


# virtual methods
.method public code([BII)I
    .registers 9

    add-int v0, p2, p3

    add-int/lit8 v2, v0, -0x4

    move v1, p2

    :goto_5
    if-gt v1, v2, :cond_4f

    add-int/lit8 v0, v1, 0x3

    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xff

    const/16 v3, 0xeb

    if-ne v0, v3, :cond_45

    add-int/lit8 v0, v1, 0x2

    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x10

    add-int/lit8 v3, v1, 0x1

    aget-byte v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v0, v3

    aget-byte v3, p1, v1

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v0, v3

    shl-int/lit8 v0, v0, 0x2

    iget-boolean v3, p0, Lorg/tukaani/xz/simple/ARM;->isEncoder:Z

    if-eqz v3, :cond_49

    iget v3, p0, Lorg/tukaani/xz/simple/ARM;->pos:I

    add-int/2addr v3, v1

    sub-int/2addr v3, p2

    add-int/2addr v0, v3

    :goto_32
    ushr-int/lit8 v0, v0, 0x2

    add-int/lit8 v3, v1, 0x2

    ushr-int/lit8 v4, v0, 0x10

    int-to-byte v4, v4

    aput-byte v4, p1, v3

    add-int/lit8 v3, v1, 0x1

    ushr-int/lit8 v4, v0, 0x8

    int-to-byte v4, v4

    aput-byte v4, p1, v3

    int-to-byte v0, v0

    aput-byte v0, p1, v1

    :cond_45
    add-int/lit8 v0, v1, 0x4

    move v1, v0

    goto :goto_5

    :cond_49
    iget v3, p0, Lorg/tukaani/xz/simple/ARM;->pos:I

    add-int/2addr v3, v1

    sub-int/2addr v3, p2

    sub-int/2addr v0, v3

    goto :goto_32

    :cond_4f
    sub-int v0, v1, p2

    iget v1, p0, Lorg/tukaani/xz/simple/ARM;->pos:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/tukaani/xz/simple/ARM;->pos:I

    return v0
.end method
