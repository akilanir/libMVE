.class Lcom/jcraft/jsch/KeyPair$ASN1;
.super Ljava/lang/Object;
.source "KeyPair.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jcraft/jsch/KeyPair;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ASN1"
.end annotation


# instance fields
.field buf:[B

.field length:I

.field start:I

.field final synthetic this$0:Lcom/jcraft/jsch/KeyPair;


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/KeyPair;[B)V
    .registers 5
    .param p2, "buf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/KeyPair$ASN1Exception;
        }
    .end annotation

    .prologue
    .line 1138
    const/4 v0, 0x0

    array-length v1, p2

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/jcraft/jsch/KeyPair$ASN1;-><init>(Lcom/jcraft/jsch/KeyPair;[BII)V

    .line 1139
    return-void
.end method

.method constructor <init>(Lcom/jcraft/jsch/KeyPair;[BII)V
    .registers 7
    .param p2, "buf"    # [B
    .param p3, "start"    # I
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/KeyPair$ASN1Exception;
        }
    .end annotation

    .prologue
    .line 1140
    iput-object p1, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->this$0:Lcom/jcraft/jsch/KeyPair;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1141
    iput-object p2, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->buf:[B

    .line 1142
    iput p3, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->start:I

    .line 1143
    iput p4, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->length:I

    .line 1144
    add-int v0, p3, p4

    array-length v1, p2

    if-le v0, v1, :cond_16

    .line 1145
    new-instance v0, Lcom/jcraft/jsch/KeyPair$ASN1Exception;

    invoke-direct {v0, p1}, Lcom/jcraft/jsch/KeyPair$ASN1Exception;-><init>(Lcom/jcraft/jsch/KeyPair;)V

    throw v0

    .line 1146
    :cond_16
    return-void
.end method

.method private getLength([I)I
    .registers 10
    .param p1, "indexp"    # [I

    .prologue
    const/4 v7, 0x0

    .line 1163
    aget v2, p1, v7

    .line 1164
    .local v2, "index":I
    iget-object v5, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->buf:[B

    add-int/lit8 v3, v2, 0x1

    .end local v2    # "index":I
    .local v3, "index":I
    aget-byte v5, v5, v2

    and-int/lit16 v4, v5, 0xff

    .line 1165
    .local v4, "length":I
    and-int/lit16 v5, v4, 0x80

    if-eqz v5, :cond_26

    .line 1166
    and-int/lit8 v0, v4, 0x7f

    .local v0, "foo":I
    const/4 v4, 0x0

    move v1, v0

    .line 1167
    .end local v0    # "foo":I
    .local v1, "foo":I
    :goto_13
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "foo":I
    .restart local v0    # "foo":I
    if-lez v1, :cond_26

    shl-int/lit8 v5, v4, 0x8

    iget-object v6, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->buf:[B

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "index":I
    .restart local v2    # "index":I
    aget-byte v6, v6, v3

    and-int/lit16 v6, v6, 0xff

    add-int v4, v5, v6

    move v1, v0

    .end local v0    # "foo":I
    .restart local v1    # "foo":I
    move v3, v2

    .end local v2    # "index":I
    .restart local v3    # "index":I
    goto :goto_13

    .end local v1    # "foo":I
    :cond_26
    move v2, v3

    .line 1169
    .end local v3    # "index":I
    .restart local v2    # "index":I
    aput v2, p1, v7

    .line 1170
    return v4
.end method


# virtual methods
.method getContent()[B
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 1173
    const/4 v4, 0x1

    new-array v1, v4, [I

    .line 1174
    .local v1, "indexp":[I
    iget v4, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->start:I

    add-int/lit8 v4, v4, 0x1

    aput v4, v1, v6

    .line 1175
    invoke-direct {p0, v1}, Lcom/jcraft/jsch/KeyPair$ASN1;->getLength([I)I

    move-result v2

    .line 1176
    .local v2, "length":I
    aget v0, v1, v6

    .line 1177
    .local v0, "index":I
    new-array v3, v2, [B

    .line 1178
    .local v3, "tmp":[B
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->buf:[B

    array-length v5, v3

    invoke-static {v4, v0, v3, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1179
    return-object v3
.end method

.method getContents()[Lcom/jcraft/jsch/KeyPair$ASN1;
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/KeyPair$ASN1Exception;
        }
    .end annotation

    .prologue
    const/4 v14, 0x0

    .line 1182
    iget-object v9, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->buf:[B

    iget v10, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->start:I

    aget-byte v7, v9, v10

    .line 1183
    .local v7, "typ":I
    const/4 v9, 0x1

    new-array v2, v9, [I

    .line 1184
    .local v2, "indexp":[I
    iget v9, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->start:I

    add-int/lit8 v9, v9, 0x1

    aput v9, v2, v14

    .line 1185
    invoke-direct {p0, v2}, Lcom/jcraft/jsch/KeyPair$ASN1;->getLength([I)I

    move-result v4

    .line 1186
    .local v4, "length":I
    const/4 v9, 0x5

    if-ne v7, v9, :cond_1a

    .line 1187
    new-array v5, v14, [Lcom/jcraft/jsch/KeyPair$ASN1;

    .line 1206
    :cond_19
    return-object v5

    .line 1189
    :cond_1a
    aget v1, v2, v14

    .line 1190
    .local v1, "index":I
    new-instance v8, Ljava/util/Vector;

    invoke-direct {v8}, Ljava/util/Vector;-><init>()V

    .line 1191
    .local v8, "values":Ljava/util/Vector;
    :goto_21
    if-lez v4, :cond_49

    .line 1192
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v4, v4, -0x1

    .line 1193
    move v6, v1

    .line 1194
    .local v6, "tmp":I
    aput v1, v2, v14

    .line 1195
    invoke-direct {p0, v2}, Lcom/jcraft/jsch/KeyPair$ASN1;->getLength([I)I

    move-result v3

    .line 1196
    .local v3, "l":I
    aget v1, v2, v14

    .line 1197
    sub-int v9, v1, v6

    sub-int/2addr v4, v9

    .line 1198
    new-instance v9, Lcom/jcraft/jsch/KeyPair$ASN1;

    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->this$0:Lcom/jcraft/jsch/KeyPair;

    iget-object v11, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->buf:[B

    add-int/lit8 v12, v6, -0x1

    sub-int v13, v1, v6

    add-int/lit8 v13, v13, 0x1

    add-int/2addr v13, v3

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/jcraft/jsch/KeyPair$ASN1;-><init>(Lcom/jcraft/jsch/KeyPair;[BII)V

    invoke-virtual {v8, v9}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1199
    add-int/2addr v1, v3

    .line 1200
    sub-int/2addr v4, v3

    .line 1201
    goto :goto_21

    .line 1202
    .end local v3    # "l":I
    .end local v6    # "tmp":I
    :cond_49
    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v9

    new-array v5, v9, [Lcom/jcraft/jsch/KeyPair$ASN1;

    .line 1203
    .local v5, "result":[Lcom/jcraft/jsch/KeyPair$ASN1;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_50
    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v9

    if-ge v0, v9, :cond_19

    .line 1204
    invoke-virtual {v8, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/jcraft/jsch/KeyPair$ASN1;

    aput-object v9, v5, v0

    .line 1203
    add-int/lit8 v0, v0, 0x1

    goto :goto_50
.end method

.method getType()I
    .registers 3

    .prologue
    .line 1148
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->buf:[B

    iget v1, p0, Lcom/jcraft/jsch/KeyPair$ASN1;->start:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method isINTEGER()Z
    .registers 3

    .prologue
    .line 1154
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair$ASN1;->getType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method isOBJECT()Z
    .registers 3

    .prologue
    .line 1157
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair$ASN1;->getType()I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method isOCTETSTRING()Z
    .registers 3

    .prologue
    .line 1160
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair$ASN1;->getType()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method isSEQUENCE()Z
    .registers 3

    .prologue
    .line 1151
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair$ASN1;->getType()I

    move-result v0

    const/16 v1, 0x30

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
