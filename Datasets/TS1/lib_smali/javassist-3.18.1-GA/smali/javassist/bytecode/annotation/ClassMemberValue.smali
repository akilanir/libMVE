.class public Ljavassist/bytecode/annotation/ClassMemberValue;
.super Ljavassist/bytecode/annotation/MemberValue;
.source "ClassMemberValue.java"


# instance fields
.field valueIndex:I


# direct methods
.method public constructor <init>(ILjavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 44
    const/16 v0, 0x63

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 45
    iput p1, p0, Ljavassist/bytecode/annotation/ClassMemberValue;->valueIndex:I

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 54
    const/16 v0, 0x63

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 55
    invoke-virtual {p0, p1}, Ljavassist/bytecode/annotation/ClassMemberValue;->setValue(Ljava/lang/String;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 63
    const/16 v0, 0x63

    invoke-direct {p0, v0, p1}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 64
    const-string v0, "java.lang.Class"

    invoke-virtual {p0, v0}, Ljavassist/bytecode/annotation/ClassMemberValue;->setValue(Ljava/lang/String;)V

    .line 65
    return-void
.end method


# virtual methods
.method public accept(Ljavassist/bytecode/annotation/MemberValueVisitor;)V
    .registers 2
    .param p1, "visitor"    # Ljavassist/bytecode/annotation/MemberValueVisitor;

    .prologue
    .line 138
    invoke-interface {p1, p0}, Ljavassist/bytecode/annotation/MemberValueVisitor;->visitClassMemberValue(Ljavassist/bytecode/annotation/ClassMemberValue;)V

    .line 139
    return-void
.end method

.method getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 3
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 93
    const-string v0, "java.lang.Class"

    invoke-static {p1, v0}, Ljavassist/bytecode/annotation/ClassMemberValue;->loadClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    .registers 6
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "m"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 69
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/ClassMemberValue;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "classname":Ljava/lang/String;
    const-string v1, "void"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 71
    sget-object v1, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    .line 89
    :goto_e
    return-object v1

    .line 72
    :cond_f
    const-string v1, "int"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 73
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    goto :goto_e

    .line 74
    :cond_1a
    const-string v1, "byte"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 75
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    goto :goto_e

    .line 76
    :cond_25
    const-string v1, "long"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 77
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    goto :goto_e

    .line 78
    :cond_30
    const-string v1, "double"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 79
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    goto :goto_e

    .line 80
    :cond_3b
    const-string v1, "float"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_46

    .line 81
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    goto :goto_e

    .line 82
    :cond_46
    const-string v1, "char"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_51

    .line 83
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    goto :goto_e

    .line 84
    :cond_51
    const-string v1, "short"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 85
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    goto :goto_e

    .line 86
    :cond_5c
    const-string v1, "boolean"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_67

    .line 87
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    goto :goto_e

    .line 89
    :cond_67
    invoke-static {p1, v0}, Ljavassist/bytecode/annotation/ClassMemberValue;->loadClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_e
.end method

.method public getValue()Ljava/lang/String;
    .registers 5

    .prologue
    .line 102
    iget-object v2, p0, Ljavassist/bytecode/annotation/ClassMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    iget v3, p0, Ljavassist/bytecode/annotation/ClassMemberValue;->valueIndex:I

    invoke-virtual {v2, v3}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v1

    .line 104
    .local v1, "v":Ljava/lang/String;
    :try_start_8
    invoke-static {v1}, Ljavassist/bytecode/SignatureAttribute;->toTypeSignature(Ljava/lang/String;)Ljavassist/bytecode/SignatureAttribute$Type;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_f
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_8 .. :try_end_f} :catch_11

    move-result-object v2

    return-object v2

    .line 105
    :catch_11
    move-exception v0

    .line 106
    .local v0, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setValue(Ljava/lang/String;)V
    .registers 4
    .param p1, "newClassName"    # Ljava/lang/String;

    .prologue
    .line 116
    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "setTo":Ljava/lang/String;
    iget-object v1, p0, Ljavassist/bytecode/annotation/ClassMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, v0}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Ljavassist/bytecode/annotation/ClassMemberValue;->valueIndex:I

    .line 118
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/ClassMemberValue;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".class"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljavassist/bytecode/annotation/AnnotationsWriter;)V
    .registers 4
    .param p1, "writer"    # Ljavassist/bytecode/annotation/AnnotationsWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 131
    iget-object v0, p0, Ljavassist/bytecode/annotation/ClassMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/annotation/ClassMemberValue;->valueIndex:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/annotation/AnnotationsWriter;->classInfoIndex(Ljava/lang/String;)V

    .line 132
    return-void
.end method
