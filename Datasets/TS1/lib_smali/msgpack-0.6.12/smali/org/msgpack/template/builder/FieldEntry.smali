.class public abstract Lorg/msgpack/template/builder/FieldEntry;
.super Ljava/lang/Object;
.source "FieldEntry.java"


# instance fields
.field protected option:Lorg/msgpack/template/FieldOption;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 29
    sget-object v0, Lorg/msgpack/template/FieldOption;->IGNORE:Lorg/msgpack/template/FieldOption;

    invoke-direct {p0, v0}, Lorg/msgpack/template/builder/FieldEntry;-><init>(Lorg/msgpack/template/FieldOption;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/FieldOption;)V
    .registers 2
    .param p1, "option"    # Lorg/msgpack/template/FieldOption;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/msgpack/template/builder/FieldEntry;->option:Lorg/msgpack/template/FieldOption;

    .line 34
    return-void
.end method


# virtual methods
.method public arrayTypeToString(Ljava/lang/Class;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 76
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x1

    .line 77
    .local v1, "dim":I
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    .line 78
    .local v0, "baseType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_5
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_12

    .line 79
    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    .line 80
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 82
    :cond_12
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .local v3, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1f
    if-ge v2, v1, :cond_29

    .line 85
    const-string v4, "[]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 87
    :cond_29
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public abstract get(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public abstract getGenericType()Ljava/lang/reflect/Type;
.end method

.method public getJavaTypeName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 67
    invoke-virtual {p0}, Lorg/msgpack/template/builder/FieldEntry;->getType()Ljava/lang/Class;

    move-result-object v0

    .line 68
    .local v0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 69
    invoke-virtual {p0, v0}, Lorg/msgpack/template/builder/FieldEntry;->arrayTypeToString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    .line 71
    :goto_e
    return-object v1

    :cond_f
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_e
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public getOption()Lorg/msgpack/template/FieldOption;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lorg/msgpack/template/builder/FieldEntry;->option:Lorg/msgpack/template/FieldOption;

    return-object v0
.end method

.method public abstract getType()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end method

.method public isAvailable()Z
    .registers 3

    .prologue
    .line 45
    iget-object v0, p0, Lorg/msgpack/template/builder/FieldEntry;->option:Lorg/msgpack/template/FieldOption;

    sget-object v1, Lorg/msgpack/template/FieldOption;->IGNORE:Lorg/msgpack/template/FieldOption;

    if-eq v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isNotNullable()Z
    .registers 3

    .prologue
    .line 53
    iget-object v0, p0, Lorg/msgpack/template/builder/FieldEntry;->option:Lorg/msgpack/template/FieldOption;

    sget-object v1, Lorg/msgpack/template/FieldOption;->NOTNULLABLE:Lorg/msgpack/template/FieldOption;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isOptional()Z
    .registers 3

    .prologue
    .line 49
    iget-object v0, p0, Lorg/msgpack/template/builder/FieldEntry;->option:Lorg/msgpack/template/FieldOption;

    sget-object v1, Lorg/msgpack/template/FieldOption;->OPTIONAL:Lorg/msgpack/template/FieldOption;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public abstract set(Ljava/lang/Object;Ljava/lang/Object;)V
.end method

.method public setOption(Lorg/msgpack/template/FieldOption;)V
    .registers 2
    .param p1, "option"    # Lorg/msgpack/template/FieldOption;

    .prologue
    .line 41
    iput-object p1, p0, Lorg/msgpack/template/builder/FieldEntry;->option:Lorg/msgpack/template/FieldOption;

    .line 42
    return-void
.end method
