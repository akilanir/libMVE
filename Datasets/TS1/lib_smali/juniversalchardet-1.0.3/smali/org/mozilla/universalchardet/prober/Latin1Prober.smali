.class public Lorg/mozilla/universalchardet/prober/Latin1Prober;
.super Lorg/mozilla/universalchardet/prober/CharsetProber;
.source "Latin1Prober.java"


# static fields
.field public static final ACO:B = 0x5t

.field public static final ACV:B = 0x4t

.field public static final ASC:B = 0x2t

.field public static final ASO:B = 0x7t

.field public static final ASS:B = 0x3t

.field public static final ASV:B = 0x6t

.field public static final CLASS_NUM:I = 0x8

.field public static final FREQ_CAT_NUM:I = 0x4

.field public static final OTH:B = 0x1t

.field public static final UDF:B

.field private static final latin1CharToClass:[B

.field private static final latin1ClassModel:[B


# instance fields
.field private freqCounter:[I

.field private lastCharClass:B

.field private state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 169
    const/16 v0, 0x100

    new-array v0, v0, [B

    fill-array-data v0, :array_14

    sput-object v0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->latin1CharToClass:[B

    .line 204
    const/16 v0, 0x40

    new-array v0, v0, [B

    fill-array-data v0, :array_98

    sput-object v0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->latin1ClassModel:[B

    return-void

    .line 169
    nop

    :array_14
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x2t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x0t
        0x1t
        0x7t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x5t
        0x1t
        0x5t
        0x0t
        0x5t
        0x0t
        0x0t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x7t
        0x1t
        0x7t
        0x0t
        0x7t
        0x5t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x5t
        0x5t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x5t
        0x5t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x1t
        0x4t
        0x4t
        0x4t
        0x4t
        0x4t
        0x5t
        0x5t
        0x5t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x7t
        0x7t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x7t
        0x7t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x1t
        0x6t
        0x6t
        0x6t
        0x6t
        0x6t
        0x7t
        0x7t
        0x7t
    .end array-data

    .line 204
    :array_98
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x0t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x0t
        0x3t
        0x3t
        0x3t
        0x1t
        0x1t
        0x3t
        0x3t
        0x0t
        0x3t
        0x3t
        0x3t
        0x1t
        0x2t
        0x1t
        0x2t
        0x0t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x3t
        0x0t
        0x3t
        0x1t
        0x3t
        0x1t
        0x1t
        0x1t
        0x3t
        0x0t
        0x3t
        0x1t
        0x3t
        0x1t
        0x1t
        0x3t
        0x3t
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 75
    invoke-direct {p0}, Lorg/mozilla/universalchardet/prober/CharsetProber;-><init>()V

    .line 77
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->freqCounter:[I

    .line 79
    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/Latin1Prober;->reset()V

    .line 80
    return-void
.end method


# virtual methods
.method public getCharSetName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 85
    sget-object v0, Lorg/mozilla/universalchardet/Constants;->CHARSET_WINDOWS_1252:Ljava/lang/String;

    return-object v0
.end method

.method public getConfidence()F
    .registers 6

    .prologue
    .line 91
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    sget-object v4, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->NOT_ME:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    if-ne v3, v4, :cond_a

    .line 92
    const v0, 0x3c23d70a    # 0.01f

    .line 116
    :goto_9
    return v0

    .line 96
    :cond_a
    const/4 v2, 0x0

    .line 97
    .local v2, "total":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->freqCounter:[I

    array-length v3, v3

    if-ge v1, v3, :cond_19

    .line 98
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->freqCounter:[I

    aget v3, v3, v1

    add-int/2addr v2, v3

    .line 97
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 101
    :cond_19
    if-gtz v2, :cond_26

    .line 102
    const/4 v0, 0x0

    .line 108
    .local v0, "confidence":F
    :goto_1c
    const/4 v3, 0x0

    cmpg-float v3, v0, v3

    if-gez v3, :cond_22

    .line 109
    const/4 v0, 0x0

    .line 114
    :cond_22
    const/high16 v3, 0x3f000000    # 0.5f

    mul-float/2addr v0, v3

    .line 116
    goto :goto_9

    .line 104
    .end local v0    # "confidence":F
    :cond_26
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->freqCounter:[I

    const/4 v4, 0x3

    aget v3, v3, v4

    int-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    mul-float/2addr v3, v4

    int-to-float v4, v2

    div-float v0, v3, v4

    .line 105
    .restart local v0    # "confidence":F
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->freqCounter:[I

    const/4 v4, 0x1

    aget v3, v3, v4

    int-to-float v3, v3

    const/high16 v4, 0x41a00000    # 20.0f

    mul-float/2addr v3, v4

    int-to-float v4, v2

    div-float/2addr v3, v4

    sub-float/2addr v0, v3

    goto :goto_1c
.end method

.method public getState()Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    return-object v0
.end method

.method public handleData([BII)Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 13
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 128
    invoke-virtual {p0, p1, p2, p3}, Lorg/mozilla/universalchardet/prober/Latin1Prober;->filterWithEnglishLetters([BII)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 133
    .local v6, "newBufTmp":Ljava/nio/ByteBuffer;
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    .line 134
    .local v4, "newBuf":[B
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    .line 136
    .local v5, "newBufLen":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_d
    if-ge v3, v5, :cond_26

    .line 137
    aget-byte v7, v4, v3

    and-int/lit16 v0, v7, 0xff

    .line 138
    .local v0, "c":I
    sget-object v7, Lorg/mozilla/universalchardet/prober/Latin1Prober;->latin1CharToClass:[B

    aget-byte v1, v7, v0

    .line 139
    .local v1, "charClass":B
    sget-object v7, Lorg/mozilla/universalchardet/prober/Latin1Prober;->latin1ClassModel:[B

    iget-byte v8, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->lastCharClass:B

    mul-int/lit8 v8, v8, 0x8

    add-int/2addr v8, v1

    aget-byte v2, v7, v8

    .line 140
    .local v2, "freq":B
    if-nez v2, :cond_29

    .line 141
    sget-object v7, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->NOT_ME:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v7, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 148
    .end local v0    # "c":I
    .end local v1    # "charClass":B
    .end local v2    # "freq":B
    :cond_26
    iget-object v7, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    return-object v7

    .line 144
    .restart local v0    # "c":I
    .restart local v1    # "charClass":B
    .restart local v2    # "freq":B
    :cond_29
    iget-object v7, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->freqCounter:[I

    aget v8, v7, v2

    add-int/lit8 v8, v8, 0x1

    aput v8, v7, v2

    .line 145
    iput-byte v1, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->lastCharClass:B

    .line 136
    add-int/lit8 v3, v3, 0x1

    goto :goto_d
.end method

.method public reset()V
    .registers 4

    .prologue
    .line 154
    sget-object v1, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->DETECTING:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v1, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 155
    const/4 v1, 0x1

    iput-byte v1, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->lastCharClass:B

    .line 156
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->freqCounter:[I

    array-length v1, v1

    if-ge v0, v1, :cond_15

    .line 157
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/Latin1Prober;->freqCounter:[I

    const/4 v2, 0x0

    aput v2, v1, v0

    .line 156
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 159
    :cond_15
    return-void
.end method

.method public setOption()V
    .registers 1

    .prologue
    .line 163
    return-void
.end method
