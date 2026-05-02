.class public Lorg/spongycastle/pqc/jcajce/provider/mceliece/McElieceCCA2KeyFactorySpi;
.super Ljava/security/KeyFactorySpi;
.source "McElieceCCA2KeyFactorySpi.java"


# static fields
.field public static final OID:Ljava/lang/String; = "1.3.6.1.4.1.8301.3.1.3.4.2"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/security/KeyFactorySpi;-><init>()V

    return-void
.end method


# virtual methods
.method protected engineGeneratePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;
    .registers 3
    .param p1, "keySpec"    # Ljava/security/spec/KeySpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    .prologue
    .line 332
    const/4 v0, 0x0

    return-object v0
.end method

.method protected engineGeneratePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;
    .registers 3
    .param p1, "keySpec"    # Ljava/security/spec/KeySpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    .prologue
    .line 326
    const/4 v0, 0x0

    return-object v0
.end method

.method protected engineGetKeySpec(Ljava/security/Key;Ljava/lang/Class;)Ljava/security/spec/KeySpec;
    .registers 4
    .param p1, "key"    # Ljava/security/Key;
    .param p2, "tClass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    .prologue
    .line 338
    const/4 v0, 0x0

    return-object v0
.end method

.method protected engineTranslateKey(Ljava/security/Key;)Ljava/security/Key;
    .registers 3
    .param p1, "key"    # Ljava/security/Key;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 344
    const/4 v0, 0x0

    return-object v0
.end method

