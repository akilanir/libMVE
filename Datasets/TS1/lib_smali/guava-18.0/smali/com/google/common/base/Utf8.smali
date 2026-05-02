.class public final Lcom/google/common/base/Utf8;
.super Ljava/lang/Object;
.source "Utf8.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static encodedLength(Ljava/lang/CharSequence;)I
    .registers 10
    .param p0, "sequence"    # Ljava/lang/CharSequence;

    .prologue
    .line 50
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 51
    .local v2, "utf16Length":I
    move v3, v2

    .line 52
    .local v3, "utf8Length":I
    const/4 v1, 0x0

    .line 55
    .local v1, "i":I
    :goto_6
    if-ge v1, v2, :cond_13

    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/16 v5, 0x80

    if-ge v4, v5, :cond_13

    .line 56
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 60
    :cond_13
    :goto_13
    if-ge v1, v2, :cond_2a

    .line 61
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 62
    .local v0, "c":C
    const/16 v4, 0x800

    if-ge v0, v4, :cond_25

    .line 63
    rsub-int/lit8 v4, v0, 0x7f

    ushr-int/lit8 v4, v4, 0x1f

    add-int/2addr v3, v4

    .line 60
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 65
    :cond_25
    invoke-static {p0, v1}, Lcom/google/common/base/Utf8;->encodedLengthGeneral(Ljava/lang/CharSequence;I)I

    move-result v4

    add-int/2addr v3, v4

    .line 70
    .end local v0    # "c":C
    :cond_2a
    if-ge v3, v2, :cond_4e

    .line 72
    new-instance v4, Ljava/lang/IllegalArgumentException;

    int-to-long v5, v3

    const-wide v7, 0x100000000L

    add-long/2addr v5, v7

    new-instance v7, Ljava/lang/StringBuilder;

    const/16 v8, 0x36

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v8, "UTF-8 length does not fit in int: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 75
    :cond_4e
    return v3
.end method

.method private static encodedLengthGeneral(Ljava/lang/CharSequence;I)I
    .registers 10
    .param p0, "sequence"    # Ljava/lang/CharSequence;
    .param p1, "start"    # I

    .prologue
    .line 79
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v3

    .line 80
    .local v3, "utf16Length":I
    const/4 v4, 0x0

    .line 81
    .local v4, "utf8Length":I
    move v2, p1

    .local v2, "i":I
    :goto_6
    if-ge v2, v3, :cond_4a

    .line 82
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 83
    .local v0, "c":C
    const/16 v5, 0x800

    if-ge v0, v5, :cond_18

    .line 84
    rsub-int/lit8 v5, v0, 0x7f

    ushr-int/lit8 v5, v5, 0x1f

    add-int/2addr v4, v5

    .line 81
    :cond_15
    :goto_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 86
    :cond_18
    add-int/lit8 v4, v4, 0x2

    .line 88
    const v5, 0xd800

    if-gt v5, v0, :cond_15

    const v5, 0xdfff

    if-gt v0, v5, :cond_15

    .line 90
    invoke-static {p0, v2}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v1

    .line 91
    .local v1, "cp":I
    const/high16 v5, 0x10000

    if-ge v1, v5, :cond_47

    .line 92
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    const/16 v7, 0x27

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v7, "Unpaired surrogate at index "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 94
    :cond_47
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 98
    .end local v0    # "c":C
    .end local v1    # "cp":I
    :cond_4a
    return v4
.end method

