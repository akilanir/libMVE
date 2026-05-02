.class public Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;
.super Lorg/msgpack/template/builder/ReflectionTemplateBuilder;
.source "ReflectionBeansTemplateBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder$ReflectionBeansFieldTemplate;
    }
.end annotation


# static fields
.field private static LOG:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 51
    const-class v0, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;)V
    .registers 3
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;

    .prologue
    .line 72
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/msgpack/template/builder/ReflectionTemplateBuilder;-><init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/ClassLoader;)V

    .line 73
    return-void
.end method

.method private getMethodIndex(Ljava/lang/reflect/Method;)I
    .registers 4
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 190
    const-class v1, Lorg/msgpack/annotation/Index;

    invoke-virtual {p1, v1}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/msgpack/annotation/Index;

    .line 191
    .local v0, "a":Lorg/msgpack/annotation/Index;
    if-nez v0, :cond_c

    .line 192
    const/4 v1, -0x1

    .line 194
    :goto_b
    return v1

    :cond_c
    invoke-interface {v0}, Lorg/msgpack/annotation/Index;->value()I

    move-result v1

    goto :goto_b
.end method

.method private getMethodOption(Ljava/lang/reflect/Method;)Lorg/msgpack/template/FieldOption;
    .registers 3
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 170
    const-class v0, Lorg/msgpack/annotation/Ignore;

    invoke-static {p1, v0}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->isAnnotated(Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 171
    sget-object v0, Lorg/msgpack/template/FieldOption;->IGNORE:Lorg/msgpack/template/FieldOption;

    .line 177
    :goto_a
    return-object v0

    .line 172
    :cond_b
    const-class v0, Lorg/msgpack/annotation/Optional;

    invoke-static {p1, v0}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->isAnnotated(Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 173
    sget-object v0, Lorg/msgpack/template/FieldOption;->OPTIONAL:Lorg/msgpack/template/FieldOption;

    goto :goto_a

    .line 174
    :cond_16
    const-class v0, Lorg/msgpack/annotation/NotNullable;

    invoke-static {p1, v0}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->isAnnotated(Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 175
    sget-object v0, Lorg/msgpack/template/FieldOption;->NOTNULLABLE:Lorg/msgpack/template/FieldOption;

    goto :goto_a

    .line 177
    :cond_21
    sget-object v0, Lorg/msgpack/template/FieldOption;->DEFAULT:Lorg/msgpack/template/FieldOption;

    goto :goto_a
.end method

.method private getPropertyIndex(Lorg/msgpack/template/builder/beans/PropertyDescriptor;)I
    .registers 5
    .param p1, "desc"    # Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .prologue
    .line 181
    invoke-virtual {p1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->getMethodIndex(Ljava/lang/reflect/Method;)I

    move-result v0

    .line 182
    .local v0, "getterIndex":I
    if-ltz v0, :cond_b

    .line 186
    .end local v0    # "getterIndex":I
    :goto_a
    return v0

    .line 185
    .restart local v0    # "getterIndex":I
    :cond_b
    invoke-virtual {p1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->getMethodIndex(Ljava/lang/reflect/Method;)I

    move-result v1

    .local v1, "setterIndex":I
    move v0, v1

    .line 186
    goto :goto_a
.end method

.method private getPropertyOption(Lorg/msgpack/template/builder/BeansFieldEntry;Lorg/msgpack/template/FieldOption;)Lorg/msgpack/template/FieldOption;
    .registers 6
    .param p1, "e"    # Lorg/msgpack/template/builder/BeansFieldEntry;
    .param p2, "implicitOption"    # Lorg/msgpack/template/FieldOption;

    .prologue
    .line 157
    invoke-virtual {p1}, Lorg/msgpack/template/builder/BeansFieldEntry;->getPropertyDescriptor()Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v2

    invoke-virtual {v2}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->getMethodOption(Ljava/lang/reflect/Method;)Lorg/msgpack/template/FieldOption;

    move-result-object v0

    .line 158
    .local v0, "forGetter":Lorg/msgpack/template/FieldOption;
    sget-object v2, Lorg/msgpack/template/FieldOption;->DEFAULT:Lorg/msgpack/template/FieldOption;

    if-eq v0, v2, :cond_11

    .line 165
    .end local v0    # "forGetter":Lorg/msgpack/template/FieldOption;
    :goto_10
    return-object v0

    .line 161
    .restart local v0    # "forGetter":Lorg/msgpack/template/FieldOption;
    :cond_11
    invoke-virtual {p1}, Lorg/msgpack/template/builder/BeansFieldEntry;->getPropertyDescriptor()Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v2

    invoke-virtual {v2}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->getMethodOption(Ljava/lang/reflect/Method;)Lorg/msgpack/template/FieldOption;

    move-result-object v1

    .line 162
    .local v1, "forSetter":Lorg/msgpack/template/FieldOption;
    sget-object v2, Lorg/msgpack/template/FieldOption;->DEFAULT:Lorg/msgpack/template/FieldOption;

    if-eq v1, v2, :cond_23

    move-object v0, v1

    .line 163
    goto :goto_10

    :cond_23
    move-object v0, p2

    .line 165
    goto :goto_10
.end method

.method private isIgnoreProperty(Lorg/msgpack/template/builder/beans/PropertyDescriptor;)Z
    .registers 6
    .param p1, "desc"    # Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .prologue
    const/4 v2, 0x1

    .line 199
    if-nez p1, :cond_4

    .line 204
    :cond_3
    :goto_3
    return v2

    .line 202
    :cond_4
    invoke-virtual {p1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    .line 203
    .local v0, "getter":Ljava/lang/reflect/Method;
    invoke-virtual {p1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v1

    .line 204
    .local v1, "setter":Ljava/lang/reflect/Method;
    if-eqz v0, :cond_3

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v3

    if-eqz v3, :cond_3

    const-class v3, Lorg/msgpack/annotation/Ignore;

    invoke-static {v0, v3}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->isAnnotated(Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_3

    const-class v3, Lorg/msgpack/annotation/Ignore;

    invoke-static {v1, v3}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->isAnnotated(Ljava/lang/reflect/AccessibleObject;Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_3

    const/4 v2, 0x0

    goto :goto_3
.end method


# virtual methods
.method public matchType(Ljava/lang/reflect/Type;Z)Z
    .registers 8
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .param p2, "hasAnnotation"    # Z

    .prologue
    .line 77
    move-object v1, p1

    check-cast v1, Ljava/lang/Class;

    .line 78
    .local v1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v1, p2}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->matchAtBeansClassTemplateBuilder(Ljava/lang/reflect/Type;Z)Z

    move-result v0

    .line 79
    .local v0, "matched":Z
    if-eqz v0, :cond_2f

    sget-object v2, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 80
    sget-object v2, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->LOG:Ljava/util/logging/Logger;

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

    .line 82
    :cond_2f
    return v0
.end method

.method public toFieldEntries(Ljava/lang/Class;Lorg/msgpack/template/FieldOption;)[Lorg/msgpack/template/builder/FieldEntry;
    .registers 20
    .param p2, "implicitOption"    # Lorg/msgpack/template/FieldOption;
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
    .line 105
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    invoke-static/range {p1 .. p1}, Lorg/msgpack/template/builder/beans/Introspector;->getBeanInfo(Ljava/lang/Class;)Lorg/msgpack/template/builder/beans/BeanInfo;
    :try_end_3
    .catch Lorg/msgpack/template/builder/beans/IntrospectionException; {:try_start_0 .. :try_end_3} :catch_21

    move-result-object v2

    .line 111
    .local v2, "desc":Lorg/msgpack/template/builder/beans/BeanInfo;
    invoke-interface {v2}, Lorg/msgpack/template/builder/beans/BeanInfo;->getPropertyDescriptors()[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v13

    .line 112
    .local v13, "props":[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 113
    .local v9, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/msgpack/template/builder/beans/PropertyDescriptor;>;"
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_e
    array-length v14, v13

    if-ge v6, v14, :cond_3f

    .line 114
    aget-object v12, v13, v6

    .line 115
    .local v12, "pd":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->isIgnoreProperty(Lorg/msgpack/template/builder/beans/PropertyDescriptor;)Z

    move-result v14

    if-nez v14, :cond_1e

    .line 116
    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    :cond_1e
    add-int/lit8 v6, v6, 0x1

    goto :goto_e

    .line 106
    .end local v2    # "desc":Lorg/msgpack/template/builder/beans/BeanInfo;
    .end local v6    # "i":I
    .end local v9    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/msgpack/template/builder/beans/PropertyDescriptor;>;"
    .end local v12    # "pd":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .end local v13    # "props":[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    :catch_21
    move-exception v4

    .line 107
    .local v4, "e1":Lorg/msgpack/template/builder/beans/IntrospectionException;
    new-instance v14, Lorg/msgpack/template/builder/TemplateBuildException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Class must be java beans class:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 119
    .end local v4    # "e1":Lorg/msgpack/template/builder/beans/IntrospectionException;
    .restart local v2    # "desc":Lorg/msgpack/template/builder/beans/BeanInfo;
    .restart local v6    # "i":I
    .restart local v9    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/msgpack/template/builder/beans/PropertyDescriptor;>;"
    .restart local v13    # "props":[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    :cond_3f
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v14

    new-array v13, v14, [Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .line 120
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 122
    array-length v14, v13

    new-array v5, v14, [Lorg/msgpack/template/builder/BeansFieldEntry;

    .line 123
    .local v5, "entries":[Lorg/msgpack/template/builder/BeansFieldEntry;
    const/4 v6, 0x0

    :goto_4c
    array-length v14, v13

    if-ge v6, v14, :cond_9f

    .line 124
    aget-object v11, v13, v6

    .line 125
    .local v11, "p":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->getPropertyIndex(Lorg/msgpack/template/builder/beans/PropertyDescriptor;)I

    move-result v7

    .line 126
    .local v7, "index":I
    if-ltz v7, :cond_9c

    .line 127
    aget-object v14, v5, v7

    if-eqz v14, :cond_76

    .line 128
    new-instance v14, Lorg/msgpack/template/builder/TemplateBuildException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "duplicated index: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 130
    :cond_76
    array-length v14, v5

    if-lt v7, v14, :cond_92

    .line 131
    new-instance v14, Lorg/msgpack/template/builder/TemplateBuildException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "invalid index: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/msgpack/template/builder/TemplateBuildException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 133
    :cond_92
    new-instance v14, Lorg/msgpack/template/builder/BeansFieldEntry;

    invoke-direct {v14, v11}, Lorg/msgpack/template/builder/BeansFieldEntry;-><init>(Lorg/msgpack/template/builder/beans/PropertyDescriptor;)V

    aput-object v14, v5, v7

    .line 134
    const/4 v14, 0x0

    aput-object v14, v13, v6

    .line 123
    :cond_9c
    add-int/lit8 v6, v6, 0x1

    goto :goto_4c

    .line 137
    .end local v7    # "index":I
    .end local v11    # "p":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    :cond_9f
    const/4 v8, 0x0

    .line 138
    .local v8, "insertIndex":I
    const/4 v6, 0x0

    :goto_a1
    array-length v14, v13

    if-ge v6, v14, :cond_b9

    .line 139
    aget-object v11, v13, v6

    .line 140
    .restart local v11    # "p":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    if-eqz v11, :cond_b6

    .line 141
    :goto_a8
    aget-object v14, v5, v8

    if-eqz v14, :cond_af

    .line 142
    add-int/lit8 v8, v8, 0x1

    goto :goto_a8

    .line 144
    :cond_af
    new-instance v14, Lorg/msgpack/template/builder/BeansFieldEntry;

    invoke-direct {v14, v11}, Lorg/msgpack/template/builder/BeansFieldEntry;-><init>(Lorg/msgpack/template/builder/beans/PropertyDescriptor;)V

    aput-object v14, v5, v8

    .line 138
    :cond_b6
    add-int/lit8 v6, v6, 0x1

    goto :goto_a1

    .line 148
    .end local v11    # "p":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    :cond_b9
    const/4 v6, 0x0

    :goto_ba
    array-length v14, v5

    if-ge v6, v14, :cond_cd

    .line 149
    aget-object v3, v5, v6

    .line 150
    .local v3, "e":Lorg/msgpack/template/builder/BeansFieldEntry;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v3, v1}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->getPropertyOption(Lorg/msgpack/template/builder/BeansFieldEntry;Lorg/msgpack/template/FieldOption;)Lorg/msgpack/template/FieldOption;

    move-result-object v10

    .line 151
    .local v10, "op":Lorg/msgpack/template/FieldOption;
    invoke-virtual {v3, v10}, Lorg/msgpack/template/builder/BeansFieldEntry;->setOption(Lorg/msgpack/template/FieldOption;)V

    .line 148
    add-int/lit8 v6, v6, 0x1

    goto :goto_ba

    .line 153
    .end local v3    # "e":Lorg/msgpack/template/builder/BeansFieldEntry;
    .end local v10    # "op":Lorg/msgpack/template/FieldOption;
    :cond_cd
    return-object v5
.end method

.method protected toTemplates([Lorg/msgpack/template/builder/FieldEntry;)[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    .registers 9
    .param p1, "entries"    # [Lorg/msgpack/template/builder/FieldEntry;

    .prologue
    .line 87
    array-length v5, p1

    new-array v3, v5, [Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;

    .line 88
    .local v3, "tmpls":[Lorg/msgpack/template/builder/ReflectionTemplateBuilder$ReflectionFieldTemplate;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    array-length v5, p1

    if-ge v1, v5, :cond_2f

    .line 89
    aget-object v0, p1, v1

    .line 90
    .local v0, "e":Lorg/msgpack/template/builder/FieldEntry;
    invoke-virtual {v0}, Lorg/msgpack/template/builder/FieldEntry;->getType()Ljava/lang/Class;

    move-result-object v4

    .line 91
    .local v4, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 92
    new-instance v5, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder$ReflectionBeansFieldTemplate;

    invoke-direct {v5, v0}, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder$ReflectionBeansFieldTemplate;-><init>(Lorg/msgpack/template/builder/FieldEntry;)V

    aput-object v5, v3, v1

    .line 88
    :goto_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 94
    :cond_1d
    iget-object v5, p0, Lorg/msgpack/template/builder/ReflectionBeansTemplateBuilder;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v0}, Lorg/msgpack/template/builder/FieldEntry;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v2

    .line 95
    .local v2, "tmpl":Lorg/msgpack/template/Template;
    new-instance v5, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$FieldTemplateImpl;

    invoke-direct {v5, v0, v2}, Lorg/msgpack/template/builder/ReflectionTemplateBuilder$FieldTemplateImpl;-><init>(Lorg/msgpack/template/builder/FieldEntry;Lorg/msgpack/template/Template;)V

    aput-object v5, v3, v1

    goto :goto_1a

    .line 98
    .end local v0    # "e":Lorg/msgpack/template/builder/FieldEntry;
    .end local v2    # "tmpl":Lorg/msgpack/template/Template;
    .end local v4    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2f
    return-object v3
.end method
