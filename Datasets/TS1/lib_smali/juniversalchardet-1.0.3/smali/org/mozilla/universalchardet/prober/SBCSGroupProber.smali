.class public Lorg/mozilla/universalchardet/prober/SBCSGroupProber;
.super Lorg/mozilla/universalchardet/prober/CharsetProber;
.source "SBCSGroupProber.java"


# static fields
.field private static final hebrewModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

.field private static final ibm855Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

.field private static final ibm866Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

.field private static final koi8rModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

.field private static final latin5BulgarianModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

.field private static final latin5Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

.field private static final latin7Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

.field private static final macCyrillicModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

.field private static final win1251BulgarianModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

.field private static final win1251Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

.field private static final win1253Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;


# instance fields
.field private activeNum:I

.field private bestGuess:I

.field private isActive:[Z

.field private probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

.field private state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 68
    new-instance v0, Lorg/mozilla/universalchardet/prober/sequence/Win1251Model;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/sequence/Win1251Model;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->win1251Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    .line 69
    new-instance v0, Lorg/mozilla/universalchardet/prober/sequence/Koi8rModel;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/sequence/Koi8rModel;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->koi8rModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    .line 70
    new-instance v0, Lorg/mozilla/universalchardet/prober/sequence/Latin5Model;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/sequence/Latin5Model;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->latin5Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    .line 71
    new-instance v0, Lorg/mozilla/universalchardet/prober/sequence/MacCyrillicModel;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/sequence/MacCyrillicModel;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->macCyrillicModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    .line 72
    new-instance v0, Lorg/mozilla/universalchardet/prober/sequence/Ibm866Model;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/sequence/Ibm866Model;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->ibm866Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    .line 73
    new-instance v0, Lorg/mozilla/universalchardet/prober/sequence/Ibm855Model;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/sequence/Ibm855Model;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->ibm855Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    .line 74
    new-instance v0, Lorg/mozilla/universalchardet/prober/sequence/Latin7Model;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/sequence/Latin7Model;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->latin7Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    .line 75
    new-instance v0, Lorg/mozilla/universalchardet/prober/sequence/Win1253Model;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/sequence/Win1253Model;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->win1253Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    .line 76
    new-instance v0, Lorg/mozilla/universalchardet/prober/sequence/Latin5BulgarianModel;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/sequence/Latin5BulgarianModel;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->latin5BulgarianModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    .line 77
    new-instance v0, Lorg/mozilla/universalchardet/prober/sequence/Win1251BulgarianModel;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/sequence/Win1251BulgarianModel;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->win1251BulgarianModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    .line 78
    new-instance v0, Lorg/mozilla/universalchardet/prober/sequence/HebrewModel;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/sequence/HebrewModel;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->hebrewModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    return-void
.end method

.method public constructor <init>()V
    .registers 10

    .prologue
    const/16 v2, 0xd

    const/16 v8, 0xc

    const/16 v7, 0xb

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 86
    invoke-direct {p0}, Lorg/mozilla/universalchardet/prober/CharsetProber;-><init>()V

    .line 88
    new-array v1, v2, [Lorg/mozilla/universalchardet/prober/CharsetProber;

    iput-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    .line 89
    new-array v1, v2, [Z

    iput-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->isActive:[Z

    .line 91
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    new-instance v2, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;

    sget-object v3, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->win1251Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-direct {v2, v3}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;-><init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;)V

    aput-object v2, v1, v5

    .line 92
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    new-instance v2, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;

    sget-object v3, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->koi8rModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-direct {v2, v3}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;-><init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;)V

    aput-object v2, v1, v6

    .line 93
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/4 v2, 0x2

    new-instance v3, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;

    sget-object v4, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->latin5Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-direct {v3, v4}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;-><init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;)V

    aput-object v3, v1, v2

    .line 94
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/4 v2, 0x3

    new-instance v3, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;

    sget-object v4, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->macCyrillicModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-direct {v3, v4}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;-><init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;)V

    aput-object v3, v1, v2

    .line 95
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/4 v2, 0x4

    new-instance v3, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;

    sget-object v4, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->ibm866Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-direct {v3, v4}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;-><init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;)V

    aput-object v3, v1, v2

    .line 96
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/4 v2, 0x5

    new-instance v3, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;

    sget-object v4, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->ibm855Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-direct {v3, v4}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;-><init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;)V

    aput-object v3, v1, v2

    .line 97
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/4 v2, 0x6

    new-instance v3, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;

    sget-object v4, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->latin7Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-direct {v3, v4}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;-><init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;)V

    aput-object v3, v1, v2

    .line 98
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/4 v2, 0x7

    new-instance v3, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;

    sget-object v4, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->win1253Model:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-direct {v3, v4}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;-><init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;)V

    aput-object v3, v1, v2

    .line 99
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/16 v2, 0x8

    new-instance v3, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;

    sget-object v4, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->latin5BulgarianModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-direct {v3, v4}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;-><init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;)V

    aput-object v3, v1, v2

    .line 100
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/16 v2, 0x9

    new-instance v3, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;

    sget-object v4, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->win1251BulgarianModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-direct {v3, v4}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;-><init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;)V

    aput-object v3, v1, v2

    .line 102
    new-instance v0, Lorg/mozilla/universalchardet/prober/HebrewProber;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/HebrewProber;-><init>()V

    .line 103
    .local v0, "hebprober":Lorg/mozilla/universalchardet/prober/HebrewProber;
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    const/16 v2, 0xa

    aput-object v0, v1, v2

    .line 104
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    new-instance v2, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;

    sget-object v3, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->hebrewModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-direct {v2, v3, v5, v0}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;-><init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;ZLorg/mozilla/universalchardet/prober/CharsetProber;)V

    aput-object v2, v1, v7

    .line 105
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    new-instance v2, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;

    sget-object v3, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->hebrewModel:Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;

    invoke-direct {v2, v3, v6, v0}, Lorg/mozilla/universalchardet/prober/SingleByteCharsetProber;-><init>(Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;ZLorg/mozilla/universalchardet/prober/CharsetProber;)V

    aput-object v2, v1, v8

    .line 106
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    aget-object v1, v1, v7

    iget-object v2, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    aget-object v2, v2, v8

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/universalchardet/prober/HebrewProber;->setModalProbers(Lorg/mozilla/universalchardet/prober/CharsetProber;Lorg/mozilla/universalchardet/prober/CharsetProber;)V

    .line 108
    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->reset()V

    .line 109
    return-void