.method public static isWellFormed([B)Z
    .registers 3
    .param p0, "bytes"    # [B

    .prologue
    .line 112
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/google/common/base/Utf8;->isWellFormed([BII)Z

    move-result v0

    return v0
.end method

.method public static isWellFormed([BII)Z
    .registers 6
    .param p0, "bytes"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 125
    add-int v0, p1, p2

    .line 126
    .local v0, "end":I
    array-length v2, p0

    invoke-static {p1, v0, v2}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 128
    move v1, p1

    .local v1, "i":I
    :goto_7
    if-ge v1, v0, :cond_15

    .line 129
    aget-byte v2, p0, v1

    if-gez v2, :cond_12

    .line 130
    invoke-static {p0, v1, v0}, Lcom/google/common/base/Utf8;->isWellFormedSlowPath([BII)Z

    move-result v2

    .line 133
    :goto_11
    return v2

    .line 128
    :cond_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 133
    :cond_15
    const/4 v2, 0x1

    goto :goto_11
.end method

.method private static isWellFormedSlowPath([BII)Z
    .registers 13
    .param p0, "bytes"    # [B
    .param p1, "off"    # I
    .param p2, "end"    # I

    .prologue
    const/16 v9, -0x20

    const/16 v8, -0x60

    const/4 v4, 0x0

    const/16 v7, -0x41

    .line 137
    move v2, p1

    .local v2, "index":I
    move v3, v2

    .line 143
    .end local v2    # "index":I
    .local v3, "index":I
    :goto_9
    if-lt v3, p2, :cond_e

    .line 144
    const/4 v4, 0x1

    move v2, v3

    .line 189
    .end local v3    # "index":I
    .restart local v2    # "index":I
    :cond_d
    :goto_d
    return v4

    .line 146
    .end local v2    # "index":I
    .restart local v3    # "index":I
    :cond_e
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "index":I
    .restart local v2    # "index":I
    aget-byte v0, p0, v3

    .local v0, "byte1":I
    if-gez v0, :cond_65

    .line 148
    if-ge v0, v9, :cond_24

    .line 150
    if-eq v2, p2, :cond_d

    .line 155
    const/16 v5, -0x3e

    if-lt v0, v5, :cond_d

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "index":I
    .restart local v3    # "index":I
    aget-byte v5, p0, v2

    if-le v5, v7, :cond_63

    :cond_22
    move v2, v3

    .end local v3    # "index":I
    .restart local v2    # "index":I
    goto :goto_d

    .line 158
    :cond_24
    const/16 v5, -0x10

    if-ge v0, v5, :cond_44

    .line 160
    add-int/lit8 v5, v2, 0x1

    if-ge v5, p2, :cond_d

    .line 163
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "index":I
    .restart local v3    # "index":I
    aget-byte v1, p0, v2

    .line 164
    .local v1, "byte2":I
    if-gt v1, v7, :cond_22

    if-ne v0, v9, :cond_36

    if-lt v1, v8, :cond_22

    :cond_36
    const/16 v5, -0x13

    if-ne v0, v5, :cond_3c

    if-le v8, v1, :cond_22

    :cond_3c
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "index":I
    .restart local v2    # "index":I
    aget-byte v5, p0, v3

    if-gt v5, v7, :cond_d

    .end local v1    # "byte2":I
    :goto_42
    move v3, v2

    .line 192
    .end local v2    # "index":I
    .restart local v3    # "index":I
    goto :goto_9

    .line 175
    .end local v3    # "index":I
    .restart local v2    # "index":I
    :cond_44
    add-int/lit8 v5, v2, 0x2

    if-ge v5, p2, :cond_d

    .line 178
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "index":I
    .restart local v3    # "index":I
    aget-byte v1, p0, v2

    .line 179
    .restart local v1    # "byte2":I
    if-gt v1, v7, :cond_22

    shl-int/lit8 v5, v0, 0x1c

    add-int/lit8 v6, v1, 0x70

    add-int/2addr v5, v6

    shr-int/lit8 v5, v5, 0x1e

    if-nez v5, :cond_22

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "index":I
    .restart local v2    # "index":I
    aget-byte v5, p0, v3

    if-gt v5, v7, :cond_d

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "index":I
    .restart local v3    # "index":I
    aget-byte v5, p0, v2

    if-gt v5, v7, :cond_22

    .end local v1    # "byte2":I
    :cond_63
    move v2, v3

    .end local v3    # "index":I
    .restart local v2    # "index":I
    goto :goto_42

    :cond_65
    move v3, v2

    .end local v2    # "index":I
    .restart local v3    # "index":I
    goto :goto_9
.end method
