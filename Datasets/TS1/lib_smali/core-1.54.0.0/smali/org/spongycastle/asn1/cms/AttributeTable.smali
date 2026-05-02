.class public Lorg/spongycastle/asn1/cms/AttributeTable;
.super Ljava/lang/Object;
.source "AttributeTable.java"


# instance fields
.field private attributes:Ljava/util/Hashtable;


# direct methods
.method public constructor <init>(Ljava/util/Hashtable;)V
    .registers 3
    .param p1, "attrs"    # Ljava/util/Hashtable;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    .line 23
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/cms/AttributeTable;->copyTable(Ljava/util/Hashtable;)Ljava/util/Hashtable;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    .line 24
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V
    .registers 5
    .param p1, "v"    # Lorg/spongycastle/asn1/ASN1EncodableVector;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    iput-object v2, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    .line 29
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->size()I

    move-result v2

    if-eq v1, v2, :cond_23

    .line 31
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->get(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/cms/Attribute;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/Attribute;

    move-result-object v0

    .line 33
    .local v0, "a":Lorg/spongycastle/asn1/cms/Attribute;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/cms/Attribute;->getAttrType()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v2

    invoke-direct {p0, v2, v0}, Lorg/spongycastle/asn1/cms/AttributeTable;->addAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/cms/Attribute;)V

    .line 29
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 35
    .end local v0    # "a":Lorg/spongycastle/asn1/cms/Attribute;
    :cond_23
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Set;)V
    .registers 5
    .param p1, "s"    # Lorg/spongycastle/asn1/ASN1Set;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    iput-object v2, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    .line 40
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Set;->size()I

    move-result v2

    if-eq v1, v2, :cond_23

    .line 42
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Set;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/asn1/cms/Attribute;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/Attribute;

    move-result-object v0

    .line 44
    .local v0, "a":Lorg/spongycastle/asn1/cms/Attribute;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/cms/Attribute;->getAttrType()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v2

    invoke-direct {p0, v2, v0}, Lorg/spongycastle/asn1/cms/AttributeTable;->addAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/cms/Attribute;)V

    .line 40
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 46
    .end local v0    # "a":Lorg/spongycastle/asn1/cms/Attribute;
    :cond_23
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/Attribute;)V
    .registers 3
    .param p1, "attr"    # Lorg/spongycastle/asn1/cms/Attribute;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    .line 51
    invoke-virtual {p1}, Lorg/spongycastle/asn1/cms/Attribute;->getAttrType()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/spongycastle/asn1/cms/AttributeTable;->addAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/cms/Attribute;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/cms/Attributes;)V
    .registers 3
    .param p1, "attrs"    # Lorg/spongycastle/asn1/cms/Attributes;

    .prologue
    .line 57
    invoke-virtual {p1}, Lorg/spongycastle/asn1/cms/Attributes;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Set;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Set;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/cms/AttributeTable;-><init>(Lorg/spongycastle/asn1/ASN1Set;)V

    .line 58
    return-void
.end method

