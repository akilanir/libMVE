.class public Ljavassist/bytecode/annotation/EnumMemberValue;
.super Ljavassist/bytecode/annotation/MemberValue;
.source "EnumMemberValue.java"


# instance fields
.field typeIndex:I

.field valueIndex:I


# direct methods
.method public constructor <init>(IILjavassist/bytecode/ConstPool;)V
    .registers 5
    .param p1, "type"    # I
    .param p2, "value"    # I
    .param p3, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 45
    const/16 v0, 0x65

    invoke-direct {p0, v0, p3}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 46
    iput p1, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->typeIndex:I

    .line 47
    iput p2, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->valueIndex:I

    .line 48
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 55
    const/16 v0, 0x65

    invoke-direct {p0, v0, p1}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 56
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->valueIndex:I

    iput v0, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->typeIndex:I

    .line 57
    return-void
.end method


# virtual methods
.method public accept(Ljavassist/bytecode/annotation/MemberValueVisitor;)V
    .registers 2
    .param p1, "visitor"    # Ljavassist/bytecode/annotation/MemberValueVisitor;

    .prologue
    .line 124
    invoke-interface {p1, p0}, Ljavassist/bytecode/annotation/MemberValueVisitor;->visitEnumMemberValue(Ljavassist/bytecode/annotation/EnumMemberValue;)V

    .line 125
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
    .line 74
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/EnumMemberValue;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Ljavassist/bytecode/annotation/EnumMemberValue;->loadClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 3

    .prologue
    .line 83
    iget-object v0, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->typeIndex:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->toClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    .registers 8
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "m"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 63
    :try_start_0
    invoke-virtual {p0, p1}, Ljavassist/bytecode/annotation/EnumMemberValue;->getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/EnumMemberValue;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_10
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_10} :catch_12
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_10} :catch_38

    move-result-object v1

    return-object v1

    .line 65
    :catch_12
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    new-instance v1, Ljava/lang/ClassNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/EnumMemberValue;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/EnumMemberValue;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 68
    .end local v0    # "e":Ljava/lang/NoSuchFieldException;
    :catch_38
    move-exception v0

    .line 69
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/ClassNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/EnumMemberValue;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/EnumMemberValue;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getValue()Ljava/lang/String;
    .registers 3

    .prologue
    .line 99
    iget-object v0, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->valueIndex:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setType(Ljava/lang/String;)V
    .registers 4
    .param p1, "typename"    # Ljava/lang/String;

    .prologue
    .line 92
    iget-object v0, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->typeIndex:I

    .line 93
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 106
    iget-object v0, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->valueIndex:I

    .line 107
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/EnumMemberValue;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/EnumMemberValue;->getValue()Ljava/lang/String;

    move-result-object v1

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
    .line 117
    iget-object v0, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/annotation/EnumMemberValue;->typeIndex:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/EnumMemberValue;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->enumConstValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    return-void
.end method
