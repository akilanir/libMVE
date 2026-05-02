.class Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;
.super Ljava/lang/Object;
.source "NTLMEngineImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MD4"
.end annotation


# instance fields
.field protected A:I

.field protected B:I

.field protected C:I

.field protected D:I

.field protected count:J

.field protected dataBuffer:[B


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    .line 1427
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1420
    const v0, 0x67452301

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1421
    const v0, -0x10325477

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1422
    const v0, -0x67452302

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1423
    const v0, 0x10325476

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1424
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->count:J

    .line 1425
    const/16 v0, 0x40

    new-array v0, v0, [B

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->dataBuffer:[B

    .line 1428
    return-void
.end method


# virtual methods
.method getOutput()[B
    .registers 13

    .prologue
    const/16 v11, 0x8

    const/4 v10, 0x0

    .line 1461
    iget-wide v5, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->count:J

    const-wide/16 v7, 0x3f

    and-long/2addr v5, v7

    long-to-int v0, v5

    .line 1462
    .local v0, "bufferIndex":I
    const/16 v5, 0x38

    if-ge v0, v5, :cond_2b

    rsub-int/lit8 v2, v0, 0x38

    .line 1463
    .local v2, "padLen":I
    :goto_f
    add-int/lit8 v5, v2, 0x8

    new-array v3, v5, [B

    .line 1466
    .local v3, "postBytes":[B
    const/16 v5, -0x80

    aput-byte v5, v3, v10

    .line 1468
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_18
    if-ge v1, v11, :cond_2e

    .line 1469
    add-int v5, v2, v1

    iget-wide v6, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->count:J

    const-wide/16 v8, 0x8

    mul-long/2addr v6, v8

    mul-int/lit8 v8, v1, 0x8

    ushr-long/2addr v6, v8

    long-to-int v6, v6

    int-to-byte v6, v6

    aput-byte v6, v3, v5

    .line 1468
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .line 1462
    .end local v1    # "i":I
    .end local v2    # "padLen":I
    .end local v3    # "postBytes":[B
    :cond_2b
    rsub-int/lit8 v2, v0, 0x78

    goto :goto_f

    .line 1473
    .restart local v1    # "i":I
    .restart local v2    # "padLen":I
    .restart local v3    # "postBytes":[B
    :cond_2e
    invoke-virtual {p0, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->update([B)V

    .line 1476
    const/16 v5, 0x10

    new-array v4, v5, [B

    .line 1477
    .local v4, "result":[B
    iget v5, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    invoke-static {v4, v5, v10}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->writeULong([BII)V

    .line 1478
    iget v5, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    const/4 v6, 0x4

    invoke-static {v4, v5, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->writeULong([BII)V

    .line 1479
    iget v5, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    invoke-static {v4, v5, v11}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->writeULong([BII)V

    .line 1480
    iget v5, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    const/16 v6, 0xc

    invoke-static {v4, v5, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->writeULong([BII)V

    .line 1481
    return-object v4
.end method

.method protected processBuffer()V
    .registers 11

    .prologue
    const/16 v9, 0x10

    .line 1486
    new-array v4, v9, [I

    .line 1488
    .local v4, "d":[I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_5
    if-ge v5, v9, :cond_3b

    .line 1489
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->dataBuffer:[B

    mul-int/lit8 v7, v5, 0x4

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xff

    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->dataBuffer:[B

    mul-int/lit8 v8, v5, 0x4

    add-int/lit8 v8, v8, 0x1

    aget-byte v7, v7, v8

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    add-int/2addr v6, v7

    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->dataBuffer:[B

    mul-int/lit8 v8, v5, 0x4

    add-int/lit8 v8, v8, 0x2

    aget-byte v7, v7, v8

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x10

    add-int/2addr v6, v7

    iget-object v7, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->dataBuffer:[B

    mul-int/lit8 v8, v5, 0x4

    add-int/lit8 v8, v8, 0x3

    aget-byte v7, v7, v8

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x18

    add-int/2addr v6, v7

    aput v6, v4, v5

    .line 1488
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 1495
    :cond_3b
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1496
    .local v0, "AA":I
    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1497
    .local v1, "BB":I
    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1498
    .local v2, "CC":I
    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1499
    .local v3, "DD":I
    invoke-virtual {p0, v4}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->round1([I)V

    .line 1500
    invoke-virtual {p0, v4}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->round2([I)V

    .line 1501
    invoke-virtual {p0, v4}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->round3([I)V

    .line 1502
    iget v6, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    add-int/2addr v6, v0

    iput v6, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1503
    iget v6, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    add-int/2addr v6, v1

    iput v6, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1504
    iget v6, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    add-int/2addr v6, v2

    iput v6, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1505
    iget v6, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    add-int/2addr v6, v3

    iput v6, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1507
    return-void
.end method

.method protected round1([I)V
    .registers 10
    .param p1, "d"    # [I

    .prologue
    const/16 v7, 0x13

    const/16 v6, 0xb

    const/4 v5, 0x7

    const/4 v4, 0x3

    .line 1510
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x0

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v4}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1511
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x1

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1512
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x2

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1513
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v4

    add-int/2addr v0, v1

    invoke-static {v0, v7}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1515
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x4

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v4}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1516
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x5

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1517
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x6

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1518
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v5

    add-int/2addr v0, v1

    invoke-static {v0, v7}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1520
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0x8

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v4}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1521
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0x9

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1522
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xa

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1523
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v6

    add-int/2addr v0, v1

    invoke-static {v0, v7}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1525
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xc

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v4}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1526
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xd

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1527
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xe

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1528
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->F(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xf

    aget v1, p1, v1

    add-int/2addr v0, v1

    invoke-static {v0, v7}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1529
    return-void
.end method

.method protected round2([I)V
    .registers 11
    .param p1, "d"    # [I

    .prologue
    const/16 v8, 0xd

    const/16 v7, 0x9

    const/4 v6, 0x5

    const/4 v5, 0x3

    const v4, 0x5a827999

    .line 1532
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x0

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1533
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x4

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1534
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0x8

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1535
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xc

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1537
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x1

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1538
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v6

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1539
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v7

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1540
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v8

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1542
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x2

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1543
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x6

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1544
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xa

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1545
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xe

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1547
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v5

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1548
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x7

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1549
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xb

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1550
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->G(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xf

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1552
    return-void
.end method

.method protected round3([I)V
    .registers 11
    .param p1, "d"    # [I

    .prologue
    const/16 v8, 0xf

    const/16 v7, 0xb

    const/16 v6, 0x9

    const/4 v5, 0x3

    const v4, 0x6ed9eba1

    .line 1555
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x0

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1556
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0x8

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1557
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x4

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1558
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xc

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1560
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x2

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1561
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xa

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1562
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x6

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1563
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xe

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1565
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x1

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1566
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v6

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1567
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x5

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1568
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0xd

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1570
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v5

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v5}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    .line 1571
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v7

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v6}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    .line 1572
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    const/4 v1, 0x7

    aget v1, p1, v1

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v7}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    .line 1573
    iget v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    iget v1, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->C:I

    iget v2, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->D:I

    iget v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->A:I

    invoke-static {v1, v2, v3}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->H(III)I

    move-result v1

    add-int/2addr v0, v1

    aget v1, p1, v8

    add-int/2addr v0, v1

    add-int/2addr v0, v4

    invoke-static {v0, v8}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl;->rotintlft(II)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->B:I

    .line 1575
    return-void
.end method

.method update([B)V
    .registers 9
    .param p1, "input"    # [B

    .prologue
    .line 1434
    iget-wide v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->count:J

    const-wide/16 v5, 0x3f

    and-long/2addr v3, v5

    long-to-int v0, v3

    .line 1435
    .local v0, "curBufferPos":I
    const/4 v1, 0x0

    .line 1436
    .local v1, "inputIndex":I
    :goto_7
    array-length v3, p1

    sub-int/2addr v3, v1

    add-int/2addr v3, v0

    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->dataBuffer:[B

    array-length v4, v4

    if-lt v3, v4, :cond_25

    .line 1440
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->dataBuffer:[B

    array-length v3, v3

    sub-int v2, v3, v0

    .line 1441
    .local v2, "transferAmt":I
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->dataBuffer:[B

    invoke-static {p1, v1, v3, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1442
    iget-wide v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->count:J

    int-to-long v5, v2

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->count:J

    .line 1443
    const/4 v0, 0x0

    .line 1444
    add-int/2addr v1, v2

    .line 1445
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->processBuffer()V

    goto :goto_7

    .line 1450
    .end local v2    # "transferAmt":I
    :cond_25
    array-length v3, p1

    if-ge v1, v3, :cond_37

    .line 1451
    array-length v3, p1

    sub-int v2, v3, v1

    .line 1452
    .restart local v2    # "transferAmt":I
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->dataBuffer:[B

    invoke-static {p1, v1, v3, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1453
    iget-wide v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->count:J

    int-to-long v5, v2

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcz/msebera/android/httpclient/impl/auth/NTLMEngineImpl$MD4;->count:J

    .line 1454
    add-int/2addr v0, v2

    .line 1456
    .end local v2    # "transferAmt":I
    :cond_37
    return-void
.end method
