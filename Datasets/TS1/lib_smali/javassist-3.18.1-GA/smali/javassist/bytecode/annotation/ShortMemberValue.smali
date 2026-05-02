.class public Ljavassist/bytecode/annotation/ShortMemberValue;
.super Ljavassist/bytecode/annotation/MemberValue;
.source "ShortMemberValue.java"


# instance fields
.field valueIndex:I


# direct methods
.method public constructor <init>(ILjavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 40
    const/16 v0, 0x53

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 41
    iput p1, p0, Ljavassist/bytecode/annotation/ShortMemberValue;->valueIndex:I

    .line 42
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 58
    const/16 v0, 0x53

    invoke-direct {p0, v0, p1}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 59
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/annotation/ShortMemberValue;->setValue(S)V

    .line 60
    return-void
.end method

.method public constructor <init>(SLjavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "s"    # S
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 50
    const/16 v0, 0x53

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 51
    invoke-virtual {p0, p1}, Ljavassist/bytecode/annotation/ShortMemberValue;->setValue(S)V

    .line 52
    return-void
.end method


# virtual methods
.method public accept(Ljavassist/bytecode/annotation/MemberValueVisitor;)V
    .registers 2
    .param p1, "visitor"    # Ljavassist/bytecode/annotation/MemberValueVisitor;

    .prologue
    .line 102
    invoke-interface {p1, p0}, Ljavassist/bytecode/annotation/MemberValueVisitor;->visitShortMemberValue(Ljavassist/bytecode/annotation/ShortMemberValue;)V

    .line 103
    return-void
.end method

.method getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 3
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 67
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    return-object v0
.end method

.method getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    .registers 6
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "m"    # Ljava/lang/reflect/Method;

    .prologue
    .line 63
    new-instance v0, Ljava/lang/Short;

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/ShortMemberValue;->getValue()S

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Short;-><init>(S)V

    return-object v0
.end method

.method public getValue()S
    .registers 3

    .prologue
    .line 74
    iget-object v0, p0, Ljavassist/bytecode/annotation/ShortMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/annotation/ShortMemberValue;->valueIndex:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getIntegerInfo(I)I

    move-result v0

    int-to-short v0, v0

    return v0
.end method

.method public setValue(S)V
    .registers 3
    .param p1, "newValue"    # S

    .prologue
    .line 81
    iget-object v0, p0, Ljavassist/bytecode/annotation/ShortMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addIntegerInfo(I)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/annotation/ShortMemberValue;->valueIndex:I

    .line 82
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 88
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/ShortMemberValue;->getValue()S

    move-result v0

    invoke-static {v0}, Ljava/lang/Short;->toString(S)Ljava/lang/String;

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
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/ShortMemberValue;->getValue()S

    move-result v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(S)V

    .line 96
    return-void
.end method
