.class Ljavassist/bytecode/StackMapTable$Shifter;
.super Ljavassist/bytecode/StackMapTable$Walker;
.source "StackMapTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/StackMapTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Shifter"
.end annotation


# instance fields
.field exclusive:Z

.field gap:I

.field position:I

.field private stackMap:Ljavassist/bytecode/StackMapTable;

.field updatedInfo:[B

.field where:I


# direct methods
.method public constructor <init>(Ljavassist/bytecode/StackMapTable;IIZ)V
    .registers 6
    .param p1, "smt"    # Ljavassist/bytecode/StackMapTable;
    .param p2, "where"    # I
    .param p3, "gap"    # I
    .param p4, "exclusive"    # Z

    .prologue
    .line 835
    invoke-direct {p0, p1}, Ljavassist/bytecode/StackMapTable$Walker;-><init>(Ljavassist/bytecode/StackMapTable;)V

    .line 836
    iput-object p1, p0, Ljavassist/bytecode/StackMapTable$Shifter;->stackMap:Ljavassist/bytecode/StackMapTable;

    .line 837
    iput p2, p0, Ljavassist/bytecode/StackMapTable$Shifter;->where:I

    .line 838
    iput p3, p0, Ljavassist/bytecode/StackMapTable$Shifter;->gap:I

    .line 839
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/bytecode/StackMapTable$Shifter;->position:I

    .line 840
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/bytecode/StackMapTable$Shifter;->updatedInfo:[B

    .line 841
    iput-boolean p4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->exclusive:Z

    .line 842
    return-void
.end method

.method static insertGap([BII)[B
    .registers 8
    .param p0, "info"    # [B
    .param p1, "where"    # I
    .param p2, "gap"    # I

    .prologue
    .line 884
    array-length v1, p0

    .line 885
    .local v1, "len":I
    add-int v3, v1, p2

    new-array v2, v3, [B

    .line 886
    .local v2, "newinfo":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    if-ge v0, v1, :cond_15

    .line 887
    if-ge v0, p1, :cond_13

    const/4 v3, 0x0

    :goto_b
    add-int/2addr v3, v0

    aget-byte v4, p0, v0

    aput-byte v4, v2, v3

    .line 886
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_13
    move v3, p2

    .line 887
    goto :goto_b

    .line 889
    :cond_15
    return-object v2
.end method


# virtual methods
.method public appendFrame(II[I[I)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "tags"    # [I
    .param p4, "data"    # [I

    .prologue
    .line 897
    invoke-virtual {p0, p1, p2}, Ljavassist/bytecode/StackMapTable$Shifter;->update(II)V

    .line 898
    return-void
.end method

.method public chopFrame(III)V
    .registers 4
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "k"    # I

    .prologue
    .line 893
    invoke-virtual {p0, p1, p2}, Ljavassist/bytecode/StackMapTable$Shifter;->update(II)V

    .line 894
    return-void
.end method

.method public doit()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 845
    invoke-virtual {p0}, Ljavassist/bytecode/StackMapTable$Shifter;->parse()V

    .line 846
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$Shifter;->updatedInfo:[B

    if-eqz v0, :cond_e

    .line 847
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$Shifter;->stackMap:Ljavassist/bytecode/StackMapTable;

    iget-object v1, p0, Ljavassist/bytecode/StackMapTable$Shifter;->updatedInfo:[B

    invoke-virtual {v0, v1}, Ljavassist/bytecode/StackMapTable;->set([B)V

    .line 848
    :cond_e
    return-void
.end method

.method public fullFrame(II[I[I[I[I)V
    .registers 7
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "localTags"    # [I
    .param p4, "localData"    # [I
    .param p5, "stackTags"    # [I
    .param p6, "stackData"    # [I

    .prologue
    .line 902
    invoke-virtual {p0, p1, p2}, Ljavassist/bytecode/StackMapTable$Shifter;->update(II)V

    .line 903
    return-void
.end method

.method public sameFrame(II)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I

    .prologue
    .line 851
    const/4 v0, 0x0

    const/16 v1, 0xfb

    invoke-virtual {p0, p1, p2, v0, v1}, Ljavassist/bytecode/StackMapTable$Shifter;->update(IIII)V

    .line 852
    return-void
.end method

.method public sameLocals(IIII)V
    .registers 7
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "stackTag"    # I
    .param p4, "stackData"    # I

    .prologue
    .line 855
    const/16 v0, 0x40

    const/16 v1, 0xf7

    invoke-virtual {p0, p1, p2, v0, v1}, Ljavassist/bytecode/StackMapTable$Shifter;->update(IIII)V

    .line 856
    return-void
.end method

.method update(II)V
    .registers 10
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 906
    iget v2, p0, Ljavassist/bytecode/StackMapTable$Shifter;->position:I

    .line 907
    .local v2, "oldPos":I
    add-int v6, v2, p2

    if-nez v2, :cond_30

    move v3, v4

    :goto_9
    add-int/2addr v3, v6

    iput v3, p0, Ljavassist/bytecode/StackMapTable$Shifter;->position:I

    .line 909
    iget-boolean v3, p0, Ljavassist/bytecode/StackMapTable$Shifter;->exclusive:Z

    if-eqz v3, :cond_34

    .line 910
    iget v3, p0, Ljavassist/bytecode/StackMapTable$Shifter;->where:I

    if-ge v2, v3, :cond_32

    iget v3, p0, Ljavassist/bytecode/StackMapTable$Shifter;->where:I

    iget v6, p0, Ljavassist/bytecode/StackMapTable$Shifter;->position:I

    if-gt v3, v6, :cond_32

    move v0, v5

    .line 914
    .local v0, "match":Z
    :goto_1b
    if-eqz v0, :cond_2f

    .line 915
    iget v3, p0, Ljavassist/bytecode/StackMapTable$Shifter;->gap:I

    add-int v1, p2, v3

    .line 916
    .local v1, "newDelta":I
    iget-object v3, p0, Ljavassist/bytecode/StackMapTable$Shifter;->info:[B

    add-int/lit8 v4, p1, 0x1

    invoke-static {v1, v3, v4}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 917
    iget v3, p0, Ljavassist/bytecode/StackMapTable$Shifter;->position:I

    iget v4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->gap:I

    add-int/2addr v3, v4

    iput v3, p0, Ljavassist/bytecode/StackMapTable$Shifter;->position:I

    .line 919
    .end local v1    # "newDelta":I
    :cond_2f
    return-void

    .end local v0    # "match":Z
    :cond_30
    move v3, v5

    .line 907
    goto :goto_9

    :cond_32
    move v0, v4

    .line 910
    goto :goto_1b

    .line 912
    :cond_34
    iget v3, p0, Ljavassist/bytecode/StackMapTable$Shifter;->where:I

    if-gt v2, v3, :cond_40

    iget v3, p0, Ljavassist/bytecode/StackMapTable$Shifter;->where:I

    iget v6, p0, Ljavassist/bytecode/StackMapTable$Shifter;->position:I

    if-ge v3, v6, :cond_40

    move v0, v5

    .restart local v0    # "match":Z
    :goto_3f
    goto :goto_1b

    .end local v0    # "match":Z
    :cond_40
    move v0, v4

    goto :goto_3f
.end method

.method update(IIII)V
    .registers 14
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "base"    # I
    .param p4, "entry"    # I

    .prologue
    const/16 v8, 0x40

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 859
    iget v3, p0, Ljavassist/bytecode/StackMapTable$Shifter;->position:I

    .line 860
    .local v3, "oldPos":I
    add-int v7, v3, p2

    if-nez v3, :cond_34

    move v4, v5

    :goto_b
    add-int/2addr v4, v7

    iput v4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->position:I

    .line 862
    iget-boolean v4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->exclusive:Z

    if-eqz v4, :cond_38

    .line 863
    iget v4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->where:I

    if-ge v3, v4, :cond_36

    iget v4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->where:I

    iget v7, p0, Ljavassist/bytecode/StackMapTable$Shifter;->position:I

    if-gt v4, v7, :cond_36

    move v0, v6

    .line 867
    .local v0, "match":Z
    :goto_1d
    if-eqz v0, :cond_33

    .line 868
    iget v4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->gap:I

    add-int v1, p2, v4

    .line 869
    .local v1, "newDelta":I
    iget v4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->position:I

    iget v5, p0, Ljavassist/bytecode/StackMapTable$Shifter;->gap:I

    add-int/2addr v4, v5

    iput v4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->position:I

    .line 870
    if-ge v1, v8, :cond_46

    .line 871
    iget-object v4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->info:[B

    add-int v5, v1, p3

    int-to-byte v5, v5

    aput-byte v5, v4, p1

    .line 881
    .end local v1    # "newDelta":I
    :cond_33
    :goto_33
    return-void

    .end local v0    # "match":Z
    :cond_34
    move v4, v6

    .line 860
    goto :goto_b

    :cond_36
    move v0, v5

    .line 863
    goto :goto_1d

    .line 865
    :cond_38
    iget v4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->where:I

    if-gt v3, v4, :cond_44

    iget v4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->where:I

    iget v7, p0, Ljavassist/bytecode/StackMapTable$Shifter;->position:I

    if-ge v4, v7, :cond_44

    move v0, v6

    .restart local v0    # "match":Z
    :goto_43
    goto :goto_1d

    .end local v0    # "match":Z
    :cond_44
    move v0, v5

    goto :goto_43

    .line 872
    .restart local v0    # "match":Z
    .restart local v1    # "newDelta":I
    :cond_46
    if-ge p2, v8, :cond_5a

    .line 873
    iget-object v4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->info:[B

    const/4 v5, 0x2

    invoke-static {v4, p1, v5}, Ljavassist/bytecode/StackMapTable$Shifter;->insertGap([BII)[B

    move-result-object v2

    .line 874
    .local v2, "newinfo":[B
    int-to-byte v4, p4

    aput-byte v4, v2, p1

    .line 875
    add-int/lit8 v4, p1, 0x1

    invoke-static {v1, v2, v4}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 876
    iput-object v2, p0, Ljavassist/bytecode/StackMapTable$Shifter;->updatedInfo:[B

    goto :goto_33

    .line 879
    .end local v2    # "newinfo":[B
    :cond_5a
    iget-object v4, p0, Ljavassist/bytecode/StackMapTable$Shifter;->info:[B

    add-int/lit8 v5, p1, 0x1

    invoke-static {v1, v4, v5}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    goto :goto_33
.end method
