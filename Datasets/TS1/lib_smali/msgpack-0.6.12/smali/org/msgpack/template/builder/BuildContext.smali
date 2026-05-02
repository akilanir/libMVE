.class public abstract Lorg/msgpack/template/builder/BuildContext;
.super Ljava/lang/Object;
.source "BuildContext.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lorg/msgpack/template/builder/FieldEntry;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static LOG:Ljava/util/logging/Logger;


# instance fields
.field protected director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

.field protected stringBuilder:Ljava/lang/StringBuilder;

.field protected tmplCtClass:Ljavassist/CtClass;

.field protected tmplName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 38
    const-class v0, Lorg/msgpack/template/builder/BuildContext;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/builder/BuildContext;->LOG:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/builder/JavassistTemplateBuilder;)V
    .registers 3
    .param p1, "director"    # Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    .prologue
    .line 52
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/msgpack/template/builder/BuildContext;->stringBuilder:Ljava/lang/StringBuilder;

    .line 53
    iput-object p1, p0, Lorg/msgpack/template/builder/BuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    .line 54
    return-void
.end method


# virtual methods
.method protected build(Ljava/lang/String;)Lorg/msgpack/template/Template;
    .registers 9
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 58
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    const/4 v2, 0x0

    :try_start_1
    invoke-virtual {p0, p1, v2}, Lorg/msgpack/template/builder/BuildContext;->reset(Ljava/lang/String;Z)V

    .line 59
    sget-object v2, Lorg/msgpack/template/builder/BuildContext;->LOG:Ljava/util/logging/Logger;

    const-string v3, "started generating template class %s for original class %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-virtual {v6}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object p1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->buildClass()V

    .line 62
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->buildConstructor()V

    .line 63
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->buildMethodInit()V

    .line 64
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->buildWriteMethod()V

    .line 65
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->buildReadMethod()V

    .line 66
    sget-object v2, Lorg/msgpack/template/builder/BuildContext;->LOG:Ljava/util/logging/Logger;

    const-string v3, "finished generating template class %s for original class %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-virtual {v6}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object p1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 68
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->createClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/msgpack/template/builder/BuildContext;->buildInstance(Ljava/lang/Class;)Lorg/msgpack/template/Template;
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4e} :catch_50

    move-result-object v2

    return-object v2

    .line 69
    :catch_50
    move-exception v1

    .line 70
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->getBuiltString()Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, "code":Ljava/lang/String;
    if-eqz v0, :cond_88

    .line 72
    sget-object v2, Lorg/msgpack/template/builder/BuildContext;->LOG:Ljava/util/logging/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "builder: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->severe(Ljava/lang/String;)V

    .line 73
    new-instance v2, Lorg/msgpack/template/builder/TemplateBuildException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot compile: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 75
    :cond_88
    new-instance v2, Lorg/msgpack/template/builder/TemplateBuildException;

    invoke-direct {v2, v1}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected buildClass()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 92
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->setSuperClass()V

    .line 93
    iget-object v0, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    iget-object v1, p0, Lorg/msgpack/template/builder/BuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    const-class v2, Lorg/msgpack/template/Template;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavassist/CtClass;->addInterface(Ljavassist/CtClass;)V

    .line 94
    return-void
.end method

.method protected abstract buildConstructor()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation
.end method

.method protected abstract buildInstance(Ljava/lang/Class;)Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/msgpack/template/Template;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation
.end method

.method protected buildMethodInit()V
    .registers 1

    .prologue
    .line 97
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    return-void
.end method

