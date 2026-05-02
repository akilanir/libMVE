.class public Lorg/spongycastle/asn1/x509/IetfAttrSyntax;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "IetfAttrSyntax.java"


# static fields
.field public static final VALUE_OCTETS:I = 0x1

.field public static final VALUE_OID:I = 0x2

.field public static final VALUE_UTF8:I = 0x3


# instance fields
.field policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

.field valueChoice:I

.field values:Ljava/util/Vector;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .registers 9
    .param p1, "seq"    # Lorg/spongycastle/asn1/ASN1Sequence;

    .prologue
    const/4 v6, 0x0

    .line 50
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 28
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 29
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    .line 30
    const/4 v4, -0x1

    iput v4, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->valueChoice:I

    .line 51
    const/4 v1, 0x0

    .line 53
    .local v1, "i":I
    invoke-virtual {p1, v6}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    instance-of v4, v4, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v4, :cond_38

    .line 55
    invoke-virtual {p1, v6}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1TaggedObject;

    invoke-static {v4, v6}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 56
    add-int/lit8 v1, v1, 0x1

    .line 64
    :cond_28
    :goto_28
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    instance-of v4, v4, Lorg/spongycastle/asn1/ASN1Sequence;

    if-nez v4, :cond_4c

    .line 66
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Non-IetfAttrSyntax encoding"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 58
    :cond_38
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_28

    .line 60
    invoke-virtual {p1, v6}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralNames;

    move-result-object v4

    iput-object v4, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 61
    add-int/lit8 v1, v1, 0x1

    goto :goto_28

    .line 69
    :cond_4c
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object p1

    .end local p1    # "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    check-cast p1, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 71
    .restart local p1    # "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_56
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_93

    .line 73
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1Primitive;

    .line 76
    .local v2, "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    instance-of v4, v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    if-eqz v4, :cond_79

    .line 78
    const/4 v3, 0x2

    .line 93
    .local v3, "type":I
    :goto_67
    iget v4, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->valueChoice:I

    if-gez v4, :cond_6d

    .line 95
    iput v3, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->valueChoice:I

    .line 98
    :cond_6d
    iget v4, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->valueChoice:I

    if-eq v3, v4, :cond_8d

    .line 100
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Mix of value types in IetfAttrSyntax"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 80
    .end local v3    # "type":I
    :cond_79
    instance-of v4, v2, Lorg/spongycastle/asn1/DERUTF8String;

    if-eqz v4, :cond_7f

    .line 82
    const/4 v3, 0x3

    .restart local v3    # "type":I
    goto :goto_67

    .line 84
    .end local v3    # "type":I
    :cond_7f
    instance-of v4, v2, Lorg/spongycastle/asn1/DEROctetString;

    if-eqz v4, :cond_85

    .line 86
    const/4 v3, 0x1

    .restart local v3    # "type":I
    goto :goto_67

    .line 90
    .end local v3    # "type":I
    :cond_85
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Bad value type encoding IetfAttrSyntax"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 103
    .restart local v3    # "type":I
    :cond_8d
    iget-object v4, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    invoke-virtual {v4, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_56

    .line 105
    .end local v2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    .end local v3    # "type":I
    :cond_93
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/IetfAttrSyntax;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 34
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;

    if-eqz v0, :cond_7

    .line 36
    check-cast p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;

    .line 43
    .end local p0    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p0

    .line 38
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_7
    if-eqz p0, :cond_14

    .line 40
    new-instance v0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;

    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    move-object p0, v0

    goto :goto_6

    .line 43
    :cond_14
    const/4 p0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public getPolicyAuthority()Lorg/spongycastle/asn1/x509/GeneralNames;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

    return-object v0
.end method

.method public getValueType()I
    .registers 2

    .prologue
    .line 114
    iget v0, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->valueChoice:I

    return v0
.end method

.method public getValues()[Ljava/lang/Object;
    .registers 5

    .prologue
    .line 119
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->getValueType()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_20

    .line 121
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    new-array v1, v2, [Lorg/spongycastle/asn1/ASN1OctetString;

    .line 123
    .local v1, "tmp":[Lorg/spongycastle/asn1/ASN1OctetString;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    array-length v2, v1

    if-eq v0, v2, :cond_59

    .line 125
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1OctetString;

    aput-object v2, v1, v0

    .line 123
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 130
    .end local v0    # "i":I
    .end local v1    # "tmp":[Lorg/spongycastle/asn1/ASN1OctetString;
    :cond_20
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->getValueType()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_40

    .line 132
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    new-array v1, v2, [Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 134
    .local v1, "tmp":[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_30
    array-length v2, v1

    if-eq v0, v2, :cond_59

    .line 136
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    aput-object v2, v1, v0

    .line 134
    add-int/lit8 v0, v0, 0x1

    goto :goto_30

    .line 143
    .end local v0    # "i":I
    .end local v1    # "tmp":[Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    :cond_40
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    new-array v1, v2, [Lorg/spongycastle/asn1/DERUTF8String;

    .line 145
    .local v1, "tmp":[Lorg/spongycastle/asn1/DERUTF8String;
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_49
    array-length v2, v1

    if-eq v0, v2, :cond_59

    .line 147
    iget-object v2, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/asn1/DERUTF8String;

    aput-object v2, v1, v0

    .line 145
    add-int/lit8 v0, v0, 0x1

    goto :goto_49

    .line 150
    .end local v1    # "tmp":[Lorg/spongycastle/asn1/DERUTF8String;
    :cond_59
    return-object v1
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 7

    .prologue
    .line 171
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 173
    .local v1, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

    if-eqz v3, :cond_14

    .line 175
    new-instance v3, Lorg/spongycastle/asn1/DERTaggedObject;

    const/4 v4, 0x0

    iget-object v5, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->policyAuthority:Lorg/spongycastle/asn1/x509/GeneralNames;

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ILorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {v1, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 178
    :cond_14
    new-instance v2, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 180
    .local v2, "v2":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v3, p0, Lorg/spongycastle/asn1/x509/IetfAttrSyntax;->values:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "i":Ljava/util/Enumeration;
    :goto_1f
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_2f

    .line 182
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/ASN1Encodable;

    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_1f

    .line 185
    :cond_2f
    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v3, v2}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    invoke-virtual {v1, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 187
    new-instance v3, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v3, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v3
.end method
