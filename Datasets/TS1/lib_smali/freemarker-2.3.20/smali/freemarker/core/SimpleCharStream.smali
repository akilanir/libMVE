.class public Lfreemarker/core/SimpleCharStream;
.super Ljava/lang/Object;
.source "SimpleCharStream.java"


# static fields
.field public static final staticFlag:Z


# instance fields
.field available:I

.field protected bufcolumn:[I

.field protected buffer:[C

.field protected bufline:[I

.field public bufpos:I

.field bufsize:I

.field protected column:I

.field protected inBuf:I

.field protected inputStream:Ljava/io/Reader;

.field protected line:I

.field protected maxNextCharInd:I

.field protected prevCharIsCR:Z

.field protected prevCharIsLF:Z

.field tokenBegin:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "dstream"    # Ljava/io/InputStream;

    .prologue
    const/4 v1, 0x1

    .line 303
    const/16 v0, 0x1000

    invoke-direct {p0, p1, v1, v1, v0}, Lfreemarker/core/SimpleCharStream;-><init>(Ljava/io/InputStream;III)V

    .line 304
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;II)V
    .registers 5
    .param p1, "dstream"    # Ljava/io/InputStream;
    .param p2, "startline"    # I
    .param p3, "startcolumn"    # I

    .prologue
    .line 298
    const/16 v0, 0x1000

    invoke-direct {p0, p1, p2, p3, v0}, Lfreemarker/core/SimpleCharStream;-><init>(Ljava/io/InputStream;III)V

    .line 299
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;III)V
    .registers 7
    .param p1, "dstream"    # Ljava/io/InputStream;
    .param p2, "startline"    # I
    .param p3, "startcolumn"    # I
    .param p4, "buffersize"    # I

    .prologue
    .line 292
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v1, 0x1000

    invoke-direct {p0, v0, p2, p3, v1}, Lfreemarker/core/SimpleCharStream;-><init>(Ljava/io/Reader;III)V

    .line 293
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .registers 4
    .param p1, "dstream"    # Ljava/io/Reader;

    .prologue
    const/4 v1, 0x1

    .line 258
    const/16 v0, 0x1000

    invoke-direct {p0, p1, v1, v1, v0}, Lfreemarker/core/SimpleCharStream;-><init>(Ljava/io/Reader;III)V

    .line 259
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;II)V
    .registers 5
    .param p1, "dstream"    # Ljava/io/Reader;
    .param p2, "startline"    # I
    .param p3, "startcolumn"    # I

    .prologue
    .line 253
    const/16 v0, 0x1000

    invoke-direct {p0, p1, p2, p3, v0}, Lfreemarker/core/SimpleCharStream;-><init>(Ljava/io/Reader;III)V

    .line 254
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;III)V
    .registers 7
    .param p1, "dstream"    # Ljava/io/Reader;
    .param p2, "startline"    # I
    .param p3, "startcolumn"    # I
    .param p4, "buffersize"    # I

    .prologue
    const/4 v1, 0x0

    .line 239
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v0, -0x1

    iput v0, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    .line 19
    iput v1, p0, Lfreemarker/core/SimpleCharStream;->column:I

    .line 20
    const/4 v0, 0x1

    iput v0, p0, Lfreemarker/core/SimpleCharStream;->line:I

    .line 22
    iput-boolean v1, p0, Lfreemarker/core/SimpleCharStream;->prevCharIsCR:Z

    .line 23
    iput-boolean v1, p0, Lfreemarker/core/SimpleCharStream;->prevCharIsLF:Z

    .line 28
    iput v1, p0, Lfreemarker/core/SimpleCharStream;->maxNextCharInd:I

    .line 29
    iput v1, p0, Lfreemarker/core/SimpleCharStream;->inBuf:I

    .line 240
    iput-object p1, p0, Lfreemarker/core/SimpleCharStream;->inputStream:Ljava/io/Reader;

    .line 241
    iput p2, p0, Lfreemarker/core/SimpleCharStream;->line:I

    .line 242
    add-int/lit8 v0, p3, -0x1

    iput v0, p0, Lfreemarker/core/SimpleCharStream;->column:I

    .line 244
    iput p4, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iput p4, p0, Lfreemarker/core/SimpleCharStream;->available:I

    .line 245
    new-array v0, p4, [C

    iput-object v0, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    .line 246
    new-array v0, p4, [I

    iput-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    .line 247
    new-array v0, p4, [I

    iput-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    .line 248
    return-void
.end method


# virtual methods
.method public BeginToken()C
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    const/4 v1, -0x1

    iput v1, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    .line 129
    invoke-virtual {p0}, Lfreemarker/core/SimpleCharStream;->readChar()C

    move-result v0

    .line 130
    .local v0, "c":C
    iget v1, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iput v1, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    .line 132
    return v0
.end method

.method public Done()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 348
    iput-object v0, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    .line 349
    iput-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    .line 350
    iput-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    .line 351
    return-void
.end method

.method protected ExpandBuff(Z)V
    .registers 12
    .param p1, "wrapAround"    # Z

    .prologue
    const/4 v9, 0x0

    .line 33
    iget v4, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    add-int/lit16 v4, v4, 0x800

    new-array v1, v4, [C

    .line 34
    .local v1, "newbuffer":[C
    iget v4, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    add-int/lit16 v4, v4, 0x800

    new-array v2, v4, [I

    .line 35
    .local v2, "newbufline":[I
    iget v4, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    add-int/lit16 v4, v4, 0x800

    new-array v0, v4, [I

    .line 39
    .local v0, "newbufcolumn":[I
    if-eqz p1, :cond_82

    .line 41
    :try_start_15
    iget-object v4, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    iget v5, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    const/4 v6, 0x0

    iget v7, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iget v8, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v7, v8

    invoke-static {v4, v5, v1, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    iget-object v4, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    const/4 v5, 0x0

    iget v6, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iget v7, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v6, v7

    iget v7, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    invoke-static {v4, v5, v1, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    iput-object v1, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    .line 46
    iget-object v4, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    iget v5, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    const/4 v6, 0x0

    iget v7, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iget v8, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v7, v8

    invoke-static {v4, v5, v2, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 47
    iget-object v4, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    const/4 v5, 0x0

    iget v6, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iget v7, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v6, v7

    iget v7, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    invoke-static {v4, v5, v2, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    iput-object v2, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    .line 50
    iget-object v4, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    iget v5, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    const/4 v6, 0x0

    iget v7, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iget v8, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v7, v8

    invoke-static {v4, v5, v0, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    iget-object v4, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    const/4 v5, 0x0

    iget v6, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iget v7, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v6, v7

    iget v7, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    invoke-static {v4, v5, v0, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 52
    iput-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    .line 54
    iget v4, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iget v5, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iget v6, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v5, v6

    add-int/2addr v4, v5

    iput v4, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iput v4, p0, Lfreemarker/core/SimpleCharStream;->maxNextCharInd:I
    :try_end_75
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_75} :catch_b9

    .line 76
    :goto_75
    iget v4, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    add-int/lit16 v4, v4, 0x800

    iput v4, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    .line 77
    iget v4, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iput v4, p0, Lfreemarker/core/SimpleCharStream;->available:I

    .line 78
    iput v9, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    .line 79
    return-void

    .line 58
    :cond_82
    :try_start_82
    iget-object v4, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    iget v5, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    const/4 v6, 0x0

    iget v7, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iget v8, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v7, v8

    invoke-static {v4, v5, v1, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    iput-object v1, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    .line 61
    iget-object v4, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    iget v5, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    const/4 v6, 0x0

    iget v7, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iget v8, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v7, v8

    invoke-static {v4, v5, v2, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 62
    iput-object v2, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    .line 64
    iget-object v4, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    iget v5, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    const/4 v6, 0x0

    iget v7, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iget v8, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v7, v8

    invoke-static {v4, v5, v0, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    iput-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    .line 67
    iget v4, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iget v5, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v4, v5

    iput v4, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iput v4, p0, Lfreemarker/core/SimpleCharStream;->maxNextCharInd:I
    :try_end_b8
    .catch Ljava/lang/Throwable; {:try_start_82 .. :try_end_b8} :catch_b9

    goto :goto_75

    .line 70
    :catch_b9
    move-exception v3

    .line 72
    .local v3, "t":Ljava/lang/Throwable;
    new-instance v4, Ljava/lang/Error;

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method protected FillBuff()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x800

    const/4 v8, -0x1

    const/4 v7, 0x0

    .line 83
    iget v2, p0, Lfreemarker/core/SimpleCharStream;->maxNextCharInd:I

    iget v3, p0, Lfreemarker/core/SimpleCharStream;->available:I

    if-ne v2, v3, :cond_1c

    .line 85
    iget v2, p0, Lfreemarker/core/SimpleCharStream;->available:I

    iget v3, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    if-ne v2, v3, :cond_58

    .line 87
    iget v2, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    if-le v2, v4, :cond_4b

    .line 89
    iput v7, p0, Lfreemarker/core/SimpleCharStream;->maxNextCharInd:I

    iput v7, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    .line 90
    iget v2, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    iput v2, p0, Lfreemarker/core/SimpleCharStream;->available:I

    .line 107
    :cond_1c
    :goto_1c
    :try_start_1c
    iget-object v2, p0, Lfreemarker/core/SimpleCharStream;->inputStream:Ljava/io/Reader;

    iget-object v3, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    iget v4, p0, Lfreemarker/core/SimpleCharStream;->maxNextCharInd:I

    iget v5, p0, Lfreemarker/core/SimpleCharStream;->available:I

    iget v6, p0, Lfreemarker/core/SimpleCharStream;->maxNextCharInd:I

    sub-int/2addr v5, v6

    invoke-virtual {v2, v3, v4, v5}, Ljava/io/Reader;->read([CII)I

    move-result v1

    .local v1, "i":I
    if-ne v1, v8, :cond_74

    .line 110
    iget-object v2, p0, Lfreemarker/core/SimpleCharStream;->inputStream:Ljava/io/Reader;

    invoke-virtual {v2}, Ljava/io/Reader;->close()V

    .line 111
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2}, Ljava/io/IOException;-><init>()V

    throw v2
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_38} :catch_38

    .line 117
    .end local v1    # "i":I
    :catch_38
    move-exception v0

    .line 118
    .local v0, "e":Ljava/io/IOException;
    iget v2, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    .line 119
    invoke-virtual {p0, v7}, Lfreemarker/core/SimpleCharStream;->backup(I)V

    .line 120
    iget v2, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    if-ne v2, v8, :cond_4a

    .line 121
    iget v2, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iput v2, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    .line 122
    :cond_4a
    throw v0

    .line 92
    .end local v0    # "e":Ljava/io/IOException;
    :cond_4b
    iget v2, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    if-gez v2, :cond_54

    .line 93
    iput v7, p0, Lfreemarker/core/SimpleCharStream;->maxNextCharInd:I

    iput v7, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    goto :goto_1c

    .line 95
    :cond_54
    invoke-virtual {p0, v7}, Lfreemarker/core/SimpleCharStream;->ExpandBuff(Z)V

    goto :goto_1c

    .line 97
    :cond_58
    iget v2, p0, Lfreemarker/core/SimpleCharStream;->available:I

    iget v3, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    if-le v2, v3, :cond_63

    .line 98
    iget v2, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iput v2, p0, Lfreemarker/core/SimpleCharStream;->available:I

    goto :goto_1c

    .line 99
    :cond_63
    iget v2, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    iget v3, p0, Lfreemarker/core/SimpleCharStream;->available:I

    sub-int/2addr v2, v3

    if-ge v2, v4, :cond_6f

    .line 100
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lfreemarker/core/SimpleCharStream;->ExpandBuff(Z)V

    goto :goto_1c

    .line 102
    :cond_6f
    iget v2, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    iput v2, p0, Lfreemarker/core/SimpleCharStream;->available:I

    goto :goto_1c

    .line 114
    .restart local v1    # "i":I
    :cond_74
    :try_start_74
    iget v2, p0, Lfreemarker/core/SimpleCharStream;->maxNextCharInd:I

    add-int/2addr v2, v1

    iput v2, p0, Lfreemarker/core/SimpleCharStream;->maxNextCharInd:I
    :try_end_79
    .catch Ljava/io/IOException; {:try_start_74 .. :try_end_79} :catch_38

    .line 115
    return-void
.end method

.method public GetImage()Ljava/lang/String;
    .registers 7

    .prologue
    .line 323
    iget v0, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iget v1, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    if-lt v0, v1, :cond_17

    .line 324
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    iget v2, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    iget v3, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iget v4, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    .line 326
    :goto_16
    return-object v0

    :cond_17
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    iget v3, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    iget v4, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iget v5, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v4, v5

    invoke-direct {v1, v2, v3, v4}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    const/4 v3, 0x0

    iget v4, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    add-int/lit8 v4, v4, 0x1

    invoke-direct {v1, v2, v3, v4}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_16
.end method

.method public GetSuffix(I)[C
    .registers 7
    .param p1, "len"    # I

    .prologue
    const/4 v4, 0x0

    .line 332
    new-array v0, p1, [C

    .line 334
    .local v0, "ret":[C
    iget v1, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    add-int/lit8 v1, v1, 0x1

    if-lt v1, p1, :cond_14

    .line 335
    iget-object v1, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    iget v2, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    sub-int/2addr v2, p1

    add-int/lit8 v2, v2, 0x1

    invoke-static {v1, v2, v0, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 343
    :goto_13
    return-object v0

    .line 338
    :cond_14
    iget-object v1, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    iget v2, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iget v3, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    sub-int v3, p1, v3

    add-int/lit8 v3, v3, -0x1

    sub-int/2addr v2, v3

    iget v3, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    sub-int v3, p1, v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v1, v2, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 340
    iget-object v1, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    iget v2, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    sub-int v2, p1, v2

    add-int/lit8 v2, v2, -0x1

    iget v3, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    add-int/lit8 v3, v3, 0x1

    invoke-static {v1, v4, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_13
.end method

.method public ReInit(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "dstream"    # Ljava/io/InputStream;

    .prologue
    const/4 v1, 0x1

    .line 314
    const/16 v0, 0x1000

    invoke-virtual {p0, p1, v1, v1, v0}, Lfreemarker/core/SimpleCharStream;->ReInit(Ljava/io/InputStream;III)V

    .line 315
    return-void
.end method

.method public ReInit(Ljava/io/InputStream;II)V
    .registers 5
    .param p1, "dstream"    # Ljava/io/InputStream;
    .param p2, "startline"    # I
    .param p3, "startcolumn"    # I

    .prologue
    .line 319
    const/16 v0, 0x1000

    invoke-virtual {p0, p1, p2, p3, v0}, Lfreemarker/core/SimpleCharStream;->ReInit(Ljava/io/InputStream;III)V

    .line 320
    return-void
.end method

.method public ReInit(Ljava/io/InputStream;III)V
    .registers 7
    .param p1, "dstream"    # Ljava/io/InputStream;
    .param p2, "startline"    # I
    .param p3, "startcolumn"    # I
    .param p4, "buffersize"    # I

    .prologue
    .line 309
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v1, 0x1000

    invoke-virtual {p0, v0, p2, p3, v1}, Lfreemarker/core/SimpleCharStream;->ReInit(Ljava/io/Reader;III)V

    .line 310
    return-void
.end method

.method public ReInit(Ljava/io/Reader;)V
    .registers 4
    .param p1, "dstream"    # Ljava/io/Reader;

    .prologue
    const/4 v1, 0x1

    .line 287
    const/16 v0, 0x1000

    invoke-virtual {p0, p1, v1, v1, v0}, Lfreemarker/core/SimpleCharStream;->ReInit(Ljava/io/Reader;III)V

    .line 288
    return-void
.end method

.method public ReInit(Ljava/io/Reader;II)V
    .registers 5
    .param p1, "dstream"    # Ljava/io/Reader;
    .param p2, "startline"    # I
    .param p3, "startcolumn"    # I

    .prologue
    .line 282
    const/16 v0, 0x1000

    invoke-virtual {p0, p1, p2, p3, v0}, Lfreemarker/core/SimpleCharStream;->ReInit(Ljava/io/Reader;III)V

    .line 283
    return-void
.end method

.method public ReInit(Ljava/io/Reader;III)V
    .registers 7
    .param p1, "dstream"    # Ljava/io/Reader;
    .param p2, "startline"    # I
    .param p3, "startcolumn"    # I
    .param p4, "buffersize"    # I

    .prologue
    const/4 v1, 0x0

    .line 263
    iput-object p1, p0, Lfreemarker/core/SimpleCharStream;->inputStream:Ljava/io/Reader;

    .line 264
    iput p2, p0, Lfreemarker/core/SimpleCharStream;->line:I

    .line 265
    add-int/lit8 v0, p3, -0x1

    iput v0, p0, Lfreemarker/core/SimpleCharStream;->column:I

    .line 267
    iget-object v0, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    if-eqz v0, :cond_12

    iget-object v0, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    array-length v0, v0

    if-eq p4, v0, :cond_22

    .line 269
    :cond_12
    iput p4, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iput p4, p0, Lfreemarker/core/SimpleCharStream;->available:I

    .line 270
    new-array v0, p4, [C

    iput-object v0, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    .line 271
    new-array v0, p4, [I

    iput-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    .line 272
    new-array v0, p4, [I

    iput-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    .line 274
    :cond_22
    iput-boolean v1, p0, Lfreemarker/core/SimpleCharStream;->prevCharIsCR:Z

    iput-boolean v1, p0, Lfreemarker/core/SimpleCharStream;->prevCharIsLF:Z

    .line 275
    iput v1, p0, Lfreemarker/core/SimpleCharStream;->maxNextCharInd:I

    iput v1, p0, Lfreemarker/core/SimpleCharStream;->inBuf:I

    iput v1, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    .line 276
    const/4 v0, -0x1

    iput v0, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    .line 277
    return-void
.end method

.method protected UpdateLineColumn(C)V
    .registers 5
    .param p1, "c"    # C

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 137
    iget v0, p0, Lfreemarker/core/SimpleCharStream;->column:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lfreemarker/core/SimpleCharStream;->column:I

    .line 139
    iget-boolean v0, p0, Lfreemarker/core/SimpleCharStream;->prevCharIsLF:Z

    if-eqz v0, :cond_2a

    .line 141
    iput-boolean v2, p0, Lfreemarker/core/SimpleCharStream;->prevCharIsLF:Z

    .line 142
    iget v0, p0, Lfreemarker/core/SimpleCharStream;->line:I

    iput v1, p0, Lfreemarker/core/SimpleCharStream;->column:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lfreemarker/core/SimpleCharStream;->line:I

    .line 155
    :cond_16
    :goto_16
    packed-switch p1, :pswitch_data_58

    .line 171
    :goto_19
    :pswitch_19
    iget-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    iget v1, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iget v2, p0, Lfreemarker/core/SimpleCharStream;->line:I

    aput v2, v0, v1

    .line 172
    iget-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    iget v1, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iget v2, p0, Lfreemarker/core/SimpleCharStream;->column:I

    aput v2, v0, v1

    .line 173
    return-void

    .line 144
    :cond_2a
    iget-boolean v0, p0, Lfreemarker/core/SimpleCharStream;->prevCharIsCR:Z

    if-eqz v0, :cond_16

    .line 146
    iput-boolean v2, p0, Lfreemarker/core/SimpleCharStream;->prevCharIsCR:Z

    .line 147
    const/16 v0, 0xa

    if-ne p1, v0, :cond_37

    .line 149
    iput-boolean v1, p0, Lfreemarker/core/SimpleCharStream;->prevCharIsLF:Z

    goto :goto_16

    .line 152
    :cond_37
    iget v0, p0, Lfreemarker/core/SimpleCharStream;->line:I

    iput v1, p0, Lfreemarker/core/SimpleCharStream;->column:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lfreemarker/core/SimpleCharStream;->line:I

    goto :goto_16

    .line 158
    :pswitch_40
    iput-boolean v1, p0, Lfreemarker/core/SimpleCharStream;->prevCharIsCR:Z

    goto :goto_19

    .line 161
    :pswitch_43
    iput-boolean v1, p0, Lfreemarker/core/SimpleCharStream;->prevCharIsLF:Z

    goto :goto_19

    .line 164
    :pswitch_46
    iget v0, p0, Lfreemarker/core/SimpleCharStream;->column:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lfreemarker/core/SimpleCharStream;->column:I

    .line 165
    iget v0, p0, Lfreemarker/core/SimpleCharStream;->column:I

    iget v1, p0, Lfreemarker/core/SimpleCharStream;->column:I

    and-int/lit8 v1, v1, 0x7

    rsub-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    iput v0, p0, Lfreemarker/core/SimpleCharStream;->column:I

    goto :goto_19

    .line 155
    :pswitch_data_58
    .packed-switch 0x9
        :pswitch_46
        :pswitch_43
        :pswitch_19
        :pswitch_19
        :pswitch_40
    .end packed-switch
.end method

.method public adjustBeginLineColumn(II)V
    .registers 15
    .param p1, "newLine"    # I
    .param p2, "newCol"    # I

    .prologue
    .line 358
    iget v8, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    .line 361
    .local v8, "start":I
    iget v9, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iget v10, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    if-lt v9, v10, :cond_46

    .line 363
    iget v9, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iget v10, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v9, v10

    iget v10, p0, Lfreemarker/core/SimpleCharStream;->inBuf:I

    add-int/2addr v9, v10

    add-int/lit8 v5, v9, 0x1

    .line 370
    .local v5, "len":I
    :goto_12
    const/4 v1, 0x0

    .local v1, "i":I
    const/4 v3, 0x0

    .local v3, "j":I
    const/4 v4, 0x0

    .line 371
    .local v4, "k":I
    const/4 v7, 0x0

    .local v7, "nextColDiff":I
    const/4 v0, 0x0

    .line 373
    .local v0, "columnDiff":I
    :goto_17
    if-ge v1, v5, :cond_55

    iget-object v9, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    iget v10, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    rem-int v3, v8, v10

    aget v9, v9, v3

    iget-object v10, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    add-int/lit8 v8, v8, 0x1

    iget v11, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    rem-int v4, v8, v11

    aget v10, v10, v4

    if-ne v9, v10, :cond_55

    .line 376
    iget-object v9, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    aput p1, v9, v3

    .line 377
    iget-object v9, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    aget v9, v9, v4

    add-int/2addr v9, v0

    iget-object v10, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    aget v10, v10, v3

    sub-int v7, v9, v10

    .line 378
    iget-object v9, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    add-int v10, p2, v0

    aput v10, v9, v3

    .line 379
    move v0, v7

    .line 380
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .line 367
    .end local v0    # "columnDiff":I
    .end local v1    # "i":I
    .end local v3    # "j":I
    .end local v4    # "k":I
    .end local v5    # "len":I
    .end local v7    # "nextColDiff":I
    :cond_46
    iget v9, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    iget v10, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    sub-int/2addr v9, v10

    iget v10, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    add-int/2addr v9, v10

    add-int/lit8 v9, v9, 0x1

    iget v10, p0, Lfreemarker/core/SimpleCharStream;->inBuf:I

    add-int v5, v9, v10

    .restart local v5    # "len":I
    goto :goto_12

    .line 383
    .restart local v0    # "columnDiff":I
    .restart local v1    # "i":I
    .restart local v3    # "j":I
    .restart local v4    # "k":I
    .restart local v7    # "nextColDiff":I
    :cond_55
    if-ge v1, v5, :cond_8c

    .line 385
    iget-object v9, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    add-int/lit8 v6, p1, 0x1

    .end local p1    # "newLine":I
    .local v6, "newLine":I
    aput p1, v9, v3

    .line 386
    iget-object v9, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    add-int v10, p2, v0

    aput v10, v9, v3

    move v2, v1

    .line 388
    .end local v1    # "i":I
    .local v2, "i":I
    :goto_64
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    if-ge v2, v5, :cond_8b

    .line 390
    iget-object v9, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    iget v10, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    rem-int v3, v8, v10

    aget v9, v9, v3

    iget-object v10, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    add-int/lit8 v8, v8, 0x1

    iget v11, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    rem-int v11, v8, v11

    aget v10, v10, v11

    if-eq v9, v10, :cond_85

    .line 391
    iget-object v9, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    add-int/lit8 p1, v6, 0x1

    .end local v6    # "newLine":I
    .restart local p1    # "newLine":I
    aput v6, v9, v3

    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    move v6, p1

    .end local p1    # "newLine":I
    .restart local v6    # "newLine":I
    goto :goto_64

    .line 393
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :cond_85
    iget-object v9, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    aput v6, v9, v3

    move v2, v1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    goto :goto_64

    .end local v2    # "i":I
    .restart local v1    # "i":I
    :cond_8b
    move p1, v6

    .line 397
    .end local v6    # "newLine":I
    .restart local p1    # "newLine":I
    :cond_8c
    iget-object v9, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    aget v9, v9, v3

    iput v9, p0, Lfreemarker/core/SimpleCharStream;->line:I

    .line 398
    iget-object v9, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    aget v9, v9, v3

    iput v9, p0, Lfreemarker/core/SimpleCharStream;->column:I

    .line 399
    return-void
.end method

.method public backup(I)V
    .registers 4
    .param p1, "amount"    # I

    .prologue
    .line 232
    iget v0, p0, Lfreemarker/core/SimpleCharStream;->inBuf:I

    add-int/2addr v0, p1

    iput v0, p0, Lfreemarker/core/SimpleCharStream;->inBuf:I

    .line 233
    iget v0, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    sub-int/2addr v0, p1

    iput v0, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    if-gez v0, :cond_13

    .line 234
    iget v0, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iget v1, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    add-int/2addr v0, v1

    iput v0, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    .line 235
    :cond_13
    return-void
.end method

.method public getBeginColumn()I
    .registers 3

    .prologue
    .line 223
    iget-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    iget v1, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    aget v0, v0, v1

    return v0
.end method

.method public getBeginLine()I
    .registers 3

    .prologue
    .line 227
    iget-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    iget v1, p0, Lfreemarker/core/SimpleCharStream;->tokenBegin:I

    aget v0, v0, v1

    return v0
.end method

.method public getColumn()I
    .registers 3

    .prologue
    .line 202
    iget-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    iget v1, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    aget v0, v0, v1

    return v0
.end method

.method public getEndColumn()I
    .registers 3

    .prologue
    .line 215
    iget-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufcolumn:[I

    iget v1, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    aget v0, v0, v1

    return v0
.end method

.method public getEndLine()I
    .registers 3

    .prologue
    .line 219
    iget-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    iget v1, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    aget v0, v0, v1

    return v0
.end method

.method public getLine()I
    .registers 3

    .prologue
    .line 211
    iget-object v0, p0, Lfreemarker/core/SimpleCharStream;->bufline:[I

    iget v1, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    aget v0, v0, v1

    return v0
.end method

.method public readChar()C
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 177
    iget v1, p0, Lfreemarker/core/SimpleCharStream;->inBuf:I

    if-lez v1, :cond_1e

    .line 179
    iget v1, p0, Lfreemarker/core/SimpleCharStream;->inBuf:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lfreemarker/core/SimpleCharStream;->inBuf:I

    .line 181
    iget v1, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iget v2, p0, Lfreemarker/core/SimpleCharStream;->bufsize:I

    if-ne v1, v2, :cond_17

    .line 182
    const/4 v1, 0x0

    iput v1, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    .line 184
    :cond_17
    iget-object v1, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    iget v2, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    aget-char v0, v1, v2

    .line 193
    :goto_1d
    return v0

    .line 187
    :cond_1e
    iget v1, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    iget v2, p0, Lfreemarker/core/SimpleCharStream;->maxNextCharInd:I

    if-lt v1, v2, :cond_2b

    .line 188
    invoke-virtual {p0}, Lfreemarker/core/SimpleCharStream;->FillBuff()V

    .line 190
    :cond_2b
    iget-object v1, p0, Lfreemarker/core/SimpleCharStream;->buffer:[C

    iget v2, p0, Lfreemarker/core/SimpleCharStream;->bufpos:I

    aget-char v0, v1, v2

    .line 192
    .local v0, "c":C
    invoke-virtual {p0, v0}, Lfreemarker/core/SimpleCharStream;->UpdateLineColumn(C)V

    goto :goto_1d
.end method
