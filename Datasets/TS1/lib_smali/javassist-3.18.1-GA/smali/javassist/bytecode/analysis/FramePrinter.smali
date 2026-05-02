.class public final Ljavassist/bytecode/analysis/FramePrinter;
.super Ljava/lang/Object;
.source "FramePrinter.java"


# instance fields
.field private final stream:Ljava/io/PrintStream;


# direct methods
.method public constructor <init>(Ljava/io/PrintStream;)V
    .registers 2
    .param p1, "stream"    # Ljava/io/PrintStream;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Ljavassist/bytecode/analysis/FramePrinter;->stream:Ljava/io/PrintStream;

    .line 46
    return-void
.end method

.method private addSpacing(I)V
    .registers 5
    .param p1, "count"    # I

    .prologue
    .line 145
    move v0, p1

    .end local p1    # "count":I
    .local v0, "count":I
    :goto_1
    add-int/lit8 p1, v0, -0x1

    .end local v0    # "count":I
    .restart local p1    # "count":I
    if-lez v0, :cond_e

    .line 146
    iget-object v1, p0, Ljavassist/bytecode/analysis/FramePrinter;->stream:Ljava/io/PrintStream;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(C)V

    move v0, p1

    .end local p1    # "count":I
    .restart local v0    # "count":I
    goto :goto_1

    .line 147
    .end local v0    # "count":I
    .restart local p1    # "count":I
    :cond_e
    return-void
.end method

