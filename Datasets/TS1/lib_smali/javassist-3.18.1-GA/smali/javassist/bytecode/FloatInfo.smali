.class Ljavassist/bytecode/FloatInfo;
.super Ljavassist/bytecode/ConstInfo;
.source "ConstPool.java"


# static fields
.field static final tag:I = 0x4


# instance fields
.field value:F


# direct methods
.method public constructor <init>(FI)V
    .registers 3
    .param p1, "f"    # F
    .param p2, "index"    # I

    .prologue
    .line 1679
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1680
    iput p1, p0, Ljavassist/bytecode/FloatInfo;->value:F

    .line 1681
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
    .line 1684
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1685
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readFloat()F

    move-result v0

    iput v0, p0, Ljavassist/bytecode/FloatInfo;->value:F

    .line 1686
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I
    .registers 5
    .param p1, "src"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p3, "map"    # Ljava/util/Map;

    .prologue
    .line 1697
    iget v0, p0, Ljavassist/bytecode/FloatInfo;->value:F

    invoke-virtual {p2, v0}, Ljavassist/bytecode/ConstPool;->addFloatInfo(F)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1691
    instance-of v0, p1, Ljavassist/bytecode/FloatInfo;

    if-eqz v0, :cond_10

    check-cast p1, Ljavassist/bytecode/FloatInfo;

    .end local p1    # "obj":Ljava/lang/Object;
    iget v0, p1, Ljavassist/bytecode/FloatInfo;->value:F

    iget v1, p0, Ljavassist/bytecode/FloatInfo;->value:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public getTag()I
    .registers 2

    .prologue
    .line 1694
    const/4 v0, 0x4

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 1688
    iget v0, p0, Ljavassist/bytecode/FloatInfo;->value:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    return v0
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1706
    const-string v0, "Float "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1707
    iget v0, p0, Ljavassist/bytecode/FloatInfo;->value:F

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(F)V

    .line 1708
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
    .line 1701
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1702
    iget v0, p0, Ljavassist/bytecode/FloatInfo;->value:F

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeFloat(F)V

    .line 1703
    return-void
.end method
