.class public abstract Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;
.super Ljava/lang/Object;
.source "SequenceModel.java"


# instance fields
.field protected charToOrderMap:[S

.field protected charsetName:Ljava/lang/String;

.field protected keepEnglishLetter:Z

.field protected precedenceMatrix:[B

.field protected typicalPositiveRatio:F


# direct methods
.method public constructor <init>([S[BFZLjava/lang/String;)V
    .registers 6
    .param p1, "charToOrderMap"    # [S
    .param p2, "precedenceMatrix"    # [B
    .param p3, "typicalPositiveRatio"    # F
    .param p4, "keepEnglishLetter"    # Z
    .param p5, "charsetName"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->charToOrderMap:[S

    .line 64
    iput-object p2, p0, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->precedenceMatrix:[B

    .line 65
    iput p3, p0, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->typicalPositiveRatio:F

    .line 66
    iput-boolean p4, p0, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->keepEnglishLetter:Z

    .line 67
    iput-object p5, p0, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->charsetName:Ljava/lang/String;

    .line 68
    return-void
.end method


# virtual methods
.method public getCharsetName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->charsetName:Ljava/lang/String;

    return-object v0
.end method

.method public getKeepEnglishLetter()Z
    .registers 2

    .prologue
    .line 88
    iget-boolean v0, p0, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->keepEnglishLetter:Z

    return v0
.end method

.method public getOrder(B)S
    .registers 4
    .param p1, "b"    # B

    .prologue
    .line 72
    and-int/lit16 v0, p1, 0xff

    .line 73
    .local v0, "c":I
    iget-object v1, p0, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->charToOrderMap:[S

    aget-short v1, v1, v0

    return v1
.end method

.method public getPrecedence(I)B
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 78
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->precedenceMatrix:[B

    aget-byte v0, v0, p1

    return v0
.end method

.method public getTypicalPositiveRatio()F
    .registers 2

    .prologue
    .line 83
    iget v0, p0, Lorg/mozilla/universalchardet/prober/sequence/SequenceModel;->typicalPositiveRatio:F

    return v0
.end method
