.class Ljavassist/bytecode/LongInfo;
.super Ljavassist/bytecode/ConstInfo;
.source "ConstPool.java"


# static fields
.field static final tag:I = 0x5


# instance fields
.field value:J


# direct methods
.method public constructor <init>(JI)V
    .registers 4
    .param p1, "l"    # J
    .param p3, "index"    # I

    .prologue
    .line 1716
    invoke-direct {p0, p3}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1717
    iput-wide p1, p0, Ljavassist/bytecode/LongInfo;->value:J

    .line 1718
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
    .line 1721
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1722
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Ljavassist/bytecode/LongInfo;->value:J

    .line 1723
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I
    .registers 6
    .param p1, "src"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p3, "map"    # Ljava/util/Map;

    .prologue
    .line 1734
    iget-wide v0, p0, Ljavassist/bytecode/LongInfo;->value:J

    invoke-virtual {p2, v0, v1}, Ljavassist/bytecode/ConstPool;->addLongInfo(J)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1728
    instance-of v0, p1, Ljavassist/bytecode/LongInfo;

    if-eqz v0, :cond_10

    check-cast p1, Ljavassist/bytecode/LongInfo;

    .end local p1    # "obj":Ljava/lang/Object;
    iget-wide v0, p1, Ljavassist/bytecode/LongInfo;->value:J

    iget-wide v2, p0, Ljavassist/bytecode/LongInfo;->value:J

    cmp-long v0, v0, v2

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
    .line 1731
    const/4 v0, 0x5

    return v0
.end method

.method public hashCode()I
    .registers 6

    .prologue
    .line 1725
    iget-wide v0, p0, Ljavassist/bytecode/LongInfo;->value:J

    iget-wide v2, p0, Ljavassist/bytecode/LongInfo;->value:J

    const/16 v4, 0x20

    ushr-long/2addr v2, v4

    xor-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 4
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1743
    const-string v0, "Long "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1744
    iget-wide v0, p0, Ljavassist/bytecode/LongInfo;->value:J

    invoke-virtual {p1, v0, v1}, Ljava/io/PrintWriter;->println(J)V

    .line 1745
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
    .line 1738
    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1739
    iget-wide v0, p0, Ljavassist/bytecode/LongInfo;->value:J

    invoke-virtual {p1, v0, v1}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 1740
    return-void
.end method
