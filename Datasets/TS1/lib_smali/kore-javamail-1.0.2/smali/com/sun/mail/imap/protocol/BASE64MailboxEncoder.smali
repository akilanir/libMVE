.class public Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;
.super Ljava/lang/Object;
.source "BASE64MailboxEncoder.java"


# static fields
.field private static final pem_array:[C


# instance fields
.field protected buffer:[B

.field protected bufsize:I

.field protected out:Ljava/io/Writer;

.field protected started:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 242
    const/16 v0, 0x40

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->pem_array:[C

    return-void

    :array_a
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x2bs
        0x2cs
    .end array-data
.end method

.method public constructor <init>(Ljava/io/Writer;)V
    .registers 4
    .param p1, "what"    # Ljava/io/Writer;

    .prologue
    const/4 v1, 0x0

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->buffer:[B

    .line 103
    iput v1, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->bufsize:I

    .line 104
    iput-boolean v1, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->started:Z

    .line 105
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->out:Ljava/io/Writer;

    .line 166
    iput-object p1, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->out:Ljava/io/Writer;

    .line 167
    return-void
.end method

.method public static encode(Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "original"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x26

    .line 109
    const/4 v0, 0x0

    .line 110
    .local v0, "base64stream":Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    .line 111
    .local v5, "origchars":[C
    array-length v4, v5

    .line 112
    .local v4, "length":I
    const/4 v1, 0x0

    .line 113
    .local v1, "changedString":Z
    new-instance v6, Ljava/io/CharArrayWriter;

    invoke-direct {v6, v4}, Ljava/io/CharArrayWriter;-><init>(I)V

    .line 116
    .local v6, "writer":Ljava/io/CharArrayWriter;
    const/4 v3, 0x0

    .local v3, "index":I
    :goto_f
    if-ge v3, v4, :cond_3e

    .line 117
    aget-char v2, v5, v3

    .line 121
    .local v2, "current":C
    const/16 v7, 0x20

    if-lt v2, v7, :cond_32

    const/16 v7, 0x7e

    if-gt v2, v7, :cond_32

    .line 122
    if-eqz v0, :cond_20

    .line 123
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->flush()V

    .line 126
    :cond_20
    if-ne v2, v8, :cond_2e

    .line 127
    const/4 v1, 0x1

    .line 128
    invoke-virtual {v6, v8}, Ljava/io/CharArrayWriter;->write(I)V

    .line 129
    const/16 v7, 0x2d

    invoke-virtual {v6, v7}, Ljava/io/CharArrayWriter;->write(I)V

    .line 116
    :goto_2b
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 131
    :cond_2e
    invoke-virtual {v6, v2}, Ljava/io/CharArrayWriter;->write(I)V

    goto :goto_2b

    .line 140
    :cond_32
    if-nez v0, :cond_3a

    .line 141
    new-instance v0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;

    .end local v0    # "base64stream":Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;
    invoke-direct {v0, v6}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;-><init>(Ljava/io/Writer;)V

    .line 142
    .restart local v0    # "base64stream":Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;
    const/4 v1, 0x1

    .line 145
    :cond_3a
    invoke-virtual {v0, v2}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->write(I)V

    goto :goto_2b

    .line 150
    .end local v2    # "current":C
    :cond_3e
    if-eqz v0, :cond_43

    .line 151
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->flush()V

    .line 154
    :cond_43
    if-eqz v1, :cond_49

    .line 155
    invoke-virtual {v6}, Ljava/io/CharArrayWriter;->toString()Ljava/lang/String;

    move-result-object p0

    .line 157
    .end local p0    # "original":Ljava/lang/String;
    :cond_49
    return-object p0
.end method


# virtual methods
.method protected encode()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v7, 0x0

    .line 212
    iget v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->bufsize:I

    if-ne v3, v4, :cond_2a

    .line 213
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->buffer:[B

    aget-byte v0, v3, v7

    .line 214
    .local v0, "a":B
    const/4 v1, 0x0

    .line 215
    .local v1, "b":B
    const/4 v2, 0x0

    .line 216
    .local v2, "c":B
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->out:Ljava/io/Writer;

    sget-object v4, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->pem_array:[C

    ushr-int/lit8 v5, v0, 0x2

    and-int/lit8 v5, v5, 0x3f

    aget-char v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(I)V

    .line 217
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->out:Ljava/io/Writer;

    sget-object v4, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->pem_array:[C

    shl-int/lit8 v5, v0, 0x4

    and-int/lit8 v5, v5, 0x30

    add-int/lit8 v5, v5, 0x0

    aget-char v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(I)V

    .line 240
    :cond_29
    :goto_29
    return-void

    .line 219
    .end local v0    # "a":B
    .end local v1    # "b":B
    .end local v2    # "c":B
    :cond_2a
    iget v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->bufsize:I

    if-ne v3, v5, :cond_66

    .line 220
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->buffer:[B

    aget-byte v0, v3, v7

    .line 221
    .restart local v0    # "a":B
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->buffer:[B

    aget-byte v1, v3, v4

    .line 222
    .restart local v1    # "b":B
    const/4 v2, 0x0

    .line 223
    .restart local v2    # "c":B
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->out:Ljava/io/Writer;

    sget-object v4, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->pem_array:[C

    ushr-int/lit8 v5, v0, 0x2

    and-int/lit8 v5, v5, 0x3f

    aget-char v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(I)V

    .line 224
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->out:Ljava/io/Writer;

    sget-object v4, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->pem_array:[C

    shl-int/lit8 v5, v0, 0x4

    and-int/lit8 v5, v5, 0x30

    ushr-int/lit8 v6, v1, 0x4

    and-int/lit8 v6, v6, 0xf

    add-int/2addr v5, v6

    aget-char v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(I)V

    .line 225
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->out:Ljava/io/Writer;

    sget-object v4, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->pem_array:[C

    shl-int/lit8 v5, v1, 0x2

    and-int/lit8 v5, v5, 0x3c

    add-int/lit8 v5, v5, 0x0

    aget-char v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(I)V

    goto :goto_29

    .line 228
    .end local v0    # "a":B
    .end local v1    # "b":B
    .end local v2    # "c":B
    :cond_66
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->buffer:[B

    aget-byte v0, v3, v7

    .line 229
    .restart local v0    # "a":B
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->buffer:[B

    aget-byte v1, v3, v4

    .line 230
    .restart local v1    # "b":B
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->buffer:[B

    aget-byte v2, v3, v5

    .line 231
    .restart local v2    # "c":B
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->out:Ljava/io/Writer;

    sget-object v4, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->pem_array:[C

    ushr-int/lit8 v5, v0, 0x2

    and-int/lit8 v5, v5, 0x3f

    aget-char v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(I)V

    .line 232
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->out:Ljava/io/Writer;

    sget-object v4, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->pem_array:[C

    shl-int/lit8 v5, v0, 0x4

    and-int/lit8 v5, v5, 0x30

    ushr-int/lit8 v6, v1, 0x4

    and-int/lit8 v6, v6, 0xf

    add-int/2addr v5, v6

    aget-char v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(I)V

    .line 233
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->out:Ljava/io/Writer;

    sget-object v4, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->pem_array:[C

    shl-int/lit8 v5, v1, 0x2

    and-int/lit8 v5, v5, 0x3c

    ushr-int/lit8 v6, v2, 0x6

    and-int/lit8 v6, v6, 0x3

    add-int/2addr v5, v6

    aget-char v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(I)V

    .line 234
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->out:Ljava/io/Writer;

    sget-object v4, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->pem_array:[C

    and-int/lit8 v5, v2, 0x3f

    aget-char v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(I)V

    .line 237
    iget v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->bufsize:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_29

    .line 238
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->buffer:[B

    iget-object v4, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->buffer:[B

    const/4 v5, 0x3

    aget-byte v4, v4, v5

    aput-byte v4, v3, v7

    goto/16 :goto_29
.end method

.method public flush()V
    .registers 3

    .prologue
    .line 194
    :try_start_0
    iget v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->bufsize:I

    if-lez v0, :cond_a

    .line 195
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode()V

    .line 196
    const/4 v0, 0x0

    iput v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->bufsize:I

    .line 200
    :cond_a
    iget-boolean v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->started:Z

    if-eqz v0, :cond_18

    .line 201
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->out:Ljava/io/Writer;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(I)V

    .line 202
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->started:Z
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_18} :catch_19

    .line 207
    :cond_18
    :goto_18
    return-void

    .line 204
    :catch_19
    move-exception v0

    goto :goto_18
.end method

.method public write(I)V
    .registers 5
    .param p1, "c"    # I

    .prologue
    .line 172
    :try_start_0
    iget-boolean v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->started:Z

    if-nez v0, :cond_e

    .line 173
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->started:Z

    .line 174
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->out:Ljava/io/Writer;

    const/16 v1, 0x26

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(I)V

    .line 178
    :cond_e
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->buffer:[B

    iget v1, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->bufsize:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->bufsize:I

    shr-int/lit8 v2, p1, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 179
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->buffer:[B

    iget v1, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->bufsize:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->bufsize:I

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 181
    iget v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->bufsize:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_36

    .line 182
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->encode()V

    .line 183
    iget v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->bufsize:I

    add-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/sun/mail/imap/protocol/BASE64MailboxEncoder;->bufsize:I
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_36} :catch_37

    .line 188
    :cond_36
    :goto_36
    return-void

    .line 185
    :catch_37
    move-exception v0

    goto :goto_36
.end method
