.class public Ljavassist/bytecode/SourceFileAttribute;
.super Ljavassist/bytecode/AttributeInfo;
.source "SourceFileAttribute.java"


# static fields
.field public static final tag:Ljava/lang/String; = "SourceFile"


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
    .registers 7
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    .line 45
    const-string v2, "SourceFile"

    invoke-direct {p0, p1, v2}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    .line 46
    invoke-virtual {p1, p2}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v1

    .line 47
    .local v1, "index":I
    const/4 v2, 0x2

    new-array v0, v2, [B

    .line 48
    .local v0, "bvalue":[B
    const/4 v2, 0x0

    ushr-int/lit8 v3, v1, 0x8

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 49
    const/4 v2, 0x1

    int-to-byte v3, v1

    aput-byte v3, v0, v2

    .line 50
    invoke-virtual {p0, v0}, Ljavassist/bytecode/SourceFileAttribute;->set([B)V

    .line 51
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;
    .registers 5
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    .line 69
    new-instance v0, Ljavassist/bytecode/SourceFileAttribute;

    invoke-virtual {p0}, Ljavassist/bytecode/SourceFileAttribute;->getFileName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljavassist/bytecode/SourceFileAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 57
    invoke-virtual {p0}, Ljavassist/bytecode/SourceFileAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/bytecode/SourceFileAttribute;->get()[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
