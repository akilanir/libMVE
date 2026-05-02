.class abstract Ljavassist/bytecode/ConstInfo;
.super Ljava/lang/Object;
.source "ConstPool.java"


# instance fields
.field index:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "i"    # I

    .prologue
    .line 1277
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ljavassist/bytecode/ConstInfo;->index:I

    return-void
.end method


# virtual methods
.method public abstract copy(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)I
.end method

.method public getClassName(Ljavassist/bytecode/ConstPool;)Ljava/lang/String;
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 1281
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract getTag()I
.end method

.method public abstract print(Ljava/io/PrintWriter;)V
.end method

.method public renameClass(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "oldName"    # Ljava/lang/String;
    .param p3, "newName"    # Ljava/lang/String;
    .param p4, "cache"    # Ljava/util/HashMap;

    .prologue
    .line 1282
    return-void
.end method

.method public renameClass(Ljavassist/bytecode/ConstPool;Ljava/util/Map;Ljava/util/HashMap;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;
    .param p3, "cache"    # Ljava/util/HashMap;

    .prologue
    .line 1283
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 1291
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1292
    .local v0, "bout":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    .line 1293
    .local v1, "out":Ljava/io/PrintWriter;
    invoke-virtual {p0, v1}, Ljavassist/bytecode/ConstInfo;->print(Ljava/io/PrintWriter;)V

    .line 1294
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public abstract write(Ljava/io/DataOutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
