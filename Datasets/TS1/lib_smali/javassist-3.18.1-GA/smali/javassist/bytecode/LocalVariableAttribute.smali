.class public Ljavassist/bytecode/LocalVariableAttribute;
.super Ljavassist/bytecode/AttributeInfo;
.source "LocalVariableAttribute.java"


# static fields
.field public static final tag:Ljava/lang/String; = "LocalVariableTable"

.field public static final typeTag:Ljava/lang/String; = "LocalVariableTypeTable"


# direct methods
.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    const/4 v2, 0x0

    .line 41
    const-string v0, "LocalVariableTable"

    const/4 v1, 0x2

    new-array v1, v1, [B

    invoke-direct {p0, p1, v0, v1}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    .line 42
    iget-object v0, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    invoke-static {v2, v0, v2}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 43
    return-void
.end method

.method constructor <init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "n"    # I
    .param p3, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 57
    const/4 v0, 0x2

    new-array v0, v0, [B

    invoke-direct {p0, p1, p2, v0}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    .line 58
    iget-object v0, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    invoke-static {v1, v0, v1}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 59
    return-void
.end method

.method constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "i"    # [B

    .prologue
    .line 68
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    .line 69
    return-void
.end method


# virtual methods
.method public addEntry(IIIII)V
    .registers 11
    .param p1, "startPc"    # I
    .param p2, "length"    # I
    .param p3, "nameIndex"    # I
    .param p4, "descriptorIndex"    # I
    .param p5, "index"    # I

    .prologue
    .line 82
    iget-object v3, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    array-length v2, v3

    .line 83
    .local v2, "size":I
    add-int/lit8 v3, v2, 0xa

    new-array v1, v3, [B

    .line 84
    .local v1, "newInfo":[B
    invoke-virtual {p0}, Ljavassist/bytecode/LocalVariableAttribute;->tableLength()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    const/4 v4, 0x0

    invoke-static {v3, v1, v4}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 85
    const/4 v0, 0x2

    .local v0, "i":I
    :goto_12
    if-ge v0, v2, :cond_1d

    .line 86
    iget-object v3, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    aget-byte v3, v3, v0

    aput-byte v3, v1, v0

    .line 85
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 88
    :cond_1d
    invoke-static {p1, v1, v2}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 89
    add-int/lit8 v3, v2, 0x2

    invoke-static {p2, v1, v3}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 90
    add-int/lit8 v3, v2, 0x4

    invoke-static {p3, v1, v3}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 91
    add-int/lit8 v3, v2, 0x6

    invoke-static {p4, v1, v3}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 92
    add-int/lit8 v3, v2, 0x8

    invoke-static {p5, v1, v3}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 93
    iput-object v1, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    .line 94
    return-void
.end method

.method public codeLength(I)I
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 175
    iget-object v0, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    mul-int/lit8 v1, p1, 0xa

    add-int/lit8 v1, v1, 0x4

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;
    .registers 18
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    .line 295
    invoke-virtual {p0}, Ljavassist/bytecode/LocalVariableAttribute;->get()[B

    move-result-object v11

    .line 296
    .local v11, "src":[B
    array-length v14, v11

    new-array v3, v14, [B

    .line 297
    .local v3, "dest":[B
    invoke-virtual {p0}, Ljavassist/bytecode/LocalVariableAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v2

    .line 298
    .local v2, "cp":Ljavassist/bytecode/ConstPool;
    move-object/from16 v0, p1

    invoke-virtual {p0, v0, v3}, Ljavassist/bytecode/LocalVariableAttribute;->makeThisAttr(Ljavassist/bytecode/ConstPool;[B)Ljavassist/bytecode/LocalVariableAttribute;

    move-result-object v1

    .line 299
    .local v1, "attr":Ljavassist/bytecode/LocalVariableAttribute;
    const/4 v14, 0x0

    invoke-static {v11, v14}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v8

    .line 300
    .local v8, "n":I
    const/4 v14, 0x0

    invoke-static {v8, v3, v14}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 301
    const/4 v6, 0x2

    .line 302
    .local v6, "j":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1c
    if-ge v4, v8, :cond_71

    .line 303
    invoke-static {v11, v6}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v12

    .line 304
    .local v12, "start":I
    add-int/lit8 v14, v6, 0x2

    invoke-static {v11, v14}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v7

    .line 305
    .local v7, "len":I
    add-int/lit8 v14, v6, 0x4

    invoke-static {v11, v14}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v9

    .line 306
    .local v9, "name":I
    add-int/lit8 v14, v6, 0x6

    invoke-static {v11, v14}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v13

    .line 307
    .local v13, "type":I
    add-int/lit8 v14, v6, 0x8

    invoke-static {v11, v14}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v5

    .line 309
    .local v5, "index":I
    invoke-static {v12, v3, v6}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 310
    add-int/lit8 v14, v6, 0x2

    invoke-static {v7, v3, v14}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 311
    if-eqz v9, :cond_4b

    .line 312
    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v2, v9, v0, v14}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v9

    .line 314
    :cond_4b
    add-int/lit8 v14, v6, 0x4

    invoke-static {v9, v3, v14}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 316
    if-eqz v13, :cond_62

    .line 317
    invoke-virtual {v2, v13}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v10

    .line 318
    .local v10, "sig":Ljava/lang/String;
    move-object/from16 v0, p2

    invoke-static {v10, v0}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v10

    .line 319
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v13

    .line 322
    .end local v10    # "sig":Ljava/lang/String;
    :cond_62
    add-int/lit8 v14, v6, 0x6

    invoke-static {v13, v3, v14}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 323
    add-int/lit8 v14, v6, 0x8

    invoke-static {v5, v3, v14}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 324
    add-int/lit8 v6, v6, 0xa

    .line 302
    add-int/lit8 v4, v4, 0x1

    goto :goto_1c

    .line 327
    .end local v5    # "index":I
    .end local v7    # "len":I
    .end local v9    # "name":I
    .end local v12    # "start":I
    .end local v13    # "type":I
    :cond_71
    return-object v1
.end method

.method public descriptor(I)Ljava/lang/String;
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 258
    invoke-virtual {p0}, Ljavassist/bytecode/LocalVariableAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    invoke-virtual {p0, p1}, Ljavassist/bytecode/LocalVariableAttribute;->descriptorIndex(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public descriptorIndex(I)I
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 230
    iget-object v0, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    mul-int/lit8 v1, p1, 0xa

    add-int/lit8 v1, v1, 0x8

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method public index(I)I
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 285
    iget-object v0, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    mul-int/lit8 v1, p1, 0xa

    add-int/lit8 v1, v1, 0xa

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method makeThisAttr(Ljavassist/bytecode/ConstPool;[B)Ljavassist/bytecode/LocalVariableAttribute;
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # [B

    .prologue
    .line 332
    new-instance v0, Ljavassist/bytecode/LocalVariableAttribute;

    const-string v1, "LocalVariableTable"

    invoke-direct {v0, p1, v1, p2}, Ljavassist/bytecode/LocalVariableAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    return-object v0
.end method

.method public nameIndex(I)I
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 204
    iget-object v0, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    mul-int/lit8 v1, p1, 0xa

    add-int/lit8 v1, v1, 0x6

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method renameClass(Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "oldname"    # Ljava/lang/String;
    .param p2, "newname"    # Ljava/lang/String;

    .prologue
    .line 97
    invoke-virtual {p0}, Ljavassist/bytecode/LocalVariableAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 98
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-virtual {p0}, Ljavassist/bytecode/LocalVariableAttribute;->tableLength()I

    move-result v4

    .line 99
    .local v4, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_9
    if-ge v2, v4, :cond_2f

    .line 100
    mul-int/lit8 v6, v2, 0xa

    add-int/lit8 v5, v6, 0x2

    .line 101
    .local v5, "pos":I
    iget-object v6, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    add-int/lit8 v7, v5, 0x6

    invoke-static {v6, v7}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v3

    .line 102
    .local v3, "index":I
    if-eqz v3, :cond_2c

    .line 103
    invoke-virtual {v0, v3}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v1

    .line 104
    .local v1, "desc":Ljava/lang/String;
    invoke-virtual {p0, v1, p1, p2}, Ljavassist/bytecode/LocalVariableAttribute;->renameEntry(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 105
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v6

    iget-object v7, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    add-int/lit8 v8, v5, 0x6

    invoke-static {v6, v7, v8}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 99
    .end local v1    # "desc":Ljava/lang/String;
    :cond_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 108
    .end local v3    # "index":I
    .end local v5    # "pos":I
    :cond_2f
    return-void
.end method

.method renameClass(Ljava/util/Map;)V
    .registers 11
    .param p1, "classnames"    # Ljava/util/Map;

    .prologue
    .line 115
    invoke-virtual {p0}, Ljavassist/bytecode/LocalVariableAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 116
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-virtual {p0}, Ljavassist/bytecode/LocalVariableAttribute;->tableLength()I

    move-result v4

    .line 117
    .local v4, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_9
    if-ge v2, v4, :cond_2f

    .line 118
    mul-int/lit8 v6, v2, 0xa

    add-int/lit8 v5, v6, 0x2

    .line 119
    .local v5, "pos":I
    iget-object v6, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    add-int/lit8 v7, v5, 0x6

    invoke-static {v6, v7}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v3

    .line 120
    .local v3, "index":I
    if-eqz v3, :cond_2c

    .line 121
    invoke-virtual {v0, v3}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v1

    .line 122
    .local v1, "desc":Ljava/lang/String;
    invoke-virtual {p0, v1, p1}, Ljavassist/bytecode/LocalVariableAttribute;->renameEntry(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v6

    iget-object v7, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    add-int/lit8 v8, v5, 0x6

    invoke-static {v6, v7, v8}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 117
    .end local v1    # "desc":Ljava/lang/String;
    :cond_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 126
    .end local v3    # "index":I
    .end local v5    # "pos":I
    :cond_2f
    return-void
.end method

.method renameEntry(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "desc"    # Ljava/lang/String;
    .param p2, "oldname"    # Ljava/lang/String;
    .param p3, "newname"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-static {p1, p2, p3}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method renameEntry(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .registers 4
    .param p1, "desc"    # Ljava/lang/String;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    .line 129
    invoke-static {p1, p2}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public shiftIndex(II)V
    .registers 9
    .param p1, "lessThan"    # I
    .param p2, "delta"    # I

    .prologue
    .line 140
    iget-object v3, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    array-length v2, v3

    .line 141
    .local v2, "size":I
    const/4 v0, 0x2

    .local v0, "i":I
    :goto_4
    if-ge v0, v2, :cond_1c

    .line 142
    iget-object v3, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    add-int/lit8 v4, v0, 0x8

    invoke-static {v3, v4}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v1

    .line 143
    .local v1, "org":I
    if-lt v1, p1, :cond_19

    .line 144
    add-int v3, v1, p2

    iget-object v4, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    add-int/lit8 v5, v0, 0x8

    invoke-static {v3, v4, v5}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 141
    :cond_19
    add-int/lit8 v0, v0, 0xa

    goto :goto_4

    .line 146
    .end local v1    # "org":I
    :cond_1c
    return-void
.end method

.method shiftPc(IIZ)V
    .registers 12
    .param p1, "where"    # I
    .param p2, "gapLength"    # I
    .param p3, "exclusive"    # Z

    .prologue
    .line 182
    invoke-virtual {p0}, Ljavassist/bytecode/LocalVariableAttribute;->tableLength()I

    move-result v2

    .line 183
    .local v2, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v2, :cond_3f

    .line 184
    mul-int/lit8 v5, v0, 0xa

    add-int/lit8 v4, v5, 0x2

    .line 185
    .local v4, "pos":I
    iget-object v5, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    invoke-static {v5, v4}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v3

    .line 186
    .local v3, "pc":I
    iget-object v5, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    add-int/lit8 v6, v4, 0x2

    invoke-static {v5, v6}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v1

    .line 190
    .local v1, "len":I
    if-gt v3, p1, :cond_21

    if-eqz p3, :cond_2b

    if-ne v3, p1, :cond_2b

    if-eqz v3, :cond_2b

    .line 191
    :cond_21
    add-int v5, v3, p2

    iget-object v6, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    invoke-static {v5, v6, v4}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 183
    :cond_28
    :goto_28
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 192
    :cond_2b
    add-int v5, v3, v1

    if-gt v5, p1, :cond_35

    if-eqz p3, :cond_28

    add-int v5, v3, v1

    if-ne v5, p1, :cond_28

    .line 193
    :cond_35
    add-int v5, v1, p2

    iget-object v6, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    add-int/lit8 v7, v4, 0x2

    invoke-static {v5, v6, v7}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    goto :goto_28

    .line 195
    .end local v1    # "len":I
    .end local v3    # "pc":I
    .end local v4    # "pos":I
    :cond_3f
    return-void
.end method

.method public signature(I)Ljava/lang/String;
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 275
    invoke-virtual {p0, p1}, Ljavassist/bytecode/LocalVariableAttribute;->descriptor(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public signatureIndex(I)I
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 244
    invoke-virtual {p0, p1}, Ljavassist/bytecode/LocalVariableAttribute;->descriptorIndex(I)I

    move-result v0

    return v0
.end method

.method public startPc(I)I
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 164
    iget-object v0, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    mul-int/lit8 v1, p1, 0xa

    add-int/lit8 v1, v1, 0x2

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method public tableLength()I
    .registers 3

    .prologue
    .line 153
    iget-object v0, p0, Ljavassist/bytecode/LocalVariableAttribute;->info:[B

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method public variableName(I)Ljava/lang/String;
    .registers 4
    .param p1, "i"    # I

    .prologue
    .line 214
    invoke-virtual {p0}, Ljavassist/bytecode/LocalVariableAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    invoke-virtual {p0, p1}, Ljavassist/bytecode/LocalVariableAttribute;->nameIndex(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
