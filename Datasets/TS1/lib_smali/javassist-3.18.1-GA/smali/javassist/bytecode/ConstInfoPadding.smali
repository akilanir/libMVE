.class Ljavassist/bytecode/ConstInfoPadding;
.super Ljavassist/bytecode/ConstInfo;
.source "ConstPool.java"


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "i"    # I

    .prologue
    .line 1301
    invoke-direct {p0, p1}, Ljavassist/bytecode/ConstInfo;-><init>(I)V

    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I
    .registers 5
    .param p1, "src"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # Ljavassist/bytecode/ConstPool;
    .param p3, "map"    # Ljava/util/Map;

    .prologue
    .line 1306
    invoke-virtual {p2}, Ljavassist/bytecode/ConstPool;->addConstInfoPadding()I

    move-result v0

    return v0
.end method

.method public getTag()I
    .registers 2

    .prologue
    .line 1303
    const/4 v0, 0x0

    return v0
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 1312
    const-string v0, "padding"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1313
    return-void
.end method

.method public write(Ljava/io/DataOutputStream;)V
    .registers 2
    .param p1, "out"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1309
    return-void
.end method
