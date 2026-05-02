.class public Ljavassist/tools/reflect/Metaobject;
.super Ljava/lang/Object;
.source "Metaobject.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field protected baseobject:Ljavassist/tools/reflect/Metalevel;

.field protected classmetaobject:Ljavassist/tools/reflect/ClassMetaobject;

.field protected methods:[Ljava/lang/reflect/Method;


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object v0, p0, Ljavassist/tools/reflect/Metaobject;->baseobject:Ljavassist/tools/reflect/Metalevel;

    .line 73
    iput-object v0, p0, Ljavassist/tools/reflect/Metaobject;->classmetaobject:Ljavassist/tools/reflect/ClassMetaobject;

    .line 74
    iput-object v0, p0, Ljavassist/tools/reflect/Metaobject;->methods:[Ljava/lang/reflect/Method;

    .line 75
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "self"    # Ljava/lang/Object;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    check-cast p1, Ljavassist/tools/reflect/Metalevel;

    .end local p1    # "self":Ljava/lang/Object;
    iput-object p1, p0, Ljavassist/tools/reflect/Metaobject;->baseobject:Ljavassist/tools/reflect/Metalevel;

    .line 62
    iget-object v0, p0, Ljavassist/tools/reflect/Metaobject;->baseobject:Ljavassist/tools/reflect/Metalevel;

    invoke-interface {v0}, Ljavassist/tools/reflect/Metalevel;->_getClass()Ljavassist/tools/reflect/ClassMetaobject;

    move-result-object v0

    iput-object v0, p0, Ljavassist/tools/reflect/Metaobject;->classmetaobject:Ljavassist/tools/reflect/ClassMetaobject;

    .line 63
    iget-object v0, p0, Ljavassist/tools/reflect/Metaobject;->classmetaobject:Ljavassist/tools/reflect/ClassMetaobject;

    invoke-virtual {v0}, Ljavassist/tools/reflect/ClassMetaobject;->getReflectiveMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Ljavassist/tools/reflect/Metaobject;->methods:[Ljava/lang/reflect/Method;

    .line 64
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/tools/reflect/Metalevel;

    iput-object v0, p0, Ljavassist/tools/reflect/Metaobject;->baseobject:Ljavassist/tools/reflect/Metalevel;

    .line 85
    iget-object v0, p0, Ljavassist/tools/reflect/Metaobject;->baseobject:Ljavassist/tools/reflect/Metalevel;

    invoke-interface {v0}, Ljavassist/tools/reflect/Metalevel;->_getClass()Ljavassist/tools/reflect/ClassMetaobject;

    move-result-object v0

    iput-object v0, p0, Ljavassist/tools/reflect/Metaobject;->classmetaobject:Ljavassist/tools/reflect/ClassMetaobject;

    .line 86
    iget-object v0, p0, Ljavassist/tools/reflect/Metaobject;->classmetaobject:Ljavassist/tools/reflect/ClassMetaobject;

    invoke-virtual {v0}, Ljavassist/tools/reflect/ClassMetaobject;->getReflectiveMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Ljavassist/tools/reflect/Metaobject;->methods:[Ljava/lang/reflect/Method;

    .line 87
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Ljavassist/tools/reflect/Metaobject;->baseobject:Ljavassist/tools/reflect/Metalevel;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 79
    return-void
.end method


# virtual methods
.method public final getClassMetaobject()Ljavassist/tools/reflect/ClassMetaobject;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Ljavassist/tools/reflect/Metaobject;->classmetaobject:Ljavassist/tools/reflect/ClassMetaobject;

    return-object v0
.end method

.method public final getMethodName(I)Ljava/lang/String;
    .registers 7
    .param p1, "identifier"    # I

    .prologue
    .line 124
    iget-object v4, p0, Ljavassist/tools/reflect/Metaobject;->methods:[Ljava/lang/reflect/Method;

    aget-object v4, v4, p1

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    .line 125
    .local v3, "mname":Ljava/lang/String;
    const/4 v1, 0x3

    .line 127
    .local v1, "j":I
    :goto_9
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "j":I
    .local v2, "j":I
    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 128
    .local v0, "c":C
    const/16 v4, 0x30

    if-lt v0, v4, :cond_17

    const/16 v4, 0x39

    if-ge v4, v0, :cond_1c

    .line 132
    :cond_17
    invoke-virtual {v3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    return-object v4

    :cond_1c
    move v1, v2

    .line 130
    .end local v2    # "j":I
    .restart local v1    # "j":I
    goto :goto_9
.end method

.method public final getObject()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Ljavassist/tools/reflect/Metaobject;->baseobject:Ljavassist/tools/reflect/Metalevel;

    return-object v0
.end method

.method public final getParameterTypes(I)[Ljava/lang/Class;
    .registers 3
    .param p1, "identifier"    # I

    .prologue
    .line 141
    iget-object v0, p0, Ljavassist/tools/reflect/Metaobject;->methods:[Ljava/lang/reflect/Method;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public final getReturnType(I)Ljava/lang/Class;
    .registers 3
    .param p1, "identifier"    # I

    .prologue
    .line 149
    iget-object v0, p0, Ljavassist/tools/reflect/Metaobject;->methods:[Ljava/lang/reflect/Method;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public final setObject(Ljava/lang/Object;)V
    .registers 3
    .param p1, "self"    # Ljava/lang/Object;

    .prologue
    .line 111
    check-cast p1, Ljavassist/tools/reflect/Metalevel;

    .end local p1    # "self":Ljava/lang/Object;
    iput-object p1, p0, Ljavassist/tools/reflect/Metaobject;->baseobject:Ljavassist/tools/reflect/Metalevel;

    .line 112
    iget-object v0, p0, Ljavassist/tools/reflect/Metaobject;->baseobject:Ljavassist/tools/reflect/Metalevel;

    invoke-interface {v0}, Ljavassist/tools/reflect/Metalevel;->_getClass()Ljavassist/tools/reflect/ClassMetaobject;

    move-result-object v0

    iput-object v0, p0, Ljavassist/tools/reflect/Metaobject;->classmetaobject:Ljavassist/tools/reflect/ClassMetaobject;

    .line 113
    iget-object v0, p0, Ljavassist/tools/reflect/Metaobject;->classmetaobject:Ljavassist/tools/reflect/ClassMetaobject;

    invoke-virtual {v0}, Ljavassist/tools/reflect/ClassMetaobject;->getReflectiveMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Ljavassist/tools/reflect/Metaobject;->methods:[Ljava/lang/reflect/Method;

    .line 116
    iget-object v0, p0, Ljavassist/tools/reflect/Metaobject;->baseobject:Ljavassist/tools/reflect/Metalevel;

    invoke-interface {v0, p0}, Ljavassist/tools/reflect/Metalevel;->_setMetaobject(Ljavassist/tools/reflect/Metaobject;)V

    .line 117
    return-void
.end method

.method public trapFieldRead(Ljava/lang/String;)Ljava/lang/Object;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 160
    invoke-virtual {p0}, Ljavassist/tools/reflect/Metaobject;->getClassMetaobject()Ljavassist/tools/reflect/ClassMetaobject;

    move-result-object v2

    invoke-virtual {v2}, Ljavassist/tools/reflect/ClassMetaobject;->getJavaClass()Ljava/lang/Class;

    move-result-object v1

    .line 162
    .local v1, "jc":Ljava/lang/Class;
    :try_start_8
    invoke-virtual {v1, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {p0}, Ljavassist/tools/reflect/Metaobject;->getObject()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_13
    .catch Ljava/lang/NoSuchFieldException; {:try_start_8 .. :try_end_13} :catch_15
    .catch Ljava/lang/IllegalAccessException; {:try_start_8 .. :try_end_13} :catch_20

    move-result-object v2

    return-object v2

    .line 164
    :catch_15
    move-exception v0

    .line 165
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/NoSuchFieldException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 167
    .end local v0    # "e":Ljava/lang/NoSuchFieldException;
    :catch_20
    move-exception v0

    .line 168
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public trapFieldWrite(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 180
    invoke-virtual {p0}, Ljavassist/tools/reflect/Metaobject;->getClassMetaobject()Ljavassist/tools/reflect/ClassMetaobject;

    move-result-object v2

    invoke-virtual {v2}, Ljavassist/tools/reflect/ClassMetaobject;->getJavaClass()Ljava/lang/Class;

    move-result-object v1

    .line 182
    .local v1, "jc":Ljava/lang/Class;
    :try_start_8
    invoke-virtual {v1, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {p0}, Ljavassist/tools/reflect/Metaobject;->getObject()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_13
    .catch Ljava/lang/NoSuchFieldException; {:try_start_8 .. :try_end_13} :catch_14
    .catch Ljava/lang/IllegalAccessException; {:try_start_8 .. :try_end_13} :catch_1f

    .line 190
    return-void

    .line 184
    :catch_14
    move-exception v0

    .line 185
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/NoSuchFieldException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 187
    .end local v0    # "e":Ljava/lang/NoSuchFieldException;
    :catch_1f
    move-exception v0

    .line 188
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public trapMethodcall(I[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "identifier"    # I
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 228
    :try_start_0
    iget-object v1, p0, Ljavassist/tools/reflect/Metaobject;->methods:[Ljava/lang/reflect/Method;

    aget-object v1, v1, p1

    invoke-virtual {p0}, Ljavassist/tools/reflect/Metaobject;->getObject()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_b
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_b} :catch_d
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_b} :catch_13

    move-result-object v1

    return-object v1

    .line 230
    :catch_d
    move-exception v0

    .line 231
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v1

    throw v1

    .line 233
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_13
    move-exception v0

    .line 234
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljavassist/tools/reflect/CannotInvokeException;

    invoke-direct {v1, v0}, Ljavassist/tools/reflect/CannotInvokeException;-><init>(Ljava/lang/IllegalAccessException;)V

    throw v1
.end method