.end method


# virtual methods
.method public getCharSetName()Ljava/lang/String;
    .registers 3

    .prologue
    const/4 v1, -0x1

    .line 114
    iget v0, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->bestGuess:I

    if-ne v0, v1, :cond_f

    .line 115
    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->getConfidence()F

    .line 116
    iget v0, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->bestGuess:I

    if-ne v0, v1, :cond_f

    .line 117
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->bestGuess:I

    .line 121
    :cond_f
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    iget v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->bestGuess:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lorg/mozilla/universalchardet/prober/CharsetProber;->getCharSetName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getConfidence()F
    .registers 6

    .prologue
    .line 127
    const/4 v0, 0x0

    .line 130
    .local v0, "bestConf":F
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    sget-object v4, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->FOUND_IT:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    if-ne v3, v4, :cond_b

    .line 131
    const v3, 0x3f7d70a4    # 0.99f

    .line 148
    :goto_a
    return v3

    .line 132
    :cond_b
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    sget-object v4, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->NOT_ME:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    if-ne v3, v4, :cond_15

    .line 133
    const v3, 0x3c23d70a    # 0.01f

    goto :goto_a

    .line 135
    :cond_15
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_16
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    array-length v3, v3

    if-ge v2, v3, :cond_34

    .line 136
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->isActive:[Z

    aget-boolean v3, v3, v2

    if-nez v3, :cond_24

    .line 135
    :cond_21
    :goto_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 140
    :cond_24
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lorg/mozilla/universalchardet/prober/CharsetProber;->getConfidence()F

    move-result v1

    .line 141
    .local v1, "cf":F
    cmpg-float v3, v0, v1

    if-gez v3, :cond_21

    .line 142
    move v0, v1

    .line 143
    iput v2, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->bestGuess:I

    goto :goto_21

    .end local v1    # "cf":F
    :cond_34
    move v3, v0

    .line 148
    goto :goto_a
.end method

.method public getState()Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    return-object v0
.end method

.method public handleData([BII)Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 11
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/4 v6, 0x0

    .line 163
    invoke-virtual {p0, p1, p2, p3}, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->filterWithoutEnglishLetters([BII)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 164
    .local v1, "newbuf":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    if-nez v3, :cond_e

    .line 188
    :cond_b
    :goto_b
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    return-object v3

    .line 168
    :cond_e
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    array-length v3, v3

    if-ge v0, v3, :cond_b

    .line 169
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->isActive:[Z

    aget-boolean v3, v3, v0

    if-nez v3, :cond_1d

    .line 168
    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 172
    :cond_1d
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    aget-object v3, v3, v0

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    invoke-virtual {v3, v4, v6, v5}, Lorg/mozilla/universalchardet/prober/CharsetProber;->handleData([BII)Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    move-result-object v2

    .line 173
    .local v2, "st":Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    sget-object v3, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->FOUND_IT:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    if-ne v2, v3, :cond_38

    .line 174
    iput v0, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->bestGuess:I

    .line 175
    sget-object v3, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->FOUND_IT:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    goto :goto_b

    .line 177
    :cond_38
    sget-object v3, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->NOT_ME:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    if-ne v2, v3, :cond_1a

    .line 178
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->isActive:[Z

    aput-boolean v6, v3, v0

    .line 179
    iget v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->activeNum:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->activeNum:I

    .line 180
    iget v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->activeNum:I

    if-gtz v3, :cond_1a

    .line 181
    sget-object v3, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->NOT_ME:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v3, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    goto :goto_b
.end method

.method public reset()V
    .registers 4

    .prologue
    .line 194
    const/4 v1, 0x0

    iput v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->activeNum:I

    .line 195
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    array-length v1, v1

    if-ge v0, v1, :cond_1e

    .line 196
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->probers:[Lorg/mozilla/universalchardet/prober/CharsetProber;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/mozilla/universalchardet/prober/CharsetProber;->reset()V

    .line 197
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->isActive:[Z

    const/4 v2, 0x1

    aput-boolean v2, v1, v0

    .line 198
    iget v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->activeNum:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->activeNum:I

    .line 195
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 201
    :cond_1e
    const/4 v1, -0x1

    iput v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->bestGuess:I

    .line 202
    sget-object v1, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->DETECTING:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v1, p0, Lorg/mozilla/universalchardet/prober/SBCSGroupProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 203
    return-void
.end method

.method public setOption()V
    .registers 1

    .prologue
    .line 207
    return-void
.end method
