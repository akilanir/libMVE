.class public Lorg/spongycastle/asn1/eac/CertificateBody;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "CertificateBody.java"


# static fields
.field private static final CAR:I = 0x2

.field private static final CEfD:I = 0x20

.field private static final CExD:I = 0x40

.field private static final CHA:I = 0x10

.field private static final CHR:I = 0x8

.field private static final CPI:I = 0x1

.field private static final PK:I = 0x4

.field public static final profileType:I = 0x7f

.field public static final requestType:I = 0xd


# instance fields
.field private certificateEffectiveDate:Lorg/spongycastle/asn1/DERApplicationSpecific;

.field private certificateExpirationDate:Lorg/spongycastle/asn1/DERApplicationSpecific;

.field private certificateHolderAuthorization:Lorg/spongycastle/asn1/eac/CertificateHolderAuthorization;

.field private certificateHolderReference:Lorg/spongycastle/asn1/DERApplicationSpecific;

.field private certificateProfileIdentifier:Lorg/spongycastle/asn1/DERApplicationSpecific;

.field private certificateType:I

.field private certificationAuthorityReference:Lorg/spongycastle/asn1/DERApplicationSpecific;

.field private publicKey:Lorg/spongycastle/asn1/eac/PublicKeyDataObject;

.field seq:Lorg/spongycastle/asn1/ASN1InputStream;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1ApplicationSpecific;)V
    .registers 3
    .param p1, "obj"    # Lorg/spongycastle/asn1/ASN1ApplicationSpecific;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 170
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    .line 171
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/eac/CertificateBody;->setIso7816CertificateBody(Lorg/spongycastle/asn1/ASN1ApplicationSpecific;)V

    .line 172
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/DERApplicationSpecific;Lorg/spongycastle/asn1/eac/CertificationAuthorityReference;Lorg/spongycastle/asn1/eac/PublicKeyDataObject;Lorg/spongycastle/asn1/eac/CertificateHolderReference;Lorg/spongycastle/asn1/eac/CertificateHolderAuthorization;Lorg/spongycastle/asn1/eac/PackedDate;Lorg/spongycastle/asn1/eac/PackedDate;)V
    .registers 14
    .param p1, "certificateProfileIdentifier"    # Lorg/spongycastle/asn1/DERApplicationSpecific;
    .param p2, "certificationAuthorityReference"    # Lorg/spongycastle/asn1/eac/CertificationAuthorityReference;
    .param p3, "publicKey"    # Lorg/spongycastle/asn1/eac/PublicKeyDataObject;
    .param p4, "certificateHolderReference"    # Lorg/spongycastle/asn1/eac/CertificateHolderReference;
    .param p5, "certificateHolderAuthorization"    # Lorg/spongycastle/asn1/eac/CertificateHolderAuthorization;
    .param p6, "certificateEffectiveDate"    # Lorg/spongycastle/asn1/eac/PackedDate;
    .param p7, "certificateExpirationDate"    # Lorg/spongycastle/asn1/eac/PackedDate;

    .prologue
    const/4 v1, 0x0

    .line 141
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 52
    iput v1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    .line 142
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/eac/CertificateBody;->setCertificateProfileIdentifier(Lorg/spongycastle/asn1/DERApplicationSpecific;)V

    .line 143
    new-instance v1, Lorg/spongycastle/asn1/DERApplicationSpecific;

    const/4 v2, 0x2

    .line 144
    invoke-virtual {p2}, Lorg/spongycastle/asn1/eac/CertificationAuthorityReference;->getEncoded()[B

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(I[B)V

    .line 143
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/eac/CertificateBody;->setCertificationAuthorityReference(Lorg/spongycastle/asn1/DERApplicationSpecific;)V

    .line 145
    invoke-direct {p0, p3}, Lorg/spongycastle/asn1/eac/CertificateBody;->setPublicKey(Lorg/spongycastle/asn1/eac/PublicKeyDataObject;)V

    .line 146
    new-instance v1, Lorg/spongycastle/asn1/DERApplicationSpecific;

    const/16 v2, 0x20

    .line 147
    invoke-virtual {p4}, Lorg/spongycastle/asn1/eac/CertificateHolderReference;->getEncoded()[B

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(I[B)V

    .line 146
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/eac/CertificateBody;->setCertificateHolderReference(Lorg/spongycastle/asn1/DERApplicationSpecific;)V

    .line 148
    invoke-direct {p0, p5}, Lorg/spongycastle/asn1/eac/CertificateBody;->setCertificateHolderAuthorization(Lorg/spongycastle/asn1/eac/CertificateHolderAuthorization;)V

    .line 151
    :try_start_2a
    new-instance v1, Lorg/spongycastle/asn1/DERApplicationSpecific;

    const/4 v2, 0x0

    const/16 v3, 0x25

    new-instance v4, Lorg/spongycastle/asn1/DEROctetString;

    .line 152
    invoke-virtual {p6}, Lorg/spongycastle/asn1/eac/PackedDate;->getEncoding()[B

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {v1, v2, v3, v4}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 151
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/eac/CertificateBody;->setCertificateEffectiveDate(Lorg/spongycastle/asn1/DERApplicationSpecific;)V

    .line 153
    new-instance v1, Lorg/spongycastle/asn1/DERApplicationSpecific;

    const/4 v2, 0x0

    const/16 v3, 0x24

    new-instance v4, Lorg/spongycastle/asn1/DEROctetString;

    .line 154
    invoke-virtual {p7}, Lorg/spongycastle/asn1/eac/PackedDate;->getEncoding()[B

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {v1, v2, v3, v4}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 153
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/eac/CertificateBody;->setCertificateExpirationDate(Lorg/spongycastle/asn1/DERApplicationSpecific;)V
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_52} :catch_53

    .line 160
    return-void

    .line 156
    :catch_53
    move-exception v0

    .line 158
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unable to encode dates: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/eac/CertificateBody;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 319
    instance-of v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;

    if-eqz v0, :cond_7

    .line 321
    check-cast p0, Lorg/spongycastle/asn1/eac/CertificateBody;

    .line 328
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 323
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 325
    new-instance v0, Lorg/spongycastle/asn1/eac/CertificateBody;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ApplicationSpecific;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/eac/CertificateBody;-><init>(Lorg/spongycastle/asn1/ASN1ApplicationSpecific;)V

    move-object p0, v0

    goto :goto_6

    .line 328
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method

.method private profileToASN1Object()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 185
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateProfileIdentifier:Lorg/spongycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 186
    iget-object v1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificationAuthorityReference:Lorg/spongycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 187
    new-instance v1, Lorg/spongycastle/asn1/DERApplicationSpecific;

    const/4 v2, 0x0

    const/16 v3, 0x49

    iget-object v4, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->publicKey:Lorg/spongycastle/asn1/eac/PublicKeyDataObject;

    invoke-direct {v1, v2, v3, v4}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 188
    iget-object v1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateHolderReference:Lorg/spongycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 189
    iget-object v1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateHolderAuthorization:Lorg/spongycastle/asn1/eac/CertificateHolderAuthorization;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 190
    iget-object v1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateEffectiveDate:Lorg/spongycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 191
    iget-object v1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateExpirationDate:Lorg/spongycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 192
    new-instance v1, Lorg/spongycastle/asn1/DERApplicationSpecific;

    const/16 v2, 0x4e

    invoke-direct {v1, v2, v0}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(ILorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method

.method private requestToASN1Object()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 266
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 268
    .local v0, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateProfileIdentifier:Lorg/spongycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 269
    new-instance v1, Lorg/spongycastle/asn1/DERApplicationSpecific;

    const/4 v2, 0x0

    const/16 v3, 0x49

    iget-object v4, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->publicKey:Lorg/spongycastle/asn1/eac/PublicKeyDataObject;

    invoke-direct {v1, v2, v3, v4}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 270
    iget-object v1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateHolderReference:Lorg/spongycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 271
    new-instance v1, Lorg/spongycastle/asn1/DERApplicationSpecific;

    const/16 v2, 0x4e

    invoke-direct {v1, v2, v0}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(ILorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v1
.end method

.method private setCertificateEffectiveDate(Lorg/spongycastle/asn1/DERApplicationSpecific;)V
    .registers 5
    .param p1, "ced"    # Lorg/spongycastle/asn1/DERApplicationSpecific;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 353
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getApplicationTag()I

    move-result v0

    const/16 v1, 0x25

    if-ne v0, v1, :cond_11

    .line 355
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateEffectiveDate:Lorg/spongycastle/asn1/DERApplicationSpecific;

    .line 356
    iget v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    .line 362
    return-void

    .line 360
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Not an Iso7816Tags.APPLICATION_EFFECTIVE_DATE tag :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lorg/spongycastle/asn1/eac/EACTags;->encodeTag(Lorg/spongycastle/asn1/ASN1ApplicationSpecific;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setCertificateExpirationDate(Lorg/spongycastle/asn1/DERApplicationSpecific;)V
    .registers 4
    .param p1, "ced"    # Lorg/spongycastle/asn1/DERApplicationSpecific;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 387
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getApplicationTag()I

    move-result v0

    const/16 v1, 0x24

    if-ne v0, v1, :cond_11

    .line 389
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateExpirationDate:Lorg/spongycastle/asn1/DERApplicationSpecific;

    .line 390
    iget v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    .line 396
    return-void

    .line 394
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Not an Iso7816Tags.APPLICATION_EXPIRATION_DATE tag"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setCertificateHolderAuthorization(Lorg/spongycastle/asn1/eac/CertificateHolderAuthorization;)V
    .registers 3
    .param p1, "cha"    # Lorg/spongycastle/asn1/eac/CertificateHolderAuthorization;

    .prologue
    .line 425
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateHolderAuthorization:Lorg/spongycastle/asn1/eac/CertificateHolderAuthorization;

    .line 426
    iget v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    .line 427
    return-void
.end method

.method private setCertificateHolderReference(Lorg/spongycastle/asn1/DERApplicationSpecific;)V
    .registers 4
    .param p1, "certificateHolderReference"    # Lorg/spongycastle/asn1/DERApplicationSpecific;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 212
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getApplicationTag()I

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_11

    .line 214
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateHolderReference:Lorg/spongycastle/asn1/DERApplicationSpecific;

    .line 215
    iget v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    .line 221
    return-void

    .line 219
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Not an Iso7816Tags.CARDHOLDER_NAME tag"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setCertificateProfileIdentifier(Lorg/spongycastle/asn1/DERApplicationSpecific;)V
    .registers 5
    .param p1, "certificateProfileIdentifier"    # Lorg/spongycastle/asn1/DERApplicationSpecific;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 198
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getApplicationTag()I

    move-result v0

    const/16 v1, 0x29

    if-ne v0, v1, :cond_11

    .line 200
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateProfileIdentifier:Lorg/spongycastle/asn1/DERApplicationSpecific;

    .line 201
    iget v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    .line 207
    return-void

    .line 205
    :cond_11
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Not an Iso7816Tags.INTERCHANGE_PROFILE tag :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lorg/spongycastle/asn1/eac/EACTags;->encodeTag(Lorg/spongycastle/asn1/ASN1ApplicationSpecific;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setCertificationAuthorityReference(Lorg/spongycastle/asn1/DERApplicationSpecific;)V
    .registers 4
    .param p1, "certificationAuthorityReference"    # Lorg/spongycastle/asn1/DERApplicationSpecific;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 234
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getApplicationTag()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_10

    .line 236
    iput-object p1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificationAuthorityReference:Lorg/spongycastle/asn1/DERApplicationSpecific;

    .line 237
    iget v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    .line 243
    return-void

    .line 241
    :cond_10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Not an Iso7816Tags.ISSUER_IDENTIFICATION_NUMBER tag"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setIso7816CertificateBody(Lorg/spongycastle/asn1/ASN1ApplicationSpecific;)V
    .registers 9
    .param p1, "appSpe"    # Lorg/spongycastle/asn1/ASN1ApplicationSpecific;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getApplicationTag()I

    move-result v4

    const/16 v5, 0x4e

    if-ne v4, v5, :cond_45

    .line 70
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getContents()[B

    move-result-object v2

    .line 76
    .local v2, "content":[B
    new-instance v0, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-direct {v0, v2}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 78
    .local v0, "aIS":Lorg/spongycastle/asn1/ASN1InputStream;
    :goto_11
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v3

    .local v3, "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    if-eqz v3, :cond_a0

    .line 82
    instance-of v4, v3, Lorg/spongycastle/asn1/DERApplicationSpecific;

    if-eqz v4, :cond_4d

    move-object v1, v3

    .line 84
    check-cast v1, Lorg/spongycastle/asn1/DERApplicationSpecific;

    .line 90
    .local v1, "aSpe":Lorg/spongycastle/asn1/DERApplicationSpecific;
    invoke-virtual {v1}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getApplicationTag()I

    move-result v4

    sparse-switch v4, :sswitch_data_a2

    .line 114
    const/4 v4, 0x0

    iput v4, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    .line 115
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Not a valid iso7816 DERApplicationSpecific tag "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getApplicationTag()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 74
    .end local v0    # "aIS":Lorg/spongycastle/asn1/ASN1InputStream;
    .end local v1    # "aSpe":Lorg/spongycastle/asn1/DERApplicationSpecific;
    .end local v2    # "content":[B
    .end local v3    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_45
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Bad tag : not an iso7816 CERTIFICATE_CONTENT_TEMPLATE"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 88
    .restart local v0    # "aIS":Lorg/spongycastle/asn1/ASN1InputStream;
    .restart local v2    # "content":[B
    .restart local v3    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_4d
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Not a valid iso7816 content : not a DERApplicationSpecific Object :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p1}, Lorg/spongycastle/asn1/eac/EACTags;->encodeTag(Lorg/spongycastle/asn1/ASN1ApplicationSpecific;)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 93
    .restart local v1    # "aSpe":Lorg/spongycastle/asn1/DERApplicationSpecific;
    :sswitch_72
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/eac/CertificateBody;->setCertificateProfileIdentifier(Lorg/spongycastle/asn1/DERApplicationSpecific;)V

    goto :goto_11

    .line 96
    :sswitch_76
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/eac/CertificateBody;->setCertificationAuthorityReference(Lorg/spongycastle/asn1/DERApplicationSpecific;)V

    goto :goto_11

    .line 99
    :sswitch_7a
    const/16 v4, 0x10

    invoke-virtual {v1, v4}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getObject(I)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/eac/PublicKeyDataObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/eac/PublicKeyDataObject;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/spongycastle/asn1/eac/CertificateBody;->setPublicKey(Lorg/spongycastle/asn1/eac/PublicKeyDataObject;)V

    goto :goto_11

    .line 102
    :sswitch_88
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/eac/CertificateBody;->setCertificateHolderReference(Lorg/spongycastle/asn1/DERApplicationSpecific;)V

    goto :goto_11

    .line 105
    :sswitch_8c
    new-instance v4, Lorg/spongycastle/asn1/eac/CertificateHolderAuthorization;

    invoke-direct {v4, v1}, Lorg/spongycastle/asn1/eac/CertificateHolderAuthorization;-><init>(Lorg/spongycastle/asn1/DERApplicationSpecific;)V

    invoke-direct {p0, v4}, Lorg/spongycastle/asn1/eac/CertificateBody;->setCertificateHolderAuthorization(Lorg/spongycastle/asn1/eac/CertificateHolderAuthorization;)V

    goto/16 :goto_11

    .line 108
    :sswitch_96
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/eac/CertificateBody;->setCertificateEffectiveDate(Lorg/spongycastle/asn1/DERApplicationSpecific;)V

    goto/16 :goto_11

    .line 111
    :sswitch_9b
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/eac/CertificateBody;->setCertificateExpirationDate(Lorg/spongycastle/asn1/DERApplicationSpecific;)V

    goto/16 :goto_11

    .line 118
    .end local v1    # "aSpe":Lorg/spongycastle/asn1/DERApplicationSpecific;
    :cond_a0
    return-void

    .line 90
    nop

    :sswitch_data_a2
    .sparse-switch
        0x2 -> :sswitch_76
        0x20 -> :sswitch_88
        0x24 -> :sswitch_9b
        0x25 -> :sswitch_96
        0x29 -> :sswitch_72
        0x49 -> :sswitch_7a
        0x4c -> :sswitch_8c
    .end sparse-switch
.end method

.method private setPublicKey(Lorg/spongycastle/asn1/eac/PublicKeyDataObject;)V
    .registers 3
    .param p1, "publicKey"    # Lorg/spongycastle/asn1/eac/PublicKeyDataObject;

    .prologue
    .line 253
    invoke-static {p1}, Lorg/spongycastle/asn1/eac/PublicKeyDataObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/eac/PublicKeyDataObject;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->publicKey:Lorg/spongycastle/asn1/eac/PublicKeyDataObject;

    .line 254
    iget v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    .line 255
    return-void
.end method


# virtual methods
.method public getCertificateEffectiveDate()Lorg/spongycastle/asn1/eac/PackedDate;
    .registers 3

    .prologue
    .line 336
    iget v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    and-int/lit8 v0, v0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_14

    .line 339
    new-instance v0, Lorg/spongycastle/asn1/eac/PackedDate;

    iget-object v1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateEffectiveDate:Lorg/spongycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getContents()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/eac/PackedDate;-><init>([B)V

    .line 341
    :goto_13
    return-object v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public getCertificateExpirationDate()Lorg/spongycastle/asn1/eac/PackedDate;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 370
    iget v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    and-int/lit8 v0, v0, 0x40

    const/16 v1, 0x40

    if-ne v0, v1, :cond_14

    .line 373
    new-instance v0, Lorg/spongycastle/asn1/eac/PackedDate;

    iget-object v1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateExpirationDate:Lorg/spongycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getContents()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/eac/PackedDate;-><init>([B)V

    return-object v0

    .line 375
    :cond_14
    new-instance v0, Ljava/io/IOException;

    const-string v1, "certificate Expiration Date not set"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCertificateHolderAuthorization()Lorg/spongycastle/asn1/eac/CertificateHolderAuthorization;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 409
    iget v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    and-int/lit8 v0, v0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_b

    .line 412
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateHolderAuthorization:Lorg/spongycastle/asn1/eac/CertificateHolderAuthorization;

    return-object v0

    .line 414
    :cond_b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Certificate Holder Authorisation not set"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getCertificateHolderReference()Lorg/spongycastle/asn1/eac/CertificateHolderReference;
    .registers 3

    .prologue
    .line 436
    new-instance v0, Lorg/spongycastle/asn1/eac/CertificateHolderReference;

    iget-object v1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateHolderReference:Lorg/spongycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getContents()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/eac/CertificateHolderReference;-><init>([B)V

    return-object v0
.end method

.method public getCertificateProfileIdentifier()Lorg/spongycastle/asn1/DERApplicationSpecific;
    .registers 2

    .prologue
    .line 446
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateProfileIdentifier:Lorg/spongycastle/asn1/DERApplicationSpecific;

    return-object v0
.end method

.method public getCertificateType()I
    .registers 2

    .prologue
    .line 306
    iget v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    return v0
.end method

.method public getCertificationAuthorityReference()Lorg/spongycastle/asn1/eac/CertificationAuthorityReference;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 458
    iget v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_13

    .line 461
    new-instance v0, Lorg/spongycastle/asn1/eac/CertificationAuthorityReference;

    iget-object v1, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificationAuthorityReference:Lorg/spongycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/DERApplicationSpecific;->getContents()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/eac/CertificationAuthorityReference;-><init>([B)V

    return-object v0

    .line 463
    :cond_13
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Certification authority reference not set"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPublicKey()Lorg/spongycastle/asn1/eac/PublicKeyDataObject;
    .registers 2

    .prologue
    .line 471
    iget-object v0, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->publicKey:Lorg/spongycastle/asn1/eac/PublicKeyDataObject;

    return-object v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 283
    :try_start_1
    iget v2, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    const/16 v3, 0x7f

    if-ne v2, v3, :cond_c

    .line 285
    invoke-direct {p0}, Lorg/spongycastle/asn1/eac/CertificateBody;->profileToASN1Object()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    .line 296
    :cond_b
    :goto_b
    return-object v1

    .line 287
    :cond_c
    iget v2, p0, Lorg/spongycastle/asn1/eac/CertificateBody;->certificateType:I

    const/16 v3, 0xd

    if-ne v2, v3, :cond_b

    .line 289
    invoke-direct {p0}, Lorg/spongycastle/asn1/eac/CertificateBody;->requestToASN1Object()Lorg/spongycastle/asn1/ASN1Primitive;
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_15} :catch_17

    move-result-object v1

    goto :goto_b

    .line 292
    :catch_17
    move-exception v0

    .line 294
    .local v0, "e":Ljava/io/IOException;
    goto :goto_b
.end method
