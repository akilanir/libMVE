.class public final Lorg/tukaani/xz/simple/IA64;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/tukaani/xz/simple/SimpleFilter;


# static fields
.field private static final BRANCH_TABLE:[I


# instance fields
.field private final isEncoder:Z

.field private pos:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x20

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lorg/tukaani/xz/simple/IA64;->BRANCH_TABLE:[I

    return-void

    :array_a
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x4
        0x4
        0x6
        0x6
        0x0
        0x0
        0x7
        0x7
        0x4
        0x4
        0x0
        0x0
        0x4
        0x4
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(ZI)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lorg/tukaani/xz/simple/IA64;->isEncoder:Z

    iput p2, p0, Lorg/tukaani/xz/simple/IA64;->pos:I

    return-void
.end method


# virtual methods
.method public code([BII)I
    .registers 21

    add-int v1, p2, p3

    add-int/lit8 v7, v1, -0x10

    move/from16 v6, p2

    :goto_6
    if-gt v6, v7, :cond_c2

    aget-byte v1, p1, v6

    and-int/lit8 v1, v1, 0x1f

    sget-object v2, Lorg/tukaani/xz/simple/IA64;->BRANCH_TABLE:[I

    aget v8, v2, v1

    const/4 v2, 0x0

    const/4 v1, 0x5

    move v4, v1

    move v5, v2

    :goto_14
    const/4 v1, 0x3

    if-ge v5, v1, :cond_bd

    ushr-int v1, v8, v5

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_24

    :cond_1d
    add-int/lit8 v2, v5, 0x1

    add-int/lit8 v1, v4, 0x29

    move v4, v1

    move v5, v2

    goto :goto_14

    :cond_24
    ushr-int/lit8 v9, v4, 0x3

    and-int/lit8 v10, v4, 0x7

    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    :goto_2b
    const/4 v11, 0x6

    if-ge v1, v11, :cond_3e

    add-int v11, v6, v9

    add-int/2addr v11, v1

    aget-byte v11, p1, v11

    int-to-long v11, v11

    const-wide/16 v13, 0xff

    and-long/2addr v11, v13

    mul-int/lit8 v13, v1, 0x8

    shl-long/2addr v11, v13

    or-long/2addr v2, v11

    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    :cond_3e
    ushr-long v11, v2, v10

    const/16 v1, 0x25

    ushr-long v13, v11, v1

    const-wide/16 v15, 0xf

    and-long/2addr v13, v15

    const-wide/16 v15, 0x5

    cmp-long v1, v13, v15

    if-nez v1, :cond_1d

    const/16 v1, 0x9

    ushr-long v13, v11, v1

    const-wide/16 v15, 0x7

    and-long/2addr v13, v15

    const-wide/16 v15, 0x0

    cmp-long v1, v13, v15

    if-nez v1, :cond_1d

    const/16 v1, 0xd

    ushr-long v13, v11, v1

    const-wide/32 v15, 0xfffff

    and-long/2addr v13, v15

    long-to-int v1, v13

    const/16 v13, 0x24

    ushr-long v13, v11, v13

    long-to-int v13, v13

    and-int/lit8 v13, v13, 0x1

    shl-int/lit8 v13, v13, 0x14

    or-int/2addr v1, v13

    shl-int/lit8 v1, v1, 0x4

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/tukaani/xz/simple/IA64;->isEncoder:Z

    if-eqz v13, :cond_b4

    move-object/from16 v0, p0

    iget v13, v0, Lorg/tukaani/xz/simple/IA64;->pos:I

    add-int/2addr v13, v6

    sub-int v13, v13, p2

    add-int/2addr v1, v13

    :goto_7d
    ushr-int/lit8 v1, v1, 0x4

    const-wide v13, -0x11ffffe001L

    and-long/2addr v11, v13

    int-to-long v13, v1

    const-wide/32 v15, 0xfffff

    and-long/2addr v13, v15

    const/16 v15, 0xd

    shl-long/2addr v13, v15

    or-long/2addr v11, v13

    int-to-long v13, v1

    const-wide/32 v15, 0x100000

    and-long/2addr v13, v15

    const/16 v1, 0x10

    shl-long/2addr v13, v1

    or-long/2addr v11, v13

    const/4 v1, 0x1

    shl-int/2addr v1, v10

    add-int/lit8 v1, v1, -0x1

    int-to-long v13, v1

    and-long v1, v2, v13

    shl-long v10, v11, v10

    or-long v2, v1, v10

    const/4 v1, 0x0

    :goto_a3
    const/4 v10, 0x6

    if-ge v1, v10, :cond_1d

    add-int v10, v6, v9

    add-int/2addr v10, v1

    mul-int/lit8 v11, v1, 0x8

    ushr-long v11, v2, v11

    long-to-int v11, v11

    int-to-byte v11, v11

    aput-byte v11, p1, v10

    add-int/lit8 v1, v1, 0x1

    goto :goto_a3

    :cond_b4
    move-object/from16 v0, p0

    iget v13, v0, Lorg/tukaani/xz/simple/IA64;->pos:I

    add-int/2addr v13, v6

    sub-int v13, v13, p2

    sub-int/2addr v1, v13

    goto :goto_7d

    :cond_bd
    add-int/lit8 v1, v6, 0x10

    move v6, v1

    goto/16 :goto_6

    :cond_c2
    sub-int v1, v6, p2

    move-object/from16 v0, p0

    iget v2, v0, Lorg/tukaani/xz/simple/IA64;->pos:I

    add-int/2addr v2, v1

    move-object/from16 v0, p0

    iput v2, v0, Lorg/tukaani/xz/simple/IA64;->pos:I

    return v1
.end method
