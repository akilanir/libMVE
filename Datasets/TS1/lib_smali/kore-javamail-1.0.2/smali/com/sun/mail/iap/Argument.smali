.class public Lcom/sun/mail/iap/Argument;
.super Ljava/lang/Object;
.source "Argument.java"


# instance fields
.field protected items:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    .line 61
    return-void
.end method

.method private astring([BLcom/sun/mail/iap/Protocol;)V
    .registers 4
    .param p1, "bytes"    # [B
    .param p2, "protocol"    # Lcom/sun/mail/iap/Protocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 237
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/sun/mail/iap/Argument;->nastring([BLcom/sun/mail/iap/Protocol;Z)V

    .line 238
    return-void
.end method

.method private literal(Lcom/sun/mail/iap/Literal;Lcom/sun/mail/iap/Protocol;)V
    .registers 4
    .param p1, "b"    # Lcom/sun/mail/iap/Literal;
    .param p2, "protocol"    # Lcom/sun/mail/iap/Protocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 336
    invoke-interface {p1}, Lcom/sun/mail/iap/Literal;->size()I

    move-result v0

    invoke-direct {p0, p2, v0}, Lcom/sun/mail/iap/Argument;->startLiteral(Lcom/sun/mail/iap/Protocol;I)Ljava/io/OutputStream;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/sun/mail/iap/Literal;->writeTo(Ljava/io/OutputStream;)V

    .line 337
    return-void
.end method

.method private literal(Ljava/io/ByteArrayOutputStream;Lcom/sun/mail/iap/Protocol;)V
    .registers 4
    .param p1, "b"    # Ljava/io/ByteArrayOutputStream;
    .param p2, "protocol"    # Lcom/sun/mail/iap/Protocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 328
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    invoke-direct {p0, p2, v0}, Lcom/sun/mail/iap/Argument;->startLiteral(Lcom/sun/mail/iap/Protocol;I)Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 329
    return-void
.end method

.method private literal([BLcom/sun/mail/iap/Protocol;)V
    .registers 4
    .param p1, "b"    # [B
    .param p2, "protocol"    # Lcom/sun/mail/iap/Protocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 320
    array-length v0, p1

    invoke-direct {p0, p2, v0}, Lcom/sun/mail/iap/Argument;->startLiteral(Lcom/sun/mail/iap/Protocol;I)Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 321
    return-void
.end method

.method private nastring([BLcom/sun/mail/iap/Protocol;Z)V
    .registers 12
    .param p1, "bytes"    # [B
    .param p2, "protocol"    # Lcom/sun/mail/iap/Protocol;
    .param p3, "doQuote"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 254
    invoke-virtual {p2}, Lcom/sun/mail/iap/Protocol;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    check-cast v4, Ljava/io/DataOutputStream;

    .line 255
    .local v4, "os":Ljava/io/DataOutputStream;
    array-length v3, p1

    .line 258
    .local v3, "len":I
    const/16 v6, 0x400

    if-le v3, v6, :cond_f

    .line 259
    invoke-direct {p0, p1, p2}, Lcom/sun/mail/iap/Argument;->literal([BLcom/sun/mail/iap/Protocol;)V

    .line 313
    :cond_e
    :goto_e
    return-void

    .line 264
    :cond_f
    if-nez v3, :cond_2c

    const/4 v5, 0x1

    .line 265
    .local v5, "quote":Z
    :goto_12
    const/4 v1, 0x0

    .line 268
    .local v1, "escape":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_14
    if-ge v2, v3, :cond_5d

    .line 269
    aget-byte v0, p1, v2

    .line 270
    .local v0, "b":B
    if-eqz v0, :cond_28

    const/16 v6, 0xd

    if-eq v0, v6, :cond_28

    const/16 v6, 0xa

    if-eq v0, v6, :cond_28

    and-int/lit16 v6, v0, 0xff

    const/16 v7, 0x7f

    if-le v6, v7, :cond_2e

    .line 272
    :cond_28
    invoke-direct {p0, p1, p2}, Lcom/sun/mail/iap/Argument;->literal([BLcom/sun/mail/iap/Protocol;)V

    goto :goto_e

    .end local v0    # "b":B
    .end local v1    # "escape":Z
    .end local v2    # "i":I
    .end local v5    # "quote":Z
    :cond_2c
    move v5, p3

    .line 264
    goto :goto_12

    .line 275
    .restart local v0    # "b":B
    .restart local v1    # "escape":Z
    .restart local v2    # "i":I
    .restart local v5    # "quote":Z
    :cond_2e
    const/16 v6, 0x2a

    if-eq v0, v6, :cond_50

    const/16 v6, 0x25

    if-eq v0, v6, :cond_50

    const/16 v6, 0x28

    if-eq v0, v6, :cond_50

    const/16 v6, 0x29

    if-eq v0, v6, :cond_50

    const/16 v6, 0x7b

    if-eq v0, v6, :cond_50

    const/16 v6, 0x22

    if-eq v0, v6, :cond_50

    const/16 v6, 0x5c

    if-eq v0, v6, :cond_50

    and-int/lit16 v6, v0, 0xff

    const/16 v7, 0x20

    if-gt v6, v7, :cond_5a

    .line 277
    :cond_50
    const/4 v5, 0x1

    .line 278
    const/16 v6, 0x22

    if-eq v0, v6, :cond_59

    const/16 v6, 0x5c

    if-ne v0, v6, :cond_5a

    .line 279
    :cond_59
    const/4 v1, 0x1

    .line 268
    :cond_5a
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 290
    .end local v0    # "b":B
    :cond_5d
    if-nez v5, :cond_8e

    array-length v6, p1

    const/4 v7, 0x3

    if-ne v6, v7, :cond_8e

    const/4 v6, 0x0

    aget-byte v6, p1, v6

    const/16 v7, 0x4e

    if-eq v6, v7, :cond_71

    const/4 v6, 0x0

    aget-byte v6, p1, v6

    const/16 v7, 0x6e

    if-ne v6, v7, :cond_8e

    :cond_71
    const/4 v6, 0x1

    aget-byte v6, p1, v6

    const/16 v7, 0x49

    if-eq v6, v7, :cond_7f

    const/4 v6, 0x1

    aget-byte v6, p1, v6

    const/16 v7, 0x69

    if-ne v6, v7, :cond_8e

    :cond_7f
    const/4 v6, 0x2

    aget-byte v6, p1, v6

    const/16 v7, 0x4c

    if-eq v6, v7, :cond_8d

    const/4 v6, 0x2

    aget-byte v6, p1, v6

    const/16 v7, 0x6c

    if-ne v6, v7, :cond_8e

    .line 294
    :cond_8d
    const/4 v5, 0x1

    .line 296
    :cond_8e
    if-eqz v5, :cond_95

    .line 297
    const/16 v6, 0x22

    invoke-virtual {v4, v6}, Ljava/io/DataOutputStream;->write(I)V

    .line 299
    :cond_95
    if-eqz v1, :cond_af

    .line 301
    const/4 v2, 0x0

    :goto_98
    if-ge v2, v3, :cond_b2

    .line 302
    aget-byte v0, p1, v2

    .line 303
    .restart local v0    # "b":B
    const/16 v6, 0x22

    if-eq v0, v6, :cond_a4

    const/16 v6, 0x5c

    if-ne v0, v6, :cond_a9

    .line 304
    :cond_a4
    const/16 v6, 0x5c

    invoke-virtual {v4, v6}, Ljava/io/DataOutputStream;->write(I)V

    .line 305
    :cond_a9
    invoke-virtual {v4, v0}, Ljava/io/DataOutputStream;->write(I)V

    .line 301
    add-int/lit8 v2, v2, 0x1

    goto :goto_98

    .line 308
    .end local v0    # "b":B
    :cond_af
    invoke-virtual {v4, p1}, Ljava/io/DataOutputStream;->write([B)V

    .line 311
    :cond_b2
    if-eqz v5, :cond_e

    .line 312
    const/16 v6, 0x22

    invoke-virtual {v4, v6}, Ljava/io/DataOutputStream;->write(I)V

    goto/16 :goto_e
.end method

.method private nstring([BLcom/sun/mail/iap/Protocol;)V
    .registers 5
    .param p1, "bytes"    # [B
    .param p2, "protocol"    # Lcom/sun/mail/iap/Protocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 245
    if-nez p1, :cond_e

    .line 246
    invoke-virtual {p2}, Lcom/sun/mail/iap/Protocol;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Ljava/io/DataOutputStream;

    .line 247
    .local v0, "os":Ljava/io/DataOutputStream;
    const-string v1, "NIL"

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 250
    .end local v0    # "os":Ljava/io/DataOutputStream;
    :goto_d
    return-void

    .line 249
    :cond_e
    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v1}, Lcom/sun/mail/iap/Argument;->nastring([BLcom/sun/mail/iap/Protocol;Z)V

    goto :goto_d
.end method

.method private startLiteral(Lcom/sun/mail/iap/Protocol;I)Ljava/io/OutputStream;
    .registers 7
    .param p1, "protocol"    # Lcom/sun/mail/iap/Protocol;
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 341
    invoke-virtual {p1}, Lcom/sun/mail/iap/Protocol;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Ljava/io/DataOutputStream;

    .line 342
    .local v1, "os":Ljava/io/DataOutputStream;
    invoke-virtual {p1}, Lcom/sun/mail/iap/Protocol;->supportsNonSyncLiterals()Z

    move-result v0

    .line 344
    .local v0, "nonSync":Z
    const/16 v3, 0x7b

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->write(I)V

    .line 345
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 346
    if-eqz v0, :cond_2d

    .line 347
    const-string v3, "+}\r\n"

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 350
    :goto_1d
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 354
    if-nez v0, :cond_2c

    .line 356
    :cond_22
    invoke-virtual {p1}, Lcom/sun/mail/iap/Protocol;->readResponse()Lcom/sun/mail/iap/Response;

    move-result-object v2

    .line 357
    .local v2, "r":Lcom/sun/mail/iap/Response;
    invoke-virtual {v2}, Lcom/sun/mail/iap/Response;->isContinuation()Z

    move-result v3

    if-eqz v3, :cond_33

    .line 365
    .end local v2    # "r":Lcom/sun/mail/iap/Response;
    :cond_2c
    return-object v1

    .line 349
    :cond_2d
    const-string v3, "}\r\n"

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    goto :goto_1d

    .line 359
    .restart local v2    # "r":Lcom/sun/mail/iap/Response;
    :cond_33
    invoke-virtual {v2}, Lcom/sun/mail/iap/Response;->isTagged()Z

    move-result v3

    if-eqz v3, :cond_22

    .line 360
    new-instance v3, Lcom/sun/mail/iap/LiteralException;

    invoke-direct {v3, v2}, Lcom/sun/mail/iap/LiteralException;-><init>(Lcom/sun/mail/iap/Response;)V

    throw v3
.end method


# virtual methods
.method public append(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;
    .registers 4
    .param p1, "arg"    # Lcom/sun/mail/iap/Argument;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    iget-object v1, p1, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 70
    return-object p0
.end method

.method public write(Lcom/sun/mail/iap/Protocol;)V
    .registers 7
    .param p1, "protocol"    # Lcom/sun/mail/iap/Protocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 202
    iget-object v4, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    if-eqz v4, :cond_2e

    iget-object v4, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 203
    .local v3, "size":I
    :goto_a
    invoke-virtual {p1}, Lcom/sun/mail/iap/Protocol;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    check-cast v2, Ljava/io/DataOutputStream;

    .line 205
    .local v2, "os":Ljava/io/DataOutputStream;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    if-ge v0, v3, :cond_8a

    .line 206
    if-lez v0, :cond_1a

    .line 207
    const/16 v4, 0x20

    invoke-virtual {v2, v4}, Ljava/io/DataOutputStream;->write(I)V

    .line 209
    :cond_1a
    iget-object v4, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 210
    .local v1, "o":Ljava/lang/Object;
    instance-of v4, v1, Lcom/sun/mail/iap/Atom;

    if-eqz v4, :cond_30

    .line 211
    check-cast v1, Lcom/sun/mail/iap/Atom;

    .end local v1    # "o":Ljava/lang/Object;
    iget-object v4, v1, Lcom/sun/mail/iap/Atom;->string:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 205
    :cond_2b
    :goto_2b
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .line 202
    .end local v0    # "i":I
    .end local v2    # "os":Ljava/io/DataOutputStream;
    .end local v3    # "size":I
    :cond_2e
    const/4 v3, 0x0

    goto :goto_a

    .line 212
    .restart local v0    # "i":I
    .restart local v1    # "o":Ljava/lang/Object;
    .restart local v2    # "os":Ljava/io/DataOutputStream;
    .restart local v3    # "size":I
    :cond_30
    instance-of v4, v1, Ljava/lang/Number;

    if-eqz v4, :cond_3e

    .line 213
    check-cast v1, Ljava/lang/Number;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    goto :goto_2b

    .line 214
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_3e
    instance-of v4, v1, Lcom/sun/mail/iap/AString;

    if-eqz v4, :cond_4a

    .line 215
    check-cast v1, Lcom/sun/mail/iap/AString;

    .end local v1    # "o":Ljava/lang/Object;
    iget-object v4, v1, Lcom/sun/mail/iap/AString;->bytes:[B

    invoke-direct {p0, v4, p1}, Lcom/sun/mail/iap/Argument;->astring([BLcom/sun/mail/iap/Protocol;)V

    goto :goto_2b

    .line 216
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_4a
    instance-of v4, v1, Lcom/sun/mail/iap/NString;

    if-eqz v4, :cond_56

    .line 217
    check-cast v1, Lcom/sun/mail/iap/NString;

    .end local v1    # "o":Ljava/lang/Object;
    iget-object v4, v1, Lcom/sun/mail/iap/NString;->bytes:[B

    invoke-direct {p0, v4, p1}, Lcom/sun/mail/iap/Argument;->nstring([BLcom/sun/mail/iap/Protocol;)V

    goto :goto_2b

    .line 218
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_56
    instance-of v4, v1, [B

    if-eqz v4, :cond_62

    .line 219
    check-cast v1, [B

    .end local v1    # "o":Ljava/lang/Object;
    check-cast v1, [B

    invoke-direct {p0, v1, p1}, Lcom/sun/mail/iap/Argument;->literal([BLcom/sun/mail/iap/Protocol;)V

    goto :goto_2b

    .line 220
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_62
    instance-of v4, v1, Ljava/io/ByteArrayOutputStream;

    if-eqz v4, :cond_6c

    .line 221
    check-cast v1, Ljava/io/ByteArrayOutputStream;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-direct {p0, v1, p1}, Lcom/sun/mail/iap/Argument;->literal(Ljava/io/ByteArrayOutputStream;Lcom/sun/mail/iap/Protocol;)V

    goto :goto_2b

    .line 222
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_6c
    instance-of v4, v1, Lcom/sun/mail/iap/Literal;

    if-eqz v4, :cond_76

    .line 223
    check-cast v1, Lcom/sun/mail/iap/Literal;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-direct {p0, v1, p1}, Lcom/sun/mail/iap/Argument;->literal(Lcom/sun/mail/iap/Literal;Lcom/sun/mail/iap/Protocol;)V

    goto :goto_2b

    .line 224
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_76
    instance-of v4, v1, Lcom/sun/mail/iap/Argument;

    if-eqz v4, :cond_2b

    .line 225
    const/16 v4, 0x28

    invoke-virtual {v2, v4}, Ljava/io/DataOutputStream;->write(I)V

    .line 226
    check-cast v1, Lcom/sun/mail/iap/Argument;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-virtual {v1, p1}, Lcom/sun/mail/iap/Argument;->write(Lcom/sun/mail/iap/Protocol;)V

    .line 227
    const/16 v4, 0x29

    invoke-virtual {v2, v4}, Ljava/io/DataOutputStream;->write(I)V

    goto :goto_2b

    .line 230
    :cond_8a
    return-void
.end method

.method public writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;
    .registers 3
    .param p1, "c"    # Lcom/sun/mail/iap/Argument;

    .prologue
    .line 193
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    return-object p0
.end method

.method public writeAtom(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 167
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    new-instance v1, Lcom/sun/mail/iap/Atom;

    invoke-direct {v1, p1}, Lcom/sun/mail/iap/Atom;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    return-object p0
.end method

.method public writeBytes(Lcom/sun/mail/iap/Literal;)Lcom/sun/mail/iap/Argument;
    .registers 3
    .param p1, "b"    # Lcom/sun/mail/iap/Literal;

    .prologue
    .line 156
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    return-object p0
.end method

.method public writeBytes(Ljava/io/ByteArrayOutputStream;)Lcom/sun/mail/iap/Argument;
    .registers 3
    .param p1, "b"    # Ljava/io/ByteArrayOutputStream;

    .prologue
    .line 147
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    return-object p0
.end method

.method public writeBytes([B)Lcom/sun/mail/iap/Argument;
    .registers 3
    .param p1, "b"    # [B

    .prologue
    .line 138
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    return-object p0
.end method

.method public writeNString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 5
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 109
    if-nez p1, :cond_e

    .line 110
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    new-instance v1, Lcom/sun/mail/iap/NString;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/sun/mail/iap/NString;-><init>([B)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    :goto_d
    return-object p0

    .line 112
    :cond_e
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    new-instance v1, Lcom/sun/mail/iap/NString;

    invoke-static {p1}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/sun/mail/iap/NString;-><init>([B)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d
.end method

.method public writeNString(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 6
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 124
    if-nez p1, :cond_e

    .line 125
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    new-instance v1, Lcom/sun/mail/iap/NString;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/sun/mail/iap/NString;-><init>([B)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    :goto_d
    return-object p0

    .line 126
    :cond_e
    if-nez p2, :cond_14

    .line 127
    invoke-virtual {p0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_d

    .line 129
    :cond_14
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    new-instance v1, Lcom/sun/mail/iap/NString;

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/sun/mail/iap/NString;-><init>([B)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d
.end method

.method public writeNumber(I)Lcom/sun/mail/iap/Argument;
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 176
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    return-object p0
.end method

.method public writeNumber(J)Lcom/sun/mail/iap/Argument;
    .registers 5
    .param p1, "i"    # J

    .prologue
    .line 185
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    return-object p0
.end method

.method public writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 5
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    new-instance v1, Lcom/sun/mail/iap/AString;

    invoke-static {p1}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/sun/mail/iap/AString;-><init>([B)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    return-object p0
.end method

.method public writeString(Ljava/lang/String;Ljava/lang/String;)Lcom/sun/mail/iap/Argument;
    .registers 6
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 93
    if-nez p2, :cond_6

    .line 94
    invoke-virtual {p0, p1}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 97
    :goto_5
    return-object p0

    .line 96
    :cond_6
    iget-object v0, p0, Lcom/sun/mail/iap/Argument;->items:Ljava/util/List;

    new-instance v1, Lcom/sun/mail/iap/AString;

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/sun/mail/iap/AString;-><init>([B)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5
.end method
