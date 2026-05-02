.class Ljavassist/bytecode/DoubleInfo;
.super Ljavassist/bytecode/ConstInfo;
.source "ConstPool.java"


# static fields
.field static final tag:I = 0x6


# instance fields
.field value:D


# direct methods
.method public constructor <init>(DI)V
    .registers 4
    .param p1, "d"    # D
    .param p3, "index"    # I

    .prologue
    .line 1753
    invoke-direct {p0, p3}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1754
    iput-wide p1, p0, Ljavassist/bytecode/DoubleInfo;->value:D

    .line 1755
    return-void
.end method

.method public constructor <init>(Ljava/io/DataInputStream;I)V
    .registers 5
    .param p1, "in"    # Ljava/io/DataInputStream;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1758
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1759
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readDouble()D

    move-result-wide v0

    iput-wide v0, p0, Ljavassist/bytecode/DoubleInfo;->value:D

    .line 1760
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I
    .registers 6
    .param p1, "src"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p3, "map"    # Ljava/util/Map;

    .prologue
    .line 1774
    iget-wide v0, p0, Ljavassist/bytecode/DoubleInfo;->value:D

    invoke-virtual {p2, v0, v1}, Ljavassist/bytecode/ConstPool;->addDoubleInfo(D)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1768
    instance-of v0, p1, Ljavassist/bytecode/DoubleInfo;

    if-eqz v0, :cond_10

    check-cast p1, Ljavassist/bytecode/DoubleInfo;

    .end local p1    # "obj":Ljava/lang/Object;
    iget-wide v0, p1, Ljavassist/bytecode/DoubleInfo;->value:D

    iget-wide v2, p0, Ljavassist/bytecode/DoubleInfo;->value:D

    cmpl-double v0, v0, v2

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
    .line 1771
    const/4 v0, 0x6

    return v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 1763
    iget-wide v2, p0, Ljavassist/bytecode/DoubleInfo;->value:D

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 1764
    .local v0, "v":J
    const/16 v2, 0x20

    ushr-long v2, v0, v2

    xor-long/2addr v2, v0

    long-to-int v2, v2

    return v2
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 4
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1783
    const-string v0, "Double "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1784
    iget-wide v0, p0, Ljavassist/bytecode/DoubleInfo;->value:D

    invoke-virtual {p1, v0, v1}, Ljava/io/PrintWriter;->println(D)V

    .line 1785
    return-void
.end method

.method public write(Ljava/io/DataOutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1778
    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1779
    iget-wide v0, p0, Ljavassist/bytecode/DoubleInfo;->value:D

    invoke-virtual {p1, v0, v1}, Ljava/io/DataOutputStream;->writeDouble(D)V

    .line 1780
    return-void
.end method
