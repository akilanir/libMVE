.class Ljavassist/bytecode/MethodTypeInfo;
.super Ljavassist/bytecode/ConstInfo;
.source "ConstPool.java"


# static fields
.field static final tag:I = 0x10


# instance fields
.field descriptor:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "desc"    # I
    .param p2, "index"    # I

    .prologue
    .line 1881
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1882
    iput p1, p0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    .line 1883
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
    .line 1886
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1887
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    .line 1888
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I
    .registers 6
    .param p1, "src"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p3, "map"    # Ljava/util/Map;

    .prologue
    .line 1928
    iget v1, p0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    invoke-virtual {p1, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    .line 1929
    .local v0, "desc":Ljava/lang/String;
    invoke-static {v0, p3}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 1930
    invoke-virtual {p2, v0}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p2, v1}, Ljavassist/bytecode/ConstPool;->addMethodTypeInfo(I)I

    move-result v1

    return v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 1893
    instance-of v1, p1, Ljavassist/bytecode/MethodTypeInfo;

    if-eqz v1, :cond_e

    .line 1894
    check-cast p1, Ljavassist/bytecode/MethodTypeInfo;

    .end local p1    # "obj":Ljava/lang/Object;
    iget v1, p1, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    iget v2, p0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    if-ne v1, v2, :cond_e

    const/4 v0, 0x1

    .line 1896
    :cond_e
    return v0
.end method

.method public getTag()I
    .registers 2

    .prologue
    .line 1899
    const/16 v0, 0x10

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 1890
    iget v0, p0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    return v0
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1939
    const-string v0, "MethodType #"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1940
    iget v0, p0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 1941
    return-void
.end method

.method public renameClass(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    .registers 8
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "oldName"    # Ljava/lang/String;
    .param p3, "newName"    # Ljava/lang/String;
    .param p4, "cache"    # Ljava/util/HashMap;

    .prologue
    .line 1902
    iget v2, p0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    invoke-virtual {p1, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    .line 1903
    .local v0, "desc":Ljava/lang/String;
    invoke-static {v0, p2, p3}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1904
    .local v1, "desc2":Ljava/lang/String;
    if-eq v0, v1, :cond_14

    .line 1905
    if-nez p4, :cond_15

    .line 1906
    invoke-virtual {p1, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    .line 1912
    :cond_14
    :goto_14
    return-void

    .line 1908
    :cond_15
    invoke-virtual {p4, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1909
    invoke-virtual {p1, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    .line 1910
    invoke-virtual {p4, p0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_14
.end method

.method public renameClass(Ljavassist/bytecode/ConstPool;Ljava/util/Map;Ljava/util/HashMap;)V
    .registers 7
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "map"    # Ljava/util/Map;
    .param p3, "cache"    # Ljava/util/HashMap;

    .prologue
    .line 1915
    iget v2, p0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    invoke-virtual {p1, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    .line 1916
    .local v0, "desc":Ljava/lang/String;
    invoke-static {v0, p2}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    .line 1917
    .local v1, "desc2":Ljava/lang/String;
    if-eq v0, v1, :cond_14

    .line 1918
    if-nez p3, :cond_15

    .line 1919
    invoke-virtual {p1, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    .line 1925
    :cond_14
    :goto_14
    return-void

    .line 1921
    :cond_15
    invoke-virtual {p3, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1922
    invoke-virtual {p1, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    .line 1923
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
    .line 1934
    const/16 v0, 0x10

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1935
    iget v0, p0, Ljavassist/bytecode/MethodTypeInfo;->descriptor:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1936
    return-void
.end method
