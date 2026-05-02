.class public final Lorg/spongycastle/util/Arrays;
.super Ljava/lang/Object;
.source "Arrays.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/util/Arrays$Iterator;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method

.method public static append([BB)[B
    .registers 6
    .param p0, "a"    # [B
    .param p1, "b"    # B

    .prologue
    const/4 v3, 0x0

    .line 839
    if-nez p0, :cond_9

    .line 841
    const/4 v2, 0x1

    new-array v1, v2, [B

    aput-byte p1, v1, v3

    .line 848
    :goto_8
    return-object v1

    .line 844
    :cond_9
    array-length v0, p0

    .line 845
    .local v0, "length":I
    add-int/lit8 v2, v0, 0x1

    new-array v1, v2, [B

    .line 846
    .local v1, "result":[B
    invoke-static {p0, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 847
    aput-byte p1, v1, v0

    goto :goto_8
.end method

.method public static append([II)[I
    .registers 6
    .param p0, "a"    # [I
    .param p1, "b"    # I

    .prologue
    const/4 v3, 0x0

    .line 867
    if-nez p0, :cond_9

    .line 869
    const/4 v2, 0x1

    new-array v1, v2, [I

    aput p1, v1, v3

    .line 876
    :goto_8
    return-object v1

    .line 872
    :cond_9
    array-length v0, p0

    .line 873
    .local v0, "length":I
    add-int/lit8 v2, v0, 0x1

    new-array v1, v2, [I

    .line 874
    .local v1, "result":[I
    invoke-static {p0, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 875
    aput p1, v1, v0

    goto :goto_8
.end method

.method public static append([SS)[S
    .registers 6
    .param p0, "a"    # [S
    .param p1, "b"    # S

    .prologue
    const/4 v3, 0x0

    .line 853
    if-nez p0, :cond_9

    .line 855
    const/4 v2, 0x1

    new-array v1, v2, [S

    aput-short p1, v1, v3

    .line 862
    :goto_8
    return-object v1

    .line 858
    :cond_9
    array-length v0, p0

    .line 859
    .local v0, "length":I
    add-int/lit8 v2, v0, 0x1

    new-array v1, v2, [S

    .line 860
    .local v1, "result":[S
    invoke-static {p0, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 861
    aput-short p1, v1, v0

    goto :goto_8
.end method

.method public static areEqual([B[B)Z
    .registers 7
    .param p0, "a"    # [B
    .param p1, "b"    # [B

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 80
    if-ne p0, p1, :cond_5

    .line 103
    :cond_4
    :goto_4
    return v1

    .line 85
    :cond_5
    if-eqz p0, :cond_9

    if-nez p1, :cond_b

    :cond_9
    move v1, v2

    .line 87
    goto :goto_4

    .line 90
    :cond_b
    array-length v3, p0

    array-length v4, p1

    if-eq v3, v4, :cond_11

    move v1, v2

    .line 92
    goto :goto_4

    .line 95
    :cond_11
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    array-length v3, p0

    if-eq v0, v3, :cond_4

    .line 97
    aget-byte v3, p0, v0

    aget-byte v4, p1, v0

    if-eq v3, v4, :cond_1d

    move v1, v2

    .line 99
    goto :goto_4

    .line 95
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_12
.end method

.method public static areEqual([C[C)Z
    .registers 7
    .param p0, "a"    # [C
    .param p1, "b"    # [C

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 50
    if-ne p0, p1, :cond_5

    .line 73
    :cond_4
    :goto_4
    return v1

    .line 55
    :cond_5
    if-eqz p0, :cond_9

    if-nez p1, :cond_b

    :cond_9
    move v1, v2

    .line 57
    goto :goto_4

    .line 60
    :cond_b
    array-length v3, p0

    array-length v4, p1

    if-eq v3, v4, :cond_11

    move v1, v2

    .line 62
    goto :goto_4

    .line 65
    :cond_11
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    array-length v3, p0

    if-eq v0, v3, :cond_4

    .line 67
    aget-char v3, p0, v0

    aget-char v4, p1, v0

    if-eq v3, v4, :cond_1d

    move v1, v2

    .line 69
    goto :goto_4

    .line 65
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_12
.end method

.method public static areEqual([I[I)Z
    .registers 7
    .param p0, "a"    # [I
    .param p1, "b"    # [I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 147
    if-ne p0, p1, :cond_5

    .line 170
    :cond_4
    :goto_4
    return v1

    .line 152
    :cond_5
    if-eqz p0, :cond_9

    if-nez p1, :cond_b

    :cond_9
    move v1, v2

    .line 154
    goto :goto_4

    .line 157
    :cond_b
    array-length v3, p0

    array-length v4, p1

    if-eq v3, v4, :cond_11

    move v1, v2

    .line 159
    goto :goto_4

    .line 162
    :cond_11
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    array-length v3, p0

    if-eq v0, v3, :cond_4

    .line 164
    aget v3, p0, v0

    aget v4, p1, v0

    if-eq v3, v4, :cond_1d

    move v1, v2

    .line 166
    goto :goto_4

    .line 162
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_12
.end method

.method public static areEqual([J[J)Z
    .registers 9
    .param p0, "a"    # [J
    .param p1, "b"    # [J

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 177
    if-ne p0, p1, :cond_5

    .line 200
    :cond_4
    :goto_4
    return v1

    .line 182
    :cond_5
    if-eqz p0, :cond_9

    if-nez p1, :cond_b

    :cond_9
    move v1, v2

    .line 184
    goto :goto_4

    .line 187
    :cond_b
    array-length v3, p0

    array-length v4, p1

    if-eq v3, v4, :cond_11

    move v1, v2

    .line 189
    goto :goto_4

    .line 192
    :cond_11
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    array-length v3, p0

    if-eq v0, v3, :cond_4

    .line 194
    aget-wide v3, p0, v0

    aget-wide v5, p1, v0

    cmp-long v3, v3, v5

    if-eqz v3, :cond_1f

    move v1, v2

    .line 196
    goto :goto_4

    .line 192
    :cond_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_12
.end method

.method public static areEqual([Ljava/lang/Object;[Ljava/lang/Object;)Z
    .registers 9
    .param p0, "a"    # [Ljava/lang/Object;
    .param p1, "b"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 205
    if-ne p0, p1, :cond_5

    .line 232
    :cond_4
    :goto_4
    return v3

    .line 209
    :cond_5
    if-eqz p0, :cond_9

    if-nez p1, :cond_b

    :cond_9
    move v3, v4

    .line 211
    goto :goto_4

    .line 213
    :cond_b
    array-length v5, p0

    array-length v6, p1

    if-eq v5, v6, :cond_11

    move v3, v4

    .line 215
    goto :goto_4

    .line 217
    :cond_11
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    array-length v5, p0

    if-eq v0, v5, :cond_4

    .line 219
    aget-object v1, p0, v0

    .local v1, "objA":Ljava/lang/Object;
    aget-object v2, p1, v0

    .line 220
    .local v2, "objB":Ljava/lang/Object;
    if-nez v1, :cond_1f

    .line 222
    if-eqz v2, :cond_27

    move v3, v4

    .line 224
    goto :goto_4

    .line 227
    :cond_1f
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_27

    move v3, v4

    .line 229
    goto :goto_4

    .line 217
    :cond_27
    add-int/lit8 v0, v0, 0x1

    goto :goto_12
.end method

.method public static areEqual([Z[Z)Z
    .registers 7
    .param p0, "a"    # [Z
    .param p1, "b"    # [Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 20
    if-ne p0, p1, :cond_5

    .line 43
    :cond_4
    :goto_4
    return v1

    .line 25
    :cond_5
    if-eqz p0, :cond_9

    if-nez p1, :cond_b

    :cond_9
    move v1, v2

    .line 27
    goto :goto_4

    .line 30
    :cond_b
    array-length v3, p0

    array-length v4, p1

    if-eq v3, v4, :cond_11

    move v1, v2

    .line 32
    goto :goto_4

    .line 35
    :cond_11
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    array-length v3, p0

    if-eq v0, v3, :cond_4

    .line 37
    aget-boolean v3, p0, v0

    aget-boolean v4, p1, v0

    if-eq v3, v4, :cond_1d

    move v1, v2

    .line 39
    goto :goto_4

    .line 35
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_12
.end method

.method public static clone([B)[B
    .registers 4
    .param p0, "data"    # [B

    .prologue
    const/4 v2, 0x0

    .line 524
    if-nez p0, :cond_5

    .line 526
    const/4 v0, 0x0

    .line 532
    :goto_4
    return-object v0

    .line 528
    :cond_5
    array-length v1, p0

    new-array v0, v1, [B

    .line 530
    .local v0, "copy":[B
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4
.end method

.method public static clone([B[B)[B
    .registers 5
    .param p0, "data"    # [B
    .param p1, "existing"    # [B

    .prologue
    const/4 v2, 0x0

    .line 550
    if-nez p0, :cond_5

    .line 552
    const/4 p1, 0x0

    .line 559
    .end local p1    # "existing":[B
    :goto_4
    return-object p1

    .line 554
    .restart local p1    # "existing":[B
    :cond_5
    if-eqz p1, :cond_b

    array-length v0, p1

    array-length v1, p0

    if-eq v0, v1, :cond_10

    .line 556
    :cond_b
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object p1

    goto :goto_4

    .line 558
    :cond_10
    array-length v0, p1

    invoke-static {p0, v2, p1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4
.end method

.method public static clone([C)[C
    .registers 4
    .param p0, "data"    # [C

    .prologue
    const/4 v2, 0x0

    .line 537
    if-nez p0, :cond_5

    .line 539
    const/4 v0, 0x0

    .line 545
    :goto_4
    return-object v0

    .line 541
    :cond_5
    array-length v1, p0

    new-array v0, v1, [C

    .line 543
    .local v0, "copy":[C
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4
.end method

.method public static clone([I)[I
    .registers 4
    .param p0, "data"    # [I

    .prologue
    const/4 v2, 0x0

    .line 598
    if-nez p0, :cond_5

    .line 600
    const/4 v0, 0x0

    .line 606
    :goto_4
    return-object v0

    .line 602
    :cond_5
    array-length v1, p0

    new-array v0, v1, [I

    .line 604
    .local v0, "copy":[I
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4
.end method

.method public static clone([J)[J
    .registers 4
    .param p0, "data"    # [J

    .prologue
    const/4 v2, 0x0

    .line 611
    if-nez p0, :cond_5

    .line 613
    const/4 v0, 0x0

    .line 619
    :goto_4
    return-object v0

    .line 615
    :cond_5
    array-length v1, p0

    new-array v0, v1, [J

    .line 617
    .local v0, "copy":[J
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4
.end method

.method public static clone([J[J)[J
    .registers 5
    .param p0, "data"    # [J
    .param p1, "existing"    # [J

    .prologue
    const/4 v2, 0x0

    .line 624
    if-nez p0, :cond_5

    .line 626
    const/4 p1, 0x0

    .line 633
    .end local p1    # "existing":[J
    :goto_4
    return-object p1

    .line 628
    .restart local p1    # "existing":[J
    :cond_5
    if-eqz p1, :cond_b

    array-length v0, p1

    array-length v1, p0

    if-eq v0, v1, :cond_10

    .line 630
    :cond_b
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([J)[J

    move-result-object p1

    goto :goto_4

    .line 632
    :cond_10
    array-length v0, p1

    invoke-static {p0, v2, p1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4
.end method

.method public static clone([Ljava/math/BigInteger;)[Ljava/math/BigInteger;
    .registers 4
    .param p0, "data"    # [Ljava/math/BigInteger;

    .prologue
    const/4 v2, 0x0

    .line 651
    if-nez p0, :cond_5

    .line 653
    const/4 v0, 0x0

    .line 659
    :goto_4
    return-object v0

    .line 655
    :cond_5
    array-length v1, p0

    new-array v0, v1, [Ljava/math/BigInteger;

    .line 657
    .local v0, "copy":[Ljava/math/BigInteger;
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4
.end method

.method public static clone([S)[S
    .registers 4
    .param p0, "data"    # [S

    .prologue
    const/4 v2, 0x0

    .line 638
    if-nez p0, :cond_5

    .line 640
    const/4 v0, 0x0

    .line 646
    :goto_4
    return-object v0

    .line 642
    :cond_5
    array-length v1, p0

    new-array v0, v1, [S

    .line 644
    .local v0, "copy":[S
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4
.end method

.method public static clone([[B)[[B
    .registers 4
    .param p0, "data"    # [[B

    .prologue
    .line 564
    if-nez p0, :cond_6

    .line 566
    const/4 v2, 0x0

    check-cast v2, [[B

    .line 576
    :goto_5
    return-object v2

    .line 569
    :cond_6
    array-length v2, p0

    new-array v0, v2, [[B

    .line 571
    .local v0, "copy":[[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    array-length v2, v0

    if-eq v1, v2, :cond_18

    .line 573
    aget-object v2, p0, v1

    invoke-static {v2}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v2

    aput-object v2, v0, v1

    .line 571
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_18
    move-object v2, v0

    .line 576
    goto :goto_5
.end method

.method public static clone([[[B)[[[B
    .registers 4
    .param p0, "data"    # [[[B

    .prologue
    .line 581
    if-nez p0, :cond_6

    .line 583
    const/4 v2, 0x0

    check-cast v2, [[[B

    .line 593
    :goto_5
    return-object v2

    .line 586
    :cond_6
    array-length v2, p0

    new-array v0, v2, [[[B

    .line 588
    .local v0, "copy":[[[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    array-length v2, v0

    if-eq v1, v2, :cond_18

    .line 590
    aget-object v2, p0, v1

    invoke-static {v2}, Lorg/spongycastle/util/Arrays;->clone([[B)[[B

    move-result-object v2

    aput-object v2, v0, v1

    .line 588
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_18
    move-object v2, v0

    .line 593
    goto :goto_5
.end method

.method public static concatenate([B[B)[B
    .registers 6
    .param p0, "a"    # [B
    .param p1, "b"    # [B

    .prologue
    const/4 v3, 0x0

    .line 881
    if-eqz p0, :cond_14

    if-eqz p1, :cond_14

    .line 883
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [B

    .line 885
    .local v0, "rv":[B
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 886
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 896
    .end local v0    # "rv":[B
    :goto_13
    return-object v0

    .line 890
    :cond_14
    if-eqz p1, :cond_1b

    .line 892
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    goto :goto_13

    .line 896
    :cond_1b
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    goto :goto_13
.end method

.method public static concatenate([B[B[B)[B
    .registers 7
    .param p0, "a"    # [B
    .param p1, "b"    # [B
    .param p2, "c"    # [B

    .prologue
    const/4 v3, 0x0

    .line 902
    if-eqz p0, :cond_1f

    if-eqz p1, :cond_1f

    if-eqz p2, :cond_1f

    .line 904
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    array-length v2, p2

    add-int/2addr v1, v2

    new-array v0, v1, [B

    .line 906
    .local v0, "rv":[B
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 907
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 908
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    array-length v2, p2

    invoke-static {p2, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 922
    .end local v0    # "rv":[B
    :goto_1e
    return-object v0

    .line 912
    :cond_1f
    if-nez p0, :cond_26

    .line 914
    invoke-static {p1, p2}, Lorg/spongycastle/util/Arrays;->concatenate([B[B)[B

    move-result-object v0

    goto :goto_1e

    .line 916
    :cond_26
    if-nez p1, :cond_2d

    .line 918
    invoke-static {p0, p2}, Lorg/spongycastle/util/Arrays;->concatenate([B[B)[B

    move-result-object v0

    goto :goto_1e

    .line 922
    :cond_2d
    invoke-static {p0, p1}, Lorg/spongycastle/util/Arrays;->concatenate([B[B)[B

    move-result-object v0

    goto :goto_1e
.end method

.method public static concatenate([B[B[B[B)[B
    .registers 8
    .param p0, "a"    # [B
    .param p1, "b"    # [B
    .param p2, "c"    # [B
    .param p3, "d"    # [B

    .prologue
    const/4 v3, 0x0

    .line 928
    if-eqz p0, :cond_2c

    if-eqz p1, :cond_2c

    if-eqz p2, :cond_2c

    if-eqz p3, :cond_2c

    .line 930
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    array-length v2, p2

    add-int/2addr v1, v2

    array-length v2, p3

    add-int/2addr v1, v2

    new-array v0, v1, [B

    .line 932
    .local v0, "rv":[B
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 933
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 934
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    array-length v2, p2

    invoke-static {p2, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 935
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    array-length v2, p2

    add-int/2addr v1, v2

    array-length v2, p3

    invoke-static {p3, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 953
    .end local v0    # "rv":[B
    :goto_2b
    return-object v0

    .line 939
    :cond_2c
    if-nez p3, :cond_33

    .line 941
    invoke-static {p0, p1, p2}, Lorg/spongycastle/util/Arrays;->concatenate([B[B[B)[B

    move-result-object v0

    goto :goto_2b

    .line 943
    :cond_33
    if-nez p2, :cond_3a

    .line 945
    invoke-static {p0, p1, p3}, Lorg/spongycastle/util/Arrays;->concatenate([B[B[B)[B

    move-result-object v0

    goto :goto_2b

    .line 947
    :cond_3a
    if-nez p1, :cond_41

    .line 949
    invoke-static {p0, p2, p3}, Lorg/spongycastle/util/Arrays;->concatenate([B[B[B)[B

    move-result-object v0

    goto :goto_2b

    .line 953
    :cond_41
    invoke-static {p1, p2, p3}, Lorg/spongycastle/util/Arrays;->concatenate([B[B[B)[B

    move-result-object v0

    goto :goto_2b
.end method

.method public static concatenate([I[I)[I
    .registers 6
    .param p0, "a"    # [I
    .param p1, "b"    # [I

    .prologue
    const/4 v3, 0x0

    .line 959
    if-nez p0, :cond_8

    .line 961
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    move-result-object v0

    .line 971
    :goto_7
    return-object v0

    .line 963
    :cond_8
    if-nez p1, :cond_f

    .line 965
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    move-result-object v0

    goto :goto_7

    .line 968
    :cond_f
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [I

    .line 969
    .local v0, "c":[I
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 970
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_7
.end method

.method public static constantTimeAreEqual([B[B)Z
    .registers 8
    .param p0, "a"    # [B
    .param p1, "b"    # [B

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 118
    if-ne p0, p1, :cond_5

    .line 140
    :cond_4
    :goto_4
    return v2

    .line 123
    :cond_5
    if-eqz p0, :cond_9

    if-nez p1, :cond_b

    :cond_9
    move v2, v3

    .line 125
    goto :goto_4

    .line 128
    :cond_b
    array-length v4, p0

    array-length v5, p1

    if-eq v4, v5, :cond_11

    move v2, v3

    .line 130
    goto :goto_4

    .line 133
    :cond_11
    const/4 v1, 0x0

    .line 135
    .local v1, "nonEqual":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    array-length v4, p0

    if-eq v0, v4, :cond_1f

    .line 137
    aget-byte v4, p0, v0

    aget-byte v5, p1, v0

    xor-int/2addr v4, v5

    or-int/2addr v1, v4

    .line 135
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 140
    :cond_1f
    if-eqz v1, :cond_4

    move v2, v3

    goto :goto_4
.end method

.method public static contains([II)Z
    .registers 4
    .param p0, "a"    # [I
    .param p1, "n"    # I

    .prologue
    .line 249
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_d

    .line 251
    aget v1, p0, v0

    if-ne v1, p1, :cond_a

    .line 253
    const/4 v1, 0x1

    .line 256
    :goto_9
    return v1

    .line 249
    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 256
    :cond_d
    const/4 v1, 0x0

    goto :goto_9
.end method

.method public static contains([SS)Z
    .registers 4
    .param p0, "a"    # [S
    .param p1, "n"    # S

    .prologue
    .line 237
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_d

    .line 239
    aget-short v1, p0, v0

    if-ne v1, p1, :cond_a

    .line 241
    const/4 v1, 0x1

    .line 244
    :goto_9
    return v1

    .line 237
    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 244
    :cond_d
    const/4 v1, 0x0

    goto :goto_9
.end method

.method public static copyOf([BI)[B
    .registers 5
    .param p0, "data"    # [B
    .param p1, "newLength"    # I

    .prologue
    const/4 v2, 0x0

    .line 664
    new-array v0, p1, [B

    .line 666
    .local v0, "tmp":[B
    array-length v1, p0

    if-ge p1, v1, :cond_a

    .line 668
    invoke-static {p0, v2, v0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 675
    :goto_9
    return-object v0

    .line 672
    :cond_a
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_9
.end method

.method public static copyOf([CI)[C
    .registers 5
    .param p0, "data"    # [C
    .param p1, "newLength"    # I

    .prologue
    const/4 v2, 0x0

    .line 680
    new-array v0, p1, [C

    .line 682
    .local v0, "tmp":[C
    array-length v1, p0

    if-ge p1, v1, :cond_a

    .line 684
    invoke-static {p0, v2, v0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 691
    :goto_9
    return-object v0

    .line 688
    :cond_a
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_9
.end method

.method public static copyOf([II)[I
    .registers 5
    .param p0, "data"    # [I
    .param p1, "newLength"    # I

    .prologue
    const/4 v2, 0x0

    .line 696
    new-array v0, p1, [I

    .line 698
    .local v0, "tmp":[I
    array-length v1, p0

    if-ge p1, v1, :cond_a

    .line 700
    invoke-static {p0, v2, v0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 707
    :goto_9
    return-object v0

    .line 704
    :cond_a
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_9
.end method

.method public static copyOf([JI)[J
    .registers 5
    .param p0, "data"    # [J
    .param p1, "newLength"    # I

    .prologue
    const/4 v2, 0x0

    .line 712
    new-array v0, p1, [J

    .line 714
    .local v0, "tmp":[J
    array-length v1, p0

    if-ge p1, v1, :cond_a

    .line 716
    invoke-static {p0, v2, v0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 723
    :goto_9
    return-object v0

    .line 720
    :cond_a
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_9
.end method

.method public static copyOf([Ljava/math/BigInteger;I)[Ljava/math/BigInteger;
    .registers 5
    .param p0, "data"    # [Ljava/math/BigInteger;
    .param p1, "newLength"    # I

    .prologue
    const/4 v2, 0x0

    .line 728
    new-array v0, p1, [Ljava/math/BigInteger;

    .line 730
    .local v0, "tmp":[Ljava/math/BigInteger;
    array-length v1, p0

    if-ge p1, v1, :cond_a

    .line 732
    invoke-static {p0, v2, v0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 739
    :goto_9
    return-object v0

    .line 736
    :cond_a
    array-length v1, p0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_9
.end method

.method public static copyOfRange([BII)[B
    .registers 7
    .param p0, "data"    # [B
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    const/4 v3, 0x0

    .line 755
    invoke-static {p1, p2}, Lorg/spongycastle/util/Arrays;->getLength(II)I

    move-result v0

    .line 757
    .local v0, "newLength":I
    new-array v1, v0, [B

    .line 759
    .local v1, "tmp":[B
    array-length v2, p0

    sub-int/2addr v2, p1

    if-ge v2, v0, :cond_11

    .line 761
    array-length v2, p0

    sub-int/2addr v2, p1

    invoke-static {p0, p1, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 768
    :goto_10
    return-object v1

    .line 765
    :cond_11
    invoke-static {p0, p1, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_10
.end method

.method public static copyOfRange([III)[I
    .registers 7
    .param p0, "data"    # [I
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    const/4 v3, 0x0

    .line 773
    invoke-static {p1, p2}, Lorg/spongycastle/util/Arrays;->getLength(II)I

    move-result v0

    .line 775
    .local v0, "newLength":I
    new-array v1, v0, [I

    .line 777
    .local v1, "tmp":[I
    array-length v2, p0

    sub-int/2addr v2, p1

    if-ge v2, v0, :cond_11

    .line 779
    array-length v2, p0

    sub-int/2addr v2, p1

    invoke-static {p0, p1, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 786
    :goto_10
    return-object v1

    .line 783
    :cond_11
    invoke-static {p0, p1, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_10
.end method

.method public static copyOfRange([JII)[J
    .registers 7
    .param p0, "data"    # [J
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    const/4 v3, 0x0

    .line 791
    invoke-static {p1, p2}, Lorg/spongycastle/util/Arrays;->getLength(II)I

    move-result v0

    .line 793
    .local v0, "newLength":I
    new-array v1, v0, [J

    .line 795
    .local v1, "tmp":[J
    array-length v2, p0

    sub-int/2addr v2, p1

    if-ge v2, v0, :cond_11

    .line 797
    array-length v2, p0

    sub-int/2addr v2, p1

    invoke-static {p0, p1, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 804
    :goto_10
    return-object v1

    .line 801
    :cond_11
    invoke-static {p0, p1, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_10
.end method

.method public static copyOfRange([Ljava/math/BigInteger;II)[Ljava/math/BigInteger;
    .registers 7
    .param p0, "data"    # [Ljava/math/BigInteger;
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    const/4 v3, 0x0

    .line 809
    invoke-static {p1, p2}, Lorg/spongycastle/util/Arrays;->getLength(II)I

    move-result v0

    .line 811
    .local v0, "newLength":I
    new-array v1, v0, [Ljava/math/BigInteger;

    .line 813
    .local v1, "tmp":[Ljava/math/BigInteger;
    array-length v2, p0

    sub-int/2addr v2, p1

    if-ge v2, v0, :cond_11

    .line 815
    array-length v2, p0

    sub-int/2addr v2, p1

    invoke-static {p0, p1, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 822
    :goto_10
    return-object v1

    .line 819
    :cond_11
    invoke-static {p0, p1, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_10
.end method

.method public static fill([BB)V
    .registers 4
    .param p0, "array"    # [B
    .param p1, "value"    # B

    .prologue
    .line 263
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_9

    .line 265
    aput-byte p1, p0, v0

    .line 263
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 267
    :cond_9
    return-void
.end method

.method public static fill([CC)V
    .registers 4
    .param p0, "array"    # [C
    .param p1, "value"    # C

    .prologue
    .line 273
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_9

    .line 275
    aput-char p1, p0, v0

    .line 273
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 277
    :cond_9
    return-void
.end method

.method public static fill([II)V
    .registers 4
    .param p0, "array"    # [I
    .param p1, "value"    # I

    .prologue
    .line 303
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_9

    .line 305
    aput p1, p0, v0

    .line 303
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 307
    :cond_9
    return-void
.end method

.method public static fill([JJ)V
    .registers 5
    .param p0, "array"    # [J
    .param p1, "value"    # J

    .prologue
    .line 283
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_9

    .line 285
    aput-wide p1, p0, v0

    .line 283
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 287
    :cond_9
    return-void
.end method

.method public static fill([SS)V
    .registers 4
    .param p0, "array"    # [S
    .param p1, "value"    # S

    .prologue
    .line 293
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_9

    .line 295
    aput-short p1, p0, v0

    .line 293
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 297
    :cond_9
    return-void
.end method

.method private static getLength(II)I
    .registers 6
    .param p0, "from"    # I
    .param p1, "to"    # I

    .prologue
    .line 827
    sub-int v0, p1, p0

    .line 828
    .local v0, "newLength":I
    if-gez v0, :cond_1c

    .line 830
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1, p0}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 831
    .local v1, "sb":Ljava/lang/StringBuffer;
    const-string v2, " > "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 832
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 834
    .end local v1    # "sb":Ljava/lang/StringBuffer;
    :cond_1c
    return v0
.end method

.method public static hashCode([B)I
    .registers 4
    .param p0, "data"    # [B

    .prologue
    .line 311
    if-nez p0, :cond_4

    .line 313
    const/4 v0, 0x0

    .line 325
    :cond_3
    return v0

    .line 316
    :cond_4
    array-length v1, p0

    .line 317
    .local v1, "i":I
    add-int/lit8 v0, v1, 0x1

    .line 319
    .local v0, "hc":I
    :goto_7
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_3

    .line 321
    mul-int/lit16 v0, v0, 0x101

    .line 322
    aget-byte v2, p0, v1

    xor-int/2addr v0, v2

    goto :goto_7
.end method

.method public static hashCode([BII)I
    .registers 6
    .param p0, "data"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 330
    if-nez p0, :cond_4

    .line 332
    const/4 v0, 0x0

    .line 344
    :cond_3
    return v0

    .line 335
    :cond_4
    move v1, p2

    .line 336
    .local v1, "i":I
    add-int/lit8 v0, v1, 0x1

    .line 338
    .local v0, "hc":I
    :goto_7
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_3

    .line 340
    mul-int/lit16 v0, v0, 0x101

    .line 341
    add-int v2, p1, v1

    aget-byte v2, p0, v2

    xor-int/2addr v0, v2

    goto :goto_7
.end method

.method public static hashCode([C)I
    .registers 4
    .param p0, "data"    # [C

    .prologue
    .line 349
    if-nez p0, :cond_4

    .line 351
    const/4 v0, 0x0

    .line 363
    :cond_3
    return v0

    .line 354
    :cond_4
    array-length v1, p0

    .line 355
    .local v1, "i":I
    add-int/lit8 v0, v1, 0x1

    .line 357
    .local v0, "hc":I
    :goto_7
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_3

    .line 359
    mul-int/lit16 v0, v0, 0x101

    .line 360
    aget-char v2, p0, v1

    xor-int/2addr v0, v2

    goto :goto_7
.end method

.method public static hashCode([I)I
    .registers 4
    .param p0, "data"    # [I

    .prologue
    .line 380
    if-nez p0, :cond_4

    .line 382
    const/4 v0, 0x0

    .line 394
    :cond_3
    return v0

    .line 385
    :cond_4
    array-length v1, p0

    .line 386
    .local v1, "i":I
    add-int/lit8 v0, v1, 0x1

    .line 388
    .local v0, "hc":I
    :goto_7
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_3

    .line 390
    mul-int/lit16 v0, v0, 0x101

    .line 391
    aget v2, p0, v1

    xor-int/2addr v0, v2

    goto :goto_7
.end method

.method public static hashCode([III)I
    .registers 6
    .param p0, "data"    # [I
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 399
    if-nez p0, :cond_4

    .line 401
    const/4 v0, 0x0

    .line 413
    :cond_3
    return v0

    .line 404
    :cond_4
    move v1, p2

    .line 405
    .local v1, "i":I
    add-int/lit8 v0, v1, 0x1

    .line 407
    .local v0, "hc":I
    :goto_7
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_3

    .line 409
    mul-int/lit16 v0, v0, 0x101

    .line 410
    add-int v2, p1, v1

    aget v2, p0, v2

    xor-int/2addr v0, v2

    goto :goto_7
.end method

.method public static hashCode([J)I
    .registers 7
    .param p0, "data"    # [J

    .prologue
    .line 418
    if-nez p0, :cond_4

    .line 420
    const/4 v2, 0x0

    .line 435
    :cond_3
    return v2

    .line 423
    :cond_4
    array-length v3, p0

    .line 424
    .local v3, "i":I
    add-int/lit8 v2, v3, 0x1

    .line 426
    .local v2, "hc":I
    :goto_7
    add-int/lit8 v3, v3, -0x1

    if-ltz v3, :cond_3

    .line 428
    aget-wide v0, p0, v3

    .line 429
    .local v0, "di":J
    mul-int/lit16 v2, v2, 0x101

    .line 430
    long-to-int v4, v0

    xor-int/2addr v2, v4

    .line 431
    mul-int/lit16 v2, v2, 0x101

    .line 432
    const/16 v4, 0x20

    ushr-long v4, v0, v4

    long-to-int v4, v4

    xor-int/2addr v2, v4

    .line 433
    goto :goto_7
.end method

.method public static hashCode([JII)I
    .registers 9
    .param p0, "data"    # [J
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 440
    if-nez p0, :cond_4

    .line 442
    const/4 v2, 0x0

    .line 457
    :cond_3
    return v2

    .line 445
    :cond_4
    move v3, p2

    .line 446
    .local v3, "i":I
    add-int/lit8 v2, v3, 0x1

    .line 448
    .local v2, "hc":I
    :goto_7
    add-int/lit8 v3, v3, -0x1

    if-ltz v3, :cond_3

    .line 450
    add-int v4, p1, v3

    aget-wide v0, p0, v4

    .line 451
    .local v0, "di":J
    mul-int/lit16 v2, v2, 0x101

    .line 452
    long-to-int v4, v0

    xor-int/2addr v2, v4

    .line 453
    mul-int/lit16 v2, v2, 0x101

    .line 454
    const/16 v4, 0x20

    ushr-long v4, v0, v4

    long-to-int v4, v4

    xor-int/2addr v2, v4

    .line 455
    goto :goto_7
.end method

.method public static hashCode([Ljava/lang/Object;)I
    .registers 4
    .param p0, "data"    # [Ljava/lang/Object;

    .prologue
    .line 505
    if-nez p0, :cond_4

    .line 507
    const/4 v0, 0x0

    .line 519
    :cond_3
    return v0

    .line 510
    :cond_4
    array-length v1, p0

    .line 511
    .local v1, "i":I
    add-int/lit8 v0, v1, 0x1

    .line 513
    .local v0, "hc":I
    :goto_7
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_3

    .line 515
    mul-int/lit16 v0, v0, 0x101

    .line 516
    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    goto :goto_7
.end method

.method public static hashCode([S)I
    .registers 4
    .param p0, "data"    # [S

    .prologue
    .line 486
    if-nez p0, :cond_4

    .line 488
    const/4 v0, 0x0

    .line 500
    :cond_3
    return v0

    .line 491
    :cond_4
    array-length v1, p0

    .line 492
    .local v1, "i":I
    add-int/lit8 v0, v1, 0x1

    .line 494
    .local v0, "hc":I
    :goto_7
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_3

    .line 496
    mul-int/lit16 v0, v0, 0x101

    .line 497
    aget-short v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    xor-int/2addr v0, v2

    goto :goto_7
.end method

.method public static hashCode([[I)I
    .registers 5
    .param p0, "ints"    # [[I

    .prologue
    .line 368
    const/4 v0, 0x0

    .line 370
    .local v0, "hc":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    array-length v2, p0

    if-eq v1, v2, :cond_12

    .line 372
    mul-int/lit16 v2, v0, 0x101

    aget-object v3, p0, v1

    invoke-static {v3}, Lorg/spongycastle/util/Arrays;->hashCode([I)I

    move-result v3

    add-int v0, v2, v3

    .line 370
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 375
    :cond_12
    return v0
.end method

.method public static hashCode([[S)I
    .registers 5
    .param p0, "shorts"    # [[S

    .prologue
    .line 474
    const/4 v0, 0x0

    .line 476
    .local v0, "hc":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    array-length v2, p0

    if-eq v1, v2, :cond_12

    .line 478
    mul-int/lit16 v2, v0, 0x101

    aget-object v3, p0, v1

    invoke-static {v3}, Lorg/spongycastle/util/Arrays;->hashCode([S)I

    move-result v3

    add-int v0, v2, v3

    .line 476
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 481
    :cond_12
    return v0
.end method

.method public static hashCode([[[S)I
    .registers 5
    .param p0, "shorts"    # [[[S

    .prologue
    .line 462
    const/4 v0, 0x0

    .line 464
    .local v0, "hc":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    array-length v2, p0

    if-eq v1, v2, :cond_12

    .line 466
    mul-int/lit16 v2, v0, 0x101

    aget-object v3, p0, v1

    invoke-static {v3}, Lorg/spongycastle/util/Arrays;->hashCode([[S)I

    move-result v3

    add-int v0, v2, v3

    .line 464
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 469
    :cond_12
    return v0
.end method

.method public static prepend([BB)[B
    .registers 7
    .param p0, "a"    # [B
    .param p1, "b"    # B

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 976
    if-nez p0, :cond_9

    .line 978
    new-array v1, v4, [B

    aput-byte p1, v1, v3

    .line 985
    :goto_8
    return-object v1

    .line 981
    :cond_9
    array-length v0, p0

    .line 982
    .local v0, "length":I
    add-int/lit8 v2, v0, 0x1

    new-array v1, v2, [B

    .line 983
    .local v1, "result":[B
    invoke-static {p0, v3, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 984
    aput-byte p1, v1, v3

    goto :goto_8
.end method

.method public static prepend([II)[I
    .registers 7
    .param p0, "a"    # [I
    .param p1, "b"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1004
    if-nez p0, :cond_9

    .line 1006
    new-array v1, v4, [I

    aput p1, v1, v3

    .line 1013
    :goto_8
    return-object v1

    .line 1009
    :cond_9
    array-length v0, p0

    .line 1010
    .local v0, "length":I
    add-int/lit8 v2, v0, 0x1

    new-array v1, v2, [I

    .line 1011
    .local v1, "result":[I
    invoke-static {p0, v3, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1012
    aput p1, v1, v3

    goto :goto_8
.end method

.method public static prepend([SS)[S
    .registers 7
    .param p0, "a"    # [S
    .param p1, "b"    # S

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 990
    if-nez p0, :cond_9

    .line 992
    new-array v1, v4, [S

    aput-short p1, v1, v3

    .line 999
    :goto_8
    return-object v1

    .line 995
    :cond_9
    array-length v0, p0

    .line 996
    .local v0, "length":I
    add-int/lit8 v2, v0, 0x1

    new-array v1, v2, [S

    .line 997
    .local v1, "result":[S
    invoke-static {p0, v3, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 998
    aput-short p1, v1, v3

    goto :goto_8
.end method

.method public static reverse([B)[B
    .registers 6
    .param p0, "a"    # [B

    .prologue
    .line 1018
    if-nez p0, :cond_4

    .line 1020
    const/4 v3, 0x0

    .line 1031
    :cond_3
    return-object v3

    .line 1023
    :cond_4
    const/4 v0, 0x0

    .local v0, "p1":I
    array-length v2, p0

    .line 1024
    .local v2, "p2":I
    new-array v3, v2, [B

    .local v3, "result":[B
    move v1, v0

    .line 1026
    .end local v0    # "p1":I
    .local v1, "p1":I
    :goto_9
    add-int/lit8 v2, v2, -0x1

    if-ltz v2, :cond_3

    .line 1028
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "p1":I
    .restart local v0    # "p1":I
    aget-byte v4, p0, v1

    aput-byte v4, v3, v2

    move v1, v0

    .end local v0    # "p1":I
    .restart local v1    # "p1":I
    goto :goto_9
.end method

.method public static reverse([I)[I
    .registers 6
    .param p0, "a"    # [I

    .prologue
    .line 1036
    if-nez p0, :cond_4

    .line 1038
    const/4 v3, 0x0

    .line 1049
    :cond_3
    return-object v3

    .line 1041
    :cond_4
    const/4 v0, 0x0

    .local v0, "p1":I
    array-length v2, p0

    .line 1042
    .local v2, "p2":I
    new-array v3, v2, [I

    .local v3, "result":[I
    move v1, v0

    .line 1044
    .end local v0    # "p1":I
    .local v1, "p1":I
    :goto_9
    add-int/lit8 v2, v2, -0x1

    if-ltz v2, :cond_3

    .line 1046
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "p1":I
    .restart local v0    # "p1":I
    aget v4, p0, v1

    aput v4, v3, v2

    move v1, v0

    .end local v0    # "p1":I
    .restart local v1    # "p1":I
    goto :goto_9
.end method
