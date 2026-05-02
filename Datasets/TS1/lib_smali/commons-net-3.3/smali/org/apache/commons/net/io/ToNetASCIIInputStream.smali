.class public final Lorg/apache/commons/net/io/ToNetASCIIInputStream;
.super Ljava/io/FilterInputStream;
.source "ToNetASCIIInputStream.java"


# static fields
.field private static final __LAST_WAS_CR:I = 0x1

.field private static final __LAST_WAS_NL:I = 0x2

.field private static final __NOTHING_SPECIAL:I


# instance fields
.field private __status:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "input"    # Ljava/io/InputStream;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->__status:I

    .line 52
    return-void
.end method


# virtual methods
.method public available()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 177
    iget-object v1, p0, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->available()I

    move-result v0

    .line 179
    .local v0, "result":I
    iget v1, p0, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->__status:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_d

    .line 180
    add-int/lit8 v0, v0, 0x1

    .line 183
    .end local v0    # "result":I
    :cond_d
    return v0
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 169
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0xd

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 69
    iget v2, p0, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->__status:I

    if-ne v2, v5, :cond_e

    .line 71
    iput v3, p0, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->__status:I

    .line 72
    const/16 v0, 0xa

    .line 91
    :goto_d
    return v0

    .line 75
    :cond_e
    iget-object v2, p0, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 77
    .local v0, "ch":I
    packed-switch v0, :pswitch_data_26

    .line 90
    :cond_17
    :pswitch_17
    iput v3, p0, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->__status:I

    goto :goto_d

    .line 80
    :pswitch_1a
    iput v4, p0, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->__status:I

    move v0, v1

    .line 81
    goto :goto_d

    .line 83
    :pswitch_1e
    iget v2, p0, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->__status:I

    if-eq v2, v4, :cond_17

    .line 85
    iput v5, p0, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->__status:I

    move v0, v1

    .line 86
    goto :goto_d

    .line 77
    :pswitch_data_26
    .packed-switch 0xa
        :pswitch_1e
        :pswitch_17
        :pswitch_17
        :pswitch_1a
    .end packed-switch
.end method

.method public read([B)I
    .registers 4
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 9
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 135
    if-ge p3, v4, :cond_6

    .line 136
    const/4 v3, 0x0

    .line 162
    :cond_5
    :goto_5
    return v3

    .line 139
    :cond_6
    invoke-virtual {p0}, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->available()I

    move-result v0

    .line 141
    .local v0, "ch":I
    if-le p3, v0, :cond_d

    .line 142
    move p3, v0

    .line 146
    :cond_d
    if-ge p3, v4, :cond_10

    .line 147
    const/4 p3, 0x1

    .line 150
    :cond_10
    invoke-virtual {p0}, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->read()I

    move-result v0

    if-eq v0, v3, :cond_5

    .line 154
    move v1, p2

    .line 158
    .local v1, "off":I
    :goto_17
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "offset":I
    .local v2, "offset":I
    int-to-byte v4, v0

    aput-byte v4, p1, p2

    .line 160
    add-int/lit8 p3, p3, -0x1

    if-lez p3, :cond_26

    invoke-virtual {p0}, Lorg/apache/commons/net/io/ToNetASCIIInputStream;->read()I

    move-result v0

    if-ne v0, v3, :cond_2a

    .line 162
    :cond_26
    sub-int v3, v2, v1

    move p2, v2

    .end local v2    # "offset":I
    .restart local p2    # "offset":I
    goto :goto_5

    .end local p2    # "offset":I
    .restart local v2    # "offset":I
    :cond_2a
    move p2, v2

    .end local v2    # "offset":I
    .restart local p2    # "offset":I
    goto :goto_17
.end method
