.class Ljavassist/bytecode/InvokeDynamicInfo;
.super Ljavassist/bytecode/ConstInfo;
.source "ConstPool.java"


# static fields
.field static final tag:I = 0x12


# instance fields
.field bootstrap:I

.field nameAndType:I


# direct methods
.method public constructor <init>(III)V
    .registers 4
    .param p1, "bootstrapMethod"    # I
    .param p2, "ntIndex"    # I
    .param p3, "index"    # I

    .prologue
    .line 1949
    invoke-direct {p0, p3}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1950
    iput p1, p0, Ljavassist/bytecode/InvokeDynamicInfo;->bootstrap:I

    .line 1951
    iput p2, p0, Ljavassist/bytecode/InvokeDynamicInfo;->nameAndType:I

    .line 1952
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
    .line 1955
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1956
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/InvokeDynamicInfo;->bootstrap:I

    .line 1957
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/InvokeDynamicInfo;->nameAndType:I

    .line 1958
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I
    .registers 6
    .param p1, "src"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p3, "map"    # Ljava/util/Map;

    .prologue
    .line 1974
    iget v0, p0, Ljavassist/bytecode/InvokeDynamicInfo;->bootstrap:I

    iget v1, p0, Ljavassist/bytecode/InvokeDynamicInfo;->nameAndType:I

    invoke-virtual {p1, v1}, Ljavassist/bytecode/ConstPool;->getItem(I)Ljavassist/bytecode/ConstInfo;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p3}, Ljavassist/bytecode/ConstInfo;->copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Ljavassist/bytecode/ConstPool;->addInvokeDynamicInfo(II)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 1963
    instance-of v2, p1, Ljavassist/bytecode/InvokeDynamicInfo;

    if-eqz v2, :cond_15

    move-object v0, p1

    .line 1964
    check-cast v0, Ljavassist/bytecode/InvokeDynamicInfo;

    .line 1965
    .local v0, "iv":Ljavassist/bytecode/InvokeDynamicInfo;
    iget v2, v0, Ljavassist/bytecode/InvokeDynamicInfo;->bootstrap:I

    iget v3, p0, Ljavassist/bytecode/InvokeDynamicInfo;->bootstrap:I

    if-ne v2, v3, :cond_15

    iget v2, v0, Ljavassist/bytecode/InvokeDynamicInfo;->nameAndType:I

    iget v3, p0, Ljavassist/bytecode/InvokeDynamicInfo;->nameAndType:I

    if-ne v2, v3, :cond_15

    const/4 v1, 0x1

    .line 1968
    .end local v0    # "iv":Ljavassist/bytecode/InvokeDynamicInfo;
    :cond_15
    return v1
.end method

.method public getTag()I
    .registers 2

    .prologue
    .line 1971
    const/16 v0, 0x12

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 1960
    iget v0, p0, Ljavassist/bytecode/InvokeDynamicInfo;->bootstrap:I

    shl-int/lit8 v0, v0, 0x10

    iget v1, p0, Ljavassist/bytecode/InvokeDynamicInfo;->nameAndType:I

    xor-int/2addr v0, v1

    return v0
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1985
    const-string v0, "InvokeDynamic #"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1986
    iget v0, p0, Ljavassist/bytecode/InvokeDynamicInfo;->bootstrap:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 1987
    const-string v0, ", name&type #"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1988
    iget v0, p0, Ljavassist/bytecode/InvokeDynamicInfo;->nameAndType:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 1989
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
    .line 1979
    const/16 v0, 0x12

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1980
    iget v0, p0, Ljavassist/bytecode/InvokeDynamicInfo;->bootstrap:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1981
    iget v0, p0, Ljavassist/bytecode/InvokeDynamicInfo;->nameAndType:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1982
    return-void
.end method
