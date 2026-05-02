.class public Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "DVCSRequestInformation.java"


# static fields
.field private static final DEFAULT_VERSION:I = 0x1

.field private static final TAG_DATA_LOCATIONS:I = 0x3

.field private static final TAG_DVCS:I = 0x2

.field private static final TAG_EXTENSIONS:I = 0x4

.field private static final TAG_REQUESTER:I = 0x0

.field private static final TAG_REQUEST_POLICY:I = 0x1


# instance fields
.field private dataLocations:Lorg/spongycastle/asn1/x509/GeneralNames;

.field private dvcs:Lorg/spongycastle/asn1/x509/GeneralNames;

.field private extensions:Lorg/spongycastle/asn1/x509/Extensions;

.field private nonce:Ljava/math/BigInteger;

.field private requestPolicy:Lorg/spongycastle/asn1/x509/PolicyInformation;

.field private requestTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

.field private requester:Lorg/spongycastle/asn1/x509/GeneralNames;

.field private service:Lorg/spongycastle/asn1/dvcs/ServiceType;

.field private version:I


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 11
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 56
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 38
    iput v8, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->version:I

    .line 57
    const/4 v1, 0x0

    .line 59
    .local v1, "i":I
    invoke-virtual {p1, v7}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v6

    instance-of v6, v6, Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v6, :cond_4d

    .line 61
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v0

    .line 62
    .local v0, "encVersion":Lorg/spongycastle/asn1/ASN1Integer;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6}, Ljava/math/BigInteger;->intValue()I

    move-result v6

    iput v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->version:I

    move v1, v2

    .line 69
    .end local v0    # "encVersion":Lorg/spongycastle/asn1/ASN1Integer;
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :goto_25
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/dvcs/ServiceType;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/ServiceType;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->service:Lorg/spongycastle/asn1/dvcs/ServiceType;

    move v1, v2

    .line 71
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :goto_32
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v6

    if-ge v1, v6, :cond_99

    .line 73
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v5

    .line 75
    .local v5, "x":Lorg/spongycastle/asn1/ASN1Encodable;
    instance-of v6, v5, Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v6, :cond_50

    .line 77
    invoke-static {v5}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->nonce:Ljava/math/BigInteger;

    .line 112
    :goto_4a
    add-int/lit8 v1, v1, 0x1

    .line 113
    goto :goto_32

    .line 66
    .end local v5    # "x":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_4d
    iput v8, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->version:I

    goto :goto_25

    .line 79
    .restart local v5    # "x":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_50
    instance-of v6, v5, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    if-eqz v6, :cond_5b

    .line 81
    invoke-static {v5}, Lorg/spongycastle/asn1/dvcs/DVCSTime;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/DVCSTime;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requestTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    goto :goto_4a

    .line 83
    :cond_5b
    instance-of v6, v5, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v6, :cond_92

    .line 85
    invoke-static {v5}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1TaggedObject;

    move-result-object v3

    .line 86
    .local v3, "t":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v4

    .line 88
    .local v4, "tagNo":I
    packed-switch v4, :pswitch_data_9a

    goto :goto_4a

    .line 91
    :pswitch_6b
    invoke-static {v3, v7}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requester:Lorg/spongycastle/asn1/x509/GeneralNames;

    goto :goto_4a

    .line 94
    :pswitch_72
    invoke-static {v3, v7}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/asn1/x509/PolicyInformation;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/PolicyInformation;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requestPolicy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    goto :goto_4a

    .line 97
    :pswitch_7d
    invoke-static {v3, v7}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->dvcs:Lorg/spongycastle/asn1/x509/GeneralNames;

    goto :goto_4a

    .line 100
    :pswitch_84
    invoke-static {v3, v7}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->dataLocations:Lorg/spongycastle/asn1/x509/GeneralNames;

    goto :goto_4a

    .line 103
    :pswitch_8b
    invoke-static {v3, v7}, Lorg/spongycastle/asn1/x509/Extensions;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    goto :goto_4a

    .line 109
    .end local v3    # "t":Lorg/spongycastle/asn1/ASN1TaggedObject;
    .end local v4    # "tagNo":I
    :cond_92
    invoke-static {v5}, Lorg/spongycastle/asn1/dvcs/DVCSTime;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/DVCSTime;

    move-result-object v6

    iput-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requestTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    goto :goto_4a

    .line 114
    .end local v5    # "x":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_99
    return-void

    .line 88
    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_6b
        :pswitch_72
        :pswitch_7d
        :pswitch_84
        :pswitch_8b
    .end packed-switch
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 118
    instance-of v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    if-eqz v0, :cond_7

    .line 120
    check-cast p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    .line 127
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 122
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 124
    new-instance v0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 127
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;
    .registers 3
    .param p0, "obj"    # Lorg/spongycastle/asn1/ASN1TaggedObject;
    .param p1, "explicit"    # Z

    .prologue
    .line 134
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getDVCS()Lorg/spongycastle/asn1/x509/GeneralNames;
    .registers 2

    .prologue
    .line 259
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->dvcs:Lorg/spongycastle/asn1/x509/GeneralNames;

    return-object v0
.end method

.method public getDataLocations()Lorg/spongycastle/asn1/x509/GeneralNames;
    .registers 2

    .prologue
    .line 264
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->dataLocations:Lorg/spongycastle/asn1/x509/GeneralNames;

    return-object v0
.end method

.method public getExtensions()Lorg/spongycastle/asn1/x509/Extensions;
    .registers 2

    .prologue
    .line 269
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    return-object v0
.end method

.method public getNonce()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 239
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->nonce:Ljava/math/BigInteger;

    return-object v0
.end method

.method public getRequestPolicy()Lorg/spongycastle/asn1/x509/PolicyInformation;
    .registers 2

    .prologue
    .line 254
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requestPolicy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    return-object v0
.end method

