.class public Ljavassist/bytecode/annotation/ByteMemberValue;
.super Ljavassist/bytecode/annotation/MemberValue;
.source "ByteMemberValue.java"


# instance fields
.field valueIndex:I


# direct methods
.method public constructor <init>(BLjavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "b"    # B
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 49
    const/16 v0, 0x42

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 50
    invoke-virtual {p0, p1}, Ljavassist/bytecode/annotation/ByteMemberValue;->setValue(B)V

    .line 51
    return-void
.end method

.method public constructor <init>(ILjavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 39
    const/16 v0, 0x42

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 40
    iput p1, p0, Ljavassist/bytecode/annotation/ByteMemberValue;->valueIndex:I

    .line 41
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 57
    const/16 v0, 0x42

    invoke-direct {p0, v0, p1}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 58
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljavassist/bytecode/annotation/ByteMemberValue;->setValue(B)V

    .line 59
    return-void
.end method


# virtual methods
.method public accept(Ljavassist/bytecode/annotation/MemberValueVisitor;)V
    .registers 2
    .param p1, "visitor"    # Ljavassist/bytecode/annotation/MemberValueVisitor;

    .prologue
    .line 101
    invoke-interface {p1, p0}, Ljavassist/bytecode/annotation/MemberValueVisitor;->visitByteMemberValue(Ljavassist/bytecode/annotation/ByteMemberValue;)V

    .line 102
    return-void
.end method

.method getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 3
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 66
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    return-object v0
.end method

.method public getValue()B
    .registers 3

    .prologue
    .line 73
    iget-object v0, p0, Ljavassist/bytecode/annotation/ByteMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/annotation/ByteMemberValue;->valueIndex:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getIntegerInfo(I)I

    move-result v0

    int-to-byte v0, v0

    return v0
.end method

.method getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    .registers 6
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "m"    # Ljava/lang/reflect/Method;

    .prologue
    .line 62
    new-instance v0, Ljava/lang/Byte;

    invoke-virtual {p0}, Ljavassist/bytecode/annotation/ByteMemberValue;->getValue()B

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Byte;-><init>(B)V

    return-object v0
.end method

.method public setValue(B)V
    .registers 3
    .param p1, "newValue"    # B

    .prologue
    .line 80
    iget-object v0, p0, Ljavassist/bytecode/annotation/ByteMemberValue;->cp:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addIntegerInfo(I)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/annotation/ByteMemberValue;->valueIndex:I

    .line 81
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 87
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/ByteMemberValue;->getValue()B

    move-result v0

    invoke-static {v0}, Ljava/lang/Byte;->toString(B)Ljava/lang/String;

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
    .line 94
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/ByteMemberValue;->getValue()B

    move-result v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/annotation/AnnotationsWriter;->constValueIndex(B)V

    .line 95
    return-void
.end method