.method protected buildReadMethod()V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 129
    sget-object v6, Lorg/msgpack/template/builder/BuildContext;->LOG:Ljava/util/logging/Logger;

    const-string v8, "started generating read method in template class %s"

    new-array v9, v12, [Ljava/lang/Object;

    iget-object v10, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-virtual {v10}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 131
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->buildReadMethodBody()Ljava/lang/String;

    move-result-object v5

    .line 132
    .local v5, "mbody":Ljava/lang/String;
    const/4 v0, 0x1

    .line 133
    .local v0, "mod":I
    iget-object v6, p0, Lorg/msgpack/template/builder/BuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    const-class v8, Ljava/lang/Object;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    .line 134
    .local v1, "returnType":Ljavassist/CtClass;
    const-string v2, "read"

    .line 135
    .local v2, "mname":Ljava/lang/String;
    const/4 v6, 0x3

    new-array v3, v6, [Ljavassist/CtClass;

    iget-object v6, p0, Lorg/msgpack/template/builder/BuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    const-class v8, Lorg/msgpack/unpacker/Unpacker;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v6

    aput-object v6, v3, v11

    iget-object v6, p0, Lorg/msgpack/template/builder/BuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    const-class v8, Ljava/lang/Object;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v6

    aput-object v6, v3, v12

    const/4 v6, 0x2

    sget-object v8, Ljavassist/CtClass;->booleanType:Ljavassist/CtClass;

    aput-object v8, v3, v6

    .line 140
    .local v3, "paramTypes":[Ljavassist/CtClass;
    new-array v4, v12, [Ljavassist/CtClass;

    iget-object v6, p0, Lorg/msgpack/template/builder/BuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    const-class v8, Lorg/msgpack/MessageTypeException;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v6

    aput-object v6, v4, v11

    .line 143
    .local v4, "exceptTypes":[Ljavassist/CtClass;
    sget-object v6, Lorg/msgpack/template/builder/BuildContext;->LOG:Ljava/util/logging/Logger;

    const-string v8, "compiling read method body: %s"

    new-array v9, v12, [Ljava/lang/Object;

    aput-object v5, v9, v11

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 144
    iget-object v6, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-static/range {v0 .. v6}, Ljavassist/CtNewMethod;->make(ILjavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;[Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtMethod;

    move-result-object v7

    .line 146
    .local v7, "newCtMethod":Ljavassist/CtMethod;
    iget-object v6, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-virtual {v6, v7}, Ljavassist/CtClass;->addMethod(Ljavassist/CtMethod;)V

    .line 147
    sget-object v6, Lorg/msgpack/template/builder/BuildContext;->LOG:Ljava/util/logging/Logger;

    const-string v8, "finished generating read method in template class %s"

    new-array v9, v12, [Ljava/lang/Object;

    iget-object v10, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-virtual {v10}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 149
    return-void
.end method

.method protected abstract buildReadMethodBody()Ljava/lang/String;
.end method

.method protected buildString(Ljava/lang/String;)V
    .registers 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 168
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    iget-object v0, p0, Lorg/msgpack/template/builder/BuildContext;->stringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    return-void
.end method

.method protected varargs buildString(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 172
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    iget-object v0, p0, Lorg/msgpack/template/builder/BuildContext;->stringBuilder:Ljava/lang/StringBuilder;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    return-void
.end method

.method protected abstract buildTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;[Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[TT;[",
            "Lorg/msgpack/template/Template;",
            ")",
            "Lorg/msgpack/template/Template;"
        }
    .end annotation
.end method

.method protected buildWriteMethod()V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 104
    sget-object v6, Lorg/msgpack/template/builder/BuildContext;->LOG:Ljava/util/logging/Logger;

    const-string v8, "started generating write method in template class %s"

    new-array v9, v12, [Ljava/lang/Object;

    iget-object v10, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-virtual {v10}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 106
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->buildWriteMethodBody()Ljava/lang/String;

    move-result-object v5

    .line 107
    .local v5, "mbody":Ljava/lang/String;
    const/4 v0, 0x1

    .line 108
    .local v0, "mod":I
    sget-object v1, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    .line 109
    .local v1, "returnType":Ljavassist/CtClass;
    const-string v2, "write"

    .line 110
    .local v2, "mname":Ljava/lang/String;
    const/4 v6, 0x3

    new-array v3, v6, [Ljavassist/CtClass;

    iget-object v6, p0, Lorg/msgpack/template/builder/BuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    const-class v8, Lorg/msgpack/packer/Packer;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v6

    aput-object v6, v3, v11

    iget-object v6, p0, Lorg/msgpack/template/builder/BuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    const-class v8, Ljava/lang/Object;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v6

    aput-object v6, v3, v12

    const/4 v6, 0x2

    sget-object v8, Ljavassist/CtClass;->booleanType:Ljavassist/CtClass;

    aput-object v8, v3, v6

    .line 115
    .local v3, "paramTypes":[Ljavassist/CtClass;
    new-array v4, v12, [Ljavassist/CtClass;

    iget-object v6, p0, Lorg/msgpack/template/builder/BuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    const-class v8, Ljava/io/IOException;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v6

    aput-object v6, v4, v11

    .line 118
    .local v4, "exceptTypes":[Ljavassist/CtClass;
    sget-object v6, Lorg/msgpack/template/builder/BuildContext;->LOG:Ljava/util/logging/Logger;

    const-string v8, "compiling write method body: %s"

    new-array v9, v12, [Ljava/lang/Object;

    aput-object v5, v9, v11

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 119
    iget-object v6, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-static/range {v0 .. v6}, Ljavassist/CtNewMethod;->make(ILjavassist/CtClass;Ljava/lang/String;[Ljavassist/CtClass;[Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtMethod;

    move-result-object v7

    .line 121
    .local v7, "newCtMethod":Ljavassist/CtMethod;
    iget-object v6, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-virtual {v6, v7}, Ljavassist/CtClass;->addMethod(Ljavassist/CtMethod;)V

    .line 122
    sget-object v6, Lorg/msgpack/template/builder/BuildContext;->LOG:Ljava/util/logging/Logger;

    const-string v8, "finished generating write method in template class %s"

    new-array v9, v12, [Ljava/lang/Object;

    iget-object v10, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-virtual {v10}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 124
    return-void
.end method

.method protected abstract buildWriteMethodBody()Ljava/lang/String;
.end method

.method protected createClass()Ljava/lang/Class;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 154
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    iget-object v0, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    iget-object v1, p0, Lorg/msgpack/template/builder/BuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    invoke-virtual {v1}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getProtectionDomain()Ljava/security/ProtectionDomain;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljavassist/CtClass;->toClass(Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method protected getBuiltString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 176
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    iget-object v0, p0, Lorg/msgpack/template/builder/BuildContext;->stringBuilder:Ljava/lang/StringBuilder;

    if-nez v0, :cond_6

    .line 177
    const/4 v0, 0x0

    .line 179
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lorg/msgpack/template/builder/BuildContext;->stringBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method protected load(Ljava/lang/String;)Lorg/msgpack/template/Template;
    .registers 9
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 233
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_$$_Template"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 235
    .local v3, "tmplName":Ljava/lang/String;
    :try_start_13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 236
    .local v2, "tmplClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, v2}, Lorg/msgpack/template/builder/BuildContext;->buildInstance(Ljava/lang/Class;)Lorg/msgpack/template/Template;
    :try_end_22
    .catch Ljava/lang/ClassNotFoundException; {:try_start_13 .. :try_end_22} :catch_24
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_22} :catch_27

    move-result-object v4

    .line 238
    .end local v2    # "tmplClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_23
    return-object v4

    .line 237
    :catch_24
    move-exception v1

    .line 238
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    const/4 v4, 0x0

    goto :goto_23

    .line 239
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :catch_27
    move-exception v1

    .line 240
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->getBuiltString()Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, "code":Ljava/lang/String;
    if-eqz v0, :cond_5f

    .line 242
    sget-object v4, Lorg/msgpack/template/builder/BuildContext;->LOG:Ljava/util/logging/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "builder: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/logging/Logger;->severe(Ljava/lang/String;)V

    .line 243
    new-instance v4, Lorg/msgpack/template/builder/TemplateBuildException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cannot compile: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 245
    :cond_5f
    new-instance v4, Lorg/msgpack/template/builder/TemplateBuildException;

    invoke-direct {v4, v1}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method protected abstract loadTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;[Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[TT;[",
            "Lorg/msgpack/template/Template;",
            ")",
            "Lorg/msgpack/template/Template;"
        }
    .end annotation
.end method

.method protected primitiveReadName(Ljava/lang/Class;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 187
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_7

    .line 188
    const-string v0, "readBoolean"

    .line 204
    :goto_6
    return-object v0

    .line 189
    :cond_7
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_e

    .line 190
    const-string v0, "readByte"

    goto :goto_6

    .line 191
    :cond_e
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_15

    .line 192
    const-string v0, "readShort"

    goto :goto_6

    .line 193
    :cond_15
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_1c

    .line 194
    const-string v0, "readInt"

    goto :goto_6

    .line 195
    :cond_1c
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_23

    .line 196
    const-string v0, "readLong"

    goto :goto_6

    .line 197
    :cond_23
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_2a

    .line 198
    const-string v0, "readFloat"

    goto :goto_6

    .line 199
    :cond_2a
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_31

    .line 200
    const-string v0, "readDouble"

    goto :goto_6

    .line 201
    :cond_31
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_38

    .line 202
    const-string v0, "readInt"

    goto :goto_6

    .line 204
    :cond_38
    const/4 v0, 0x0

    goto :goto_6
.end method

.method protected primitiveWriteName(Ljava/lang/Class;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 183
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "write"

    return-object v0
.end method

.method protected reset(Ljava/lang/String;Z)V
    .registers 6
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "isWritten"    # Z

    .prologue
    .line 81
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    const/4 v0, 0x0

    .line 82
    .local v0, "tmplName":Ljava/lang/String;
    if-nez p2, :cond_3f

    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_$$_Template"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/msgpack/template/builder/BuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/msgpack/template/builder/BuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    invoke-virtual {v2}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->nextSeqId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 88
    :goto_36
    iget-object v1, p0, Lorg/msgpack/template/builder/BuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    invoke-virtual {v1, v0}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->makeCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    iput-object v1, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    .line 89
    return-void

    .line 86
    :cond_3f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_$$_Template"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_36
.end method

.method protected resetStringBuilder()V
    .registers 2

    .prologue
    .line 164
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/msgpack/template/builder/BuildContext;->stringBuilder:Ljava/lang/StringBuilder;

    .line 165
    return-void
.end method

.method protected saveClass(Ljava/lang/String;)V
    .registers 3
    .param p1, "directoryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    iget-object v0, p0, Lorg/msgpack/template/builder/BuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-virtual {v0, p1}, Ljavassist/CtClass;->writeFile(Ljava/lang/String;)V

    .line 159
    return-void
.end method

.method protected abstract setSuperClass()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation
.end method

.method protected write(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "directoryName"    # Ljava/lang/String;

    .prologue
    .line 212
    .local p0, "this":Lorg/msgpack/template/builder/BuildContext;, "Lorg/msgpack/template/builder/BuildContext<TT;>;"
    const/4 v2, 0x1

    :try_start_1
    invoke-virtual {p0, p1, v2}, Lorg/msgpack/template/builder/BuildContext;->reset(Ljava/lang/String;Z)V

    .line 213
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->buildClass()V

    .line 214
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->buildConstructor()V

    .line 215
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->buildMethodInit()V

    .line 216
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->buildWriteMethod()V

    .line 217
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->buildReadMethod()V

    .line 218
    invoke-virtual {p0, p2}, Lorg/msgpack/template/builder/BuildContext;->saveClass(Ljava/lang/String;)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_16} :catch_17

    .line 228
    return-void

    .line 219
    :catch_17
    move-exception v1

    .line 220
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BuildContext;->getBuiltString()Ljava/lang/String;

    move-result-object v0

    .line 221
    .local v0, "code":Ljava/lang/String;
    if-eqz v0, :cond_4f

    .line 222
    sget-object v2, Lorg/msgpack/template/builder/BuildContext;->LOG:Ljava/util/logging/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "builder: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->severe(Ljava/lang/String;)V

    .line 223
    new-instance v2, Lorg/msgpack/template/builder/TemplateBuildException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot compile: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 225
    :cond_4f
    new-instance v2, Lorg/msgpack/template/builder/TemplateBuildException;

    invoke-direct {v2, v1}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected abstract writeTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;[Lorg/msgpack/template/Template;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[TT;[",
            "Lorg/msgpack/template/Template;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation
.end method
