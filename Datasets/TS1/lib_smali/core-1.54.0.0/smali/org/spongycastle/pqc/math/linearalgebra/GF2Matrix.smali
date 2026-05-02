.class public Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
.super Lorg/spongycastle/pqc/math/linearalgebra/Matrix;
.source "GF2Matrix.java"


# instance fields
.field private length:I

.field private matrix:[[I


# direct methods
.method public constructor <init>(IC)V
    .registers 4
    .param p1, "n"    # I
    .param p2, "typeOfMatrix"    # C

    .prologue
    .line 116
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(ICLjava/security/SecureRandom;)V

    .line 117
    return-void
.end method

.method public constructor <init>(ICLjava/security/SecureRandom;)V
    .registers 6
    .param p1, "n"    # I
    .param p2, "typeOfMatrix"    # C
    .param p3, "sr"    # Ljava/security/SecureRandom;

    .prologue
    .line 127
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;-><init>()V

    .line 128
    if-gtz p1, :cond_d

    .line 130
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "Size of matrix is non-positive."

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    :cond_d
    sparse-switch p2, :sswitch_data_2c

    .line 157
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "Unknown matrix type."

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 137
    :sswitch_18
    invoke-direct {p0, p1, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->assignZeroMatrix(II)V

    .line 159
    :goto_1b
    return-void

    .line 141
    :sswitch_1c
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->assignUnitMatrix(I)V

    goto :goto_1b

    .line 145
    :sswitch_20
    invoke-direct {p0, p1, p3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->assignRandomLowerTriangularMatrix(ILjava/security/SecureRandom;)V

    goto :goto_1b

    .line 149
    :sswitch_24
    invoke-direct {p0, p1, p3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->assignRandomUpperTriangularMatrix(ILjava/security/SecureRandom;)V

    goto :goto_1b

    .line 153
    :sswitch_28
    invoke-direct {p0, p1, p3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->assignRandomRegularMatrix(ILjava/security/SecureRandom;)V

    goto :goto_1b

    .line 133
    :sswitch_data_2c
    .sparse-switch
        0x49 -> :sswitch_1c
        0x4c -> :sswitch_20
        0x52 -> :sswitch_28
        0x55 -> :sswitch_24
        0x5a -> :sswitch_18
    .end sparse-switch
.end method

.method private constructor <init>(II)V
    .registers 5
    .param p1, "m"    # I
    .param p2, "n"    # I

    .prologue
    .line 183
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;-><init>()V

    .line 184
    if-lez p2, :cond_7

    if-gtz p1, :cond_f

    .line 186
    :cond_7
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "size of matrix is non-positive"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 189
    :cond_f
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->assignZeroMatrix(II)V

    .line 190
    return-void
.end method

.method public constructor <init>(I[[I)V
    .registers 9
    .param p1, "numColumns"    # I
    .param p2, "matrix"    # [[I

    .prologue
    const/4 v5, 0x0

    .line 81
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;-><init>()V

    .line 82
    aget-object v3, p2, v5

    array-length v3, v3

    add-int/lit8 v4, p1, 0x1f

    shr-int/lit8 v4, v4, 0x5

    if-eq v3, v4, :cond_15

    .line 84
    new-instance v3, Ljava/lang/ArithmeticException;

    const-string v4, "Int array does not match given number of columns."

    invoke-direct {v3, v4}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 87
    :cond_15
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    .line 88
    array-length v3, p2

    iput v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    .line 89
    aget-object v3, p2, v5

    array-length v3, v3

    iput v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 90
    and-int/lit8 v2, p1, 0x1f

    .line 92
    .local v2, "rest":I
    if-nez v2, :cond_37

    .line 94
    const/4 v0, -0x1

    .line 100
    .local v0, "bitMask":I
    :goto_24
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_25
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v1, v3, :cond_3c

    .line 102
    aget-object v3, p2, v1

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v4, v4, -0x1

    aget v5, v3, v4

    and-int/2addr v5, v0

    aput v5, v3, v4

    .line 100
    add-int/lit8 v1, v1, 0x1

    goto :goto_25

    .line 98
    .end local v0    # "bitMask":I
    .end local v1    # "i":I
    :cond_37
    const/4 v3, 0x1

    shl-int/2addr v3, v2

    add-int/lit8 v0, v3, -0x1

    .restart local v0    # "bitMask":I
    goto :goto_24

    .line 104
    .restart local v1    # "i":I
    :cond_3c
    iput-object p2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 105
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;)V
    .registers 5
    .param p1, "a"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .prologue
    .line 167
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;-><init>()V

    .line 168
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->getNumColumns()I

    move-result v1

    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    .line 169
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->getNumRows()I

    move-result v1

    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    .line 170
    iget v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 171
    iget-object v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    array-length v1, v1

    new-array v1, v1, [[I

    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 172
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1b
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    array-length v1, v1

    if-ge v0, v1, :cond_2f

    .line 174
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    iget-object v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v2, v2, v0

    invoke-static {v2}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    move-result-object v2

    aput-object v2, v1, v0

    .line 172
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 177
    :cond_2f
    return-void
.end method

.method public constructor <init>([B)V
    .registers 12
    .param p1, "enc"    # [B

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;-><init>()V

    .line 34
    array-length v7, p1

    const/16 v8, 0x9

    if-ge v7, v8, :cond_10

    .line 36
    new-instance v7, Ljava/lang/ArithmeticException;

    const-string v8, "given array is not an encoded matrix over GF(2)"

    invoke-direct {v7, v8}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 40
    :cond_10
    const/4 v7, 0x0

    invoke-static {p1, v7}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->OS2IP([BI)I

    move-result v7

    iput v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    .line 41
    const/4 v7, 0x4

    invoke-static {p1, v7}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->OS2IP([BI)I

    move-result v7

    iput v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    .line 43
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    add-int/lit8 v7, v7, 0x7

    ushr-int/lit8 v7, v7, 0x3

    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    mul-int v4, v7, v8

    .line 45
    .local v4, "n":I
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-lez v7, :cond_31

    array-length v7, p1

    add-int/lit8 v7, v7, -0x8

    if-eq v4, v7, :cond_39

    .line 47
    :cond_31
    new-instance v7, Ljava/lang/ArithmeticException;

    const-string v8, "given array is not an encoded matrix over GF(2)"

    invoke-direct {v7, v8}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 51
    :cond_39
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    add-int/lit8 v7, v7, 0x1f

    ushr-int/lit8 v7, v7, 0x5

    iput v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 52
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    filled-new-array {v7, v8}, [I

    move-result-object v7

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v8, v7}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [[I

    iput-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 55
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    shr-int/lit8 v5, v7, 0x5

    .line 57
    .local v5, "q":I
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    and-int/lit8 v6, v7, 0x1f

    .line 59
    .local v6, "r":I
    const/16 v0, 0x8

    .line 60
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5e
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v2, v7, :cond_90

    .line 62
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_63
    if-ge v3, v5, :cond_74

    .line 64
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v7, v7, v2

    invoke-static {p1, v0}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->OS2IP([BI)I

    move-result v8

    aput v8, v7, v3

    .line 62
    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v0, v0, 0x4

    goto :goto_63

    .line 66
    :cond_74
    const/4 v3, 0x0

    move v1, v0

    .end local v0    # "count":I
    .local v1, "count":I
    :goto_76
    if-ge v3, v6, :cond_8c

    .line 68
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v7, v7, v2

    aget v8, v7, v5

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    aget-byte v9, p1, v1

    and-int/lit16 v9, v9, 0xff

    shl-int/2addr v9, v3

    xor-int/2addr v8, v9

    aput v8, v7, v5

    .line 66
    add-int/lit8 v3, v3, 0x8

    move v1, v0

    .end local v0    # "count":I
    .restart local v1    # "count":I
    goto :goto_76

    .line 60
    :cond_8c
    add-int/lit8 v2, v2, 0x1

    move v0, v1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    goto :goto_5e

    .line 71
    .end local v3    # "j":I
    :cond_90
    return-void
.end method

.method private static addToRow([I[II)V
    .registers 6
    .param p0, "fromRow"    # [I
    .param p1, "toRow"    # [I
    .param p2, "startIndex"    # I

    .prologue
    .line 1317
    array-length v1, p1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_3
    if-lt v0, p2, :cond_f

    .line 1319
    aget v1, p0, v0

    aget v2, p1, v0

    xor-int/2addr v1, v2

    aput v1, p1, v0

    .line 1317
    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    .line 1321
    :cond_f
    return-void
.end method

.method private assignRandomLowerTriangularMatrix(ILjava/security/SecureRandom;)V
    .registers 10
    .param p1, "n"    # I
    .param p2, "sr"    # Ljava/security/SecureRandom;

    .prologue
    .line 246
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    .line 247
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    .line 248
    add-int/lit8 v5, p1, 0x1f

    ushr-int/lit8 v5, v5, 0x5

    iput v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 249
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    filled-new-array {v5, v6}, [I

    move-result-object v5

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v6, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [[I

    iput-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 250
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1d
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v0, v5, :cond_59

    .line 252
    ushr-int/lit8 v2, v0, 0x5

    .line 253
    .local v2, "q":I
    and-int/lit8 v3, v0, 0x1f

    .line 254
    .local v3, "r":I
    rsub-int/lit8 v4, v3, 0x1f

    .line 255
    .local v4, "s":I
    const/4 v5, 0x1

    shl-int v3, v5, v3

    .line 256
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_2b
    if-ge v1, v2, :cond_3a

    .line 258
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v5, v5, v0

    invoke-virtual {p2}, Ljava/security/SecureRandom;->nextInt()I

    move-result v6

    aput v6, v5, v1

    .line 256
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    .line 260
    :cond_3a
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v5, v5, v0

    invoke-virtual {p2}, Ljava/security/SecureRandom;->nextInt()I

    move-result v6

    ushr-int/2addr v6, v4

    or-int/2addr v6, v3

    aput v6, v5, v2

    .line 261
    add-int/lit8 v1, v2, 0x1

    :goto_48
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v1, v5, :cond_56

    .line 263
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v5, v5, v0

    const/4 v6, 0x0

    aput v6, v5, v1

    .line 261
    add-int/lit8 v1, v1, 0x1

    goto :goto_48

    .line 250
    :cond_56
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d

    .line 268
    .end local v1    # "j":I
    .end local v2    # "q":I
    .end local v3    # "r":I
    .end local v4    # "s":I
    :cond_59
    return-void
.end method

.method private assignRandomRegularMatrix(ILjava/security/SecureRandom;)V
    .registers 13
    .param p1, "n"    # I
    .param p2, "sr"    # Ljava/security/SecureRandom;

    .prologue
    const/4 v9, 0x0

    .line 320
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    .line 321
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    .line 322
    add-int/lit8 v6, p1, 0x1f

    ushr-int/lit8 v6, v6, 0x5

    iput v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 323
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    filled-new-array {v6, v7}, [I

    move-result-object v6

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v7, v6}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [[I

    iput-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 324
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    const/16 v6, 0x4c

    invoke-direct {v1, p1, v6, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(ICLjava/security/SecureRandom;)V

    .line 325
    .local v1, "lm":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    new-instance v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    const/16 v6, 0x55

    invoke-direct {v5, p1, v6, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(ICLjava/security/SecureRandom;)V

    .line 326
    .local v5, "um":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    invoke-virtual {v1, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Matrix;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 327
    .local v4, "rm":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    new-instance v3, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    invoke-direct {v3, p1, p2}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;-><init>(ILjava/security/SecureRandom;)V

    .line 328
    .local v3, "perm":Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    invoke-virtual {v3}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->getVector()[I

    move-result-object v2

    .line 329
    .local v2, "p":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3b
    if-ge v0, p1, :cond_4f

    .line 331
    iget-object v6, v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v6, v6, v0

    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget v8, v2, v0

    aget-object v7, v7, v8

    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    invoke-static {v6, v9, v7, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 329
    add-int/lit8 v0, v0, 0x1

    goto :goto_3b

    .line 333
    :cond_4f
    return-void
.end method

.method private assignRandomUpperTriangularMatrix(ILjava/security/SecureRandom;)V
    .registers 14
    .param p1, "n"    # I
    .param p2, "sr"    # Ljava/security/SecureRandom;

    .prologue
    const/4 v10, 0x1

    .line 278
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    .line 279
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    .line 280
    add-int/lit8 v7, p1, 0x1f

    ushr-int/lit8 v7, v7, 0x5

    iput v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 281
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    filled-new-array {v7, v8}, [I

    move-result-object v7

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v8, v7}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [[I

    iput-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 282
    and-int/lit8 v5, p1, 0x1f

    .line 284
    .local v5, "rest":I
    if-nez v5, :cond_3b

    .line 286
    const/4 v0, -0x1

    .line 292
    .local v0, "help":I
    :goto_22
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_23
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v1, v7, :cond_6f

    .line 294
    ushr-int/lit8 v3, v1, 0x5

    .line 295
    .local v3, "q":I
    and-int/lit8 v4, v1, 0x1f

    .line 296
    .local v4, "r":I
    move v6, v4

    .line 297
    .local v6, "s":I
    shl-int v4, v10, v4

    .line 298
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_2f
    if-ge v2, v3, :cond_40

    .line 300
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v7, v7, v1

    const/4 v8, 0x0

    aput v8, v7, v2

    .line 298
    add-int/lit8 v2, v2, 0x1

    goto :goto_2f

    .line 290
    .end local v0    # "help":I
    .end local v1    # "i":I
    .end local v2    # "j":I
    .end local v3    # "q":I
    .end local v4    # "r":I
    .end local v6    # "s":I
    :cond_3b
    shl-int v7, v10, v5

    add-int/lit8 v0, v7, -0x1

    .restart local v0    # "help":I
    goto :goto_22

    .line 302
    .restart local v1    # "i":I
    .restart local v2    # "j":I
    .restart local v3    # "q":I
    .restart local v4    # "r":I
    .restart local v6    # "s":I
    :cond_40
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v7, v7, v1

    invoke-virtual {p2}, Ljava/security/SecureRandom;->nextInt()I

    move-result v8

    shl-int/2addr v8, v6

    or-int/2addr v8, v4

    aput v8, v7, v3

    .line 303
    add-int/lit8 v2, v3, 0x1

    :goto_4e
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v2, v7, :cond_5f

    .line 305
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v7, v7, v1

    invoke-virtual {p2}, Ljava/security/SecureRandom;->nextInt()I

    move-result v8

    aput v8, v7, v2

    .line 303
    add-int/lit8 v2, v2, 0x1

    goto :goto_4e

    .line 307
    :cond_5f
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v7, v7, v1

    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v8, v8, -0x1

    aget v9, v7, v8

    and-int/2addr v9, v0

    aput v9, v7, v8

    .line 292
    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    .line 310
    .end local v2    # "j":I
    .end local v3    # "q":I
    .end local v4    # "r":I
    .end local v6    # "s":I
    :cond_6f
    return-void
.end method

.method private assignUnitMatrix(I)V
    .registers 8
    .param p1, "n"    # I

    .prologue
    .line 220
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    .line 221
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    .line 222
    add-int/lit8 v3, p1, 0x1f

    ushr-int/lit8 v3, v3, 0x5

    iput v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 223
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    filled-new-array {v3, v4}, [I

    move-result-object v3

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v4, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [[I

    iput-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 224
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1d
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v0, v3, :cond_33

    .line 226
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_22
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v1, v3, :cond_30

    .line 228
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v3, v3, v0

    const/4 v4, 0x0

    aput v4, v3, v1

    .line 226
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    .line 224
    :cond_30
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d

    .line 231
    .end local v1    # "j":I
    :cond_33
    const/4 v0, 0x0

    :goto_34
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v0, v3, :cond_47

    .line 233
    and-int/lit8 v2, v0, 0x1f

    .line 234
    .local v2, "rest":I
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v3, v3, v0

    ushr-int/lit8 v4, v0, 0x5

    const/4 v5, 0x1

    shl-int/2addr v5, v2

    aput v5, v3, v4

    .line 231
    add-int/lit8 v0, v0, 0x1

    goto :goto_34

    .line 236
    .end local v2    # "rest":I
    :cond_47
    return-void
.end method

.method private assignZeroMatrix(II)V
    .registers 7
    .param p1, "m"    # I
    .param p2, "n"    # I

    .prologue
    .line 200
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    .line 201
    iput p2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    .line 202
    add-int/lit8 v2, p2, 0x1f

    ushr-int/lit8 v2, v2, 0x5

    iput v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 203
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    filled-new-array {v2, v3}, [I

    move-result-object v2

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[I

    iput-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 204
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1d
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v0, v2, :cond_33

    .line 206
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_22
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v1, v2, :cond_30

    .line 208
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v2, v2, v0

    const/4 v3, 0x0

    aput v3, v2, v1

    .line 206
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    .line 204
    :cond_30
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d

    .line 211
    .end local v1    # "j":I
    :cond_33
    return-void
.end method

.method public static createRandomRegularMatrixAndItsInverse(ILjava/security/SecureRandom;)[Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 27
    .param p0, "n"    # I
    .param p1, "sr"    # Ljava/security/SecureRandom;

    .prologue
    .line 346
    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    move-object/from16 v18, v0

    .line 353
    .local v18, "result":[Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    add-int/lit8 v21, p0, 0x1f

    shr-int/lit8 v10, v21, 0x5

    .line 354
    .local v10, "length":I
    new-instance v11, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    const/16 v21, 0x4c

    move/from16 v0, p0

    move/from16 v1, v21

    move-object/from16 v2, p1

    invoke-direct {v11, v0, v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(ICLjava/security/SecureRandom;)V

    .line 355
    .local v11, "lm":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    new-instance v20, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    const/16 v21, 0x55

    move-object/from16 v0, v20

    move/from16 v1, p0

    move/from16 v2, v21

    move-object/from16 v3, p1

    invoke-direct {v0, v1, v2, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(ICLjava/security/SecureRandom;)V

    .line 356
    .local v20, "um":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Matrix;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;

    move-result-object v19

    check-cast v19, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 357
    .local v19, "rm":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    new-instance v13, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    move/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v13, v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;-><init>(ILjava/security/SecureRandom;)V

    .line 358
    .local v13, "p":Lorg/spongycastle/pqc/math/linearalgebra/Permutation;
    invoke-virtual {v13}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->getVector()[I

    move-result-object v14

    .line 360
    .local v14, "pVec":[I
    move/from16 v0, p0

    filled-new-array {v0, v10}, [I

    move-result-object v21

    sget-object v22, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [[I

    .line 361
    .local v12, "matrix":[[I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_50
    move/from16 v0, p0

    if-ge v5, v0, :cond_72

    .line 363
    move-object/from16 v0, v19

    iget-object v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    move-object/from16 v21, v0

    aget v22, v14, v5

    aget-object v21, v21, v22

    const/16 v22, 0x0

    aget-object v23, v12, v5

    const/16 v24, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v22

    move-object/from16 v2, v23

    move/from16 v3, v24

    invoke-static {v0, v1, v2, v3, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 361
    add-int/lit8 v5, v5, 0x1

    goto :goto_50

    .line 366
    :cond_72
    const/16 v21, 0x0

    new-instance v22, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    move-object/from16 v0, v22

    move/from16 v1, p0

    invoke-direct {v0, v1, v12}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(I[[I)V

    aput-object v22, v18, v21

    .line 373
    new-instance v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    const/16 v21, 0x49

    move/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v6, v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(IC)V

    .line 374
    .local v6, "invLm":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    const/4 v5, 0x0

    :goto_8b
    move/from16 v0, p0

    if-ge v5, v0, :cond_c9

    .line 376
    and-int/lit8 v17, v5, 0x1f

    .line 377
    .local v17, "rest":I
    ushr-int/lit8 v15, v5, 0x5

    .line 378
    .local v15, "q":I
    const/16 v21, 0x1

    shl-int v16, v21, v17

    .line 379
    .local v16, "r":I
    add-int/lit8 v8, v5, 0x1

    .local v8, "j":I
    :goto_99
    move/from16 v0, p0

    if-ge v8, v0, :cond_c6

    .line 381
    iget-object v0, v11, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    move-object/from16 v21, v0

    aget-object v21, v21, v8

    aget v21, v21, v15

    and-int v4, v21, v16

    .line 382
    .local v4, "b":I
    if-eqz v4, :cond_c3

    .line 384
    const/4 v9, 0x0

    .local v9, "k":I
    :goto_aa
    if-gt v9, v15, :cond_c3

    .line 386
    iget-object v0, v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    move-object/from16 v21, v0

    aget-object v21, v21, v8

    aget v22, v21, v9

    iget-object v0, v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    move-object/from16 v23, v0

    aget-object v23, v23, v5

    aget v23, v23, v9

    xor-int v22, v22, v23

    aput v22, v21, v9

    .line 384
    add-int/lit8 v9, v9, 0x1

    goto :goto_aa

    .line 379
    .end local v9    # "k":I
    :cond_c3
    add-int/lit8 v8, v8, 0x1

    goto :goto_99

    .line 374
    .end local v4    # "b":I
    :cond_c6
    add-int/lit8 v5, v5, 0x1

    goto :goto_8b

    .line 392
    .end local v8    # "j":I
    .end local v15    # "q":I
    .end local v16    # "r":I
    .end local v17    # "rest":I
    :cond_c9
    new-instance v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    const/16 v21, 0x49

    move/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v7, v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(IC)V

    .line 393
    .local v7, "invUm":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    add-int/lit8 v5, p0, -0x1

    :goto_d6
    if-ltz v5, :cond_112

    .line 395
    and-int/lit8 v17, v5, 0x1f

    .line 396
    .restart local v17    # "rest":I
    ushr-int/lit8 v15, v5, 0x5

    .line 397
    .restart local v15    # "q":I
    const/16 v21, 0x1

    shl-int v16, v21, v17

    .line 398
    .restart local v16    # "r":I
    add-int/lit8 v8, v5, -0x1

    .restart local v8    # "j":I
    :goto_e2
    if-ltz v8, :cond_10f

    .line 400
    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    move-object/from16 v21, v0

    aget-object v21, v21, v8

    aget v21, v21, v15

    and-int v4, v21, v16

    .line 401
    .restart local v4    # "b":I
    if-eqz v4, :cond_10c

    .line 403
    move v9, v15

    .restart local v9    # "k":I
    :goto_f3
    if-ge v9, v10, :cond_10c

    .line 405
    iget-object v0, v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    move-object/from16 v21, v0

    aget-object v21, v21, v8

    aget v22, v21, v9

    iget-object v0, v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    move-object/from16 v23, v0

    aget-object v23, v23, v5

    aget v23, v23, v9

    xor-int v22, v22, v23

    aput v22, v21, v9

    .line 403
    add-int/lit8 v9, v9, 0x1

    goto :goto_f3

    .line 398
    .end local v9    # "k":I
    :cond_10c
    add-int/lit8 v8, v8, -0x1

    goto :goto_e2

    .line 393
    .end local v4    # "b":I
    :cond_10f
    add-int/lit8 v5, v5, -0x1

    goto :goto_d6

    .line 412
    .end local v8    # "j":I
    .end local v15    # "q":I
    .end local v16    # "r":I
    .end local v17    # "rest":I
    :cond_112
    const/16 v22, 0x1

    invoke-virtual {v6, v13}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Permutation;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v7, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Matrix;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;

    move-result-object v21

    check-cast v21, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    aput-object v21, v18, v22

    .line 414
    return-object v18
.end method

.method private static swapRows([[III)V
    .registers 5
    .param p0, "matrix"    # [[I
    .param p1, "first"    # I
    .param p2, "second"    # I

    .prologue
    .line 1303
    aget-object v0, p0, p1

    .line 1304
    .local v0, "tmp":[I
    aget-object v1, p0, p2

    aput-object v1, p0, p1

    .line 1305
    aput-object v0, p0, p2

    .line 1306
    return-void
.end method


# virtual methods
.method public computeInverse()Lorg/spongycastle/pqc/math/linearalgebra/Matrix;
    .registers 13

    .prologue
    const/4 v11, 0x1

    .line 732
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    if-eq v8, v9, :cond_f

    .line 734
    new-instance v8, Ljava/lang/ArithmeticException;

    const-string v9, "Matrix is not invertible."

    invoke-direct {v8, v9}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 738
    :cond_f
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    filled-new-array {v8, v9}, [I

    move-result-object v8

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [[I

    .line 739
    .local v7, "tmpMatrix":[[I
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v2, v8, -0x1

    .local v2, "i":I
    :goto_23
    if-ltz v2, :cond_32

    .line 741
    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v2

    invoke-static {v8}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    move-result-object v8

    aput-object v8, v7, v2

    .line 739
    add-int/lit8 v2, v2, -0x1

    goto :goto_23

    .line 745
    :cond_32
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    filled-new-array {v8, v9}, [I

    move-result-object v8

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [[I

    .line 746
    .local v3, "invMatrix":[[I
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v2, v8, -0x1

    :goto_46
    if-ltz v2, :cond_55

    .line 748
    shr-int/lit8 v5, v2, 0x5

    .line 749
    .local v5, "q":I
    and-int/lit8 v6, v2, 0x1f

    .line 750
    .local v6, "r":I
    aget-object v8, v3, v2

    shl-int v9, v11, v6

    aput v9, v8, v5

    .line 746
    add-int/lit8 v2, v2, -0x1

    goto :goto_46

    .line 755
    .end local v5    # "q":I
    .end local v6    # "r":I
    :cond_55
    const/4 v2, 0x0

    :goto_56
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v2, v8, :cond_af

    .line 758
    shr-int/lit8 v5, v2, 0x5

    .line 759
    .restart local v5    # "q":I
    and-int/lit8 v8, v2, 0x1f

    shl-int v0, v11, v8

    .line 761
    .local v0, "bitMask":I
    aget-object v8, v7, v2

    aget v8, v8, v5

    and-int/2addr v8, v0

    if-nez v8, :cond_8b

    .line 763
    const/4 v1, 0x0

    .line 765
    .local v1, "foundNonZero":Z
    add-int/lit8 v4, v2, 0x1

    .local v4, "j":I
    :goto_6a
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v4, v8, :cond_81

    .line 767
    aget-object v8, v7, v4

    aget v8, v8, v5

    and-int/2addr v8, v0

    if-eqz v8, :cond_7e

    .line 770
    const/4 v1, 0x1

    .line 771
    invoke-static {v7, v2, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->swapRows([[III)V

    .line 772
    invoke-static {v3, v2, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->swapRows([[III)V

    .line 774
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    .line 765
    :cond_7e
    add-int/lit8 v4, v4, 0x1

    goto :goto_6a

    .line 779
    :cond_81
    if-nez v1, :cond_8b

    .line 782
    new-instance v8, Ljava/lang/ArithmeticException;

    const-string v9, "Matrix is not invertible."

    invoke-direct {v8, v9}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 787
    .end local v1    # "foundNonZero":Z
    .end local v4    # "j":I
    :cond_8b
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v4, v8, -0x1

    .restart local v4    # "j":I
    :goto_8f
    if-ltz v4, :cond_ac

    .line 789
    if-eq v4, v2, :cond_a9

    aget-object v8, v7, v4

    aget v8, v8, v5

    and-int/2addr v8, v0

    if-eqz v8, :cond_a9

    .line 791
    aget-object v8, v7, v2

    aget-object v9, v7, v4

    invoke-static {v8, v9, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->addToRow([I[II)V

    .line 792
    aget-object v8, v3, v2

    aget-object v9, v3, v4

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->addToRow([I[II)V

    .line 787
    :cond_a9
    add-int/lit8 v4, v4, -0x1

    goto :goto_8f

    .line 755
    :cond_ac
    add-int/lit8 v2, v2, 0x1

    goto :goto_56

    .line 797
    .end local v0    # "bitMask":I
    .end local v4    # "j":I
    .end local v5    # "q":I
    :cond_af
    new-instance v8, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    invoke-direct {v8, v9, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(I[[I)V

    return-object v8
.end method

.method public computeTranspose()Lorg/spongycastle/pqc/math/linearalgebra/Matrix;
    .registers 13

    .prologue
    const/4 v11, 0x1

    .line 704
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v9, v9, 0x1f

    ushr-int/lit8 v9, v9, 0x5

    filled-new-array {v8, v9}, [I

    move-result-object v8

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v9, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [[I

    .line 705
    .local v5, "result":[[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_16
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v1, v8, :cond_41

    .line 707
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1b
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    if-ge v2, v8, :cond_3e

    .line 709
    ushr-int/lit8 v3, v2, 0x5

    .line 710
    .local v3, "qs":I
    and-int/lit8 v6, v2, 0x1f

    .line 711
    .local v6, "rs":I
    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v1

    aget v8, v8, v3

    ushr-int/2addr v8, v6

    and-int/lit8 v0, v8, 0x1

    .line 712
    .local v0, "b":I
    ushr-int/lit8 v4, v1, 0x5

    .line 713
    .local v4, "qt":I
    and-int/lit8 v7, v1, 0x1f

    .line 714
    .local v7, "rt":I
    if-ne v0, v11, :cond_3b

    .line 716
    aget-object v8, v5, v2

    aget v9, v8, v4

    shl-int v10, v11, v7

    or-int/2addr v9, v10

    aput v9, v8, v4

    .line 707
    :cond_3b
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    .line 705
    .end local v0    # "b":I
    .end local v3    # "qs":I
    .end local v4    # "qt":I
    .end local v6    # "rs":I
    .end local v7    # "rt":I
    :cond_3e
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 721
    .end local v2    # "j":I
    :cond_41
    new-instance v8, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    invoke-direct {v8, v9, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(I[[I)V

    return-object v8
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 1201
    instance-of v3, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    if-nez v3, :cond_6

    .line 1222
    :cond_5
    :goto_5
    return v2

    :cond_6
    move-object v1, p1

    .line 1205
    check-cast v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 1207
    .local v1, "otherMatrix":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v4, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ne v3, v4, :cond_5

    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    iget v4, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    if-ne v3, v4, :cond_5

    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    iget v4, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ne v3, v4, :cond_5

    .line 1214
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1c
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v0, v3, :cond_31

    .line 1216
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v3, v3, v0

    iget-object v4, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v4, v4, v0

    invoke-static {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->equals([I[I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1214
    add-int/lit8 v0, v0, 0x1

    goto :goto_1c

    .line 1222
    :cond_31
    const/4 v2, 0x1

    goto :goto_5
.end method

.method public extendLeftCompactForm()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 11

    .prologue
    const/4 v9, 0x0

    .line 582
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int v2, v4, v5

    .line 583
    .local v2, "newNumColumns":I
    new-instance v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    invoke-direct {v3, v4, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(II)V

    .line 585
    .local v3, "result":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v4, v4, -0x1

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    add-int v1, v4, v5

    .line 586
    .local v1, "ind":I
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v0, v4, -0x1

    .local v0, "i":I
    :goto_1a
    if-ltz v0, :cond_3d

    .line 589
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v4, v4, v0

    iget-object v5, v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v5, v5, v0

    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    invoke-static {v4, v9, v5, v9, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 591
    iget-object v4, v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v4, v4, v0

    shr-int/lit8 v5, v1, 0x5

    aget v6, v4, v5

    const/4 v7, 0x1

    and-int/lit8 v8, v1, 0x1f

    shl-int/2addr v7, v8

    or-int/2addr v6, v7

    aput v6, v4, v5

    .line 586
    add-int/lit8 v0, v0, -0x1

    add-int/lit8 v1, v1, -0x1

    goto :goto_1a

    .line 594
    :cond_3d
    return-object v3
.end method

.method public extendRightCompactForm()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 14

    .prologue
    .line 654
    new-instance v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v10, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    add-int/2addr v9, v10

    invoke-direct {v7, v8, v9}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(II)V

    .line 656
    .local v7, "result":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    shr-int/lit8 v5, v8, 0x5

    .line 657
    .local v5, "q":I
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    and-int/lit8 v6, v8, 0x1f

    .line 659
    .local v6, "r":I
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v0, v8, -0x1

    .local v0, "i":I
    :goto_18
    if-ltz v0, :cond_91

    .line 662
    iget-object v8, v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v0

    shr-int/lit8 v9, v0, 0x5

    aget v10, v8, v9

    const/4 v11, 0x1

    and-int/lit8 v12, v0, 0x1f

    shl-int/2addr v11, v12

    or-int/2addr v10, v11

    aput v10, v8, v9

    .line 667
    if-eqz v6, :cond_82

    .line 669
    move v1, v5

    .line 671
    .local v1, "ind":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_2d
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v8, v8, -0x1

    if-ge v3, v8, :cond_57

    .line 674
    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v0

    aget v4, v8, v3

    .line 676
    .local v4, "mw":I
    iget-object v8, v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v0

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "ind":I
    .local v2, "ind":I
    aget v9, v8, v1

    shl-int v10, v4, v6

    or-int/2addr v9, v10

    aput v9, v8, v1

    .line 677
    iget-object v8, v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v0

    aget v9, v8, v2

    rsub-int/lit8 v10, v6, 0x20

    ushr-int v10, v4, v10

    or-int/2addr v9, v10

    aput v9, v8, v2

    .line 671
    add-int/lit8 v3, v3, 0x1

    move v1, v2

    .end local v2    # "ind":I
    .restart local v1    # "ind":I
    goto :goto_2d

    .line 680
    .end local v4    # "mw":I
    :cond_57
    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v0

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v9, v9, -0x1

    aget v4, v8, v9

    .line 681
    .restart local v4    # "mw":I
    iget-object v8, v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v0

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "ind":I
    .restart local v2    # "ind":I
    aget v9, v8, v1

    shl-int v10, v4, v6

    or-int/2addr v9, v10

    aput v9, v8, v1

    .line 682
    iget v8, v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v2, v8, :cond_7f

    .line 684
    iget-object v8, v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v0

    aget v9, v8, v2

    rsub-int/lit8 v10, v6, 0x20

    ushr-int v10, v4, v10

    or-int/2addr v9, v10

    aput v9, v8, v2

    .line 659
    .end local v2    # "ind":I
    .end local v3    # "j":I
    .end local v4    # "mw":I
    :cond_7f
    :goto_7f
    add-int/lit8 v0, v0, -0x1

    goto :goto_18

    .line 690
    :cond_82
    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v0

    const/4 v9, 0x0

    iget-object v10, v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v10, v10, v0

    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    invoke-static {v8, v9, v10, v5, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_7f

    .line 694
    :cond_91
    return-object v7
.end method

.method public getEncoded()[B
    .registers 11

    .prologue
    .line 451
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    add-int/lit8 v8, v8, 0x7

    ushr-int/lit8 v5, v8, 0x3

    .line 452
    .local v5, "n":I
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    mul-int/2addr v5, v8

    .line 453
    add-int/lit8 v5, v5, 0x8

    .line 454
    new-array v2, v5, [B

    .line 456
    .local v2, "enc":[B
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    const/4 v9, 0x0

    invoke-static {v8, v2, v9}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->I2OSP(I[BI)V

    .line 457
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    const/4 v9, 0x4

    invoke-static {v8, v2, v9}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->I2OSP(I[BI)V

    .line 460
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    ushr-int/lit8 v6, v8, 0x5

    .line 462
    .local v6, "q":I
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    and-int/lit8 v7, v8, 0x1f

    .line 464
    .local v7, "r":I
    const/16 v0, 0x8

    .line 465
    .local v0, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_24
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v3, v8, :cond_53

    .line 467
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_29
    if-ge v4, v6, :cond_39

    .line 469
    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v3

    aget v8, v8, v4

    invoke-static {v8, v2, v0}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->I2OSP(I[BI)V

    .line 467
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v0, v0, 0x4

    goto :goto_29

    .line 471
    :cond_39
    const/4 v4, 0x0

    move v1, v0

    .end local v0    # "count":I
    .local v1, "count":I
    :goto_3b
    if-ge v4, v7, :cond_4f

    .line 473
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v3

    aget v8, v8, v6

    ushr-int/2addr v8, v4

    and-int/lit16 v8, v8, 0xff

    int-to-byte v8, v8

    aput-byte v8, v2, v1

    .line 471
    add-int/lit8 v4, v4, 0x8

    move v1, v0

    .end local v0    # "count":I
    .restart local v1    # "count":I
    goto :goto_3b

    .line 465
    :cond_4f
    add-int/lit8 v3, v3, 0x1

    move v0, v1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    goto :goto_24

    .line 477
    .end local v4    # "j":I
    :cond_53
    return-object v2
.end method

.method public getHammingWeight()D
    .registers 16

    .prologue
    const-wide/high16 v13, 0x3ff0000000000000L    # 1.0

    .line 488
    const-wide/16 v2, 0x0

    .line 489
    .local v2, "counter":D
    const-wide/16 v5, 0x0

    .line 490
    .local v5, "elementCounter":D
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    and-int/lit8 v10, v11, 0x1f

    .line 492
    .local v10, "rest":I
    if-nez v10, :cond_2b

    .line 494
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 501
    .local v4, "d":I
    :goto_e
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_f
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v7, v11, :cond_4d

    .line 504
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_14
    if-ge v8, v4, :cond_33

    .line 506
    iget-object v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v11, v11, v7

    aget v0, v11, v8

    .line 507
    .local v0, "a":I
    const/4 v9, 0x0

    .local v9, "k":I
    :goto_1d
    const/16 v11, 0x20

    if-ge v9, v11, :cond_30

    .line 509
    ushr-int v11, v0, v9

    and-int/lit8 v1, v11, 0x1

    .line 510
    .local v1, "b":I
    int-to-double v11, v1

    add-double/2addr v2, v11

    .line 511
    add-double/2addr v5, v13

    .line 507
    add-int/lit8 v9, v9, 0x1

    goto :goto_1d

    .line 498
    .end local v0    # "a":I
    .end local v1    # "b":I
    .end local v4    # "d":I
    .end local v7    # "i":I
    .end local v8    # "j":I
    .end local v9    # "k":I
    :cond_2b
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v4, v11, -0x1

    .restart local v4    # "d":I
    goto :goto_e

    .line 504
    .restart local v0    # "a":I
    .restart local v7    # "i":I
    .restart local v8    # "j":I
    .restart local v9    # "k":I
    :cond_30
    add-int/lit8 v8, v8, 0x1

    goto :goto_14

    .line 514
    .end local v0    # "a":I
    .end local v9    # "k":I
    :cond_33
    iget-object v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v11, v11, v7

    iget v12, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v12, v12, -0x1

    aget v0, v11, v12

    .line 515
    .restart local v0    # "a":I
    const/4 v9, 0x0

    .restart local v9    # "k":I
    :goto_3e
    if-ge v9, v10, :cond_4a

    .line 517
    ushr-int v11, v0, v9

    and-int/lit8 v1, v11, 0x1

    .line 518
    .restart local v1    # "b":I
    int-to-double v11, v1

    add-double/2addr v2, v11

    .line 519
    add-double/2addr v5, v13

    .line 515
    add-int/lit8 v9, v9, 0x1

    goto :goto_3e

    .line 501
    .end local v1    # "b":I
    :cond_4a
    add-int/lit8 v7, v7, 0x1

    goto :goto_f

    .line 523
    .end local v0    # "a":I
    .end local v8    # "j":I
    .end local v9    # "k":I
    :cond_4d
    div-double v11, v2, v5

    return-wide v11
.end method

.method public getIntArray()[[I
    .registers 2

    .prologue
    .line 422
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    return-object v0
.end method

.method public getLeftSubMatrix()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 9

    .prologue
    const/4 v7, 0x0

    .line 554
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-gt v4, v5, :cond_f

    .line 556
    new-instance v4, Ljava/lang/ArithmeticException;

    const-string v5, "empty submatrix"

    invoke-direct {v4, v5}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 558
    :cond_f
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v4, v4, 0x1f

    shr-int/lit8 v2, v4, 0x5

    .line 559
    .local v2, "length":I
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    filled-new-array {v4, v2}, [I

    move-result-object v4

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [[I

    .line 560
    .local v3, "result":[[I
    const/4 v4, 0x1

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    and-int/lit8 v5, v5, 0x1f

    shl-int/2addr v4, v5

    add-int/lit8 v0, v4, -0x1

    .line 561
    .local v0, "bitMask":I
    if-nez v0, :cond_2e

    .line 563
    const/4 v0, -0x1

    .line 565
    :cond_2e
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v1, v4, -0x1

    .local v1, "i":I
    :goto_32
    if-ltz v1, :cond_49

    .line 567
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v4, v4, v1

    aget-object v5, v3, v1

    invoke-static {v4, v7, v5, v7, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 568
    aget-object v4, v3, v1

    add-int/lit8 v5, v2, -0x1

    aget v6, v4, v5

    and-int/2addr v6, v0

    aput v6, v4, v5

    .line 565
    add-int/lit8 v1, v1, -0x1

    goto :goto_32

    .line 570
    :cond_49
    new-instance v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    invoke-direct {v4, v5, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(I[[I)V

    return-object v4
.end method

.method public getLength()I
    .registers 2

    .prologue
    .line 430
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    return v0
.end method

.method public getRightSubMatrix()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .registers 13

    .prologue
    .line 605
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-gt v7, v8, :cond_e

    .line 607
    new-instance v7, Ljava/lang/ArithmeticException;

    const-string v8, "empty submatrix"

    invoke-direct {v7, v8}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 610
    :cond_e
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    shr-int/lit8 v4, v7, 0x5

    .line 611
    .local v4, "q":I
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    and-int/lit8 v5, v7, 0x1f

    .line 613
    .local v5, "r":I
    new-instance v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    sub-int/2addr v8, v9

    invoke-direct {v6, v7, v8}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(II)V

    .line 615
    .local v6, "result":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v0, v7, -0x1

    .local v0, "i":I
    :goto_26
    if-ltz v0, :cond_8e

    .line 618
    if-eqz v5, :cond_7f

    .line 620
    move v1, v4

    .line 622
    .local v1, "ind":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_2c
    iget v7, v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v7, v7, -0x1

    if-ge v3, v7, :cond_4f

    .line 625
    iget-object v7, v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v7, v7, v0

    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v0

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "ind":I
    .local v2, "ind":I
    aget v8, v8, v1

    ushr-int/2addr v8, v5

    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v9, v9, v0

    aget v9, v9, v2

    rsub-int/lit8 v10, v5, 0x20

    shl-int/2addr v9, v10

    or-int/2addr v8, v9

    aput v8, v7, v3

    .line 622
    add-int/lit8 v3, v3, 0x1

    move v1, v2

    .end local v2    # "ind":I
    .restart local v1    # "ind":I
    goto :goto_2c

    .line 629
    :cond_4f
    iget-object v7, v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v7, v7, v0

    iget v8, v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v8, v8, -0x1

    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v9, v9, v0

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "ind":I
    .restart local v2    # "ind":I
    aget v9, v9, v1

    ushr-int/2addr v9, v5

    aput v9, v7, v8

    .line 630
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v2, v7, :cond_7c

    .line 632
    iget-object v7, v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v7, v7, v0

    iget v8, v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v8, v8, -0x1

    aget v9, v7, v8

    iget-object v10, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v10, v10, v0

    aget v10, v10, v2

    rsub-int/lit8 v11, v5, 0x20

    shl-int/2addr v10, v11

    or-int/2addr v9, v10

    aput v9, v7, v8

    .line 615
    .end local v2    # "ind":I
    .end local v3    # "j":I
    :cond_7c
    :goto_7c
    add-int/lit8 v0, v0, -0x1

    goto :goto_26

    .line 638
    :cond_7f
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v7, v7, v0

    iget-object v8, v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v0

    const/4 v9, 0x0

    iget v10, v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    invoke-static {v7, v4, v8, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_7c

    .line 642
    :cond_8e
    return-object v6
.end method

.method public getRow(I)[I
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 441
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v0, v0, p1

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 1230
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    mul-int/lit8 v2, v2, 0x1f

    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    add-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x1f

    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int v0, v2, v3

    .line 1231
    .local v0, "hash":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v1, v2, :cond_21

    .line 1233
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v3, v3, v1

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int v0, v2, v3

    .line 1231
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 1235
    :cond_21
    return v0
.end method

.method public isZero()Z
    .registers 4

    .prologue
    .line 533
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v0, v2, :cond_1a

    .line 535
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_6
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v1, v2, :cond_17

    .line 537
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v2, v2, v0

    aget v2, v2, v1

    if-eqz v2, :cond_14

    .line 539
    const/4 v2, 0x0

    .line 543
    .end local v1    # "j":I
    :goto_13
    return v2

    .line 535
    .restart local v1    # "j":I
    :cond_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 533
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 543
    .end local v1    # "j":I
    :cond_1a
    const/4 v2, 0x1

    goto :goto_13
.end method

.method public leftMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Permutation;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;
    .registers 7
    .param p1, "p"    # Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .prologue
    .line 809
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->getVector()[I

    move-result-object v1

    .line 810
    .local v1, "pVec":[I
    array-length v3, v1

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-eq v3, v4, :cond_11

    .line 812
    new-instance v3, Ljava/lang/ArithmeticException;

    const-string v4, "length mismatch"

    invoke-direct {v3, v4}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 815
    :cond_11
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    new-array v2, v3, [[I

    .line 817
    .local v2, "result":[[I
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_19
    if-ltz v0, :cond_2a

    .line 819
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget v4, v1, v0

    aget-object v3, v3, v4

    invoke-static {v3}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    move-result-object v3

    aput-object v3, v2, v0

    .line 817
    add-int/lit8 v0, v0, -0x1

    goto :goto_19

    .line 822
    :cond_2a
    new-instance v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    invoke-direct {v3, v4, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(I[[I)V

    return-object v3
.end method

.method public leftMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Vector;)Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    .registers 13
    .param p1, "vec"    # Lorg/spongycastle/pqc/math/linearalgebra/Vector;

    .prologue
    .line 834
    instance-of v9, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    if-nez v9, :cond_c

    .line 836
    new-instance v9, Ljava/lang/ArithmeticException;

    const-string v10, "vector is not defined over GF(2)"

    invoke-direct {v9, v10}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 839
    :cond_c
    iget v9, p1, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    iget v10, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-eq v9, v10, :cond_1a

    .line 841
    new-instance v9, Ljava/lang/ArithmeticException;

    const-string v10, "length mismatch"

    invoke-direct {v9, v10}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 844
    :cond_1a
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .end local p1    # "vec":Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->getVecArray()[I

    move-result-object v8

    .line 845
    .local v8, "v":[I
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    new-array v6, v9, [I

    .line 847
    .local v6, "res":[I
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    shr-int/lit8 v4, v9, 0x5

    .line 848
    .local v4, "q":I
    const/4 v9, 0x1

    iget v10, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    and-int/lit8 v10, v10, 0x1f

    shl-int v5, v9, v10

    .line 851
    .local v5, "r":I
    const/4 v7, 0x0

    .line 852
    .local v7, "row":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_31
    if-ge v2, v4, :cond_56

    .line 854
    const/4 v1, 0x1

    .line 857
    .local v1, "bitMask":I
    :cond_34
    aget v9, v8, v2

    and-int v0, v9, v1

    .line 858
    .local v0, "b":I
    if-eqz v0, :cond_4d

    .line 860
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_3b
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v3, v9, :cond_4d

    .line 862
    aget v9, v6, v3

    iget-object v10, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v10, v10, v7

    aget v10, v10, v3

    xor-int/2addr v9, v10

    aput v9, v6, v3

    .line 860
    add-int/lit8 v3, v3, 0x1

    goto :goto_3b

    .line 865
    .end local v3    # "j":I
    :cond_4d
    add-int/lit8 v7, v7, 0x1

    .line 866
    shl-int/lit8 v1, v1, 0x1

    .line 868
    if-nez v1, :cond_34

    .line 852
    add-int/lit8 v2, v2, 0x1

    goto :goto_31

    .line 872
    .end local v0    # "b":I
    .end local v1    # "bitMask":I
    :cond_56
    const/4 v1, 0x1

    .line 873
    .restart local v1    # "bitMask":I
    :goto_57
    if-eq v1, v5, :cond_77

    .line 875
    aget v9, v8, v4

    and-int v0, v9, v1

    .line 876
    .restart local v0    # "b":I
    if-eqz v0, :cond_72

    .line 878
    const/4 v3, 0x0

    .restart local v3    # "j":I
    :goto_60
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v3, v9, :cond_72

    .line 880
    aget v9, v6, v3

    iget-object v10, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v10, v10, v7

    aget v10, v10, v3

    xor-int/2addr v9, v10

    aput v9, v6, v3

    .line 878
    add-int/lit8 v3, v3, 0x1

    goto :goto_60

    .line 883
    .end local v3    # "j":I
    :cond_72
    add-int/lit8 v7, v7, 0x1

    .line 884
    shl-int/lit8 v1, v1, 0x1

    .line 885
    goto :goto_57

    .line 887
    .end local v0    # "b":I
    :cond_77
    new-instance v9, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    iget v10, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    invoke-direct {v9, v6, v10}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>([II)V

    return-object v9
.end method

.method public leftMultiplyLeftCompactForm(Lorg/spongycastle/pqc/math/linearalgebra/Vector;)Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    .registers 16
    .param p1, "vec"    # Lorg/spongycastle/pqc/math/linearalgebra/Vector;

    .prologue
    const/4 v13, 0x1

    .line 900
    instance-of v11, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    if-nez v11, :cond_d

    .line 902
    new-instance v11, Ljava/lang/ArithmeticException;

    const-string v12, "vector is not defined over GF(2)"

    invoke-direct {v11, v12}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 905
    :cond_d
    iget v11, p1, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    iget v12, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-eq v11, v12, :cond_1b

    .line 907
    new-instance v11, Ljava/lang/ArithmeticException;

    const-string v12, "length mismatch"

    invoke-direct {v11, v12}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 910
    :cond_1b
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .end local p1    # "vec":Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->getVecArray()[I

    move-result-object v9

    .line 911
    .local v9, "v":[I
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v12, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    add-int/2addr v11, v12

    add-int/lit8 v11, v11, 0x1f

    ushr-int/lit8 v11, v11, 0x5

    new-array v7, v11, [I

    .line 914
    .local v7, "res":[I
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    ushr-int/lit8 v10, v11, 0x5

    .line 915
    .local v10, "words":I
    const/4 v8, 0x0

    .line 916
    .local v8, "row":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_32
    if-ge v2, v10, :cond_68

    .line 918
    const/4 v1, 0x1

    .line 921
    .local v1, "bitMask":I
    :cond_35
    aget v11, v9, v2

    and-int v0, v11, v1

    .line 922
    .local v0, "b":I
    if-eqz v0, :cond_5f

    .line 925
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_3c
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v3, v11, :cond_4e

    .line 927
    aget v11, v7, v3

    iget-object v12, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v12, v12, v8

    aget v12, v12, v3

    xor-int/2addr v11, v12

    aput v11, v7, v3

    .line 925
    add-int/lit8 v3, v3, 0x1

    goto :goto_3c

    .line 930
    :cond_4e
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    add-int/2addr v11, v8

    ushr-int/lit8 v4, v11, 0x5

    .line 931
    .local v4, "q":I
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    add-int/2addr v11, v8

    and-int/lit8 v5, v11, 0x1f

    .line 932
    .local v5, "r":I
    aget v11, v7, v4

    shl-int v12, v13, v5

    or-int/2addr v11, v12

    aput v11, v7, v4

    .line 934
    .end local v3    # "j":I
    .end local v4    # "q":I
    .end local v5    # "r":I
    :cond_5f
    add-int/lit8 v8, v8, 0x1

    .line 935
    shl-int/lit8 v1, v1, 0x1

    .line 937
    if-nez v1, :cond_35

    .line 916
    add-int/lit8 v2, v2, 0x1

    goto :goto_32

    .line 941
    .end local v0    # "b":I
    .end local v1    # "bitMask":I
    :cond_68
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    and-int/lit8 v11, v11, 0x1f

    shl-int v6, v13, v11

    .line 942
    .local v6, "rem":I
    const/4 v1, 0x1

    .line 943
    .restart local v1    # "bitMask":I
    :goto_6f
    if-eq v1, v6, :cond_a0

    .line 945
    aget v11, v9, v10

    and-int v0, v11, v1

    .line 946
    .restart local v0    # "b":I
    if-eqz v0, :cond_9b

    .line 949
    const/4 v3, 0x0

    .restart local v3    # "j":I
    :goto_78
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v3, v11, :cond_8a

    .line 951
    aget v11, v7, v3

    iget-object v12, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v12, v12, v8

    aget v12, v12, v3

    xor-int/2addr v11, v12

    aput v11, v7, v3

    .line 949
    add-int/lit8 v3, v3, 0x1

    goto :goto_78

    .line 954
    :cond_8a
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    add-int/2addr v11, v8

    ushr-int/lit8 v4, v11, 0x5

    .line 955
    .restart local v4    # "q":I
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    add-int/2addr v11, v8

    and-int/lit8 v5, v11, 0x1f

    .line 956
    .restart local v5    # "r":I
    aget v11, v7, v4

    shl-int v12, v13, v5

    or-int/2addr v11, v12

    aput v11, v7, v4

    .line 958
    .end local v3    # "j":I
    .end local v4    # "q":I
    .end local v5    # "r":I
    :cond_9b
    add-int/lit8 v8, v8, 0x1

    .line 959
    shl-int/lit8 v1, v1, 0x1

    .line 960
    goto :goto_6f

    .line 962
    .end local v0    # "b":I
    :cond_a0
    new-instance v11, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    iget v12, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v13, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    add-int/2addr v12, v13

    invoke-direct {v11, v7, v12}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>([II)V

    return-object v11
.end method

.method public rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Matrix;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;
    .registers 16
    .param p1, "mat"    # Lorg/spongycastle/pqc/math/linearalgebra/Matrix;

    .prologue
    .line 973
    instance-of v11, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    if-nez v11, :cond_c

    .line 975
    new-instance v11, Ljava/lang/ArithmeticException;

    const-string v12, "matrix is not defined over GF(2)"

    invoke-direct {v11, v12}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 978
    :cond_c
    iget v11, p1, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    iget v12, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    if-eq v11, v12, :cond_1a

    .line 980
    new-instance v11, Ljava/lang/ArithmeticException;

    const-string v12, "length mismatch"

    invoke-direct {v11, v12}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v11

    :cond_1a
    move-object v0, p1

    .line 983
    check-cast v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 984
    .local v0, "a":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    new-instance v10, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v12, p1, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    invoke-direct {v10, v11, v12}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(II)V

    .line 987
    .local v10, "result":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    and-int/lit8 v9, v11, 0x1f

    .line 988
    .local v9, "rest":I
    if-nez v9, :cond_5f

    .line 990
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 996
    .local v3, "d":I
    :goto_2e
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2f
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v7, v11, :cond_9e

    .line 998
    const/4 v2, 0x0

    .line 999
    .local v2, "count":I
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_35
    if-ge v8, v3, :cond_6c

    .line 1001
    iget-object v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v11, v11, v7

    aget v4, v11, v8

    .line 1002
    .local v4, "e":I
    const/4 v6, 0x0

    .local v6, "h":I
    :goto_3e
    const/16 v11, 0x20

    if-ge v6, v11, :cond_69

    .line 1004
    const/4 v11, 0x1

    shl-int/2addr v11, v6

    and-int v1, v4, v11

    .line 1005
    .local v1, "b":I
    if-eqz v1, :cond_64

    .line 1007
    const/4 v5, 0x0

    .local v5, "g":I
    :goto_49
    iget v11, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v5, v11, :cond_64

    .line 1009
    iget-object v11, v10, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v11, v11, v7

    aget v12, v11, v5

    iget-object v13, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v13, v13, v2

    aget v13, v13, v5

    xor-int/2addr v12, v13

    aput v12, v11, v5

    .line 1007
    add-int/lit8 v5, v5, 0x1

    goto :goto_49

    .line 994
    .end local v1    # "b":I
    .end local v2    # "count":I
    .end local v3    # "d":I
    .end local v4    # "e":I
    .end local v5    # "g":I
    .end local v6    # "h":I
    .end local v7    # "i":I
    .end local v8    # "j":I
    :cond_5f
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v3, v11, -0x1

    .restart local v3    # "d":I
    goto :goto_2e

    .line 1012
    .restart local v1    # "b":I
    .restart local v2    # "count":I
    .restart local v4    # "e":I
    .restart local v6    # "h":I
    .restart local v7    # "i":I
    .restart local v8    # "j":I
    :cond_64
    add-int/lit8 v2, v2, 0x1

    .line 1002
    add-int/lit8 v6, v6, 0x1

    goto :goto_3e

    .line 999
    .end local v1    # "b":I
    :cond_69
    add-int/lit8 v8, v8, 0x1

    goto :goto_35

    .line 1015
    .end local v4    # "e":I
    .end local v6    # "h":I
    :cond_6c
    iget-object v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v11, v11, v7

    iget v12, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v12, v12, -0x1

    aget v4, v11, v12

    .line 1016
    .restart local v4    # "e":I
    const/4 v6, 0x0

    .restart local v6    # "h":I
    :goto_77
    if-ge v6, v9, :cond_9b

    .line 1018
    const/4 v11, 0x1

    shl-int/2addr v11, v6

    and-int v1, v4, v11

    .line 1019
    .restart local v1    # "b":I
    if-eqz v1, :cond_96

    .line 1021
    const/4 v5, 0x0

    .restart local v5    # "g":I
    :goto_80
    iget v11, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v5, v11, :cond_96

    .line 1023
    iget-object v11, v10, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v11, v11, v7

    aget v12, v11, v5

    iget-object v13, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v13, v13, v2

    aget v13, v13, v5

    xor-int/2addr v12, v13

    aput v12, v11, v5

    .line 1021
    add-int/lit8 v5, v5, 0x1

    goto :goto_80

    .line 1026
    .end local v5    # "g":I
    :cond_96
    add-int/lit8 v2, v2, 0x1

    .line 1016
    add-int/lit8 v6, v6, 0x1

    goto :goto_77

    .line 996
    .end local v1    # "b":I
    :cond_9b
    add-int/lit8 v7, v7, 0x1

    goto :goto_2f

    .line 1031
    .end local v2    # "count":I
    .end local v4    # "e":I
    .end local v6    # "h":I
    .end local v8    # "j":I
    :cond_9e
    return-object v10
.end method

.method public rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Permutation;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;
    .registers 13
    .param p1, "p"    # Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .prologue
    .line 1044
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->getVector()[I

    move-result-object v2

    .line 1045
    .local v2, "pVec":[I
    array-length v8, v2

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    if-eq v8, v9, :cond_11

    .line 1047
    new-instance v8, Ljava/lang/ArithmeticException;

    const-string v9, "length mismatch"

    invoke-direct {v8, v9}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1050
    :cond_11
    new-instance v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    invoke-direct {v7, v8, v9}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(II)V

    .line 1052
    .local v7, "result":Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    add-int/lit8 v0, v8, -0x1

    .local v0, "i":I
    :goto_1e
    if-ltz v0, :cond_4b

    .line 1054
    ushr-int/lit8 v5, v0, 0x5

    .line 1055
    .local v5, "q":I
    and-int/lit8 v6, v0, 0x1f

    .line 1056
    .local v6, "r":I
    aget v8, v2, v0

    ushr-int/lit8 v3, v8, 0x5

    .line 1057
    .local v3, "pq":I
    aget v8, v2, v0

    and-int/lit8 v4, v8, 0x1f

    .line 1058
    .local v4, "pr":I
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v1, v8, -0x1

    .local v1, "j":I
    :goto_30
    if-ltz v1, :cond_48

    .line 1060
    iget-object v8, v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v1

    aget v9, v8, v5

    iget-object v10, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v10, v10, v1

    aget v10, v10, v3

    ushr-int/2addr v10, v4

    and-int/lit8 v10, v10, 0x1

    shl-int/2addr v10, v6

    or-int/2addr v9, v10

    aput v9, v8, v5

    .line 1058
    add-int/lit8 v1, v1, -0x1

    goto :goto_30

    .line 1052
    :cond_48
    add-int/lit8 v0, v0, -0x1

    goto :goto_1e

    .line 1064
    .end local v1    # "j":I
    .end local v3    # "pq":I
    .end local v4    # "pr":I
    .end local v5    # "q":I
    .end local v6    # "r":I
    :cond_4b
    return-object v7
.end method

.method public rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Vector;)Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    .registers 12
    .param p1, "vec"    # Lorg/spongycastle/pqc/math/linearalgebra/Vector;

    .prologue
    const/4 v9, 0x1

    .line 1075
    instance-of v6, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    if-nez v6, :cond_d

    .line 1077
    new-instance v6, Ljava/lang/ArithmeticException;

    const-string v7, "vector is not defined over GF(2)"

    invoke-direct {v6, v7}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1080
    :cond_d
    iget v6, p1, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    if-eq v6, v7, :cond_1b

    .line 1082
    new-instance v6, Ljava/lang/ArithmeticException;

    const-string v7, "length mismatch"

    invoke-direct {v6, v7}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1085
    :cond_1b
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .end local p1    # "vec":Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->getVecArray()[I

    move-result-object v5

    .line 1086
    .local v5, "v":[I
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v6, v6, 0x1f

    ushr-int/lit8 v6, v6, 0x5

    new-array v4, v6, [I

    .line 1088
    .local v4, "res":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2a
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v2, v6, :cond_5f

    .line 1091
    const/4 v1, 0x0

    .line 1092
    .local v1, "help":I
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_30
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v3, v6, :cond_41

    .line 1094
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v6, v6, v2

    aget v6, v6, v3

    aget v7, v5, v3

    and-int/2addr v6, v7

    xor-int/2addr v1, v6

    .line 1092
    add-int/lit8 v3, v3, 0x1

    goto :goto_30

    .line 1097
    :cond_41
    const/4 v0, 0x0

    .line 1098
    .local v0, "bitValue":I
    const/4 v3, 0x0

    :goto_43
    const/16 v6, 0x20

    if-ge v3, v6, :cond_4f

    .line 1100
    ushr-int v6, v1, v3

    and-int/lit8 v6, v6, 0x1

    xor-int/2addr v0, v6

    .line 1098
    add-int/lit8 v3, v3, 0x1

    goto :goto_43

    .line 1103
    :cond_4f
    if-ne v0, v9, :cond_5c

    .line 1105
    ushr-int/lit8 v6, v2, 0x5

    aget v7, v4, v6

    and-int/lit8 v8, v2, 0x1f

    shl-int v8, v9, v8

    or-int/2addr v7, v8

    aput v7, v4, v6

    .line 1088
    :cond_5c
    add-int/lit8 v2, v2, 0x1

    goto :goto_2a

    .line 1109
    .end local v0    # "bitValue":I
    .end local v1    # "help":I
    .end local v3    # "j":I
    :cond_5f
    new-instance v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    invoke-direct {v6, v4, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>([II)V

    return-object v6
.end method

.method public rightMultiplyRightCompactForm(Lorg/spongycastle/pqc/math/linearalgebra/Vector;)Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    .registers 18
    .param p1, "vec"    # Lorg/spongycastle/pqc/math/linearalgebra/Vector;

    .prologue
    .line 1122
    move-object/from16 v0, p1

    instance-of v12, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    if-nez v12, :cond_e

    .line 1124
    new-instance v12, Ljava/lang/ArithmeticException;

    const-string v13, "vector is not defined over GF(2)"

    invoke-direct {v12, v13}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 1127
    :cond_e
    move-object/from16 v0, p1

    iget v12, v0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    move-object/from16 v0, p0

    iget v13, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    move-object/from16 v0, p0

    iget v14, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/2addr v13, v14

    if-eq v12, v13, :cond_25

    .line 1129
    new-instance v12, Ljava/lang/ArithmeticException;

    const-string v13, "length mismatch"

    invoke-direct {v12, v13}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 1132
    :cond_25
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .end local p1    # "vec":Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    invoke-virtual/range {p1 .. p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->getVecArray()[I

    move-result-object v8

    .line 1133
    .local v8, "v":[I
    move-object/from16 v0, p0

    iget v12, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    add-int/lit8 v12, v12, 0x1f

    ushr-int/lit8 v12, v12, 0x5

    new-array v7, v12, [I

    .line 1135
    .local v7, "res":[I
    move-object/from16 v0, p0

    iget v12, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    shr-int/lit8 v5, v12, 0x5

    .line 1136
    .local v5, "q":I
    move-object/from16 v0, p0

    iget v12, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    and-int/lit8 v6, v12, 0x1f

    .line 1139
    .local v6, "r":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_42
    move-object/from16 v0, p0

    iget v12, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v3, v12, :cond_d1

    .line 1142
    shr-int/lit8 v12, v3, 0x5

    aget v12, v8, v12

    and-int/lit8 v13, v3, 0x1f

    ushr-int/2addr v12, v13

    and-int/lit8 v2, v12, 0x1

    .line 1145
    .local v2, "help":I
    move v9, v5

    .line 1147
    .local v9, "vInd":I
    if-eqz v6, :cond_a6

    .line 1149
    const/4 v11, 0x0

    .line 1151
    .local v11, "vw":I
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_56
    move-object/from16 v0, p0

    iget v12, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v12, v12, -0x1

    if-ge v4, v12, :cond_78

    .line 1154
    add-int/lit8 v10, v9, 0x1

    .end local v9    # "vInd":I
    .local v10, "vInd":I
    aget v12, v8, v9

    ushr-int/2addr v12, v6

    aget v13, v8, v10

    rsub-int/lit8 v14, v6, 0x20

    shl-int/2addr v13, v14

    or-int v11, v12, v13

    .line 1155
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v12, v12, v3

    aget v12, v12, v4

    and-int/2addr v12, v11

    xor-int/2addr v2, v12

    .line 1151
    add-int/lit8 v4, v4, 0x1

    move v9, v10

    .end local v10    # "vInd":I
    .restart local v9    # "vInd":I
    goto :goto_56

    .line 1158
    :cond_78
    add-int/lit8 v10, v9, 0x1

    .end local v9    # "vInd":I
    .restart local v10    # "vInd":I
    aget v12, v8, v9

    ushr-int v11, v12, v6

    .line 1159
    array-length v12, v8

    if-ge v10, v12, :cond_87

    .line 1161
    aget v12, v8, v10

    rsub-int/lit8 v13, v6, 0x20

    shl-int/2addr v12, v13

    or-int/2addr v11, v12

    .line 1163
    :cond_87
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v12, v12, v3

    move-object/from16 v0, p0

    iget v13, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v13, v13, -0x1

    aget v12, v12, v13

    and-int/2addr v12, v11

    xor-int/2addr v2, v12

    move v9, v10

    .line 1175
    .end local v10    # "vInd":I
    .end local v11    # "vw":I
    .restart local v9    # "vInd":I
    :cond_98
    const/4 v1, 0x0

    .line 1176
    .local v1, "bitValue":I
    const/4 v4, 0x0

    :goto_9a
    const/16 v12, 0x20

    if-ge v4, v12, :cond_bf

    .line 1178
    and-int/lit8 v12, v2, 0x1

    xor-int/2addr v1, v12

    .line 1179
    ushr-int/lit8 v2, v2, 0x1

    .line 1176
    add-int/lit8 v4, v4, 0x1

    goto :goto_9a

    .line 1168
    .end local v1    # "bitValue":I
    .end local v4    # "j":I
    :cond_a6
    const/4 v4, 0x0

    .restart local v4    # "j":I
    :goto_a7
    move-object/from16 v0, p0

    iget v12, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v4, v12, :cond_98

    .line 1170
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v12, v12, v3

    aget v12, v12, v4

    add-int/lit8 v10, v9, 0x1

    .end local v9    # "vInd":I
    .restart local v10    # "vInd":I
    aget v13, v8, v9

    and-int/2addr v12, v13

    xor-int/2addr v2, v12

    .line 1168
    add-int/lit8 v4, v4, 0x1

    move v9, v10

    .end local v10    # "vInd":I
    .restart local v9    # "vInd":I
    goto :goto_a7

    .line 1183
    .restart local v1    # "bitValue":I
    :cond_bf
    const/4 v12, 0x1

    if-ne v1, v12, :cond_cd

    .line 1185
    shr-int/lit8 v12, v3, 0x5

    aget v13, v7, v12

    const/4 v14, 0x1

    and-int/lit8 v15, v3, 0x1f

    shl-int/2addr v14, v15

    or-int/2addr v13, v14

    aput v13, v7, v12

    .line 1139
    :cond_cd
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_42

    .line 1189
    .end local v1    # "bitValue":I
    .end local v2    # "help":I
    .end local v4    # "j":I
    .end local v9    # "vInd":I
    :cond_d1
    new-instance v12, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    move-object/from16 v0, p0

    iget v13, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    invoke-direct {v12, v7, v13}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>([II)V

    return-object v12
.end method

.method public toString()Ljava/lang/String;
    .registers 14

    .prologue
    const/16 v12, 0x31

    const/16 v11, 0x30

    const/16 v10, 0x20

    .line 1243
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numColumns:I

    and-int/lit8 v7, v8, 0x1f

    .line 1245
    .local v7, "rest":I
    if-nez v7, :cond_46

    .line 1247
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 1254
    .local v3, "d":I
    :goto_e
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 1255
    .local v2, "buf":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_14
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->numRows:I

    if-ge v4, v8, :cond_7a

    .line 1257
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1258
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_2f
    if-ge v5, v3, :cond_55

    .line 1260
    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v4

    aget v0, v8, v5

    .line 1261
    .local v0, "a":I
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_38
    if-ge v6, v10, :cond_4f

    .line 1263
    ushr-int v8, v0, v6

    and-int/lit8 v1, v8, 0x1

    .line 1264
    .local v1, "b":I
    if-nez v1, :cond_4b

    .line 1266
    invoke-virtual {v2, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1261
    :goto_43
    add-int/lit8 v6, v6, 0x1

    goto :goto_38

    .line 1251
    .end local v0    # "a":I
    .end local v1    # "b":I
    .end local v2    # "buf":Ljava/lang/StringBuffer;
    .end local v3    # "d":I
    .end local v4    # "i":I
    .end local v5    # "j":I
    .end local v6    # "k":I
    :cond_46
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v3, v8, -0x1

    .restart local v3    # "d":I
    goto :goto_e

    .line 1270
    .restart local v0    # "a":I
    .restart local v1    # "b":I
    .restart local v2    # "buf":Ljava/lang/StringBuffer;
    .restart local v4    # "i":I
    .restart local v5    # "j":I
    .restart local v6    # "k":I
    :cond_4b
    invoke-virtual {v2, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 1273
    .end local v1    # "b":I
    :cond_4f
    invoke-virtual {v2, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1258
    add-int/lit8 v5, v5, 0x1

    goto :goto_2f

    .line 1275
    .end local v0    # "a":I
    .end local v6    # "k":I
    :cond_55
    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v8, v8, v4

    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    add-int/lit8 v9, v9, -0x1

    aget v0, v8, v9

    .line 1276
    .restart local v0    # "a":I
    const/4 v6, 0x0

    .restart local v6    # "k":I
    :goto_60
    if-ge v6, v7, :cond_72

    .line 1278
    ushr-int v8, v0, v6

    and-int/lit8 v1, v8, 0x1

    .line 1279
    .restart local v1    # "b":I
    if-nez v1, :cond_6e

    .line 1281
    invoke-virtual {v2, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1276
    :goto_6b
    add-int/lit8 v6, v6, 0x1

    goto :goto_60

    .line 1285
    :cond_6e
    invoke-virtual {v2, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_6b

    .line 1288
    .end local v1    # "b":I
    :cond_72
    const/16 v8, 0xa

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1255
    add-int/lit8 v4, v4, 0x1

    goto :goto_14

    .line 1291
    .end local v0    # "a":I
    .end local v5    # "j":I
    .end local v6    # "k":I
    :cond_7a
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method