.method private getMethodString(Ljavassist/CtMethod;)Ljava/lang/String;
    .registers 5
    .param p1, "method"    # Ljavassist/CtMethod;

    .prologue
    .line 67
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljavassist/CtMethod;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljavassist/Modifier;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljavassist/CtMethod;->getReturnType()Ljavassist/CtClass;

    move-result-object v2

    invoke-virtual {v2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljavassist/CtMethod;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljavassist/CtMethod;->getSignature()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljavassist/bytecode/Descriptor;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_46
    .catch Ljavassist/NotFoundException; {:try_start_0 .. :try_end_46} :catch_48

    move-result-object v1

    return-object v1

    .line 70
    :catch_48
    move-exception v0

    .line 71
    .local v0, "e":Ljavassist/NotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static print(Ljavassist/CtClass;Ljava/io/PrintStream;)V
    .registers 3
    .param p0, "clazz"    # Ljavassist/CtClass;
    .param p1, "stream"    # Ljava/io/PrintStream;

    .prologue
    .line 52
    new-instance v0, Ljavassist/bytecode/analysis/FramePrinter;

    invoke-direct {v0, p1}, Ljavassist/bytecode/analysis/FramePrinter;-><init>(Ljava/io/PrintStream;)V

    invoke-virtual {v0, p0}, Ljavassist/bytecode/analysis/FramePrinter;->print(Ljavassist/CtClass;)V

    .line 53
    return-void
.end method

.method private printLocals(Ljavassist/bytecode/analysis/Frame;)V
    .registers 7
    .param p1, "frame"    # Ljavassist/bytecode/analysis/Frame;

    .prologue
    .line 133
    iget-object v3, p0, Ljavassist/bytecode/analysis/FramePrinter;->stream:Ljava/io/PrintStream;

    const-string v4, "locals ["

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 134
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Frame;->localsLength()I

    move-result v1

    .line 135
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    if-ge v0, v1, :cond_2c

    .line 136
    if-lez v0, :cond_17

    .line 137
    iget-object v3, p0, Ljavassist/bytecode/analysis/FramePrinter;->stream:Ljava/io/PrintStream;

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 138
    :cond_17
    invoke-virtual {p1, v0}, Ljavassist/bytecode/analysis/Frame;->getLocal(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v2

    .line 139
    .local v2, "type":Ljavassist/bytecode/analysis/Type;
    iget-object v4, p0, Ljavassist/bytecode/analysis/FramePrinter;->stream:Ljava/io/PrintStream;

    if-nez v2, :cond_27

    const-string v3, "empty"

    :goto_21
    invoke-virtual {v4, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 135
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 139
    :cond_27
    invoke-virtual {v2}, Ljavassist/bytecode/analysis/Type;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_21

    .line 141
    .end local v2    # "type":Ljavassist/bytecode/analysis/Type;
    :cond_2c
    iget-object v3, p0, Ljavassist/bytecode/analysis/FramePrinter;->stream:Ljava/io/PrintStream;

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 142
    return-void
.end method

.method private printStack(Ljavassist/bytecode/analysis/Frame;)V
    .registers 7
    .param p1, "frame"    # Ljavassist/bytecode/analysis/Frame;

    .prologue
    .line 121
    iget-object v3, p0, Ljavassist/bytecode/analysis/FramePrinter;->stream:Ljava/io/PrintStream;

    const-string v4, "stack ["

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 122
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Frame;->getTopIndex()I

    move-result v1

    .line 123
    .local v1, "top":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    if-gt v0, v1, :cond_23

    .line 124
    if-lez v0, :cond_17

    .line 125
    iget-object v3, p0, Ljavassist/bytecode/analysis/FramePrinter;->stream:Ljava/io/PrintStream;

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 126
    :cond_17
    invoke-virtual {p1, v0}, Ljavassist/bytecode/analysis/Frame;->getStack(I)Ljavassist/bytecode/analysis/Type;

    move-result-object v2

    .line 127
    .local v2, "type":Ljavassist/bytecode/analysis/Type;
    iget-object v3, p0, Ljavassist/bytecode/analysis/FramePrinter;->stream:Ljava/io/PrintStream;

    invoke-virtual {v3, v2}, Ljava/io/PrintStream;->print(Ljava/lang/Object;)V

    .line 123
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 129
    .end local v2    # "type":Ljavassist/bytecode/analysis/Type;
    :cond_23
    iget-object v3, p0, Ljavassist/bytecode/analysis/FramePrinter;->stream:Ljava/io/PrintStream;

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 130
    return-void
.end method


# virtual methods
.method public print(Ljavassist/CtClass;)V
    .registers 5
    .param p1, "clazz"    # Ljavassist/CtClass;

    .prologue
    .line 59
    invoke-virtual {p1}, Ljavassist/CtClass;->getDeclaredMethods()[Ljavassist/CtMethod;

    move-result-object v1

    .line 60
    .local v1, "methods":[Ljavassist/CtMethod;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    array-length v2, v1

    if-ge v0, v2, :cond_10

    .line 61
    aget-object v2, v1, v0

    invoke-virtual {p0, v2}, Ljavassist/bytecode/analysis/FramePrinter;->print(Ljavassist/CtMethod;)V

    .line 60
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 63
    :cond_10
    return-void
.end method

.method public print(Ljavassist/CtMethod;)V
    .registers 14
    .param p1, "method"    # Ljavassist/CtMethod;

    .prologue
    .line 79
    iget-object v9, p0, Ljavassist/bytecode/analysis/FramePrinter;->stream:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-direct {p0, p1}, Ljavassist/bytecode/analysis/FramePrinter;->getMethodString(Ljavassist/CtMethod;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 80
    invoke-virtual {p1}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v4

    .line 81
    .local v4, "info":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v6

    .line 82
    .local v6, "pool":Ljavassist/bytecode/ConstPool;
    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 83
    .local v0, "code":Ljavassist/bytecode/CodeAttribute;
    if-nez v0, :cond_2b

    .line 118
    :cond_2a
    return-void

    .line 88
    :cond_2b
    :try_start_2b
    new-instance v9, Ljavassist/bytecode/analysis/Analyzer;

    invoke-direct {v9}, Ljavassist/bytecode/analysis/Analyzer;-><init>()V

    invoke-virtual {p1}, Ljavassist/CtMethod;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v10

    invoke-virtual {v9, v10, v4}, Ljavassist/bytecode/analysis/Analyzer;->analyze(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)[Ljavassist/bytecode/analysis/Frame;
    :try_end_37
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_2b .. :try_end_37} :catch_83

    move-result-object v3

    .line 93
    .local v3, "frames":[Ljavassist/bytecode/analysis/Frame;
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->getCodeLength()I

    move-result v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v8

    .line 95
    .local v8, "spacing":I
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v5

    .line 96
    .local v5, "iterator":Ljavassist/bytecode/CodeIterator;
    :goto_48
    invoke-virtual {v5}, Ljavassist/bytecode/CodeIterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2a

    .line 99
    :try_start_4e
    invoke-virtual {v5}, Ljavassist/bytecode/CodeIterator;->next()I
    :try_end_51
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_4e .. :try_end_51} :catch_8a

    move-result v7

    .line 104
    .local v7, "pos":I
    iget-object v9, p0, Ljavassist/bytecode/analysis/FramePrinter;->stream:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ": "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v5, v7, v6}, Ljavassist/bytecode/InstructionPrinter;->instructionString(Ljavassist/bytecode/CodeIterator;ILjavassist/bytecode/ConstPool;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 106
    add-int/lit8 v9, v8, 0x3

    invoke-direct {p0, v9}, Ljavassist/bytecode/analysis/FramePrinter;->addSpacing(I)V

    .line 107
    aget-object v2, v3, v7

    .line 108
    .local v2, "frame":Ljavassist/bytecode/analysis/Frame;
    if-nez v2, :cond_91

    .line 109
    iget-object v9, p0, Ljavassist/bytecode/analysis/FramePrinter;->stream:Ljava/io/PrintStream;

    const-string v10, "--DEAD CODE--"

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_48

    .line 89
    .end local v2    # "frame":Ljavassist/bytecode/analysis/Frame;
    .end local v3    # "frames":[Ljavassist/bytecode/analysis/Frame;
    .end local v5    # "iterator":Ljavassist/bytecode/CodeIterator;
    .end local v7    # "pos":I
    .end local v8    # "spacing":I
    :catch_83
    move-exception v1

    .line 90
    .local v1, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v9, Ljava/lang/RuntimeException;

    invoke-direct {v9, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .line 100
    .end local v1    # "e":Ljavassist/bytecode/BadBytecode;
    .restart local v3    # "frames":[Ljavassist/bytecode/analysis/Frame;
    .restart local v5    # "iterator":Ljavassist/bytecode/CodeIterator;
    .restart local v8    # "spacing":I
    :catch_8a
    move-exception v1

    .line 101
    .restart local v1    # "e":Ljavassist/bytecode/BadBytecode;
    new-instance v9, Ljava/lang/RuntimeException;

    invoke-direct {v9, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .line 112
    .end local v1    # "e":Ljavassist/bytecode/BadBytecode;
    .restart local v2    # "frame":Ljavassist/bytecode/analysis/Frame;
    .restart local v7    # "pos":I
    :cond_91
    invoke-direct {p0, v2}, Ljavassist/bytecode/analysis/FramePrinter;->printStack(Ljavassist/bytecode/analysis/Frame;)V

    .line 114
    add-int/lit8 v9, v8, 0x3

    invoke-direct {p0, v9}, Ljavassist/bytecode/analysis/FramePrinter;->addSpacing(I)V

    .line 115
    invoke-direct {p0, v2}, Ljavassist/bytecode/analysis/FramePrinter;->printLocals(Ljavassist/bytecode/analysis/Frame;)V

    goto :goto_48
.end method
