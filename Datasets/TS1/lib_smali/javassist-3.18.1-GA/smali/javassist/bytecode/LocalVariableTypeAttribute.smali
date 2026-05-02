.class public Ljavassist/bytecode/LocalVariableTypeAttribute;
.super Ljavassist/bytecode/LocalVariableAttribute;
.source "LocalVariableTypeAttribute.java"


# static fields
.field public static final tag:Ljava/lang/String; = "LocalVariableTypeTable"


# direct methods
.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    const/4 v2, 0x0

    .line 38
    const-string v0, "LocalVariableTypeTable"

    const/4 v1, 0x2

    new-array v1, v1, [B

    invoke-direct {p0, p1, v0, v1}, Ljavassist/bytecode/LocalVariableAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    .line 39
    iget-object v0, p0, Ljavassist/bytecode/LocalVariableTypeAttribute;->info:[B

    invoke-static {v2, v0, v2}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 40
    return-void
.end method

.method constructor <init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "n"    # I
    .param p3, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/LocalVariableAttribute;-><init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V

    .line 46
    return-void
.end method

.method private constructor <init>(Ljavassist/bytecode/ConstPool;[B)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # [B

    .prologue
    .line 49
    const-string v0, "LocalVariableTypeTable"

    invoke-direct {p0, p1, v0, p2}, Ljavassist/bytecode/LocalVariableAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    .line 50
    return-void
.end method


# virtual methods
.method makeThisAttr(Ljavassist/bytecode/ConstPool;[B)Ljavassist/bytecode/LocalVariableAttribute;
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "dest"    # [B

    .prologue
    .line 61
    new-instance v0, Ljavassist/bytecode/LocalVariableTypeAttribute;

    invoke-direct {v0, p1, p2}, Ljavassist/bytecode/LocalVariableTypeAttribute;-><init>(Ljavassist/bytecode/ConstPool;[B)V

    return-object v0
.end method

.method renameEntry(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "desc"    # Ljava/lang/String;
    .param p2, "oldname"    # Ljava/lang/String;
    .param p3, "newname"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-static {p1, p2, p3}, Ljavassist/bytecode/SignatureAttribute;->renameClass(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method renameEntry(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .registers 4
    .param p1, "desc"    # Ljava/lang/String;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    .line 57
    invoke-static {p1, p2}, Ljavassist/bytecode/SignatureAttribute;->renameClass(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
