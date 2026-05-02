.class public Ljavassist/tools/reflect/Compiler;
.super Ljava/lang/Object;
.source "Compiler.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static help(Ljava/io/PrintStream;)V
    .registers 2
    .param p0, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 160
    const-string v0, "Usage: java javassist.tools.reflect.Compiler"

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 161
    const-string v0, "            (<class> [-m <metaobject>] [-c <class metaobject>])+"

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 74
    array-length v2, p0

    if-nez v2, :cond_9

    .line 75
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-static {v2}, Ljavassist/tools/reflect/Compiler;->help(Ljava/io/PrintStream;)V

    .line 88
    :goto_8
    return-void

    .line 79
    :cond_9
    array-length v2, p0

    new-array v0, v2, [Ljavassist/tools/reflect/CompiledClass;

    .line 80
    .local v0, "entries":[Ljavassist/tools/reflect/CompiledClass;
    invoke-static {p0, v0}, Ljavassist/tools/reflect/Compiler;->parse([Ljava/lang/String;[Ljavassist/tools/reflect/CompiledClass;)I

    move-result v1

    .line 82
    .local v1, "n":I
    const/4 v2, 0x1

    if-ge v1, v2, :cond_1b

    .line 83
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v3, "bad parameter."

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_8

    .line 87
    :cond_1b
    invoke-static {v0, v1}, Ljavassist/tools/reflect/Compiler;->processClasses([Ljavassist/tools/reflect/CompiledClass;I)V

    goto :goto_8
.end method

.method private static parse([Ljava/lang/String;[Ljavassist/tools/reflect/CompiledClass;)I
    .registers 10
    .param p0, "args"    # [Ljava/lang/String;
    .param p1, "result"    # [Ljavassist/tools/reflect/CompiledClass;

    .prologue
    const/4 v7, 0x0

    const/4 v4, -0x1

    .line 132
    const/4 v3, -0x1

    .line 133
    .local v3, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4
    array-length v5, p0

    if-ge v2, v5, :cond_55

    .line 134
    aget-object v0, p0, v2

    .line 135
    .local v0, "a":Ljava/lang/String;
    const-string v5, "-m"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_24

    .line 136
    if-ltz v3, :cond_18

    add-int/lit8 v5, v2, 0x1

    array-length v6, p0

    if-le v5, v6, :cond_19

    .line 156
    .end local v0    # "a":Ljava/lang/String;
    :cond_18
    :goto_18
    return v4

    .line 139
    .restart local v0    # "a":Ljava/lang/String;
    :cond_19
    aget-object v5, p1, v3

    add-int/lit8 v2, v2, 0x1

    aget-object v6, p0, v2

    iput-object v6, v5, Ljavassist/tools/reflect/CompiledClass;->metaobject:Ljava/lang/String;

    .line 133
    :goto_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 140
    :cond_24
    const-string v5, "-c"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3c

    .line 141
    if-ltz v3, :cond_18

    add-int/lit8 v5, v2, 0x1

    array-length v6, p0

    if-gt v5, v6, :cond_18

    .line 144
    aget-object v5, p1, v3

    add-int/lit8 v2, v2, 0x1

    aget-object v6, p0, v2

    iput-object v6, v5, Ljavassist/tools/reflect/CompiledClass;->classobject:Ljava/lang/String;

    goto :goto_21

    .line 145
    :cond_3c
    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x2d

    if-eq v5, v6, :cond_18

    .line 148
    new-instance v1, Ljavassist/tools/reflect/CompiledClass;

    invoke-direct {v1}, Ljavassist/tools/reflect/CompiledClass;-><init>()V

    .line 149
    .local v1, "cc":Ljavassist/tools/reflect/CompiledClass;
    iput-object v0, v1, Ljavassist/tools/reflect/CompiledClass;->classname:Ljava/lang/String;

    .line 150
    iput-object v7, v1, Ljavassist/tools/reflect/CompiledClass;->metaobject:Ljava/lang/String;

    .line 151
    iput-object v7, v1, Ljavassist/tools/reflect/CompiledClass;->classobject:Ljava/lang/String;

    .line 152
    add-int/lit8 v3, v3, 0x1

    aput-object v1, p1, v3

    goto :goto_21

    .line 156
    .end local v0    # "a":Ljava/lang/String;
    .end local v1    # "cc":Ljavassist/tools/reflect/CompiledClass;
    :cond_55
    add-int/lit8 v4, v3, 0x1

    goto :goto_18
.end method

.method private static processClasses([Ljavassist/tools/reflect/CompiledClass;I)V
    .registers 11
    .param p0, "entries"    # [Ljavassist/tools/reflect/CompiledClass;
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 93
    new-instance v3, Ljavassist/tools/reflect/Reflection;

    invoke-direct {v3}, Ljavassist/tools/reflect/Reflection;-><init>()V

    .line 94
    .local v3, "implementor":Ljavassist/tools/reflect/Reflection;
    invoke-static {}, Ljavassist/ClassPool;->getDefault()Ljavassist/ClassPool;

    move-result-object v5

    .line 95
    .local v5, "pool":Ljavassist/ClassPool;
    invoke-virtual {v3, v5}, Ljavassist/tools/reflect/Reflection;->start(Ljavassist/ClassPool;)V

    .line 97
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    if-ge v2, p1, :cond_b8

    .line 98
    aget-object v6, p0, v2

    iget-object v6, v6, Ljavassist/tools/reflect/CompiledClass;->classname:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    .line 99
    .local v0, "c":Ljavassist/CtClass;
    aget-object v6, p0, v2

    iget-object v6, v6, Ljavassist/tools/reflect/CompiledClass;->metaobject:Ljava/lang/String;

    if-nez v6, :cond_23

    aget-object v6, p0, v2

    iget-object v6, v6, Ljavassist/tools/reflect/CompiledClass;->classobject:Ljava/lang/String;

    if-eqz v6, :cond_9b

    .line 103
    :cond_23
    aget-object v6, p0, v2

    iget-object v6, v6, Ljavassist/tools/reflect/CompiledClass;->metaobject:Ljava/lang/String;

    if-nez v6, :cond_91

    .line 104
    const-string v4, "javassist.tools.reflect.Metaobject"

    .line 108
    .local v4, "metaobj":Ljava/lang/String;
    :goto_2b
    aget-object v6, p0, v2

    iget-object v6, v6, Ljavassist/tools/reflect/CompiledClass;->classobject:Ljava/lang/String;

    if-nez v6, :cond_96

    .line 109
    const-string v1, "javassist.tools.reflect.ClassMetaobject"

    .line 113
    .local v1, "classobj":Ljava/lang/String;
    :goto_33
    invoke-virtual {v5, v4}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v6

    invoke-virtual {v5, v1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v7

    invoke-virtual {v3, v0, v6, v7}, Ljavassist/tools/reflect/Reflection;->makeReflective(Ljavassist/CtClass;Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v6

    if-nez v6, :cond_63

    .line 115
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Warning: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is reflective.  It was not changed."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 118
    :cond_63
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 97
    .end local v1    # "classobj":Ljava/lang/String;
    .end local v4    # "metaobj":Ljava/lang/String;
    :goto_8d
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_d

    .line 106
    :cond_91
    aget-object v6, p0, v2

    iget-object v4, v6, Ljavassist/tools/reflect/CompiledClass;->metaobject:Ljava/lang/String;

    .restart local v4    # "metaobj":Ljava/lang/String;
    goto :goto_2b

    .line 111
    :cond_96
    aget-object v6, p0, v2

    iget-object v1, v6, Ljavassist/tools/reflect/CompiledClass;->classobject:Ljava/lang/String;

    .restart local v1    # "classobj":Ljava/lang/String;
    goto :goto_33

    .line 122
    .end local v1    # "classobj":Ljava/lang/String;
    .end local v4    # "metaobj":Ljava/lang/String;
    :cond_9b
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": not reflective"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_8d

    .line 125
    .end local v0    # "c":Ljavassist/CtClass;
    :cond_b8
    const/4 v2, 0x0

    :goto_b9
    if-ge v2, p1, :cond_d0

    .line 126
    aget-object v6, p0, v2

    iget-object v6, v6, Ljavassist/tools/reflect/CompiledClass;->classname:Ljava/lang/String;

    invoke-virtual {v3, v5, v6}, Ljavassist/tools/reflect/Reflection;->onLoad(Ljavassist/ClassPool;Ljava/lang/String;)V

    .line 127
    aget-object v6, p0, v2

    iget-object v6, v6, Ljavassist/tools/reflect/CompiledClass;->classname:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v6

    invoke-virtual {v6}, Ljavassist/CtClass;->writeFile()V

    .line 125
    add-int/lit8 v2, v2, 0x1

    goto :goto_b9

    .line 129
    :cond_d0
    return-void
.end method
