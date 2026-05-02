.class Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;
.super Ljava/lang/Object;
.source "DTLSReassembler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/tls/DTLSReassembler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Range"
.end annotation


# instance fields
.field private end:I

.field private start:I


# direct methods
.method constructor <init>(II)V
    .registers 3
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    iput p1, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->start:I

    .line 106
    iput p2, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->end:I

    .line 107
    return-void
.end method


# virtual methods
.method public getEnd()I
    .registers 2

    .prologue
    .line 121
    iget v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->end:I

    return v0
.end method

.method public getStart()I
    .registers 2

    .prologue
    .line 111
    iget v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->start:I

    return v0
.end method

.method public setEnd(I)V
    .registers 2
    .param p1, "end"    # I

    .prologue
    .line 126
    iput p1, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->end:I

    .line 127
    return-void
.end method

.method public setStart(I)V
    .registers 2
    .param p1, "start"    # I

    .prologue
    .line 116
    iput p1, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->start:I

    .line 117
    return-void
.end method
