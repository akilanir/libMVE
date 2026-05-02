.class public Lorg/msgpack/template/builder/DefaultBuildContext;
.super Lorg/msgpack/template/builder/BuildContext;
.source "DefaultBuildContext.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/msgpack/template/builder/BuildContext",
        "<",
        "Lorg/msgpack/template/builder/FieldEntry;",
        ">;"
    }
.end annotation


# instance fields
.field protected entries:[Lorg/msgpack/template/builder/FieldEntry;

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
    .line 47
    invoke-direct {p0, p1}, Lorg/msgpack/template/builder/BuildContext;-><init>(Lorg/msgpack/template/builder/JavassistTemplateBuilder;)V

    .line 48
    return-void
.end method

.method public static readPrivateField(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 8
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "targetClass"    # Ljava/lang/Class;
    .param p2, "fieldName"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 151
    const/4 v1, 0x0

    .line 153
    .local v1, "field":Ljava/lang/reflect/Field;
    :try_start_2
    invoke-virtual {p1, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 154
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 155
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_d} :catch_14
    .catchall {:try_start_2 .. :try_end_d} :catchall_1b

    move-result-object v2

    .line 160
    .local v2, "valueReference":Ljava/lang/Object;
    if-eqz v1, :cond_13

    .line 161
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    :cond_13
    return-object v2

    .line 157
    .end local v2    # "valueReference":Ljava/lang/Object;
    :catch_14
    move-exception v0

    .line 158
    .local v0, "e":Ljava/lang/Exception;
    :try_start_15
    new-instance v3, Lorg/msgpack/MessageTypeException;

    invoke-direct {v3, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_1b
    .catchall {:try_start_15 .. :try_end_1b} :catchall_1b

    .line 160
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_1b
    move-exception v3

    if-eqz v1, :cond_21

    .line 161
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    :cond_21
    throw v3
.end method

.method public static readPrivateField(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Lorg/msgpack/template/Template;)V
    .registers 11
    .param p0, "unpacker"    # Lorg/msgpack/unpacker/Unpacker;
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "targetClass"    # Ljava/lang/Class;
    .param p3, "fieldName"    # Ljava/lang/String;
    .param p4, "tmpl"    # Lorg/msgpack/template/Template;

    .prologue
    const/4 v5, 0x0

    .line 250
    const/4 v1, 0x0

    .line 252
    .local v1, "field":Ljava/lang/reflect/Field;
    :try_start_2
    invoke-virtual {p2, p3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 253
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 254
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 255
    .local v2, "fieldReference":Ljava/lang/Object;
    invoke-interface {p4, p0, v2}, Lorg/msgpack/template/Template;->read(Lorg/msgpack/unpacker/Unpacker;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 256
    .local v3, "valueReference":Ljava/lang/Object;
    if-eq v3, v2, :cond_17

    .line 257
    invoke-virtual {v1, p1, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_17} :catch_1d
    .catchall {:try_start_2 .. :try_end_17} :catchall_24

    .line 262
    :cond_17
    if-eqz v1, :cond_1c

    .line 263
    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 266
    :cond_1c
    return-void

    .line 259
    .end local v2    # "fieldReference":Ljava/lang/Object;
    .end local v3    # "valueReference":Ljava/lang/Object;
    :catch_1d
    move-exception v0

    .line 260
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1e
    new-instance v4, Lorg/msgpack/MessageTypeException;

    invoke-direct {v4, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_24
    .catchall {:try_start_1e .. :try_end_24} :catchall_24

    .line 262
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_24
    move-exception v4

    if-eqz v1, :cond_2a

    .line 263
    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    :cond_2a
    throw v4
.end method

.method public static writePrivateField(Lorg/msgpack/packer/Packer;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Lorg/msgpack/template/Template;)V
    .registers 10
    .param p0, "packer"    # Lorg/msgpack/packer/Packer;
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "targetClass"    # Ljava/lang/Class;
    .param p3, "fieldName"    # Ljava/lang/String;
    .param p4, "tmpl"    # Lorg/msgpack/template/Template;

    .prologue
    const/4 v4, 0x0

    .line 168
    const/4 v1, 0x0

    .line 170
    .local v1, "field":Ljava/lang/reflect/Field;
    :try_start_2
    invoke-virtual {p2, p3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 171
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 172
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 173
    .local v2, "valueReference":Ljava/lang/Object;
    invoke-interface {p4, p0, v2}, Lorg/msgpack/template/Template;->write(Lorg/msgpack/packer/Packer;Ljava/lang/Object;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_11} :catch_17
    .catchall {:try_start_2 .. :try_end_11} :catchall_1e

    .line 177
    if-eqz v1, :cond_16

    .line 178
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 181
    :cond_16
    return-void

    .line 174
    .end local v2    # "valueReference":Ljava/lang/Object;
    :catch_17
    move-exception v0

    .line 175
    .local v0, "e":Ljava/lang/Exception;
    :try_start_18
    new-instance v3, Lorg/msgpack/MessageTypeException;

    invoke-direct {v3, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_1e
    .catchall {:try_start_18 .. :try_end_1e} :catchall_1e

    .line 177
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_1e
    move-exception v3

    if-eqz v1, :cond_24

    .line 178
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    :cond_24
    throw v3
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

    .line 67
    const/4 v1, 0x2

    new-array v1, v1, [Ljavassist/CtClass;

    iget-object v2, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    const-class v3, Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v2

    aput-object v2, v1, v6

    const/4 v2, 0x1

    iget-object v3, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

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

    iget-object v3, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-static {v1, v2, v3}, Ljavassist/CtNewConstructor;->make([Ljavassist/CtClass;[Ljavassist/CtClass;Ljavassist/CtClass;)Ljavassist/CtConstructor;

    move-result-object v0

    .line 72
    .local v0, "newCtCons":Ljavassist/CtConstructor;
    iget-object v1, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->tmplCtClass:Ljavassist/CtClass;

    invoke-virtual {v1, v0}, Ljavassist/CtClass;->addConstructor(Ljavassist/CtConstructor;)V

    .line 73
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

    .line 78
    new-array v2, v6, [Ljava/lang/Class;

    const-class v3, Ljava/lang/Class;

    aput-object v3, v2, v4

    const-class v3, [Lorg/msgpack/template/Template;

    aput-object v3, v2, v5

    invoke-virtual {p1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 79
    .local v0, "cons":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    new-array v2, v6, [Ljava/lang/Object;

    iget-object v3, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origClass:Ljava/lang/Class;

    aput-object v3, v2, v4

    iget-object v3, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->templates:[Lorg/msgpack/template/Template;

    aput-object v3, v2, v5

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 80
    .local v1, "tmpl":Ljava/lang/Object;
    check-cast v1, Lorg/msgpack/template/Template;

    .end local v1    # "tmpl":Ljava/lang/Object;
    return-object v1
.end method

.method protected buildMethodInit()V
    .registers 1

    .prologue
    .line 84
    return-void
.end method

.method protected buildReadMethodBody()Ljava/lang/String;
    .registers 14

    .prologue
    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 184
    invoke-virtual {p0}, Lorg/msgpack/template/builder/DefaultBuildContext;->resetStringBuilder()V

    .line 185
    const-string v5, "\n{\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 187
    const-string v5, "  if (!$3 && $1.trySkipNil()) {\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 188
    const-string v5, "    return null;\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 189
    const-string v5, "  }\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 191
    const-string v5, "  %s _$$_t;\n"

    new-array v6, v9, [Ljava/lang/Object;

    iget-object v7, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origName:Ljava/lang/String;

    aput-object v7, v6, v8

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 192
    const-string v5, "  if ($2 == null) {\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 193
    const-string v5, "    _$$_t = new %s();\n"

    new-array v6, v9, [Ljava/lang/Object;

    iget-object v7, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origName:Ljava/lang/String;

    aput-object v7, v6, v8

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 194
    const-string v5, "  } else {\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 195
    const-string v5, "    _$$_t = (%s) $2;\n"

    new-array v6, v9, [Ljava/lang/Object;

    iget-object v7, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origName:Ljava/lang/String;

    aput-object v7, v6, v8

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 196
    const-string v5, "  }\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 197
    const-string v5, "  $1.readArrayBegin();\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 200
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_52
    iget-object v5, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->entries:[Lorg/msgpack/template/builder/FieldEntry;

    array-length v5, v5

    if-ge v2, v5, :cond_12a

    .line 201
    iget-object v5, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->entries:[Lorg/msgpack/template/builder/FieldEntry;

    aget-object v1, v5, v2

    .line 202
    .local v1, "e":Lorg/msgpack/template/builder/FieldEntry;
    invoke-virtual {v1}, Lorg/msgpack/template/builder/FieldEntry;->isAvailable()Z

    move-result v5

    if-nez v5, :cond_69

    .line 203
    const-string v5, "  $1.skip();\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 200
    :cond_66
    :goto_66
    add-int/lit8 v2, v2, 0x1

    goto :goto_52

    .line 207
    :cond_69
    invoke-virtual {v1}, Lorg/msgpack/template/builder/FieldEntry;->isOptional()Z

    move-result v5

    if-eqz v5, :cond_79

    .line 208
    const-string v5, "  if ($1.trySkipNil()) {"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 210
    const-string v5, "  } else {\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    :cond_79
    move-object v0, v1

    .line 213
    check-cast v0, Lorg/msgpack/template/builder/DefaultFieldEntry;

    .line 214
    .local v0, "de":Lorg/msgpack/template/builder/DefaultFieldEntry;
    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getField()Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result v3

    .line 215
    .local v3, "isPrivate":Z
    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getType()Ljava/lang/Class;

    move-result-object v4

    .line 216
    .local v4, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v5

    if-eqz v5, :cond_dd

    .line 217
    if-nez v3, :cond_b3

    .line 218
    const-string v5, "    _$$_t.%s = $1.%s();\n"

    new-array v6, v10, [Ljava/lang/Object;

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {p0, v4}, Lorg/msgpack/template/builder/DefaultBuildContext;->primitiveReadName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 236
    :goto_a7
    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->isOptional()Z

    move-result v5

    if-eqz v5, :cond_66

    .line 237
    const-string v5, "  }\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    goto :goto_66

    .line 220
    :cond_b3
    const-string v5, "    %s.readPrivateField($1, _$$_t, %s.class, \"%s\", templates[%d]);\n"

    new-array v6, v12, [Ljava/lang/Object;

    const-class v7, Lorg/msgpack/template/builder/DefaultBuildContext;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getField()Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v11

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_a7

    .line 225
    :cond_dd
    if-nez v3, :cond_ff

    .line 226
    const-string v5, "    _$$_t.%s = (%s) this.templates[%d].read($1, _$$_t.%s);\n"

    new-array v6, v12, [Ljava/lang/Object;

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getJavaTypeName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v11

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_a7

    .line 230
    :cond_ff
    const-string v5, "    %s.readPrivateField($1, _$$_t, %s.class, \"%s\", templates[%d]);\n"

    new-array v6, v12, [Ljava/lang/Object;

    const-class v7, Lorg/msgpack/template/builder/DefaultBuildContext;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getField()Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v11

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_a7

    .line 241
    .end local v0    # "de":Lorg/msgpack/template/builder/DefaultFieldEntry;
    .end local v1    # "e":Lorg/msgpack/template/builder/FieldEntry;
    .end local v3    # "isPrivate":Z
    .end local v4    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_12a
    const-string v5, "  $1.readArrayEnd();\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 242
    const-string v5, "  return _$$_t;\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 244
    const-string v5, "}\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 245
    invoke-virtual {p0}, Lorg/msgpack/template/builder/DefaultBuildContext;->getBuiltString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public buildTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;[Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;
    .registers 5
    .param p1, "targetClass"    # Ljava/lang/Class;
    .param p2, "entries"    # [Lorg/msgpack/template/builder/FieldEntry;
    .param p3, "templates"    # [Lorg/msgpack/template/Template;

    .prologue
    .line 52
    iput-object p2, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->entries:[Lorg/msgpack/template/builder/FieldEntry;

    .line 53
    iput-object p3, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->templates:[Lorg/msgpack/template/Template;

    .line 54
    iput-object p1, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origClass:Ljava/lang/Class;

    .line 55
    iget-object v0, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origName:Ljava/lang/String;

    .line 56
    iget-object v0, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origName:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/msgpack/template/builder/DefaultBuildContext;->build(Ljava/lang/String;)Lorg/msgpack/template/Template;

    move-result-object v0

    return-object v0
.end method

.method protected buildWriteMethodBody()Ljava/lang/String;
    .registers 14

    .prologue
    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 87
    invoke-virtual {p0}, Lorg/msgpack/template/builder/DefaultBuildContext;->resetStringBuilder()V

    .line 88
    const-string v5, "\n{\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 90
    const-string v5, "  if ($2 == null) {\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 91
    const-string v5, "    if ($3) {\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 92
    const-string v5, "      throw new %s(\"Attempted to write null\");\n"

    new-array v6, v9, [Ljava/lang/Object;

    const-class v7, Lorg/msgpack/MessageTypeException;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 93
    const-string v5, "    }\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 94
    const-string v5, "    $1.writeNil();\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 95
    const-string v5, "    return;\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 96
    const-string v5, "  }\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 98
    const-string v5, "  %s _$$_t = (%s) $2;\n"

    new-array v6, v10, [Ljava/lang/Object;

    iget-object v7, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origName:Ljava/lang/String;

    aput-object v7, v6, v8

    iget-object v7, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origName:Ljava/lang/String;

    aput-object v7, v6, v9

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 99
    const-string v5, "  $1.writeArrayBegin(%d);\n"

    new-array v6, v9, [Ljava/lang/Object;

    iget-object v7, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->entries:[Lorg/msgpack/template/builder/FieldEntry;

    array-length v7, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 101
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5a
    iget-object v5, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->entries:[Lorg/msgpack/template/builder/FieldEntry;

    array-length v5, v5

    if-ge v2, v5, :cond_169

    .line 102
    iget-object v5, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->entries:[Lorg/msgpack/template/builder/FieldEntry;

    aget-object v1, v5, v2

    .line 103
    .local v1, "e":Lorg/msgpack/template/builder/FieldEntry;
    invoke-virtual {v1}, Lorg/msgpack/template/builder/FieldEntry;->isAvailable()Z

    move-result v5

    if-nez v5, :cond_71

    .line 104
    const-string v5, "  $1.writeNil();\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 101
    :goto_6e
    add-int/lit8 v2, v2, 0x1

    goto :goto_5a

    :cond_71
    move-object v0, v1

    .line 107
    check-cast v0, Lorg/msgpack/template/builder/DefaultFieldEntry;

    .line 108
    .local v0, "de":Lorg/msgpack/template/builder/DefaultFieldEntry;
    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getField()Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result v3

    .line 109
    .local v3, "isPrivate":Z
    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getType()Ljava/lang/Class;

    move-result-object v4

    .line 110
    .local v4, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v5

    if-eqz v5, :cond_ca

    .line 111
    if-nez v3, :cond_a0

    .line 112
    const-string v5, "  $1.%s(_$$_t.%s);\n"

    new-array v6, v10, [Ljava/lang/Object;

    invoke-virtual {p0, v4}, Lorg/msgpack/template/builder/DefaultBuildContext;->primitiveWriteName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_6e

    .line 114
    :cond_a0
    const-string v5, "  %s.writePrivateField($1, _$$_t, %s.class, \"%s\", templates[%d]);\n"

    new-array v6, v12, [Ljava/lang/Object;

    const-class v7, Lorg/msgpack/template/builder/DefaultBuildContext;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getField()Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v11

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_6e

    .line 119
    :cond_ca
    if-nez v3, :cond_115

    .line 120
    const-string v5, "  if (_$$_t.%s == null) {\n"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 126
    :goto_d9
    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->isNotNullable()Z

    move-result v5

    if-eqz v5, :cond_139

    .line 127
    const-string v5, "    throw new %s(\"%s cannot be null by @NotNullable\");\n"

    new-array v6, v10, [Ljava/lang/Object;

    const-class v7, Lorg/msgpack/MessageTypeException;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 133
    :goto_f4
    const-string v5, "  } else {\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 134
    if-nez v3, :cond_13f

    .line 135
    const-string v5, "    templates[%d].write($1, _$$_t.%s);\n"

    new-array v6, v10, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 141
    :goto_10e
    const-string v5, "  }\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    goto/16 :goto_6e

    .line 122
    :cond_115
    const-string v5, "  if (%s.readPrivateField(_$$_t, %s.class, \"%s\") == null) {\n"

    new-array v6, v11, [Ljava/lang/Object;

    const-class v7, Lorg/msgpack/template/builder/DefaultBuildContext;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getField()Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_d9

    .line 131
    :cond_139
    const-string v5, "    $1.writeNil();\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    goto :goto_f4

    .line 137
    :cond_13f
    const-string v5, "    %s.writePrivateField($1, _$$_t, %s.class, \"%s\", templates[%d]);\n"

    new-array v6, v12, [Ljava/lang/Object;

    const-class v7, Lorg/msgpack/template/builder/DefaultBuildContext;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getField()Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {v0}, Lorg/msgpack/template/builder/DefaultFieldEntry;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v11

    invoke-virtual {p0, v5, v6}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_10e

    .line 145
    .end local v0    # "de":Lorg/msgpack/template/builder/DefaultFieldEntry;
    .end local v1    # "e":Lorg/msgpack/template/builder/FieldEntry;
    .end local v3    # "isPrivate":Z
    .end local v4    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_169
    const-string v5, "  $1.writeArrayEnd();\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 146
    const-string v5, "}\n"

    invoke-virtual {p0, v5}, Lorg/msgpack/template/builder/DefaultBuildContext;->buildString(Ljava/lang/String;)V

    .line 147
    invoke-virtual {p0}, Lorg/msgpack/template/builder/DefaultBuildContext;->getBuiltString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public loadTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;[Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;
    .registers 5
    .param p2, "entries"    # [Lorg/msgpack/template/builder/FieldEntry;
    .param p3, "templates"    # [Lorg/msgpack/template/Template;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Lorg/msgpack/template/builder/FieldEntry;",
            "[",
            "Lorg/msgpack/template/Template;",
            ")",
            "Lorg/msgpack/template/Template;"
        }
    .end annotation

    .prologue
    .line 280
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iput-object p2, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->entries:[Lorg/msgpack/template/builder/FieldEntry;

    .line 281
    iput-object p3, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->templates:[Lorg/msgpack/template/Template;

    .line 282
    iput-object p1, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origClass:Ljava/lang/Class;

    .line 283
    iget-object v0, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origName:Ljava/lang/String;

    .line 284
    iget-object v0, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origName:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/msgpack/template/builder/DefaultBuildContext;->load(Ljava/lang/String;)Lorg/msgpack/template/Template;

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
    .line 60
    iget-object v0, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->tmplCtClass:Ljavassist/CtClass;

    iget-object v1, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->director:Lorg/msgpack/template/builder/JavassistTemplateBuilder;

    const-class v2, Lorg/msgpack/template/builder/JavassistTemplateBuilder$JavassistTemplate;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/msgpack/template/builder/JavassistTemplateBuilder;->getCtClass(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavassist/CtClass;->setSuperclass(Ljavassist/CtClass;)V

    .line 62
    return-void
.end method

.method public writeTemplate(Ljava/lang/Class;[Lorg/msgpack/template/builder/FieldEntry;[Lorg/msgpack/template/Template;Ljava/lang/String;)V
    .registers 6
    .param p2, "entries"    # [Lorg/msgpack/template/builder/FieldEntry;
    .param p3, "templates"    # [Lorg/msgpack/template/Template;
    .param p4, "directoryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Lorg/msgpack/template/builder/FieldEntry;",
            "[",
            "Lorg/msgpack/template/Template;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 271
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iput-object p2, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->entries:[Lorg/msgpack/template/builder/FieldEntry;

    .line 272
    iput-object p3, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->templates:[Lorg/msgpack/template/Template;

    .line 273
    iput-object p1, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origClass:Ljava/lang/Class;

    .line 274
    iget-object v0, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origName:Ljava/lang/String;

    .line 275
    iget-object v0, p0, Lorg/msgpack/template/builder/DefaultBuildContext;->origName:Ljava/lang/String;

    invoke-virtual {p0, v0, p4}, Lorg/msgpack/template/builder/DefaultBuildContext;->write(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    return-void
.end method
