.class public Lcom/sun/mail/iap/ResponseInputStream;
.super Ljava/lang/Object;
.source "ResponseInputStream.java"


# static fields
.field private static final incrementSlop:I = 0x10

.field private static final maxIncrement:I = 0x40000

.field private static final minIncrement:I = 0x100


# instance fields
.field private bin:Ljava/io/BufferedInputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Ljava/io/BufferedInputStream;

    const/16 v1, 0x800

    invoke-direct {v0, p1, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v0, p0, Lcom/sun/mail/iap/ResponseInputStream;->bin:Ljava/io/BufferedInputStream;

    .line 69
    return-void
.end method


# virtual methods
.method public readResponse()Lcom/sun/mail/iap/ByteArray;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/sun/mail/iap/ResponseInputStream;->readResponse(Lcom/sun/mail/iap/ByteArray;)Lcom/sun/mail/iap/ByteArray;

    move-result-object v0

    return-object v0
.end method

.method public readResponse(Lcom/sun/mail/iap/ByteArray;)Lcom/sun/mail/iap/ByteArray;
    .registers 16
    .param p1, "ba"    # Lcom/sun/mail/iap/ByteArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    if-nez p1, :cond_e

    .line 85
    new-instance p1, Lcom/sun/mail/iap/ByteArray;

    .end local p1    # "ba":Lcom/sun/mail/iap/ByteArray;
    const/16 v11, 0x80

    new-array v11, v11, [B

    const/4 v12, 0x0

    const/16 v13, 0x80

    invoke-direct {p1, v11, v12, v13}, Lcom/sun/mail/iap/ByteArray;-><init>([BII)V

    .line 87
    .restart local p1    # "ba":Lcom/sun/mail/iap/ByteArray;
    :cond_e
    invoke-virtual {p1}, Lcom/sun/mail/iap/ByteArray;->getBytes()[B

    move-result-object v3

    .line 88
    .local v3, "buffer":[B
    const/4 v8, 0x0

    .line 91
    .local v8, "idx":I
    :cond_13
    :goto_13
    const/4 v2, 0x0

    .line 92
    .local v2, "b":I
    const/4 v6, 0x0

    .local v6, "gotCRLF":Z
    move v9, v8

    .line 95
    .end local v8    # "idx":I
    .local v9, "idx":I
    :goto_16
    if-nez v6, :cond_48

    iget-object v11, p0, Lcom/sun/mail/iap/ResponseInputStream;->bin:Ljava/io/BufferedInputStream;

    .line 96
    invoke-virtual {v11}, Ljava/io/BufferedInputStream;->read()I

    move-result v2

    const/4 v11, -0x1

    if-eq v2, v11, :cond_48

    .line 97
    const/16 v11, 0xa

    if-ne v2, v11, :cond_30

    .line 98
    if-lez v9, :cond_30

    add-int/lit8 v11, v9, -0x1

    aget-byte v11, v3, v11

    const/16 v12, 0xd

    if-ne v11, v12, :cond_30

    .line 99
    const/4 v6, 0x1

    .line 101
    :cond_30
    array-length v11, v3

    if-lt v9, v11, :cond_41

    .line 102
    array-length v10, v3

    .line 103
    .local v10, "incr":I
    const/high16 v11, 0x40000

    if-le v10, v11, :cond_3a

    .line 104
    const/high16 v10, 0x40000

    .line 105
    :cond_3a
    invoke-virtual {p1, v10}, Lcom/sun/mail/iap/ByteArray;->grow(I)V

    .line 106
    invoke-virtual {p1}, Lcom/sun/mail/iap/ByteArray;->getBytes()[B

    move-result-object v3

    .line 108
    .end local v10    # "incr":I
    :cond_41
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "idx":I
    .restart local v8    # "idx":I
    int-to-byte v11, v2

    aput-byte v11, v3, v9

    move v9, v8

    .end local v8    # "idx":I
    .restart local v9    # "idx":I
    goto :goto_16

    .line 111
    :cond_48
    const/4 v11, -0x1

    if-ne v2, v11, :cond_53

    .line 112
    new-instance v11, Ljava/io/IOException;

    const-string v12, "Connection dropped by server?"

    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 116
    :cond_53
    const/4 v11, 0x5

    if-lt v9, v11, :cond_5e

    add-int/lit8 v11, v9, -0x3

    aget-byte v11, v3, v11

    const/16 v12, 0x7d

    if-eq v11, v12, :cond_62

    .line 159
    :cond_5e
    :goto_5e
    invoke-virtual {p1, v9}, Lcom/sun/mail/iap/ByteArray;->setCount(I)V

    .line 160
    return-object p1

    .line 121
    :cond_62
    add-int/lit8 v7, v9, -0x4

    .local v7, "i":I
    :goto_64
    if-ltz v7, :cond_6c

    .line 122
    aget-byte v11, v3, v7

    const/16 v12, 0x7b

    if-ne v11, v12, :cond_9c

    .line 125
    :cond_6c
    if-ltz v7, :cond_5e

    .line 128
    const/4 v4, 0x0

    .line 131
    .local v4, "count":I
    add-int/lit8 v11, v7, 0x1

    add-int/lit8 v12, v9, -0x3

    :try_start_73
    invoke-static {v3, v11, v12}, Lcom/sun/mail/util/ASCIIUtility;->parseInt([BII)I
    :try_end_76
    .catch Ljava/lang/NumberFormatException; {:try_start_73 .. :try_end_76} :catch_9f

    move-result v4

    .line 137
    if-lez v4, :cond_a7

    .line 138
    array-length v11, v3

    sub-int v1, v11, v9

    .line 139
    .local v1, "avail":I
    add-int/lit8 v11, v4, 0x10

    if-le v11, v1, :cond_a5

    .line 141
    const/16 v11, 0x100

    add-int/lit8 v12, v4, 0x10

    sub-int/2addr v12, v1

    if-le v11, v12, :cond_a1

    const/16 v11, 0x100

    :goto_89
    invoke-virtual {p1, v11}, Lcom/sun/mail/iap/ByteArray;->grow(I)V

    .line 143
    invoke-virtual {p1}, Lcom/sun/mail/iap/ByteArray;->getBytes()[B

    move-result-object v3

    move v8, v9

    .line 151
    .end local v9    # "idx":I
    .restart local v8    # "idx":I
    :goto_91
    if-lez v4, :cond_13

    .line 152
    iget-object v11, p0, Lcom/sun/mail/iap/ResponseInputStream;->bin:Ljava/io/BufferedInputStream;

    invoke-virtual {v11, v3, v8, v4}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v0

    .line 153
    .local v0, "actual":I
    sub-int/2addr v4, v0

    .line 154
    add-int/2addr v8, v0

    goto :goto_91

    .line 121
    .end local v0    # "actual":I
    .end local v1    # "avail":I
    .end local v4    # "count":I
    .end local v8    # "idx":I
    .restart local v9    # "idx":I
    :cond_9c
    add-int/lit8 v7, v7, -0x1

    goto :goto_64

    .line 132
    .restart local v4    # "count":I
    :catch_9f
    move-exception v5

    .line 133
    .local v5, "e":Ljava/lang/NumberFormatException;
    goto :goto_5e

    .line 141
    .end local v5    # "e":Ljava/lang/NumberFormatException;
    .restart local v1    # "avail":I
    :cond_a1
    add-int/lit8 v11, v4, 0x10

    sub-int/2addr v11, v1

    goto :goto_89

    :cond_a5
    move v8, v9

    .end local v9    # "idx":I
    .restart local v8    # "idx":I
    goto :goto_91

    .end local v1    # "avail":I
    .end local v8    # "idx":I
    .restart local v9    # "idx":I
    :cond_a7
    move v8, v9

    .end local v9    # "idx":I
    .restart local v8    # "idx":I
    goto/16 :goto_13
.end method
