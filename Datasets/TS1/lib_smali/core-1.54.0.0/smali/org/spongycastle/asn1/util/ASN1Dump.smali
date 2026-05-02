.class public Lorg/spongycastle/asn1/util/ASN1Dump;
.super Ljava/lang/Object;
.source "ASN1Dump.java"


# static fields
.field private static final SAMPLE_SIZE:I = 0x20

.field private static final TAB:Ljava/lang/String; = "    "


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static _dumpAsString(Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/StringBuffer;)V
    .registers 14
    .param p0, "indent"    # Ljava/lang/String;
    .param p1, "verbose"    # Z
    .param p2, "obj"    # Lorg/spongycastle/asn1/ASN1Primitive;
    .param p3, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 57
    invoke-static {}, Lorg/spongycastle/util/Strings;->lineSeparator()Ljava/lang/String;

    move-result-object v4

    .line 58
    .local v4, "nl":Ljava/lang/String;
    instance-of v8, p2, Lorg/spongycastle/asn1/ASN1Sequence;

    if-eqz v8, :cond_75

    move-object v8, p2

    .line 60
    check-cast v8, Lorg/spongycastle/asn1/ASN1Sequence;

    invoke-virtual {v8}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v1

    .line 61
    .local v1, "e":Ljava/util/Enumeration;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "    "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 63
    .local v7, "tab":Ljava/lang/String;
    invoke-virtual {p3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 64
    instance-of v8, p2, Lorg/spongycastle/asn1/BERSequence;

    if-eqz v8, :cond_51

    .line 66
    const-string v8, "BER Sequence"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 77
    :goto_2e
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 79
    :goto_31
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_ca

    .line 81
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    .line 83
    .local v5, "o":Ljava/lang/Object;
    if-eqz v5, :cond_45

    sget-object v8, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    invoke-virtual {v5, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_61

    .line 85
    :cond_45
    invoke-virtual {p3, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 86
    const-string v8, "NULL"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 87
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_31

    .line 68
    .end local v5    # "o":Ljava/lang/Object;
    :cond_51
    instance-of v8, p2, Lorg/spongycastle/asn1/DERSequence;

    if-eqz v8, :cond_5b

    .line 70
    const-string v8, "DER Sequence"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2e

    .line 74
    :cond_5b
    const-string v8, "Sequence"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2e

    .line 89
    .restart local v5    # "o":Ljava/lang/Object;
    :cond_61
    instance-of v8, v5, Lorg/spongycastle/asn1/ASN1Primitive;

    if-eqz v8, :cond_6b

    .line 91
    check-cast v5, Lorg/spongycastle/asn1/ASN1Primitive;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-static {v7, p1, v5, p3}, Lorg/spongycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/StringBuffer;)V

    goto :goto_31

    .line 95
    .restart local v5    # "o":Ljava/lang/Object;
    :cond_6b
    check-cast v5, Lorg/spongycastle/asn1/ASN1Encodable;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-interface {v5}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v8

    invoke-static {v7, p1, v8, p3}, Lorg/spongycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/StringBuffer;)V

    goto :goto_31

    .line 99
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v7    # "tab":Ljava/lang/String;
    :cond_75
    instance-of v8, p2, Lorg/spongycastle/asn1/ASN1TaggedObject;

    if-eqz v8, :cond_d9

    .line 101
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "    "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 103
    .restart local v7    # "tab":Ljava/lang/String;
    invoke-virtual {p3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 104
    instance-of v8, p2, Lorg/spongycastle/asn1/BERTaggedObject;

    if-eqz v8, :cond_cb

    .line 106
    const-string v8, "BER Tagged ["

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :goto_98
    move-object v5, p2

    .line 113
    check-cast v5, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 115
    .local v5, "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 116
    const/16 v8, 0x5d

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 118
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1TaggedObject;->isExplicit()Z

    move-result v8

    if-nez v8, :cond_b6

    .line 120
    const-string v8, " IMPLICIT "

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 123
    :cond_b6
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 125
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1TaggedObject;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_d1

    .line 127
    invoke-virtual {p3, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 128
    const-string v8, "EMPTY"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 129
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 297
    .end local v5    # "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    .end local v7    # "tab":Ljava/lang/String;
    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_ca
    :goto_ca
    return-void

    .line 110
    .restart local v7    # "tab":Ljava/lang/String;
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_cb
    const-string v8, "Tagged ["

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_98

    .line 133
    .restart local v5    # "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    :cond_d1
    invoke-virtual {v5}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v8

    invoke-static {v7, p1, v8, p3}, Lorg/spongycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/StringBuffer;)V

    goto :goto_ca

    .line 136
    .end local v5    # "o":Lorg/spongycastle/asn1/ASN1TaggedObject;
    .end local v7    # "tab":Ljava/lang/String;
    :cond_d9
    instance-of v8, p2, Lorg/spongycastle/asn1/ASN1Set;

    if-eqz v8, :cond_138

    move-object v8, p2

    .line 138
    check-cast v8, Lorg/spongycastle/asn1/ASN1Set;

    invoke-virtual {v8}, Lorg/spongycastle/asn1/ASN1Set;->getObjects()Ljava/util/Enumeration;

    move-result-object v1

    .line 139
    .restart local v1    # "e":Ljava/util/Enumeration;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "    "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 141
    .restart local v7    # "tab":Ljava/lang/String;
    invoke-virtual {p3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 143
    instance-of v8, p2, Lorg/spongycastle/asn1/BERSet;

    if-eqz v8, :cond_11e

    .line 145
    const-string v8, "BER Set"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 152
    :goto_103
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 154
    :goto_106
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_ca

    .line 156
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    .line 158
    .local v5, "o":Ljava/lang/Object;
    if-nez v5, :cond_124

    .line 160
    invoke-virtual {p3, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 161
    const-string v8, "NULL"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 162
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_106

    .line 149
    .end local v5    # "o":Ljava/lang/Object;
    :cond_11e
    const-string v8, "DER Set"

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_103

    .line 164
    .restart local v5    # "o":Ljava/lang/Object;
    :cond_124
    instance-of v8, v5, Lorg/spongycastle/asn1/ASN1Primitive;

    if-eqz v8, :cond_12e

    .line 166
    check-cast v5, Lorg/spongycastle/asn1/ASN1Primitive;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-static {v7, p1, v5, p3}, Lorg/spongycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/StringBuffer;)V

    goto :goto_106

    .line 170
    .restart local v5    # "o":Ljava/lang/Object;
    :cond_12e
    check-cast v5, Lorg/spongycastle/asn1/ASN1Encodable;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-interface {v5}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v8

    invoke-static {v7, p1, v8, p3}, Lorg/spongycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/StringBuffer;)V

    goto :goto_106

    .line 174
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v7    # "tab":Ljava/lang/String;
    :cond_138
    instance-of v8, p2, Lorg/spongycastle/asn1/ASN1OctetString;

    if-eqz v8, :cond_1ae

    move-object v6, p2

    .line 176
    check-cast v6, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 178
    .local v6, "oct":Lorg/spongycastle/asn1/ASN1OctetString;
    instance-of v8, p2, Lorg/spongycastle/asn1/BEROctetString;

    if-eqz v8, :cond_17d

    .line 180
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "BER Constructed Octet String"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v9

    array-length v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "] "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 186
    :goto_16e
    if-eqz p1, :cond_1a9

    .line 188
    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v8

    invoke-static {p0, v8}, Lorg/spongycastle/asn1/util/ASN1Dump;->dumpBinaryDataAsString(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 184
    :cond_17d
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "DER Octet String"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    move-result-object v9

    array-length v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "] "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_16e

    .line 192
    :cond_1a9
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 195
    .end local v6    # "oct":Lorg/spongycastle/asn1/ASN1OctetString;
    :cond_1ae
    instance-of v8, p2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    if-eqz v8, :cond_1de

    .line 197
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "ObjectIdentifier("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 199
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_1de
    instance-of v8, p2, Lorg/spongycastle/asn1/ASN1Boolean;

    if-eqz v8, :cond_20e

    .line 201
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Boolean("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/spongycastle/asn1/ASN1Boolean;

    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1Boolean;->isTrue()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 203
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_20e
    instance-of v8, p2, Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz v8, :cond_23e

    .line 205
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Integer("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/spongycastle/asn1/ASN1Integer;

    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 207
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_23e
    instance-of v8, p2, Lorg/spongycastle/asn1/DERBitString;

    if-eqz v8, :cond_292

    move-object v0, p2

    .line 209
    check-cast v0, Lorg/spongycastle/asn1/DERBitString;

    .line 210
    .local v0, "bt":Lorg/spongycastle/asn1/DERBitString;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "DER Bit String"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Lorg/spongycastle/asn1/DERBitString;->getBytes()[B

    move-result-object v9

    array-length v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Lorg/spongycastle/asn1/DERBitString;->getPadBits()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "] "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 211
    if-eqz p1, :cond_28d

    .line 213
    invoke-virtual {v0}, Lorg/spongycastle/asn1/DERBitString;->getBytes()[B

    move-result-object v8

    invoke-static {p0, v8}, Lorg/spongycastle/asn1/util/ASN1Dump;->dumpBinaryDataAsString(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 217
    :cond_28d
    invoke-virtual {p3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 220
    .end local v0    # "bt":Lorg/spongycastle/asn1/DERBitString;
    :cond_292
    instance-of v8, p2, Lorg/spongycastle/asn1/DERIA5String;

    if-eqz v8, :cond_2c2

    .line 222
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "IA5String("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/spongycastle/asn1/DERIA5String;

    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/DERIA5String;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 224
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_2c2
    instance-of v8, p2, Lorg/spongycastle/asn1/DERUTF8String;

    if-eqz v8, :cond_2f2

    .line 226
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "UTF8String("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/spongycastle/asn1/DERUTF8String;

    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/DERUTF8String;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 228
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_2f2
    instance-of v8, p2, Lorg/spongycastle/asn1/DERPrintableString;

    if-eqz v8, :cond_322

    .line 230
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "PrintableString("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/spongycastle/asn1/DERPrintableString;

    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/DERPrintableString;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 232
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_322
    instance-of v8, p2, Lorg/spongycastle/asn1/DERVisibleString;

    if-eqz v8, :cond_352

    .line 234
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "VisibleString("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/spongycastle/asn1/DERVisibleString;

    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/DERVisibleString;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 236
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_352
    instance-of v8, p2, Lorg/spongycastle/asn1/DERBMPString;

    if-eqz v8, :cond_382

    .line 238
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "BMPString("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/spongycastle/asn1/DERBMPString;

    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/DERBMPString;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 240
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_382
    instance-of v8, p2, Lorg/spongycastle/asn1/DERT61String;

    if-eqz v8, :cond_3b2

    .line 242
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "T61String("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/spongycastle/asn1/DERT61String;

    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/DERT61String;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 244
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_3b2
    instance-of v8, p2, Lorg/spongycastle/asn1/DERGraphicString;

    if-eqz v8, :cond_3e2

    .line 246
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "GraphicString("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/spongycastle/asn1/DERGraphicString;

    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/DERGraphicString;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 248
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_3e2
    instance-of v8, p2, Lorg/spongycastle/asn1/DERVideotexString;

    if-eqz v8, :cond_412

    .line 250
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "VideotexString("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/spongycastle/asn1/DERVideotexString;

    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/DERVideotexString;->getString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 252
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_412
    instance-of v8, p2, Lorg/spongycastle/asn1/ASN1UTCTime;

    if-eqz v8, :cond_442

    .line 254
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "UTCTime("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/spongycastle/asn1/ASN1UTCTime;

    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1UTCTime;->getTime()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 256
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_442
    instance-of v8, p2, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    if-eqz v8, :cond_472

    .line 258
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "GeneralizedTime("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    check-cast p2, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .end local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;->getTime()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 260
    .restart local p2    # "obj":Lorg/spongycastle/asn1/ASN1Primitive;
    :cond_472
    instance-of v8, p2, Lorg/spongycastle/asn1/BERApplicationSpecific;

    if-eqz v8, :cond_481

    .line 262
    const-string v8, "BER"

    invoke-static {v8, p0, p1, p2, v4}, Lorg/spongycastle/asn1/util/ASN1Dump;->outputApplicationSpecific(Ljava/lang/String;Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 264
    :cond_481
    instance-of v8, p2, Lorg/spongycastle/asn1/DERApplicationSpecific;

    if-eqz v8, :cond_490

    .line 266
    const-string v8, "DER"

    invoke-static {v8, p0, p1, p2, v4}, Lorg/spongycastle/asn1/util/ASN1Dump;->outputApplicationSpecific(Ljava/lang/String;Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 268
    :cond_490
    instance-of v8, p2, Lorg/spongycastle/asn1/ASN1Enumerated;

    if-eqz v8, :cond_4c1

    move-object v2, p2

    .line 270
    check-cast v2, Lorg/spongycastle/asn1/ASN1Enumerated;

    .line 271
    .local v2, "en":Lorg/spongycastle/asn1/ASN1Enumerated;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "DER Enumerated("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1Enumerated;->getValue()Ljava/math/BigInteger;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca

    .line 273
    .end local v2    # "en":Lorg/spongycastle/asn1/ASN1Enumerated;
    :cond_4c1
    instance-of v8, p2, Lorg/spongycastle/asn1/DERExternal;

    if-eqz v8, :cond_585

    move-object v3, p2

    .line 275
    check-cast v3, Lorg/spongycastle/asn1/DERExternal;

    .line 276
    .local v3, "ext":Lorg/spongycastle/asn1/DERExternal;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "External "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 277
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "    "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 278
    .restart local v7    # "tab":Ljava/lang/String;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERExternal;->getDirectReference()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v8

    if-eqz v8, :cond_521

    .line 280
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Direct Reference: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERExternal;->getDirectReference()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v9

    invoke-virtual {v9}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 282
    :cond_521
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERExternal;->getIndirectReference()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v8

    if-eqz v8, :cond_54d

    .line 284
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Indirect Reference: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERExternal;->getIndirectReference()Lorg/spongycastle/asn1/ASN1Integer;

    move-result-object v9

    invoke-virtual {v9}, Lorg/spongycastle/asn1/ASN1Integer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 286
    :cond_54d
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERExternal;->getDataValueDescriptor()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v8

    if-eqz v8, :cond_55a

    .line 288
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERExternal;->getDataValueDescriptor()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v8

    invoke-static {v7, p1, v8, p3}, Lorg/spongycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/StringBuffer;)V

    .line 290
    :cond_55a
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Encoding: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERExternal;->getEncoding()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 291
    invoke-virtual {v3}, Lorg/spongycastle/asn1/DERExternal;->getExternalContent()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v8

    invoke-static {v7, p1, v8, p3}, Lorg/spongycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/StringBuffer;)V

    goto/16 :goto_ca

    .line 295
    .end local v3    # "ext":Lorg/spongycastle/asn1/DERExternal;
    .end local v7    # "tab":Ljava/lang/String;
    :cond_585
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_ca
.end method

.method private static calculateAscString([BII)Ljava/lang/String;
    .registers 7
    .param p0, "bytes"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 403
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 405
    .local v0, "buf":Ljava/lang/StringBuffer;
    move v1, p1

    .local v1, "i":I
    :goto_6
    add-int v2, p1, p2

    if-eq v1, v2, :cond_1f

    .line 407
    aget-byte v2, p0, v1

    const/16 v3, 0x20

    if-lt v2, v3, :cond_1c

    aget-byte v2, p0, v1

    const/16 v3, 0x7e

    if-gt v2, v3, :cond_1c

    .line 409
    aget-byte v2, p0, v1

    int-to-char v2, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 405
    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 413
    :cond_1f
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static dumpAsString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 334
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/spongycastle/asn1/util/ASN1Dump;->dumpAsString(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static dumpAsString(Ljava/lang/Object;Z)Ljava/lang/String;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "verbose"    # Z

    .prologue
    .line 348
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 350
    .local v0, "buf":Ljava/lang/StringBuffer;
    instance-of v1, p0, Lorg/spongycastle/asn1/ASN1Primitive;

    if-eqz v1, :cond_15

    .line 352
    const-string v1, ""

    check-cast p0, Lorg/spongycastle/asn1/ASN1Primitive;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-static {v1, p1, p0, v0}, Lorg/spongycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/StringBuffer;)V

    .line 363
    :goto_10
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_14
    return-object v1

    .line 354
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_15
    instance-of v1, p0, Lorg/spongycastle/asn1/ASN1Encodable;

    if-eqz v1, :cond_25

    .line 356
    const-string v1, ""

    check-cast p0, Lorg/spongycastle/asn1/ASN1Encodable;

    .end local p0    # "obj":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-static {v1, p1, v2, v0}, Lorg/spongycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/StringBuffer;)V

    goto :goto_10

    .line 360
    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_25
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown object type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_14
.end method

.method private static dumpBinaryDataAsString(Ljava/lang/String;[B)Ljava/lang/String;
    .registers 9
    .param p0, "indent"    # Ljava/lang/String;
    .param p1, "bytes"    # [B

    .prologue
    const/16 v6, 0x20

    .line 368
    invoke-static {}, Lorg/spongycastle/util/Strings;->lineSeparator()Ljava/lang/String;

    move-result-object v3

    .line 369
    .local v3, "nl":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 371
    .local v0, "buf":Ljava/lang/StringBuffer;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "    "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 373
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 374
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_22
    array-length v4, p1

    if-ge v1, v4, :cond_7a

    .line 376
    array-length v4, p1

    sub-int/2addr v4, v1

    if-le v4, v6, :cond_4a

    .line 378
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 379
    new-instance v4, Ljava/lang/String;

    invoke-static {p1, v1, v6}, Lorg/spongycastle/util/encoders/Hex;->encode([BII)[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 380
    const-string v4, "    "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 381
    invoke-static {p1, v1, v6}, Lorg/spongycastle/asn1/util/ASN1Dump;->calculateAscString([BII)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 382
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 374
    :goto_47
    add-int/lit8 v1, v1, 0x20

    goto :goto_22

    .line 386
    :cond_4a
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 387
    new-instance v4, Ljava/lang/String;

    array-length v5, p1

    sub-int/2addr v5, v1

    invoke-static {p1, v1, v5}, Lorg/spongycastle/util/encoders/Hex;->encode([BII)[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 388
    array-length v4, p1

    sub-int v2, v4, v1

    .local v2, "j":I
    :goto_5e
    if-eq v2, v6, :cond_68

    .line 390
    const-string v4, "  "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 388
    add-int/lit8 v2, v2, 0x1

    goto :goto_5e

    .line 392
    :cond_68
    const-string v4, "    "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 393
    array-length v4, p1

    sub-int/2addr v4, v1

    invoke-static {p1, v1, v4}, Lorg/spongycastle/asn1/util/ASN1Dump;->calculateAscString([BII)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 394
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_47

    .line 398
    .end local v2    # "j":I
    :cond_7a
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private static outputApplicationSpecific(Ljava/lang/String;Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "indent"    # Ljava/lang/String;
    .param p2, "verbose"    # Z
    .param p3, "obj"    # Lorg/spongycastle/asn1/ASN1Primitive;
    .param p4, "nl"    # Ljava/lang/String;

    .prologue
    .line 301
    invoke-static {p3}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ApplicationSpecific;

    move-result-object v0

    .line 302
    .local v0, "app":Lorg/spongycastle/asn1/ASN1ApplicationSpecific;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 304
    .local v1, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->isConstructed()Z

    move-result v4

    if-eqz v4, :cond_75

    .line 308
    const/16 v4, 0x10

    :try_start_11
    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getObject(I)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v4

    invoke-static {v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v3

    .line 309
    .local v3, "s":Lorg/spongycastle/asn1/ASN1Sequence;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ApplicationSpecific["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getApplicationTag()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 310
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "e":Ljava/util/Enumeration;
    :goto_49
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_70

    .line 312
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "    "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/spongycastle/asn1/ASN1Primitive;

    invoke-static {v5, p2, v4, v1}, Lorg/spongycastle/asn1/util/ASN1Dump;->_dumpAsString(Ljava/lang/String;ZLorg/spongycastle/asn1/ASN1Primitive;Ljava/lang/StringBuffer;)V
    :try_end_6b
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_6b} :catch_6c

    goto :goto_49

    .line 315
    .end local v2    # "e":Ljava/util/Enumeration;
    .end local v3    # "s":Lorg/spongycastle/asn1/ASN1Sequence;
    :catch_6c
    move-exception v2

    .line 317
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 319
    .end local v2    # "e":Ljava/io/IOException;
    :cond_70
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 322
    :goto_74
    return-object v4

    :cond_75
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ApplicationSpecific["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getApplicationTag()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    new-instance v5, Ljava/lang/String;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getContents()[B

    move-result-object v6

    invoke-static {v6}, Lorg/spongycastle/util/encoders/Hex;->encode([B)[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_74
.end method
