.class public Lorg/msgpack/template/builder/JavassistBeansTemplateBuilder;
.super Lorg/msgpack/template/builder/JavassistTemplateBuilder;
.source "JavassistBeansTemplateBuilder.java"


# static fields
.field private static final LOG:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 11
    const-class v0, Lorg/msgpack/template/builder/JavassistBeansTemplateBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/builder/JavassistBeansTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;)V
    .registers 2
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    .line 15
    return-void
.end method


# virtual methods
.method protected createBuildContext()Lorg/msgpack/template/builder/BuildContext;
    .registers 2

    .prologue
    .line 29
    new-instance v0, Lorg/msgpack/template/builder/BeansBuildContext;

    invoke-direct {v0, p0}, Lorg/msgpack/template/builder/BeansBuildContext;-><init>(Lorg/msgpack/template/builder/JavassistTemplateBuilder;)V

    return-object v0
.end method

.method public matchType(Ljava/lang/reflect/Type;Z)Z
    .registers 8
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .param p2, "hasAnnotation"    # Z

    .prologue
    .line 19
    move-object v1, p1

    check-cast v1, Ljava/lang/Class;

    .line 20
    .local v1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v1, p2}, Lorg/msgpack/template/builder/JavassistBeansTemplateBuilder;->matchAtClassTemplateBuilder(Ljava/lang/Class;Z)Z

    move-result v0

    .line 21
    .local v0, "matched":Z
    if-eqz v0, :cond_2f

    sget-object v2, Lorg/msgpack/template/builder/JavassistBeansTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 22
    sget-object v2, Lorg/msgpack/template/builder/JavassistBeansTemplateBuilder;->LOG:Ljava/util/logging/Logger;

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

    .line 24
    :cond_2f
    return v0
.end method
