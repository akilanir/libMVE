.class public Ljavassist/bytecode/ConstantAttribute;
.super Ljavassist/bytecode/AttributeInfo;
.source "ConstantAttribute.java"


# static fields
.field public static final tag:Ljava/lang/String; = "ConstantValue"


# direct methods
.method public constructor <init>(Ljavassist/bytecode/ConstPool;I)V
    .registers 6
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "index"    # I

    .prologue
    .line 46
    const-string v1, "ConstantValue"

    invoke-direct {p0, p1, v1}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    .line 47
    const/4 v1, 0x2

    new-array v0, v1, [B

    .line 48
    .local v0, "bvalue":[B
    const/4 v1, 0x0

    ushr-int/lit8 v2, p2, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 49
    const/4 v1, 0x1

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 50
    invoke-virtual {p0, v0}, Ljavassist/bytecode/ConstantAttribute;->set([B)V

    .line 51
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
    .line 35
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V

    .line 36
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;
    .registers 6
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    .line 69
    invoke-virtual {p0}, Ljavassist/bytecode/ConstantAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v1

    invoke-virtual {p0}, Ljavassist/bytecode/ConstantAttribute;->getConstantValue()I

    move-result v2

    invoke-virtual {v1, v2, p1, p2}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v0

    .line 71
    .local v0, "index":I
    new-instance v1, Ljavassist/bytecode/ConstantAttribute;

    invoke-direct {v1, p1, v0}, Ljavassist/bytecode/ConstantAttribute;-><init>(Ljavassist/bytecode/ConstPool;I)V

    return-object v1
.end method

.method public getConstantValue()I
    .registers 3

    .prologue
    .line 57
    invoke-virtual {p0}, Ljavassist/bytecode/ConstantAttribute;->get()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method
