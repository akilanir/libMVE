.class public Lorg/msgpack/template/builder/ReflectionTemplateBuilder;
.super Lorg/msgpack/template/builder/AbstractTemplateBuilder;
.source "ReflectionTemplateBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;,
        Lorg/msgpack/template/builder/ReflectionTemplateBuilder$FieldTemplateImpl;,
        Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    }
.end annotation


# static fields
.field private static LOG:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 37
    const-class v0, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/builder/ReflectionTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;)V
    .registers 3
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;

    .prologue
    .line 158
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/msgpack/template/builder/ReflectionTemplateBuilder;-><init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/ClassLoader;)V

    .line 159
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/ClassLoader;)V
    .registers 3
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;
    .param p2, "cl"    # Ljava/lang/ClassLoader;

    .prologue
    .line 162
    invoke-direct {p0, p1}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    .line 163
    return-void
.end method


# virtual methods
.method public buildTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;)Lorg/msgpack/template/Template;
    .registers 7
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
    .line 177
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    if-nez p2, :cond_1b

    .line 178
    new-instance v1, Ljava/lang/NullPointerException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "entries is null: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 181
    :cond_1b
    invoke-virtual {p0, p2}, Lorg/msgpack/template/builder/ReflectionTemplateBuilder;->toTemplates([Lorg/msgpack/template/builder/FieldEntry;)[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;

    move-result-object v0

    .line 182
    .local v0, "tmpls":[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    new-instance v1, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;

    invoke-direct {v1, p1, v0}, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionClassTemplate;-><init>(Ljava/lang/Class;[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;)V

    return-object v1
.end method

.method public matchType(Ljava/lang/reflect/Type;Z)Z
    .registers 8
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .param p2, "hasAnnotation"    # Z

    .prologue
    .line 167
    move-object v1, p1

    check-cast v1, Ljava/lang/Class;

    .line 168
    .local v1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v1, p2}, Lorg/msgpack/template/builder/ReflectionTemplateBuilder;->matchAtClassTemplateBuilder(Ljava/lang/Class;Z)Z

    move-result v0

    .line 169
    .local v0, "matched":Z
    if-eqz v0, :cond_2f

    sget-object v2, Lorg/msgpack/template/builder/ReflectionTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 170
    sget-object v2, Lorg/msgpack/template/builder/ReflectionTemplateBuilder;->LOG:Ljava/util/logging/Logger;

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

    .line 172
    :cond_2f
    return v0
.end method

.method protected toTemplates([Lorg/msgpack/template/builder/FieldEntry;)[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    .registers 13
    .param p1, "entries"    # [Lorg/msgpack/template/builder/FieldEntry;

    .prologue
    .line 187
    move-object v0, p1

    .local v0, "arr$":[Lorg/msgpack/template/builder/FieldEntry;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_3
    if-ge v4, v5, :cond_1e

    aget-object v1, v0, v4

    .line 188
    .local v1, "entry":Lorg/msgpack/template/builder/FieldEntry;
    check-cast v1, Lorg/msgpack/template/builder/DefaultFieldEntry;

    .end local v1    # "entry":Lorg/msgpack/template/builder/FieldEntry;
    invoke-virtual {v1}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getField()Ljava/lang/reflect/Field;

    move-result-object v2

    .line 189
    .local v2, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    .line 190
    .local v6, "mod":I
    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v9

    if-nez v9, :cond_1b

    .line 191
    const/4 v9, 0x1

    invoke-virtual {v2, v9}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 187
    :cond_1b
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 195
    .end local v2    # "field":Ljava/lang/reflect/Field;
    .end local v6    # "mod":I
    :cond_1e
    array-length v9, p1

    new-array v8, v9, [Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;

    .line 196
    .local v8, "templates":[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_22
    array-length v9, p1

    if-ge v3, v9, :cond_3b

    .line 197
    aget-object v1, p1, v3

    .line 199
    .restart local v1    # "entry":Lorg/msgpack/template/builder/FieldEntry;
    iget-object v9, p0, Lorg/msgpack/template/builder/ReflectionTemplateBuilder;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v1}, Lorg/msgpack/template/builder/FieldEntry;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v7

    .line 200
    .local v7, "template":Lorg/msgpack/template/Template;
    new-instance v9, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$FieldTemplateImpl;

    invoke-direct {v9, v1, v7}, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$FieldTemplateImpl;-><init>(Lorg/msgpack/template/builder/FieldEntry;Lorg/msgpack/template/Template;)V

    aput-object v9, v8, v3

    .line 196
    add-int/lit8 v3, v3, 0x1

    goto :goto_22

    .line 202
    .end local v1    # "entry":Lorg/msgpack/template/builder/FieldEntry;
    .end local v7    # "template":Lorg/msgpack/template/Template;
    :cond_3b
    return-object v8
.end method