.method public generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;
    .registers 24
    .param p1, "keySpec"    # Ljava/security/spec/KeySpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    .prologue
    .line 129
    move-object/from16 v0, p1

    instance-of v1, v0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;

    if-eqz v1, :cond_10

    .line 131
    new-instance v1, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;

    check-cast p1, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;

    .end local p1    # "keySpec":Ljava/security/spec/KeySpec;
    move-object/from16 v0, p1

    invoke-direct {v1, v0}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;-><init>(Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;)V

    .line 190
    :goto_f
    return-object v1

    .line 134
    .restart local p1    # "keySpec":Ljava/security/spec/KeySpec;
    :cond_10
    move-object/from16 v0, p1

    instance-of v1, v0, Ljava/security/spec/PKCS8EncodedKeySpec;

    if-eqz v1, :cond_f3

    .line 137
    check-cast p1, Ljava/security/spec/PKCS8EncodedKeySpec;

    .end local p1    # "keySpec":Ljava/security/spec/KeySpec;
    invoke-virtual/range {p1 .. p1}, Ljava/security/spec/PKCS8EncodedKeySpec;->getEncoded()[B

    move-result-object v14

    .line 144
    .local v14, "encKey":[B
    :try_start_1c
    invoke-static {v14}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    invoke-static {v1}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_23} :catch_bc

    move-result-object v18

    .line 154
    .local v18, "pki":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    :try_start_24
    invoke-virtual/range {v18 .. v18}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->parsePrivateKey()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    invoke-interface {v1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v16

    .line 157
    .local v16, "innerType":Lorg/spongycastle/asn1/ASN1Primitive;
    move-object/from16 v0, v16

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    move-object/from16 v19, v0

    .line 160
    .local v19, "privKey":Lorg/spongycastle/asn1/ASN1Sequence;
    const/4 v1, 0x0

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 161
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->toString()Ljava/lang/String;

    move-result-object v17

    .line 164
    .local v17, "oidString":Ljava/lang/String;
    const/4 v1, 0x1

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v11

    .line 165
    .local v11, "bigN":Ljava/math/BigInteger;
    invoke-virtual {v11}, Ljava/math/BigInteger;->intValue()I

    move-result v3

    .line 168
    .local v3, "n":I
    const/4 v1, 0x2

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v10

    .line 169
    .local v10, "bigK":Ljava/math/BigInteger;
    invoke-virtual {v10}, Ljava/math/BigInteger;->intValue()I

    move-result v4

    .line 173
    .local v4, "k":I
    const/4 v1, 0x3

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 174
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v5

    .line 176
    .local v5, "encFieldPoly":[B
    const/4 v1, 0x4

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 177
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v6

    .line 179
    .local v6, "encGoppaPoly":[B
    const/4 v1, 0x5

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v7

    .line 181
    .local v7, "encP":[B
    const/4 v1, 0x6

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v8

    .line 183
    .local v8, "encH":[B
    const/4 v1, 0x7

    move-object/from16 v0, v19

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v20

    check-cast v20, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 184
    .local v20, "qSeq":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v1

    new-array v9, v1, [[B

    .line 185
    .local v9, "encQInv":[[B
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_a5
    invoke-virtual/range {v20 .. v20}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v1

    if-ge v15, v1, :cond_d8

    .line 187
    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v1

    aput-object v1, v9, v15
    :try_end_b9
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_b9} :catch_ea

    .line 185
    add-int/lit8 v15, v15, 0x1

    goto :goto_a5

    .line 146
    .end local v3    # "n":I
    .end local v4    # "k":I
    .end local v5    # "encFieldPoly":[B
    .end local v6    # "encGoppaPoly":[B
    .end local v7    # "encP":[B
    .end local v8    # "encH":[B
    .end local v9    # "encQInv":[[B
    .end local v10    # "bigK":Ljava/math/BigInteger;
    .end local v11    # "bigN":Ljava/math/BigInteger;
    .end local v15    # "i":I
    .end local v16    # "innerType":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v17    # "oidString":Ljava/lang/String;
    .end local v18    # "pki":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    .end local v19    # "privKey":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v20    # "qSeq":Lorg/spongycastle/asn1/ASN1Sequence;
    :catch_bc
    move-exception v13

    .line 148
    .local v13, "e":Ljava/io/IOException;
    new-instance v1, Ljava/security/spec/InvalidKeySpecException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Unable to decode PKCS8EncodedKeySpec: "

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 190
    .end local v13    # "e":Ljava/io/IOException;
    .restart local v3    # "n":I
    .restart local v4    # "k":I
    .restart local v5    # "encFieldPoly":[B
    .restart local v6    # "encGoppaPoly":[B
    .restart local v7    # "encP":[B
    .restart local v8    # "encH":[B
    .restart local v9    # "encQInv":[[B
    .restart local v10    # "bigK":Ljava/math/BigInteger;
    .restart local v11    # "bigN":Ljava/math/BigInteger;
    .restart local v15    # "i":I
    .restart local v16    # "innerType":Lorg/spongycastle/asn1/ASN1Primitive;
    .restart local v17    # "oidString":Ljava/lang/String;
    .restart local v18    # "pki":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    .restart local v19    # "privKey":Lorg/spongycastle/asn1/ASN1Sequence;
    .restart local v20    # "qSeq":Lorg/spongycastle/asn1/ASN1Sequence;
    :cond_d8
    :try_start_d8
    new-instance v21, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;

    new-instance v1, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;

    const-string v2, "1.3.6.1.4.1.8301.3.1.3.4.2"

    invoke-direct/range {v1 .. v9}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;-><init>(Ljava/lang/String;II[B[B[B[B[[B)V

    move-object/from16 v0, v21

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;-><init>(Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;)V
    :try_end_e6
    .catch Ljava/io/IOException; {:try_start_d8 .. :try_end_e6} :catch_ea

    move-object/from16 v1, v21

    goto/16 :goto_f

    .line 195
    .end local v3    # "n":I
    .end local v4    # "k":I
    .end local v5    # "encFieldPoly":[B
    .end local v6    # "encGoppaPoly":[B
    .end local v7    # "encP":[B
    .end local v8    # "encH":[B
    .end local v9    # "encQInv":[[B
    .end local v10    # "bigK":Ljava/math/BigInteger;
    .end local v11    # "bigN":Ljava/math/BigInteger;
    .end local v15    # "i":I
    .end local v16    # "innerType":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v17    # "oidString":Ljava/lang/String;
    .end local v19    # "privKey":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v20    # "qSeq":Lorg/spongycastle/asn1/ASN1Sequence;
    :catch_ea
    move-exception v12

    .line 197
    .local v12, "cce":Ljava/io/IOException;
    new-instance v1, Ljava/security/spec/InvalidKeySpecException;

    const-string v2, "Unable to decode PKCS8EncodedKeySpec."

    invoke-direct {v1, v2}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 202
    .end local v12    # "cce":Ljava/io/IOException;
    .end local v14    # "encKey":[B
    .end local v18    # "pki":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    .restart local p1    # "keySpec":Ljava/security/spec/KeySpec;
    :cond_f3
    new-instance v1, Ljava/security/spec/InvalidKeySpecException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Unsupported key specification: "

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 203
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v21, "."

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public generatePrivate(Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;)Ljava/security/PrivateKey;
    .registers 14
    .param p1, "pki"    # Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    .prologue
    .line 313
    :try_start_0
    invoke-virtual {p1}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->parsePrivateKey()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v10

    .line 314
    .local v10, "innerType":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-static {v10}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;

    move-result-object v11

    .line 315
    .local v11, "key":Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;
    new-instance v0, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;

    invoke-virtual {v11}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->getOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v1

    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->getN()I

    move-result v2

    invoke-virtual {v11}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->getK()I

    move-result v3

    invoke-virtual {v11}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    move-result-object v4

    invoke-virtual {v11}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->getGoppaPoly()Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    move-result-object v5

    invoke-virtual {v11}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->getP()Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    move-result-object v6

    invoke-virtual {v11}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->getH()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    move-result-object v7

    invoke-virtual {v11}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;->getQInv()[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    move-result-object v8

    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;-><init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2mField;Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;Lorg/spongycastle/pqc/math/linearalgebra/Permutation;Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)V
    :try_end_35
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_35} :catch_36

    return-object v0

    .line 317
    .end local v10    # "innerType":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v11    # "key":Lorg/spongycastle/pqc/asn1/McElieceCCA2PrivateKey;
    :catch_36
    move-exception v9

    .line 319
    .local v9, "cce":Ljava/io/IOException;
    new-instance v0, Ljava/security/spec/InvalidKeySpecException;

    const-string v1, "Unable to decode PKCS8EncodedKeySpec"

    invoke-direct {v0, v1}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;
    .registers 18
    .param p1, "keySpec"    # Ljava/security/spec/KeySpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    .prologue
    .line 58
    move-object/from16 v0, p1

    instance-of v13, v0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;

    if-eqz v13, :cond_10

    .line 60
    new-instance v13, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;

    check-cast p1, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;

    .end local p1    # "keySpec":Ljava/security/spec/KeySpec;
    move-object/from16 v0, p1

    invoke-direct {v13, v0}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;-><init>(Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;)V

    .line 101
    :goto_f
    return-object v13

    .line 63
    .restart local p1    # "keySpec":Ljava/security/spec/KeySpec;
    :cond_10
    move-object/from16 v0, p1

    instance-of v13, v0, Ljava/security/spec/X509EncodedKeySpec;

    if-eqz v13, :cond_96

    .line 66
    check-cast p1, Ljava/security/spec/X509EncodedKeySpec;

    .end local p1    # "keySpec":Ljava/security/spec/KeySpec;
    invoke-virtual/range {p1 .. p1}, Ljava/security/spec/X509EncodedKeySpec;->getEncoded()[B

    move-result-object v5

    .line 72
    .local v5, "encKey":[B
    :try_start_1c
    invoke-static {v5}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v13

    invoke-static {v13}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_23} :catch_8b

    move-result-object v10

    .line 83
    .local v10, "pki":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    :try_start_24
    invoke-virtual {v10}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->parsePublicKey()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v6

    .line 84
    .local v6, "innerType":Lorg/spongycastle/asn1/ASN1Primitive;
    move-object v0, v6

    check-cast v0, Lorg/spongycastle/asn1/ASN1Sequence;

    move-object v11, v0

    .line 87
    .local v11, "publicKey":Lorg/spongycastle/asn1/ASN1Sequence;
    const/4 v13, 0x0

    invoke-virtual {v11, v13}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v13

    check-cast v13, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 88
    invoke-virtual {v13}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->toString()Ljava/lang/String;

    move-result-object v9

    .line 91
    .local v9, "oidString":Ljava/lang/String;
    const/4 v13, 0x1

    invoke-virtual {v11, v13}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v13

    check-cast v13, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v13}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v1

    .line 92
    .local v1, "bigN":Ljava/math/BigInteger;
    invoke-virtual {v1}, Ljava/math/BigInteger;->intValue()I

    move-result v8

    .line 95
    .local v8, "n":I
    const/4 v13, 0x2

    invoke-virtual {v11, v13}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v13

    check-cast v13, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-virtual {v13}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v2

    .line 96
    .local v2, "bigT":Ljava/math/BigInteger;
    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    move-result v12

    .line 99
    .local v12, "t":I
    const/4 v13, 0x3

    invoke-virtual {v11, v13}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v13

    check-cast v13, Lorg/spongycastle/asn1/ASN1OctetString;

    invoke-virtual {v13}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v7

    .line 101
    .local v7, "matrixG":[B
    new-instance v13, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;

    new-instance v14, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;

    const-string v15, "1.3.6.1.4.1.8301.3.1.3.4.2"

    invoke-direct {v14, v15, v8, v12, v7}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;-><init>(Ljava/lang/String;II[B)V

    invoke-direct {v13, v14}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;-><init>(Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;)V
    :try_end_6c
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_6c} :catch_6d

    goto :goto_f

    .line 104
    .end local v1    # "bigN":Ljava/math/BigInteger;
    .end local v2    # "bigT":Ljava/math/BigInteger;
    .end local v6    # "innerType":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v7    # "matrixG":[B
    .end local v8    # "n":I
    .end local v9    # "oidString":Ljava/lang/String;
    .end local v11    # "publicKey":Lorg/spongycastle/asn1/ASN1Sequence;
    .end local v12    # "t":I
    :catch_6d
    move-exception v3

    .line 106
    .local v3, "cce":Ljava/io/IOException;
    new-instance v13, Ljava/security/spec/InvalidKeySpecException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Unable to decode X509EncodedKeySpec: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    .line 108
    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 74
    .end local v3    # "cce":Ljava/io/IOException;
    .end local v10    # "pki":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    :catch_8b
    move-exception v4

    .line 76
    .local v4, "e":Ljava/io/IOException;
    new-instance v13, Ljava/security/spec/InvalidKeySpecException;

    invoke-virtual {v4}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 112
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "encKey":[B
    .restart local p1    # "keySpec":Ljava/security/spec/KeySpec;
    :cond_96
    new-instance v13, Ljava/security/spec/InvalidKeySpecException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Unsupported key specification: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    .line 113
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v13
.end method

.method public generatePublic(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)Ljava/security/PublicKey;
    .registers 10
    .param p1, "pki"    # Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    .prologue
    .line 296
    :try_start_0
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;->parsePublicKey()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    .line 297
    .local v1, "innerType":Lorg/spongycastle/asn1/ASN1Primitive;
    check-cast v1, Lorg/spongycastle/asn1/ASN1Sequence;

    .end local v1    # "innerType":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-static {v1}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;

    move-result-object v2

    .line 298
    .local v2, "key":Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;
    new-instance v3, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;

    invoke-virtual {v2}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->getOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v4

    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->getN()I

    move-result v5

    invoke-virtual {v2}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->getT()I

    move-result v6

    invoke-virtual {v2}, Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;->getG()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    move-result-object v7

    invoke-direct {v3, v4, v5, v6, v7}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;-><init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;)V
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_23} :catch_24

    return-object v3

    .line 300
    .end local v2    # "key":Lorg/spongycastle/pqc/asn1/McElieceCCA2PublicKey;
    :catch_24
    move-exception v0

    .line 302
    .local v0, "cce":Ljava/io/IOException;
    new-instance v3, Ljava/security/spec/InvalidKeySpecException;

    const-string v4, "Unable to decode X509EncodedKeySpec"

    invoke-direct {v3, v4}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public getKeySpec(Ljava/security/Key;Ljava/lang/Class;)Ljava/security/spec/KeySpec;
    .registers 14
    .param p1, "key"    # Ljava/security/Key;
    .param p2, "keySpec"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    .prologue
    .line 229
    instance-of v0, p1, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;

    if-eqz v0, :cond_45

    .line 231
    const-class v0, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 233
    new-instance v0, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    .line 255
    :goto_15
    return-object v0

    .line 235
    :cond_16
    const-class v0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;

    .line 236
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_9d

    move-object v9, p1

    .line 238
    check-cast v9, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;

    .line 239
    .local v9, "privKey":Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;
    new-instance v0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;

    const-string v1, "1.3.6.1.4.1.8301.3.1.3.4.2"

    invoke-virtual {v9}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->getN()I

    move-result v2

    .line 240
    invoke-virtual {v9}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->getK()I

    move-result v3

    invoke-virtual {v9}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->getField()Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;

    move-result-object v4

    invoke-virtual {v9}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->getGoppaPoly()Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    move-result-object v5

    .line 241
    invoke-virtual {v9}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->getP()Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    move-result-object v6

    invoke-virtual {v9}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->getH()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    move-result-object v7

    invoke-virtual {v9}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;->getQInv()[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;

    move-result-object v8

    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PrivateKeySpec;-><init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2mField;Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;Lorg/spongycastle/pqc/math/linearalgebra/Permutation;Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;[Lorg/spongycastle/pqc/math/linearalgebra/PolynomialGF2mSmallM;)V

    goto :goto_15

    .line 244
    .end local v9    # "privKey":Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;
    :cond_45
    instance-of v0, p1, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;

    if-eqz v0, :cond_7a

    .line 246
    const-class v0, Ljava/security/spec/X509EncodedKeySpec;

    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_5b

    .line 248
    new-instance v0, Ljava/security/spec/X509EncodedKeySpec;

    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    goto :goto_15

    .line 250
    :cond_5b
    const-class v0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;

    .line 251
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_9d

    move-object v10, p1

    .line 253
    check-cast v10, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;

    .line 254
    .local v10, "pubKey":Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;
    new-instance v0, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;

    const-string v1, "1.3.6.1.4.1.8301.3.1.3.4.2"

    invoke-virtual {v10}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->getN()I

    move-result v2

    .line 255
    invoke-virtual {v10}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->getT()I

    move-result v3

    invoke-virtual {v10}, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;->getG()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/spongycastle/pqc/jcajce/spec/McElieceCCA2PublicKeySpec;-><init>(Ljava/lang/String;IILorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;)V

    goto :goto_15

    .line 260
    .end local v10    # "pubKey":Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;
    :cond_7a
    new-instance v0, Ljava/security/spec/InvalidKeySpecException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported key type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 261
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 264
    :cond_9d
    new-instance v0, Ljava/security/spec/InvalidKeySpecException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown key specification: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/spec/InvalidKeySpecException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public translateKey(Ljava/security/Key;)Ljava/security/Key;
    .registers 4
    .param p1, "key"    # Ljava/security/Key;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 280
    instance-of v0, p1, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PrivateKey;

    if-nez v0, :cond_8

    instance-of v0, p1, Lorg/spongycastle/pqc/jcajce/provider/mceliece/BCMcElieceCCA2PublicKey;

    if-eqz v0, :cond_9

    .line 283
    :cond_8
    return-object p1

    .line 285
    :cond_9
    new-instance v0, Ljava/security/InvalidKeyException;

    const-string v1, "Unsupported key type."

    invoke-direct {v0, v1}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
