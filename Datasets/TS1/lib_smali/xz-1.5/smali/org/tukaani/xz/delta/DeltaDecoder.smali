.class public Lorg/tukaani/xz/delta/DeltaDecoder;
.super Lorg/tukaani/xz/delta/DeltaCoder;


# direct methods
.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0, p1}, Lorg/tukaani/xz/delta/DeltaCoder;-><init>(I)V

    return-void
.end method


# virtual methods
.method public decode([BII)V
    .registers 9

    add-int v0, p2, p3

    :goto_2
    if-ge p2, v0, :cond_26

    aget-byte v1, p1, p2

    iget-object v2, p0, Lorg/tukaani/xz/delta/DeltaDecoder;->history:[B

    iget v3, p0, Lorg/tukaani/xz/delta/DeltaDecoder;->distance:I

    iget v4, p0, Lorg/tukaani/xz/delta/DeltaDecoder;->pos:I

    add-int/2addr v3, v4

    and-int/lit16 v3, v3, 0xff

    aget-byte v2, v2, v3

    add-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, p1, p2

    iget-object v1, p0, Lorg/tukaani/xz/delta/DeltaDecoder;->history:[B

    iget v2, p0, Lorg/tukaani/xz/delta/DeltaDecoder;->pos:I

    add-int/lit8 v3, v2, -0x1

    iput v3, p0, Lorg/tukaani/xz/delta/DeltaDecoder;->pos:I

    and-int/lit16 v2, v2, 0xff

    aget-byte v3, p1, p2

    aput-byte v3, v1, v2

    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    :cond_26
    return-void
.end method
