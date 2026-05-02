.class public Lcom/sun/mail/util/UUEncoderStream;
.super Ljava/io/FilterOutputStream;
.source "UUEncoderStream.java"


# instance fields
.field private buffer:[B

.field private bufsize:I

.field private mode:I

.field private name:Ljava/lang/String;

.field private wrotePrefix:Z

.field private wroteSuffix:Z


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 68
    const-string v0, "encoder.buf"

    const/16 v1, 0x1a4

    invoke-direct {p0, p1, v0, v1}, Lcom/sun/mail/util/UUEncoderStream;-><init>(Ljava/io/OutputStream;Ljava/lang/String;I)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 77
    const/16 v0, 0x1a4

    invoke-direct {p0, p1, p2, v0}, Lcom/sun/mail/util/UUEncoderStream;-><init>(Ljava/io/OutputStream;Ljava/lang/String;I)V

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Ljava/lang/String;I)V
    .registers 5
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "mode"    # I

    .prologue
    const/4 v0, 0x0

    .line 87
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 56
    iput v0, p0, Lcom/sun/mail/util/UUEncoderStream;->bufsize:I

    .line 57
    iput-boolean v0, p0, Lcom/sun/mail/util/UUEncoderStream;->wrotePrefix:Z

    .line 58
    iput-boolean v0, p0, Lcom/sun/mail/util/UUEncoderStream;->wroteSuffix:Z

    .line 88
    iput-object p2, p0, Lcom/sun/mail/util/UUEncoderStream;->name:Ljava/lang/String;

    .line 89
    iput p3, p0, Lcom/sun/mail/util/UUEncoderStream;->mode:I

    .line 90
    const/16 v0, 0x2d

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/sun/mail/util/UUEncoderStream;->buffer:[B

    .line 91
    return-void
.end method

.method private encode()V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    const/4 v7, 0x0

    .line 184
    .local v7, "i":I
    iget-object v9, p0, Lcom/sun/mail/util/UUEncoderStream;->out:Ljava/io/OutputStream;

    iget v10, p0, Lcom/sun/mail/util/UUEncoderStream;->bufsize:I

    and-int/lit8 v10, v10, 0x3f

    add-int/lit8 v10, v10, 0x20

    invoke-virtual {v9, v10}, Ljava/io/OutputStream;->write(I)V

    .line 186
    :goto_c
    iget v9, p0, Lcom/sun/mail/util/UUEncoderStream;->bufsize:I

    if-ge v7, v9, :cond_68

    .line 187
    iget-object v9, p0, Lcom/sun/mail/util/UUEncoderStream;->buffer:[B

    add-int/lit8 v8, v7, 0x1

    .end local v7    # "i":I
    .local v8, "i":I
    aget-byte v0, v9, v7

    .line 188
    .local v0, "a":B
    iget v9, p0, Lcom/sun/mail/util/UUEncoderStream;->bufsize:I

    if-ge v8, v9, :cond_64

    .line 189
    iget-object v9, p0, Lcom/sun/mail/util/UUEncoderStream;->buffer:[B

    add-int/lit8 v7, v8, 0x1

    .end local v8    # "i":I
    .restart local v7    # "i":I
    aget-byte v1, v9, v8

    .line 190
    .local v1, "b":B
    iget v9, p0, Lcom/sun/mail/util/UUEncoderStream;->bufsize:I

    if-ge v7, v9, :cond_62

    .line 191
    iget-object v9, p0, Lcom/sun/mail/util/UUEncoderStream;->buffer:[B

    add-int/lit8 v8, v7, 0x1

    .end local v7    # "i":I
    .restart local v8    # "i":I
    aget-byte v2, v9, v7

    .local v2, "c":B
    move v7, v8

    .line 200
    .end local v8    # "i":I
    .restart local v7    # "i":I
    :goto_2b
    ushr-int/lit8 v9, v0, 0x2

    and-int/lit8 v3, v9, 0x3f

    .line 201
    .local v3, "c1":I
    shl-int/lit8 v9, v0, 0x4

    and-int/lit8 v9, v9, 0x30

    ushr-int/lit8 v10, v1, 0x4

    and-int/lit8 v10, v10, 0xf

    or-int v4, v9, v10

    .line 202
    .local v4, "c2":I
    shl-int/lit8 v9, v1, 0x2

    and-int/lit8 v9, v9, 0x3c

    ushr-int/lit8 v10, v2, 0x6

    and-int/lit8 v10, v10, 0x3

    or-int v5, v9, v10

    .line 203
    .local v5, "c3":I
    and-int/lit8 v6, v2, 0x3f

    .line 204
    .local v6, "c4":I
    iget-object v9, p0, Lcom/sun/mail/util/UUEncoderStream;->out:Ljava/io/OutputStream;

    add-int/lit8 v10, v3, 0x20

    invoke-virtual {v9, v10}, Ljava/io/OutputStream;->write(I)V

    .line 205
    iget-object v9, p0, Lcom/sun/mail/util/UUEncoderStream;->out:Ljava/io/OutputStream;

    add-int/lit8 v10, v4, 0x20

    invoke-virtual {v9, v10}, Ljava/io/OutputStream;->write(I)V

    .line 206
    iget-object v9, p0, Lcom/sun/mail/util/UUEncoderStream;->out:Ljava/io/OutputStream;

    add-int/lit8 v10, v5, 0x20

    invoke-virtual {v9, v10}, Ljava/io/OutputStream;->write(I)V

    .line 207
    iget-object v9, p0, Lcom/sun/mail/util/UUEncoderStream;->out:Ljava/io/OutputStream;

    add-int/lit8 v10, v6, 0x20

    invoke-virtual {v9, v10}, Ljava/io/OutputStream;->write(I)V

    goto :goto_c

    .line 193
    .end local v2    # "c":B
    .end local v3    # "c1":I
    .end local v4    # "c2":I
    .end local v5    # "c3":I
    .end local v6    # "c4":I
    :cond_62
    const/4 v2, 0x1

    .restart local v2    # "c":B
    goto :goto_2b

    .line 196
    .end local v1    # "b":B
    .end local v2    # "c":B
    .end local v7    # "i":I
    .restart local v8    # "i":I
    :cond_64
    const/4 v1, 0x1

    .line 197
    .restart local v1    # "b":B
    const/4 v2, 0x1

    .restart local v2    # "c":B
    move v7, v8

    .end local v8    # "i":I
    .restart local v7    # "i":I
    goto :goto_2b

    .line 210
    .end local v0    # "a":B
    .end local v1    # "b":B
    .end local v2    # "c":B
    :cond_68
    iget-object v9, p0, Lcom/sun/mail/util/UUEncoderStream;->out:Ljava/io/OutputStream;

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/io/OutputStream;->write(I)V

    .line 211
    return-void
.end method

.method private writePrefix()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 147
    iget-boolean v1, p0, Lcom/sun/mail/util/UUEncoderStream;->wrotePrefix:Z

    if-nez v1, :cond_28

    .line 149
    new-instance v0, Ljava/io/PrintStream;

    iget-object v1, p0, Lcom/sun/mail/util/UUEncoderStream;->out:Ljava/io/OutputStream;

    const-string v2, "utf-8"

    invoke-direct {v0, v1, v4, v2}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;ZLjava/lang/String;)V

    .line 150
    .local v0, "ps":Ljava/io/PrintStream;
    const-string v1, "begin %o %s%n"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/sun/mail/util/UUEncoderStream;->mode:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/sun/mail/util/UUEncoderStream;->name:Ljava/lang/String;

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/io/PrintStream;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 151
    invoke-virtual {v0}, Ljava/io/PrintStream;->flush()V

    .line 152
    iput-boolean v5, p0, Lcom/sun/mail/util/UUEncoderStream;->wrotePrefix:Z

    .line 154
    .end local v0    # "ps":Ljava/io/PrintStream;
    :cond_28
    return-void
.end method

.method private writeSuffix()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    iget-boolean v1, p0, Lcom/sun/mail/util/UUEncoderStream;->wroteSuffix:Z

    if-nez v1, :cond_19

    .line 162
    new-instance v0, Ljava/io/PrintStream;

    iget-object v1, p0, Lcom/sun/mail/util/UUEncoderStream;->out:Ljava/io/OutputStream;

    const/4 v2, 0x0

    const-string v3, "us-ascii"

    invoke-direct {v0, v1, v2, v3}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;ZLjava/lang/String;)V

    .line 163
    .local v0, "ps":Ljava/io/PrintStream;
    const-string v1, " \nend"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 164
    invoke-virtual {v0}, Ljava/io/PrintStream;->flush()V

    .line 165
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/sun/mail/util/UUEncoderStream;->wroteSuffix:Z

    .line 167
    .end local v0    # "ps":Ljava/io/PrintStream;
    :cond_19
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    invoke-virtual {p0}, Lcom/sun/mail/util/UUEncoderStream;->flush()V

    .line 140
    iget-object v0, p0, Lcom/sun/mail/util/UUEncoderStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 141
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    iget v0, p0, Lcom/sun/mail/util/UUEncoderStream;->bufsize:I

    if-lez v0, :cond_d

    .line 130
    invoke-direct {p0}, Lcom/sun/mail/util/UUEncoderStream;->writePrefix()V

    .line 131
    invoke-direct {p0}, Lcom/sun/mail/util/UUEncoderStream;->encode()V

    .line 132
    const/4 v0, 0x0

    iput v0, p0, Lcom/sun/mail/util/UUEncoderStream;->bufsize:I

    .line 134
    :cond_d
    invoke-direct {p0}, Lcom/sun/mail/util/UUEncoderStream;->writeSuffix()V

    .line 135
    iget-object v0, p0, Lcom/sun/mail/util/UUEncoderStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 136
    return-void
.end method

.method public setNameMode(Ljava/lang/String;I)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "mode"    # I

    .prologue
    .line 102
    iput-object p1, p0, Lcom/sun/mail/util/UUEncoderStream;->name:Ljava/lang/String;

    .line 103
    iput p2, p0, Lcom/sun/mail/util/UUEncoderStream;->mode:I

    .line 104
    return-void
.end method

.method public write(I)V
    .registers 5
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lcom/sun/mail/util/UUEncoderStream;->buffer:[B

    iget v1, p0, Lcom/sun/mail/util/UUEncoderStream;->bufsize:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/sun/mail/util/UUEncoderStream;->bufsize:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 121
    iget v0, p0, Lcom/sun/mail/util/UUEncoderStream;->bufsize:I

    const/16 v1, 0x2d

    if-ne v0, v1, :cond_1a

    .line 122
    invoke-direct {p0}, Lcom/sun/mail/util/UUEncoderStream;->writePrefix()V

    .line 123
    invoke-direct {p0}, Lcom/sun/mail/util/UUEncoderStream;->encode()V

    .line 124
    const/4 v0, 0x0

    iput v0, p0, Lcom/sun/mail/util/UUEncoderStream;->bufsize:I

    .line 126
    :cond_1a
    return-void
.end method

.method public write([B)V
    .registers 4
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/sun/mail/util/UUEncoderStream;->write([BII)V

    .line 113
    return-void
.end method

.method public write([BII)V
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p3, :cond_d

    .line 108
    add-int v1, p2, v0

    aget-byte v1, p1, v1

    invoke-virtual {p0, v1}, Lcom/sun/mail/util/UUEncoderStream;->write(I)V

    .line 107
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 109
    :cond_d
    return-void
.end method
