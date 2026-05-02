.class Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;
.super Ljava/io/Writer;
.source "StandardCompress.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/utility/StandardCompress;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StandardCompressWriter"
.end annotation


# static fields
.field private static final AT_BEGINNING:I = 0x0

.field private static final INIT:I = 0x2

.field private static final LINEBREAK_CR:I = 0x4

.field private static final LINEBREAK_CRLF:I = 0x5

.field private static final LINEBREAK_LF:I = 0x6

.field private static final MAX_EOL_LENGTH:I = 0x2

.field private static final SAW_CR:I = 0x3

.field private static final SINGLE_LINE:I = 0x1


# instance fields
.field private final buf:[C

.field private inWhitespace:Z

.field private lineBreakState:I

.field private final out:Ljava/io/Writer;

.field private pos:I

.field private final singleLine:Z


# direct methods
.method public constructor <init>(Ljava/io/Writer;IZ)V
    .registers 6
    .param p1, "out"    # Ljava/io/Writer;
    .param p2, "bufSize"    # I
    .param p3, "singleLine"    # Z

    .prologue
    const/4 v1, 0x0

    .line 169
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 165
    iput v1, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    .line 166
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->inWhitespace:Z

    .line 167
    iput v1, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->lineBreakState:I

    .line 170
    iput-object p1, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->out:Ljava/io/Writer;

    .line 171
    iput-boolean p3, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->singleLine:Z

    .line 172
    new-array v0, p2, [C

    iput-object v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->buf:[C

    .line 173
    return-void
.end method

.method private flushInternal()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 260
    iget-object v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->out:Ljava/io/Writer;

    iget-object v1, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->buf:[C

    iget v2, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/Writer;->write([CII)V

    .line 261
    iput v3, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    .line 262
    return-void
.end method

.method private updateLineBreakState(C)V
    .registers 4
    .param p1, "c"    # C

    .prologue
    const/16 v1, 0xa

    .line 218
    iget v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->lineBreakState:I

    packed-switch v0, :pswitch_data_20

    .line 233
    :cond_7
    :goto_7
    return-void

    .line 220
    :pswitch_8
    const/16 v0, 0xd

    if-ne p1, v0, :cond_10

    .line 221
    const/4 v0, 0x3

    iput v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->lineBreakState:I

    goto :goto_7

    .line 222
    :cond_10
    if-ne p1, v1, :cond_7

    .line 223
    const/4 v0, 0x6

    iput v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->lineBreakState:I

    goto :goto_7

    .line 227
    :pswitch_16
    if-ne p1, v1, :cond_1c

    .line 228
    const/4 v0, 0x5

    iput v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->lineBreakState:I

    goto :goto_7

    .line 230
    :cond_1c
    const/4 v0, 0x4

    iput v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->lineBreakState:I

    goto :goto_7

    .line 218
    :pswitch_data_20
    .packed-switch 0x2
        :pswitch_8
        :pswitch_16
    .end packed-switch
.end method

.method private writeHelper([CII)V
    .registers 10
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 194
    move v2, p2

    .local v2, "i":I
    add-int v1, p2, p3

    .local v1, "end":I
    :goto_3
    if-ge v2, v1, :cond_36

    .line 195
    aget-char v0, p1, v2

    .line 196
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 197
    const/4 v3, 0x1

    iput-boolean v3, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->inWhitespace:Z

    .line 198
    invoke-direct {p0, v0}, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->updateLineBreakState(C)V

    .line 194
    :goto_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 199
    :cond_16
    iget-boolean v3, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->inWhitespace:Z

    if-eqz v3, :cond_2b

    .line 200
    const/4 v3, 0x0

    iput-boolean v3, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->inWhitespace:Z

    .line 201
    invoke-direct {p0}, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->writeLineBreakOrSpace()V

    .line 202
    iget-object v3, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->buf:[C

    iget v4, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    aput-char v0, v3, v4

    goto :goto_13

    .line 204
    :cond_2b
    iget-object v3, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->buf:[C

    iget v4, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    aput-char v0, v3, v4

    goto :goto_13

    .line 207
    .end local v0    # "c":C
    :cond_36
    return-void
.end method

.method private writeLineBreakOrSpace()V
    .registers 5

    .prologue
    const/16 v3, 0xd

    .line 237
    iget v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->lineBreakState:I

    packed-switch v0, :pswitch_data_40

    .line 256
    :goto_7
    :pswitch_7
    iget-boolean v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->singleLine:Z

    if-eqz v0, :cond_3e

    const/4 v0, 0x1

    :goto_c
    iput v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->lineBreakState:I

    .line 257
    return-void

    .line 241
    :pswitch_f
    iget-object v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->buf:[C

    iget v1, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    aput-char v3, v0, v1

    goto :goto_7

    .line 244
    :pswitch_1a
    iget-object v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->buf:[C

    iget v1, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    aput-char v3, v0, v1

    .line 247
    :pswitch_24
    iget-object v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->buf:[C

    iget v1, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    const/16 v2, 0xa

    aput-char v2, v0, v1

    goto :goto_7

    .line 254
    :pswitch_31
    iget-object v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->buf:[C

    iget v1, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    const/16 v2, 0x20

    aput-char v2, v0, v1

    goto :goto_7

    .line 256
    :cond_3e
    const/4 v0, 0x2

    goto :goto_c

    .line 237
    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_7
        :pswitch_31
        :pswitch_31
        :pswitch_f
        :pswitch_f
        :pswitch_1a
        :pswitch_24
    .end packed-switch
.end method


# virtual methods
.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 270
    invoke-direct {p0}, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->flushInternal()V

    .line 271
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
    .line 265
    invoke-direct {p0}, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->flushInternal()V

    .line 266
    iget-object v0, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 267
    return-void
.end method

.method public write([CII)V
    .registers 7
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    :goto_0
    iget-object v1, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->buf:[C

    array-length v1, v1

    iget v2, p0, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->pos:I

    sub-int/2addr v1, v2

    add-int/lit8 v0, v1, -0x2

    .line 179
    .local v0, "room":I
    if-lt v0, p3, :cond_e

    .line 180
    invoke-direct {p0, p1, p2, p3}, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->writeHelper([CII)V

    .line 191
    return-void

    .line 182
    :cond_e
    if-gtz v0, :cond_14

    .line 183
    invoke-direct {p0}, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->flushInternal()V

    goto :goto_0

    .line 185
    :cond_14
    invoke-direct {p0, p1, p2, v0}, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->writeHelper([CII)V

    .line 186
    invoke-direct {p0}, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;->flushInternal()V

    .line 187
    add-int/2addr p2, v0

    .line 188
    sub-int/2addr p3, v0

    goto :goto_0
.end method
