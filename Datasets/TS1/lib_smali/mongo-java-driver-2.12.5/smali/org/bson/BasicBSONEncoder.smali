.class public Lorg/bson/BasicBSONEncoder;
.super Ljava/lang/Object;
.source "BasicBSONEncoder.java"

# interfaces
.implements Lorg/bson/BSONEncoder;


# static fields
.field static final DEBUG:Z


# instance fields
.field protected _buf:Lorg/bson/io/OutputBuffer;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    return-void
.end method

.method private _putString(Ljava/lang/String;Ljava/lang/String;B)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "s"    # Ljava/lang/String;
    .param p3, "type"    # B

    .prologue
    .line 432
    invoke-virtual {p0, p3, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 433
    invoke-virtual {p0, p2}, Lorg/bson/BasicBSONEncoder;->_putValueString(Ljava/lang/String;)V

    .line 434
    return-void
.end method

.method private putArray(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "array"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 290
    const/4 v3, 0x4

    invoke-virtual {p0, v3, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 291
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v2

    .line 292
    .local v2, "sizePos":I
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3, v5}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 294
    invoke-static {p2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    .line 295
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    if-ge v0, v1, :cond_25

    .line 296
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {p2, v0}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/bson/BasicBSONEncoder;->_putObjectField(Ljava/lang/String;Ljava/lang/Object;)V

    .line 295
    add-int/lit8 v0, v0, 0x1

    goto :goto_15

    .line 298
    :cond_25
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3, v5}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 299
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    iget-object v4, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v4}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v3, v2, v4}, Lorg/bson/io/OutputBuffer;->writeInt(II)V

    .line 300
    return-void
.end method

.method private putBinary(Ljava/lang/String;I[B)V
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # I
    .param p3, "data"    # [B

    .prologue
    const/4 v4, 0x2

    .line 400
    const/4 v3, 0x5

    invoke-virtual {p0, v3, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 401
    array-length v2, p3

    .line 403
    .local v2, "totalLen":I
    if-ne p2, v4, :cond_a

    .line 404
    add-int/lit8 v2, v2, 0x4

    .line 406
    :cond_a
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3, v2}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 407
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3, p2}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 408
    if-ne p2, v4, :cond_1d

    .line 409
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    add-int/lit8 v4, v2, -0x4

    invoke-virtual {v3, v4}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 410
    :cond_1d
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v1

    .line 411
    .local v1, "before":I
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3, p3}, Lorg/bson/io/OutputBuffer;->write([B)V

    .line 412
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v0

    .line 413
    .local v0, "after":I
    return-void
.end method

.method private putIterable(Ljava/lang/String;Ljava/lang/Iterable;)V
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "l"    # Ljava/lang/Iterable;

    .prologue
    const/4 v5, 0x0

    .line 303
    const/4 v4, 0x4

    invoke-virtual {p0, v4, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 304
    iget-object v4, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v4}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v3

    .line 305
    .local v3, "sizePos":I
    iget-object v4, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v4, v5}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 307
    const/4 v0, 0x0

    .line 308
    .local v0, "i":I
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_29

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 309
    .local v2, "obj":Ljava/lang/Object;
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v2}, Lorg/bson/BasicBSONEncoder;->_putObjectField(Ljava/lang/String;Ljava/lang/Object;)V

    .line 310
    add-int/lit8 v0, v0, 0x1

    .line 311
    goto :goto_15

    .line 314
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_29
    iget-object v4, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v4, v5}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 315
    iget-object v4, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    iget-object v5, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v5}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v5

    sub-int/2addr v5, v3

    invoke-virtual {v4, v3, v5}, Lorg/bson/io/OutputBuffer;->writeInt(II)V

    .line 316
    return-void
.end method

.method private putMap(Ljava/lang/String;Ljava/util/Map;)V
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "m"    # Ljava/util/Map;

    .prologue
    const/4 v5, 0x0

    .line 319
    const/4 v3, 0x3

    invoke-virtual {p0, v3, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 320
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v2

    .line 321
    .local v2, "sizePos":I
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3, v5}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 323
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_34

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 324
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lorg/bson/BasicBSONEncoder;->_putObjectField(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_18

    .line 326
    .end local v0    # "entry":Ljava/util/Map$Entry;
    :cond_34
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v3, v5}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 327
    iget-object v3, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    iget-object v4, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v4}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v3, v2, v4}, Lorg/bson/io/OutputBuffer;->writeInt(II)V

    .line 328
    return-void
