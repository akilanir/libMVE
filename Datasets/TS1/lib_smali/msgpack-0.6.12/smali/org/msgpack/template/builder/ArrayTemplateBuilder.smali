.class public Lorg/msgpack/template/builder/ArrayTemplateBuilder;
.super Lorg/msgpack/template/builder/AbstractTemplateBuilder;
.source "ArrayTemplateBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/msgpack/template/builder/ArrayTemplateBuilder$ReflectionMultidimentionalArrayTemplate;
    }
.end annotation


# static fields
.field private static final LOG:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    const-class v0, Lorg/msgpack/template/builder/ArrayTemplateBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lorg/msgpack/template/builder/ArrayTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;)V
    .registers 2
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    .line 105
    return-void
.end method

.method private toTemplate(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/Class;I)Lorg/msgpack/template/Template;
    .registers 10
    .param p1, "arrayType"    # Ljava/lang/reflect/Type;
    .param p2, "genericBaseType"    # Ljava/lang/reflect/Type;
    .param p3, "baseClass"    # Ljava/lang/Class;
    .param p4, "dim"    # I

    .prologue
    const/4 v4, 0x0

    .line 147
    const/4 v3, 0x1

    if-ne p4, v3, :cond_4f

    .line 148
    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p3, v3, :cond_d

    .line 149
    invoke-static {}, Lorg/msgpack/template/BooleanArrayTemplate;->getInstance()Lorg/msgpack/template/BooleanArrayTemplate;

    move-result-object v3

    .line 174
    :goto_c
    return-object v3

    .line 150
    :cond_d
    sget-object v3, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p3, v3, :cond_16

    .line 151
    invoke-static {}, Lorg/msgpack/template/ShortArrayTemplate;->getInstance()Lorg/msgpack/template/ShortArrayTemplate;

    move-result-object v3

    goto :goto_c

    .line 152
    :cond_16
    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p3, v3, :cond_1f

    .line 153
    invoke-static {}, Lorg/msgpack/template/IntegerArrayTemplate;->getInstance()Lorg/msgpack/template/IntegerArrayTemplate;

    move-result-object v3

    goto :goto_c

    .line 154
    :cond_1f
    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p3, v3, :cond_28

    .line 155
    invoke-static {}, Lorg/msgpack/template/LongArrayTemplate;->getInstance()Lorg/msgpack/template/LongArrayTemplate;

    move-result-object v3

    goto :goto_c

    .line 156
    :cond_28
    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p3, v3, :cond_31

    .line 157
    invoke-static {}, Lorg/msgpack/template/FloatArrayTemplate;->getInstance()Lorg/msgpack/template/FloatArrayTemplate;

    move-result-object v3

    goto :goto_c

    .line 158
    :cond_31
    sget-object v3, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p3, v3, :cond_3a

    .line 159
    invoke-static {}, Lorg/msgpack/template/DoubleArrayTemplate;->getInstance()Lorg/msgpack/template/DoubleArrayTemplate;

    move-result-object v3

    goto :goto_c

    .line 160
    :cond_3a
    sget-object v3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p3, v3, :cond_43

    .line 161
    invoke-static {}, Lorg/msgpack/template/ByteArrayTemplate;->getInstance()Lorg/msgpack/template/ByteArrayTemplate;

    move-result-object v3

    goto :goto_c

    .line 163
    :cond_43
    iget-object v3, p0, Lorg/msgpack/template/builder/ArrayTemplateBuilder;->registry:Lorg/msgpack/template/TemplateRegistry;

    invoke-virtual {v3, p2}, Lorg/msgpack/template/TemplateRegistry;->lookup(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;

    move-result-object v0

    .line 164
    .local v0, "baseTemplate":Lorg/msgpack/template/Template;
    new-instance v3, Lorg/msgpack/template/ObjectArrayTemplate;

    invoke-direct {v3, p3, v0}, Lorg/msgpack/template/ObjectArrayTemplate;-><init>(Ljava/lang/Class;Lorg/msgpack/template/Template;)V

    goto :goto_c

    .line 166
    .end local v0    # "baseTemplate":Lorg/msgpack/template/Template;
    :cond_4f
    const/4 v3, 0x2

    if-ne p4, v3, :cond_66

    .line 167
    invoke-static {p3, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 168
    .local v1, "componentClass":Ljava/lang/Class;
    add-int/lit8 v3, p4, -0x1

    invoke-direct {p0, p1, p2, p3, v3}, Lorg/msgpack/template/builder/ArrayTemplateBuilder;->toTemplate(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/Class;I)Lorg/msgpack/template/Template;

    move-result-object v2

    .line 169
    .local v2, "componentTemplate":Lorg/msgpack/template/Template;
    new-instance v3, Lorg/msgpack/template/builder/ArrayTemplateBuilder$ReflectionMultidimentionalArrayTemplate;

    invoke-direct {v3, v1, v2}, Lorg/msgpack/template/builder/ArrayTemplateBuilder$ReflectionMultidimentionalArrayTemplate;-><init>(Ljava/lang/Class;Lorg/msgpack/template/Template;)V

    goto :goto_c

    .line 171
    .end local v1    # "componentClass":Ljava/lang/Class;
    .end local v2    # "componentTemplate":Lorg/msgpack/template/Template;
    :cond_66
    add-int/lit8 v3, p4, -0x1

    invoke-direct {p0, p1, p2, p3, v3}, Lorg/msgpack/template/builder/ArrayTemplateBuilder;->toTemplate(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/Class;I)Lorg/msgpack/template/Template;

    move-result-object v2

    check-cast v2, Lorg/msgpack/template/builder/ArrayTemplateBuilder$ReflectionMultidimentionalArrayTemplate;

    .line 173
    .local v2, "componentTemplate":Lorg/msgpack/template/builder/ArrayTemplateBuilder$ReflectionMultidimentionalArrayTemplate;
    invoke-virtual {v2}, Lorg/msgpack/template/builder/ArrayTemplateBuilder$ReflectionMultidimentionalArrayTemplate;->getComponentClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 174
    .restart local v1    # "componentClass":Ljava/lang/Class;
    new-instance v3, Lorg/msgpack/template/builder/ArrayTemplateBuilder$ReflectionMultidimentionalArrayTemplate;

    invoke-direct {v3, v1, v2}, Lorg/msgpack/template/builder/ArrayTemplateBuilder$ReflectionMultidimentionalArrayTemplate;-><init>(Ljava/lang/Class;Lorg/msgpack/template/Template;)V

    goto :goto_c
.end method


# virtual methods
.method public buildTemplate(Ljava/lang/Class;Lorg/msgpack/template/FieldList;)Lorg/msgpack/template/Template;
    .registers 5
    .param p2, "flist"    # Lorg/msgpack/template/FieldList;
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
    .line 181
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected buildTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;)Lorg/msgpack/template/Template;
    .registers 5
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
    .line 186
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public buildTemplate(Ljava/lang/reflect/Type;)Lorg/msgpack/template/Template;
    .registers 8
    .param p1, "arrayType"    # Ljava/lang/reflect/Type;
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
    .line 121
    const/4 v2, 0x1

    .line 122
    .local v2, "dim":I
    instance-of v5, p1, Ljava/lang/reflect/GenericArrayType;

    if-eqz v5, :cond_2f

    move-object v3, p1

    .line 123
    check-cast v3, Ljava/lang/reflect/GenericArrayType;

    .line 124
    .local v3, "type":Ljava/lang/reflect/GenericArrayType;
    invoke-interface {v3}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 125
    .local v1, "baseType":Ljava/lang/reflect/Type;
    :goto_c
    instance-of v5, v1, Ljava/lang/reflect/GenericArrayType;

    if-eqz v5, :cond_19

    .line 126
    check-cast v1, Ljava/lang/reflect/GenericArrayType;

    .end local v1    # "baseType":Ljava/lang/reflect/Type;
    invoke-interface {v1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 127
    .restart local v1    # "baseType":Ljava/lang/reflect/Type;
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 129
    :cond_19
    instance-of v5, v1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v5, :cond_2b

    move-object v5, v1

    .line 130
    check-cast v5, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v5}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 143
    .end local v3    # "type":Ljava/lang/reflect/GenericArrayType;
    .local v0, "baseClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_26
    invoke-direct {p0, p1, v1, v0, v2}, Lorg/msgpack/template/builder/ArrayTemplateBuilder;->toTemplate(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/Class;I)Lorg/msgpack/template/Template;

    move-result-object v5

    return-object v5

    .end local v0    # "baseClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "type":Ljava/lang/reflect/GenericArrayType;
    :cond_2b
    move-object v0, v1

    .line 132
    check-cast v0, Ljava/lang/Class;

    .restart local v0    # "baseClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_26

    .end local v0    # "baseClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "baseType":Ljava/lang/reflect/Type;
    .end local v3    # "type":Ljava/lang/reflect/GenericArrayType;
    :cond_2f
    move-object v4, p1

    .line 135
    check-cast v4, Ljava/lang/Class;

    .line 136
    .local v4, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    .line 137
    .restart local v0    # "baseClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_36
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v5

    if-eqz v5, :cond_43

    .line 138
    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    .line 139
    add-int/lit8 v2, v2, 0x1

    goto :goto_36

    .line 141
    :cond_43
    move-object v1, v0

    .restart local v1    # "baseType":Ljava/lang/reflect/Type;
    goto :goto_26
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
    .line 196
    const/4 v0, 0x0

    return-object v0
.end method

.method public matchType(Ljava/lang/reflect/Type;Z)Z
    .registers 8
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .param p2, "forceBuild"    # Z

    .prologue
    .line 109
    move-object v1, p1

    check-cast v1, Ljava/lang/Class;

    .line 110
    .local v1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lorg/msgpack/template/builder/AbstractTemplateBuilder;->matchAtArrayTemplateBuilder(Ljava/lang/Class;Z)Z

    move-result v0

    .line 111
    .local v0, "matched":Z
    if-eqz v0, :cond_30

    sget-object v2, Lorg/msgpack/template/builder/ArrayTemplateBuilder;->LOG:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v2

    if-eqz v2, :cond_30

    .line 112
    sget-object v2, Lorg/msgpack/template/builder/ArrayTemplateBuilder;->LOG:Ljava/util/logging/Logger;

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

    .line 114
    :cond_30
    return v0
.end method

.method public writeTemplate(Ljava/lang/reflect/Type;Ljava/lang/String;)V
    .registers 5
    .param p1, "targetType"    # Ljava/lang/reflect/Type;
    .param p2, "directoryName"    # Ljava/lang/String;

    .prologue
    .line 191
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
