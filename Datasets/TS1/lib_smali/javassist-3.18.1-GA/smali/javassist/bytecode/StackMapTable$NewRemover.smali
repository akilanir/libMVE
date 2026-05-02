.class Ljavassist/bytecode/StackMapTable$NewRemover;
.super Ljavassist/bytecode/StackMapTable$SimpleCopy;
.source "StackMapTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/StackMapTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NewRemover"
.end annotation


# instance fields
.field posOfNew:I


# direct methods
.method public constructor <init>([BI)V
    .registers 3
    .param p1, "data"    # [B
    .param p2, "pos"    # I

    .prologue
    .line 1012
    invoke-direct {p0, p1}, Ljavassist/bytecode/StackMapTable$SimpleCopy;-><init>([B)V

    .line 1013
    iput p2, p0, Ljavassist/bytecode/StackMapTable$NewRemover;->posOfNew:I

    .line 1014
    return-void
.end method


# virtual methods
.method public fullFrame(II[I[I[I[I)V
    .registers 16
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "localTags"    # [I
    .param p4, "localData"    # [I
    .param p5, "stackTags"    # [I
    .param p6, "stackData"    # [I

    .prologue
    .line 1025
    array-length v7, p5

    add-int/lit8 v4, v7, -0x1

    .line 1026
    .local v4, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    if-ge v0, v4, :cond_47

    .line 1027
    aget v7, p5, v0

    const/16 v8, 0x8

    if-ne v7, v8, :cond_4b

    aget v7, p6, v0

    iget v8, p0, Ljavassist/bytecode/StackMapTable$NewRemover;->posOfNew:I

    if-ne v7, v8, :cond_4b

    add-int/lit8 v7, v0, 0x1

    aget v7, p5, v7

    const/16 v8, 0x8

    if-ne v7, v8, :cond_4b

    add-int/lit8 v7, v0, 0x1

    aget v7, p6, v7

    iget v8, p0, Ljavassist/bytecode/StackMapTable$NewRemover;->posOfNew:I

    if-ne v7, v8, :cond_4b

    .line 1029
    add-int/lit8 v4, v4, 0x1

    .line 1030
    add-int/lit8 v7, v4, -0x2

    new-array v6, v7, [I

    .line 1031
    .local v6, "stackTags2":[I
    add-int/lit8 v7, v4, -0x2

    new-array v5, v7, [I

    .line 1032
    .local v5, "stackData2":[I
    const/4 v2, 0x0

    .line 1033
    .local v2, "k":I
    const/4 v1, 0x0

    .local v1, "j":I
    move v3, v2

    .end local v2    # "k":I
    .local v3, "k":I
    :goto_2f
    if-ge v1, v4, :cond_45

    .line 1034
    if-ne v1, v0, :cond_3a

    .line 1035
    add-int/lit8 v1, v1, 0x1

    move v2, v3

    .line 1033
    .end local v3    # "k":I
    .restart local v2    # "k":I
    :goto_36
    add-int/lit8 v1, v1, 0x1

    move v3, v2

    .end local v2    # "k":I
    .restart local v3    # "k":I
    goto :goto_2f

    .line 1037
    :cond_3a
    aget v7, p5, v1

    aput v7, v6, v3

    .line 1038
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "k":I
    .restart local v2    # "k":I
    aget v7, p6, v1

    aput v7, v5, v3

    goto :goto_36

    .line 1041
    .end local v2    # "k":I
    .restart local v3    # "k":I
    :cond_45
    move-object p5, v6

    .line 1042
    move-object p6, v5

    .line 1046
    .end local v1    # "j":I
    .end local v3    # "k":I
    .end local v5    # "stackData2":[I
    .end local v6    # "stackTags2":[I
    :cond_47
    invoke-super/range {p0 .. p6}, Ljavassist/bytecode/StackMapTable$SimpleCopy;->fullFrame(II[I[I[I[I)V

    .line 1047
    return-void

    .line 1026
    :cond_4b
    add-int/lit8 v0, v0, 0x1

    goto :goto_4
.end method

.method public sameLocals(IIII)V
    .registers 6
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "stackTag"    # I
    .param p4, "stackData"    # I

    .prologue
    .line 1017
    const/16 v0, 0x8

    if-ne p3, v0, :cond_c

    iget v0, p0, Ljavassist/bytecode/StackMapTable$NewRemover;->posOfNew:I

    if-ne p4, v0, :cond_c

    .line 1018
    invoke-super {p0, p1, p2}, Ljavassist/bytecode/StackMapTable$SimpleCopy;->sameFrame(II)V

    .line 1021
    :goto_b
    return-void

    .line 1020
    :cond_c
    invoke-super {p0, p1, p2, p3, p4}, Ljavassist/bytecode/StackMapTable$SimpleCopy;->sameLocals(IIII)V

    goto :goto_b
.end method
