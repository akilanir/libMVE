.class public Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;
.super Ljava/lang/Object;
.source "DHKEKGenerator.java"

# interfaces
.implements Lorg/spongycastle/crypto/DerivationFunction;


# instance fields
.field private algorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private final digest:Lorg/spongycastle/crypto/Digest;

.field private keySize:I

.field private partyAInfo:[B

.field private z:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/Digest;)V
    .registers 2
    .param p1, "digest"    # Lorg/spongycastle/crypto/Digest;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 34
    return-void
.end method


# virtual methods
.method public generateBytes([BII)I
    .registers 23
    .param p1, "out"    # [B
    .param p2, "outOff"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 54
    move-object/from16 v0, p1

    array-length v14, v0

    sub-int v14, v14, p3

    move/from16 v0, p2

    if-ge v14, v0, :cond_11

    .line 56
    new-instance v14, Lorg/spongycastle/crypto/DataLengthException;

    const-string v15, "output buffer too small"

    invoke-direct {v14, v15}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 59
    :cond_11
    move/from16 v0, p3

    int-to-long v8, v0

    .line 60
    .local v8, "oBytes":J
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v14}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v11

    .line 68
    .local v11, "outLen":I
    const-wide v14, 0x1ffffffffL

    cmp-long v14, v8, v14

    if-lez v14, :cond_2d

    .line 70
    new-instance v14, Ljava/lang/IllegalArgumentException;

    const-string v15, "Output length too large"

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 73
    :cond_2d
    int-to-long v14, v11

    add-long/2addr v14, v8

    const-wide/16 v16, 0x1

    sub-long v14, v14, v16

    int-to-long v0, v11

    move-wide/from16 v16, v0

    div-long v14, v14, v16

    long-to-int v3, v14

    .line 75
    .local v3, "cThreshold":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v14}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v14

    new-array v5, v14, [B

    .line 77
    .local v5, "dig":[B
    const/4 v4, 0x1

    .line 79
    .local v4, "counter":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_45
    if-ge v7, v3, :cond_119

    .line 81
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->z:[B

    const/16 v16, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->z:[B

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v17, v0

    invoke-interface/range {v14 .. v17}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 84
    new-instance v12, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v12}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 86
    .local v12, "v1":Lorg/spongycastle/asn1/ASN1EncodableVector;
    new-instance v13, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v13}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 88
    .local v13, "v2":Lorg/spongycastle/asn1/ASN1EncodableVector;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->algorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    invoke-virtual {v13, v14}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 89
    new-instance v14, Lorg/spongycastle/asn1/DEROctetString;

    invoke-static {v4}, Lorg/spongycastle/util/Pack;->intToBigEndian(I)[B

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-virtual {v13, v14}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 91
    new-instance v14, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v14, v13}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    invoke-virtual {v12, v14}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 93
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->partyAInfo:[B

    if-eqz v14, :cond_a0

    .line 95
    new-instance v14, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v15, 0x1

    const/16 v16, 0x0

    new-instance v17, Lorg/spongycastle/asn1/DEROctetString;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->partyAInfo:[B

    move-object/from16 v18, v0

    invoke-direct/range {v17 .. v18}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct/range {v14 .. v17}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v12, v14}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 98
    :cond_a0
    new-instance v14, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v15, 0x1

    const/16 v16, 0x2

    new-instance v17, Lorg/spongycastle/asn1/DEROctetString;

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->keySize:I

    move/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lorg/spongycastle/util/Pack;->intToBigEndian(I)[B

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct/range {v14 .. v17}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v12, v14}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 102
    :try_start_ba
    new-instance v14, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v14, v12}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    const-string v15, "DER"

    invoke-virtual {v14, v15}, Lorg/spongycastle/asn1/DERSequence;->getEncoded(Ljava/lang/String;)[B

    move-result-object v10

    .line 104
    .local v10, "other":[B
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    const/4 v15, 0x0

    array-length v0, v10

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-interface {v14, v10, v15, v0}, Lorg/spongycastle/crypto/Digest;->update([BII)V
    :try_end_d2
    .catch Ljava/io/IOException; {:try_start_ba .. :try_end_d2} :catch_f0

    .line 111
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    const/4 v15, 0x0

    invoke-interface {v14, v5, v15}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 113
    move/from16 v0, p3

    if-le v0, v11, :cond_10e

    .line 115
    const/4 v14, 0x0

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v5, v14, v0, v1, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 116
    add-int p2, p2, v11

    .line 117
    sub-int p3, p3, v11

    .line 124
    :goto_ea
    add-int/lit8 v4, v4, 0x1

    .line 79
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_45

    .line 106
    .end local v10    # "other":[B
    :catch_f0
    move-exception v6

    .line 108
    .local v6, "e":Ljava/io/IOException;
    new-instance v14, Ljava/lang/IllegalArgumentException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "unable to encode parameter info: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 121
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v10    # "other":[B
    :cond_10e
    const/4 v14, 0x0

    move-object/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    invoke-static {v5, v14, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_ea

    .line 127
    .end local v10    # "other":[B
    .end local v12    # "v1":Lorg/spongycastle/asn1/ASN1EncodableVector;
    .end local v13    # "v2":Lorg/spongycastle/asn1/ASN1EncodableVector;
    :cond_119
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v14}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 129
    long-to-int v14, v8

    return v14
.end method

.method public getDigest()Lorg/spongycastle/crypto/Digest;
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    return-object v0
.end method

.method public init(Lorg/spongycastle/crypto/DerivationParameters;)V
    .registers 4
    .param p1, "param"    # Lorg/spongycastle/crypto/DerivationParameters;

    .prologue
    .line 38
    move-object v0, p1

    check-cast v0, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;

    .line 40
    .local v0, "params":Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;
    invoke-virtual {v0}, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->algorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 41
    invoke-virtual {v0}, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->getKeySize()I

    move-result v1

    iput v1, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->keySize:I

    .line 42
    invoke-virtual {v0}, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->getZ()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->z:[B

    .line 43
    invoke-virtual {v0}, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->getExtraInfo()[B

    move-result-object v1

    iput-object v1, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->partyAInfo:[B

    .line 44
    return-void
.end method
