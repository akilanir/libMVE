.class public Lorg/msgpack/template/builder/JavassistTemplateBuilder;
.super Lorg/msgpack/template/builder/AbstractTemplateBuilder;
.source "JavassistTemplateBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/msgpack/template/builder/JavassistTemplateBuilder$JavassistTemplate;
    }
.end annotation


# static fields
.field private static LOG:Ljava/util/logging/Logger;


# instance fields
.field protected loader:Ljava/lang/ClassLoader;

.field protected pool:Ljavassist/ClassPool;

.field protected seqId:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 38
    const-class v0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;)V
    .registers 3
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;-><init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/ClassLoader;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/ClassLoader;)V
    .registers 8
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;
    .param p2, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    .line 52
    const/4 v2, 0x0

    iput v2, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->seqId:I

    .line 62
    new-instance v2, Ljavassist/ClassPool;

    invoke-direct {v2}, Ljavassist/ClassPool;-><init>()V

    iput-object v2, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->pool:Ljavassist/ClassPool;

    .line 63
    iget-object v2, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->pool:Ljavassist/ClassPool;

    new-instance v3, Ljavassist/ClassClassPath;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-direct {v3, v4}, Ljavassist/ClassClassPath;-><init>(Ljava/lang/Class;)V

    invoke-virtual {v2, v3}, Ljavassist/ClassPool;->appendClassPath(Ljavassist/ClassPath;)Ljavassist/ClassPath;

    .line 64
    const/4 v0, 0x0

    .line 65
    .local v0, "appended":Z
    iput-object p2, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->loader:Ljava/lang/ClassLoader;

    .line 66
    iget-object v2, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->loader:Ljava/lang/ClassLoader;

    if-nez v2, :cond_2a

    .line 67
    iget-object v2, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->pool:Ljavassist/ClassPool;

    invoke-virtual {v2}, Ljavassist/ClassPool;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    iput-object v2, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->loader:Ljava/lang/ClassLoader;

    .line 71
    :cond_2a
    :try_start_2a
    iget-object v2, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->loader:Ljava/lang/ClassLoader;

    if-eqz v2, :cond_3b

    .line 72
    iget-object v2, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->pool:Ljavassist/ClassPool;

    new-instance v3, Ljavassist/LoaderClassPath;

    iget-object v4, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->loader:Ljava/lang/ClassLoader;

    invoke-direct {v3, v4}, Ljavassist/LoaderClassPath;-><init>(Ljava/lang/ClassLoader;)V

    invoke-virtual {v2, v3}, Ljavassist/ClassPool;->appendClassPath(Ljavassist/ClassPath;)Ljavassist/ClassPath;
    :try_end_3a
    .catch Ljava/lang/SecurityException; {:try_start_2a .. :try_end_3a} :catch_43

    .line 73
    const/4 v0, 0x1

    .line 80
    :cond_3b
    :goto_3b
    if-nez v0, :cond_42

    .line 81
    iget-object v2, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->pool:Ljavassist/ClassPool;

    invoke-virtual {v2}, Ljavassist/ClassPool;->appendSystemPath()Ljavassist/ClassPath;

    .line 83
    :cond_42
    return-void

    .line 75
    :catch_43
    move-exception v1

    .line 76
    .local v1, "e":Ljava/lang/SecurityException;
    sget-object v2, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 77
    sget-object v2, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v4, "Cannot append a search path of classloader"

    invoke-virtual {v2, v3, v4, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3b
.end method

.method private toTemplate([Lorg/msgpack/template/builder/FieldEntry;)[Lorg/msgpack/template/Template;
    .registers 8
    .param p1, "from"    # [Lorg/msgpack/template/builder/FieldEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/msgpack/template/builder/FieldEntry;",
            ")[",
            "Lorg/msgpack/template/Template",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 123
    array-length v4, p1

    new-array v3, v4, [Lorg/msgpack/template/Template;

    .line 124
    .local v3, "tmpls":[Lorg/msgpack/template/Template;, "[Lorg/msgpack/template/Template<*>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    array-length v4, p1

    if-ge v1, v4, :cond_22

    .line 125
    aget-object v0, p1, v1

    .line 126
    .local v0, "e":Lorg/msgpack/template/builder/FieldEntry;
    invoke-virtual {v0}, Lorg/msgpack/template/builder/FieldEntry;->isAvailable()Z

    move-result v4

    if-nez v4, :cond_15

    .line 127
    const/4 v4, 0x0

    aput-object v4, v3, v1

    .line 124
    :goto_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 129
    :cond_15
    iget-object v4, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v0}, Lorg/msgpack/template/builder/FieldEntry;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v2

    .line 130
    .local v2, "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<*>;"
    aput-object v2, v3, v1

    goto :goto_12

    .line 133
    .end local v0    # "e":Lorg/msgpack/template/builder/FieldEntry;
    .end local v2    # "tmpl":Lorg/msgpack/template/Template;, "Lorg/msgpack/template/Template<*>;"
    :cond_22
    return-object v3
.end method

.method private writeTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;Ljava/lang/String;)V
    .registers 6
    .param p2, "entries"    # [Lorg/msgpack/template/builder/FieldEntry;
    .param p3, "directoryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Lorg/msgpack/template/builder/FieldEntry;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 146
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p2}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->toTemplate([Lorg/msgpack/template/builder/FieldEntry;)[Lorg/msgpack/template/Template;

    move-result-object v1

    .line 147
    .local v1, "tmpls":[Lorg/msgpack/template/Template;
    invoke-virtual {p0}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->createBuildContext()Lorg/msgpack/template/builder/BuildContext;

    move-result-object v0

    .line 148
    .local v0, "bc":Lorg/msgpack/template/builder/BuildContext;
    invoke-virtual {v0, p1, p2, v1, p3}, Lorg/msgpack/template/builder/BuildContext;->writeTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;[Lorg/msgpack/template/Template;Ljava/lang/String;)V

    .line 149
    return-void
.end method


# virtual methods
.method public addClassLoader(Ljava/lang/ClassLoader;)V
    .registers 4
    .param p1, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 96
    iget-object v0, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->pool:Ljavassist/ClassPool;

    new-instance v1, Ljavassist/LoaderClassPath;

    invoke-direct {v1, p1}, Ljavassist/LoaderClassPath;-><init>(Ljava/lang/ClassLoader;)V

    invoke-virtual {v0, v1}, Ljavassist/ClassPool;->appendClassPath(Ljavassist/ClassPath;)Ljavassist/ClassPath;

    .line 97
    return-void
.end method

.method public buildTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;)Lorg/msgpack/template/Template;
    .registers 6
    .param p2, "entries"    # [Lorg/msgpack/template/builder/FieldEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;[",
            "Lorg/msgpack/template/builder/FieldEntry;",
            ")",
            "Lorg/msgpack/template/Template",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 117
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p2}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->toTemplate([Lorg/msgpack/template/builder/FieldEntry;)[Lorg/msgpack/template/Template;

    move-result-object v1

    .line 118
    .local v1, "tmpls":[Lorg/msgpack/template/Template;, "[Lorg/msgpack/template/Template<*>;"
    invoke-virtual {p0}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->createBuildContext()Lorg/msgpack/template/builder/BuildContext;

    move-result-object v0

    .line 119
    .local v0, "bc":Lorg/msgpack/template/builder/BuildContext;
    invoke-virtual {v0, p1, p2, v1}, Lorg/msgpack/template/builder/BuildContext;->buildTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;[Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;

    move-result-object v2

    return-object v2
.end method

.method protected createBuildContext()Lorg/msgpack/template/builder/BuildContext;
    .registers 2

    .prologue
    .line 112
    new-instance v0, Lorg/msgpack/template/builder/DefaultBuildContext;

    invoke-direct {v0, p0}, Lorg/msgpack/template/builder/DefaultBuildContext;-><init>(Lorg/msgpack/template/builder/JavassistTemplateBuilder;)V

    return-object v0
.end method

.method protected getClassLoader()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 177
    iget-object v0, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->loader:Ljava/lang/ClassLoader;

    return-object v0
.end method

.method protected getCtClass(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 3
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->pool:Ljavassist/ClassPool;

    invoke-virtual {v0, p1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public loadTemplate(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;
    .registers 13
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lorg/msgpack/template/Template",
            "<TT;>;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 155
    move-object v5, p1

    check-cast v5, Ljava/lang/Class;

    .line 159
    .local v5, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_4
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "_$$_Template"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 160
    .local v6, "tmplName":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 161
    .local v1, "cl":Ljava/lang/ClassLoader;
    if-eqz v1, :cond_38

    .line 162
    invoke-virtual {v1, v6}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_24
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_24} :catch_39

    .line 169
    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getFieldOption(Ljava/lang/Class;)Lorg/msgpack/template/FieldOption;

    move-result-object v4

    .line 170
    .local v4, "implicitOption":Lorg/msgpack/template/FieldOption;
    invoke-virtual {p0, v5, v4}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->toFieldEntries(Ljava/lang/Class;Lorg/msgpack/template/FieldOption;)[Lorg/msgpack/template/builder/FieldEntry;

    move-result-object v3

    .line 171
    .local v3, "entries":[Lorg/msgpack/template/builder/FieldEntry;
    invoke-direct {p0, v3}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->toTemplate([Lorg/msgpack/template/builder/FieldEntry;)[Lorg/msgpack/template/Template;

    move-result-object v7

    .line 172
    .local v7, "tmpls":[Lorg/msgpack/template/Template;, "[Lorg/msgpack/template/Template<*>;"
    invoke-virtual {p0}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->createBuildContext()Lorg/msgpack/template/builder/BuildContext;

    move-result-object v0

    .line 173
    .local v0, "bc":Lorg/msgpack/template/builder/BuildContext;
    invoke-virtual {v0, v5, v3, v7}, Lorg/msgpack/template/builder/BuildContext;->loadTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;[Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;

    move-result-object v8

    .end local v0    # "bc":Lorg/msgpack/template/builder/BuildContext;
    .end local v1    # "cl":Ljava/lang/ClassLoader;
    .end local v3    # "entries":[Lorg/msgpack/template/builder/FieldEntry;
    .end local v4    # "implicitOption":Lorg/msgpack/template/FieldOption;
    .end local v6    # "tmplName":Ljava/lang/String;
    .end local v7    # "tmpls":[Lorg/msgpack/template/Template;, "[Lorg/msgpack/template/Template<*>;"
    :cond_38
    :goto_38
    return-object v8

    .line 166
    :catch_39
    move-exception v2

    .line 167
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    goto :goto_38
.end method

.method protected makeCtClass(Ljava/lang/String;)Ljavassist/CtClass;
    .registers 3
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 100
    iget-object v0, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->pool:Ljavassist/ClassPool;

    invoke-virtual {v0, p1}, Ljavassist/ClassPool;->makeClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public matchType(Ljava/lang/reflect/Type;Z)Z
    .registers 8
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .param p2, "hasAnnotation"    # Z

    .prologue
    .line 87
    move-object v1, p1

    check-cast v1, Ljava/lang/Class;

    .line 88
    .local v1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v1, p2}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->matchAtClassTemplateBuilder(Ljava/lang/Class;Z)Z

    move-result v0

    .line 89
    .local v0, "matched":Z
    if-eqz v0, :cond_2f

    sget-object v2, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 90
    sget-object v2, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "matched type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 92
    :cond_2f
    return v0
.end method

.method protected nextSeqId()I
    .registers 3

    .prologue
    .line 108
    iget v0, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->seqId:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->seqId:I

    return v0
.end method

.method public writeTemplate(Ljava/lang/reflect/Type;Ljava/lang/String;)V
    .registers 6
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .param p2, "directoryName"    # Ljava/lang/String;

    .prologue
    .line 138
    move-object v2, p1

    check-cast v2, Ljava/lang/Class;

    .line 139
    .local v2, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, v2}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->checkClassValidation(Ljava/lang/Class;)V

    .line 140
    invoke-virtual {p0, v2}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getFieldOption(Ljava/lang/Class;)Lorg/msgpack/template/FieldOption;

    move-result-object v1

    .line 141
    .local v1, "implicitOption":Lorg/msgpack/template/FieldOption;
    invoke-virtual {p0, v2, v1}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->toFieldEntries(Ljava/lang/Class;Lorg/msgpack/template/FieldOption;)[Lorg/msgpack/template/builder/FieldEntry;

    move-result-object v0

    .line 142
    .local v0, "entries":[Lorg/msgpack/template/builder/FieldEntry;
    invoke-direct {p0, v2, v0, p2}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->writeTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;Ljava/lang/String;)V

    .line 143
    return-void
.end method