.method private addAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/cms/Attribute;)V
    .registers 6
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "a"    # Lorg/spongycastle/asn1/cms/Attribute;

    .prologue
    .line 64
    iget-object v2, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 66
    .local v1, "value":Ljava/lang/Object;
    if-nez v1, :cond_e

    .line 68
    iget-object v2, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v2, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    :goto_d
    return-void

    .line 74
    :cond_e
    instance-of v2, v1, Lorg/spongycastle/asn1/cms/Attribute;

    if-eqz v2, :cond_23

    .line 76
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 78
    .local v0, "v":Ljava/util/Vector;
    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 79
    invoke-virtual {v0, p2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 88
    :goto_1d
    iget-object v2, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v2, p1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .end local v0    # "v":Ljava/util/Vector;
    :cond_23
    move-object v0, v1

    .line 83
    check-cast v0, Ljava/util/Vector;

    .line 85
    .restart local v0    # "v":Ljava/util/Vector;
    invoke-virtual {v0, p2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1d
.end method

.method private copyTable(Ljava/util/Hashtable;)Ljava/util/Hashtable;
    .registers 6
    .param p1, "in"    # Ljava/util/Hashtable;

    .prologue
    .line 203
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    .line 204
    .local v2, "out":Ljava/util/Hashtable;
    invoke-virtual {p1}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 206
    .local v0, "e":Ljava/util/Enumeration;
    :goto_9
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 208
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    .line 210
    .local v1, "key":Ljava/lang/Object;
    invoke-virtual {p1, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9

    .line 213
    .end local v1    # "key":Ljava/lang/Object;
    :cond_1b
    return-object v2
.end method


# virtual methods
.method public add(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)Lorg/spongycastle/asn1/cms/AttributeTable;
    .registers 6
    .param p1, "attrType"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .param p2, "attrValue"    # Lorg/spongycastle/asn1/ASN1Encodable;

    .prologue
    .line 225
    new-instance v0, Lorg/spongycastle/asn1/cms/AttributeTable;

    iget-object v1, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cms/AttributeTable;-><init>(Ljava/util/Hashtable;)V

    .line 227
    .local v0, "newTable":Lorg/spongycastle/asn1/cms/AttributeTable;
    new-instance v1, Lorg/spongycastle/asn1/cms/Attribute;

    new-instance v2, Lorg/spongycastle/asn1/DERSet;

    invoke-direct {v2, p2}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-direct {v1, p1, v2}, Lorg/spongycastle/asn1/cms/Attribute;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Set;)V

    invoke-direct {v0, p1, v1}, Lorg/spongycastle/asn1/cms/AttributeTable;->addAttribute(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/cms/Attribute;)V

    .line 229
    return-object v0
.end method

.method public get(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/cms/Attribute;
    .registers 4
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 101
    iget-object v1, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 103
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, v0, Ljava/util/Vector;

    if-eqz v1, :cond_14

    .line 105
    check-cast v0, Ljava/util/Vector;

    .end local v0    # "value":Ljava/lang/Object;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/cms/Attribute;

    .line 108
    :goto_13
    return-object v1

    .restart local v0    # "value":Ljava/lang/Object;
    :cond_14
    check-cast v0, Lorg/spongycastle/asn1/cms/Attribute;

    .end local v0    # "value":Ljava/lang/Object;
    move-object v1, v0

    goto :goto_13
.end method

.method public getAll(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/ASN1EncodableVector;
    .registers 6
    .param p1, "oid"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 121
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 123
    .local v1, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v3, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v3, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 125
    .local v2, "value":Ljava/lang/Object;
    instance-of v3, v2, Ljava/util/Vector;

    if-eqz v3, :cond_25

    .line 127
    check-cast v2, Ljava/util/Vector;

    .end local v2    # "value":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 129
    .local v0, "e":Ljava/util/Enumeration;
    :goto_15
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 131
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/spongycastle/asn1/cms/Attribute;

    invoke-virtual {v1, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_15

    .line 134
    .end local v0    # "e":Ljava/util/Enumeration;
    .restart local v2    # "value":Ljava/lang/Object;
    :cond_25
    if-eqz v2, :cond_2c

    .line 136
    check-cast v2, Lorg/spongycastle/asn1/cms/Attribute;

    .end local v2    # "value":Ljava/lang/Object;
    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 139
    :cond_2c
    return-object v1
.end method

.method public remove(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/asn1/cms/AttributeTable;
    .registers 4
    .param p1, "attrType"    # Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .prologue
    .line 234
    new-instance v0, Lorg/spongycastle/asn1/cms/AttributeTable;

    iget-object v1, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cms/AttributeTable;-><init>(Ljava/util/Hashtable;)V

    .line 236
    .local v0, "newTable":Lorg/spongycastle/asn1/cms/AttributeTable;
    iget-object v1, v0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    return-object v0
.end method

.method public size()I
    .registers 5

    .prologue
    .line 144
    const/4 v2, 0x0

    .line 146
    .local v2, "size":I
    iget-object v3, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "en":Ljava/util/Enumeration;
    :goto_7
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_20

    .line 148
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    .line 150
    .local v1, "o":Ljava/lang/Object;
    instance-of v3, v1, Ljava/util/Vector;

    if-eqz v3, :cond_1d

    .line 152
    check-cast v1, Ljava/util/Vector;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_7

    .line 156
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_1d
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 160
    .end local v1    # "o":Ljava/lang/Object;
    :cond_20
    return v2
.end method

.method public toASN1EncodableVector()Lorg/spongycastle/asn1/ASN1EncodableVector;
    .registers 6

    .prologue
    .line 170
    new-instance v2, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 171
    .local v2, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v4, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 173
    .local v0, "e":Ljava/util/Enumeration;
    :cond_b
    :goto_b
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_39

    .line 175
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    .line 177
    .local v3, "value":Ljava/lang/Object;
    instance-of v4, v3, Ljava/util/Vector;

    if-eqz v4, :cond_31

    .line 179
    check-cast v3, Ljava/util/Vector;

    .end local v3    # "value":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 181
    .local v1, "en":Ljava/util/Enumeration;
    :goto_1f
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 183
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/cms/Attribute;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/Attribute;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_1f

    .line 188
    .end local v1    # "en":Ljava/util/Enumeration;
    .restart local v3    # "value":Ljava/lang/Object;
    :cond_31
    invoke-static {v3}, Lorg/spongycastle/asn1/cms/Attribute;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/Attribute;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_b

    .line 192
    .end local v3    # "value":Ljava/lang/Object;
    :cond_39
    return-object v2
.end method

.method public toASN1Structure()Lorg/spongycastle/asn1/cms/Attributes;
    .registers 3

    .prologue
    .line 197
    new-instance v0, Lorg/spongycastle/asn1/cms/Attributes;

    invoke-virtual {p0}, Lorg/spongycastle/asn1/cms/AttributeTable;->toASN1EncodableVector()Lorg/spongycastle/asn1/ASN1EncodableVector;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/cms/Attributes;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    return-object v0
.end method

.method public toHashtable()Ljava/util/Hashtable;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lorg/spongycastle/asn1/cms/AttributeTable;->attributes:Ljava/util/Hashtable;

    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/cms/AttributeTable;->copyTable(Ljava/util/Hashtable;)Ljava/util/Hashtable;

    move-result-object v0

    return-object v0
.end method
