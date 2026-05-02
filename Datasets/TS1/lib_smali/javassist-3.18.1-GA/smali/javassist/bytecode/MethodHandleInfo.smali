.class Ljavassist/bytecode/MethodHandleInfo;
.super Ljavassist/bytecode/ConstInfo;
.source "ConstPool.java"


# static fields
.field static final tag:I = 0xf


# instance fields
.field refIndex:I

.field refKind:I


# direct methods
.method public constructor <init>(III)V
    .registers 4
    .param p1, "kind"    # I
    .param p2, "referenceIndex"    # I
    .param p3, "index"    # I

    .prologue
    .line 1833
    invoke-direct {p0, p3}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1834
    iput p1, p0, Ljavassist/bytecode/MethodHandleInfo;->refKind:I

    .line 1835
    iput p2, p0, Ljavassist/bytecode/MethodHandleInfo;->refIndex:I

    .line 1836
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
    .line 1839
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1840
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/MethodHandleInfo;->refKind:I

    .line 1841
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/MethodHandleInfo;->refIndex:I

    .line 1842
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I
    .registers 6
    .param p1, "src"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p3, "map"    # Ljava/util/Map;

    .prologue
    .line 1858
    iget v0, p0, Ljavassist/bytecode/MethodHandleInfo;->refKind:I

    iget v1, p0, Ljavassist/bytecode/MethodHandleInfo;->refIndex:I

    invoke-virtual {p1, v1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p3}, Ljavassist/bytecode/ConstInfo;->copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Ljavassist/bytecode/ConstPool;->addMethodHandleInfo(II)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 1847
    instance-of v2, p1, Ljavassist/bytecode/MethodHandleInfo;

    if-eqz v2, :cond_15

    move-object v0, p1

    .line 1848
    check-cast v0, Ljavassist/bytecode/MethodHandleInfo;

    .line 1849
    .local v0, "mh":Ljavassist/bytecode/MethodHandleInfo;
    iget v2, v0, Ljavassist/bytecode/MethodHandleInfo;->refKind:I

    iget v3, p0, Ljavassist/bytecode/MethodHandleInfo;->refKind:I

    if-ne v2, v3, :cond_15

    iget v2, v0, Ljavassist/bytecode/MethodHandleInfo;->refIndex:I

    iget v3, p0, Ljavassist/bytecode/MethodHandleInfo;->refIndex:I

    if-ne v2, v3, :cond_15

    const/4 v1, 0x1

    .line 1852
    .end local v0    # "mh":Ljavassist/bytecode/MethodHandleInfo;
    :cond_15
    return v1
.end method

.method public getTag()I
    .registers 2

    .prologue
    .line 1855
    const/16 v0, 0xf

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 1844
    iget v0, p0, Ljavassist/bytecode/MethodHandleInfo;->refKind:I

    shl-int/lit8 v0, v0, 0x10

    iget v1, p0, Ljavassist/bytecode/MethodHandleInfo;->refIndex:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1869
    const-string v0, "MethodHandle #"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1870
    iget v0, p0, Ljavassist/bytecode/MethodHandleInfo;->refKind:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1871
    const-string v0, ", index #"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1872
    iget v0, p0, Ljavassist/bytecode/MethodHandleInfo;->refIndex:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 1873
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
    .line 1863
    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1864
    iget v0, p0, Ljavassist/bytecode/MethodHandleInfo;->refKind:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1865
    iget v0, p0, Ljavassist/bytecode/MethodHandleInfo;->refIndex:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1866
    return-void
.end method
