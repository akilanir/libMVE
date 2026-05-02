.class public Ljavassist/bytecode/annotation/FloatMemberValue;
.super Ljavassist/bytecode/annotation/MemberValue;
.source "FloatMemberValue.java"


# instance fields
.field valueIndex:I


# direct methods
.method public constructor <init>(FLjavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "f"    # F
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 51
    const/16 v0, 0x46

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 52
    invoke-virtual {p0, p1}, Ljavassist/bytecode/annotation/FloatMemberValue;->setValue(F)V

    .line 53
    return-void
.end method

.method public constructor <init>(ILjavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 41
    const/16 v0, 0x46

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 42
    iput p1, p0, Ljavassist/bytecode/annotation/FloatMemberValue;->valueIndex:I

    .line 43
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 59
    const/16 v0, 0x46

    invoke-direct {p0, v0, p1}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 60
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/annotation/FloatMemberValue;->setValue(F)V

    .line 61
    return-void
.end method


# virtual methods
.method public accept(Ljavassist/bytecode/annotation/MemberValueVisitor;)V
    .registers 2
    .param p1, "visitor"    # Ljavassist/bytecode/annotation/MemberValueVisitor;

    .prologue
    .line 103
    invoke-interface {p1, p0}, Ljavassist/bytecode/annotation/MemberValueVisitor;->visitFloatMemberValue(Ljavassist/bytecode/annotation/FloatMemberValue;)V

    .line 104
    return-void
.end method

.method getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 3
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 68
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    return-object v0
.end method

.method public getValue()F
    .registers 3

    .prologue
    .line 75
    iget-object v0, p0, Ljavassist/bytecode/annotation/FloatMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/annotation/FloatMemberValue;->valueIndex:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getFloatInfo(I)F

    move-result v0

    return v0
.end method

.method getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    .registers 6
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "m"    # Ljava/lang/reflect/Method;

    .prologue
    .line 64
    new-instance v0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/FloatMemberValue;->getValue()F

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    return-object v0
.end method

.method public setValue(F)V
    .registers 3
    .param p1, "newValue"    # F

    .prologue
    .line 82
    iget-object v0, p0, Ljavassist/bytecode/annotation/FloatMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addFloatInfo(F)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/annotation/FloatMemberValue;->valueIndex:I

    .line 83
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 89
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/FloatMemberValue;->getValue()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

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
    .line 96
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/FloatMemberValue;->getValue()F

    move-result v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(F)V

    .line 97
    return-void
.end method
