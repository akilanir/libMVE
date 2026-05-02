.class Lcom/jcraft/jsch/Util;
.super Ljava/lang/Object;
.source "Util.java"


# static fields
.field private static final b64:[B

.field private static chars:[Ljava/lang/String;

.field static final empty:[B


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 38
    const-string v0, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/Util;->b64:[B

    .line 309
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "0"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "2"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "3"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "4"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "5"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "6"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "7"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "8"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "9"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "a"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "b"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "c"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "d"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "e"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "f"

    aput-object v2, v0, v1

    sput-object v0, Lcom/jcraft/jsch/Util;->chars:[Ljava/lang/String;

    .line 442
    const-string v0, ""

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/Util;->empty:[B

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static array_equals([B[B)Z
    .registers 7
    .param p0, "foo"    # [B
    .param p1, "bar"    # [B

    .prologue
    const/4 v2, 0x0

    .line 333
    array-length v0, p0

    .line 334
    .local v0, "i":I
    array-length v3, p1

    if-eq v0, v3, :cond_6

    .line 337
    :cond_5
    :goto_5
    return v2

    .line 335
    :cond_6
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_7
    if-ge v1, v0, :cond_12

    aget-byte v3, p0, v1

    aget-byte v4, p1, v1

    if-ne v3, v4, :cond_5

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 337
    :cond_12
    const/4 v2, 0x1

    goto :goto_5
.end method

.method static byte2str([B)Ljava/lang/String;
    .registers 4
    .param p0, "str"    # [B

    .prologue
    .line 424
    const/4 v0, 0x0

    array-length v1, p0

    const-string v2, "UTF-8"

    invoke-static {p0, v0, v1, v2}, Lcom/jcraft/jsch/Util;->byte2str([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static byte2str([BII)Ljava/lang/String;
    .registers 4
    .param p0, "str"    # [B
    .param p1, "s"    # I
    .param p2, "l"    # I

    .prologue
    .line 428
    const-string v0, "UTF-8"

    invoke-static {p0, p1, p2, v0}, Lcom/jcraft/jsch/Util;->byte2str([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static byte2str([BIILjava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "str"    # [B
    .param p1, "s"    # I
    .param p2, "l"    # I
    .param p3, "encoding"    # Ljava/lang/String;

    .prologue
    .line 417
    :try_start_0
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1, p2, p3}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_5} :catch_6

    .line 419
    :goto_5
    return-object v1

    .line 418
    :catch_6
    move-exception v0

    .line 419
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p0, p1, p2}, Ljava/lang/String;-><init>([BII)V

    goto :goto_5
.end method

.method static byte2str([BLjava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "str"    # [B
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 413
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lcom/jcraft/jsch/Util;->byte2str([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static bzero([B)V
    .registers 3
    .param p0, "foo"    # [B

    .prologue
    .line 465
    if-nez p0, :cond_3

    .line 469
    :cond_2
    return-void

    .line 467
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v1, p0

    if-ge v0, v1, :cond_2

    .line 468
    const/4 v1, 0x0

    aput-byte v1, p0, v0

    .line 467
    add-int/lit8 v0, v0, 0x1

    goto :goto_4
.end method

.method static checkTilde(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 489
    :try_start_0
    const-string v0, "~"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 490
    const-string v0, "~"

    const-string v1, "user.home"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    :try_end_13
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_13} :catch_15

    move-result-object p0

    .line 495
    :cond_14
    :goto_14
    return-object p0

    .line 493
    :catch_15
    move-exception v0

    goto :goto_14
.end method

.method static createSocket(Ljava/lang/String;II)Ljava/net/Socket;
    .registers 15
    .param p0, "host"    # Ljava/lang/String;
    .param p1, "port"    # I
    .param p2, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v11, 0x0

    .line 340
    const/4 v5, 0x0

    .line 341
    .local v5, "socket":Ljava/net/Socket;
    if-nez p2, :cond_21

    .line 343
    :try_start_5
    new-instance v5, Ljava/net/Socket;

    .end local v5    # "socket":Ljava/net/Socket;
    invoke-direct {v5, p0, p1}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_a} :catch_c

    .restart local v5    # "socket":Ljava/net/Socket;
    move-object v6, v5

    .line 396
    .end local v5    # "socket":Ljava/net/Socket;
    .local v6, "socket":Ljava/lang/Object;
    :goto_b
    return-object v6

    .line 346
    .end local v6    # "socket":Ljava/lang/Object;
    :catch_c
    move-exception v2

    .line 347
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    .line 348
    .local v4, "message":Ljava/lang/String;
    instance-of v9, v2, Ljava/lang/Throwable;

    if-eqz v9, :cond_1b

    .line 349
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    invoke-direct {v9, v4, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 350
    :cond_1b
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    invoke-direct {v9, v4}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 353
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v4    # "message":Ljava/lang/String;
    .restart local v5    # "socket":Ljava/net/Socket;
    :cond_21
    move-object v0, p0

    .line 354
    .local v0, "_host":Ljava/lang/String;
    move v1, p1

    .line 355
    .local v1, "_port":I
    new-array v7, v9, [Ljava/net/Socket;

    .line 356
    .local v7, "sockp":[Ljava/net/Socket;
    new-array v3, v9, [Ljava/lang/Exception;

    .line 357
    .local v3, "ee":[Ljava/lang/Exception;
    const-string v4, ""

    .line 358
    .restart local v4    # "message":Ljava/lang/String;
    new-instance v8, Ljava/lang/Thread;

    new-instance v9, Lcom/jcraft/jsch/Util$1;

    invoke-direct {v9, v7, v0, v1, v3}, Lcom/jcraft/jsch/Util$1;-><init>([Ljava/net/Socket;Ljava/lang/String;I[Ljava/lang/Exception;)V

    invoke-direct {v8, v9}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 376
    .local v8, "tmp":Ljava/lang/Thread;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Opening Socket "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 377
    invoke-virtual {v8}, Ljava/lang/Thread;->start()V

    .line 379
    int-to-long v9, p2

    :try_start_4d
    invoke-virtual {v8, v9, v10}, Ljava/lang/Thread;->join(J)V

    .line 380
    const-string v4, "timeout: "
    :try_end_52
    .catch Ljava/lang/InterruptedException; {:try_start_4d .. :try_end_52} :catch_8b

    .line 384
    :goto_52
    aget-object v9, v7, v11

    if-eqz v9, :cond_62

    aget-object v9, v7, v11

    invoke-virtual {v9}, Ljava/net/Socket;->isConnected()Z

    move-result v9

    if-eqz v9, :cond_62

    .line 385
    aget-object v5, v7, v11

    move-object v6, v5

    .line 396
    .restart local v6    # "socket":Ljava/lang/Object;
    goto :goto_b

    .line 388
    .end local v6    # "socket":Ljava/lang/Object;
    :cond_62
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "socket is not established"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 389
    aget-object v9, v3, v11

    if-eqz v9, :cond_7f

    .line 390
    aget-object v9, v3, v11

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    .line 392
    :cond_7f
    invoke-virtual {v8}, Ljava/lang/Thread;->interrupt()V

    .line 393
    const/4 v8, 0x0

    .line 394
    new-instance v9, Lcom/jcraft/jsch/JSchException;

    aget-object v10, v3, v11

    invoke-direct {v9, v4, v10}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 382
    :catch_8b
    move-exception v9

    goto :goto_52
.end method

.method static diffString(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "not_available"    # [Ljava/lang/String;

    .prologue
    .line 472
    const-string v4, ","

    invoke-static {p0, v4}, Lcom/jcraft/jsch/Util;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 473
    .local v3, "stra":[Ljava/lang/String;
    const/4 v2, 0x0

    .line 475
    .local v2, "result":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    array-length v4, v3

    if-ge v0, v4, :cond_3e

    .line 476
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_c
    array-length v4, p1

    if-ge v1, v4, :cond_1f

    .line 477
    aget-object v4, v3, v0

    aget-object v5, p1, v1

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 475
    :goto_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 476
    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 481
    :cond_1f
    if-nez v2, :cond_24

    aget-object v2, v3, v0

    goto :goto_19

    .line 482
    :cond_24
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v3, v0

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_19

    .line 484
    .end local v1    # "j":I
    :cond_3e
    return-object v2
.end method

.method static fromBase64([BII)[B
    .registers 12
    .param p0, "buf"    # [B
    .param p1, "start"    # I
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x3d

    .line 48
    :try_start_2
    new-array v2, p2, [B

    .line 49
    .local v2, "foo":[B
    const/4 v4, 0x0

    .line 50
    .local v4, "j":I
    move v3, p1

    .local v3, "i":I
    :goto_6
    add-int v5, p1, p2

    if-ge v3, v5, :cond_2a

    .line 51
    aget-byte v5, p0, v3

    invoke-static {v5}, Lcom/jcraft/jsch/Util;->val(B)B

    move-result v5

    shl-int/lit8 v5, v5, 0x2

    add-int/lit8 v6, v3, 0x1

    aget-byte v6, p0, v6

    invoke-static {v6}, Lcom/jcraft/jsch/Util;->val(B)B

    move-result v6

    and-int/lit8 v6, v6, 0x30

    ushr-int/lit8 v6, v6, 0x4

    or-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v2, v4

    .line 52
    add-int/lit8 v5, v3, 0x2

    aget-byte v5, p0, v5

    if-ne v5, v8, :cond_32

    add-int/lit8 v4, v4, 0x1

    .line 58
    :cond_2a
    :goto_2a
    new-array v0, v4, [B

    .line 59
    .local v0, "bar":[B
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v2, v5, v0, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 60
    return-object v0

    .line 53
    .end local v0    # "bar":[B
    :cond_32
    add-int/lit8 v5, v4, 0x1

    add-int/lit8 v6, v3, 0x1

    aget-byte v6, p0, v6

    invoke-static {v6}, Lcom/jcraft/jsch/Util;->val(B)B

    move-result v6

    and-int/lit8 v6, v6, 0xf

    shl-int/lit8 v6, v6, 0x4

    add-int/lit8 v7, v3, 0x2

    aget-byte v7, p0, v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->val(B)B

    move-result v7

    and-int/lit8 v7, v7, 0x3c

    ushr-int/lit8 v7, v7, 0x2

    or-int/2addr v6, v7

    int-to-byte v6, v6

    aput-byte v6, v2, v5

    .line 54
    add-int/lit8 v5, v3, 0x3

    aget-byte v5, p0, v5

    if-ne v5, v8, :cond_59

    add-int/lit8 v4, v4, 0x2

    goto :goto_2a

    .line 55
    :cond_59
    add-int/lit8 v5, v4, 0x2

    add-int/lit8 v6, v3, 0x2

    aget-byte v6, p0, v6

    invoke-static {v6}, Lcom/jcraft/jsch/Util;->val(B)B

    move-result v6

    and-int/lit8 v6, v6, 0x3

    shl-int/lit8 v6, v6, 0x6

    add-int/lit8 v7, v3, 0x3

    aget-byte v7, p0, v7

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->val(B)B

    move-result v7

    and-int/lit8 v7, v7, 0x3f

    or-int/2addr v6, v7

    int-to-byte v6, v6

    aput-byte v6, v2, v5
    :try_end_75
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_75} :catch_7a

    .line 56
    add-int/lit8 v4, v4, 0x3

    .line 50
    add-int/lit8 v3, v3, 0x4

    goto :goto_6

    .line 62
    .end local v2    # "foo":[B
    .end local v3    # "i":I
    .end local v4    # "j":I
    :catch_7a
    move-exception v1

    .line 63
    .local v1, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v5, Lcom/jcraft/jsch/JSchException;

    const-string v6, "fromBase64: invalid base64 data"

    invoke-direct {v5, v6, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method static fromFile(Ljava/lang/String;)[B
    .registers 8
    .param p0, "_file"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 506
    invoke-static {p0}, Lcom/jcraft/jsch/Util;->checkTilde(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 507
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 508
    .local v0, "file":Ljava/io/File;
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 510
    .local v1, "fis":Ljava/io/FileInputStream;
    :try_start_e
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v5

    long-to-int v5, v5

    new-array v4, v5, [B

    .line 511
    .local v4, "result":[B
    const/4 v3, 0x0

    .line 513
    .local v3, "len":I
    :goto_16
    array-length v5, v4

    sub-int/2addr v5, v3

    invoke-virtual {v1, v4, v3, v5}, Ljava/io/FileInputStream;->read([BII)I

    move-result v2

    .line 514
    .local v2, "i":I
    if-gtz v2, :cond_27

    .line 518
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_21
    .catchall {:try_start_e .. :try_end_21} :catchall_29

    .line 522
    if-eqz v1, :cond_26

    .line 523
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    :cond_26
    return-object v4

    .line 516
    :cond_27
    add-int/2addr v3, v2

    .line 517
    goto :goto_16

    .line 522
    .end local v2    # "i":I
    .end local v3    # "len":I
    .end local v4    # "result":[B
    :catchall_29
    move-exception v5

    if-eqz v1, :cond_2f

    .line 523
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    :cond_2f
    throw v5
.end method

.method static getFingerPrint(Lcom/jcraft/jsch/HASH;[B)Ljava/lang/String;
    .registers 9
    .param p0, "hash"    # Lcom/jcraft/jsch/HASH;
    .param p1, "data"    # [B

    .prologue
    .line 314
    :try_start_0
    invoke-interface {p0}, Lcom/jcraft/jsch/HASH;->init()V

    .line 315
    const/4 v5, 0x0

    array-length v6, p1

    invoke-interface {p0, p1, v5, v6}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 316
    invoke-interface {p0}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v2

    .line 317
    .local v2, "foo":[B
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 319
    .local v4, "sb":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_12
    array-length v5, v2

    if-ge v3, v5, :cond_3a

    .line 320
    aget-byte v5, v2, v3

    and-int/lit16 v0, v5, 0xff

    .line 321
    .local v0, "bar":I
    sget-object v5, Lcom/jcraft/jsch/Util;->chars:[Ljava/lang/String;

    ushr-int/lit8 v6, v0, 0x4

    and-int/lit8 v6, v6, 0xf

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 322
    sget-object v5, Lcom/jcraft/jsch/Util;->chars:[Ljava/lang/String;

    and-int/lit8 v6, v0, 0xf

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 323
    add-int/lit8 v5, v3, 0x1

    array-length v6, v2

    if-ge v5, v6, :cond_37

    .line 324
    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 319
    :cond_37
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 326
    .end local v0    # "bar":I
    :cond_3a
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3d} :catch_3f

    move-result-object v5

    .line 329
    .end local v2    # "foo":[B
    .end local v3    # "i":I
    .end local v4    # "sb":Ljava/lang/StringBuffer;
    :goto_3e
    return-object v5

    .line 328
    :catch_3f
    move-exception v1

    .line 329
    .local v1, "e":Ljava/lang/Exception;
    const-string v5, "???"

    goto :goto_3e
.end method

.method private static glob([BI[BI)Z
    .registers 13
    .param p0, "pattern"    # [B
    .param p1, "pattern_index"    # I
    .param p2, "name"    # [B
    .param p3, "name_index"    # I

    .prologue
    .line 150
    array-length v6, p0

    .line 151
    .local v6, "patternlen":I
    if-nez v6, :cond_5

    .line 152
    const/4 v5, 0x0

    .line 257
    :goto_4
    return v5

    .line 154
    :cond_5
    array-length v4, p2

    .line 155
    .local v4, "namelen":I
    move v1, p1

    .line 156
    .local v1, "i":I
    move v3, p3

    .line 158
    .local v3, "j":I
    :cond_8
    :goto_8
    if-ge v1, v6, :cond_e2

    if-ge v3, v4, :cond_e2

    .line 159
    aget-byte v7, p0, v1

    const/16 v8, 0x5c

    if-ne v7, v8, :cond_31

    .line 160
    add-int/lit8 v7, v1, 0x1

    if-ne v7, v6, :cond_18

    .line 161
    const/4 v5, 0x0

    goto :goto_4

    .line 162
    :cond_18
    add-int/lit8 v1, v1, 0x1

    .line 163
    aget-byte v7, p0, v1

    aget-byte v8, p2, v3

    if-eq v7, v8, :cond_22

    .line 164
    const/4 v5, 0x0

    goto :goto_4

    .line 165
    :cond_22
    aget-byte v7, p0, v1

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v1, v7

    .line 166
    aget-byte v7, p2, v3

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v3, v7

    .line 167
    goto :goto_8

    .line 170
    :cond_31
    aget-byte v7, p0, v1

    const/16 v8, 0x2a

    if-ne v7, v8, :cond_ad

    .line 171
    :goto_37
    if-ge v1, v6, :cond_42

    .line 172
    aget-byte v7, p0, v1

    const/16 v8, 0x2a

    if-ne v7, v8, :cond_42

    .line 173
    add-int/lit8 v1, v1, 0x1

    .line 174
    goto :goto_37

    .line 178
    :cond_42
    if-ne v6, v1, :cond_46

    .line 179
    const/4 v5, 0x1

    goto :goto_4

    .line 181
    :cond_46
    aget-byte v0, p0, v1

    .line 182
    .local v0, "foo":B
    const/16 v7, 0x3f

    if-ne v0, v7, :cond_60

    .line 183
    :goto_4c
    if-ge v3, v4, :cond_5e

    .line 184
    invoke-static {p0, v1, p2, v3}, Lcom/jcraft/jsch/Util;->glob([BI[BI)Z

    move-result v7

    if-eqz v7, :cond_56

    .line 185
    const/4 v5, 0x1

    goto :goto_4

    .line 187
    :cond_56
    aget-byte v7, p2, v3

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v3, v7

    goto :goto_4c

    .line 189
    :cond_5e
    const/4 v5, 0x0

    goto :goto_4

    .line 191
    :cond_60
    const/16 v7, 0x5c

    if-ne v0, v7, :cond_9b

    .line 192
    add-int/lit8 v7, v1, 0x1

    if-ne v7, v6, :cond_6a

    .line 193
    const/4 v5, 0x0

    goto :goto_4

    .line 194
    :cond_6a
    add-int/lit8 v1, v1, 0x1

    .line 195
    aget-byte v0, p0, v1

    .line 196
    :goto_6e
    if-ge v3, v4, :cond_91

    .line 197
    aget-byte v7, p2, v3

    if-ne v0, v7, :cond_89

    .line 198
    invoke-static {v0}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v7, v1

    aget-byte v8, p2, v3

    invoke-static {v8}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v8

    add-int/2addr v8, v3

    invoke-static {p0, v7, p2, v8}, Lcom/jcraft/jsch/Util;->glob([BI[BI)Z

    move-result v7

    if-eqz v7, :cond_89

    .line 200
    const/4 v5, 0x1

    goto/16 :goto_4

    .line 203
    :cond_89
    aget-byte v7, p2, v3

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v3, v7

    goto :goto_6e

    .line 205
    :cond_91
    const/4 v5, 0x0

    goto/16 :goto_4

    .line 214
    :cond_94
    aget-byte v7, p2, v3

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v3, v7

    .line 208
    :cond_9b
    if-ge v3, v4, :cond_aa

    .line 209
    aget-byte v7, p2, v3

    if-ne v0, v7, :cond_94

    .line 210
    invoke-static {p0, v1, p2, v3}, Lcom/jcraft/jsch/Util;->glob([BI[BI)Z

    move-result v7

    if-eqz v7, :cond_94

    .line 211
    const/4 v5, 0x1

    goto/16 :goto_4

    .line 216
    :cond_aa
    const/4 v5, 0x0

    goto/16 :goto_4

    .line 219
    .end local v0    # "foo":B
    :cond_ad
    aget-byte v7, p0, v1

    const/16 v8, 0x3f

    if-ne v7, v8, :cond_be

    .line 220
    add-int/lit8 v1, v1, 0x1

    .line 221
    aget-byte v7, p2, v3

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v3, v7

    .line 222
    goto/16 :goto_8

    .line 225
    :cond_be
    aget-byte v7, p0, v1

    aget-byte v8, p2, v3

    if-eq v7, v8, :cond_c7

    .line 226
    const/4 v5, 0x0

    goto/16 :goto_4

    .line 228
    :cond_c7
    aget-byte v7, p0, v1

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v1, v7

    .line 229
    aget-byte v7, p2, v3

    invoke-static {v7}, Lcom/jcraft/jsch/Util;->skipUTF8Char(B)I

    move-result v7

    add-int/2addr v3, v7

    .line 231
    if-lt v3, v4, :cond_8

    .line 232
    if-lt v1, v6, :cond_dc

    .line 233
    const/4 v5, 0x1

    goto/16 :goto_4

    .line 235
    :cond_dc
    aget-byte v7, p0, v1

    const/16 v8, 0x2a

    if-ne v7, v8, :cond_8

    .line 242
    :cond_e2
    if-ne v1, v6, :cond_e9

    if-ne v3, v4, :cond_e9

    .line 243
    const/4 v5, 0x1

    goto/16 :goto_4

    .line 245
    :cond_e9
    if-lt v3, v4, :cond_100

    aget-byte v7, p0, v1

    const/16 v8, 0x2a

    if-ne v7, v8, :cond_100

    .line 247
    const/4 v5, 0x1

    .local v5, "ok":Z
    move v2, v1

    .line 248
    .end local v1    # "i":I
    .local v2, "i":I
    :goto_f3
    if-ge v2, v6, :cond_105

    .line 249
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    aget-byte v7, p0, v2

    const/16 v8, 0x2a

    if-eq v7, v8, :cond_103

    .line 250
    const/4 v5, 0x0

    .line 251
    goto/16 :goto_4

    .line 257
    .end local v5    # "ok":Z
    :cond_100
    const/4 v5, 0x0

    goto/16 :goto_4

    .restart local v5    # "ok":Z
    :cond_103
    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_f3

    :cond_105
    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto/16 :goto_4
.end method

.method static glob([B[B)Z
    .registers 3
    .param p0, "pattern"    # [B
    .param p1, "name"    # [B

    .prologue
    const/4 v0, 0x0

    .line 133
    invoke-static {p0, v0, p1, v0}, Lcom/jcraft/jsch/Util;->glob0([BI[BI)Z

    move-result v0

    return v0
.end method

.method private static glob0([BI[BI)Z
    .registers 8
    .param p0, "pattern"    # [B
    .param p1, "pattern_index"    # I
    .param p2, "name"    # [B
    .param p3, "name_index"    # I

    .prologue
    const/16 v3, 0x2e

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 137
    array-length v2, p2

    if-lez v2, :cond_28

    aget-byte v2, p2, v1

    if-ne v2, v3, :cond_28

    .line 138
    array-length v2, p0

    if-lez v2, :cond_26

    aget-byte v2, p0, v1

    if-ne v2, v3, :cond_26

    .line 139
    array-length v1, p0

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1d

    aget-byte v1, p0, v0

    const/16 v2, 0x2a

    if-ne v1, v2, :cond_1d

    .line 144
    :goto_1c
    return v0

    .line 140
    :cond_1d
    add-int/lit8 v0, p1, 0x1

    add-int/lit8 v1, p3, 0x1

    invoke-static {p0, v0, p2, v1}, Lcom/jcraft/jsch/Util;->glob([BI[BI)Z

    move-result v0

    goto :goto_1c

    :cond_26
    move v0, v1

    .line 142
    goto :goto_1c

    .line 144
    :cond_28
    invoke-static {p0, p1, p2, p3}, Lcom/jcraft/jsch/Util;->glob([BI[BI)Z

    move-result v0

    goto :goto_1c
.end method

.method static quote(Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x3f

    const/16 v9, 0x2a

    const/16 v8, 0x5c

    .line 261
    invoke-static {p0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    .line 262
    .local v0, "_path":[B
    const/4 v3, 0x0

    .line 263
    .local v3, "count":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_c
    array-length v7, v0

    if-ge v4, v7, :cond_1c

    .line 264
    aget-byte v2, v0, v4

    .line 265
    .local v2, "b":B
    if-eq v2, v8, :cond_17

    if-eq v2, v10, :cond_17

    if-ne v2, v9, :cond_19

    .line 266
    :cond_17
    add-int/lit8 v3, v3, 0x1

    .line 263
    :cond_19
    add-int/lit8 v4, v4, 0x1

    goto :goto_c

    .line 268
    .end local v2    # "b":B
    :cond_1c
    if-nez v3, :cond_1f

    .line 278
    .end local p0    # "path":Ljava/lang/String;
    :goto_1e
    return-object p0

    .line 270
    .restart local p0    # "path":Ljava/lang/String;
    :cond_1f
    array-length v7, v0

    add-int/2addr v7, v3

    new-array v1, v7, [B

    .line 271
    .local v1, "_path2":[B
    const/4 v4, 0x0

    const/4 v5, 0x0

    .local v5, "j":I
    :goto_25
    array-length v7, v0

    if-ge v4, v7, :cond_3d

    .line 272
    aget-byte v2, v0, v4

    .line 273
    .restart local v2    # "b":B
    if-eq v2, v8, :cond_30

    if-eq v2, v10, :cond_30

    if-ne v2, v9, :cond_35

    .line 274
    :cond_30
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "j":I
    .local v6, "j":I
    aput-byte v8, v1, v5

    move v5, v6

    .line 276
    .end local v6    # "j":I
    .restart local v5    # "j":I
    :cond_35
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "j":I
    .restart local v6    # "j":I
    aput-byte v2, v1, v5

    .line 271
    add-int/lit8 v4, v4, 0x1

    move v5, v6

    .end local v6    # "j":I
    .restart local v5    # "j":I
    goto :goto_25

    .line 278
    .end local v2    # "b":B
    :cond_3d
    invoke-static {v1}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object p0

    goto :goto_1e
.end method

.method private static skipUTF8Char(B)I
    .registers 4
    .param p0, "b"    # B

    .prologue
    const/4 v0, 0x1

    .line 499
    and-int/lit16 v1, p0, 0x80

    int-to-byte v1, v1

    if-nez v1, :cond_7

    .line 502
    :cond_6
    :goto_6
    return v0

    .line 500
    :cond_7
    and-int/lit16 v1, p0, 0xe0

    int-to-byte v1, v1

    const/16 v2, -0x40

    if-ne v1, v2, :cond_10

    const/4 v0, 0x2

    goto :goto_6

    .line 501
    :cond_10
    and-int/lit16 v1, p0, 0xf0

    int-to-byte v1, v1

    const/16 v2, -0x20

    if-ne v1, v2, :cond_6

    const/4 v0, 0x3

    goto :goto_6
.end method

.method static split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .registers 9
    .param p0, "foo"    # Ljava/lang/String;
    .param p1, "split"    # Ljava/lang/String;

    .prologue
    .line 110
    if-nez p0, :cond_4

    .line 111
    const/4 v4, 0x0

    .line 130
    :cond_3
    return-object v4

    .line 112
    :cond_4
    invoke-static {p0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v1

    .line 113
    .local v1, "buf":[B
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 114
    .local v0, "bar":Ljava/util/Vector;
    const/4 v5, 0x0

    .line 117
    .local v5, "start":I
    :goto_e
    invoke-virtual {p0, p1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 118
    .local v3, "index":I
    if-ltz v3, :cond_20

    .line 119
    sub-int v6, v3, v5

    invoke-static {v1, v5, v6}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 120
    add-int/lit8 v5, v3, 0x1

    .line 121
    goto :goto_e

    .line 123
    :cond_20
    array-length v6, v1

    sub-int/2addr v6, v5

    invoke-static {v1, v5, v6}, Lcom/jcraft/jsch/Util;->byte2str([BII)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 126
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v6

    new-array v4, v6, [Ljava/lang/String;

    .line 127
    .local v4, "result":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_30
    array-length v6, v4

    if-ge v2, v6, :cond_3

    .line 128
    invoke-virtual {v0, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    check-cast v6, Ljava/lang/String;

    aput-object v6, v4, v2

    .line 127
    add-int/lit8 v2, v2, 0x1

    goto :goto_30
.end method

.method static str2byte(Ljava/lang/String;)[B
    .registers 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 409
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static str2byte(Ljava/lang/String;Ljava/lang/String;)[B
    .registers 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 400
    if-nez p0, :cond_4

    .line 401
    const/4 v1, 0x0

    .line 404
    :goto_3
    return-object v1

    .line 402
    :cond_4
    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_7} :catch_9

    move-result-object v1

    goto :goto_3

    .line 403
    :catch_9
    move-exception v0

    .line 404
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    goto :goto_3
.end method

.method static toBase64([BII)[B
    .registers 14
    .param p0, "buf"    # [B
    .param p1, "start"    # I
    .param p2, "length"    # I

    .prologue
    const/4 v10, 0x0

    const/16 v9, 0x3d

    .line 68
    mul-int/lit8 v7, p2, 0x2

    new-array v6, v7, [B

    .line 71
    .local v6, "tmp":[B
    div-int/lit8 v7, p2, 0x3

    mul-int/lit8 v7, v7, 0x3

    add-int v1, v7, p1

    .line 72
    .local v1, "foo":I
    const/4 v2, 0x0

    .line 73
    .local v2, "i":I
    move v4, p1

    .local v4, "j":I
    move v3, v2

    .end local v2    # "i":I
    .local v3, "i":I
    :goto_10
    if-ge v4, v1, :cond_63

    .line 74
    aget-byte v7, p0, v4

    ushr-int/lit8 v7, v7, 0x2

    and-int/lit8 v5, v7, 0x3f

    .line 75
    .local v5, "k":I
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v3

    .line 76
    aget-byte v7, p0, v4

    and-int/lit8 v7, v7, 0x3

    shl-int/lit8 v7, v7, 0x4

    add-int/lit8 v8, v4, 0x1

    aget-byte v8, p0, v8

    ushr-int/lit8 v8, v8, 0x4

    and-int/lit8 v8, v8, 0xf

    or-int v5, v7, v8

    .line 77
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v2

    .line 78
    add-int/lit8 v7, v4, 0x1

    aget-byte v7, p0, v7

    and-int/lit8 v7, v7, 0xf

    shl-int/lit8 v7, v7, 0x2

    add-int/lit8 v8, v4, 0x2

    aget-byte v8, p0, v8

    ushr-int/lit8 v8, v8, 0x6

    and-int/lit8 v8, v8, 0x3

    or-int v5, v7, v8

    .line 79
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v3

    .line 80
    add-int/lit8 v7, v4, 0x2

    aget-byte v7, p0, v7

    and-int/lit8 v5, v7, 0x3f

    .line 81
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v2

    .line 73
    add-int/lit8 v4, v4, 0x3

    goto :goto_10

    .line 84
    .end local v5    # "k":I
    :cond_63
    add-int v7, p1, p2

    sub-int v1, v7, v1

    .line 85
    const/4 v7, 0x1

    if-ne v1, v7, :cond_97

    .line 86
    aget-byte v7, p0, v4

    ushr-int/lit8 v7, v7, 0x2

    and-int/lit8 v5, v7, 0x3f

    .line 87
    .restart local v5    # "k":I
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v3

    .line 88
    aget-byte v7, p0, v4

    and-int/lit8 v7, v7, 0x3

    shl-int/lit8 v7, v7, 0x4

    and-int/lit8 v5, v7, 0x3f

    .line 89
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v2

    .line 90
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    aput-byte v9, v6, v3

    .line 91
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    aput-byte v9, v6, v2

    move v2, v3

    .line 102
    .end local v3    # "i":I
    .end local v5    # "k":I
    .restart local v2    # "i":I
    :goto_91
    new-array v0, v2, [B

    .line 103
    .local v0, "bar":[B
    invoke-static {v6, v10, v0, v10, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 104
    return-object v0

    .line 93
    .end local v0    # "bar":[B
    .end local v2    # "i":I
    .restart local v3    # "i":I
    :cond_97
    const/4 v7, 0x2

    if-ne v1, v7, :cond_d6

    .line 94
    aget-byte v7, p0, v4

    ushr-int/lit8 v7, v7, 0x2

    and-int/lit8 v5, v7, 0x3f

    .line 95
    .restart local v5    # "k":I
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v3

    .line 96
    aget-byte v7, p0, v4

    and-int/lit8 v7, v7, 0x3

    shl-int/lit8 v7, v7, 0x4

    add-int/lit8 v8, v4, 0x1

    aget-byte v8, p0, v8

    ushr-int/lit8 v8, v8, 0x4

    and-int/lit8 v8, v8, 0xf

    or-int v5, v7, v8

    .line 97
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v2

    .line 98
    add-int/lit8 v7, v4, 0x1

    aget-byte v7, p0, v7

    and-int/lit8 v7, v7, 0xf

    shl-int/lit8 v7, v7, 0x2

    and-int/lit8 v5, v7, 0x3f

    .line 99
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    sget-object v7, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v7, v7, v5

    aput-byte v7, v6, v3

    .line 100
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    aput-byte v9, v6, v2

    .end local v5    # "k":I
    :cond_d6
    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_91
.end method

.method static toHex([B)Ljava/lang/String;
    .registers 7
    .param p0, "str"    # [B

    .prologue
    .line 432
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 433
    .local v2, "sb":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    array-length v3, p0

    if-ge v1, v3, :cond_44

    .line 434
    aget-byte v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 435
    .local v0, "foo":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "0x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v5, 0x1

    if-ne v3, v5, :cond_41

    const-string v3, "0"

    :goto_25
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 436
    add-int/lit8 v3, v1, 0x1

    array-length v4, p0

    if-ge v3, v4, :cond_3e

    .line 437
    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 433
    :cond_3e
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 435
    :cond_41
    const-string v3, ""

    goto :goto_25

    .line 439
    .end local v0    # "foo":Ljava/lang/String;
    :cond_44
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method static unquote(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 282
    invoke-static {p0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v1

    .line 283
    .local v1, "foo":[B
    invoke-static {v1}, Lcom/jcraft/jsch/Util;->unquote([B)[B

    move-result-object v0

    .line 284
    .local v0, "bar":[B
    array-length v2, v1

    array-length v3, v0

    if-ne v2, v3, :cond_d

    .line 286
    .end local p0    # "path":Ljava/lang/String;
    :goto_c
    return-object p0

    .restart local p0    # "path":Ljava/lang/String;
    :cond_d
    invoke-static {v0}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object p0

    goto :goto_c
.end method

.method static unquote([B)[B
    .registers 8
    .param p0, "path"    # [B

    .prologue
    const/4 v6, 0x0

    .line 289
    array-length v2, p0

    .line 290
    .local v2, "pathlen":I
    const/4 v1, 0x0

    .line 291
    .local v1, "i":I
    :goto_3
    if-ge v1, v2, :cond_f

    .line 292
    aget-byte v3, p0, v1

    const/16 v4, 0x5c

    if-ne v3, v4, :cond_21

    .line 293
    add-int/lit8 v3, v1, 0x1

    if-ne v3, v2, :cond_13

    .line 302
    :cond_f
    array-length v3, p0

    if-ne v2, v3, :cond_24

    .line 306
    .end local p0    # "path":[B
    :goto_12
    return-object p0

    .line 295
    .restart local p0    # "path":[B
    :cond_13
    add-int/lit8 v3, v1, 0x1

    array-length v4, p0

    add-int/lit8 v5, v1, 0x1

    sub-int/2addr v4, v5

    invoke-static {p0, v3, p0, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 296
    add-int/lit8 v2, v2, -0x1

    .line 297
    add-int/lit8 v1, v1, 0x1

    .line 298
    goto :goto_3

    .line 300
    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 304
    :cond_24
    new-array v0, v2, [B

    .line 305
    .local v0, "foo":[B
    invoke-static {p0, v6, v0, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p0, v0

    .line 306
    goto :goto_12
.end method

.method private static val(B)B
    .registers 4
    .param p0, "foo"    # B

    .prologue
    const/4 v1, 0x0

    .line 40
    const/16 v2, 0x3d

    if-ne p0, v2, :cond_6

    .line 44
    :cond_5
    :goto_5
    return v1

    .line 41
    :cond_6
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_7
    sget-object v2, Lcom/jcraft/jsch/Util;->b64:[B

    array-length v2, v2

    if-ge v0, v2, :cond_5

    .line 42
    sget-object v2, Lcom/jcraft/jsch/Util;->b64:[B

    aget-byte v2, v2, v0

    if-ne p0, v2, :cond_14

    int-to-byte v1, v0

    goto :goto_5

    .line 41
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_7
.end method
