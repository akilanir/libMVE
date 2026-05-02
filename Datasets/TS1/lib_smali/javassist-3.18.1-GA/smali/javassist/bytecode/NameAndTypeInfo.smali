.class Ljavassist/bytecode/NameAndTypeInfo;
.super Ljavassist/bytecode/ConstInfo;
.source "ConstPool.java"


# static fields
.field static final tag:I = 0xc


# instance fields
.field memberName:I

.field typeDescriptor:I


# direct methods
.method public constructor <init>(III)V
    .registers 4
    .param p1, "name"    # I
    .param p2, "type"    # I
    .param p3, "index"    # I

    .prologue
    .line 1416
    invoke-direct {p0, p3}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1417
    iput p1, p0, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    .line 1418
    iput p2, p0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    .line 1419
    return-void
.end method

.method public constructor <init>(Ljava/io/DataInputStream;I)V
    .registers 4
    .param p1, "in"    # Ljava/io/DataInputStream;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1422
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1423
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    .line 1424
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    .line 1425
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I
    .registers 8
    .param p1, "src"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p3, "map"    # Ljava/util/Map;

    .prologue
    .line 1467
    iget v2, p0, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    invoke-virtual {p1, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    .line 1468
    .local v0, "mname":Ljava/lang/String;
    iget v2, p0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    invoke-virtual {p1, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v1

    .line 1469
    .local v1, "tdesc":Ljava/lang/String;
    invoke-static {v1, p3}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    .line 1470
    invoke-virtual {p2, v0}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p2, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {p2, v2, v3}, Ljavassist/bytecode/ConstPool;->addNameAndTypeInfo(II)I

    move-result v2

    return v2
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 1430
    instance-of v2, p1, Ljavassist/bytecode/NameAndTypeInfo;

    if-eqz v2, :cond_15

    move-object v0, p1

    .line 1431
    check-cast v0, Ljavassist/bytecode/NameAndTypeInfo;

    .line 1432
    .local v0, "nti":Ljavassist/bytecode/NameAndTypeInfo;
    iget v2, v0, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    iget v3, p0, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    if-ne v2, v3, :cond_15

    iget v2, v0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    iget v3, p0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    if-ne v2, v3, :cond_15

    const/4 v1, 0x1

    .line 1435
    .end local v0    # "nti":Ljavassist/bytecode/NameAndTypeInfo;
    :cond_15
    return v1
.end method

.method public getTag()I
    .registers 2

    .prologue
    .line 1438
    const/16 v0, 0xc

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 1427
    iget v0, p0, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    shl-int/lit8 v0, v0, 0x10

    iget v1, p0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1481
    const-string v0, "NameAndType #"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1482
    iget v0, p0, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1483
    const-string v0, ", type #"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1484
    iget v0, p0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 1485
    return-void
.end method

.method public renameClass(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    .registers 8
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "oldName"    # Ljava/lang/String;
    .param p3, "newName"    # Ljava/lang/String;
    .param p4, "cache"    # Ljava/util/HashMap;

    .prologue
    .line 1441
    iget v2, p0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    invoke-virtual {p1, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    .line 1442
    .local v0, "type":Ljava/lang/String;
    invoke-static {v0, p2, p3}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1443
    .local v1, "type2":Ljava/lang/String;
    if-eq v0, v1, :cond_14

    .line 1444
    if-nez p4, :cond_15

    .line 1445
    invoke-virtual {p1, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    .line 1451
    :cond_14
    :goto_14
    return-void

    .line 1447
    :cond_15
    invoke-virtual {p4, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1448
    invoke-virtual {p1, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    .line 1449
    invoke-virtual {p4, p0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_14
.end method

.method public renameClass(Ljavassist/bytecode/ConstPool;Ljava/util/Map;Ljava/util/HashMap;)V
    .registers 7
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "map"    # Ljava/util/Map;
    .param p3, "cache"    # Ljava/util/HashMap;

    .prologue
    .line 1454
    iget v2, p0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    invoke-virtual {p1, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    .line 1455
    .local v0, "type":Ljava/lang/String;
    invoke-static {v0, p2}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    .line 1456
    .local v1, "type2":Ljava/lang/String;
    if-eq v0, v1, :cond_14

    .line 1457
    if-nez p3, :cond_15

    .line 1458
    invoke-virtual {p1, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    .line 1464
    :cond_14
    :goto_14
    return-void

    .line 1460
    :cond_15
    invoke-virtual {p3, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1461
    invoke-virtual {p1, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    .line 1462
    invoke-virtual {p3, p0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_14
.end method

.method public write(Ljava/io/DataOutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1475
    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1476
    iget v0, p0, Ljavassist/bytecode/NameAndTypeInfo;->memberName:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1477
    iget v0, p0, Ljavassist/bytecode/NameAndTypeInfo;->typeDescriptor:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1478
    return-void
.end method
