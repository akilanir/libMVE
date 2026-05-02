.class public Lorg/apache/http/message/TokenParser;
.super Ljava/lang/Object;
.source "TokenParser.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final CR:C = '\r'

.field public static final DQUOTE:C = '\"'

.field public static final ESCAPE:C = '\\'

.field public static final HT:C = '\t'

.field public static final INSTANCE:Lorg/apache/http/message/TokenParser;

.field public static final LF:C = '\n'

.field public static final SP:C = ' '


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 76
    new-instance v0, Lorg/apache/http/message/TokenParser;

    invoke-direct {v0}, Lorg/apache/http/message/TokenParser;-><init>()V

    sput-object v0, Lorg/apache/http/message/TokenParser;->INSTANCE:Lorg/apache/http/message/TokenParser;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs INIT_BITSET([I)Ljava/util/BitSet;
    .registers 6
    .param p0, "b"    # [I

    .prologue
    .line 47
    new-instance v2, Ljava/util/BitSet;

    invoke-direct {v2}, Ljava/util/BitSet;-><init>()V

    .line 48
    .local v2, "bitset":Ljava/util/BitSet;
    move-object v1, p0

    .local v1, "arr$":[I
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_8
    if-ge v3, v4, :cond_12

    aget v0, v1, v3

    .line 49
    .local v0, "aB":I
    invoke-virtual {v2, v0}, Ljava/util/BitSet;->set(I)V

    .line 48
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 51
    .end local v0    # "aB":I
    :cond_12
    return-object v2
.end method

.method public static isWhitespace(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 73
    const/16 v0, 0x20

    if-eq p0, v0, :cond_10

    const/16 v0, 0x9

    if-eq p0, v0, :cond_10

    const/16 v0, 0xd

    if-eq p0, v0, :cond_10

    const/16 v0, 0xa

    if-ne p0, v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method


# virtual methods
.method public copyContent(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;Ljava/util/BitSet;Ljava/lang/StringBuilder;)V
    .registers 11
    .param p1, "buf"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "cursor"    # Lorg/apache/http/message/ParserCursor;
    .param p3, "delimiters"    # Ljava/util/BitSet;
    .param p4, "dst"    # Ljava/lang/StringBuilder;

    .prologue
    .line 179
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getPos()I

    move-result v4

    .line 180
    .local v4, "pos":I
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getPos()I

    move-result v2

    .line 181
    .local v2, "indexFrom":I
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getUpperBound()I

    move-result v3

    .line 182
    .local v3, "indexTo":I
    move v1, v2

    .local v1, "i":I
    :goto_d
    if-ge v1, v3, :cond_21

    .line 183
    invoke-virtual {p1, v1}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v0

    .line 184
    .local v0, "current":C
    if-eqz p3, :cond_1b

    invoke-virtual {p3, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-nez v5, :cond_21

    :cond_1b
    invoke-static {v0}, Lorg/apache/http/message/TokenParser;->isWhitespace(C)Z

    move-result v5

    if-eqz v5, :cond_25

    .line 191
    .end local v0    # "current":C
    :cond_21
    invoke-virtual {p2, v4}, Lorg/apache/http/message/ParserCursor;->updatePos(I)V

    .line 192
    return-void

    .line 187
    .restart local v0    # "current":C
    :cond_25
    add-int/lit8 v4, v4, 0x1

    .line 188
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 182
    add-int/lit8 v1, v1, 0x1

    goto :goto_d
.end method

.method public copyQuotedContent(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;Ljava/lang/StringBuilder;)V
    .registers 13
    .param p1, "buf"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "cursor"    # Lorg/apache/http/message/ParserCursor;
    .param p3, "dst"    # Ljava/lang/StringBuilder;

    .prologue
    const/16 v8, 0x5c

    const/16 v7, 0x22

    .line 231
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->atEnd()Z

    move-result v6

    if-eqz v6, :cond_b

    .line 265
    :cond_a
    :goto_a
    return-void

    .line 234
    :cond_b
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getPos()I

    move-result v5

    .line 235
    .local v5, "pos":I
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getPos()I

    move-result v3

    .line 236
    .local v3, "indexFrom":I
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getUpperBound()I

    move-result v4

    .line 237
    .local v4, "indexTo":I
    invoke-virtual {p1, v5}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v0

    .line 238
    .local v0, "current":C
    if-ne v0, v7, :cond_a

    .line 241
    add-int/lit8 v5, v5, 0x1

    .line 242
    add-int/lit8 v3, v3, 0x1

    .line 243
    const/4 v1, 0x0

    .line 244
    .local v1, "escaped":Z
    move v2, v3

    .local v2, "i":I
    :goto_23
    if-ge v2, v4, :cond_3f

    .line 245
    invoke-virtual {p1, v2}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v0

    .line 246
    if-eqz v1, :cond_3b

    .line 247
    if-eq v0, v7, :cond_32

    if-eq v0, v8, :cond_32

    .line 248
    invoke-virtual {p3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 250
    :cond_32
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 251
    const/4 v1, 0x0

    .line 244
    :cond_36
    :goto_36
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v5, v5, 0x1

    goto :goto_23

    .line 253
    :cond_3b
    if-ne v0, v7, :cond_43

    .line 254
    add-int/lit8 v5, v5, 0x1

    .line 264
    :cond_3f
    invoke-virtual {p2, v5}, Lorg/apache/http/message/ParserCursor;->updatePos(I)V

    goto :goto_a

    .line 257
    :cond_43
    if-ne v0, v8, :cond_47

    .line 258
    const/4 v1, 0x1

    goto :goto_36

    .line 259
    :cond_47
    const/16 v6, 0xd

    if-eq v0, v6, :cond_36

    const/16 v6, 0xa

    if-eq v0, v6, :cond_36

    .line 260
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_36
.end method

.method public copyUnquotedContent(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;Ljava/util/BitSet;Ljava/lang/StringBuilder;)V
    .registers 11
    .param p1, "buf"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "cursor"    # Lorg/apache/http/message/ParserCursor;
    .param p3, "delimiters"    # Ljava/util/BitSet;
    .param p4, "dst"    # Ljava/lang/StringBuilder;

    .prologue
    .line 206
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getPos()I

    move-result v4

    .line 207
    .local v4, "pos":I
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getPos()I

    move-result v2

    .line 208
    .local v2, "indexFrom":I
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getUpperBound()I

    move-result v3

    .line 209
    .local v3, "indexTo":I
    move v1, v2

    .local v1, "i":I
    :goto_d
    if-ge v1, v3, :cond_25

    .line 210
    invoke-virtual {p1, v1}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v0

    .line 211
    .local v0, "current":C
    if-eqz p3, :cond_1b

    invoke-virtual {p3, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-nez v5, :cond_25

    :cond_1b
    invoke-static {v0}, Lorg/apache/http/message/TokenParser;->isWhitespace(C)Z

    move-result v5

    if-nez v5, :cond_25

    const/16 v5, 0x22

    if-ne v0, v5, :cond_29

    .line 219
    .end local v0    # "current":C
    :cond_25
    invoke-virtual {p2, v4}, Lorg/apache/http/message/ParserCursor;->updatePos(I)V

    .line 220
    return-void

    .line 215
    .restart local v0    # "current":C
    :cond_29
    add-int/lit8 v4, v4, 0x1

    .line 216
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 209
    add-int/lit8 v1, v1, 0x1

    goto :goto_d
.end method

.method public parseToken(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;Ljava/util/BitSet;)Ljava/lang/String;
    .registers 8
    .param p1, "buf"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "cursor"    # Lorg/apache/http/message/ParserCursor;
    .param p3, "delimiters"    # Ljava/util/BitSet;

    .prologue
    .line 88
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .local v1, "dst":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 90
    .local v2, "whitespace":Z
    :goto_6
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->atEnd()Z

    move-result v3

    if-nez v3, :cond_1c

    .line 91
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getPos()I

    move-result v3

    invoke-virtual {p1, v3}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v0

    .line 92
    .local v0, "current":C
    if-eqz p3, :cond_21

    invoke-virtual {p3, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 105
    .end local v0    # "current":C
    :cond_1c
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 94
    .restart local v0    # "current":C
    :cond_21
    invoke-static {v0}, Lorg/apache/http/message/TokenParser;->isWhitespace(C)Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 95
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/message/TokenParser;->skipWhiteSpace(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)V

    .line 96
    const/4 v2, 0x1

    goto :goto_6

    .line 98
    :cond_2c
    if-eqz v2, :cond_39

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_39

    .line 99
    const/16 v3, 0x20

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 101
    :cond_39
    invoke-virtual {p0, p1, p2, p3, v1}, Lorg/apache/http/message/TokenParser;->copyContent(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;Ljava/util/BitSet;Ljava/lang/StringBuilder;)V

    .line 102
    const/4 v2, 0x0

    goto :goto_6
.end method

.method public parseValue(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;Ljava/util/BitSet;)Ljava/lang/String;
    .registers 9
    .param p1, "buf"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "cursor"    # Lorg/apache/http/message/ParserCursor;
    .param p3, "delimiters"    # Ljava/util/BitSet;

    .prologue
    const/16 v4, 0x20

    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .local v1, "dst":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 121
    .local v2, "whitespace":Z
    :goto_8
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->atEnd()Z

    move-result v3

    if-nez v3, :cond_1e

    .line 122
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getPos()I

    move-result v3

    invoke-virtual {p1, v3}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v0

    .line 123
    .local v0, "current":C
    if-eqz p3, :cond_23

    invoke-virtual {p3, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 142
    .end local v0    # "current":C
    :cond_1e
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 125
    .restart local v0    # "current":C
    :cond_23
    invoke-static {v0}, Lorg/apache/http/message/TokenParser;->isWhitespace(C)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 126
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/message/TokenParser;->skipWhiteSpace(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)V

    .line 127
    const/4 v2, 0x1

    goto :goto_8

    .line 128
    :cond_2e
    const/16 v3, 0x22

    if-ne v0, v3, :cond_42

    .line 129
    if-eqz v2, :cond_3d

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_3d

    .line 130
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 132
    :cond_3d
    invoke-virtual {p0, p1, p2, v1}, Lorg/apache/http/message/TokenParser;->copyQuotedContent(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;Ljava/lang/StringBuilder;)V

    .line 133
    const/4 v2, 0x0

    goto :goto_8

    .line 135
    :cond_42
    if-eqz v2, :cond_4d

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_4d

    .line 136
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 138
    :cond_4d
    invoke-virtual {p0, p1, p2, p3, v1}, Lorg/apache/http/message/TokenParser;->copyUnquotedContent(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;Ljava/util/BitSet;Ljava/lang/StringBuilder;)V

    .line 139
    const/4 v2, 0x0

    goto :goto_8
.end method

.method public skipWhiteSpace(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)V
    .registers 9
    .param p1, "buf"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "cursor"    # Lorg/apache/http/message/ParserCursor;

    .prologue
    .line 153
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getPos()I

    move-result v4

    .line 154
    .local v4, "pos":I
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getPos()I

    move-result v2

    .line 155
    .local v2, "indexFrom":I
    invoke-virtual {p2}, Lorg/apache/http/message/ParserCursor;->getUpperBound()I

    move-result v3

    .line 156
    .local v3, "indexTo":I
    move v1, v2

    .local v1, "i":I
    :goto_d
    if-ge v1, v3, :cond_19

    .line 157
    invoke-virtual {p1, v1}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v0

    .line 158
    .local v0, "current":C
    invoke-static {v0}, Lorg/apache/http/message/TokenParser;->isWhitespace(C)Z

    move-result v5

    if-nez v5, :cond_1d

    .line 164
    .end local v0    # "current":C
    :cond_19
    invoke-virtual {p2, v4}, Lorg/apache/http/message/ParserCursor;->updatePos(I)V

    .line 165
    return-void

    .line 161
    .restart local v0    # "current":C
    :cond_1d
    add-int/lit8 v4, v4, 0x1

    .line 156
    add-int/lit8 v1, v1, 0x1

    goto :goto_d
.end method
