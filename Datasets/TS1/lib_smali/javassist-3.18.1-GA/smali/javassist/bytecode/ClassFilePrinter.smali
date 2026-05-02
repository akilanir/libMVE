.class public Ljavassist/bytecode/ClassFilePrinter;
.super Ljava/lang/Object;
.source "ClassFilePrinter.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static print(Ljavassist/bytecode/ClassFile;)V
    .registers 4
    .param p0, "cf"    # Ljavassist/bytecode/ClassFile;

    .prologue
    .line 33
    new-instance v0, Ljava/io/PrintWriter;

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;Z)V

    invoke-static {p0, v0}, Ljavassist/bytecode/ClassFilePrinter;->print(Ljavassist/bytecode/ClassFile;Ljava/io/PrintWriter;)V

    .line 34
    return-void
.end method

.method public static print(Ljavassist/bytecode/ClassFile;Ljava/io/PrintWriter;)V
    .registers 12
    .param p0, "cf"    # Ljavassist/bytecode/ClassFile;
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 46
    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getAccessFlags()I

    move-result v8

    and-int/lit8 v8, v8, -0x21

    invoke-static {v8}, Ljavassist/bytecode/AccessFlag;->toModifier(I)I

    move-result v6

    .line 49
    .local v6, "mod":I
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "major: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Ljavassist/bytecode/ClassFile;->major:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", minor: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Ljavassist/bytecode/ClassFile;->minor:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " modifiers: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getAccessFlags()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 51
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v6}, Ljavassist/Modifier;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " class "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " extends "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getSuperclass()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 54
    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getInterfaces()[Ljava/lang/String;

    move-result-object v3

    .line 55
    .local v3, "infs":[Ljava/lang/String;
    if-eqz v3, :cond_a6

    array-length v8, v3

    if-lez v8, :cond_a6

    .line 56
    const-string v8, "    implements "

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 57
    const/4 v8, 0x0

    aget-object v8, v3, v8

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 58
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_85
    array-length v8, v3

    if-ge v2, v8, :cond_a3

    .line 59
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    aget-object v9, v3, v2

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 58
    add-int/lit8 v2, v2, 0x1

    goto :goto_85

    .line 61
    :cond_a3
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 64
    .end local v2    # "i":I
    :cond_a6
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 65
    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getFields()Ljava/util/List;

    move-result-object v4

    .line 66
    .local v4, "list":Ljava/util/List;
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    .line 67
    .local v7, "n":I
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_b2
    if-ge v2, v7, :cond_fe

    .line 68
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/FieldInfo;

    .line 69
    .local v1, "finfo":Ljavassist/bytecode/FieldInfo;
    invoke-virtual {v1}, Ljavassist/bytecode/FieldInfo;->getAccessFlags()I

    move-result v0

    .line 70
    .local v0, "acc":I
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0}, Ljavassist/bytecode/AccessFlag;->toModifier(I)I

    move-result v9

    invoke-static {v9}, Ljavassist/Modifier;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Ljavassist/bytecode/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\t"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 73
    invoke-virtual {v1}, Ljavassist/bytecode/FieldInfo;->getAttributes()Ljava/util/List;

    move-result-object v8

    const/16 v9, 0x66

    invoke-static {v8, p1, v9}, Ljavassist/bytecode/ClassFilePrinter;->printAttributes(Ljava/util/List;Ljava/io/PrintWriter;C)V

    .line 67
    add-int/lit8 v2, v2, 0x1

    goto :goto_b2

    .line 76
    .end local v0    # "acc":I
    .end local v1    # "finfo":Ljavassist/bytecode/FieldInfo;
    :cond_fe
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 77
    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getMethods()Ljava/util/List;

    move-result-object v4

    .line 78
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    .line 79
    const/4 v2, 0x0

    :goto_10a
    if-ge v2, v7, :cond_159

    .line 80
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljavassist/bytecode/MethodInfo;

    .line 81
    .local v5, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v5}, Ljavassist/bytecode/MethodInfo;->getAccessFlags()I

    move-result v0

    .line 82
    .restart local v0    # "acc":I
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0}, Ljavassist/bytecode/AccessFlag;->toModifier(I)I

    move-result v9

    invoke-static {v9}, Ljavassist/Modifier;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v5}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\t"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v5}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 85
    invoke-virtual {v5}, Ljavassist/bytecode/MethodInfo;->getAttributes()Ljava/util/List;

    move-result-object v8

    const/16 v9, 0x6d

    invoke-static {v8, p1, v9}, Ljavassist/bytecode/ClassFilePrinter;->printAttributes(Ljava/util/List;Ljava/io/PrintWriter;C)V

    .line 86
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 79
    add-int/lit8 v2, v2, 0x1

    goto :goto_10a

    .line 89
    .end local v0    # "acc":I
    .end local v5    # "minfo":Ljavassist/bytecode/MethodInfo;
    :cond_159
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 90
    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getAttributes()Ljava/util/List;

    move-result-object v8

    const/16 v9, 0x63

    invoke-static {v8, p1, v9}, Ljavassist/bytecode/ClassFilePrinter;->printAttributes(Ljava/util/List;Ljava/io/PrintWriter;C)V

    .line 91
    return-void
