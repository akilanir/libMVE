.class public Ljavassist/tools/Dump;
.super Ljava/lang/Object;
.source "Dump.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 7
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 43
    array-length v3, p0

    if-eq v3, v5, :cond_c

    .line 44
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v4, "Usage: java Dump <class file name>"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 57
    :goto_b
    return-void

    .line 48
    :cond_c
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v3, Ljava/io/FileInputStream;

    const/4 v4, 0x0

    aget-object v4, p0, v4

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 50
    .local v0, "in":Ljava/io/DataInputStream;
    new-instance v2, Ljavassist/bytecode/ClassFile;

    invoke-direct {v2, v0}, Ljavassist/bytecode/ClassFile;-><init>(Ljava/io/DataInputStream;)V

    .line 51
    .local v2, "w":Ljavassist/bytecode/ClassFile;
    new-instance v1, Ljava/io/PrintWriter;

    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct {v1, v3, v5}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;Z)V

    .line 52
    .local v1, "out":Ljava/io/PrintWriter;
    const-string v3, "*** constant pool ***"

    invoke-virtual {v1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 53
    invoke-virtual {v2}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljavassist/bytecode/ConstPool;->print(Ljava/io/PrintWriter;)V

    .line 54
    invoke-virtual {v1}, Ljava/io/PrintWriter;->println()V

    .line 55
    const-string v3, "*** members ***"

    invoke-virtual {v1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 56
    invoke-static {v2, v1}, Ljavassist/bytecode/ClassFilePrinter;->print(Ljavassist/bytecode/ClassFile;Ljava/io/PrintWriter;)V

    goto :goto_b
.end method