.end method

.method private putMaxKey(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 455
    const/16 v0, 0x7f

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 456
    return-void
.end method

.method private putMinKey(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 451
    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 452
    return-void
.end method

.method private putPattern(Ljava/lang/String;Ljava/util/regex/Pattern;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "p"    # Ljava/util/regex/Pattern;

    .prologue
    .line 445
    const/16 v0, 0xb

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 446
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeCString(Ljava/lang/String;)I

    .line 447
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Ljava/util/regex/Pattern;->flags()I

    move-result v1

    invoke-static {v1}, Lorg/bson/BSON;->regexFlags(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeCString(Ljava/lang/String;)I

    .line 448
    return-void
.end method


# virtual methods
.method protected _put(Ljava/lang/String;)I
    .registers 3
    .param p1, "str"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 495
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/OutputBuffer;->writeCString(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method protected _put(BLjava/lang/String;)V
    .registers 4
    .param p1, "type"    # B
    .param p2, "name"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 469
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 470
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p2}, Lorg/bson/io/OutputBuffer;->writeCString(Ljava/lang/String;)I

    .line 471
    return-void
.end method

.method protected _putObjectField(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/Object;

    .prologue
    .line 211
    const-string v1, "_transientFields"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 287
    :cond_8
    :goto_8
    return-void

    .line 216
    :cond_9
    const-string v1, "\u0000"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 217
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Document field names can\'t have a NULL character. (Bad Key: \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\')"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 219
    :cond_30
    const-string v1, "$where"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_49

    instance-of v1, p2, Ljava/lang/String;

    if-eqz v1, :cond_49

    .line 220
    const/16 v1, 0xd

    invoke-virtual {p0, v1, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 221
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/bson/BasicBSONEncoder;->_putValueString(Ljava/lang/String;)V

    goto :goto_8

    .line 225
    :cond_49
    invoke-static {p2}, Lorg/bson/BSON;->applyEncodingHooks(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 227
    if-nez p2, :cond_53

    .line 228
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONEncoder;->putNull(Ljava/lang/String;)V

    goto :goto_8

    .line 229
    :cond_53
    instance-of v1, p2, Ljava/util/Date;

    if-eqz v1, :cond_5e

    move-object v1, p2

    .line 230
    check-cast v1, Ljava/util/Date;

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putDate(Ljava/lang/String;Ljava/util/Date;)V

    goto :goto_8

    .line 231
    :cond_5e
    instance-of v1, p2, Ljava/lang/Number;

    if-eqz v1, :cond_69

    move-object v1, p2

    .line 232
    check-cast v1, Ljava/lang/Number;

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putNumber(Ljava/lang/String;Ljava/lang/Number;)V

    goto :goto_8

    .line 233
    :cond_69
    instance-of v1, p2, Ljava/lang/Character;

    if-eqz v1, :cond_75

    .line 234
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    .line 235
    :cond_75
    instance-of v1, p2, Ljava/lang/String;

    if-eqz v1, :cond_81

    .line 236
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    .line 237
    :cond_81
    instance-of v1, p2, Lorg/bson/types/ObjectId;

    if-eqz v1, :cond_8d

    move-object v1, p2

    .line 238
    check-cast v1, Lorg/bson/types/ObjectId;

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putObjectId(Ljava/lang/String;Lorg/bson/types/ObjectId;)V

    goto/16 :goto_8

    .line 239
    :cond_8d
    instance-of v1, p2, Lorg/bson/BSONObject;

    if-eqz v1, :cond_99

    move-object v1, p2

    .line 240
    check-cast v1, Lorg/bson/BSONObject;

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putObject(Ljava/lang/String;Lorg/bson/BSONObject;)I

    goto/16 :goto_8

    .line 241
    :cond_99
    instance-of v1, p2, Ljava/lang/Boolean;

    if-eqz v1, :cond_a5

    move-object v1, p2

    .line 242
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putBoolean(Ljava/lang/String;Ljava/lang/Boolean;)V

    goto/16 :goto_8

    .line 243
    :cond_a5
    instance-of v1, p2, Ljava/util/regex/Pattern;

    if-eqz v1, :cond_b1

    move-object v1, p2

    .line 244
    check-cast v1, Ljava/util/regex/Pattern;

    invoke-direct {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putPattern(Ljava/lang/String;Ljava/util/regex/Pattern;)V

    goto/16 :goto_8

    .line 245
    :cond_b1
    instance-of v1, p2, Ljava/util/Map;

    if-eqz v1, :cond_bd

    move-object v1, p2

    .line 246
    check-cast v1, Ljava/util/Map;

    invoke-direct {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putMap(Ljava/lang/String;Ljava/util/Map;)V

    goto/16 :goto_8

    .line 247
    :cond_bd
    instance-of v1, p2, Ljava/lang/Iterable;

    if-eqz v1, :cond_c9

    move-object v1, p2

    .line 248
    check-cast v1, Ljava/lang/Iterable;

    invoke-direct {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putIterable(Ljava/lang/String;Ljava/lang/Iterable;)V

    goto/16 :goto_8

    .line 249
    :cond_c9
    instance-of v1, p2, [B

    if-eqz v1, :cond_d7

    move-object v1, p2

    .line 250
    check-cast v1, [B

    check-cast v1, [B

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putBinary(Ljava/lang/String;[B)V

    goto/16 :goto_8

    .line 251
    :cond_d7
    instance-of v1, p2, Lorg/bson/types/Binary;

    if-eqz v1, :cond_e3

    move-object v1, p2

    .line 252
    check-cast v1, Lorg/bson/types/Binary;

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putBinary(Ljava/lang/String;Lorg/bson/types/Binary;)V

    goto/16 :goto_8

    .line 253
    :cond_e3
    instance-of v1, p2, Ljava/util/UUID;

    if-eqz v1, :cond_ef

    move-object v1, p2

    .line 254
    check-cast v1, Ljava/util/UUID;

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putUUID(Ljava/lang/String;Ljava/util/UUID;)V

    goto/16 :goto_8

    .line 255
    :cond_ef
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_fe

    .line 256
    invoke-direct {p0, p1, p2}, Lorg/bson/BasicBSONEncoder;->putArray(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_8

    .line 258
    :cond_fe
    instance-of v1, p2, Lorg/bson/types/Symbol;

    if-eqz v1, :cond_10a

    move-object v1, p2

    .line 259
    check-cast v1, Lorg/bson/types/Symbol;

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putSymbol(Ljava/lang/String;Lorg/bson/types/Symbol;)V

    goto/16 :goto_8

    .line 261
    :cond_10a
    instance-of v1, p2, Lorg/bson/types/BSONTimestamp;

    if-eqz v1, :cond_116

    move-object v1, p2

    .line 262
    check-cast v1, Lorg/bson/types/BSONTimestamp;

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putTimestamp(Ljava/lang/String;Lorg/bson/types/BSONTimestamp;)V

    goto/16 :goto_8

    .line 264
    :cond_116
    instance-of v1, p2, Lorg/bson/types/CodeWScope;

    if-eqz v1, :cond_122

    move-object v1, p2

    .line 265
    check-cast v1, Lorg/bson/types/CodeWScope;

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putCodeWScope(Ljava/lang/String;Lorg/bson/types/CodeWScope;)V

    goto/16 :goto_8

    .line 267
    :cond_122
    instance-of v1, p2, Lorg/bson/types/Code;

    if-eqz v1, :cond_12e

    move-object v1, p2

    .line 268
    check-cast v1, Lorg/bson/types/Code;

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONEncoder;->putCode(Ljava/lang/String;Lorg/bson/types/Code;)V

    goto/16 :goto_8

    .line 270
    :cond_12e
    instance-of v1, p2, Lcom/mongodb/DBRefBase;

    if-eqz v1, :cond_154

    .line 271
    new-instance v0, Lorg/bson/BasicBSONObject;

    invoke-direct {v0}, Lorg/bson/BasicBSONObject;-><init>()V

    .line 272
    .local v0, "temp":Lorg/bson/BSONObject;
    const-string v2, "$ref"

    move-object v1, p2

    check-cast v1, Lcom/mongodb/DBRefBase;

    invoke-virtual {v1}, Lcom/mongodb/DBRefBase;->getRef()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Lorg/bson/BSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    const-string v2, "$id"

    move-object v1, p2

    check-cast v1, Lcom/mongodb/DBRefBase;

    invoke-virtual {v1}, Lcom/mongodb/DBRefBase;->getId()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Lorg/bson/BSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONEncoder;->putObject(Ljava/lang/String;Lorg/bson/BSONObject;)I

    goto/16 :goto_8

    .line 276
    .end local v0    # "temp":Lorg/bson/BSONObject;
    :cond_154
    instance-of v1, p2, Lorg/bson/types/MinKey;

    if-eqz v1, :cond_15d

    .line 277
    invoke-direct {p0, p1}, Lorg/bson/BasicBSONEncoder;->putMinKey(Ljava/lang/String;)V

    goto/16 :goto_8

    .line 278
    :cond_15d
    instance-of v1, p2, Lorg/bson/types/MaxKey;

    if-eqz v1, :cond_166

    .line 279
    invoke-direct {p0, p1}, Lorg/bson/BasicBSONEncoder;->putMaxKey(Ljava/lang/String;)V

    goto/16 :goto_8

    .line 280
    :cond_166
    invoke-virtual {p0, p1, p2}, Lorg/bson/BasicBSONEncoder;->putSpecial(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 284
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can\'t serialize "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected _putValueString(Ljava/lang/String;)V
    .registers 3
    .param p1, "s"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 480
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/OutputBuffer;->writeString(Ljava/lang/String;)V

    .line 481
    return-void
.end method

.method _reset(Ljava/nio/Buffer;)V
    .registers 3
    .param p1, "b"    # Ljava/nio/Buffer;

    .prologue
    .line 484
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/Buffer;->position(I)Ljava/nio/Buffer;

    .line 485
    invoke-virtual {p1}, Ljava/nio/Buffer;->capacity()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/nio/Buffer;->limit(I)Ljava/nio/Buffer;

    .line 486
    return-void
.end method

.method public done()V
    .registers 2

    .prologue
    .line 108
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    .line 109
    return-void
.end method

.method public encode(Lorg/bson/BSONObject;)[B
    .registers 4
    .param p1, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 84
    new-instance v0, Lorg/bson/io/BasicOutputBuffer;

    invoke-direct {v0}, Lorg/bson/io/BasicOutputBuffer;-><init>()V

    .line 85
    .local v0, "buf":Lorg/bson/io/BasicOutputBuffer;
    invoke-virtual {p0, v0}, Lorg/bson/BasicBSONEncoder;->set(Lorg/bson/io/OutputBuffer;)V

    .line 86
    invoke-virtual {p0, p1}, Lorg/bson/BasicBSONEncoder;->putObject(Lorg/bson/BSONObject;)I

    .line 87
    invoke-virtual {p0}, Lorg/bson/BasicBSONEncoder;->done()V

    .line 88
    invoke-virtual {v0}, Lorg/bson/io/BasicOutputBuffer;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method protected getOutputBuffer()Lorg/bson/io/OutputBuffer;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    return-object v0
.end method

.method protected handleSpecialObjects(Ljava/lang/String;Lorg/bson/BSONObject;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "o"    # Lorg/bson/BSONObject;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 118
    const/4 v0, 0x0

    return v0
.end method

.method protected putBinary(Ljava/lang/String;Lorg/bson/types/Binary;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "val"    # Lorg/bson/types/Binary;

    .prologue
    .line 396
    invoke-virtual {p2}, Lorg/bson/types/Binary;->getType()B

    move-result v0

    invoke-virtual {p2}, Lorg/bson/types/Binary;->getData()[B

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lorg/bson/BasicBSONEncoder;->putBinary(Ljava/lang/String;I[B)V

    .line 397
    return-void
.end method

.method protected putBinary(Ljava/lang/String;[B)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "data"    # [B

    .prologue
    .line 392
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lorg/bson/BasicBSONEncoder;->putBinary(Ljava/lang/String;I[B)V

    .line 393
    return-void
.end method

.method protected putBoolean(Ljava/lang/String;Ljava/lang/Boolean;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "b"    # Ljava/lang/Boolean;

    .prologue
    .line 361
    const/16 v0, 0x8

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 362
    iget-object v1, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_e
    invoke-virtual {v1, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 363
    return-void

    .line 362
    :cond_12
    const/4 v0, 0x0

    goto :goto_e
.end method

.method protected putCode(Ljava/lang/String;Lorg/bson/types/Code;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "code"    # Lorg/bson/types/Code;

    .prologue
    .line 355
    const/16 v1, 0xd

    invoke-virtual {p0, v1, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 356
    iget-object v1, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v1}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v0

    .line 357
    .local v0, "temp":I
    invoke-virtual {p2}, Lorg/bson/types/Code;->getCode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/bson/BasicBSONEncoder;->_putValueString(Ljava/lang/String;)V

    .line 358
    return-void
.end method

.method protected putCodeWScope(Ljava/lang/String;Lorg/bson/types/CodeWScope;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "code"    # Lorg/bson/types/CodeWScope;

    .prologue
    .line 346
    const/16 v1, 0xf

    invoke-virtual {p0, v1, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 347
    iget-object v1, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v1}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v0

    .line 348
    .local v0, "temp":I
    iget-object v1, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 349
    invoke-virtual {p2}, Lorg/bson/types/CodeWScope;->getCode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/bson/BasicBSONEncoder;->_putValueString(Ljava/lang/String;)V

    .line 350
    invoke-virtual {p2}, Lorg/bson/types/CodeWScope;->getScope()Lorg/bson/BSONObject;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/bson/BasicBSONEncoder;->putObject(Lorg/bson/BSONObject;)I

    .line 351
    iget-object v1, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    iget-object v2, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v2}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-virtual {v1, v0, v2}, Lorg/bson/io/OutputBuffer;->writeInt(II)V

    .line 352
    return-void
.end method

.method protected putDate(Ljava/lang/String;Ljava/util/Date;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "d"    # Ljava/util/Date;

    .prologue
    .line 366
    const/16 v0, 0x9

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 367
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/bson/io/OutputBuffer;->writeLong(J)V

    .line 368
    return-void
.end method

.method protected putNull(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 332
    const/16 v0, 0xa

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 333
    return-void
.end method

.method protected putNumber(Ljava/lang/String;Ljava/lang/Number;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "n"    # Ljava/lang/Number;

    .prologue
    .line 371
    instance-of v0, p2, Ljava/lang/Integer;

    if-nez v0, :cond_10

    instance-of v0, p2, Ljava/lang/Short;

    if-nez v0, :cond_10

    instance-of v0, p2, Ljava/lang/Byte;

    if-nez v0, :cond_10

    instance-of v0, p2, Ljava/util/concurrent/atomic/AtomicInteger;

    if-eqz v0, :cond_1f

    .line 375
    :cond_10
    const/16 v0, 0x10

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 376
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 389
    :goto_1e
    return-void

    .line 378
    :cond_1f
    instance-of v0, p2, Ljava/lang/Long;

    if-nez v0, :cond_27

    instance-of v0, p2, Ljava/util/concurrent/atomic/AtomicLong;

    if-eqz v0, :cond_36

    .line 379
    :cond_27
    const/16 v0, 0x12

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 380
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/bson/io/OutputBuffer;->writeLong(J)V

    goto :goto_1e

    .line 382
    :cond_36
    instance-of v0, p2, Ljava/lang/Float;

    if-nez v0, :cond_3e

    instance-of v0, p2, Ljava/lang/Double;

    if-eqz v0, :cond_4c

    .line 383
    :cond_3e
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 384
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/bson/io/OutputBuffer;->writeDouble(D)V

    goto :goto_1e

    .line 387
    :cond_4c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "can\'t serialize "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected putObject(Ljava/lang/String;Lorg/bson/BSONObject;)I
    .registers 16
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "o"    # Lorg/bson/BSONObject;

    .prologue
    const/4 v12, 0x3

    const/4 v11, 0x0

    .line 139
    if-nez p2, :cond_c

    .line 140
    new-instance v10, Ljava/lang/NullPointerException;

    const-string v11, "can\'t save a null object"

    invoke-direct {v10, v11}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 144
    :cond_c
    iget-object v10, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v10}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v6

    .line 146
    .local v6, "start":I
    const/4 v2, 0x3

    .line 147
    .local v2, "myType":B
    instance-of v10, p2, Ljava/util/List;

    if-eqz v10, :cond_18

    .line 148
    const/4 v2, 0x4

    .line 150
    :cond_18
    invoke-virtual {p0, p1, p2}, Lorg/bson/BasicBSONEncoder;->handleSpecialObjects(Ljava/lang/String;Lorg/bson/BSONObject;)Z

    move-result v10

    if-eqz v10, :cond_26

    .line 151
    iget-object v10, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v10}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v10

    sub-int/2addr v10, v6

    .line 206
    .end local p2    # "o":Lorg/bson/BSONObject;
    :goto_25
    return v10

    .line 153
    .restart local p2    # "o":Lorg/bson/BSONObject;
    :cond_26
    if-eqz p1, :cond_2b

    .line 154
    invoke-virtual {p0, v2, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 157
    :cond_2b
    iget-object v10, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v10}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v5

    .line 158
    .local v5, "sizePos":I
    iget-object v10, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v10, v11}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 160
    const/4 v8, 0x0

    .line 161
    .local v8, "transientFields":Ljava/util/List;
    if-ne v2, v12, :cond_a4

    if-nez p1, :cond_a4

    const/4 v3, 0x1

    .line 164
    .local v3, "rewriteID":Z
    :goto_3c
    if-ne v2, v12, :cond_60

    .line 165
    if-eqz v3, :cond_53

    const-string v10, "_id"

    invoke-interface {p2, v10}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_53

    .line 166
    const-string v10, "_id"

    const-string v12, "_id"

    invoke-interface {p2, v12}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {p0, v10, v12}, Lorg/bson/BasicBSONEncoder;->_putObjectField(Ljava/lang/String;Ljava/lang/Object;)V

    .line 169
    :cond_53
    const-string v10, "_transientFields"

    invoke-interface {p2, v10}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 170
    .local v7, "temp":Ljava/lang/Object;
    instance-of v10, v7, Ljava/util/List;

    if-eqz v10, :cond_60

    move-object v8, v7

    .line 171
    check-cast v8, Ljava/util/List;

    .line 176
    .end local v7    # "temp":Ljava/lang/Object;
    :cond_60
    instance-of v10, p2, Ljava/util/Map;

    if-eqz v10, :cond_a6

    .line 177
    check-cast p2, Ljava/util/Map;

    .end local p2    # "o":Lorg/bson/BSONObject;
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6e
    :goto_6e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_d4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 179
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v3, :cond_8a

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    const-string v12, "_id"

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6e

    .line 182
    :cond_8a
    if-eqz v8, :cond_96

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    invoke-interface {v8, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6e

    .line 185
    :cond_96
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {p0, v10, v12}, Lorg/bson/BasicBSONEncoder;->_putObjectField(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_6e

    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "rewriteID":Z
    .restart local p2    # "o":Lorg/bson/BSONObject;
    :cond_a4
    move v3, v11

    .line 161
    goto :goto_3c

    .line 189
    .restart local v3    # "rewriteID":Z
    :cond_a6
    invoke-interface {p2}, Lorg/bson/BSONObject;->keySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_ae
    :goto_ae
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_d4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 191
    .local v4, "s":Ljava/lang/String;
    if-eqz v3, :cond_c4

    const-string v10, "_id"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_ae

    .line 194
    :cond_c4
    if-eqz v8, :cond_cc

    invoke-interface {v8, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_ae

    .line 197
    :cond_cc
    invoke-interface {p2, v4}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 199
    .local v9, "val":Ljava/lang/Object;
    invoke-virtual {p0, v4, v9}, Lorg/bson/BasicBSONEncoder;->_putObjectField(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_ae

    .line 203
    .end local v4    # "s":Ljava/lang/String;
    .end local v9    # "val":Ljava/lang/Object;
    .end local p2    # "o":Lorg/bson/BSONObject;
    :cond_d4
    iget-object v10, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v10, v11}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 205
    iget-object v10, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    iget-object v11, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v11}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v11

    sub-int/2addr v11, v5

    invoke-virtual {v10, v5, v11}, Lorg/bson/io/OutputBuffer;->writeInt(II)V

    .line 206
    iget-object v10, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v10}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v10

    sub-int/2addr v10, v6

    goto/16 :goto_25
.end method

.method public putObject(Lorg/bson/BSONObject;)I
    .registers 3
    .param p1, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 131
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->putObject(Ljava/lang/String;Lorg/bson/BSONObject;)I

    move-result v0

    return v0
.end method

.method protected putObjectId(Ljava/lang/String;Lorg/bson/types/ObjectId;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "oid"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 437
    const/4 v0, 0x7

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 439
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Lorg/bson/types/ObjectId;->_time()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeIntBE(I)V

    .line 440
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Lorg/bson/types/ObjectId;->_machine()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeIntBE(I)V

    .line 441
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Lorg/bson/types/ObjectId;->_inc()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeIntBE(I)V

    .line 442
    return-void
.end method

.method protected putSpecial(Ljava/lang/String;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "o"    # Ljava/lang/Object;

    .prologue
    .line 122
    const/4 v0, 0x0

    return v0
.end method

.method protected putString(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 428
    const/4 v0, 0x2

    invoke-direct {p0, p1, p2, v0}, Lorg/bson/BasicBSONEncoder;->_putString(Ljava/lang/String;Ljava/lang/String;B)V

    .line 429
    return-void
.end method

.method protected putSymbol(Ljava/lang/String;Lorg/bson/types/Symbol;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "s"    # Lorg/bson/types/Symbol;

    .prologue
    .line 424
    invoke-virtual {p2}, Lorg/bson/types/Symbol;->getSymbol()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xe

    invoke-direct {p0, p1, v0, v1}, Lorg/bson/BasicBSONEncoder;->_putString(Ljava/lang/String;Ljava/lang/String;B)V

    .line 425
    return-void
.end method

.method protected putTimestamp(Ljava/lang/String;Lorg/bson/types/BSONTimestamp;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "ts"    # Lorg/bson/types/BSONTimestamp;

    .prologue
    .line 340
    const/16 v0, 0x11

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 341
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Lorg/bson/types/BSONTimestamp;->getInc()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 342
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Lorg/bson/types/BSONTimestamp;->getTime()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 343
    return-void
.end method

.method protected putUUID(Ljava/lang/String;Ljava/util/UUID;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/util/UUID;

    .prologue
    .line 416
    const/4 v0, 0x5

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 417
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 418
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 419
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/bson/io/OutputBuffer;->writeLong(J)V

    .line 420
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {p2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/bson/io/OutputBuffer;->writeLong(J)V

    .line 421
    return-void
.end method

.method protected putUndefined(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 336
    const/4 v0, 0x6

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONEncoder;->_put(BLjava/lang/String;)V

    .line 337
    return-void
.end method

.method public set(Lorg/bson/io/OutputBuffer;)V
    .registers 4
    .param p1, "out"    # Lorg/bson/io/OutputBuffer;

    .prologue
    .line 92
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    if-eqz v0, :cond_c

    .line 93
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "in the middle of something"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_c
    iput-object p1, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    .line 96
    return-void
.end method

.method public writeCString(Ljava/lang/String;)V
    .registers 3
    .param p1, "s"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 528
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/OutputBuffer;->writeCString(Ljava/lang/String;)I

    .line 529
    return-void
.end method

.method public writeInt(I)V
    .registers 3
    .param p1, "x"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 506
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 507
    return-void
.end method

.method public writeLong(J)V
    .registers 4
    .param p1, "x"    # J
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 517
    iget-object v0, p0, Lorg/bson/BasicBSONEncoder;->_buf:Lorg/bson/io/OutputBuffer;

    invoke-virtual {v0, p1, p2}, Lorg/bson/io/OutputBuffer;->writeLong(J)V

    .line 518
    return-void
.end method
