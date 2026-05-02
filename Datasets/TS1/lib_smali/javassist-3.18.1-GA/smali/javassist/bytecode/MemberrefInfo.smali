.class abstract Ljavassist/bytecode/MemberrefInfo;
.super Ljavassist/bytecode/ConstInfo;
.source "ConstPool.java"


# instance fields
.field classIndex:I

.field nameAndTypeIndex:I


# direct methods
.method public constructor <init>(III)V
    .registers 4
    .param p1, "cindex"    # I
    .param p2, "ntindex"    # I
    .param p3, "thisIndex"    # I

    .prologue
    .line 1493
    invoke-direct {p0, p3}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1494
    iput p1, p0, Ljavassist/bytecode/MemberrefInfo;->classIndex:I

    .line 1495
    iput p2, p0, Ljavassist/bytecode/MemberrefInfo;->nameAndTypeIndex:I

    .line 1496
    return-void
.end method

.method public constructor <init>(Ljava/io/DataInputStream;I)V
    .registers 4
    .param p1, "in"    # Ljava/io/DataInputStream;
    .param p2, "thisIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1499
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1500
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/MemberrefInfo;->classIndex:I

    .line 1501
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/MemberrefInfo;->nameAndTypeIndex:I

    .line 1502
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I
    .registers 7
    .param p1, "src"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p3, "map"    # Ljava/util/Map;

    .prologue
    .line 1517
    iget v2, p0, Ljavassist/bytecode/MemberrefInfo;->classIndex:I

    invoke-virtual {p1, v2}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v2

    invoke-virtual {v2, p1, p2, p3}, Ljavassist/bytecode/ConstInfo;->copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v0

    .line 1518
    .local v0, "classIndex2":I
    iget v2, p0, Ljavassist/bytecode/MemberrefInfo;->nameAndTypeIndex:I

    invoke-virtual {p1, v2}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v2

    invoke-virtual {v2, p1, p2, p3}, Ljavassist/bytecode/ConstInfo;->copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v1

    .line 1519
    .local v1, "ntIndex2":I
    invoke-virtual {p0, p2, v0, v1}, Ljavassist/bytecode/MemberrefInfo;->copy2(Ljavassist/bytecode/ConstPool;II)I

    move-result v2

    return v2
.end method

.method protected abstract copy2(Ljavassist/bytecode/ConstPool;II)I
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 1507
    instance-of v2, p1, Ljavassist/bytecode/MemberrefInfo;

    if-eqz v2, :cond_1f

    move-object v0, p1

    .line 1508
    check-cast v0, Ljavassist/bytecode/MemberrefInfo;

    .line 1509
    .local v0, "mri":Ljavassist/bytecode/MemberrefInfo;
    iget v2, v0, Ljavassist/bytecode/MemberrefInfo;->classIndex:I

    iget v3, p0, Ljavassist/bytecode/MemberrefInfo;->classIndex:I

    if-ne v2, v3, :cond_1f

    iget v2, v0, Ljavassist/bytecode/MemberrefInfo;->nameAndTypeIndex:I

    iget v3, p0, Ljavassist/bytecode/MemberrefInfo;->nameAndTypeIndex:I

    if-ne v2, v3, :cond_1f

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_1f

    const/4 v1, 0x1

    .line 1513
    .end local v0    # "mri":Ljavassist/bytecode/MemberrefInfo;
    :cond_1f
    return v1
.end method

.method public abstract getTagName()Ljava/lang/String;
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 1504
    iget v0, p0, Ljavassist/bytecode/MemberrefInfo;->classIndex:I

    shl-int/lit8 v0, v0, 0x10

    iget v1, p0, Ljavassist/bytecode/MemberrefInfo;->nameAndTypeIndex:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 4
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1531
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljavassist/bytecode/MemberrefInfo;->getTagName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " #"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1532
    iget v0, p0, Ljavassist/bytecode/MemberrefInfo;->classIndex:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1533
    const-string v0, ", name&type #"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1534
    iget v0, p0, Ljavassist/bytecode/MemberrefInfo;->nameAndTypeIndex:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 1535
    return-void
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
    .line 1525
    invoke-virtual {p0}, Ljavassist/bytecode/MemberrefInfo;->getTag()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1526
    iget v0, p0, Ljavassist/bytecode/MemberrefInfo;->classIndex:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1527
    iget v0, p0, Ljavassist/bytecode/MemberrefInfo;->nameAndTypeIndex:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1528
    return-void
.end method
