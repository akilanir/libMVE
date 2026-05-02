.class public final Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
.super Ljava/lang/Object;
.source "GeneralPurposeBit.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final DATA_DESCRIPTOR_FLAG:I = 0x8

.field private static final ENCRYPTION_FLAG:I = 0x1

.field private static final NUMBER_OF_SHANNON_FANO_TREES_FLAG:I = 0x4

.field private static final SLIDING_DICTIONARY_SIZE_FLAG:I = 0x2

.field private static final STRONG_ENCRYPTION_FLAG:I = 0x40

.field public static final UFT8_NAMES_FLAG:I = 0x800


# instance fields
.field private dataDescriptorFlag:Z

.field private encryptionFlag:Z

.field private languageEncodingFlag:Z

.field private numberOfShannonFanoTrees:I

.field private slidingDictionarySize:I

.field private strongEncryptionFlag:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    .line 73
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    .line 74
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    .line 75
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    .line 80
    return-void
.end method

.method public static parse([BI)Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
    .registers 7
    .param p0, "data"    # [B
    .param p1, "offset"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 205
    invoke-static {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue([BI)I

    move-result v1

    .line 206
    .local v1, "generalPurposeFlag":I
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;-><init>()V

    .line 207
    .local v0, "b":Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
    and-int/lit8 v2, v1, 0x8

    if-eqz v2, :cond_3a

    move v2, v3

    :goto_10
    invoke-virtual {v0, v2}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->useDataDescriptor(Z)V

    .line 208
    and-int/lit16 v2, v1, 0x800

    if-eqz v2, :cond_3c

    move v2, v3

    :goto_18
    invoke-virtual {v0, v2}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->useUTF8ForNames(Z)V

    .line 209
    and-int/lit8 v2, v1, 0x40

    if-eqz v2, :cond_3e

    move v2, v3

    :goto_20
    invoke-virtual {v0, v2}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->useStrongEncryption(Z)V

    .line 210
    and-int/lit8 v2, v1, 0x1

    if-eqz v2, :cond_40

    :goto_27
    invoke-virtual {v0, v3}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->useEncryption(Z)V

    .line 211
    and-int/lit8 v2, v1, 0x2

    if-eqz v2, :cond_42

    const/16 v2, 0x2000

    :goto_30
    iput v2, v0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->slidingDictionarySize:I

    .line 212
    and-int/lit8 v2, v1, 0x4

    if-eqz v2, :cond_45

    const/4 v2, 0x3

    :goto_37
    iput v2, v0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->numberOfShannonFanoTrees:I

    .line 213
    return-object v0

    :cond_3a
    move v2, v4

    .line 207
    goto :goto_10

    :cond_3c
    move v2, v4

    .line 208
    goto :goto_18

    :cond_3e
    move v2, v4

    .line 209
    goto :goto_20

    :cond_40
    move v3, v4

    .line 210
    goto :goto_27

    .line 211
    :cond_42
    const/16 v2, 0x1000

    goto :goto_30

    .line 212
    :cond_45
    const/4 v2, 0x2

    goto :goto_37
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 239
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 240
    :catch_5
    move-exception v0

    .line 242
    .local v0, "ex":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "GeneralPurposeBit is not Cloneable?"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public encode([BI)V
    .registers 6
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    const/4 v1, 0x0

    .line 187
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    if-eqz v0, :cond_1f

    const/16 v0, 0x8

    :goto_7
    iget-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    if-eqz v2, :cond_21

    const/16 v2, 0x800

    :goto_d
    or-int/2addr v2, v0

    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    if-eqz v0, :cond_23

    const/4 v0, 0x1

    :goto_13
    or-int/2addr v0, v2

    iget-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    if-eqz v2, :cond_1a

    const/16 v1, 0x40

    :cond_1a
    or-int/2addr v0, v1

    invoke-static {v0, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->putShort(I[BI)V

    .line 195
    return-void

    :cond_1f
    move v0, v1

    .line 187
    goto :goto_7

    :cond_21
    move v2, v1

    goto :goto_d

    :cond_23
    move v0, v1

    goto :goto_13
.end method

.method public encode()[B
    .registers 3

    .prologue
    .line 172
    const/4 v1, 0x2

    new-array v0, v1, [B

    .line 173
    .local v0, "result":[B
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->encode([BI)V

    .line 174
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 226
    instance-of v2, p1, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    if-nez v2, :cond_6

    .line 230
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 229
    check-cast v0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    .line 230
    .local v0, "g":Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
    iget-boolean v2, v0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    iget-boolean v3, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    if-ne v2, v3, :cond_5

    iget-boolean v2, v0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    iget-boolean v3, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    if-ne v2, v3, :cond_5

    iget-boolean v2, v0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    iget-boolean v3, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    if-ne v2, v3, :cond_5

    iget-boolean v2, v0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    iget-boolean v3, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    if-ne v2, v3, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method getNumberOfShannonFanoTrees()I
    .registers 2

    .prologue
    .line 164
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->numberOfShannonFanoTrees:I

    return v0
.end method

.method getSlidingDictionarySize()I
    .registers 2

    .prologue
    .line 157
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->slidingDictionarySize:I

    return v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 218
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    if-eqz v0, :cond_21

    move v0, v1

    :goto_7
    mul-int/lit8 v3, v0, 0x11

    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    if-eqz v0, :cond_23

    move v0, v1

    :goto_e
    add-int/2addr v0, v3

    mul-int/lit8 v3, v0, 0xd

    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    if-eqz v0, :cond_25

    move v0, v1

    :goto_16
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x7

    iget-boolean v3, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    if-eqz v3, :cond_27

    :goto_1d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x3

    return v0

    :cond_21
    move v0, v2

    goto :goto_7

    :cond_23
    move v0, v2

    goto :goto_e

    :cond_25
    move v0, v2

    goto :goto_16

    :cond_27
    move v1, v2

    goto :goto_1d
.end method

.method public useDataDescriptor(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 115
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    .line 116
    return-void
.end method

.method public useEncryption(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 131
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    .line 132
    return-void
.end method

.method public useStrongEncryption(Z)V
    .registers 3
    .param p1, "b"    # Z

    .prologue
    .line 147
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    .line 148
    if-eqz p1, :cond_8

    .line 149
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->useEncryption(Z)V

    .line 151
    :cond_8
    return-void
.end method

.method public useUTF8ForNames(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 95
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    .line 96
    return-void
.end method

.method public usesDataDescriptor()Z
    .registers 2

    .prologue
    .line 105
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->dataDescriptorFlag:Z

    return v0
.end method

.method public usesEncryption()Z
    .registers 2

    .prologue
    .line 123
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    return v0
.end method

.method public usesStrongEncryption()Z
    .registers 2

    .prologue
    .line 139
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->encryptionFlag:Z

    if-eqz v0, :cond_a

    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->strongEncryptionFlag:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public usesUTF8ForNames()Z
    .registers 2

    .prologue
    .line 87
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->languageEncodingFlag:Z

    return v0
.end method
