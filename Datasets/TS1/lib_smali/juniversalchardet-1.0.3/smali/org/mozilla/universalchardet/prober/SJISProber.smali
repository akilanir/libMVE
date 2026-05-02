.class public Lorg/mozilla/universalchardet/prober/SJISProber;
.super Lorg/mozilla/universalchardet/prober/CharsetProber;
.source "SJISProber.java"


# static fields
.field private static final smModel:Lorg/mozilla/universalchardet/prober/statemachine/SMModel;


# instance fields
.field private codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

.field private contextAnalyzer:Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;

.field private distributionAnalyzer:Lorg/mozilla/universalchardet/prober/distributionanalysis/SJISDistributionAnalysis;

.field private lastChar:[B

.field private state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 61
    new-instance v0, Lorg/mozilla/universalchardet/prober/statemachine/SJISSMModel;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/statemachine/SJISSMModel;-><init>()V

    sput-object v0, Lorg/mozilla/universalchardet/prober/SJISProber;->smModel:Lorg/mozilla/universalchardet/prober/statemachine/SMModel;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 69
    invoke-direct {p0}, Lorg/mozilla/universalchardet/prober/CharsetProber;-><init>()V

    .line 70
    new-instance v0, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    sget-object v1, Lorg/mozilla/universalchardet/prober/SJISProber;->smModel:Lorg/mozilla/universalchardet/prober/statemachine/SMModel;

    invoke-direct {v0, v1}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;-><init>(Lorg/mozilla/universalchardet/prober/statemachine/SMModel;)V

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    .line 71
    new-instance v0, Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;-><init>()V

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->contextAnalyzer:Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;

    .line 72
    new-instance v0, Lorg/mozilla/universalchardet/prober/distributionanalysis/SJISDistributionAnalysis;

    invoke-direct {v0}, Lorg/mozilla/universalchardet/prober/distributionanalysis/SJISDistributionAnalysis;-><init>()V

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->distributionAnalyzer:Lorg/mozilla/universalchardet/prober/distributionanalysis/SJISDistributionAnalysis;

    .line 73
    const/4 v0, 0x2

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->lastChar:[B

    .line 74
    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/SJISProber;->reset()V

    .line 75
    return-void
.end method


# virtual methods
.method public getCharSetName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 80
    sget-object v0, Lorg/mozilla/universalchardet/Constants;->CHARSET_SHIFT_JIS:Ljava/lang/String;

    return-object v0
.end method

.method public getConfidence()F
    .registers 4

    .prologue
    .line 86
    iget-object v2, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->contextAnalyzer:Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;

    invoke-virtual {v2}, Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;->getConfidence()F

    move-result v0

    .line 87
    .local v0, "contextCf":F
    iget-object v2, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->distributionAnalyzer:Lorg/mozilla/universalchardet/prober/distributionanalysis/SJISDistributionAnalysis;

    invoke-virtual {v2}, Lorg/mozilla/universalchardet/prober/distributionanalysis/SJISDistributionAnalysis;->getConfidence()F

    move-result v1

    .line 89
    .local v1, "distribCf":F
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v2

    return v2
.end method

.method public getState()Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    return-object v0
.end method

.method public handleData([BII)Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;
    .registers 13
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 103
    add-int v3, p2, p3

    .line 104
    .local v3, "maxPos":I
    move v2, p2

    .local v2, "i":I
    :goto_5
    if-ge v2, v3, :cond_15

    .line 105
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    aget-byte v5, p1, v2

    invoke-virtual {v4, v5}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;->nextState(B)I

    move-result v1

    .line 106
    .local v1, "codingState":I
    if-ne v1, v8, :cond_3d

    .line 107
    sget-object v4, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->NOT_ME:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 127
    .end local v1    # "codingState":I
    :cond_15
    :goto_15
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->lastChar:[B

    add-int/lit8 v5, v3, -0x1

    aget-byte v5, p1, v5

    aput-byte v5, v4, v7

    .line 129
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    sget-object v5, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->DETECTING:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    if-ne v4, v5, :cond_3a

    .line 130
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->contextAnalyzer:Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;

    invoke-virtual {v4}, Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;->gotEnoughData()Z

    move-result v4

    if-eqz v4, :cond_3a

    invoke-virtual {p0}, Lorg/mozilla/universalchardet/prober/SJISProber;->getConfidence()F

    move-result v4

    const v5, 0x3f733333    # 0.95f

    cmpl-float v4, v4, v5

    if-lez v4, :cond_3a

    .line 131
    sget-object v4, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->FOUND_IT:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 135
    :cond_3a
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    return-object v4

    .line 110
    .restart local v1    # "codingState":I
    :cond_3d
    const/4 v4, 0x2

    if-ne v1, v4, :cond_45

    .line 111
    sget-object v4, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->FOUND_IT:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    goto :goto_15

    .line 114
    :cond_45
    if-nez v1, :cond_65

    .line 115
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    invoke-virtual {v4}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;->getCurrentCharLen()I

    move-result v0

    .line 116
    .local v0, "charLen":I
    if-ne v2, p2, :cond_68

    .line 117
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->lastChar:[B

    aget-byte v5, p1, p2

    aput-byte v5, v4, v8

    .line 118
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->contextAnalyzer:Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;

    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->lastChar:[B

    rsub-int/lit8 v6, v0, 0x2

    invoke-virtual {v4, v5, v6, v0}, Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;->handleOneChar([BII)V

    .line 119
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->distributionAnalyzer:Lorg/mozilla/universalchardet/prober/distributionanalysis/SJISDistributionAnalysis;

    iget-object v5, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->lastChar:[B

    invoke-virtual {v4, v5, v7, v0}, Lorg/mozilla/universalchardet/prober/distributionanalysis/SJISDistributionAnalysis;->handleOneChar([BII)V

    .line 104
    .end local v0    # "charLen":I
    :cond_65
    :goto_65
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 121
    .restart local v0    # "charLen":I
    :cond_68
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->contextAnalyzer:Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;

    add-int/lit8 v5, v2, 0x1

    sub-int/2addr v5, v0

    invoke-virtual {v4, p1, v5, v0}, Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;->handleOneChar([BII)V

    .line 122
    iget-object v4, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->distributionAnalyzer:Lorg/mozilla/universalchardet/prober/distributionanalysis/SJISDistributionAnalysis;

    add-int/lit8 v5, v2, -0x1

    invoke-virtual {v4, p1, v5, v0}, Lorg/mozilla/universalchardet/prober/distributionanalysis/SJISDistributionAnalysis;->handleOneChar([BII)V

    goto :goto_65
.end method

.method public reset()V
    .registers 3

    .prologue
    .line 141
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->codingSM:Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;

    invoke-virtual {v0}, Lorg/mozilla/universalchardet/prober/statemachine/CodingStateMachine;->reset()V

    .line 142
    sget-object v0, Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;->DETECTING:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    iput-object v0, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->state:Lorg/mozilla/universalchardet/prober/CharsetProber$ProbingState;

    .line 143
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->contextAnalyzer:Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;

    invoke-virtual {v0}, Lorg/mozilla/universalchardet/prober/contextanalysis/SJISContextAnalysis;->reset()V

    .line 144
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->distributionAnalyzer:Lorg/mozilla/universalchardet/prober/distributionanalysis/SJISDistributionAnalysis;

    invoke-virtual {v0}, Lorg/mozilla/universalchardet/prober/distributionanalysis/SJISDistributionAnalysis;->reset()V

    .line 145
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/SJISProber;->lastChar:[B

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 146
    return-void
.end method

.method public setOption()V
    .registers 1

    .prologue
    .line 150
    return-void
.end method
