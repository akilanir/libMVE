.class public abstract Lorg/msgpack/template/builder/AbstractTemplateBuilder;
.super Ljava/lang/Object;
.source "AbstractTemplateBuilder.java"

# interfaces
.implements Lorg/msgpack/template/builder/TemplateBuilder;


# instance fields
.field protected registry:Lorg/msgpack/template/TemplateRegistry;


# direct methods
.method protected constructor <init>(Lorg/msgpack/template/TemplateRegistry;)V
    .registers 2
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->registry:Lorg/msgpack/template/TemplateRegistry;

    .line 51
    return-void
.end method

.method private getFieldIndex(Ljava/lang/reflect/Field;I)I
    .registers 5
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "maxIndex"    # I

    .prologue
    .line 232
    const-class v1, Lorg/msgpack/annotation/Index;

    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/msgpack/annotation/Index;

    .line 233
    .local v0, "a":Lorg/msgpack/annotation/Index;
    if-nez v0, :cond_d

    .line 234
    add-int/lit8 v1, p2, 0x1

    .line 236
    :goto_c
    return v1

    :cond_d
    invoke-interface {v0}, Lorg/msgpack/annotation/Index;->value()I

    move-result v1

    goto :goto_c
.end method

.method private getFieldOption(Ljava/lang/reflect/Field;Lorg/msgpack/template/FieldOption;)Lorg/msgpack/template/FieldOption;
    .registers 5
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "from"    # Lorg/msgpack/template/FieldOption;

    .prologue
    .line 202
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    .line 207
    .local v0, "mod":I
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v1

    if-nez v1, :cond_16

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v1

    if-nez v1, :cond_16

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 209
    :cond_16
    sget-object p2, Lorg/msgpack/template/FieldOption;->IGNORE:Lorg/msgpack/template/FieldOption;

    .line 227
    .end local p2    # "from":Lorg/msgpack/template/FieldOption;
    :cond_18
    :goto_18
    return-object p2

    .line 212
    .restart local p2    # "from":Lorg/msgpack/template/FieldOption;
    :cond_19
    const-class v1, Lorg/msgpack/annotation/Ignore;

    invoke-static {p1, v1}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->isAnnotated(Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 213
    sget-object p2, Lorg/msgpack/template/FieldOption;->IGNORE:Lorg/msgpack/template/FieldOption;

    goto :goto_18

    .line 214
    :cond_24
    const-class v1, Lorg/msgpack/annotation/Optional;

    invoke-static {p1, v1}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->isAnnotated(Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 215
    sget-object p2, Lorg/msgpack/template/FieldOption;->OPTIONAL:Lorg/msgpack/template/FieldOption;

    goto :goto_18

    .line 216
    :cond_2f
    const-class v1, Lorg/msgpack/annotation/NotNullable;

    invoke-static {p1, v1}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->isAnnotated(Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_3a

    .line 217
    sget-object p2, Lorg/msgpack/template/FieldOption;->NOTNULLABLE:Lorg/msgpack/template/FieldOption;

    goto :goto_18

    .line 220
    :cond_3a
    sget-object v1, Lorg/msgpack/template/FieldOption;->DEFAULT:Lorg/msgpack/template/FieldOption;

    if-ne p2, v1, :cond_18

    .line 224
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 225
    sget-object p2, Lorg/msgpack/template/FieldOption;->NOTNULLABLE:Lorg/msgpack/template/FieldOption;

    goto :goto_18

    .line 227
    :cond_4b
    sget-object p2, Lorg/msgpack/template/FieldOption;->OPTIONAL:Lorg/msgpack/template/FieldOption;

    goto :goto_18
.end method

.method private getFields(Ljava/lang/Class;)[Ljava/lang/reflect/Field;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 184
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .local v5, "succ":Ljava/util/List;, "Ljava/util/List<[Ljava/lang/reflect/Field;>;"
    const/4 v6, 0x0

    .line 186
    .local v6, "total":I
    move-object v0, p1

    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_7
    const-class v7, Ljava/lang/Object;

    if-eq v0, v7, :cond_19

    .line 187
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    .line 188
    .local v1, "fields":[Ljava/lang/reflect/Field;
    array-length v7, v1

    add-int/2addr v6, v7

    .line 189
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_7

    .line 191
    .end local v1    # "fields":[Ljava/lang/reflect/Field;
    :cond_19
    new-array v4, v6, [Ljava/lang/reflect/Field;

    .line 192
    .local v4, "result":[Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    .line 193
    .local v3, "off":I
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v2, v7, -0x1

    .local v2, "i":I
    :goto_22
    if-ltz v2, :cond_34

    .line 194
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/reflect/Field;

    .line 195
    .restart local v1    # "fields":[Ljava/lang/reflect/Field;
    const/4 v7, 0x0

    array-length v8, v1

    invoke-static {v1, v7, v4, v3, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 196
    array-length v7, v1

    add-int/2addr v3, v7

    .line 193
    add-int/lit8 v2, v2, -0x1

    goto :goto_22

    .line 198
    .end local v1    # "fields":[Ljava/lang/reflect/Field;
    :cond_34
    return-object v4
.end method

.method public static isAnnotated(Ljava/lang/Class;Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 252
    .local p0, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "with":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isAnnotated(Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Z
    .registers 3
    .param p0, "accessibleObject"    # Ljava/lang/reflect/AccessibleObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/AccessibleObject;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 256
    .local p1, "with":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    invoke-virtual {p0, p1}, Ljava/lang/reflect/AccessibleObject;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static matchAtArrayTemplateBuilder(Ljava/lang/Class;Z)Z
    .registers 3
    .param p1, "hasAnnotation"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;Z)Z"
        }
    .end annotation

    .prologue
    .line 279
    .local p0, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    instance-of v0, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v0, :cond_6

    .line 280
    const/4 v0, 0x1

    .line 282
    :goto_5
    return v0

    :cond_6
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    goto :goto_5
.end method

.method public static matchAtBeansClassTemplateBuilder(Ljava/lang/reflect/Type;Z)Z
    .registers 7
    .param p0, "targetType"    # Ljava/lang/reflect/Type;
    .param p1, "hasAnnotation"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 269
    move-object v0, p0

    check-cast v0, Ljava/lang/Class;

    .line 270
    .local v0, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_20

    move-object v1, p0

    .line 271
    check-cast v1, Ljava/lang/Class;

    const-class v4, Lorg/msgpack/annotation/Beans;

    invoke-static {v1, v4}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->isAnnotated(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_1c

    check-cast p0, Ljava/lang/Class;

    .end local p0    # "targetType":Ljava/lang/reflect/Type;
    const-class v1, Lorg/msgpack/annotation/MessagePackBeans;

    invoke-static {p0, v1}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->isAnnotated(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_1e

    :cond_1c
    move v1, v3

    .line 274
    :goto_1d
    return v1

    :cond_1e
    move v1, v2

    .line 271
    goto :goto_1d

    .line 274
    .restart local p0    # "targetType":Ljava/lang/reflect/Type;
    :cond_20
    invoke-virtual {v0}, Ljava/lang/Class;->isEnum()Z

    move-result v1

    if-eqz v1, :cond_2c

    invoke-virtual {v0}, Ljava/lang/Class;->isInterface()Z

    move-result v1

    if-nez v1, :cond_2d

    :cond_2c
    move v2, v3

    :cond_2d
    move v1, v2

    goto :goto_1d
.end method

.method public static matchAtClassTemplateBuilder(Ljava/lang/Class;Z)Z
    .registers 5
    .param p1, "hasAnnotation"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;Z)Z"
        }
    .end annotation

    .prologue
    .local p0, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 260
    if-eqz p1, :cond_16

    .line 261
    const-class v2, Lorg/msgpack/annotation/Message;

    invoke-static {p0, v2}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->isAnnotated(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_14

    const-class v2, Lorg/msgpack/annotation/MessagePackMessage;

    invoke-static {p0, v2}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->isAnnotated(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_15

    :cond_14
    move v0, v1

    .line 264
    :cond_15
    :goto_15
    return v0

    :cond_16
    invoke-virtual {p0}, Ljava/lang/Class;->isEnum()Z

    move-result v2

    if-nez v2, :cond_24

    invoke-virtual {p0}, Ljava/lang/Class;->isInterface()Z

    move-result v2

    if-nez v2, :cond_24

    :goto_22
    move v0, v1

    goto :goto_15

    :cond_24
    move v1, v0

    goto :goto_22
.end method

.method public static matchAtOrdinalEnumTemplateBuilder(Ljava/lang/Class;Z)Z
    .registers 3
    .param p1, "hasAnnotation"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;Z)Z"
        }
    .end annotation

    .prologue
    .line 286
    .local p0, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_16

    .line 287
    const-class v0, Lorg/msgpack/annotation/OrdinalEnum;

    invoke-static {p0, v0}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->isAnnotated(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_12

    const-class v0, Lorg/msgpack/annotation/MessagePackOrdinalEnum;

    invoke-static {p0, v0}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->isAnnotated(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    .line 290
    :goto_13
    return v0

    .line 287
    :cond_14
    const/4 v0, 0x0

    goto :goto_13

    .line 290
    :cond_16
    invoke-virtual {p0}, Ljava/lang/Class;->isEnum()Z

    move-result v0

    goto :goto_13
.end method

.method private toFieldEntries(Ljava/lang/Class;Lorg/msgpack/template/FieldList;)[Lorg/msgpack/template/builder/FieldEntry;
    .registers 11
    .param p2, "flist"    # Lorg/msgpack/template/FieldList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/msgpack/template/FieldList;",
            ")[",
            "Lorg/msgpack/template/builder/FieldEntry;"
        }
    .end annotation

    .prologue
    .line 108
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Lorg/msgpack/template/FieldList;->getList()Ljava/util/List;

    move-result-object v4

    .line 109
    .local v4, "src":Ljava/util/List;, "Ljava/util/List<Lorg/msgpack/template/FieldList$Entry;>;"
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v1, v5, [Lorg/msgpack/template/builder/FieldEntry;

    .line 110
    .local v1, "entries":[Lorg/msgpack/template/builder/FieldEntry;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_49

    .line 111
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/msgpack/template/FieldList$Entry;

    .line 112
    .local v3, "s":Lorg/msgpack/template/FieldList$Entry;
    invoke-virtual {v3}, Lorg/msgpack/template/FieldList$Entry;->isAvailable()Z

    move-result v5

    if-eqz v5, :cond_41

    .line 114
    :try_start_1d
    new-instance v5, Lorg/msgpack/template/builder/DefaultFieldEntry;

    invoke-virtual {v3}, Lorg/msgpack/template/FieldList$Entry;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v3}, Lorg/msgpack/template/FieldList$Entry;->getOption()Lorg/msgpack/template/FieldOption;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/msgpack/template/builder/DefaultFieldEntry;-><init>(Ljava/lang/reflect/Field;Lorg/msgpack/template/FieldOption;)V

    aput-object v5, v1, v2
    :try_end_30
    .catch Ljava/lang/SecurityException; {:try_start_1d .. :try_end_30} :catch_33
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1d .. :try_end_30} :catch_3a

    .line 110
    :goto_30
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 115
    :catch_33
    move-exception v0

    .line 116
    .local v0, "e":Ljava/lang/SecurityException;
    new-instance v5, Lorg/msgpack/template/builder/TemplateBuildException;

    invoke-direct {v5, v0}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 117
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_3a
    move-exception v0

    .line 118
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    new-instance v5, Lorg/msgpack/template/builder/TemplateBuildException;

    invoke-direct {v5, v0}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 121
    .end local v0    # "e":Ljava/lang/NoSuchFieldException;
    :cond_41
    new-instance v5, Lorg/msgpack/template/builder/DefaultFieldEntry;

    invoke-direct {v5}, Lorg/msgpack/template/builder/DefaultFieldEntry;-><init>()V

    aput-object v5, v1, v2

    goto :goto_30

    .line 124
    .end local v3    # "s":Lorg/msgpack/template/FieldList$Entry;
    :cond_49
    return-object v1
.end method


# virtual methods
.method public buildTemplate(Ljava/lang/Class;Lorg/msgpack/template/FieldList;)Lorg/msgpack/template/Template;
    .registers 5
    .param p2, "fieldList"    # Lorg/msgpack/template/FieldList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lorg/msgpack/template/FieldList;",
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
    .line 67
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, p1}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->checkClassValidation(Ljava/lang/Class;)V

    .line 68
    invoke-direct {p0, p1, p2}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->toFieldEntries(Ljava/lang/Class;Lorg/msgpack/template/FieldList;)[Lorg/msgpack/template/builder/FieldEntry;

    move-result-object v0

    .line 69
    .local v0, "entries":[Lorg/msgpack/template/builder/FieldEntry;
    invoke-virtual {p0, p1, v0}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->buildTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;)Lorg/msgpack/template/Template;

    move-result-object v1

    return-object v1
.end method

.method protected abstract buildTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;)Lorg/msgpack/template/Template;
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
.end method

.method public buildTemplate(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;
    .registers 6
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
    .line 57
    move-object v2, p1

    check-cast v2, Ljava/lang/Class;

    .line 58
    .local v2, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0, v2}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->checkClassValidation(Ljava/lang/Class;)V

    .line 59
    invoke-virtual {p0, v2}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->getFieldOption(Ljava/lang/Class;)Lorg/msgpack/template/FieldOption;

    move-result-object v1

    .line 60
    .local v1, "fieldOption":Lorg/msgpack/template/FieldOption;
    invoke-virtual {p0, v2, v1}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->toFieldEntries(Ljava/lang/Class;Lorg/msgpack/template/FieldOption;)[Lorg/msgpack/template/builder/FieldEntry;

    move-result-object v0

    .line 61
    .local v0, "entries":[Lorg/msgpack/template/builder/FieldEntry;
    invoke-virtual {p0, v2, v0}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->buildTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;)Lorg/msgpack/template/Template;

    move-result-object v3

    return-object v3
.end method

.method protected checkClassValidation(Ljava/lang/Class;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 75
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    move-result v0

    if-eqz v0, :cond_23

    .line 76
    new-instance v0, Lorg/msgpack/template/builder/TemplateBuildException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot build template for interface: "

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

    .line 79
    :cond_23
    invoke-virtual {p1}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v0

    if-eqz v0, :cond_4a

    .line 80
    new-instance v0, Lorg/msgpack/template/builder/TemplateBuildException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot build template for abstract class: "

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

    .line 83
    :cond_4a
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_6d

    .line 84
    new-instance v0, Lorg/msgpack/template/builder/TemplateBuildException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot build template for array class: "

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

    .line 87
    :cond_6d
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_90

    .line 88
    new-instance v0, Lorg/msgpack/template/builder/TemplateBuildException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot build template of primitive type: "

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

    .line 91
    :cond_90
    return-void
.end method

.method protected getFieldOption(Ljava/lang/Class;)Lorg/msgpack/template/FieldOption;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/msgpack/template/FieldOption;"
        }
    .end annotation

    .prologue
    .line 94
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Lorg/msgpack/annotation/Message;

    invoke-virtual {p1, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/msgpack/annotation/Message;

    .line 95
    .local v0, "m":Lorg/msgpack/annotation/Message;
    if-nez v0, :cond_d

    .line 96
    sget-object v2, Lorg/msgpack/template/FieldOption;->DEFAULT:Lorg/msgpack/template/FieldOption;

    .line 104
    :goto_c
    return-object v2

    .line 98
    :cond_d
    const-class v2, Lorg/msgpack/annotation/MessagePackMessage;

    invoke-virtual {p1, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lorg/msgpack/annotation/MessagePackMessage;

    .line 100
    .local v1, "mpm":Lorg/msgpack/annotation/MessagePackMessage;
    if-nez v1, :cond_1a

    .line 101
    sget-object v2, Lorg/msgpack/template/FieldOption;->DEFAULT:Lorg/msgpack/template/FieldOption;

    goto :goto_c

    .line 104
    :cond_1a
    invoke-interface {v0}, Lorg/msgpack/annotation/Message;->value()Lorg/msgpack/template/FieldOption;

    move-result-object v2

    goto :goto_c
.end method

.method public loadTemplate(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;
    .registers 3
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
    .line 247
    const/4 v0, 0x0

    return-object v0
.end method

.method protected toFieldEntries(Ljava/lang/Class;Lorg/msgpack/template/FieldOption;)[Lorg/msgpack/template/builder/FieldEntry;
    .registers 20
    .param p2, "from"    # Lorg/msgpack/template/FieldOption;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/msgpack/template/FieldOption;",
            ")[",
            "Lorg/msgpack/template/builder/FieldEntry;"
        }
    .end annotation

    .prologue
    .line 128
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct/range {p0 .. p1}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->getFields(Ljava/lang/Class;)[Ljava/lang/reflect/Field;

    move-result-object v6

    .line 143
    .local v6, "fields":[Ljava/lang/reflect/Field;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .local v10, "indexed":Ljava/util/List;, "Ljava/util/List<Lorg/msgpack/template/builder/FieldEntry;>;"
    const/4 v12, -0x1

    .line 145
    .local v12, "maxIndex":I
    move-object v2, v6

    .local v2, "arr$":[Ljava/lang/reflect/Field;
    array-length v11, v2

    .local v11, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_d
    if-ge v8, v11, :cond_7d

    aget-object v5, v2, v8

    .line 146
    .local v5, "f":Ljava/lang/reflect/Field;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v5, v1}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->getFieldOption(Ljava/lang/reflect/Field;Lorg/msgpack/template/FieldOption;)Lorg/msgpack/template/FieldOption;

    move-result-object v13

    .line 147
    .local v13, "opt":Lorg/msgpack/template/FieldOption;
    sget-object v14, Lorg/msgpack/template/FieldOption;->IGNORE:Lorg/msgpack/template/FieldOption;

    if-ne v13, v14, :cond_20

    .line 145
    :cond_1d
    :goto_1d
    add-int/lit8 v8, v8, 0x1

    goto :goto_d

    .line 152
    :cond_20
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v12}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->getFieldIndex(Ljava/lang/reflect/Field;I)I

    move-result v9

    .line 153
    .local v9, "index":I
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v14

    if-le v14, v9, :cond_4b

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_4b

    .line 154
    new-instance v14, Lorg/msgpack/template/builder/TemplateBuildException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "duplicated index: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 156
    :cond_4b
    if-gez v9, :cond_66

    .line 157
    new-instance v14, Lorg/msgpack/template/builder/TemplateBuildException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "invalid index: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 160
    :cond_66
    :goto_66
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v14

    if-gt v14, v9, :cond_71

    .line 161
    const/4 v14, 0x0

    invoke-interface {v10, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_66

    .line 163
    :cond_71
    new-instance v14, Lorg/msgpack/template/builder/DefaultFieldEntry;

    invoke-direct {v14, v5, v13}, Lorg/msgpack/template/builder/DefaultFieldEntry;-><init>(Ljava/lang/reflect/Field;Lorg/msgpack/template/FieldOption;)V

    invoke-interface {v10, v9, v14}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 165
    if-ge v12, v9, :cond_1d

    .line 166
    move v12, v9

    goto :goto_1d

    .line 170
    .end local v5    # "f":Ljava/lang/reflect/Field;
    .end local v9    # "index":I
    .end local v13    # "opt":Lorg/msgpack/template/FieldOption;
    :cond_7d
    add-int/lit8 v14, v12, 0x1

    new-array v4, v14, [Lorg/msgpack/template/builder/FieldEntry;

    .line 171
    .local v4, "entries":[Lorg/msgpack/template/builder/FieldEntry;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_82
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v14

    if-ge v7, v14, :cond_9d

    .line 172
    invoke-interface {v10, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/msgpack/template/builder/FieldEntry;

    .line 173
    .local v3, "e":Lorg/msgpack/template/builder/FieldEntry;
    if-nez v3, :cond_9a

    .line 174
    new-instance v14, Lorg/msgpack/template/builder/DefaultFieldEntry;

    invoke-direct {v14}, Lorg/msgpack/template/builder/DefaultFieldEntry;-><init>()V

    aput-object v14, v4, v7

    .line 171
    :goto_97
    add-int/lit8 v7, v7, 0x1

    goto :goto_82

    .line 176
    :cond_9a
    aput-object v3, v4, v7

    goto :goto_97

    .line 179
    .end local v3    # "e":Lorg/msgpack/template/builder/FieldEntry;
    :cond_9d
    return-object v4
.end method

.method public writeTemplate(Ljava/lang/reflect/Type;Ljava/lang/String;)V
    .registers 5
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .param p2, "directoryName"    # Ljava/lang/String;

    .prologue
    .line 242
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
