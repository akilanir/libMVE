.class public Lezvcard/io/text/FoldedLineWriter;
.super Ljava/io/Writer;
.source "FoldedLineWriter.java"


# instance fields
.field private curLineLength:I

.field private indent:Ljava/lang/String;

.field private lineLength:Ljava/lang/Integer;

.field private newline:Ljava/lang/String;

.field private final writer:Ljava/io/Writer;


# direct methods
.method public constructor <init>(Ljava/io/Writer;)V
    .registers 3
    .param p1, "writer"    # Ljava/io/Writer;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput v0, p0, Lezvcard/io/text/FoldedLineWriter;->curLineLength:I

    .line 47
    const/16 v0, 0x4b

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/text/FoldedLineWriter;->lineLength:Ljava/lang/Integer;

    .line 48
    const-string v0, " "

    iput-object v0, p0, Lezvcard/io/text/FoldedLineWriter;->indent:Ljava/lang/String;

    .line 49
    const-string v0, "\r\n"

    iput-object v0, p0, Lezvcard/io/text/FoldedLineWriter;->newline:Ljava/lang/String;

    .line 56
    iput-object p1, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    .line 57
    return-void
.end method


# virtual methods
.method public append(Ljava/lang/CharSequence;ZLjava/nio/charset/Charset;)Lezvcard/io/text/FoldedLineWriter;
    .registers 4
    .param p1, "str"    # Ljava/lang/CharSequence;
    .param p2, "quotedPrintable"    # Z
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-virtual {p0, p1, p2, p3}, Lezvcard/io/text/FoldedLineWriter;->write(Ljava/lang/CharSequence;ZLjava/nio/charset/Charset;)V

    .line 82
    return-object p0
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    iget-object v0, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    .line 233
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
    .line 240
    iget-object v0, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 241
    return-void
.end method

.method public getEncoding()Ljava/nio/charset/Charset;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 320
    iget-object v3, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    instance-of v3, v3, Ljava/io/OutputStreamWriter;

    if-nez v3, :cond_8

    .line 326
    :cond_7
    :goto_7
    return-object v2

    .line 324
    :cond_8
    iget-object v1, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    check-cast v1, Ljava/io/OutputStreamWriter;

    .line 325
    .local v1, "osw":Ljava/io/OutputStreamWriter;
    invoke-virtual {v1}, Ljava/io/OutputStreamWriter;->getEncoding()Ljava/lang/String;

    move-result-object v0

    .line 326
    .local v0, "charsetStr":Ljava/lang/String;
    if-eqz v0, :cond_7

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v2

    goto :goto_7
.end method

.method public getIndent()Ljava/lang/String;
    .registers 2

    .prologue
    .line 272
    iget-object v0, p0, Lezvcard/io/text/FoldedLineWriter;->indent:Ljava/lang/String;

    return-object v0
.end method

.method public getLineLength()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 249
    iget-object v0, p0, Lezvcard/io/text/FoldedLineWriter;->lineLength:Ljava/lang/Integer;

    return-object v0
.end method

.method public getNewline()Ljava/lang/String;
    .registers 2

    .prologue
    .line 295
    iget-object v0, p0, Lezvcard/io/text/FoldedLineWriter;->newline:Ljava/lang/String;

    return-object v0
.end method

.method public getWriter()Ljava/io/Writer;
    .registers 2

    .prologue
    .line 312
    iget-object v0, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    return-object v0
.end method

.method public setIndent(Ljava/lang/String;)V
    .registers 4
    .param p1, "indent"    # Ljava/lang/String;

    .prologue
    .line 283
    iget-object v0, p0, Lezvcard/io/text/FoldedLineWriter;->lineLength:Ljava/lang/Integer;

    if-eqz v0, :cond_18

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iget-object v1, p0, Lezvcard/io/text/FoldedLineWriter;->lineLength:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-lt v0, v1, :cond_18

    .line 284
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The length of the indent string must be less than the max line length."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 286
    :cond_18
    iput-object p1, p0, Lezvcard/io/text/FoldedLineWriter;->indent:Ljava/lang/String;

    .line 287
    return-void
.end method

.method public setLineLength(Ljava/lang/Integer;)V
    .registers 4
    .param p1, "lineLength"    # Ljava/lang/Integer;

    .prologue
    .line 260
    if-eqz p1, :cond_10

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-gtz v0, :cond_10

    .line 261
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Line length must be greater than 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 263
    :cond_10
    iput-object p1, p0, Lezvcard/io/text/FoldedLineWriter;->lineLength:Ljava/lang/Integer;

    .line 264
    return-void