.end method

.method static printAttributes(Ljava/util/List;Ljava/io/PrintWriter;C)V
    .registers 13
    .param p0, "list"    # Ljava/util/List;
    .param p1, "out"    # Ljava/io/PrintWriter;
    .param p2, "kind"    # C

    .prologue
    .line 94
    if-nez p0, :cond_3

    .line 152
    :cond_2
    return-void

    .line 97
    :cond_3
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    .line 98
    .local v4, "n":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_8
    if-ge v3, v4, :cond_2

    .line 99
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/AttributeInfo;

    .line 100
    .local v0, "ai":Ljavassist/bytecode/AttributeInfo;
    instance-of v8, v0, Ljavassist/bytecode/CodeAttribute;

    if-eqz v8, :cond_98

    move-object v1, v0

    .line 101
    check-cast v1, Ljavassist/bytecode/CodeAttribute;

    .line 102
    .local v1, "ca":Ljavassist/bytecode/CodeAttribute;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "attribute: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljavassist/bytecode/AttributeInfo;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 104
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "max stack "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", max locals "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v9

    invoke-virtual {v9}, Ljavassist/bytecode/ExceptionTable;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " catch blocks"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 108
    const-string v8, "<code attribute begin>"

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 109
    invoke-virtual {v1}, Ljavassist/bytecode/CodeAttribute;->getAttributes()Ljava/util/List;

    move-result-object v8

    invoke-static {v8, p1, p2}, Ljavassist/bytecode/ClassFilePrinter;->printAttributes(Ljava/util/List;Ljava/io/PrintWriter;C)V

    .line 110
    const-string v8, "<code attribute end>"

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 98
    .end local v0    # "ai":Ljavassist/bytecode/AttributeInfo;
    .end local v1    # "ca":Ljavassist/bytecode/CodeAttribute;
    :goto_94
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_8

    .line 112
    .restart local v0    # "ai":Ljavassist/bytecode/AttributeInfo;
    :cond_98
    instance-of v8, v0, Ljavassist/bytecode/AnnotationsAttribute;

    if-eqz v8, :cond_b7

    .line 113
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "annnotation: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_94

    .line 115
    :cond_b7
    instance-of v8, v0, Ljavassist/bytecode/ParameterAnnotationsAttribute;

    if-eqz v8, :cond_d6

    .line 116
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "parameter annnotations: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_94

    .line 118
    :cond_d6
    instance-of v8, v0, Ljavassist/bytecode/StackMapTable;

    if-eqz v8, :cond_ea

    .line 119
    const-string v8, "<stack map table begin>"

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 120
    check-cast v0, Ljavassist/bytecode/StackMapTable;

    .end local v0    # "ai":Ljavassist/bytecode/AttributeInfo;
    invoke-static {v0, p1}, Ljavassist/bytecode/StackMapTable$Printer;->print(Ljavassist/bytecode/StackMapTable;Ljava/io/PrintWriter;)V

    .line 121
    const-string v8, "<stack map table end>"

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_94

    .line 123
    .restart local v0    # "ai":Ljavassist/bytecode/AttributeInfo;
    :cond_ea
    instance-of v8, v0, Ljavassist/bytecode/StackMap;

    if-eqz v8, :cond_fe

    .line 124
    const-string v8, "<stack map begin>"

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 125
    check-cast v0, Ljavassist/bytecode/StackMap;

    .end local v0    # "ai":Ljavassist/bytecode/AttributeInfo;
    invoke-virtual {v0, p1}, Ljavassist/bytecode/StackMap;->print(Ljava/io/PrintWriter;)V

    .line 126
    const-string v8, "<stack map end>"

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_94

    .line 128
    .restart local v0    # "ai":Ljavassist/bytecode/AttributeInfo;
    :cond_fe
    instance-of v8, v0, Ljavassist/bytecode/SignatureAttribute;

    if-eqz v8, :cond_161

    move-object v6, v0

    .line 129
    check-cast v6, Ljavassist/bytecode/SignatureAttribute;

    .line 130
    .local v6, "sa":Ljavassist/bytecode/SignatureAttribute;
    invoke-virtual {v6}, Ljavassist/bytecode/SignatureAttribute;->getSignature()Ljava/lang/String;

    move-result-object v7

    .line 131
    .local v7, "sig":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "signature: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 134
    const/16 v8, 0x63

    if-ne p2, v8, :cond_14b

    .line 135
    :try_start_123
    invoke-static {v7}, Ljavassist/bytecode/SignatureAttribute;->toClassSignature(Ljava/lang/String;)Ljavassist/bytecode/SignatureAttribute$ClassSignature;

    move-result-object v8

    invoke-virtual {v8}, Ljavassist/bytecode/SignatureAttribute$ClassSignature;->toString()Ljava/lang/String;

    move-result-object v5

    .line 141
    .local v5, "s":Ljava/lang/String;
    :goto_12b
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "           "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_141
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_123 .. :try_end_141} :catch_143

    goto/16 :goto_94

    .line 143
    .end local v5    # "s":Ljava/lang/String;
    :catch_143
    move-exception v2

    .line 144
    .local v2, "e":Ljavassist/bytecode/BadBytecode;
    const-string v8, "           syntax error"

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_94

    .line 136
    .end local v2    # "e":Ljavassist/bytecode/BadBytecode;
    :cond_14b
    const/16 v8, 0x6d

    if-ne p2, v8, :cond_158

    .line 137
    :try_start_14f
    invoke-static {v7}, Ljavassist/bytecode/SignatureAttribute;->toMethodSignature(Ljava/lang/String;)Ljavassist/bytecode/SignatureAttribute$MethodSignature;

    move-result-object v8

    invoke-virtual {v8}, Ljavassist/bytecode/SignatureAttribute$MethodSignature;->toString()Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "s":Ljava/lang/String;
    goto :goto_12b

    .line 139
    .end local v5    # "s":Ljava/lang/String;
    :cond_158
    invoke-static {v7}, Ljavassist/bytecode/SignatureAttribute;->toFieldSignature(Ljava/lang/String;)Ljavassist/bytecode/SignatureAttribute$ObjectType;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_15f
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_14f .. :try_end_15f} :catch_143

    move-result-object v5

    .restart local v5    # "s":Ljava/lang/String;
    goto :goto_12b

    .line 148
    .end local v5    # "s":Ljava/lang/String;
    .end local v6    # "sa":Ljavassist/bytecode/SignatureAttribute;
    .end local v7    # "sig":Ljava/lang/String;
    :cond_161
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "attribute: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljavassist/bytecode/AttributeInfo;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " ("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljavassist/bytecode/AttributeInfo;->get()[B

    move-result-object v9

    array-length v9, v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " byte): "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto/16 :goto_94
.end method
