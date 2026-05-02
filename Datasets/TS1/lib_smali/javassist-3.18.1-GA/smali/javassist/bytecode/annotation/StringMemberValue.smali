.class public Ljavassist/bytecode/annotation/StringMemberValue;
.super Ljavassist/bytecode/annotation/MemberValue;
.source "StringMemberValue.java"


# instance fields
.field valueIndex:I


# direct methods
.method public constructor <init>(ILjavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 40
    const/16 v0, 0x73

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 41
    iput p1, p0, Ljavassist/bytecode/annotation/StringMemberValue;->valueIndex:I

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 50
    const/16 v0, 0x73

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 51
    invoke-virtual {p0, p1}, Ljavassist/bytecode/annotation/StringMemberValue;->setValue(Ljava/lang/String;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 58
    const/16 v0, 0x73

    invoke-direct {p0, v0, p1}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 59
    const-string v0, ""

    invoke-virtual {p0, v0}, Ljavassist/bytecode/annotation/StringMemberValue;->setValue(Ljava/lang/String;)V

    .line 60
    return-void
.end method


# virtual methods
.method public accept(Ljavassist/bytecode/annotation/MemberValueVisitor;)V
    .registers 2
    .param p1, "visitor"    # Ljavassist/bytecode/annotation/MemberValueVisitor;

    .prologue
    .line 102
    invoke-interface {p1, p0}, Ljavassist/bytecode/annotation/MemberValueVisitor;->visitStringMemberValue(Ljavassist/bytecode/annotation/StringMemberValue;)V

    .line 103
    return-void
.end method

.method getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 3
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 67
    const-class v0, Ljava/lang/String;

    return-object v0
.end method

.method getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    .registers 5
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "m"    # Ljava/lang/reflect/Method;

    .prologue
    .line 63
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/StringMemberValue;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 3

    .prologue
    .line 74
    iget-object v0, p0, Ljavassist/bytecode/annotation/StringMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/annotation/StringMemberValue;->valueIndex:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/String;)V
    .registers 3
    .param p1, "newValue"    # Ljava/lang/String;

    .prologue
    .line 81
    iget-object v0, p0, Ljavassist/bytecode/annotation/StringMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/annotation/StringMemberValue;->valueIndex:I

    .line 82
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/StringMemberValue;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljavassist/bytecode/annotation/AnnotationsWriter;)V
    .registers 3
    .param p1, "writer"    # Ljavassist/bytecode/annotation/AnnotationsWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/StringMemberValue;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(Ljava/lang/String;)V

    .line 96
    return-void
.end method
