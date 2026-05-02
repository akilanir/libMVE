.class public Ljavassist/bytecode/annotation/IntegerMemberValue;
.super Ljavassist/bytecode/annotation/MemberValue;
.source "IntegerMemberValue.java"


# instance fields
.field valueIndex:I


# direct methods
.method public constructor <init>(ILjavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 40
    const/16 v0, 0x49

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 41
    iput p1, p0, Ljavassist/bytecode/annotation/IntegerMemberValue;->valueIndex:I

    .line 42
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 64
    const/16 v0, 0x49

    invoke-direct {p0, v0, p1}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 65
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/annotation/IntegerMemberValue;->setValue(I)V

    .line 66
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;I)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "value"    # I

    .prologue
    .line 56
    const/16 v0, 0x49

    invoke-direct {p0, v0, p1}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 57
    invoke-virtual {p0, p2}, Ljavassist/bytecode/annotation/IntegerMemberValue;->setValue(I)V

    .line 58
    return-void
.end method


# virtual methods
.method public accept(Ljavassist/bytecode/annotation/MemberValueVisitor;)V
    .registers 2
    .param p1, "visitor"    # Ljavassist/bytecode/annotation/MemberValueVisitor;

    .prologue
    .line 108
    invoke-interface {p1, p0}, Ljavassist/bytecode/annotation/MemberValueVisitor;->visitIntegerMemberValue(Ljavassist/bytecode/annotation/IntegerMemberValue;)V

    .line 109
    return-void
.end method

.method getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 3
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 73
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    return-object v0
.end method

.method public getValue()I
    .registers 3

    .prologue
    .line 80
    iget-object v0, p0, Ljavassist/bytecode/annotation/IntegerMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/annotation/IntegerMemberValue;->valueIndex:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getIntegerInfo(I)I

    move-result v0

    return v0
.end method

.method getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    .registers 6
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "m"    # Ljava/lang/reflect/Method;

    .prologue
    .line 69
    new-instance v0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/IntegerMemberValue;->getValue()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    return-object v0
.end method

.method public setValue(I)V
    .registers 3
    .param p1, "newValue"    # I

    .prologue
    .line 87
    iget-object v0, p0, Ljavassist/bytecode/annotation/IntegerMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addIntegerInfo(I)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/annotation/IntegerMemberValue;->valueIndex:I

    .line 88
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 94
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/IntegerMemberValue;->getValue()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

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
    .line 101
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/IntegerMemberValue;->getValue()I

    move-result v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(I)V

    .line 102
    return-void
.end method
