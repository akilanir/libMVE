.class public Ljavassist/bytecode/StackMapTable;
.super Ljavassist/bytecode/AttributeInfo;
.source "StackMapTable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/bytecode/StackMapTable$NewRemover;,
        Ljavassist/bytecode/StackMapTable$SwitchShifter;,
        Ljavassist/bytecode/StackMapTable$Shifter;,
        Ljavassist/bytecode/StackMapTable$OffsetShifter;,
        Ljavassist/bytecode/StackMapTable$Printer;,
        Ljavassist/bytecode/StackMapTable$Writer;,
        Ljavassist/bytecode/StackMapTable$InsertLocal;,
        Ljavassist/bytecode/StackMapTable$Copier;,
        Ljavassist/bytecode/StackMapTable$SimpleCopy;,
        Ljavassist/bytecode/StackMapTable$Walker;,
        Ljavassist/bytecode/StackMapTable$RuntimeCopyException;
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

.field public static final tag:Ljava/lang/String; = "StackMapTable"


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
    .line 53
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V

    .line 54
    return-void
.end method

.method constructor <init>(Ljavassist/bytecode/ConstPool;[B)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "newInfo"    # [B

    .prologue
    .line 47
    const-string v0, "StackMapTable"

    invoke-direct {p0, p1, v0, p2}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    .line 48
    return-void
.end method

.method public static typeTagOf(C)I
    .registers 2
    .param p0, "descriptor"    # C

    .prologue
    .line 475
    sparse-switch p0, :sswitch_data_e

    .line 487
    const/4 v0, 0x1

    :goto_4
    return v0

    .line 477
    :sswitch_5
    const/4 v0, 0x3

    goto :goto_4

    .line 479
    :sswitch_7
    const/4 v0, 0x2

    goto :goto_4

    .line 481
    :sswitch_9
    const/4 v0, 0x4

    goto :goto_4

    .line 484
    :sswitch_b
    const/4 v0, 0x7

    goto :goto_4

    .line 475
    nop

    :sswitch_data_e
    .sparse-switch
        0x44 -> :sswitch_5
        0x46 -> :sswitch_7
        0x4a -> :sswitch_9
        0x4c -> :sswitch_b
        0x5b -> :sswitch_b
    .end sparse-switch
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;
    .registers 8
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/StackMapTable$RuntimeCopyException;
        }
    .end annotation

    .prologue
    .line 69
    :try_start_0
    new-instance v1, Ljavassist/bytecode/StackMapTable;

    new-instance v2, Ljavassist/bytecode/StackMapTable$Copier;

    iget-object v3, p0, Ljavassist/bytecode/StackMapTable;->constPool:Ljavassist/bytecode/ConstPool;

    iget-object v4, p0, Ljavassist/bytecode/StackMapTable;->info:[B

    invoke-direct {v2, v3, v4, p1, p2}, Ljavassist/bytecode/StackMapTable$Copier;-><init>(Ljavassist/bytecode/ConstPool;[BLjavassist/bytecode/ConstPool;Ljava/util/Map;)V

    invoke-virtual {v2}, Ljavassist/bytecode/StackMapTable$Copier;->doit()[B

    move-result-object v2

    invoke-direct {v1, p1, v2}, Ljavassist/bytecode/StackMapTable;-><init>(Ljavassist/bytecode/ConstPool;[B)V
    :try_end_12
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_0 .. :try_end_12} :catch_13

    return-object v1

    .line 72
    :catch_13
    move-exception v0

    .line 73
    .local v0, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v1, Ljavassist/bytecode/StackMapTable$RuntimeCopyException;

    const-string v2, "bad bytecode. fatal?"

    invoke-direct {v1, v2}, Ljavassist/bytecode/StackMapTable$RuntimeCopyException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public insertLocal(III)V
    .registers 7
    .param p1, "index"    # I
    .param p2, "tag"    # I
    .param p3, "classInfo"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 461
    new-instance v1, Ljavassist/bytecode/StackMapTable$InsertLocal;

    invoke-virtual {p0}, Ljavassist/bytecode/StackMapTable;->get()[B

    move-result-object v2

    invoke-direct {v1, v2, p1, p2, p3}, Ljavassist/bytecode/StackMapTable$InsertLocal;-><init>([BIII)V

    invoke-virtual {v1}, Ljavassist/bytecode/StackMapTable$InsertLocal;->doit()[B

    move-result-object v0

    .line 462
    .local v0, "data":[B
    invoke-virtual {p0, v0}, Ljavassist/bytecode/StackMapTable;->set([B)V

    .line 463
    return-void
.end method

.method public println(Ljava/io/PrintStream;)V
    .registers 4
    .param p1, "ps"    # Ljava/io/PrintStream;

    .prologue
    .line 706
    new-instance v0, Ljava/io/PrintWriter;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;Z)V

    invoke-static {p0, v0}, Ljavassist/bytecode/StackMapTable$Printer;->print(Ljavassist/bytecode/StackMapTable;Ljava/io/PrintWriter;)V

    .line 707
    return-void
.end method

.method public println(Ljava/io/PrintWriter;)V
    .registers 2
    .param p1, "w"    # Ljava/io/PrintWriter;

    .prologue
    .line 697
    invoke-static {p0, p1}, Ljavassist/bytecode/StackMapTable$Printer;->print(Ljavassist/bytecode/StackMapTable;Ljava/io/PrintWriter;)V

    .line 698
    return-void
.end method

.method public removeNew(I)V
    .registers 6
    .param p1, "where"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1000
    :try_start_0
    new-instance v2, Ljavassist/bytecode/StackMapTable$NewRemover;

    invoke-virtual {p0}, Ljavassist/bytecode/StackMapTable;->get()[B

    move-result-object v3

    invoke-direct {v2, v3, p1}, Ljavassist/bytecode/StackMapTable$NewRemover;-><init>([BI)V

    invoke-virtual {v2}, Ljavassist/bytecode/StackMapTable$NewRemover;->doit()[B

    move-result-object v0

    .line 1001
    .local v0, "data":[B
    invoke-virtual {p0, v0}, Ljavassist/bytecode/StackMapTable;->set([B)V
    :try_end_10
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_0 .. :try_end_10} :catch_11

    .line 1006
    return-void

    .line 1003
    .end local v0    # "data":[B
    :catch_11
    move-exception v1

    .line 1004
    .local v1, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v2, Ljavassist/CannotCompileException;

    const-string v3, "bad stack map table"

    invoke-direct {v2, v3, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
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
    .line 926
    new-instance v0, Ljavassist/bytecode/StackMapTable$SwitchShifter;

    invoke-direct {v0, p0, p1, p2}, Ljavassist/bytecode/StackMapTable$SwitchShifter;-><init>(Ljavassist/bytecode/StackMapTable;II)V

    invoke-virtual {v0}, Ljavassist/bytecode/StackMapTable$SwitchShifter;->doit()V

    .line 927
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
    .line 807
    new-instance v0, Ljavassist/bytecode/StackMapTable$OffsetShifter;

    invoke-direct {v0, p0, p1, p2}, Ljavassist/bytecode/StackMapTable$OffsetShifter;-><init>(Ljavassist/bytecode/StackMapTable;II)V

    invoke-virtual {v0}, Ljavassist/bytecode/StackMapTable$OffsetShifter;->parse()V

    .line 808
    new-instance v0, Ljavassist/bytecode/StackMapTable$Shifter;

    invoke-direct {v0, p0, p1, p2, p3}, Ljavassist/bytecode/StackMapTable$Shifter;-><init>(Ljavassist/bytecode/StackMapTable;IIZ)V

    invoke-virtual {v0}, Ljavassist/bytecode/StackMapTable$Shifter;->doit()V

    .line 809
    return-void
.end method

.method write(Ljava/io/DataOutputStream;)V
    .registers 2
    .param p1, "out"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-super {p0, p1}, Ljavassist/bytecode/AttributeInfo;->write(Ljava/io/DataOutputStream;)V

    .line 92
    return-void
.end method
