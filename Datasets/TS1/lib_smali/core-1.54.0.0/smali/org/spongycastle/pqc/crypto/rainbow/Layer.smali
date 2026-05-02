.class public Lorg/spongycastle/pqc/crypto/rainbow/Layer;
.super Ljava/lang/Object;
.source "Layer.java"


# instance fields
.field private coeff_alpha:[[[S

.field private coeff_beta:[[[S

.field private coeff_eta:[S

.field private coeff_gamma:[[S

.field private oi:I

.field private vi:I

.field private viNext:I


# direct methods
.method public constructor <init>(BB[[[S[[[S[[S[S)V
    .registers 9
    .param p1, "vi"    # B
    .param p2, "viNext"    # B
    .param p3, "coeffAlpha"    # [[[S
    .param p4, "coeffBeta"    # [[[S
    .param p5, "coeffGamma"    # [[S
    .param p6, "coeffEta"    # [S

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    and-int/lit16 v0, p1, 0xff

    iput v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    .line 56
    and-int/lit16 v0, p2, 0xff

    iput v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->viNext:I

    .line 57
    iget v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->viNext:I

    iget v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    sub-int/2addr v0, v1

    iput v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    .line 60
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_alpha:[[[S

    .line 61
    iput-object p4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_beta:[[[S

    .line 62
    iput-object p5, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_gamma:[[S

    .line 63
    iput-object p6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_eta:[S

    .line 64
    return-void
.end method

.method public constructor <init>(IILjava/security/SecureRandom;)V
    .registers 11
    .param p1, "vi"    # I
    .param p2, "viNext"    # I
    .param p3, "sr"    # Ljava/security/SecureRandom;

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput p1, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    .line 75
    iput p2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->viNext:I

    .line 76
    sub-int v4, p2, p1

    iput v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    .line 79
    iget v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    iget v5, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    filled-new-array {v4, v5, v6}, [I

    move-result-object v4

    sget-object v5, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[[S

    iput-object v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_alpha:[[[S

    .line 80
    iget v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    iget v5, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    filled-new-array {v4, v5, v6}, [I

    move-result-object v4

    sget-object v5, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[[S

    iput-object v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_beta:[[[S

    .line 81
    iget v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    iget v5, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->viNext:I

    filled-new-array {v4, v5}, [I

    move-result-object v4

    sget-object v5, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v5, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[S

    iput-object v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_gamma:[[S

    .line 82
    iget v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    new-array v4, v4, [S

    iput-object v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_eta:[S

    .line 84
    iget v3, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    .line 87
    .local v3, "numOfPoly":I
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_4e
    if-ge v2, v3, :cond_72

    .line 89
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_51
    iget v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    if-ge v0, v4, :cond_6f

    .line 91
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_56
    iget v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    if-ge v1, v4, :cond_6c

    .line 93
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_alpha:[[[S

    aget-object v4, v4, v2

    aget-object v4, v4, v0

    invoke-virtual {p3}, Ljava/security/SecureRandom;->nextInt()I

    move-result v5

    and-int/lit16 v5, v5, 0xff

    int-to-short v5, v5

    aput-short v5, v4, v1

    .line 91
    add-int/lit8 v1, v1, 0x1

    goto :goto_56

    .line 89
    :cond_6c
    add-int/lit8 v0, v0, 0x1

    goto :goto_51

    .line 87
    .end local v1    # "j":I
    :cond_6f
    add-int/lit8 v2, v2, 0x1

    goto :goto_4e

    .line 98
    .end local v0    # "i":I
    :cond_72
    const/4 v2, 0x0

    :goto_73
    if-ge v2, v3, :cond_97

    .line 100
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_76
    iget v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    if-ge v0, v4, :cond_94

    .line 102
    const/4 v1, 0x0

    .restart local v1    # "j":I
    :goto_7b
    iget v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    if-ge v1, v4, :cond_91

    .line 104
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_beta:[[[S

    aget-object v4, v4, v2

    aget-object v4, v4, v0

    invoke-virtual {p3}, Ljava/security/SecureRandom;->nextInt()I

    move-result v5

    and-int/lit16 v5, v5, 0xff

    int-to-short v5, v5

    aput-short v5, v4, v1

    .line 102
    add-int/lit8 v1, v1, 0x1

    goto :goto_7b

    .line 100
    :cond_91
    add-int/lit8 v0, v0, 0x1

    goto :goto_76

    .line 98
    .end local v1    # "j":I
    :cond_94
    add-int/lit8 v2, v2, 0x1

    goto :goto_73

    .line 109
    .end local v0    # "i":I
    :cond_97
    const/4 v2, 0x0

    :goto_98
    if-ge v2, v3, :cond_b2

    .line 111
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_9b
    iget v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->viNext:I

    if-ge v0, v4, :cond_af

    .line 113
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_gamma:[[S

    aget-object v4, v4, v2

    invoke-virtual {p3}, Ljava/security/SecureRandom;->nextInt()I

    move-result v5

    and-int/lit16 v5, v5, 0xff

    int-to-short v5, v5

    aput-short v5, v4, v0

    .line 111
    add-int/lit8 v0, v0, 0x1

    goto :goto_9b

    .line 109
    :cond_af
    add-int/lit8 v2, v2, 0x1

    goto :goto_98

    .line 117
    .end local v0    # "i":I
    :cond_b2
    const/4 v2, 0x0

    :goto_b3
    if-ge v2, v3, :cond_c3

    .line 119
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_eta:[S

    invoke-virtual {p3}, Ljava/security/SecureRandom;->nextInt()I

    move-result v5

    and-int/lit16 v5, v5, 0xff

    int-to-short v5, v5

    aput-short v5, v4, v2

    .line 117
    add-int/lit8 v2, v2, 0x1

    goto :goto_b3

    .line 121
    :cond_c3
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 295
    if-eqz p1, :cond_7

    instance-of v2, p1, Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    if-nez v2, :cond_8

    .line 307
    :cond_7
    :goto_7
    return v1

    :cond_8
    move-object v0, p1

    .line 299
    check-cast v0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 301
    .local v0, "otherLayer":Lorg/spongycastle/pqc/crypto/rainbow/Layer;
    iget v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getVi()I

    move-result v3

    if-ne v2, v3, :cond_7

    iget v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->viNext:I

    .line 302
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getViNext()I

    move-result v3

    if-ne v2, v3, :cond_7

    iget v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    .line 303
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getOi()I

    move-result v3

    if-ne v2, v3, :cond_7

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_alpha:[[[S

    .line 304
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getCoeffAlpha()[[[S

    move-result-object v3

    invoke-static {v2, v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->equals([[[S[[[S)Z

    move-result v2

    if-eqz v2, :cond_7

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_beta:[[[S

    .line 305
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getCoeffBeta()[[[S

    move-result-object v3

    invoke-static {v2, v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->equals([[[S[[[S)Z

    move-result v2

    if-eqz v2, :cond_7

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_gamma:[[S

    .line 306
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getCoeffGamma()[[S

    move-result-object v3

    invoke-static {v2, v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->equals([[S[[S)Z

    move-result v2

    if-eqz v2, :cond_7

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_eta:[S

    .line 307
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->getCoeffEta()[S

    move-result-object v3

    invoke-static {v2, v3}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->equals([S[S)Z

    move-result v2

    if-eqz v2, :cond_7

    const/4 v1, 0x1

    goto :goto_7
.end method

.method public getCoeffAlpha()[[[S
    .registers 2

    .prologue
    .line 253
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_alpha:[[[S

    return-object v0
.end method

.method public getCoeffBeta()[[[S
    .registers 2

    .prologue
    .line 264
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_beta:[[[S

    return-object v0
.end method

.method public getCoeffEta()[S
    .registers 2

    .prologue
    .line 284
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_eta:[S

    return-object v0
.end method

.method public getCoeffGamma()[[S
    .registers 2

    .prologue
    .line 274
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_gamma:[[S

    return-object v0
.end method

.method public getOi()I
    .registers 2

    .prologue
    .line 243
    iget v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    return v0
.end method

.method public getVi()I
    .registers 2

    .prologue
    .line 223
    iget v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    return v0
.end method

.method public getViNext()I
    .registers 2

    .prologue
    .line 233
    iget v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->viNext:I

    return v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 312
    iget v0, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    .line 313
    .local v0, "hash":I
    mul-int/lit8 v1, v0, 0x25

    iget v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->viNext:I

    add-int v0, v1, v2

    .line 314
    mul-int/lit8 v1, v0, 0x25

    iget v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    add-int v0, v1, v2

    .line 315
    mul-int/lit8 v1, v0, 0x25

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_alpha:[[[S

    invoke-static {v2}, Lorg/spongycastle/util/Arrays;->hashCode([[[S)I

    move-result v2

    add-int v0, v1, v2

    .line 316
    mul-int/lit8 v1, v0, 0x25

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_beta:[[[S

    invoke-static {v2}, Lorg/spongycastle/util/Arrays;->hashCode([[[S)I

    move-result v2

    add-int v0, v1, v2

    .line 317
    mul-int/lit8 v1, v0, 0x25

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_gamma:[[S

    invoke-static {v2}, Lorg/spongycastle/util/Arrays;->hashCode([[S)I

    move-result v2

    add-int v0, v1, v2

    .line 318
    mul-int/lit8 v1, v0, 0x25

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_eta:[S

    invoke-static {v2}, Lorg/spongycastle/util/Arrays;->hashCode([S)I

    move-result v2

    add-int v0, v1, v2

    .line 320
    return v0
.end method

.method public plugInVinegars([S)[[S
    .registers 13
    .param p1, "x"    # [S

    .prologue
    .line 138
    const/4 v5, 0x0

    .line 140
    .local v5, "tmpMult":S
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    iget v7, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    add-int/lit8 v7, v7, 0x1

    filled-new-array {v6, v7}, [I

    move-result-object v6

    sget-object v7, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v7, v6}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[S

    .line 142
    .local v0, "coeff":[[S
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    new-array v4, v6, [S

    .line 148
    .local v4, "sum":[S
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_18
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    if-ge v3, v6, :cond_4b

    .line 150
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1d
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    if-ge v1, v6, :cond_48

    .line 152
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_22
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    if-ge v2, v6, :cond_45

    .line 155
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_beta:[[[S

    aget-object v6, v6, v3

    aget-object v6, v6, v1

    aget-short v6, v6, v2

    aget-short v7, p1, v1

    invoke-static {v6, v7}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    move-result v5

    .line 157
    aget-short v6, p1, v2

    invoke-static {v5, v6}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    move-result v5

    .line 159
    aget-short v6, v4, v3

    invoke-static {v6, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    move-result v6

    aput-short v6, v4, v3

    .line 152
    add-int/lit8 v2, v2, 0x1

    goto :goto_22

    .line 150
    :cond_45
    add-int/lit8 v1, v1, 0x1

    goto :goto_1d

    .line 148
    .end local v2    # "j":I
    :cond_48
    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    .line 165
    .end local v1    # "i":I
    :cond_4b
    const/4 v3, 0x0

    :goto_4c
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    if-ge v3, v6, :cond_7d

    .line 167
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_51
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    if-ge v1, v6, :cond_7a

    .line 169
    const/4 v2, 0x0

    .restart local v2    # "j":I
    :goto_56
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    if-ge v2, v6, :cond_77

    .line 172
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_alpha:[[[S

    aget-object v6, v6, v3

    aget-object v6, v6, v1

    aget-short v6, v6, v2

    aget-short v7, p1, v2

    invoke-static {v6, v7}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    move-result v5

    .line 174
    aget-object v6, v0, v3

    aget-object v7, v0, v3

    aget-short v7, v7, v1

    invoke-static {v7, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    move-result v7

    aput-short v7, v6, v1

    .line 169
    add-int/lit8 v2, v2, 0x1

    goto :goto_56

    .line 167
    :cond_77
    add-int/lit8 v1, v1, 0x1

    goto :goto_51

    .line 165
    .end local v2    # "j":I
    :cond_7a
    add-int/lit8 v3, v3, 0x1

    goto :goto_4c

    .line 179
    .end local v1    # "i":I
    :cond_7d
    const/4 v3, 0x0

    :goto_7e
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    if-ge v3, v6, :cond_a1

    .line 181
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_83
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    if-ge v1, v6, :cond_9e

    .line 184
    iget-object v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_gamma:[[S

    aget-object v6, v6, v3

    aget-short v6, v6, v1

    aget-short v7, p1, v1

    invoke-static {v6, v7}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->multElem(SS)S

    move-result v5

    .line 187
    aget-short v6, v4, v3

    invoke-static {v6, v5}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    move-result v6

    aput-short v6, v4, v3

    .line 181
    add-int/lit8 v1, v1, 0x1

    goto :goto_83

    .line 179
    :cond_9e
    add-int/lit8 v3, v3, 0x1

    goto :goto_7e

    .line 191
    .end local v1    # "i":I
    :cond_a1
    const/4 v3, 0x0

    :goto_a2
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    if-ge v3, v6, :cond_cc

    .line 193
    iget v1, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    .restart local v1    # "i":I
    :goto_a8
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->viNext:I

    if-ge v1, v6, :cond_c9

    .line 197
    aget-object v6, v0, v3

    iget v7, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    sub-int v7, v1, v7

    iget-object v8, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_gamma:[[S

    aget-object v8, v8, v3

    aget-short v8, v8, v1

    aget-object v9, v0, v3

    iget v10, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->vi:I

    sub-int v10, v1, v10

    aget-short v9, v9, v10

    invoke-static {v8, v9}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    move-result v8

    aput-short v8, v6, v7

    .line 193
    add-int/lit8 v1, v1, 0x1

    goto :goto_a8

    .line 191
    :cond_c9
    add-int/lit8 v3, v3, 0x1

    goto :goto_a2

    .line 202
    .end local v1    # "i":I
    :cond_cc
    const/4 v3, 0x0

    :goto_cd
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    if-ge v3, v6, :cond_e0

    .line 205
    aget-short v6, v4, v3

    iget-object v7, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->coeff_eta:[S

    aget-short v7, v7, v3

    invoke-static {v6, v7}, Lorg/spongycastle/pqc/crypto/rainbow/util/GF2Field;->addElem(SS)S

    move-result v6

    aput-short v6, v4, v3

    .line 202
    add-int/lit8 v3, v3, 0x1

    goto :goto_cd

    .line 209
    :cond_e0
    const/4 v3, 0x0

    :goto_e1
    iget v6, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    if-ge v3, v6, :cond_f0

    .line 211
    aget-object v6, v0, v3

    iget v7, p0, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->oi:I

    aget-short v8, v4, v3

    aput-short v8, v6, v7

    .line 209
    add-int/lit8 v3, v3, 0x1

    goto :goto_e1

    .line 213
    :cond_f0
    return-object v0
.end method
