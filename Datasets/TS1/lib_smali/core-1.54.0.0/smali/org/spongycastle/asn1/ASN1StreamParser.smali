.class public Lorg/spongycastle/asn1/ASN1StreamParser;
.super Ljava/lang/Object;
.source "ASN1StreamParser.java"


# instance fields
.field private final _in:Ljava/io/InputStream;

.field private final _limit:I

.field private final tmpBuffers:[[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 19
    invoke-static {p1}, Lorg/spongycastle/asn1/StreamUtil;->findLimit(Ljava/io/InputStream;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;I)V

    .line 20
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "limit"    # I

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    .line 27
    iput p2, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_limit:I

    .line 29
    const/16 v0, 0xb

    new-array v0, v0, [[B

    iput-object v0, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->tmpBuffers:[[B

    .line 30
    return-void
.end method

.method public constructor <init>([B)V
    .registers 4
    .param p1, "encoding"    # [B

    .prologue
    .line 35
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    array-length v1, p1

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;I)V

    .line 36
    return-void
.end method

.method private set00Check(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 224
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    instance-of v0, v0, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;

    if-eqz v0, :cond_d

    .line 226
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    check-cast v0, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;

    invoke-virtual {v0, p1}, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;->setEofOn00(Z)V

    .line 228
    :cond_d
    return-void
.end method


# virtual methods
.method readImplicit(ZI)Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 5
    .param p1, "constructed"    # Z
    .param p2, "tag"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    instance-of v0, v0, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;

    if-eqz v0, :cond_15

    .line 62
    if-nez p1, :cond_10

    .line 64
    new-instance v0, Ljava/io/IOException;

    const-string v1, "indefinite-length primitive encoding encountered"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :cond_10
    invoke-virtual {p0, p2}, Lorg/spongycastle/asn1/ASN1StreamParser;->readIndef(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    .line 91
    :goto_14
    return-object v0

    .line 70
    :cond_15
    if-eqz p1, :cond_34

    .line 72
    sparse-switch p2, :sswitch_data_54

    .line 95
    :goto_1a
    new-instance v0, Lorg/spongycastle/asn1/ASN1Exception;

    const-string v1, "implicit tagging not implemented"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :sswitch_22
    new-instance v0, Lorg/spongycastle/asn1/DERSetParser;

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/DERSetParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    goto :goto_14

    .line 77
    :sswitch_28
    new-instance v0, Lorg/spongycastle/asn1/DERSequenceParser;

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/DERSequenceParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    goto :goto_14

    .line 79
    :sswitch_2e
    new-instance v0, Lorg/spongycastle/asn1/BEROctetStringParser;

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/BEROctetStringParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    goto :goto_14

    .line 84
    :cond_34
    sparse-switch p2, :sswitch_data_62

    goto :goto_1a

    .line 91
    :sswitch_38
    new-instance v1, Lorg/spongycastle/asn1/DEROctetStringParser;

    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    check-cast v0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;

    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DEROctetStringParser;-><init>(Lorg/spongycastle/asn1/DefiniteLengthInputStream;)V

    move-object v0, v1

    goto :goto_14

    .line 87
    :sswitch_43
    new-instance v0, Lorg/spongycastle/asn1/ASN1Exception;

    const-string v1, "sequences must use constructed encoding (see X.690 8.9.1/8.10.1)"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :sswitch_4b
    new-instance v0, Lorg/spongycastle/asn1/ASN1Exception;

    const-string v1, "sets must use constructed encoding (see X.690 8.11.1/8.12.1)"

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    nop

    :sswitch_data_54
    .sparse-switch
        0x4 -> :sswitch_2e
        0x10 -> :sswitch_28
        0x11 -> :sswitch_22
    .end sparse-switch

    .line 84
    :sswitch_data_62
    .sparse-switch
        0x4 -> :sswitch_38
        0x10 -> :sswitch_4b
        0x11 -> :sswitch_43
    .end sparse-switch
.end method

.method readIndef(I)Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 5
    .param p1, "tagValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    sparse-switch p1, :sswitch_data_38

    .line 54
    new-instance v0, Lorg/spongycastle/asn1/ASN1Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unknown BER object encountered: 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1Exception;-><init>(Ljava/lang/String;)V

    throw v0

    .line 46
    :sswitch_20
    new-instance v0, Lorg/spongycastle/asn1/DERExternalParser;

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/DERExternalParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 52
    :goto_25
    return-object v0

    .line 48
    :sswitch_26
    new-instance v0, Lorg/spongycastle/asn1/BEROctetStringParser;

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/BEROctetStringParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    goto :goto_25

    .line 50
    :sswitch_2c
    new-instance v0, Lorg/spongycastle/asn1/BERSequenceParser;

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/BERSequenceParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    goto :goto_25

    .line 52
    :sswitch_32
    new-instance v0, Lorg/spongycastle/asn1/BERSetParser;

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/BERSetParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    goto :goto_25

    .line 43
    :sswitch_data_38
    .sparse-switch
        0x4 -> :sswitch_26
        0x8 -> :sswitch_20
        0x10 -> :sswitch_2c
        0x11 -> :sswitch_32
    .end sparse-switch
.end method

.method public readObject()Lorg/spongycastle/asn1/ASN1Encodable;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v3, 0x0

    .line 124
    iget-object v9, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    invoke-virtual {v9}, Ljava/io/InputStream;->read()I

    move-result v6

    .line 125
    .local v6, "tag":I
    const/4 v9, -0x1

    if-ne v6, v9, :cond_d

    .line 127
    const/4 v8, 0x0

    .line 213
    :goto_c
    return-object v8

    .line 133
    :cond_d
    invoke-direct {p0, v3}, Lorg/spongycastle/asn1/ASN1StreamParser;->set00Check(Z)V

    .line 138
    iget-object v9, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    invoke-static {v9, v6}, Lorg/spongycastle/asn1/ASN1InputStream;->readTagNumber(Ljava/io/InputStream;I)I

    move-result v7

    .line 140
    .local v7, "tagNo":I
    and-int/lit8 v9, v6, 0x20

    if-eqz v9, :cond_1b

    move v3, v8

    .line 145
    .local v3, "isConstructed":Z
    :cond_1b
    iget-object v9, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    iget v10, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_limit:I

    invoke-static {v9, v10}, Lorg/spongycastle/asn1/ASN1InputStream;->readLength(Ljava/io/InputStream;I)I

    move-result v4

    .line 147
    .local v4, "length":I
    if-gez v4, :cond_59

    .line 149
    if-nez v3, :cond_2f

    .line 151
    new-instance v8, Ljava/io/IOException;

    const-string v9, "indefinite-length primitive encoding encountered"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 154
    :cond_2f
    new-instance v2, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;

    iget-object v9, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    iget v10, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_limit:I

    invoke-direct {v2, v9, v10}, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 155
    .local v2, "indIn":Lorg/spongycastle/asn1/IndefiniteLengthInputStream;
    new-instance v5, Lorg/spongycastle/asn1/ASN1StreamParser;

    iget v9, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_limit:I

    invoke-direct {v5, v2, v9}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;I)V

    .line 157
    .local v5, "sp":Lorg/spongycastle/asn1/ASN1StreamParser;
    and-int/lit8 v9, v6, 0x40

    if-eqz v9, :cond_49

    .line 159
    new-instance v8, Lorg/spongycastle/asn1/BERApplicationSpecificParser;

    invoke-direct {v8, v7, v5}, Lorg/spongycastle/asn1/BERApplicationSpecificParser;-><init>(ILorg/spongycastle/asn1/ASN1StreamParser;)V

    goto :goto_c

    .line 162
    :cond_49
    and-int/lit16 v9, v6, 0x80

    if-eqz v9, :cond_54

    .line 164
    new-instance v9, Lorg/spongycastle/asn1/BERTaggedObjectParser;

    invoke-direct {v9, v8, v7, v5}, Lorg/spongycastle/asn1/BERTaggedObjectParser;-><init>(ZILorg/spongycastle/asn1/ASN1StreamParser;)V

    move-object v8, v9

    goto :goto_c

    .line 167
    :cond_54
    invoke-virtual {v5, v7}, Lorg/spongycastle/asn1/ASN1StreamParser;->readIndef(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v8

    goto :goto_c

    .line 171
    .end local v2    # "indIn":Lorg/spongycastle/asn1/IndefiniteLengthInputStream;
    .end local v5    # "sp":Lorg/spongycastle/asn1/ASN1StreamParser;
    :cond_59
    new-instance v0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;

    iget-object v8, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    invoke-direct {v0, v8, v4}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 173
    .local v0, "defIn":Lorg/spongycastle/asn1/DefiniteLengthInputStream;
    and-int/lit8 v8, v6, 0x40

    if-eqz v8, :cond_6e

    .line 175
    new-instance v8, Lorg/spongycastle/asn1/DERApplicationSpecific;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    move-result-object v9

    invoke-direct {v8, v3, v7, v9}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(ZI[B)V

    goto :goto_c

    .line 178
    :cond_6e
    and-int/lit16 v8, v6, 0x80

    if-eqz v8, :cond_7d

    .line 180
    new-instance v8, Lorg/spongycastle/asn1/BERTaggedObjectParser;

    new-instance v9, Lorg/spongycastle/asn1/ASN1StreamParser;

    invoke-direct {v9, v0}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v8, v3, v7, v9}, Lorg/spongycastle/asn1/BERTaggedObjectParser;-><init>(ZILorg/spongycastle/asn1/ASN1StreamParser;)V

    goto :goto_c

    .line 183
    :cond_7d
    if-eqz v3, :cond_d1

    .line 186
    sparse-switch v7, :sswitch_data_ec

    .line 200
    new-instance v8, Ljava/io/IOException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "unknown tag "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " encountered"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 192
    :sswitch_a1
    new-instance v8, Lorg/spongycastle/asn1/BEROctetStringParser;

    new-instance v9, Lorg/spongycastle/asn1/ASN1StreamParser;

    invoke-direct {v9, v0}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v8, v9}, Lorg/spongycastle/asn1/BEROctetStringParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    goto/16 :goto_c

    .line 194
    :sswitch_ad
    new-instance v8, Lorg/spongycastle/asn1/DERSequenceParser;

    new-instance v9, Lorg/spongycastle/asn1/ASN1StreamParser;

    invoke-direct {v9, v0}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v8, v9}, Lorg/spongycastle/asn1/DERSequenceParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    goto/16 :goto_c

    .line 196
    :sswitch_b9
    new-instance v8, Lorg/spongycastle/asn1/DERSetParser;

    new-instance v9, Lorg/spongycastle/asn1/ASN1StreamParser;

    invoke-direct {v9, v0}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v8, v9}, Lorg/spongycastle/asn1/DERSetParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    goto/16 :goto_c

    .line 198
    :sswitch_c5
    new-instance v8, Lorg/spongycastle/asn1/DERExternalParser;

    new-instance v9, Lorg/spongycastle/asn1/ASN1StreamParser;

    invoke-direct {v9, v0}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v8, v9}, Lorg/spongycastle/asn1/DERExternalParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    goto/16 :goto_c

    .line 205
    :cond_d1
    packed-switch v7, :pswitch_data_fe

    .line 213
    :try_start_d4
    iget-object v8, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->tmpBuffers:[[B

    invoke-static {v7, v0, v8}, Lorg/spongycastle/asn1/ASN1InputStream;->createPrimitiveDERObject(ILorg/spongycastle/asn1/DefiniteLengthInputStream;[[B)Lorg/spongycastle/asn1/ASN1Primitive;
    :try_end_d9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_d4 .. :try_end_d9} :catch_e3

    move-result-object v8

    goto/16 :goto_c

    .line 208
    :pswitch_dc
    new-instance v8, Lorg/spongycastle/asn1/DEROctetStringParser;

    invoke-direct {v8, v0}, Lorg/spongycastle/asn1/DEROctetStringParser;-><init>(Lorg/spongycastle/asn1/DefiniteLengthInputStream;)V

    goto/16 :goto_c

    .line 215
    :catch_e3
    move-exception v1

    .line 217
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v8, Lorg/spongycastle/asn1/ASN1Exception;

    const-string v9, "corrupted stream detected"

    invoke-direct {v8, v9, v1}, Lorg/spongycastle/asn1/ASN1Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 186
    :sswitch_data_ec
    .sparse-switch
        0x4 -> :sswitch_a1
        0x8 -> :sswitch_c5
        0x10 -> :sswitch_ad
        0x11 -> :sswitch_b9
    .end sparse-switch

    .line 205
    :pswitch_data_fe
    .packed-switch 0x4
        :pswitch_dc
    .end packed-switch
.end method

.method readTaggedObject(ZI)Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 9
    .param p1, "constructed"    # Z
    .param p2, "tag"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 100
    if-nez p1, :cond_17

    .line 103
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    check-cast v0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;

    .line 104
    .local v0, "defIn":Lorg/spongycastle/asn1/DefiniteLengthInputStream;
    new-instance v2, Lorg/spongycastle/asn1/DERTaggedObject;

    new-instance v3, Lorg/spongycastle/asn1/DEROctetString;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    invoke-direct {v2, v5, p2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 118
    .end local v0    # "defIn":Lorg/spongycastle/asn1/DefiniteLengthInputStream;
    :goto_16
    return-object v2

    .line 107
    :cond_17
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1StreamParser;->readVector()Lorg/spongycastle/asn1/ASN1EncodableVector;

    move-result-object v1

    .line 109
    .local v1, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    iget-object v2, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    instance-of v2, v2, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;

    if-eqz v2, :cond_3b

    .line 111
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->size()I

    move-result v2

    if-ne v2, v4, :cond_31

    new-instance v2, Lorg/spongycastle/asn1/BERTaggedObject;

    .line 112
    invoke-virtual {v1, v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;->get(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-direct {v2, v4, p2, v3}, Lorg/spongycastle/asn1/BERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_16

    :cond_31
    new-instance v2, Lorg/spongycastle/asn1/BERTaggedObject;

    .line 113
    invoke-static {v1}, Lorg/spongycastle/asn1/BERFactory;->createSequence(Lorg/spongycastle/asn1/ASN1EncodableVector;)Lorg/spongycastle/asn1/BERSequence;

    move-result-object v3

    invoke-direct {v2, v5, p2, v3}, Lorg/spongycastle/asn1/BERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_16

    .line 116
    :cond_3b
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->size()I

    move-result v2

    if-ne v2, v4, :cond_4b

    new-instance v2, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 117
    invoke-virtual {v1, v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;->get(I)Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v3

    invoke-direct {v2, v4, p2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_16

    :cond_4b
    new-instance v2, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 118
    invoke-static {v1}, Lorg/spongycastle/asn1/DERFactory;->createSequence(Lorg/spongycastle/asn1/ASN1EncodableVector;)Lorg/spongycastle/asn1/ASN1Sequence;

    move-result-object v3

    invoke-direct {v2, v5, p2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_16
.end method

.method readVector()Lorg/spongycastle/asn1/ASN1EncodableVector;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 235
    .local v1, "v":Lorg/spongycastle/asn1/ASN1EncodableVector;
    :goto_5
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1StreamParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    move-result-object v0

    .local v0, "obj":Lorg/spongycastle/asn1/ASN1Encodable;
    if-eqz v0, :cond_21

    .line 237
    instance-of v2, v0, Lorg/spongycastle/asn1/InMemoryRepresentable;

    if-eqz v2, :cond_19

    .line 239
    check-cast v0, Lorg/spongycastle/asn1/InMemoryRepresentable;

    .end local v0    # "obj":Lorg/spongycastle/asn1/ASN1Encodable;
    invoke-interface {v0}, Lorg/spongycastle/asn1/InMemoryRepresentable;->getLoadedObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_5

    .line 243
    .restart local v0    # "obj":Lorg/spongycastle/asn1/ASN1Encodable;
    :cond_19
    invoke-interface {v0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    goto :goto_5

    .line 247
    :cond_21
    return-object v1
.end method
