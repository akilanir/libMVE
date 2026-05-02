.class public Ljavassist/tools/framedump;
.super Ljava/lang/Object;
.source "framedump.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 6
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 38
    array-length v2, p0

    const/4 v3, 0x1

    if-eq v2, v3, :cond_c

    .line 39
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v3, "Usage: java javassist.tools.framedump <class file name>"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 47
    :goto_b
    return-void

    .line 43
    :cond_c
    invoke-static {}, Ljavassist/ClassPool;->getDefault()Ljavassist/ClassPool;

    move-result-object v1

    .line 44
    .local v1, "pool":Ljavassist/ClassPool;
    const/4 v2, 0x0

    aget-object v2, p0, v2

    invoke-virtual {v1, v2}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 45
    .local v0, "clazz":Ljavassist/CtClass;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Frame Dump of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 46
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v0, v2}, Ljavassist/bytecode/analysis/FramePrinter;->print(Ljavassist/CtClass;Ljava/io/PrintStream;)V

    goto :goto_b
.end method
