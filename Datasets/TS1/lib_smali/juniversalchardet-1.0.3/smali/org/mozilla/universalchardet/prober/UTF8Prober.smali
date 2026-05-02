.class public Lorg/mozilla/universalchardet/prober/UTF8Prober;
.super Lorg/mozilla/universalchardet/prober/CharsetProber;
.source "UTF8Prober.java"


# static fields
.field public static final ONE_CHAR_PROB:F = 0.5f

.field private static final smModel:Lorg/mozilla/universalchardet/prober/statemachine/SMModel;


# instance fields
.field private codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

.field private numOfMBChar:I

.field private state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 61
    new-instance v0, Lorg/mozilla/universalchardet/prober/statemachine/UTF8SMModel;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/statemachine/UTF8SMModel;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->smModel:Lorg/mozilla/universalchardet/prober/statemachine/SMModel;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 69
    invoke-direct {p0}, Lorg/mozilla/universalchardet/prober/CharsetProber;-><init>()V

    .line 70
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->numOfMBChar:I

    .line 71
    new-instance v0, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    sget-object v1, Lorg/mozilla/universalchardet/prober/UTF8Prober;->smModel:Lorg/mozilla/universalchardet/prober/statemachine/SMModel;

    invoke-direct {v0, v1}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;-><init>(Lorg/mozilla/universalchardet/prober/statemachine/SMModel;)V

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    .line 73
    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/UTF8Prober;->reset()V

    .line 74
    return-void
.end method


# virtual methods
.method public getCharSetName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 78
    sget-object v0, Lorg/mozilla/universalchardet/Constants;->CHARSET_UTF_8:Ljava/lang/String;

    return-object v0
.end method

.method public getConfidence()F
    .registers 5

    .prologue
    .line 126
    const v1, 0x3f7d70a4    # 0.99f

    .line 128
    .local v1, "unlike":F
    iget v2, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->numOfMBChar:I

    const/4 v3, 0x6

    if-ge v2, v3, :cond_17

    .line 129
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    iget v2, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->numOfMBChar:I

    if-ge v0, v2, :cond_13

    .line 130
    const/high16 v2, 0x3f000000    # 0.5f

    mul-float/2addr v1, v2

    .line 129
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 132
    :cond_13
    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v2, v1

    .line 134
    .end local v0    # "i":I
    :goto_16
    return v2

    :cond_17
    const v2, 0x3f7d70a4    # 0.99f

    goto :goto_16
.end method

.method public getState()Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    return-object v0
.end method

.method public handleData([BII)Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 10
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/4 v5, 0x2

    .line 85
    add-int v2, p2, p3

    .line 86
    .local v2, "maxPos":I
    move v1, p2

    .local v1, "i":I
    :goto_4
    if-ge v1, v2, :cond_15

    .line 87
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    aget-byte v4, p1, v1

    invoke-virtual {v3, v4}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;->nextState(B)I

    move-result v0

    .line 88
    .local v0, "codingState":I
    const/4 v3, 0x1

    if-ne v0, v3, :cond_2d

    .line 89
    sget-object v3, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->NOT_ME:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v3, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 103
    .end local v0    # "codingState":I
    :cond_15
    :goto_15
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    sget-object v4, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->DETECTING:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    if-ne v3, v4, :cond_2a

    .line 104
    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/UTF8Prober;->getConfidence()F

    move-result v3

    const v4, 0x3f733333    # 0.95f

    cmpl-float v3, v3, v4

    if-lez v3, :cond_2a

    .line 105
    sget-object v3, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->FOUND_IT:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v3, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 109
    :cond_2a
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    return-object v3

    .line 92
    .restart local v0    # "codingState":I
    :cond_2d
    if-ne v0, v5, :cond_34

    .line 93
    sget-object v3, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->FOUND_IT:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v3, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    goto :goto_15

    .line 96
    :cond_34
    if-nez v0, :cond_44

    .line 97
    iget-object v3, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    invoke-virtual {v3}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;->getCurrentCharLen()I

    move-result v3

    if-lt v3, v5, :cond_44

    .line 98
    iget v3, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->numOfMBChar:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->numOfMBChar:I

    .line 86
    :cond_44
    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    invoke-virtual {v0}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;->reset()V

    .line 120
    const/4 v0, 0x0

    iput v0, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->numOfMBChar:I

    .line 121
    sget-object v0, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->DETECTING:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/UTF8Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 122
    return-void
.end method

.method public setOption()V
    .registers 1

    .prologue
    .line 139
    return-void
.end method
