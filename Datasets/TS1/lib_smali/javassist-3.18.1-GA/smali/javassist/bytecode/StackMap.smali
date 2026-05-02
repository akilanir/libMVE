.class public Ljavassist/bytecode/StackMap;
.super Ljavassist/bytecode/AttributeInfo;
.source "StackMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/bytecode/StackMap$Writer;,
        Ljavassist/bytecode/StackMap$Printer;,
        Ljavassist/bytecode/StackMap$NewRemover;,
        Ljavassist/bytecode/StackMap$SwitchShifter;,
        Ljavassist/bytecode/StackMap$Shifter;,
        Ljavassist/bytecode/StackMap$InsertLocal;,
        Ljavassist/bytecode/StackMap$SimpleCopy;,
        Ljavassist/bytecode/StackMap$Copier;,
        Ljavassist/bytecode/StackMap$Walker;
    }
.end annotation


# static fields
.field public static final DOUBLE:I = 0x3

.field public static final FLOAT:I = 0x2

.field public static final INTEGER:I = 0x1

.field public static final LONG:I = 0x4

.field public static final NULL:I = 0x5

.field public static final OBJECT:I = 0x7

.field public static final THIS:I = 0x6

.field public static final TOP:I = 0x0

.field public static final UNINIT:I = 0x8

.field public static final tag:Ljava/lang/String; = "StackMap"


# direct methods
.method constructor <init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "name_id"    # I
    .param p3, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V

    .line 62
    return-void
.end method

.method constructor <init>(Ljavassist/bytecode/ConstPool;[B)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "newInfo"    # [B

    .prologue
    .line 55
    const-string v0, "StackMap"

    invoke-direct {p0, p1, v0, p2}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    .line 56
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;
    .registers 5
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    .line 120
    new-instance v0, Ljavassist/bytecode/StackMap$Copier;

    invoke-direct {v0, p0, p1, p2}, Ljavassist/bytecode/StackMap$Copier;-><init>(Ljavassist/bytecode/StackMap;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)V

    .line 121
    .local v0, "copier":Ljavassist/bytecode/StackMap$Copier;
    invoke-virtual {v0}, Ljavassist/bytecode/StackMap$Copier;->visit()V

    .line 122
    invoke-virtual {v0}, Ljavassist/bytecode/StackMap$Copier;->getStackMap()Ljavassist/bytecode/StackMap;

    move-result-object v1

    return-object v1
.end method

.method public insertLocal(III)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "tag"    # I
    .param p3, "classInfo"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 291
    new-instance v1, Ljavassist/bytecode/StackMap$InsertLocal;

    invoke-direct {v1, p0, p1, p2, p3}, Ljavassist/bytecode/StackMap$InsertLocal;-><init>(Ljavassist/bytecode/StackMap;III)V

    invoke-virtual {v1}, Ljavassist/bytecode/StackMap$InsertLocal;->doit()[B

    move-result-object v0

    .line 292
    .local v0, "data":[B
    invoke-virtual {p0, v0}, Ljavassist/bytecode/StackMap;->set([B)V

    .line 293
    return-void
.end method

.method public numOfEntries()I
    .registers 3

    .prologue
    .line 68
    iget-object v0, p0, Ljavassist/bytecode/StackMap;->info:[B

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method public print(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 505
    new-instance v0, Ljavassist/bytecode/StackMap$Printer;

    invoke-direct {v0, p0, p1}, Ljavassist/bytecode/StackMap$Printer;-><init>(Ljavassist/bytecode/StackMap;Ljava/io/PrintWriter;)V

    invoke-virtual {v0}, Ljavassist/bytecode/StackMap$Printer;->print()V

    .line 506
    return-void
.end method

.method public removeNew(I)V
    .registers 4
    .param p1, "where"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 442
    new-instance v1, Ljavassist/bytecode/StackMap$NewRemover;

    invoke-direct {v1, p0, p1}, Ljavassist/bytecode/StackMap$NewRemover;-><init>(Ljavassist/bytecode/StackMap;I)V

    invoke-virtual {v1}, Ljavassist/bytecode/StackMap$NewRemover;->doit()[B

    move-result-object v0

    .line 443
    .local v0, "data":[B
    invoke-virtual {p0, v0}, Ljavassist/bytecode/StackMap;->set([B)V

    .line 444
    return-void
.end method

.method shiftForSwitch(II)V
    .registers 4
    .param p1, "where"    # I
    .param p2, "gapSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 410
    new-instance v0, Ljavassist/bytecode/StackMap$SwitchShifter;

    invoke-direct {v0, p0, p1, p2}, Ljavassist/bytecode/StackMap$SwitchShifter;-><init>(Ljavassist/bytecode/StackMap;II)V

    invoke-virtual {v0}, Ljavassist/bytecode/StackMap$SwitchShifter;->visit()V

    .line 411
    return-void
.end method

.method shiftPc(IIZ)V
    .registers 5
    .param p1, "where"    # I
    .param p2, "gapSize"    # I
    .param p3, "exclusive"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 379
    new-instance v0, Ljavassist/bytecode/StackMap$Shifter;

    invoke-direct {v0, p0, p1, p2, p3}, Ljavassist/bytecode/StackMap$Shifter;-><init>(Ljavassist/bytecode/StackMap;IIZ)V

    invoke-virtual {v0}, Ljavassist/bytecode/StackMap$Shifter;->visit()V

    .line 380
    return-void
.end method
