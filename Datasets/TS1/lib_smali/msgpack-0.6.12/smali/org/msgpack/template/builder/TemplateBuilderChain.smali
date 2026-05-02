.class public Lorg/msgpack/template/builder/TemplateBuilderChain;
.super Ljava/lang/Object;
.source "TemplateBuilderChain.java"


# static fields
.field private static final JAVASSIST_TEMPLATE_BUILDER_CLASS_NAME:Ljava/lang/String; = "org.msgpack.template.builder.JavassistTemplateBuilder"

.field private static final LOG:Ljava/util/logging/Logger;

.field private static final REFLECTION_TEMPLATE_BUILDER_CLASS_NAME:Ljava/lang/String; = "org.msgpack.template.builder.ReflectionTemplateBuilder"


# instance fields
.field protected forceBuilder:Lorg/msgpack/template/builder/TemplateBuilder;

.field protected templateBuilders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/msgpack/template/builder/TemplateBuilder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const-class v0, Lorg/msgpack/template/builder/TemplateBuilderChain;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/builder/TemplateBuilderChain;->LOG:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;)V
    .registers 3
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;

    .prologue
    .line 49
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/msgpack/template/builder/TemplateBuilderChain;-><init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/ClassLoader;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/ClassLoader;)V
    .registers 4
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;
    .param p2, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/msgpack/template/builder/TemplateBuilderChain;->templateBuilders:Ljava/util/List;

    .line 54
    invoke-virtual {p0, p1, p2}, Lorg/msgpack/template/builder/TemplateBuilderChain;->reset(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/ClassLoader;)V

    .line 55
    return-void
.end method

.method private static createForceTemplateBuilder(Ljava/lang/String;Lorg/msgpack/template/TemplateRegistry;Ljava/lang/ClassLoader;)Lorg/msgpack/template/builder/TemplateBuilder;
    .registers 9
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;
    .param p2, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 84
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 85
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Lorg/msgpack/template/TemplateRegistry;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Ljava/lang/ClassLoader;

    aput-object v5, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 87
    .local v1, "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/msgpack/template/builder/TemplateBuilder;
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_24} :catch_25

    .line 93
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    :goto_24
    return-object v3

    .line 88
    :catch_25
    move-exception v2

    .line 89
    .local v2, "e":Ljava/lang/Exception;
    sget-object v3, Lorg/msgpack/template/builder/TemplateBuilderChain;->LOG:Ljava/util/logging/Logger;

    sget-object v4, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-virtual {v3, v4}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v3

    if-eqz v3, :cond_39

    .line 90
    sget-object v3, Lorg/msgpack/template/builder/TemplateBuilderChain;->LOG:Ljava/util/logging/Logger;

    sget-object v4, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v5, "Failed to create a TemplateBuilder reflectively"

    invoke-virtual {v3, v4, v5, v2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 93
    :cond_39
    new-instance v3, Lorg/msgpack/template/builder/ReflectionTemplateBuilder;

    invoke-direct {v3, p1, p2}, Lorg/msgpack/template/builder/ReflectionTemplateBuilder;-><init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/ClassLoader;)V

    goto :goto_24
.end method

.method private static enableDynamicCodeGeneration()Z
    .registers 3

    .prologue
    .line 40
    invoke-static {}, Lorg/msgpack/util/android/DalvikVmChecker;->isDalvikVm()Z

    move-result v0

    if-nez v0, :cond_1a

    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v0

    const-string v1, "msgpack.dynamic-codegen.enabled"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method


# virtual methods
.method public getForceBuilder()Lorg/msgpack/template/builder/TemplateBuilder;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lorg/msgpack/template/builder/TemplateBuilderChain;->forceBuilder:Lorg/msgpack/template/builder/TemplateBuilder;

    return-object v0
.end method

.method protected reset(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/ClassLoader;)V
    .registers 7
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;
    .param p2, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 58
    if-nez p1, :cond_a

    .line 59
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "registry is null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 65
    :cond_a
    const/4 v1, 0x0

    .line 66
    .local v1, "forceBuilderClassName":Ljava/lang/String;
    invoke-static {}, Lorg/msgpack/template/builder/TemplateBuilderChain;->enableDynamicCodeGeneration()Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 67
    const-string v1, "org.msgpack.template.builder.JavassistTemplateBuilder"

    .line 73
    :goto_13
    invoke-static {v1, p1, p2}, Lorg/msgpack/template/builder/TemplateBuilderChain;->createForceTemplateBuilder(Ljava/lang/String;Lorg/msgpack/template/TemplateRegistry;Ljava/lang/ClassLoader;)Lorg/msgpack/template/builder/TemplateBuilder;

    move-result-object v2

    iput-object v2, p0, Lorg/msgpack/template/builder/TemplateBuilderChain;->forceBuilder:Lorg/msgpack/template/builder/TemplateBuilder;

    .line 74
    iget-object v0, p0, Lorg/msgpack/template/builder/TemplateBuilderChain;->forceBuilder:Lorg/msgpack/template/builder/TemplateBuilder;

    .line 75
    .local v0, "builder":Lorg/msgpack/template/builder/TemplateBuilder;
    iget-object v2, p0, Lorg/msgpack/template/builder/TemplateBuilderChain;->templateBuilders:Ljava/util/List;

    new-instance v3, Lorg/msgpack/template/builder/ArrayTemplateBuilder;

    invoke-direct {v3, p1}, Lorg/msgpack/template/builder/ArrayTemplateBuilder;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    iget-object v2, p0, Lorg/msgpack/template/builder/TemplateBuilderChain;->templateBuilders:Ljava/util/List;

    new-instance v3, Lorg/msgpack/template/builder/OrdinalEnumTemplateBuilder;

    invoke-direct {v3, p1}, Lorg/msgpack/template/builder/OrdinalEnumTemplateBuilder;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    iget-object v2, p0, Lorg/msgpack/template/builder/TemplateBuilderChain;->templateBuilders:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    iget-object v2, p0, Lorg/msgpack/template/builder/TemplateBuilderChain;->templateBuilders:Ljava/util/List;

    new-instance v3, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;

    invoke-direct {v3, p1}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    return-void

    .line 69
    .end local v0    # "builder":Lorg/msgpack/template/builder/TemplateBuilder;
    :cond_3f
    const-string v1, "org.msgpack.template.builder.ReflectionTemplateBuilder"

    goto :goto_13
.end method

.method public select(Ljava/lang/reflect/Type;Z)Lorg/msgpack/template/builder/TemplateBuilder;
    .registers 6
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .param p2, "hasAnnotation"    # Z

    .prologue
    .line 101
    iget-object v2, p0, Lorg/msgpack/template/builder/TemplateBuilderChain;->templateBuilders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/msgpack/template/builder/TemplateBuilder;

    .line 102
    .local v1, "tb":Lorg/msgpack/template/builder/TemplateBuilder;
    invoke-interface {v1, p1, p2}, Lorg/msgpack/template/builder/TemplateBuilder;->matchType(Ljava/lang/reflect/Type;Z)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 106
    .end local v1    # "tb":Lorg/msgpack/template/builder/TemplateBuilder;
    :goto_18
    return-object v1

    :cond_19
    const/4 v1, 0x0

    goto :goto_18
.end method