.method public getRequestTime()Lorg/spongycastle/asn1/dvcs/DVCSTime;
    .registers 2

    .prologue
    .line 244
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requestTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    return-object v0
.end method

.method public getRequester()Lorg/spongycastle/asn1/x509/GeneralNames;
    .registers 2

    .prologue
    .line 249
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requester:Lorg/spongycastle/asn1/x509/GeneralNames;

    return-object v0
.end method

.method public getService()Lorg/spongycastle/asn1/dvcs/ServiceType;
    .registers 2

    .prologue
    .line 234
    iget-object v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->service:Lorg/spongycastle/asn1/dvcs/ServiceType;

    return-object v0
.end method

.method public getVersion()I
    .registers 2

    .prologue
    .line 229
    iget v0, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->version:I

    return v0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 13

    .prologue
    const/4 v11, 0x5

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 139
    new-instance v5, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 141
    .local v5, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->version:I

    if-eq v6, v10, :cond_17

    .line 143
    new-instance v6, Lorg/spongycastle/asn1/ASN1Integer;

    iget v7, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->version:I

    int-to-long v7, v7

    invoke-direct {v6, v7, v8}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    invoke-virtual {v5, v6}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 145
    :cond_17
    iget-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->service:Lorg/spongycastle/asn1/dvcs/ServiceType;

    invoke-virtual {v5, v6}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 146
    iget-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->nonce:Ljava/math/BigInteger;

    if-eqz v6, :cond_2a

    .line 148
    new-instance v6, Lorg/spongycastle/asn1/ASN1Integer;

    iget-object v7, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->nonce:Ljava/math/BigInteger;

    invoke-direct {v6, v7}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    invoke-virtual {v5, v6}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 150
    :cond_2a
    iget-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requestTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    if-eqz v6, :cond_33

    .line 152
    iget-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requestTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    invoke-virtual {v5, v6}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 155
    :cond_33
    new-array v4, v11, [I

    fill-array-data v4, :array_6c

    .line 162
    .local v4, "tags":[I
    new-array v3, v11, [Lorg/spongycastle/asn1/ASN1Encodable;

    iget-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requester:Lorg/spongycastle/asn1/x509/GeneralNames;

    aput-object v6, v3, v9

    iget-object v6, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requestPolicy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    aput-object v6, v3, v10

    const/4 v6, 0x2

    iget-object v7, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->dvcs:Lorg/spongycastle/asn1/x509/GeneralNames;

    aput-object v7, v3, v6

    const/4 v6, 0x3

    iget-object v7, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->dataLocations:Lorg/spongycastle/asn1/x509/GeneralNames;

    aput-object v7, v3, v6

    const/4 v6, 0x4

    iget-object v7, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    aput-object v7, v3, v6

    .line 169
    .local v3, "taggedObjects":[Lorg/spongycastle/asn1/ASN1Encodable;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_52
    array-length v6, v4

    if-ge v0, v6, :cond_66

    .line 171
    aget v1, v4, v0

    .line 172
    .local v1, "tag":I
    aget-object v2, v3, v0

    .line 173
    .local v2, "taggedObject":Lorg/spongycastle/asn1/ASN1Encodable;
    if-eqz v2, :cond_63

    .line 175
    new-instance v6, Lorg/spongycastle/asn1/DERTaggedObject;

    invoke-direct {v6, v9, v1, v2}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v5, v6}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 169
    :cond_63
    add-int/lit8 v0, v0, 0x1

    goto :goto_52

    .line 179
    .end local v1    # "tag":I
    .end local v2    # "taggedObject":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_66
    new-instance v6, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v6, v5}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v6

    .line 155
    :array_6c
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
    .end array-data
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 185
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 187
    .local v0, "s":Ljava/lang/StringBuffer;
    const-string v1, "DVCSRequestInformation {\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 189
    iget v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->version:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2d

    .line 191
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "version: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->version:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 193
    :cond_2d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "service: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->service:Lorg/spongycastle/asn1/dvcs/ServiceType;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 194
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->nonce:Ljava/math/BigInteger;

    if-eqz v1, :cond_6d

    .line 196
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "nonce: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->nonce:Ljava/math/BigInteger;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 198
    :cond_6d
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requestTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    if-eqz v1, :cond_8f

    .line 200
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requestTime: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requestTime:Lorg/spongycastle/asn1/dvcs/DVCSTime;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 202
    :cond_8f
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requester:Lorg/spongycastle/asn1/x509/GeneralNames;

    if-eqz v1, :cond_b1

    .line 204
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requester: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requester:Lorg/spongycastle/asn1/x509/GeneralNames;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 206
    :cond_b1
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requestPolicy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    if-eqz v1, :cond_d3

    .line 208
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requestPolicy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->requestPolicy:Lorg/spongycastle/asn1/x509/PolicyInformation;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 210
    :cond_d3
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->dvcs:Lorg/spongycastle/asn1/x509/GeneralNames;

    if-eqz v1, :cond_f5

    .line 212
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dvcs: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->dvcs:Lorg/spongycastle/asn1/x509/GeneralNames;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 214
    :cond_f5
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->dataLocations:Lorg/spongycastle/asn1/x509/GeneralNames;

    if-eqz v1, :cond_117

    .line 216
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dataLocations: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->dataLocations:Lorg/spongycastle/asn1/x509/GeneralNames;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 218
    :cond_117
    iget-object v1, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    if-eqz v1, :cond_139

    .line 220
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "extensions: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/spongycastle/asn1/dvcs/DVCSRequestInformation;->extensions:Lorg/spongycastle/asn1/x509/Extensions;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 223
    :cond_139
    const-string v1, "}\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 224
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
