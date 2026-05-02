.class public Lorg/msgpack/template/builder/OrdinalEnumTemplateBuilder;
.super Lorg/msgpack/template/builder/AbstractTemplateBuilder;
.source "OrdinalEnumTemplateBuilder.java"


# static fields
.field private static final LOG:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    const-class v0, Lorg/msgpack/template/builder/OrdinalEnumTemplateBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/builder/OrdinalEnumTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;)V
    .registers 2
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    .line 35
    return-void
.end method


# virtual methods
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
    .line 49
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fatal error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public buildTemplate(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;
    .registers 4
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/TemplateBuildException;
        }
    .end annotation

    .prologue
    .line 55
    move-object v0, p1

    check-cast v0, Ljava/lang/Class;

    .line 56
    .local v0, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, v0}, Lorg/msgpack/template/builder/OrdinalEnumTemplateBuilder;->checkOrdinalEnumValidation(Ljava/lang/Class;)V

    .line 57
    new-instance v1, Lorg/msgpack/template/OrdinalEnumTemplate;

    invoke-direct {v1, v0}, Lorg/msgpack/template/OrdinalEnumTemplate;-><init>(Ljava/lang/Class;)V

    return-object v1
.end method

.method protected checkOrdinalEnumValidation(Ljava/lang/Class;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 61
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->isEnum()Z

    move-result v0

    if-nez v0, :cond_23

    .line 62
    new-instance v0, Lorg/msgpack/template/builder/TemplateBuildException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "tried to build ordinal enum template of non-enum class: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :cond_23
    return-void
.end method

.method public matchType(Ljava/lang/reflect/Type;Z)Z
    .registers 8
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .param p2, "hasAnnotation"    # Z

    .prologue
    .line 39
    move-object v1, p1

    check-cast v1, Ljava/lang/Class;

    .line 40
    .local v1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v1, p2}, Lorg/msgpack/template/builder/OrdinalEnumTemplateBuilder;->matchAtOrdinalEnumTemplateBuilder(Ljava/lang/Class;Z)Z

    move-result v0

    .line 41
    .local v0, "matched":Z
    if-eqz v0, :cond_2f

    sget-object v2, Lorg/msgpack/template/builder/OrdinalEnumTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 42
    sget-object v2, Lorg/msgpack/template/builder/OrdinalEnumTemplateBuilder;->LOG:Ljava/util/logging/Logger;

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

    .line 44
    :cond_2f
    return v0
.end method
