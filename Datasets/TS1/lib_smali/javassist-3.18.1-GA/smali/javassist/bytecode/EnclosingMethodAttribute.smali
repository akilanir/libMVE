.class public Ljavassist/bytecode/EnclosingMethodAttribute;
.super Ljavassist/bytecode/AttributeInfo;
.source "EnclosingMethodAttribute.java"


# static fields
.field public static final tag:Ljava/lang/String; = "EnclosingMethod"


# direct methods
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
    .line 35
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V
    .registers 9
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 67
    const-string v3, "EnclosingMethod"

    invoke-direct {p0, p1, v3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    .line 68
    invoke-virtual {p1, p2}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v1

    .line 69
    .local v1, "ci":I
    const/4 v2, 0x0

    .line 70
    .local v2, "ni":I
    const/4 v3, 0x4

    new-array v0, v3, [B

    .line 71
    .local v0, "bvalue":[B
    ushr-int/lit8 v3, v1, 0x8

    int-to-byte v3, v3

    aput-byte v3, v0, v5

    .line 72
    const/4 v3, 0x1

    int-to-byte v4, v1

    aput-byte v4, v0, v3

    .line 73
    const/4 v3, 0x2

    int-to-byte v4, v5

    aput-byte v4, v0, v3

    .line 74
    const/4 v3, 0x3

    int-to-byte v4, v2

    aput-byte v4, v0, v3

    .line 75
    invoke-virtual {p0, v0}, Ljavassist/bytecode/EnclosingMethodAttribute;->set([B)V

    .line 76
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "className"    # Ljava/lang/String;
    .param p3, "methodName"    # Ljava/lang/String;
    .param p4, "methodDesc"    # Ljava/lang/String;

    .prologue
    .line 48
    const-string v3, "EnclosingMethod"

    invoke-direct {p0, p1, v3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    .line 49
    invoke-virtual {p1, p2}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v1

    .line 50
    .local v1, "ci":I
    invoke-virtual {p1, p3, p4}, Ljavassist/bytecode/ConstPool;->addNameAndTypeInfo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 51
    .local v2, "ni":I
    const/4 v3, 0x4

    new-array v0, v3, [B

    .line 52
    .local v0, "bvalue":[B
    const/4 v3, 0x0

    ushr-int/lit8 v4, v1, 0x8

    int-to-byte v4, v4

    aput-byte v4, v0, v3

    .line 53
    const/4 v3, 0x1

    int-to-byte v4, v1

    aput-byte v4, v0, v3

    .line 54
    const/4 v3, 0x2

    ushr-int/lit8 v4, v2, 0x8

    int-to-byte v4, v4

    aput-byte v4, v0, v3

    .line 55
    const/4 v3, 0x3

    int-to-byte v4, v2

    aput-byte v4, v0, v3

    .line 56
    invoke-virtual {p0, v0}, Ljavassist/bytecode/EnclosingMethodAttribute;->set([B)V

    .line 57
    return-void
.end method


# virtual methods
.method public classIndex()I
    .registers 3

    .prologue
    .line 82
    invoke-virtual {p0}, Ljavassist/bytecode/EnclosingMethodAttribute;->get()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method public className()Ljava/lang/String;
    .registers 3

    .prologue
    .line 96
    invoke-virtual {p0}, Ljavassist/bytecode/EnclosingMethodAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/bytecode/EnclosingMethodAttribute;->classIndex()I

    move-result v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;
    .registers 7
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    .line 128
    invoke-virtual {p0}, Ljavassist/bytecode/EnclosingMethodAttribute;->methodIndex()I

    move-result v0

    if-nez v0, :cond_10

    .line 129
    new-instance v0, Ljavassist/bytecode/EnclosingMethodAttribute;

    invoke-virtual {p0}, Ljavassist/bytecode/EnclosingMethodAttribute;->className()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljavassist/bytecode/EnclosingMethodAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    .line 131
    :goto_f
    return-object v0

    :cond_10
    new-instance v0, Ljavassist/bytecode/EnclosingMethodAttribute;

    invoke-virtual {p0}, Ljavassist/bytecode/EnclosingMethodAttribute;->className()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Ljavassist/bytecode/EnclosingMethodAttribute;->methodName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Ljavassist/bytecode/EnclosingMethodAttribute;->methodDescriptor()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, p1, v1, v2, v3}, Ljavassist/bytecode/EnclosingMethodAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_f
.end method

.method public methodDescriptor()Ljava/lang/String;
    .registers 5

    .prologue
    .line 113
    invoke-virtual {p0}, Ljavassist/bytecode/EnclosingMethodAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 114
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-virtual {p0}, Ljavassist/bytecode/EnclosingMethodAttribute;->methodIndex()I

    move-result v1

    .line 115
    .local v1, "mi":I
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getNameAndTypeDescriptor(I)I

    move-result v2

    .line 116
    .local v2, "ti":I
    invoke-virtual {v0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public methodIndex()I
    .registers 3

    .prologue
    .line 89
    invoke-virtual {p0}, Ljavassist/bytecode/EnclosingMethodAttribute;->get()[B

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method public methodName()Ljava/lang/String;
    .registers 5

    .prologue
    .line 103
    invoke-virtual {p0}, Ljavassist/bytecode/EnclosingMethodAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 104
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-virtual {p0}, Ljavassist/bytecode/EnclosingMethodAttribute;->methodIndex()I

    move-result v1

    .line 105
    .local v1, "mi":I
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getNameAndTypeName(I)I

    move-result v2

    .line 106
    .local v2, "ni":I
    invoke-virtual {v0, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