.end method

.method public setNewline(Ljava/lang/String;)V
    .registers 2
    .param p1, "newline"    # Ljava/lang/String;

    .prologue
    .line 304
    iput-object p1, p0, Lezvcard/io/text/FoldedLineWriter;->newline:Ljava/lang/String;

    .line 305
    return-void
.end method

.method public write(Ljava/lang/CharSequence;ZLjava/nio/charset/Charset;)V
    .registers 10
    .param p1, "str"    # Ljava/lang/CharSequence;
    .param p2, "quotedPrintable"    # Z
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    move-object v0, p0

    move v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lezvcard/io/text/FoldedLineWriter;->write([CIIZLjava/nio/charset/Charset;)V

    .line 97
    return-void
.end method

.method public write([CII)V
    .registers 10
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lezvcard/io/text/FoldedLineWriter;->write([CIIZLjava/nio/charset/Charset;)V

    .line 102
    return-void
.end method

.method public write([CIIZLjava/nio/charset/Charset;)V
    .registers 18
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .param p4, "quotedPrintable"    # Z
    .param p5, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    if-eqz p4, :cond_22

    .line 119
    if-nez p5, :cond_a

    .line 120
    const-string v10, "UTF-8"

    invoke-static {v10}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object p5

    .line 123
    :cond_a
    new-instance v1, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;

    invoke-virtual/range {p5 .. p5}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v1, v10}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;-><init>(Ljava/lang/String;)V

    .line 125
    .local v1, "codec":Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;
    :try_start_13
    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 126
    .local v9, "str":Ljava/lang/String;
    invoke-virtual {v1, v9}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 128
    .local v4, "encoded":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->toCharArray()[C

    move-result-object p1

    .line 129
    const/4 p2, 0x0

    .line 130
    array-length p3, p1
    :try_end_22
    .catch Lezvcard/util/org/apache/commons/codec/EncoderException; {:try_start_13 .. :try_end_22} :catch_2c

    .line 138
    .end local v1    # "codec":Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;
    .end local v4    # "encoded":Ljava/lang/String;
    .end local v9    # "str":Ljava/lang/String;
    :cond_22
    iget-object v10, p0, Lezvcard/io/text/FoldedLineWriter;->lineLength:Ljava/lang/Integer;

    if-nez v10, :cond_33

    .line 140
    iget-object v10, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v10, p1, p2, p3}, Ljava/io/Writer;->write([CII)V

    .line 225
    :goto_2b
    return-void

    .line 131
    .restart local v1    # "codec":Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;
    :catch_2c
    move-exception v2

    .line 134
    .local v2, "e":Lezvcard/util/org/apache/commons/codec/EncoderException;
    new-instance v10, Ljava/lang/RuntimeException;

    invoke-direct {v10, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v10

    .line 144
    .end local v1    # "codec":Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;
    .end local v2    # "e":Lezvcard/util/org/apache/commons/codec/EncoderException;
    :cond_33
    iget-object v10, p0, Lezvcard/io/text/FoldedLineWriter;->lineLength:Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 145
    .local v3, "effectiveLineLength":I
    if-eqz p4, :cond_3d

    .line 147
    add-int/lit8 v3, v3, -0x1

    .line 150
    :cond_3d
    const/4 v5, -0x1

    .line 151
    .local v5, "encodedCharPos":I
    move v8, p2

    .line 152
    .local v8, "start":I
    add-int v6, p2, p3

    .line 153
    .local v6, "end":I
    move v7, v8

    .local v7, "i":I
    :goto_42
    if-ge v7, v6, :cond_ad

    .line 154
    aget-char v0, p1, v7

    .line 157
    .local v0, "c":C
    if-ltz v5, :cond_4e

    .line 158
    add-int/lit8 v5, v5, 0x1

    .line 159
    const/4 v10, 0x3

    if-ne v5, v10, :cond_4e

    .line 160
    const/4 v5, -0x1

    .line 164
    :cond_4e
    const/16 v10, 0xa

    if-ne v0, v10, :cond_63

    .line 165
    iget-object v10, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    sub-int v11, v7, v8

    add-int/lit8 v11, v11, 0x1

    invoke-virtual {v10, p1, v8, v11}, Ljava/io/Writer;->write([CII)V

    .line 166
    const/4 v10, 0x0

    iput v10, p0, Lezvcard/io/text/FoldedLineWriter;->curLineLength:I

    .line 167
    add-int/lit8 v8, v7, 0x1

    .line 153
    :goto_60
    add-int/lit8 v7, v7, 0x1

    goto :goto_42

    .line 171
    :cond_63
    const/16 v10, 0xd

    if-ne v0, v10, :cond_89

    .line 172
    add-int/lit8 v10, v6, -0x1

    if-eq v7, v10, :cond_73

    add-int/lit8 v10, v7, 0x1

    aget-char v10, p1, v10

    const/16 v11, 0xa

    if-eq v10, v11, :cond_82

    .line 173
    :cond_73
    iget-object v10, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    sub-int v11, v7, v8

    add-int/lit8 v11, v11, 0x1

    invoke-virtual {v10, p1, v8, v11}, Ljava/io/Writer;->write([CII)V

    .line 174
    const/4 v10, 0x0

    iput v10, p0, Lezvcard/io/text/FoldedLineWriter;->curLineLength:I

    .line 175
    add-int/lit8 v8, v7, 0x1

    goto :goto_60

    .line 177
    :cond_82
    iget v10, p0, Lezvcard/io/text/FoldedLineWriter;->curLineLength:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lezvcard/io/text/FoldedLineWriter;->curLineLength:I

    goto :goto_60

    .line 182
    :cond_89
    const/16 v10, 0x3d

    if-ne v0, v10, :cond_90

    if-eqz p4, :cond_90

    .line 183
    const/4 v5, 0x0

    .line 186
    :cond_90
    iget v10, p0, Lezvcard/io/text/FoldedLineWriter;->curLineLength:I

    if-lt v10, v3, :cond_ea

    .line 189
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v10

    if-eqz v10, :cond_b6

    .line 190
    :goto_9a
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v10

    if-eqz v10, :cond_a9

    add-int/lit8 v10, v6, -0x1

    if-ge v7, v10, :cond_a9

    .line 191
    add-int/lit8 v7, v7, 0x1

    .line 192
    aget-char v0, p1, v7

    goto :goto_9a

    .line 194
    :cond_a9
    add-int/lit8 v10, v6, -0x1

    if-lt v7, v10, :cond_b6

    .line 224
    .end local v0    # "c":C
    :cond_ad
    iget-object v10, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    sub-int v11, v6, v8

    invoke-virtual {v10, p1, v8, v11}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_2b

    .line 201
    .restart local v0    # "c":C
    :cond_b6
    if-lez v5, :cond_bf

    .line 202
    rsub-int/lit8 v10, v5, 0x3

    add-int/2addr v7, v10

    .line 203
    add-int/lit8 v10, v6, -0x1

    if-ge v7, v10, :cond_ad

    .line 209
    :cond_bf
    iget-object v10, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    sub-int v11, v7, v8

    invoke-virtual {v10, p1, v8, v11}, Ljava/io/Writer;->write([CII)V

    .line 210
    if-eqz p4, :cond_cf

    .line 211
    iget-object v10, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    const/16 v11, 0x3d

    invoke-virtual {v10, v11}, Ljava/io/Writer;->write(I)V

    .line 213
    :cond_cf
    iget-object v10, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    iget-object v11, p0, Lezvcard/io/text/FoldedLineWriter;->newline:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 214
    iget-object v10, p0, Lezvcard/io/text/FoldedLineWriter;->writer:Ljava/io/Writer;

    iget-object v11, p0, Lezvcard/io/text/FoldedLineWriter;->indent:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 215
    iget-object v10, p0, Lezvcard/io/text/FoldedLineWriter;->indent:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lezvcard/io/text/FoldedLineWriter;->curLineLength:I

    .line 216
    move v8, v7

    .line 218
    goto/16 :goto_60

    .line 221
    :cond_ea
    iget v10, p0, Lezvcard/io/text/FoldedLineWriter;->curLineLength:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lezvcard/io/text/FoldedLineWriter;->curLineLength:I

    goto/16 :goto_60
.end method

.method public writeln(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    invoke-virtual {p0, p1}, Lezvcard/io/text/FoldedLineWriter;->write(Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Lezvcard/io/text/FoldedLineWriter;->newline:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lezvcard/io/text/FoldedLineWriter;->write(Ljava/lang/String;)V

    .line 67
    return-void
.end method
