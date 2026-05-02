.class Ljavassist/bytecode/Utf8Info;
.super Ljavassist/bytecode/ConstInfo;
.source "ConstPool.java"


# static fields
.field static final tag:I = 0x1


# instance fields
.field string:Ljava/lang/String;


# direct methods
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
    .line 1798
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1799
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/bytecode/Utf8Info;->string:Ljava/lang/String;

    .line 1800
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .param p1, "utf8"    # Ljava/lang/String;
    .param p2, "index"    # I

    .prologue
    .line 1793
    invoke-direct {p0, p2}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    .line 1794
    iput-object p1, p0, Ljavassist/bytecode/Utf8Info;->string:Ljava/lang/String;

    .line 1795
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I
    .registers 5
    .param p1, "src"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p3, "map"    # Ljava/util/Map;

    .prologue
    .line 1813
    iget-object v0, p0, Ljavassist/bytecode/Utf8Info;->string:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1807
    instance-of v0, p1, Ljavassist/bytecode/Utf8Info;

    if-eqz v0, :cond_12

    check-cast p1, Ljavassist/bytecode/Utf8Info;

    .end local p1    # "obj":Ljava/lang/Object;
    iget-object v0, p1, Ljavassist/bytecode/Utf8Info;->string:Ljava/lang/String;

    iget-object v1, p0, Ljavassist/bytecode/Utf8Info;->string:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public getTag()I
    .registers 2

    .prologue
    .line 1810
    const/4 v0, 0x1

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 1803
    iget-object v0, p0, Ljavassist/bytecode/Utf8Info;->string:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1822
    const-string v0, "UTF8 \""

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1823
    iget-object v0, p0, Ljavassist/bytecode/Utf8Info;->string:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1824
    const-string v0, "\""

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1825
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
    .line 1817
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 1818
    iget-object v0, p0, Ljavassist/bytecode/Utf8Info;->string:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 1819
    return-void
.end method
