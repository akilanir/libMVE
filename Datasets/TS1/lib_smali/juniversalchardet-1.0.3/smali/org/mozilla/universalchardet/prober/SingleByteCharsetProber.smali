.class public Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;
.super Lorg/mozilla/universalchardet/prober/CharsetProber;
.source "SingleByteCharsetProber.java"


# static fields
.field public static final NEGATIVE_CAT:I = 0x0

.field public static final NEGATIVE_SHORTCUT_THRESHOLD:F = 0.05f

.field public static final NUMBER_OF_SEQ_CAT:I = 0x4

.field public static final POSITIVE_CAT:I = 0x3

.field public static final POSITIVE_SHORTCUT_THRESHOLD:F = 0.95f

.field public static final SAMPLE_SIZE:I = 0x40

.field public static final SB_ENOUGH_REL_THRESHOLD:I = 0x400

.field public static final SYMBOL_CAT_ORDER:I = 0xfa


# instance fields
.field private freqChar:I

.field private lastOrder:S

.field private model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

.field private nameProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

.field private reversed:Z

.field private seqCounters:[I

.field private state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

.field private totalChar:I

.field private totalSeqs:I


# direct methods
.method public constructor <init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;)V
    .registers 3
    .param p1, "model"    # Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    .prologue
    .line 81
    invoke-direct {p0}, Lorg/mozilla/universalchardet/prober/CharsetProber;-><init>()V

    .line 82
    iput-object p1, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    .line 83
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->reversed:Z

    .line 84
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->nameProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

    .line 85
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->seqCounters:[I

    .line 86
    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->reset()V

    .line 87
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;ZLorg/mozilla/universalchardet/prober/CharsetProber;)V
    .registers 5
    .param p1, "model"    # Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;
    .param p2, "reversed"    # Z
    .param p3, "nameProber"    # Lorg/mozilla/universalchardet/prober/CharsetProber;

    .prologue
    .line 94
    invoke-direct {p0}, Lorg/mozilla/universalchardet/prober/CharsetProber;-><init>()V

    .line 95
    iput-object p1, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    .line 96
    iput-boolean p2, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->reversed:Z

    .line 97
    iput-object p3, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->nameProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

    .line 98
    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->seqCounters:[I

    .line 99
    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->reset()V

    .line 100
    return-void
.end method


# virtual methods
.method public getCharSetName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->nameProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

    if-nez v0, :cond_b

    .line 111
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-virtual {v0}, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->getCharsetName()Ljava/lang/String;

    move-result-object v0

    .line 113
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->nameProber:Lorg/mozilla/universalchardet/prober/CharsetProber;

    invoke-virtual {v0}, Lorg/mozilla/universalchardet/prober/CharsetProber;->getCharSetName()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method public getConfidence()F
    .registers 5

    .prologue
    const/high16 v3, 0x3f800000    # 1.0f

    .line 120
    iget v1, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->totalSeqs:I

    if-lez v1, :cond_2a

    .line 121
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->seqCounters:[I

    const/4 v2, 0x3

    aget v1, v1, v2

    int-to-float v1, v1

    mul-float/2addr v1, v3

    iget v2, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->totalSeqs:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    iget-object v2, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-virtual {v2}, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->getTypicalPositiveRatio()F

    move-result v2

    div-float v0, v1, v2

    .line 122
    .local v0, "r":F
    iget v1, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->freqChar:I

    int-to-float v1, v1

    mul-float/2addr v1, v0

    iget v2, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->totalChar:I

    int-to-float v2, v2

    div-float v0, v1, v2

    .line 123
    cmpl-float v1, v0, v3

    if-ltz v1, :cond_29

    .line 124
    const v0, 0x3f7d70a4    # 0.99f

    .line 129
    .end local v0    # "r":F
    :cond_29
    :goto_29
    return v0

    :cond_2a
    const v0, 0x3c23d70a    # 0.01f

    goto :goto_29
.end method

.method public getState()Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 2

    .prologue
    .line 135
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    return-object v0
.end method

.method public handleData([BII)Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 13
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/16 v8, 0x40

    .line 143
    add-int v2, p2, p3

    .line 144
    .local v2, "maxPos":I
    move v1, p2

    .local v1, "i":I
    :goto_5
    if-ge v1, v2, :cond_5b

    .line 145
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    aget-byte v5, p1, v1

    invoke-virtual {v4, v5}, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->getOrder(B)S

    move-result v3

    .line 147
    .local v3, "order":S
    const/16 v4, 0xfa

    if-ge v3, v4, :cond_19

    .line 148
    iget v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->totalChar:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->totalChar:I

    .line 150
    :cond_19
    if-ge v3, v8, :cond_42

    .line 151
    iget v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->freqChar:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->freqChar:I

    .line 152
    iget-short v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->lastOrder:S

    if-ge v4, v8, :cond_42

    .line 153
    iget v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->totalSeqs:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->totalSeqs:I

    .line 154
    iget-boolean v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->reversed:Z

    if-nez v4, :cond_47

    .line 155
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->seqCounters:[I

    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    iget-short v6, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->lastOrder:S

    mul-int/lit8 v6, v6, 0x40

    add-int/2addr v6, v3

    invoke-virtual {v5, v6}, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->getPrecedence(I)B

    move-result v5

    aget v6, v4, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v4, v5

    .line 161
    :cond_42
    :goto_42
    iput-short v3, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->lastOrder:S

    .line 144
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 157
    :cond_47
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->seqCounters:[I

    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    mul-int/lit8 v6, v3, 0x40

    iget-short v7, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->lastOrder:S

    add-int/2addr v6, v7

    invoke-virtual {v5, v6}, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->getPrecedence(I)B

    move-result v5

    aget v6, v4, v5

    add-int/lit8 v6, v6, 0x1

    aput v6, v4, v5

    goto :goto_42

    .line 164
    .end local v3    # "order":S
    :cond_5b
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    sget-object v5, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->DETECTING:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    if-ne v4, v5, :cond_76

    .line 165
    iget v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->totalSeqs:I

    const/16 v5, 0x400

    if-le v4, v5, :cond_76

    .line 166
    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->getConfidence()F

    move-result v0

    .line 167
    .local v0, "cf":F
    const v4, 0x3f733333    # 0.95f

    cmpl-float v4, v0, v4

    if-lez v4, :cond_79

    .line 168
    sget-object v4, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->FOUND_IT:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 175
    .end local v0    # "cf":F
    :cond_76
    :goto_76
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    return-object v4

    .line 169
    .restart local v0    # "cf":F
    :cond_79
    const v4, 0x3d4ccccd    # 0.05f

    cmpg-float v4, v0, v4

    if-gez v4, :cond_76

    .line 170
    sget-object v4, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->NOT_ME:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v4, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    goto :goto_76
.end method

.method keepEnglishLetters()Z
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-virtual {v0}, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->getKeepEnglishLetter()Z

    move-result v0

    return v0
.end method

.method public reset()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 181
    sget-object v1, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->DETECTING:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v1, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 182
    const/16 v1, 0xff

    iput-short v1, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->lastOrder:S

    .line 183
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    const/4 v1, 0x4

    if-ge v0, v1, :cond_14

    .line 184
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->seqCounters:[I

    aput v2, v1, v0

    .line 183
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 186
    :cond_14
    iput v2, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->totalSeqs:I

    .line 187
    iput v2, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->totalChar:I

    .line 188
    iput v2, p0, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;->freqChar:I

    .line 189
    return-void
.end method

.method public setOption()V
    .registers 1

    .prologue
    .line 193
    return-void
.end method
