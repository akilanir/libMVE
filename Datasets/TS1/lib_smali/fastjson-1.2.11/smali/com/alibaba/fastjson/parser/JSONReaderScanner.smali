.class public final Lcom/alibaba/fastjson/parser/JSONReaderScanner;
.super Lcom/alibaba/fastjson/parser/JSONLexerBase;
.source "JSONReaderScanner.java"


# static fields
.field private static final BUF_LOCAL:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<[C>;"
        }
    .end annotation
.end field


# instance fields
.field private buf:[C

.field private bufLength:I

.field private reader:Ljava/io/Reader;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 34
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->BUF_LOCAL:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .registers 3
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    .line 53
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-direct {p0, p1, v0}, Lcom/alibaba/fastjson/parser/JSONReaderScanner;-><init>(Ljava/io/Reader;I)V

    .line 54
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;I)V
    .registers 6
    .param p1, "reader"    # Ljava/io/Reader;
    .param p2, "features"    # I

    .prologue
    .line 57
    invoke-direct {p0, p2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;-><init>(I)V

    .line 58
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->reader:Ljava/io/Reader;

    .line 60
    sget-object v1, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->BUF_LOCAL:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [C

    iput-object v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    .line 61
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    if-eqz v1, :cond_19

    .line 62
    sget-object v1, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->BUF_LOCAL:Ljava/lang/ThreadLocal;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 65
    :cond_19
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    if-nez v1, :cond_23

    .line 66
    const/16 v1, 0x2000

    new-array v1, v1, [C

    iput-object v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    .line 70
    :cond_23
    :try_start_23
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    invoke-virtual {p1, v1}, Ljava/io/Reader;->read([C)I

    move-result v1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_2b} :catch_3c

    .line 75
    const/4 v1, -0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    .line 77
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->next()C

    .line 78
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->ch:C

    const v2, 0xfeff

    if-ne v1, v2, :cond_3b

    .line 79
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->next()C

    .line 81
    :cond_3b
    return-void

    .line 71
    :catch_3c
    move-exception v0

    .line 72
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 41
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-direct {p0, p1, v0}, Lcom/alibaba/fastjson/parser/JSONReaderScanner;-><init>(Ljava/lang/String;I)V

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "features"    # I

    .prologue
    .line 45
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lcom/alibaba/fastjson/parser/JSONReaderScanner;-><init>(Ljava/io/Reader;I)V

    .line 46
    return-void
.end method

.method public constructor <init>([CI)V
    .registers 4
    .param p1, "input"    # [C
    .param p2, "inputLength"    # I

    .prologue
    .line 49
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-direct {p0, p1, p2, v0}, Lcom/alibaba/fastjson/parser/JSONReaderScanner;-><init>([CII)V

    .line 50
    return-void
.end method

.method public constructor <init>([CII)V
    .registers 6
    .param p1, "input"    # [C
    .param p2, "inputLength"    # I
    .param p3, "features"    # I

    .prologue
    .line 84
    new-instance v0, Ljava/io/CharArrayReader;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, p2}, Ljava/io/CharArrayReader;-><init>([CII)V

    invoke-direct {p0, v0, p3}, Lcom/alibaba/fastjson/parser/JSONReaderScanner;-><init>(Ljava/io/Reader;I)V

    .line 85
    return-void
.end method


# virtual methods
.method public final addSymbol(IIILcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;
    .registers 6
    .param p1, "offset"    # I
    .param p2, "len"    # I
    .param p3, "hash"    # I
    .param p4, "symbolTable"    # Lcom/alibaba/fastjson/parser/SymbolTable;

    .prologue
    .line 153
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    invoke-virtual {p4, v0, p1, p2, p3}, Lcom/alibaba/fastjson/parser/SymbolTable;->addSymbol([CIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final arrayCopy(I[CII)V
    .registers 6
    .param p1, "srcPos"    # I
    .param p2, "dest"    # [C
    .param p3, "destPos"    # I
    .param p4, "length"    # I

    .prologue
    .line 223
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    invoke-static {v0, p1, p2, p3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 224
    return-void
.end method

.method public bytesValue()[B
    .registers 4

    .prologue
    .line 219
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->np:I

    add-int/lit8 v1, v1, 0x1

    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->sp:I

    invoke-static {v0, v1, v2}, Lcom/alibaba/fastjson/util/IOUtils;->decodeBase64([CII)[B

    move-result-object v0

    return-object v0
.end method

.method public final charArrayCompare([C)Z
    .registers 5
    .param p1, "chars"    # [C

    .prologue
    .line 209
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_14

    .line 210
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->charAt(I)C

    move-result v1

    aget-char v2, p1, v0

    if-eq v1, v2, :cond_11

    .line 211
    const/4 v1, 0x0

    .line 215
    :goto_10
    return v1

    .line 209
    :cond_11
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 215
    :cond_14
    const/4 v1, 0x1

    goto :goto_10
.end method

.method public final charAt(I)C
    .registers 12
    .param p1, "index"    # I

    .prologue
    const/16 v4, 0x1a

    const/4 v9, -0x1

    const/4 v8, 0x0

    .line 88
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    if-lt p1, v5, :cond_3f

    .line 89
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    if-ne v5, v9, :cond_15

    .line 90
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->sp:I

    if-ge p1, v5, :cond_14

    .line 91
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    aget-char v4, v4, p1

    .line 135
    :cond_14
    :goto_14
    return v4

    .line 96
    :cond_15
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    if-nez v5, :cond_4f

    .line 97
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    array-length v4, v4

    mul-int/lit8 v4, v4, 0x3

    div-int/lit8 v4, v4, 0x2

    new-array v0, v4, [C

    .line 98
    .local v0, "buf":[C
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    invoke-static {v4, v5, v0, v8, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 100
    array-length v4, v0

    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    sub-int v3, v4, v5

    .line 102
    .local v3, "rest":I
    :try_start_30
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->reader:Ljava/io/Reader;

    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    invoke-virtual {v4, v0, v5, v3}, Ljava/io/Reader;->read([CII)I

    move-result v2

    .line 103
    .local v2, "len":I
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    add-int/2addr v4, v2

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    .line 104
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_30 .. :try_end_3f} :catch_44

    .line 135
    .end local v0    # "buf":[C
    .end local v2    # "len":I
    .end local v3    # "rest":I
    :cond_3f
    :goto_3f
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    aget-char v4, v4, p1

    goto :goto_14

    .line 105
    .restart local v0    # "buf":[C
    .restart local v3    # "rest":I
    :catch_44
    move-exception v1

    .line 106
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 109
    .end local v0    # "buf":[C
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "rest":I
    :cond_4f
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    sub-int v3, v5, v6

    .line 110
    .restart local v3    # "rest":I
    if-lez v3, :cond_60

    .line 111
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    iget-object v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    invoke-static {v5, v6, v7, v8, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 115
    :cond_60
    :try_start_60
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->reader:Ljava/io/Reader;

    iget-object v6, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    iget-object v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    array-length v7, v7

    sub-int/2addr v7, v3

    invoke-virtual {v5, v6, v3, v7}, Ljava/io/Reader;->read([CII)I

    move-result v5

    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I
    :try_end_6e
    .catch Ljava/io/IOException; {:try_start_60 .. :try_end_6e} :catch_7a

    .line 120
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    if-nez v5, :cond_85

    .line 121
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    const-string v5, "illegal state, textLength is zero"

    invoke-direct {v4, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 116
    :catch_7a
    move-exception v1

    .line 117
    .restart local v1    # "e":Ljava/io/IOException;
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 124
    .end local v1    # "e":Ljava/io/IOException;
    :cond_85
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    if-eq v5, v9, :cond_14

    .line 128
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    add-int/2addr v4, v3

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    .line 129
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    sub-int/2addr p1, v4

    .line 130
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->np:I

    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    sub-int/2addr v4, v5

    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->np:I

    .line 131
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    goto :goto_3f
.end method

.method public close()V
    .registers 3

    .prologue
    .line 283
    invoke-super {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->close()V

    .line 285
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    array-length v0, v0

    const v1, 0x8000

    if-gt v0, v1, :cond_12

    .line 286
    sget-object v0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->BUF_LOCAL:Ljava/lang/ThreadLocal;

    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 288
    :cond_12
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    .line 290
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->reader:Ljava/io/Reader;

    invoke-static {v0}, Lcom/alibaba/fastjson/util/IOUtils;->close(Ljava/io/Closeable;)V

    .line 291
    return-void
.end method

.method protected final copyTo(II[C)V
    .registers 6
    .param p1, "offset"    # I
    .param p2, "count"    # I
    .param p3, "dest"    # [C

    .prologue
    .line 205
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    const/4 v1, 0x0

    invoke-static {v0, p1, p3, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 206
    return-void
.end method

.method public final indexOf(CI)I
    .registers 7
    .param p1, "ch"    # C
    .param p2, "startIndex"    # I

    .prologue
    .line 139
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    sub-int v2, p2, v3

    .line 141
    .local v2, "offset":I
    :goto_4
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    add-int v1, v3, v2

    .line 142
    .local v1, "index":I
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->charAt(I)C

    move-result v0

    .line 143
    .local v0, "chLoal":C
    if-ne p1, v0, :cond_12

    .line 144
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    add-int/2addr v3, v2

    .line 147
    :goto_11
    return v3

    .line 146
    :cond_12
    const/16 v3, 0x1a

    if-ne v0, v3, :cond_18

    .line 147
    const/4 v3, -0x1

    goto :goto_11

    .line 140
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_4
.end method

.method public isEOF()Z
    .registers 3

    .prologue
    .line 295
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1b

    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    array-length v1, v1

    if-eq v0, v1, :cond_1b

    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->ch:C

    const/16 v1, 0x1a

    if-ne v0, v1, :cond_1d

    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    array-length v1, v1

    if-ne v0, v1, :cond_1d

    :cond_1b
    const/4 v0, 0x1

    :goto_1c
    return v0

    :cond_1d
    const/4 v0, 0x0

    goto :goto_1c
.end method

.method public final next()C
    .registers 13

    .prologue
    const/16 v6, 0x1a

    const/4 v10, 0x0

    const/4 v11, -0x1

    .line 157
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    add-int/lit8 v1, v7, 0x1

    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    .line 159
    .local v1, "index":I
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    if-lt v1, v7, :cond_86

    .line 160
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    if-ne v7, v11, :cond_13

    .line 201
    :goto_12
    return v6

    .line 164
    :cond_13
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->sp:I

    if-lez v7, :cond_2e

    .line 166
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->sp:I

    sub-int v3, v7, v8

    .line 167
    .local v3, "offset":I
    iget-char v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->ch:C

    const/16 v8, 0x22

    if-ne v7, v8, :cond_25

    .line 168
    add-int/lit8 v3, v3, -0x1

    .line 170
    :cond_25
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    iget-object v8, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    iget v9, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->sp:I

    invoke-static {v7, v3, v8, v10, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 172
    .end local v3    # "offset":I
    :cond_2e
    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->np:I

    .line 174
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->sp:I

    .end local v1    # "index":I
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    .line 177
    .restart local v1    # "index":I
    :try_start_34
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    .line 178
    .local v5, "startPos":I
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    array-length v7, v7

    sub-int v4, v7, v5

    .line 179
    .local v4, "readLength":I
    if-nez v4, :cond_55

    .line 180
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    array-length v7, v7

    mul-int/lit8 v7, v7, 0x2

    new-array v2, v7, [C

    .line 181
    .local v2, "newBuf":[C
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    const/4 v8, 0x0

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    array-length v10, v10

    invoke-static {v7, v8, v2, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 182
    iput-object v2, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    .line 183
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    array-length v7, v7

    sub-int v4, v7, v5

    .line 185
    .end local v2    # "newBuf":[C
    :cond_55
    iget-object v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->reader:Ljava/io/Reader;

    iget-object v8, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    iget v9, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    invoke-virtual {v7, v8, v9, v4}, Ljava/io/Reader;->read([CII)I

    move-result v7

    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I
    :try_end_61
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_61} :catch_6d

    .line 190
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    if-nez v7, :cond_78

    .line 191
    new-instance v6, Lcom/alibaba/fastjson/JSONException;

    const-string v7, "illegal stat, textLength is zero"

    invoke-direct {v6, v7}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 186
    .end local v4    # "readLength":I
    .end local v5    # "startPos":I
    :catch_6d
    move-exception v0

    .line 187
    .local v0, "e":Ljava/io/IOException;
    new-instance v6, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 194
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v4    # "readLength":I
    .restart local v5    # "startPos":I
    :cond_78
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    if-ne v7, v11, :cond_7f

    .line 195
    iput-char v6, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->ch:C

    goto :goto_12

    .line 198
    :cond_7f
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bp:I

    add-int/2addr v6, v7

    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->bufLength:I

    .line 201
    .end local v4    # "readLength":I
    .end local v5    # "startPos":I
    :cond_86
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    aget-char v6, v6, v1

    iput-char v6, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->ch:C

    goto :goto_12
.end method

.method public final numberString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 267
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->np:I

    .line 268
    .local v1, "offset":I
    const/4 v4, -0x1

    if-ne v1, v4, :cond_6

    .line 269
    const/4 v1, 0x0

    .line 271
    :cond_6
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->sp:I

    add-int/2addr v4, v1

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->charAt(I)C

    move-result v0

    .line 273
    .local v0, "chLocal":C
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->sp:I

    .line 274
    .local v2, "sp":I
    const/16 v4, 0x4c

    if-eq v0, v4, :cond_25

    const/16 v4, 0x53

    if-eq v0, v4, :cond_25

    const/16 v4, 0x42

    if-eq v0, v4, :cond_25

    const/16 v4, 0x46

    if-eq v0, v4, :cond_25

    const/16 v4, 0x44

    if-ne v0, v4, :cond_27

    .line 275
    :cond_25
    add-int/lit8 v2, v2, -0x1

    .line 278
    :cond_27
    new-instance v3, Ljava/lang/String;

    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    invoke-direct {v3, v4, v1, v2}, Ljava/lang/String;-><init>([CII)V

    .line 279
    .local v3, "value":Ljava/lang/String;
    return-object v3
.end method

.method public final stringVal()Ljava/lang/String;
    .registers 6

    .prologue
    .line 230
    iget-boolean v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->hasSpecial:Z

    if-nez v1, :cond_28

    .line 231
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->np:I

    add-int/lit8 v0, v1, 0x1

    .line 232
    .local v0, "offset":I
    if-gez v0, :cond_10

    .line 233
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 235
    :cond_10
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    array-length v1, v1

    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->sp:I

    sub-int/2addr v1, v2

    if-le v0, v1, :cond_1e

    .line 236
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 238
    :cond_1e
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->sp:I

    invoke-direct {v1, v2, v0, v3}, Ljava/lang/String;-><init>([CII)V

    .line 241
    .end local v0    # "offset":I
    :goto_27
    return-object v1

    :cond_28
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->sbuf:[C

    const/4 v3, 0x0

    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->sp:I

    invoke-direct {v1, v2, v3, v4}, Ljava/lang/String;-><init>([CII)V

    goto :goto_27
.end method

.method public final subString(II)Ljava/lang/String;
    .registers 5
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 246
    if-gez p2, :cond_8

    .line 247
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 249
    :cond_8
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    invoke-direct {v0, v1, p1, p2}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public final sub_chars(II)[C
    .registers 6
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 254
    if-gez p2, :cond_8

    .line 255
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v1, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v1

    .line 258
    :cond_8
    if-nez p1, :cond_d

    .line 259
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    .line 263
    :goto_c
    return-object v0

    .line 261
    :cond_d
    new-array v0, p2, [C

    .line 262
    .local v0, "chars":[C
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONReaderScanner;->buf:[C

    const/4 v2, 0x0

    invoke-static {v1, p1, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_c
.end method
