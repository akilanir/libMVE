.class Ljavassist/bytecode/StringInfo;
.super Ljavassist/bytecode/ConstInfo;
.source "ConstPool.java"


# static fields
.field static final tag:I = 0x8


# instance fields
.field string:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "str"    # I
    .param p2, "index"    # I

    .prologue
    .line 1605
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1606
    iput p1, p0, Ljavassist/bytecode/StringInfo;->string:I

    .line 1607
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
    .line 1610
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1611
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/StringInfo;->string:I

    .line 1612
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I
    .registers 5
    .param p1, "src"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p3, "map"    # Ljava/util/Map;

    .prologue
    .line 1623
    iget v0, p0, Ljavassist/bytecode/StringInfo;->string:I

    invoke-virtual {p1, v0}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljavassist/bytecode/ConstPool;->addStringInfo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1617
    instance-of v0, p1, Ljavassist/bytecode/StringInfo;

    if-eqz v0, :cond_e

    check-cast p1, Ljavassist/bytecode/StringInfo;

    .end local p1    # "obj":Ljava/lang/Object;
    iget v0, p1, Ljavassist/bytecode/StringInfo;->string:I

    iget v1, p0, Ljavassist/bytecode/StringInfo;->string:I

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
    .line 1620
    const/16 v0, 0x8

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 1614
    iget v0, p0, Ljavassist/bytecode/StringInfo;->string:I

    return v0
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1632
    const-string v0, "String #"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1633
    iget v0, p0, Ljavassist/bytecode/StringInfo;->string:I

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 1634
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
    .line 1627
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1628
    iget v0, p0, Ljavassist/bytecode/StringInfo;->string:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 1629
    return-void
.end method
