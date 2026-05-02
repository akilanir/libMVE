.class Lorg/spongycastle/crypto/tls/DTLSReassembler;
.super Ljava/lang/Object;
.source "DTLSReassembler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;
    }
.end annotation


# instance fields
.field private final body:[B

.field private missing:Ljava/util/Vector;

.field private final msg_type:S


# direct methods
.method constructor <init>(SI)V
    .registers 6
    .param p1, "msg_type"    # S
    .param p2, "length"    # I

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    .line 14
    iput-short p1, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->msg_type:S

    .line 15
    new-array v0, p2, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->body:[B

    .line 16
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    new-instance v1, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;

    const/4 v2, 0x0

    invoke-direct {v1, v2, p2}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;-><init>(II)V

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 17
    return-void
.end method


# virtual methods
.method contributeFragment(SI[BIII)V
    .registers 19
    .param p1, "msg_type"    # S
    .param p2, "length"    # I
    .param p3, "buf"    # [B
    .param p4, "off"    # I
    .param p5, "fragment_offset"    # I
    .param p6, "fragment_length"    # I

    .prologue
    .line 32
    add-int v5, p5, p6

    .line 34
    .local v5, "fragment_end":I
    iget-short v9, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->msg_type:S

    if-ne v9, p1, :cond_d

    iget-object v9, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->body:[B

    array-length v9, v9

    if-ne v9, p2, :cond_d

    if-le v5, p2, :cond_e

    .line 91
    :cond_d
    :goto_d
    return-void

    .line 39
    :cond_e
    if-nez p6, :cond_2f

    .line 42
    if-nez p5, :cond_d

    iget-object v9, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_d

    .line 44
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->firstElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;

    .line 45
    .local v4, "firstRange":Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;
    invoke-virtual {v4}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getEnd()I

    move-result v9

    if-nez v9, :cond_d

    .line 47
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Ljava/util/Vector;->removeElementAt(I)V

    goto :goto_d

    .line 53
    .end local v4    # "firstRange":Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;
    :cond_2f
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_30
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    if-ge v6, v9, :cond_d

    .line 55
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    invoke-virtual {v9, v6}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;

    .line 56
    .local v8, "range":Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getStart()I

    move-result v9

    if-ge v9, v5, :cond_d

    .line 60
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getEnd()I

    move-result v9

    move/from16 v0, p5

    if-le v9, v0, :cond_7f

    .line 63
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getStart()I

    move-result v9

    move/from16 v0, p5

    invoke-static {v9, v0}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 64
    .local v3, "copyStart":I
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getEnd()I

    move-result v9

    invoke-static {v9, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 65
    .local v1, "copyEnd":I
    sub-int v2, v1, v3

    .line 67
    .local v2, "copyLength":I
    add-int v9, p4, v3

    sub-int v9, v9, p5

    iget-object v10, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->body:[B

    invoke-static {p3, v9, v10, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 70
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getStart()I

    move-result v9

    if-ne v3, v9, :cond_86

    .line 72
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getEnd()I

    move-result v9

    if-ne v1, v9, :cond_82

    .line 74
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    add-int/lit8 v7, v6, -0x1

    .end local v6    # "i":I
    .local v7, "i":I
    invoke-virtual {v9, v6}, Ljava/util/Vector;->removeElementAt(I)V

    move v6, v7

    .line 53
    .end local v1    # "copyEnd":I
    .end local v2    # "copyLength":I
    .end local v3    # "copyStart":I
    .end local v7    # "i":I
    .restart local v6    # "i":I
    :cond_7f
    :goto_7f
    add-int/lit8 v6, v6, 0x1

    goto :goto_30

    .line 78
    .restart local v1    # "copyEnd":I
    .restart local v2    # "copyLength":I
    .restart local v3    # "copyStart":I
    :cond_82
    invoke-virtual {v8, v1}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->setStart(I)V

    goto :goto_7f

    .line 83
    :cond_86
    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getEnd()I

    move-result v9

    if-eq v1, v9, :cond_9c

    .line 85
    iget-object v9, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    new-instance v10, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;

    invoke-virtual {v8}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->getEnd()I

    move-result v11

    invoke-direct {v10, v1, v11}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;-><init>(II)V

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v9, v10, v6}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 87
    :cond_9c
    invoke-virtual {v8, v3}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;->setEnd(I)V

    goto :goto_7f
.end method

.method getBodyIfComplete()[B
    .registers 2

    .prologue
    .line 26
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->body:[B

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method getMsgType()S
    .registers 2

    .prologue
    .line 21
    iget-short v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->msg_type:S

    return v0
.end method

.method reset()V
    .registers 5

    .prologue
    .line 95
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 96
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->missing:Ljava/util/Vector;

    new-instance v1, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/spongycastle/crypto/tls/DTLSReassembler;->body:[B

    array-length v3, v3

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/crypto/tls/DTLSReassembler$Range;-><init>(II)V

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 97
    return-void
.end method
