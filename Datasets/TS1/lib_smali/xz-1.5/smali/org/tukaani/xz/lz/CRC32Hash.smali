.class Lorg/tukaani/xz/lz/CRC32Hash;
.super Ljava/lang/Object;


# static fields
.field private static final CRC32_POLY:I = -0x12477ce0

.field static final crcTable:[I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    const/16 v5, 0x100

    const/4 v2, 0x0

    new-array v0, v5, [I

    sput-object v0, Lorg/tukaani/xz/lz/CRC32Hash;->crcTable:[I

    move v3, v2

    :goto_8
    if-ge v3, v5, :cond_27

    move v1, v2

    move v0, v3

    :goto_c
    const/16 v4, 0x8

    if-ge v1, v4, :cond_20

    and-int/lit8 v4, v0, 0x1

    if-eqz v4, :cond_1d

    ushr-int/lit8 v0, v0, 0x1

    const v4, -0x12477ce0

    xor-int/2addr v0, v4

    :goto_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_1d
    ushr-int/lit8 v0, v0, 0x1

    goto :goto_1a

    :cond_20
    sget-object v1, Lorg/tukaani/xz/lz/CRC32Hash;->crcTable:[I

    aput v0, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    :cond_27
    return-void
.end method

.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
