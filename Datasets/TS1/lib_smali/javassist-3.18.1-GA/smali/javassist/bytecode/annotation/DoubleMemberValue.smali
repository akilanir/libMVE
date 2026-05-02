.class public Ljavassist/bytecode/annotation/DoubleMemberValue;
.super Ljavassist/bytecode/annotation/MemberValue;
.source "DoubleMemberValue.java"


# instance fields
.field valueIndex:I


# direct methods
.method public constructor <init>(DLjavassist/bytecode/ConstPool;)V
    .registers 5
    .param p1, "d"    # D
    .param p3, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 51
    const/16 v0, 0x44

    invoke-direct {p0, v0, p3}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 52
    invoke-virtual {p0, p1, p2}, Ljavassist/bytecode/annotation/DoubleMemberValue;->setValue(D)V

    .line 53
    return-void
.end method

.method public constructor <init>(ILjavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 41
    const/16 v0, 0x44

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 42
    iput p1, p0, Ljavassist/bytecode/annotation/DoubleMemberValue;->valueIndex:I

    .line 43
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 59
    const/16 v0, 0x44

    invoke-direct {p0, v0, p1}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 60
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/annotation/DoubleMemberValue;->setValue(D)V

    .line 61
    return-void
.end method


# virtual methods
.method public accept(Ljavassist/bytecode/annotation/MemberValueVisitor;)V
    .registers 2
    .param p1, "visitor"    # Ljavassist/bytecode/annotation/MemberValueVisitor;

    .prologue
    .line 103
    invoke-interface {p1, p0}, Ljavassist/bytecode/annotation/MemberValueVisitor;->visitDoubleMemberValue(Ljavassist/bytecode/annotation/DoubleMemberValue;)V

    .line 104
    return-void
.end method

.method getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 3
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 68
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    return-object v0
.end method

.method public getValue()D
    .registers 3

    .prologue
    .line 75
    iget-object v0, p0, Ljavassist/bytecode/annotation/DoubleMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/annotation/DoubleMemberValue;->valueIndex:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getDoubleInfo(I)D

    move-result-wide v0

    return-wide v0
.end method

.method getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    .registers 7
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "m"    # Ljava/lang/reflect/Method;

    .prologue
    .line 64
    new-instance v0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/DoubleMemberValue;->getValue()D

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    return-object v0
.end method

.method public setValue(D)V
    .registers 4
    .param p1, "newValue"    # D

    .prologue
    .line 82
    iget-object v0, p0, Ljavassist/bytecode/annotation/DoubleMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1, p2}, Ljavassist/bytecode/ConstPool;->addDoubleInfo(D)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/annotation/DoubleMemberValue;->valueIndex:I

    .line 83
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 89
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/DoubleMemberValue;->getValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

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
    .line 96
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/DoubleMemberValue;->getValue()D

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(D)V

    .line 97
    return-void
.end method
