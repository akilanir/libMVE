.class public Lorg/jivesoftware/smack/util/Base64$InputStream;
.super Ljava/io/FilterInputStream;
.source "Base64.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/util/Base64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InputStream"
.end annotation


# instance fields
.field private alphabet:[B

.field private breakLines:Z

.field private buffer:[B

.field private bufferLength:I

.field private decodabet:[B

.field private encode:Z

.field private lineLength:I

.field private numSigBytes:I

.field private options:I

.field private position:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 1325
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smack/util/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V

    .line 1326
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 7
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "options"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1352
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1353
    and-int/lit8 v0, p2, 0x8

    const/16 v3, 0x8

    if-eq v0, v3, :cond_35

    move v0, v1

    :goto_c
    iput-boolean v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->breakLines:Z

    .line 1354
    and-int/lit8 v0, p2, 0x1

    if-ne v0, v1, :cond_37

    :goto_12
    iput-boolean v1, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->encode:Z

    .line 1355
    iget-boolean v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->encode:Z

    if-eqz v0, :cond_39

    const/4 v0, 0x4

    :goto_19
    iput v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->bufferLength:I

    .line 1356
    iget v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->bufferLength:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->buffer:[B

    .line 1357
    const/4 v0, -0x1

    iput v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    .line 1358
    iput v2, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->lineLength:I

    .line 1359
    iput p2, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->options:I

    .line 1360
    # invokes: Lorg/jivesoftware/smack/util/Base64;->getAlphabet(I)[B
    invoke-static {p2}, Lorg/jivesoftware/smack/util/Base64;->access$000(I)[B

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->alphabet:[B

    .line 1361
    # invokes: Lorg/jivesoftware/smack/util/Base64;->getDecodabet(I)[B
    invoke-static {p2}, Lorg/jivesoftware/smack/util/Base64;->access$100(I)[B

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->decodabet:[B

    .line 1362
    return-void

    :cond_35
    move v0, v2

    .line 1353
    goto :goto_c

    :cond_37
    move v1, v2

    .line 1354
    goto :goto_12

    .line 1355
    :cond_39
    const/4 v0, 0x3

    goto :goto_19
.end method


# virtual methods
.method public read()I
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    const/4 v11, 0x4

    const/4 v10, -0x1

    const/4 v1, 0x0

    .line 1374
    iget v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    if-gez v3, :cond_34

    .line 1376
    iget-boolean v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->encode:Z

    if-eqz v3, :cond_42

    .line 1378
    new-array v0, v4, [B

    .line 1379
    .local v0, "b3":[B
    const/4 v2, 0x0

    .line 1380
    .local v2, "numBinaryBytes":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_10
    if-ge v9, v4, :cond_26

    .line 1384
    :try_start_12
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v6

    .line 1387
    .local v6, "b":I
    if-ltz v6, :cond_1f

    .line 1389
    int-to-byte v3, v6

    aput-byte v3, v0, v9
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_1d} :catch_22

    .line 1390
    add-int/lit8 v2, v2, 0x1

    .line 1380
    .end local v6    # "b":I
    :cond_1f
    add-int/lit8 v9, v9, 0x1

    goto :goto_10

    .line 1394
    :catch_22
    move-exception v8

    .line 1397
    .local v8, "e":Ljava/io/IOException;
    if-nez v9, :cond_1f

    .line 1398
    throw v8

    .line 1403
    .end local v8    # "e":Ljava/io/IOException;
    :cond_26
    if-lez v2, :cond_40

    .line 1405
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->buffer:[B

    iget v5, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->options:I

    move v4, v1

    # invokes: Lorg/jivesoftware/smack/util/Base64;->encode3to4([BII[BII)[B
    invoke-static/range {v0 .. v5}, Lorg/jivesoftware/smack/util/Base64;->access$200([BII[BII)[B

    .line 1406
    iput v1, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    .line 1407
    iput v11, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->numSigBytes:I

    .line 1451
    .end local v0    # "b3":[B
    .end local v2    # "numBinaryBytes":I
    .end local v9    # "i":I
    :cond_34
    :goto_34
    iget v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    if-ltz v3, :cond_ab

    .line 1454
    iget v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    iget v4, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->numSigBytes:I

    if-lt v3, v4, :cond_7d

    move v1, v10

    .line 1473
    :goto_3f
    return v1

    .restart local v0    # "b3":[B
    .restart local v2    # "numBinaryBytes":I
    .restart local v9    # "i":I
    :cond_40
    move v1, v10

    .line 1411
    goto :goto_3f

    .line 1418
    .end local v0    # "b3":[B
    .end local v2    # "numBinaryBytes":I
    .end local v9    # "i":I
    :cond_42
    new-array v7, v11, [B

    .line 1419
    .local v7, "b4":[B
    const/4 v9, 0x0

    .line 1420
    .restart local v9    # "i":I
    const/4 v9, 0x0

    :goto_46
    if-ge v9, v11, :cond_5c

    .line 1423
    const/4 v6, 0x0

    .line 1424
    .restart local v6    # "b":I
    :cond_49
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v6

    .line 1425
    if-ltz v6, :cond_5a

    iget-object v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->decodabet:[B

    and-int/lit8 v4, v6, 0x7f

    aget-byte v3, v3, v4

    const/4 v4, -0x5

    if-le v3, v4, :cond_49

    .line 1427
    :cond_5a
    if-gez v6, :cond_6b

    .line 1433
    .end local v6    # "b":I
    :cond_5c
    if-ne v9, v11, :cond_71

    .line 1435
    iget-object v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->buffer:[B

    iget v4, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->options:I

    # invokes: Lorg/jivesoftware/smack/util/Base64;->decode4to3([BI[BII)I
    invoke-static {v7, v1, v3, v1, v4}, Lorg/jivesoftware/smack/util/Base64;->access$300([BI[BII)I

    move-result v3

    iput v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->numSigBytes:I

    .line 1436
    iput v1, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    goto :goto_34

    .line 1430
    .restart local v6    # "b":I
    :cond_6b
    int-to-byte v3, v6

    aput-byte v3, v7, v9

    .line 1420
    add-int/lit8 v9, v9, 0x1

    goto :goto_46

    .line 1438
    .end local v6    # "b":I
    :cond_71
    if-nez v9, :cond_75

    move v1, v10

    .line 1439
    goto :goto_3f

    .line 1444
    :cond_75
    new-instance v1, Ljava/io/IOException;

    const-string v3, "Improperly padded Base64 input."

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1457
    .end local v7    # "b4":[B
    .end local v9    # "i":I
    :cond_7d
    iget-boolean v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->encode:Z

    if-eqz v3, :cond_90

    iget-boolean v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->breakLines:Z

    if-eqz v3, :cond_90

    iget v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->lineLength:I

    const/16 v4, 0x4c

    if-lt v3, v4, :cond_90

    .line 1459
    iput v1, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->lineLength:I

    .line 1460
    const/16 v1, 0xa

    goto :goto_3f

    .line 1464
    :cond_90
    iget v1, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->lineLength:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->lineLength:I

    .line 1468
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->buffer:[B

    iget v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    aget-byte v6, v1, v3

    .line 1470
    .restart local v6    # "b":I
    iget v1, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    iget v3, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->bufferLength:I

    if-lt v1, v3, :cond_a8

    .line 1471
    iput v10, p0, Lorg/jivesoftware/smack/util/Base64$InputStream;->position:I

    .line 1473
    :cond_a8
    and-int/lit16 v1, v6, 0xff

    goto :goto_3f

    .line 1482
    .end local v6    # "b":I
    :cond_ab
    new-instance v1, Ljava/io/IOException;

    const-string v3, "Error in Base64 code reading stream."

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public read([BII)I
    .registers 8
    .param p1, "dest"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1503
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p3, :cond_14

    .line 1505
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Base64$InputStream;->read()I

    move-result v0

    .line 1510
    .local v0, "b":I
    if-ltz v0, :cond_11

    .line 1511
    add-int v2, p2, v1

    int-to-byte v3, v0

    aput-byte v3, p1, v2

    .line 1503
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1512
    :cond_11
    if-nez v1, :cond_14

    .line 1513
    const/4 v1, -0x1

    .line 1517
    .end local v0    # "b":I
    .end local v1    # "i":I
    :cond_14
    return v1
.end method
