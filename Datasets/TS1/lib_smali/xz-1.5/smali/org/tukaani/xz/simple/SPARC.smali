.class public final Lorg/tukaani/xz/simple/SPARC;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/tukaani/xz/simple/SimpleFilter;


# instance fields
.field private final isEncoder:Z

.field private pos:I


# direct methods
.method public constructor <init>(ZI)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lorg/tukaani/xz/simple/SPARC;->isEncoder:Z

    iput p2, p0, Lorg/tukaani/xz/simple/SPARC;->pos:I

    return-void
.end method


# virtual methods
.method public code([BII)I
    .registers 9

    add-int v0, p2, p3

    add-int/lit8 v2, v0, -0x4

    move v1, p2

    :goto_5
    if-gt v1, v2, :cond_87

    aget-byte v0, p1, v1

    const/16 v3, 0x40

    if-ne v0, v3, :cond_15

    add-int/lit8 v0, v1, 0x1

    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xc0

    if-eqz v0, :cond_25

    :cond_15
    aget-byte v0, p1, v1

    const/16 v3, 0x7f

    if-ne v0, v3, :cond_7d

    add-int/lit8 v0, v1, 0x1

    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xc0

    const/16 v3, 0xc0

    if-ne v0, v3, :cond_7d

    :cond_25
    aget-byte v0, p1, v1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x18

    add-int/lit8 v3, v1, 0x1

    aget-byte v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x10

    or-int/2addr v0, v3

    add-int/lit8 v3, v1, 0x2

    aget-byte v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v0, v3

    add-int/lit8 v3, v1, 0x3

    aget-byte v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v0, v3

    shl-int/lit8 v0, v0, 0x2

    iget-boolean v3, p0, Lorg/tukaani/xz/simple/SPARC;->isEncoder:Z

    if-eqz v3, :cond_81

    iget v3, p0, Lorg/tukaani/xz/simple/SPARC;->pos:I

    add-int/2addr v3, v1

    sub-int/2addr v3, p2

    add-int/2addr v0, v3

    :goto_4f
    ushr-int/lit8 v0, v0, 0x2

    ushr-int/lit8 v3, v0, 0x16

    and-int/lit8 v3, v3, 0x1

    rsub-int/lit8 v3, v3, 0x0

    shl-int/lit8 v3, v3, 0x16

    const v4, 0x3fffffff    # 1.9999999f

    and-int/2addr v3, v4

    const v4, 0x3fffff

    and-int/2addr v0, v4

    or-int/2addr v0, v3

    const/high16 v3, 0x40000000    # 2.0f

    or-int/2addr v0, v3

    ushr-int/lit8 v3, v0, 0x18

    int-to-byte v3, v3

    aput-byte v3, p1, v1

    add-int/lit8 v3, v1, 0x1

    ushr-int/lit8 v4, v0, 0x10

    int-to-byte v4, v4

    aput-byte v4, p1, v3

    add-int/lit8 v3, v1, 0x2

    ushr-int/lit8 v4, v0, 0x8

    int-to-byte v4, v4

    aput-byte v4, p1, v3

    add-int/lit8 v3, v1, 0x3

    int-to-byte v0, v0

    aput-byte v0, p1, v3

    :cond_7d
    add-int/lit8 v0, v1, 0x4

    move v1, v0

    goto :goto_5

    :cond_81
    iget v3, p0, Lorg/tukaani/xz/simple/SPARC;->pos:I

    add-int/2addr v3, v1

    sub-int/2addr v3, p2

    sub-int/2addr v0, v3

    goto :goto_4f

    :cond_87
    sub-int v0, v1, p2

    iget v1, p0, Lorg/tukaani/xz/simple/SPARC;->pos:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/tukaani/xz/simple/SPARC;->pos:I

    return v0
.end method
