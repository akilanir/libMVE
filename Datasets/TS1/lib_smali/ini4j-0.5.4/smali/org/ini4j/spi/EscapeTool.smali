.class public Lorg/ini4j/spi/EscapeTool;
.super Ljava/lang/Object;
.source "EscapeTool.java"


# static fields
.field private static final ASCII_MAX:C = '~'

.field private static final ASCII_MIN:C = ' '

.field static final DOUBLE_QUOTE:C = '\"'

.field private static final ESCAPEABLE_CHARS:Ljava/lang/String; = "\\\t\n\u000c\u0008\r:="

.field private static final ESCAPE_CHAR:C = '\\'

.field private static final ESCAPE_LETTERS:Ljava/lang/String; = "\\tnfbr:="

.field static final HEX:[C

.field static final HEX_DIGIT_1_OFFSET:I = 0xc

.field static final HEX_DIGIT_2_OFFSET:I = 0x8

.field static final HEX_DIGIT_3_OFFSET:I = 0x4

.field static final HEX_DIGIT_MASK:I = 0xf

.field static final HEX_RADIX:I = 0x10

.field private static final INSTANCE:Lorg/ini4j/spi/EscapeTool;

.field private static final UNICODE_HEX_DIGITS:I = 0x4


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 23
    const-string v0, "0123456789abcdef"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/ini4j/spi/EscapeTool;->HEX:[C

    .line 24
    const-class v0, Lorg/ini4j/spi/EscapeTool;

    invoke-static {v0}, Lorg/ini4j/spi/ServiceFinder;->findService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/EscapeTool;

    sput-object v0, Lorg/ini4j/spi/EscapeTool;->INSTANCE:Lorg/ini4j/spi/EscapeTool;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lorg/ini4j/spi/EscapeTool;
    .registers 1

    .prologue
    .line 37
    sget-object v0, Lorg/ini4j/spi/EscapeTool;->INSTANCE:Lorg/ini4j/spi/EscapeTool;

    return-object v0
.end method


# virtual methods
.method public escape(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 43
    .local v4, "len":I
    new-instance v0, Ljava/lang/StringBuilder;

    mul-int/lit8 v5, v4, 0x2

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 45
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c
    if-ge v2, v4, :cond_3b

    .line 47
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 48
    .local v1, "c":C
    const-string v5, "\\\t\n\u000c\u0008\r:="

    invoke-virtual {v5, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 50
    .local v3, "idx":I
    if-ltz v3, :cond_2b

    .line 52
    const/16 v5, 0x5c

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 53
    const-string v5, "\\tnfbr:="

    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 45
    :goto_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 57
    :cond_2b
    const/16 v5, 0x20

    if-lt v1, v5, :cond_33

    const/16 v5, 0x7e

    if-le v1, v5, :cond_37

    .line 59
    :cond_33
    invoke-virtual {p0, v0, v1}, Lorg/ini4j/spi/EscapeTool;->escapeBinary(Ljava/lang/StringBuilder;C)V

    goto :goto_28

    .line 63
    :cond_37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 68
    .end local v1    # "c":C
    .end local v3    # "idx":I
    :cond_3b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method escapeBinary(Ljava/lang/StringBuilder;C)V
    .registers 5
    .param p1, "buff"    # Ljava/lang/StringBuilder;
    .param p2, "c"    # C

    .prologue
    .line 168
    const-string v0, "\\u"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    sget-object v0, Lorg/ini4j/spi/EscapeTool;->HEX:[C

    ushr-int/lit8 v1, p2, 0xc

    and-int/lit8 v1, v1, 0xf

    aget-char v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 170
    sget-object v0, Lorg/ini4j/spi/EscapeTool;->HEX:[C

    ushr-int/lit8 v1, p2, 0x8

    and-int/lit8 v1, v1, 0xf

    aget-char v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 171
    sget-object v0, Lorg/ini4j/spi/EscapeTool;->HEX:[C

    ushr-int/lit8 v1, p2, 0x4

    and-int/lit8 v1, v1, 0xf

    aget-char v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 172
    sget-object v0, Lorg/ini4j/spi/EscapeTool;->HEX:[C

    and-int/lit8 v1, p2, 0xf

    aget-char v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 173
    return-void
.end method

.method public quote(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x5c

    const/16 v5, 0x22

    .line 73
    move-object v3, p1

    .line 75
    .local v3, "ret":Ljava/lang/String;
    if-eqz p1, :cond_34

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_34

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .local v0, "buff":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 80
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_16
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_2d

    .line 82
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 84
    .local v1, "c":C
    if-eq v1, v6, :cond_24

    if-ne v1, v5, :cond_27

    .line 86
    :cond_24
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    :cond_27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 80
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 92
    .end local v1    # "c":C
    :cond_2d
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 96
    .end local v0    # "buff":Ljava/lang/StringBuilder;
    .end local v2    # "i":I
    :cond_34
    return-object v3
.end method

.method public unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 101
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 102
    .local v5, "n":I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 103
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    move v3, v2

    .line 105
    .end local v2    # "i":I
    .local v3, "i":I
    :goto_b
    if-ge v3, v5, :cond_3d

    .line 107
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 109
    .local v1, "c":C
    const/16 v7, 0x5c

    if-ne v1, v7, :cond_39

    .line 111
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 112
    invoke-virtual {p0, v0, v1, p1, v3}, Lorg/ini4j/spi/EscapeTool;->unescapeBinary(Ljava/lang/StringBuilder;CLjava/lang/String;I)I

    move-result v6

    .line 114
    .local v6, "next":I
    if-ne v6, v3, :cond_37

    .line 116
    const-string v7, "\\tnfbr:="

    invoke-virtual {v7, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 118
    .local v4, "idx":I
    if-ltz v4, :cond_31

    .line 120
    const-string v7, "\\\t\n\u000c\u0008\r:="

    invoke-virtual {v7, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 123
    :cond_31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v2, v3

    .end local v3    # "i":I
    .end local v4    # "idx":I
    .end local v6    # "next":I
    .restart local v2    # "i":I
    :goto_35
    move v3, v2

    .line 134
    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_b

    .line 127
    .restart local v6    # "next":I
    :cond_37
    move v2, v6

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_35

    .line 132
    .end local v6    # "next":I
    :cond_39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_35

    .line 136
    .end local v1    # "c":C
    .end local v2    # "i":I
    .restart local v3    # "i":I
    :cond_3d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method unescapeBinary(Ljava/lang/StringBuilder;CLjava/lang/String;I)I
    .registers 9
    .param p1, "buff"    # Ljava/lang/StringBuilder;
    .param p2, "escapeType"    # C
    .param p3, "line"    # Ljava/lang/String;
    .param p4, "index"    # I

    .prologue
    .line 177
    move v0, p4

    .line 179
    .local v0, "ret":I
    const/16 v2, 0x75

    if-ne p2, v2, :cond_17

    .line 183
    add-int/lit8 v2, p4, 0x4

    :try_start_7
    invoke-virtual {p3, p4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x10

    invoke-static {v2, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    int-to-char v2, v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_15} :catch_18

    .line 184
    add-int/lit8 v0, p4, 0x4

    .line 192
    :cond_17
    return v0

    .line 186
    :catch_18
    move-exception v1

    .line 188
    .local v1, "x":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Malformed \\uxxxx encoding."

    invoke-direct {v2, v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public unquote(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    .local v0, "buff":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 144
    .local v2, "escape":Z
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_22

    .line 146
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 148
    .local v1, "c":C
    const/16 v4, 0x5c

    if-ne v1, v4, :cond_1e

    .line 150
    if-nez v2, :cond_1d

    .line 152
    const/4 v2, 0x1

    .line 144
    :goto_1a
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 157
    :cond_1d
    const/4 v2, 0x0

    .line 160
    :cond_1e
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1a

    .line 163
    .end local v1    # "c":C
    :cond_22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
