.class public Lorg/msgpack/template/builder/BeansBuildContext;
.super Lorg/msgpack/template/builder/BuildContext;
.source "BeansBuildContext.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/msgpack/template/builder/BuildContext",
        "<",
        "Lorg/msgpack/template/builder/BeansFieldEntry;",
        ">;"
    }
.end annotation


# instance fields
.field protected entries:[Lorg/msgpack/template/builder/BeansFieldEntry;

.field protected origClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected origName:Ljava/lang/String;

.field protected templates:[Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/msgpack/template/Template",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/msgpack/template/builder/JavassistTemplateBuilder;)V
    .registers 2
    .param p1, "director"    # Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lorg/msgpack/template/builder/BuildContext;-><init>(Lorg/msgpack/template/builder/JavassistTemplateBuilder;)V

    .line 44
    return-void
.end method


# virtual methods
.method protected buildConstructor()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 63
    const/4 v1, 0x2

    new-array v1, v1, [Ljavassist/CtClass;

    iget-object v2, p0, Lorg/msgpack/template/builder/BeansBuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    const-class v3, Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v2

    aput-object v2, v1, v6

    const/4 v2, 0x1

    iget-object v3, p0, Lorg/msgpack/template/builder/BeansBuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-class v5, Lorg/msgpack/template/Template;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "[]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v3

    aput-object v3, v1, v2

    new-array v2, v6, [Ljavassist/CtClass;

    iget-object v3, p0, Lorg/msgpack/template/builder/BeansBuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-static {v1, v2, v3}, Ljavassist/CtNewConstructor;->make([Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtClass;)Ljavassist/CtConstructor;

    move-result-object v0

    .line 68
    .local v0, "newCtCons":Ljavassist/CtConstructor;
    iget-object v1, p0, Lorg/msgpack/template/builder/BeansBuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-virtual {v1, v0}, Ljavassist/CtClass;->addConstructor(Ljavassist/CtConstructor;)V

    .line 69
    return-void
.end method

.method protected buildInstance(Ljava/lang/Class;)Lorg/msgpack/template/Template;
    .registers 9
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

    .prologue
    .local p1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 73
    new-array v2, v6, [Ljava/lang/Class;

    const-class v3, Ljava/lang/Class;

    aput-object v3, v2, v4

    const-class v3, [Lorg/msgpack/template/Template;

    aput-object v3, v2, v5

    invoke-virtual {p1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 74
    .local v0, "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v2, v6, [Ljava/lang/Object;

    iget-object v3, p0, Lorg/msgpack/template/builder/BeansBuildContext;->origClass:Ljava/lang/Class;

    aput-object v3, v2, v4

    iget-object v3, p0, Lorg/msgpack/template/builder/BeansBuildContext;->templates:[Lorg/msgpack/template/Template;

    aput-object v3, v2, v5

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 75
    .local v1, "tmpl":Ljava/lang/Object;
    check-cast v1, Lorg/msgpack/template/Template;

    .end local v1    # "tmpl":Ljava/lang/Object;
    return-object v1
.end method

.method protected buildMethodInit()V
    .registers 1

    .prologue
    .line 79
    return-void
.end method

.method protected buildReadMethodBody()Ljava/lang/String;
    .registers 11

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 126
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BeansBuildContext;->resetStringBuilder()V

    .line 127
    const-string v3, "{ "

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 129
    const-string v3, "if(!$3 && $1.trySkipNil()) {"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 130
    const-string v3, "  return null;"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 131
    const-string v3, "}"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 133
    const-string v3, "%s _$$_t;"

    new-array v4, v8, [Ljava/lang/Object;

    iget-object v5, p0, Lorg/msgpack/template/builder/BeansBuildContext;->origName:Ljava/lang/String;

    aput-object v5, v4, v7

    invoke-virtual {p0, v3, v4}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 134
    const-string v3, "if($2 == null) {"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 135
    const-string v3, "  _$$_t = new %s();"

    new-array v4, v8, [Ljava/lang/Object;

    iget-object v5, p0, Lorg/msgpack/template/builder/BeansBuildContext;->origName:Ljava/lang/String;

    aput-object v5, v4, v7

    invoke-virtual {p0, v3, v4}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 136
    const-string v3, "} else {"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 137
    const-string v3, "  _$$_t = (%s)$2;"

    new-array v4, v8, [Ljava/lang/Object;

    iget-object v5, p0, Lorg/msgpack/template/builder/BeansBuildContext;->origName:Ljava/lang/String;

    aput-object v5, v4, v7

    invoke-virtual {p0, v3, v4}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 138
    const-string v3, "}"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 140
    const-string v3, "$1.readArrayBegin();"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 142
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_50
    iget-object v3, p0, Lorg/msgpack/template/builder/BeansBuildContext;->entries:[Lorg/msgpack/template/builder/BeansFieldEntry;

    array-length v3, v3

    if-ge v1, v3, :cond_cf

    .line 143
    iget-object v3, p0, Lorg/msgpack/template/builder/BeansBuildContext;->entries:[Lorg/msgpack/template/builder/BeansFieldEntry;

    aget-object v0, v3, v1

    .line 145
    .local v0, "e":Lorg/msgpack/template/builder/BeansFieldEntry;
    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->isAvailable()Z

    move-result v3

    if-nez v3, :cond_67

    .line 146
    const-string v3, "$1.skip();"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 142
    :cond_64
    :goto_64
    add-int/lit8 v1, v1, 0x1

    goto :goto_50

    .line 150
    :cond_67
    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->isOptional()Z

    move-result v3

    if-eqz v3, :cond_84

    .line 151
    const-string v3, "if($1.trySkipNil()) {"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 152
    const-string v3, "_$$_t.%s(null);"

    new-array v4, v8, [Ljava/lang/Object;

    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getSetterName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-virtual {p0, v3, v4}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 153
    const-string v3, "} else {"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 156
    :cond_84
    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getType()Ljava/lang/Class;

    move-result-object v2

    .line 157
    .local v2, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v3

    if-eqz v3, :cond_ad

    .line 158
    const-string v3, "_$$_t.%s( $1.%s() );"

    new-array v4, v9, [Ljava/lang/Object;

    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getSetterName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-virtual {p0, v2}, Lorg/msgpack/template/builder/BeansBuildContext;->primitiveReadName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-virtual {p0, v3, v4}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 165
    :goto_a1
    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->isOptional()Z

    move-result v3

    if-eqz v3, :cond_64

    .line 166
    const-string v3, "}"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    goto :goto_64

    .line 160
    :cond_ad
    const-string v3, "_$$_t.%s( (%s)this.templates[%d].read($1, _$$_t.%s()) );"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getSetterName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getJavaTypeName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v9

    const/4 v5, 0x3

    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getGetterName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {p0, v3, v4}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_a1

    .line 170
    .end local v0    # "e":Lorg/msgpack/template/builder/BeansFieldEntry;
    .end local v2    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_cf
    const-string v3, "$1.readArrayEnd();"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 171
    const-string v3, "return _$$_t;"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 173
    const-string v3, "}"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 175
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BeansBuildContext;->getBuiltString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public buildTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/BeansFieldEntry;[Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;
    .registers 5
    .param p2, "entries"    # [Lorg/msgpack/template/builder/BeansFieldEntry;
    .param p3, "templates"    # [Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Lorg/msgpack/template/builder/BeansFieldEntry;",
            "[",
            "Lorg/msgpack/template/Template;",
            ")",
            "Lorg/msgpack/template/Template;"
        }
    .end annotation

    .prologue
    .line 48
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iput-object p2, p0, Lorg/msgpack/template/builder/BeansBuildContext;->entries:[Lorg/msgpack/template/builder/BeansFieldEntry;

    .line 49
    iput-object p3, p0, Lorg/msgpack/template/builder/BeansBuildContext;->templates:[Lorg/msgpack/template/Template;

    .line 50
    iput-object p1, p0, Lorg/msgpack/template/builder/BeansBuildContext;->origClass:Ljava/lang/Class;

    .line 51
    iget-object v0, p0, Lorg/msgpack/template/builder/BeansBuildContext;->origClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/BeansBuildContext;->origName:Ljava/lang/String;

    .line 52
    iget-object v0, p0, Lorg/msgpack/template/builder/BeansBuildContext;->origName:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/msgpack/template/builder/BeansBuildContext;->build(Ljava/lang/String;)Lorg/msgpack/template/Template;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic buildTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;[Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;
    .registers 5
    .param p1, "x0"    # Ljava/lang/Class;
    .param p2, "x1"    # [Lorg/msgpack/template/builder/FieldEntry;
    .param p3, "x2"    # [Lorg/msgpack/template/Template;

    .prologue
    .line 32
    check-cast p2, [Lorg/msgpack/template/builder/BeansFieldEntry;

    .end local p2    # "x1":[Lorg/msgpack/template/builder/FieldEntry;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/BeansFieldEntry;[Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;

    move-result-object v0

    return-object v0
.end method

.method protected buildWriteMethodBody()Ljava/lang/String;
    .registers 10

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 83
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BeansBuildContext;->resetStringBuilder()V

    .line 84
    const-string v3, "{"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 86
    const-string v3, "if($2 == null) {"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 87
    const-string v3, "  if($3) {"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 88
    const-string v3, "    throw new %s(\"Attempted to write null\");"

    new-array v4, v7, [Ljava/lang/Object;

    const-class v5, Lorg/msgpack/MessageTypeException;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0, v3, v4}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 89
    const-string v3, "  }"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 90
    const-string v3, "  $1.writeNil();"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 91
    const-string v3, "  return;"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 92
    const-string v3, "}"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 94
    const-string v3, "%s _$$_t = (%s)$2;"

    new-array v4, v8, [Ljava/lang/Object;

    iget-object v5, p0, Lorg/msgpack/template/builder/BeansBuildContext;->origName:Ljava/lang/String;

    aput-object v5, v4, v6

    iget-object v5, p0, Lorg/msgpack/template/builder/BeansBuildContext;->origName:Ljava/lang/String;

    aput-object v5, v4, v7

    invoke-virtual {p0, v3, v4}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 95
    const-string v3, "$1.writeArrayBegin(%d);"

    new-array v4, v7, [Ljava/lang/Object;

    iget-object v5, p0, Lorg/msgpack/template/builder/BeansBuildContext;->entries:[Lorg/msgpack/template/builder/BeansFieldEntry;

    array-length v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0, v3, v4}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 97
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_58
    iget-object v3, p0, Lorg/msgpack/template/builder/BeansBuildContext;->entries:[Lorg/msgpack/template/builder/BeansFieldEntry;

    array-length v3, v3

    if-ge v1, v3, :cond_d3

    .line 98
    iget-object v3, p0, Lorg/msgpack/template/builder/BeansBuildContext;->entries:[Lorg/msgpack/template/builder/BeansFieldEntry;

    aget-object v0, v3, v1

    .line 99
    .local v0, "e":Lorg/msgpack/template/builder/BeansFieldEntry;
    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->isAvailable()Z

    move-result v3

    if-nez v3, :cond_6f

    .line 100
    const-string v3, "$1.writeNil();"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 97
    :goto_6c
    add-int/lit8 v1, v1, 0x1

    goto :goto_58

    .line 103
    :cond_6f
    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getType()Ljava/lang/Class;

    move-result-object v2

    .line 104
    .local v2, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v3

    if-eqz v3, :cond_8d

    .line 105
    const-string v3, "$1.%s(_$$_t.%s());"

    new-array v4, v8, [Ljava/lang/Object;

    invoke-virtual {p0, v2}, Lorg/msgpack/template/builder/BeansBuildContext;->primitiveWriteName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getGetterName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-virtual {p0, v3, v4}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_6c

    .line 107
    :cond_8d
    const-string v3, "if(_$$_t.%s() == null) {"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getGetterName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0, v3, v4}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 108
    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->isNotNullable()Z

    move-result v3

    if-eqz v3, :cond_cd

    .line 109
    const-string v3, "throw new %s();"

    new-array v4, v7, [Ljava/lang/Object;

    const-class v5, Lorg/msgpack/MessageTypeException;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0, v3, v4}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 113
    :goto_af
    const-string v3, "} else {"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 114
    const-string v3, "  this.templates[%d].write($1, _$$_t.%s());"

    new-array v4, v8, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {v0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getGetterName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-virtual {p0, v3, v4}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 115
    const-string v3, "}"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    goto :goto_6c

    .line 111
    :cond_cd
    const-string v3, "$1.writeNil();"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    goto :goto_af

    .line 119
    .end local v0    # "e":Lorg/msgpack/template/builder/BeansFieldEntry;
    .end local v2    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_d3
    const-string v3, "$1.writeArrayEnd();"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 120
    const-string v3, "}"

    invoke-virtual {p0, v3}, Lorg/msgpack/template/builder/BeansBuildContext;->buildString(Ljava/lang/String;)V

    .line 121
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BeansBuildContext;->getBuiltString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public loadTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/BeansFieldEntry;[Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;
    .registers 5
    .param p2, "entries"    # [Lorg/msgpack/template/builder/BeansFieldEntry;
    .param p3, "templates"    # [Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Lorg/msgpack/template/builder/BeansFieldEntry;",
            "[",
            "Lorg/msgpack/template/Template;",
            ")",
            "Lorg/msgpack/template/Template;"
        }
    .end annotation

    .prologue
    .line 187
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic loadTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;[Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;
    .registers 5
    .param p1, "x0"    # Ljava/lang/Class;
    .param p2, "x1"    # [Lorg/msgpack/template/builder/FieldEntry;
    .param p3, "x2"    # [Lorg/msgpack/template/Template;

    .prologue
    .line 32
    check-cast p2, [Lorg/msgpack/template/builder/BeansFieldEntry;

    .end local p2    # "x1":[Lorg/msgpack/template/builder/FieldEntry;
    invoke-virtual {p0, p1, p2, p3}, Lorg/msgpack/template/builder/BeansBuildContext;->loadTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/BeansFieldEntry;[Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;

    move-result-object v0

    return-object v0
.end method

.method protected setSuperClass()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lorg/msgpack/template/builder/BeansBuildContext;->tmplCtClass:Ljavassist/CtClass;

    iget-object v1, p0, Lorg/msgpack/template/builder/BeansBuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    const-class v2, Lorg/msgpack/template/builder/JavassistTemplateBuilder$JavassistTemplate;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavassist/CtClass;->setSuperclass(Ljavassist/CtClass;)V

    .line 58
    return-void
.end method

.method public writeTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/BeansFieldEntry;[Lorg/msgpack/template/Template;Ljava/lang/String;)V
    .registers 7
    .param p2, "entries"    # [Lorg/msgpack/template/builder/BeansFieldEntry;
    .param p3, "templates"    # [Lorg/msgpack/template/Template;
    .param p4, "directoryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Lorg/msgpack/template/builder/BeansFieldEntry;",
            "[",
            "Lorg/msgpack/template/Template;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 181
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic writeTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;[Lorg/msgpack/template/Template;Ljava/lang/String;)V
    .registers 5
    .param p1, "x0"    # Ljava/lang/Class;
    .param p2, "x1"    # [Lorg/msgpack/template/builder/FieldEntry;
    .param p3, "x2"    # [Lorg/msgpack/template/Template;
    .param p4, "x3"    # Ljava/lang/String;

    .prologue
    .line 32
    check-cast p2, [Lorg/msgpack/template/builder/BeansFieldEntry;

    .end local p2    # "x1":[Lorg/msgpack/template/builder/FieldEntry;
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/msgpack/template/builder/BeansBuildContext;->writeTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/BeansFieldEntry;[Lorg/msgpack/template/Template;Ljava/lang/String;)V

    return-void
.end method
