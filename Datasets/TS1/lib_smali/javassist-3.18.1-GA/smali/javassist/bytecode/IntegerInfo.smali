.class Ljavassist/bytecode/IntegerInfo;
.super Ljavassist/bytecode/ConstInfo;
.source "ConstPool.java"


# static fields
.field static final tag:I = 0x3


# instance fields
.field value:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "v"    # I
    .param p2, "index"    # I

    .prologue
    .line 1642
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1643
    iput p1, p0, Ljavassist/bytecode/IntegerInfo;->value:I

    .line 1644
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
    .line 1647
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1648
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/IntegerInfo;->value:I

    .line 1649
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I
    .registers 5
    .param p1, "src"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p3, "map"    # Ljava/util/Map;

    .prologue
    .line 1660
    iget v0, p0, Ljavassist/bytecode/IntegerInfo;->value:I

    invoke-virtual {p2, v0}, Ljavassist/bytecode/ConstPool;->addIntegerInfo(I)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1654
    instance-of v0, p1, Ljavassist/bytecode/IntegerInfo;

    if-eqz v0, :cond_e

    check-cast p1, Ljavassist/bytecode/IntegerInfo;

    .end local p1    # "obj":Ljava/lang/Object;
    iget v0, p1, Ljavassist/bytecode/IntegerInfo;->value:I

    iget v1, p0, Ljavassist/bytecode/IntegerInfo;->value:I

    if-ne v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public getTag()I
    .registers 2

    .prologue
    .line 1657
    const/4 v0, 0x3

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 1651
    iget v0, p0, Ljavassist/bytecode/IntegerInfo;->value:I

    return v0
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1669
    const-string v0, "Integer "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1670
    iget v0, p0, Ljavassist/bytecode/IntegerInfo;->value:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 1671
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
    .line 1664
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1665
    iget v0, p0, Ljavassist/bytecode/IntegerInfo;->value:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 1666
    return-void
.end method
