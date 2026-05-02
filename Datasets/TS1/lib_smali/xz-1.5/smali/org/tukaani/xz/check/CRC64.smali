.class public Lorg/tukaani/xz/check/CRC64;
.super Lorg/tukaani/xz/check/Check;


# static fields
.field private static final crcTable:[J

.field private static final poly:J = -0x3693a86a2878f0beL


# instance fields
.field private crc:J


# direct methods
.method static constructor <clinit>()V
    .registers 10

    const-wide/16 v8, 0x1

    const/4 v7, 0x1

    const/4 v1, 0x0

    const/16 v0, 0x100

    new-array v0, v0, [J

    sput-object v0, Lorg/tukaani/xz/check/CRC64;->crcTable:[J

    move v0, v1

    :goto_b
    sget-object v2, Lorg/tukaani/xz/check/CRC64;->crcTable:[J

    array-length v2, v2

    if-ge v0, v2, :cond_2f

    int-to-long v2, v0

    move v4, v1

    :goto_12
    const/16 v5, 0x8

    if-ge v4, v5, :cond_28

    and-long v5, v2, v8

    cmp-long v5, v5, v8

    if-nez v5, :cond_26

    ushr-long/2addr v2, v7

    const-wide v5, -0x3693a86a2878f0beL    # -5.0564049839430436E45

    xor-long/2addr v2, v5

    :goto_23
    add-int/lit8 v4, v4, 0x1

    goto :goto_12

    :cond_26
    ushr-long/2addr v2, v7

    goto :goto_23

    :cond_28
    sget-object v4, Lorg/tukaani/xz/check/CRC64;->crcTable:[J

    aput-wide v2, v4, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    :cond_2f
    return-void
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lorg/tukaani/xz/check/Check;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/tukaani/xz/check/CRC64;->crc:J

    const/16 v0, 0x8

    iput v0, p0, Lorg/tukaani/xz/check/CRC64;->size:I

    const-string v0, "CRC64"

    iput-object v0, p0, Lorg/tukaani/xz/check/CRC64;->name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public finish()[B
    .registers 7

    const-wide/16 v3, -0x1

    iget-wide v0, p0, Lorg/tukaani/xz/check/CRC64;->crc:J

    xor-long v1, v0, v3

    iput-wide v3, p0, Lorg/tukaani/xz/check/CRC64;->crc:J

    const/16 v0, 0x8

    new-array v3, v0, [B

    const/4 v0, 0x0

    :goto_d
    array-length v4, v3

    if-ge v0, v4, :cond_1b

    mul-int/lit8 v4, v0, 0x8

    shr-long v4, v1, v4

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v3, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_1b
    return-object v3
.end method

.method public update([BII)V
    .registers 11

    add-int v1, p2, p3

    :goto_2
    if-ge p2, v1, :cond_1c

    sget-object v2, Lorg/tukaani/xz/check/CRC64;->crcTable:[J

    add-int/lit8 v0, p2, 0x1

    aget-byte v3, p1, p2

    iget-wide v4, p0, Lorg/tukaani/xz/check/CRC64;->crc:J

    long-to-int v4, v4

    xor-int/2addr v3, v4

    and-int/lit16 v3, v3, 0xff

    aget-wide v2, v2, v3

    iget-wide v4, p0, Lorg/tukaani/xz/check/CRC64;->crc:J

    const/16 v6, 0x8

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    iput-wide v2, p0, Lorg/tukaani/xz/check/CRC64;->crc:J

    move p2, v0

    goto :goto_2

    :cond_1c
    return-void
.end method
