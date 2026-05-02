.class public Lorg/mozilla/universalchardet/prober/EscCharsetProber;
.super Lorg/mozilla/universalchardet/prober/CharsetProber;
.source "EscCharsetProber.java"


# static fields
.field private static final hzsModel:Lorg/mozilla/universalchardet/prober/statemachine/HZSMModel;

.field private static final iso2022cnModel:Lorg/mozilla/universalchardet/prober/statemachine/ISO2022CNSMModel;

.field private static final iso2022jpModel:Lorg/mozilla/universalchardet/prober/statemachine/ISO2022JPSMModel;

.field private static final iso2022krModel:Lorg/mozilla/universalchardet/prober/statemachine/ISO2022KRSMModel;


# instance fields
.field private activeSM:I

.field private codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

.field private detectedCharset:Ljava/lang/String;

.field private state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 58
    new-instance v0, Lorg/mozilla/universalchardet/prober/statemachine/HZSMModel;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/statemachine/HZSMModel;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->hzsModel:Lorg/mozilla/universalchardet/prober/statemachine/HZSMModel;

    .line 59
    new-instance v0, Lorg/mozilla/universalchardet/prober/statemachine/ISO2022CNSMModel;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/statemachine/ISO2022CNSMModel;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->iso2022cnModel:Lorg/mozilla/universalchardet/prober/statemachine/ISO2022CNSMModel;

    .line 60
    new-instance v0, Lorg/mozilla/universalchardet/prober/statemachine/ISO2022JPSMModel;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/statemachine/ISO2022JPSMModel;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->iso2022jpModel:Lorg/mozilla/universalchardet/prober/statemachine/ISO2022JPSMModel;

    .line 61
    new-instance v0, Lorg/mozilla/universalchardet/prober/statemachine/ISO2022KRSMModel;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/statemachine/ISO2022KRSMModel;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->iso2022krModel:Lorg/mozilla/universalchardet/prober/statemachine/ISO2022KRSMModel;

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    .prologue
    .line 69
    invoke-direct {p0}, Lorg/mozilla/universalchardet/prober/CharsetProber;-><init>()V

    .line 71
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    .line 72
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    const/4 v1, 0x0

    new-instance v2, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    sget-object v3, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->hzsModel:Lorg/mozilla/universalchardet/prober/statemachine/HZSMModel;

    invoke-direct {v2, v3}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;-><init>(Lorg/mozilla/universalchardet/prober/statemachine/SMModel;)V

    aput-object v2, v0, v1

    .line 73
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    const/4 v1, 0x1

    new-instance v2, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    sget-object v3, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->iso2022cnModel:Lorg/mozilla/universalchardet/prober/statemachine/ISO2022CNSMModel;

    invoke-direct {v2, v3}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;-><init>(Lorg/mozilla/universalchardet/prober/statemachine/SMModel;)V

    aput-object v2, v0, v1

    .line 74
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    const/4 v1, 0x2

    new-instance v2, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    sget-object v3, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->iso2022jpModel:Lorg/mozilla/universalchardet/prober/statemachine/ISO2022JPSMModel;

    invoke-direct {v2, v3}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;-><init>(Lorg/mozilla/universalchardet/prober/statemachine/SMModel;)V

    aput-object v2, v0, v1

    .line 75
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    const/4 v1, 0x3

    new-instance v2, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    sget-object v3, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->iso2022krModel:Lorg/mozilla/universalchardet/prober/statemachine/ISO2022KRSMModel;

    invoke-direct {v2, v3}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;-><init>(Lorg/mozilla/universalchardet/prober/statemachine/SMModel;)V

    aput-object v2, v0, v1

    .line 77
    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->reset()V

    .line 78
    return-void
.end method


# virtual methods
.method public getCharSetName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->detectedCharset:Ljava/lang/String;

    return-object v0
.end method

.method public getConfidence()F
    .registers 2

    .prologue
    .line 89
    const v0, 0x3f7d70a4    # 0.99f

    return v0
.end method

.method public getState()Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    return-object v0
.end method

.method public handleData([BII)Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 12
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 103
    add-int v3, p2, p3

    .line 104
    .local v3, "maxPos":I
    move v1, p2

    .local v1, "i":I
    :goto_3
    if-ge v1, v3, :cond_61

    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    sget-object v6, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->DETECTING:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    if-ne v5, v6, :cond_61

    .line 105
    iget v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->activeSM:I

    add-int/lit8 v2, v5, -0x1

    .local v2, "j":I
    :goto_f
    if-ltz v2, :cond_5e

    .line 106
    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    aget-object v5, v5, v2

    aget-byte v6, p1, v1

    invoke-virtual {v5, v6}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;->nextState(B)I

    move-result v0

    .line 107
    .local v0, "codingState":I
    const/4 v5, 0x1

    if-ne v0, v5, :cond_4a

    .line 108
    iget v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->activeSM:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->activeSM:I

    .line 109
    iget v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->activeSM:I

    if-gtz v5, :cond_2f

    .line 110
    sget-object v5, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->NOT_ME:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 111
    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 126
    .end local v0    # "codingState":I
    .end local v2    # "j":I
    :goto_2e
    return-object v5

    .line 112
    .restart local v0    # "codingState":I
    .restart local v2    # "j":I
    :cond_2f
    iget v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->activeSM:I

    if-eq v2, v5, :cond_47

    .line 114
    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    iget v6, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->activeSM:I

    aget-object v4, v5, v6

    .line 115
    .local v4, "t":Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;
    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    iget v6, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->activeSM:I

    iget-object v7, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    aget-object v7, v7, v2

    aput-object v7, v5, v6

    .line 116
    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    aput-object v4, v5, v2

    .line 105
    .end local v4    # "t":Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;
    :cond_47
    add-int/lit8 v2, v2, -0x1

    goto :goto_f

    .line 118
    :cond_4a
    const/4 v5, 0x2

    if-ne v0, v5, :cond_47

    .line 119
    sget-object v5, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->FOUND_IT:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 120
    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    aget-object v5, v5, v2

    invoke-virtual {v5}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;->getCodingStateMachine()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->detectedCharset:Ljava/lang/String;

    .line 121
    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    goto :goto_2e

    .line 104
    .end local v0    # "codingState":I
    :cond_5e
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 126
    .end local v2    # "j":I
    :cond_61
    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    goto :goto_2e
.end method

.method public reset()V
    .registers 3

    .prologue
    .line 132
    sget-object v1, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->DETECTING:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v1, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 133
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    array-length v1, v1

    if-ge v0, v1, :cond_14

    .line 134
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;->reset()V

    .line 133
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 136
    :cond_14
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->codingSM:[Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    array-length v1, v1

    iput v1, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->activeSM:I

    .line 137
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/mozilla/universalchardet/prober/EscCharsetProber;->detectedCharset:Ljava/lang/String;

    .line 138
    return-void
.end method

.method public setOption()V
    .registers 1

    .prologue
    .line 142
    return-void
.end method
