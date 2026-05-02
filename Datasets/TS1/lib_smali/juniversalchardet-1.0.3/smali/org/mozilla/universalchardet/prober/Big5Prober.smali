.class public Lorg/mozilla/universalchardet/prober/Big5Prober;
.super Lorg/mozilla/universalchardet/prober/CharsetProber;
.source "Big5Prober.java"


# static fields
.field private static final smModel:Lorg/mozilla/universalchardet/prober/statemachine/SMModel;


# instance fields
.field private codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

.field private distributionAnalyzer:Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;

.field private lastChar:[B

.field private state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    new-instance v0, Lorg/mozilla/universalchardet/prober/statemachine/Big5SMModel;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/statemachine/Big5SMModel;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/Big5Prober;->smModel:Lorg/mozilla/universalchardet/prober/statemachine/SMModel;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 68
    invoke-direct {p0}, Lorg/mozilla/universalchardet/prober/CharsetProber;-><init>()V

    .line 69
    new-instance v0, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    sget-object v1, Lorg/mozilla/universalchardet/prober/Big5Prober;->smModel:Lorg/mozilla/universalchardet/prober/statemachine/SMModel;

    invoke-direct {v0, v1}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;-><init>(Lorg/mozilla/universalchardet/prober/statemachine/SMModel;)V

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    .line 70
    new-instance v0, Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;-><init>()V

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->distributionAnalyzer:Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;

    .line 71
    const/4 v0, 0x2

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->lastChar:[B

    .line 72
    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/Big5Prober;->reset()V

    .line 73
    return-void
.end method


# virtual methods
.method public getCharSetName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 78
    sget-object v0, Lorg/mozilla/universalchardet/Constants;->CHARSET_BIG5:Ljava/lang/String;

    return-object v0
.end method

.method public getConfidence()F
    .registers 3

    .prologue
    .line 84
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->distributionAnalyzer:Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;

    invoke-virtual {v1}, Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;->getConfidence()F

    move-result v0

    .line 86
    .local v0, "distribCf":F
    return v0
.end method

.method public getState()Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    return-object v0
.end method

.method public handleData([BII)Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 12
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 100
    add-int v3, p2, p3

    .line 101
    .local v3, "maxPos":I
    move v2, p2

    .local v2, "i":I
    :goto_5
    if-ge v2, v3, :cond_15

    .line 102
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    aget-byte v5, p1, v2

    invoke-virtual {v4, v5}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;->nextState(B)I

    move-result v1

    .line 103
    .local v1, "codingState":I
    if-ne v1, v7, :cond_3d

    .line 104
    sget-object v4, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->NOT_ME:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v4, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 122
    .end local v1    # "codingState":I
    :cond_15
    :goto_15
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->lastChar:[B

    add-int/lit8 v5, v3, -0x1

    aget-byte v5, p1, v5

    aput-byte v5, v4, v6

    .line 124
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    sget-object v5, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->DETECTING:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    if-ne v4, v5, :cond_3a

    .line 125
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->distributionAnalyzer:Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;

    invoke-virtual {v4}, Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;->gotEnoughData()Z

    move-result v4

    if-eqz v4, :cond_3a

    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/Big5Prober;->getConfidence()F

    move-result v4

    const v5, 0x3f733333    # 0.95f

    cmpl-float v4, v4, v5

    if-lez v4, :cond_3a

    .line 126
    sget-object v4, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->FOUND_IT:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v4, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 130
    :cond_3a
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    return-object v4

    .line 107
    .restart local v1    # "codingState":I
    :cond_3d
    const/4 v4, 0x2

    if-ne v1, v4, :cond_45

    .line 108
    sget-object v4, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->FOUND_IT:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v4, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    goto :goto_15

    .line 111
    :cond_45
    if-nez v1, :cond_5c

    .line 112
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    invoke-virtual {v4}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;->getCurrentCharLen()I

    move-result v0

    .line 113
    .local v0, "charLen":I
    if-ne v2, p2, :cond_5f

    .line 114
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->lastChar:[B

    aget-byte v5, p1, p2

    aput-byte v5, v4, v7

    .line 115
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->distributionAnalyzer:Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;

    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->lastChar:[B

    invoke-virtual {v4, v5, v6, v0}, Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;->handleOneChar([BII)V

    .line 101
    .end local v0    # "charLen":I
    :cond_5c
    :goto_5c
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 117
    .restart local v0    # "charLen":I
    :cond_5f
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->distributionAnalyzer:Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;

    add-int/lit8 v5, v2, -0x1

    invoke-virtual {v4, p1, v5, v0}, Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;->handleOneChar([BII)V

    goto :goto_5c
.end method

.method public reset()V
    .registers 3

    .prologue
    .line 136
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    invoke-virtual {v0}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;->reset()V

    .line 137
    sget-object v0, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->DETECTING:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 138
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->distributionAnalyzer:Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;

    invoke-virtual {v0}, Lorg/mozilla/universalchardet/prober/distributionanalysis/Big5DistributionAnalysis;->reset()V

    .line 139
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/Big5Prober;->lastChar:[B

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 140
    return-void
.end method

.method public setOption()V
    .registers 1

    .prologue
    .line 144
    return-void
.end method
