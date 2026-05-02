.class public Ljavassist/bytecode/annotation/ArrayMemberValue;
.super Ljavassist/bytecode/annotation/MemberValue;
.source "ArrayMemberValue.java"


# instance fields
.field type:Ljavassist/bytecode/annotation/MemberValue;

.field values:[Ljavassist/bytecode/annotation/MemberValue;


# direct methods
.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    const/4 v1, 0x0

    .line 38
    const/16 v0, 0x5b

    invoke-direct {p0, v0, p1}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 39
    iput-object v1, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->type:Ljavassist/bytecode/annotation/MemberValue;

    .line 40
    iput-object v1, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->values:[Ljavassist/bytecode/annotation/MemberValue;

    .line 41
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/annotation/MemberValue;Ljavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "t"    # Ljavassist/bytecode/annotation/MemberValue;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 49
    const/16 v0, 0x5b

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 50
    iput-object p1, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->type:Ljavassist/bytecode/annotation/MemberValue;

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->values:[Ljavassist/bytecode/annotation/MemberValue;

    .line 52
    return-void
.end method


# virtual methods
.method public accept(Ljavassist/bytecode/annotation/MemberValueVisitor;)V
    .registers 2
    .param p1, "visitor"    # Ljavassist/bytecode/annotation/MemberValueVisitor;

    .prologue
    .line 143
    invoke-interface {p1, p0}, Ljavassist/bytecode/annotation/MemberValueVisitor;->visitArrayMemberValue(Ljavassist/bytecode/annotation/ArrayMemberValue;)V

    .line 144
    return-void
.end method

.method getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 5
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v1, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->type:Ljavassist/bytecode/annotation/MemberValue;

    if-nez v1, :cond_c

    .line 81
    new-instance v1, Ljava/lang/ClassNotFoundException;

    const-string v2, "no array type specified"

    invoke-direct {v1, v2}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 83
    :cond_c
    iget-object v1, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->type:Ljavassist/bytecode/annotation/MemberValue;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/annotation/MemberValue;->getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    .line 84
    .local v0, "a":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    return-object v1
.end method

.method public getType()Ljavassist/bytecode/annotation/MemberValue;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->type:Ljavassist/bytecode/annotation/MemberValue;

    return-object v0
.end method

.method getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    .registers 11
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 57
    iget-object v4, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->values:[Ljavassist/bytecode/annotation/MemberValue;

    if-nez v4, :cond_21

    .line 58
    new-instance v4, Ljava/lang/ClassNotFoundException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "no array elements found: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 61
    :cond_21
    iget-object v4, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->values:[Ljavassist/bytecode/annotation/MemberValue;

    array-length v3, v4

    .line 63
    .local v3, "size":I
    iget-object v4, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->type:Ljavassist/bytecode/annotation/MemberValue;

    if-nez v4, :cond_51

    .line 64
    invoke-virtual {p3}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    .line 65
    .local v1, "clazz":Ljava/lang/Class;
    if-eqz v1, :cond_34

    if-lez v3, :cond_57

    .line 66
    :cond_34
    new-instance v4, Ljava/lang/ClassNotFoundException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "broken array type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 70
    .end local v1    # "clazz":Ljava/lang/Class;
    :cond_51
    iget-object v4, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->type:Ljavassist/bytecode/annotation/MemberValue;

    invoke-virtual {v4, p1}, Ljavassist/bytecode/annotation/MemberValue;->getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    .line 72
    .restart local v1    # "clazz":Ljava/lang/Class;
    :cond_57
    invoke-static {v1, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    .line 73
    .local v0, "a":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5c
    if-ge v2, v3, :cond_6c

    .line 74
    iget-object v4, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->values:[Ljavassist/bytecode/annotation/MemberValue;

    aget-object v4, v4, v2

    invoke-virtual {v4, p1, p2, p3}, Ljavassist/bytecode/annotation/MemberValue;->getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v0, v2, v4}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 73
    add-int/lit8 v2, v2, 0x1

    goto :goto_5c

    .line 76
    :cond_6c
    return-object v0
.end method

.method public getValue()[Ljavassist/bytecode/annotation/MemberValue;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->values:[Ljavassist/bytecode/annotation/MemberValue;

    return-object v0
.end method

.method public setValue([Ljavassist/bytecode/annotation/MemberValue;)V
    .registers 3
    .param p1, "elements"    # [Ljavassist/bytecode/annotation/MemberValue;

    .prologue
    .line 107
    iput-object p1, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->values:[Ljavassist/bytecode/annotation/MemberValue;

    .line 108
    if-eqz p1, :cond_c

    array-length v0, p1

    if-lez v0, :cond_c

    .line 109
    const/4 v0, 0x0

    aget-object v0, p1, v0

    iput-object v0, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->type:Ljavassist/bytecode/annotation/MemberValue;

    .line 110
    :cond_c
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 116
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v2, "{"

    invoke-direct {v0, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 117
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v2, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->values:[Ljavassist/bytecode/annotation/MemberValue;

    if-eqz v2, :cond_2b

    .line 118
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    iget-object v2, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->values:[Ljavassist/bytecode/annotation/MemberValue;

    array-length v2, v2

    if-ge v1, v2, :cond_2b

    .line 119
    iget-object v2, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->values:[Ljavassist/bytecode/annotation/MemberValue;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 120
    add-int/lit8 v2, v1, 0x1

    iget-object v3, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->values:[Ljavassist/bytecode/annotation/MemberValue;

    array-length v3, v3

    if-ge v2, v3, :cond_28

    .line 121
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 118
    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 125
    .end local v1    # "i":I
    :cond_2b
    const-string v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 126
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public write(Ljavassist/bytecode/annotation/AnnotationsWriter;)V
    .registers 5
    .param p1, "writer"    # Ljavassist/bytecode/annotation/AnnotationsWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    iget-object v2, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->values:[Ljavassist/bytecode/annotation/MemberValue;

    array-length v1, v2

    .line 134
    .local v1, "num":I
    invoke-virtual {p1, v1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->arrayValue(I)V

    .line 135
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v1, :cond_13

    .line 136
    iget-object v2, p0, Ljavassist/bytecode/annotation/ArrayMemberValue;->values:[Ljavassist/bytecode/annotation/MemberValue;

    aget-object v2, v2, v0

    invoke-virtual {v2, p1}, Ljavassist/bytecode/annotation/MemberValue;->write(Ljavassist/bytecode/annotation/AnnotationsWriter;)V

    .line 135
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 137
    :cond_13
    return-void
.end method
