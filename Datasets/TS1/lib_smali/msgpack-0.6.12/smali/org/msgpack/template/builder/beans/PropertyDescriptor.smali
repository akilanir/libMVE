.class public Lorg/msgpack/template/builder/beans/PropertyDescriptor;
.super Lorg/msgpack/template/builder/beans/FeatureDescriptor;
.source "PropertyDescriptor.java"


# instance fields
.field bound:Z

.field constrained:Z

.field private getter:Ljava/lang/reflect/Method;

.field private propertyEditorClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private setter:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 6
    .param p1, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 81
    .local p2, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/FeatureDescriptor;-><init>()V

    .line 82
    if-nez p2, :cond_11

    .line 83
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "custom.beans.03"

    invoke-static {v2}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 85
    :cond_11
    if-eqz p1, :cond_19

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_25

    .line 86
    :cond_19
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "custom.beans.04"

    invoke-static {v2}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 88
    :cond_25
    invoke-virtual {p0, p1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setName(Ljava/lang/String;)V

    .line 90
    :try_start_28
    const-string v1, "is"

    invoke-virtual {p0, p1, v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->createDefaultMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p2, v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setReadMethod(Ljava/lang/Class;Ljava/lang/String;)V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_31} :catch_3b

    .line 97
    :goto_31
    const-string v1, "set"

    invoke-virtual {p0, p1, v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->createDefaultMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p2, v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setWriteMethod(Ljava/lang/Class;Ljava/lang/String;)V

    .line 98
    return-void

    .line 92
    :catch_3b
    move-exception v0

    .line 93
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "get"

    invoke-virtual {p0, p1, v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->createDefaultMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p2, v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setReadMethod(Ljava/lang/Class;Ljava/lang/String;)V

    goto :goto_31
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p3, "getterName"    # Ljava/lang/String;
    .param p4, "setterName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 40
    .local p2, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/FeatureDescriptor;-><init>()V

    .line 41
    if-nez p2, :cond_11

    .line 42
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "custom.beans.03"

    invoke-static {v2}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 44
    :cond_11
    if-eqz p1, :cond_19

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_25

    .line 45
    :cond_19
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "custom.beans.04"

    invoke-static {v2}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 47
    :cond_25
    invoke-virtual {p0, p1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setName(Ljava/lang/String;)V

    .line 48
    if-eqz p3, :cond_3b

    .line 49
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_38

    .line 50
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "read or write method cannot be empty."

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 54
    :cond_38
    :try_start_38
    invoke-virtual {p0, p2, p3}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setReadMethod(Ljava/lang/Class;Ljava/lang/String;)V
    :try_end_3b
    .catch Lorg/msgpack/template/builder/beans/IntrospectionException; {:try_start_38 .. :try_end_3b} :catch_4b

    .line 60
    :cond_3b
    :goto_3b
    if-eqz p4, :cond_59

    .line 61
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_56

    .line 62
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "read or write method cannot be empty."

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 55
    :catch_4b
    move-exception v0

    .line 56
    .local v0, "e":Lorg/msgpack/template/builder/beans/IntrospectionException;
    const-string v1, "get"

    invoke-virtual {p0, p1, v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->createDefaultMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p2, v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setReadMethod(Ljava/lang/Class;Ljava/lang/String;)V

    goto :goto_3b

    .line 65
    .end local v0    # "e":Lorg/msgpack/template/builder/beans/IntrospectionException;
    :cond_56
    invoke-virtual {p0, p2, p4}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setWriteMethod(Ljava/lang/Class;Ljava/lang/String;)V

    .line 67
    :cond_59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V
    .registers 6
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "getter"    # Ljava/lang/reflect/Method;
    .param p3, "setter"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 71
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/FeatureDescriptor;-><init>()V

    .line 72
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_17

    .line 73
    :cond_b
    new-instance v0, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v1, "custom.beans.04"

    invoke-static {v1}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_17
    invoke-virtual {p0, p1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setName(Ljava/lang/String;)V

    .line 76
    invoke-virtual {p0, p2}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setReadMethod(Ljava/lang/reflect/Method;)V

    .line 77
    invoke-virtual {p0, p3}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setWriteMethod(Ljava/lang/reflect/Method;)V

    .line 78
    return-void
.end method


# virtual methods
.method createDefaultMethodName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 219
    const/4 v2, 0x0

    .line 220
    .local v2, "result":Ljava/lang/String;
    if-eqz p1, :cond_2a

    .line 221
    const/4 v3, 0x0

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/harmony/beans/BeansUtils;->toASCIIUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 222
    .local v0, "bos":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 223
    .local v1, "eos":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 225
    .end local v0    # "bos":Ljava/lang/String;
    .end local v1    # "eos":Ljava/lang/String;
    :cond_2a
    return-object v2
.end method

.method public createPropertyEditor(Ljava/lang/Object;)Lorg/msgpack/template/builder/beans/PropertyEditor;
    .registers 10
    .param p1, "bean"    # Ljava/lang/Object;

    .prologue
    .line 273
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->propertyEditorClass:Ljava/lang/Class;

    if-nez v4, :cond_6

    .line 274
    const/4 v2, 0x0

    .line 298
    :goto_5
    return-object v2

    .line 276
    :cond_6
    const-class v4, Lorg/msgpack/template/builder/beans/PropertyEditor;

    iget-object v5, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->propertyEditorClass:Ljava/lang/Class;

    invoke-virtual {v4, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-nez v4, :cond_1c

    .line 279
    new-instance v4, Ljava/lang/ClassCastException;

    const-string v5, "custom.beans.48"

    invoke-static {v5}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 285
    :cond_1c
    :try_start_1c
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->propertyEditorClass:Ljava/lang/Class;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ljava/lang/Object;

    aput-object v7, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 286
    .local v0, "constr":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v0, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/msgpack/template/builder/beans/PropertyEditor;
    :try_end_36
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1c .. :try_end_36} :catch_37
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_36} :catch_4b

    .local v2, "editor":Lorg/msgpack/template/builder/beans/PropertyEditor;
    goto :goto_5

    .line 287
    .end local v0    # "constr":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v2    # "editor":Lorg/msgpack/template/builder/beans/PropertyEditor;
    :catch_37
    move-exception v1

    .line 289
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    :try_start_38
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->propertyEditorClass:Ljava/lang/Class;

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 290
    .restart local v0    # "constr":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v0, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/msgpack/template/builder/beans/PropertyEditor;
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_4a} :catch_4b

    .restart local v2    # "editor":Lorg/msgpack/template/builder/beans/PropertyEditor;
    goto :goto_5

    .line 292
    .end local v0    # "constr":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    .end local v2    # "editor":Lorg/msgpack/template/builder/beans/PropertyEditor;
    :catch_4b
    move-exception v1

    .line 294
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "custom.beans.47"

    invoke-static {v4}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 296
    .local v3, "re":Ljava/lang/RuntimeException;
    throw v3
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 14
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 151
    instance-of v6, p1, Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .line 152
    .local v6, "result":Z
    if-eqz v6, :cond_78

    move-object v3, p1

    .line 153
    check-cast v3, Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .line 154
    .local v3, "pd":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    iget-object v10, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getter:Ljava/lang/reflect/Method;

    if-nez v10, :cond_13

    invoke-virtual {v3}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v10

    if-eqz v10, :cond_23

    :cond_13
    iget-object v10, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getter:Ljava/lang/reflect/Method;

    if-eqz v10, :cond_79

    iget-object v10, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getter:Ljava/lang/reflect/Method;

    invoke-virtual {v3}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_79

    :cond_23
    move v2, v9

    .line 157
    .local v2, "gettersAreEqual":Z
    :goto_24
    iget-object v10, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setter:Ljava/lang/reflect/Method;

    if-nez v10, :cond_2e

    invoke-virtual {v3}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v10

    if-eqz v10, :cond_3e

    :cond_2e
    iget-object v10, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setter:Ljava/lang/reflect/Method;

    if-eqz v10, :cond_7b

    iget-object v10, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setter:Ljava/lang/reflect/Method;

    invoke-virtual {v3}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7b

    :cond_3e
    move v7, v9

    .line 160
    .local v7, "settersAreEqual":Z
    :goto_3f
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v3}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v11

    if-ne v10, v11, :cond_7d

    move v5, v9

    .line 162
    .local v5, "propertyTypesAreEqual":Z
    :goto_4a
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getPropertyEditorClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v3}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getPropertyEditorClass()Ljava/lang/Class;

    move-result-object v11

    if-ne v10, v11, :cond_7f

    move v4, v9

    .line 164
    .local v4, "propertyEditorClassesAreEqual":Z
    :goto_55
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->isBound()Z

    move-result v10

    invoke-virtual {v3}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->isBound()Z

    move-result v11

    if-ne v10, v11, :cond_81

    move v0, v9

    .line 165
    .local v0, "boundPropertyAreEqual":Z
    :goto_60
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->isConstrained()Z

    move-result v10

    invoke-virtual {v3}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->isConstrained()Z

    move-result v11

    if-ne v10, v11, :cond_83

    move v1, v9

    .line 167
    .local v1, "constrainedPropertyAreEqual":Z
    :goto_6b
    if-eqz v2, :cond_85

    if-eqz v7, :cond_85

    if-eqz v5, :cond_85

    if-eqz v4, :cond_85

    if-eqz v0, :cond_85

    if-eqz v1, :cond_85

    move v6, v9

    .line 171
    .end local v0    # "boundPropertyAreEqual":Z
    .end local v1    # "constrainedPropertyAreEqual":Z
    .end local v2    # "gettersAreEqual":Z
    .end local v3    # "pd":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .end local v4    # "propertyEditorClassesAreEqual":Z
    .end local v5    # "propertyTypesAreEqual":Z
    .end local v7    # "settersAreEqual":Z
    :cond_78
    :goto_78
    return v6

    .restart local v3    # "pd":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    :cond_79
    move v2, v8

    .line 154
    goto :goto_24

    .restart local v2    # "gettersAreEqual":Z
    :cond_7b
    move v7, v8

    .line 157
    goto :goto_3f

    .restart local v7    # "settersAreEqual":Z
    :cond_7d
    move v5, v8

    .line 160
    goto :goto_4a

    .restart local v5    # "propertyTypesAreEqual":Z
    :cond_7f
    move v4, v8

    .line 162
    goto :goto_55

    .restart local v4    # "propertyEditorClassesAreEqual":Z
    :cond_81
    move v0, v8

    .line 164
    goto :goto_60

    .restart local v0    # "boundPropertyAreEqual":Z
    :cond_83
    move v1, v8

    .line 165
    goto :goto_6b

    .restart local v1    # "constrainedPropertyAreEqual":Z
    :cond_85
    move v6, v8

    .line 167
    goto :goto_78
.end method

.method public getPropertyEditorClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 199
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->propertyEditorClass:Ljava/lang/Class;

    return-object v0
.end method

.method public getPropertyType()Ljava/lang/Class;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 188
    const/4 v1, 0x0

    .line 189
    .local v1, "result":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getter:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_c

    .line 190
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getter:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    .line 195
    :cond_b
    :goto_b
    return-object v1

    .line 191
    :cond_c
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setter:Ljava/lang/reflect/Method;

    if-eqz v2, :cond_b

    .line 192
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setter:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    .line 193
    .local v0, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v2, 0x0

    aget-object v1, v0, v2

    goto :goto_b
.end method

.method public getReadMethod()Ljava/lang/reflect/Method;
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getter:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method public getWriteMethod()Ljava/lang/reflect/Method;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setter:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 176
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getter:Ljava/lang/reflect/Method;

    invoke-static {v0}, Lorg/apache/harmony/beans/BeansUtils;->getHashCode(Ljava/lang/Object;)I

    move-result v0

    iget-object v1, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setter:Ljava/lang/reflect/Method;

    invoke-static {v1}, Lorg/apache/harmony/beans/BeansUtils;->getHashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/harmony/beans/BeansUtils;->getHashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getPropertyEditorClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/harmony/beans/BeansUtils;->getHashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->isBound()Z

    move-result v1

    invoke-static {v1}, Lorg/apache/harmony/beans/BeansUtils;->getHashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->isConstrained()Z

    move-result v1

    invoke-static {v1}, Lorg/apache/harmony/beans/BeansUtils;->getHashCode(Z)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isBound()Z
    .registers 2

    .prologue
    .line 215
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->bound:Z

    return v0
.end method

.method public isConstrained()Z
    .registers 2

    .prologue
    .line 211
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->constrained:Z

    return v0
.end method

.method public setBound(Z)V
    .registers 2
    .param p1, "bound"    # Z

    .prologue
    .line 207
    iput-boolean p1, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->bound:Z

    .line 208
    return-void
.end method

.method public setConstrained(Z)V
    .registers 2
    .param p1, "constrained"    # Z

    .prologue
    .line 203
    iput-boolean p1, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->constrained:Z

    .line 204
    return-void
.end method

.method public setPropertyEditorClass(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 184
    .local p1, "propertyEditorClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->propertyEditorClass:Ljava/lang/Class;

    .line 185
    return-void
.end method

.method setReadMethod(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 7
    .param p2, "getterName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 231
    .local p1, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x0

    :try_start_1
    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {p1, p2, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 232
    .local v1, "readMethod":Ljava/lang/reflect/Method;
    invoke-virtual {p0, v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setReadMethod(Ljava/lang/reflect/Method;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_a} :catch_b

    .line 236
    return-void

    .line 233
    .end local v1    # "readMethod":Ljava/lang/reflect/Method;
    :catch_b
    move-exception v0

    .line 234
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lorg/msgpack/template/builder/beans/IntrospectionException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public setReadMethod(Ljava/lang/reflect/Method;)V
    .registers 8
    .param p1, "getter"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 120
    if-eqz p1, :cond_5b

    .line 121
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v0

    .line 122
    .local v0, "modifiers":I
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v4

    if-nez v4, :cond_18

    .line 123
    new-instance v4, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v5, "custom.beans.0A"

    invoke-static {v5}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 125
    :cond_18
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    .line 126
    .local v1, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v4, v1

    if-eqz v4, :cond_2b

    .line 127
    new-instance v4, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v5, "custom.beans.08"

    invoke-static {v5}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 129
    :cond_2b
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v3

    .line 130
    .local v3, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v4, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_43

    .line 131
    new-instance v4, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v5, "custom.beans.33"

    invoke-static {v5}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 133
    :cond_43
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v2

    .line 134
    .local v2, "propertyType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v2, :cond_5b

    invoke-virtual {v3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5b

    .line 135
    new-instance v4, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v5, "custom.beans.09"

    invoke-static {v5}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 138
    .end local v0    # "modifiers":I
    .end local v1    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v2    # "propertyType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_5b
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getter:Ljava/lang/reflect/Method;

    .line 139
    return-void
.end method

.method setWriteMethod(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 14
    .param p2, "setterName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .local p1, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v9, 0x1

    .line 240
    const/4 v7, 0x0

    .line 242
    .local v7, "writeMethod":Ljava/lang/reflect/Method;
    :try_start_2
    iget-object v8, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getter:Ljava/lang/reflect/Method;

    if-eqz v8, :cond_24

    .line 243
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Class;

    const/4 v9, 0x0

    iget-object v10, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getter:Ljava/lang/reflect/Method;

    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {p1, p2, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_15} :catch_4f

    move-result-object v7

    .line 264
    :cond_16
    if-nez v7, :cond_5a

    .line 265
    new-instance v8, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v9, "custom.beans.64"

    invoke-static {v9, p2}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 246
    :cond_24
    move-object v1, p1

    .line 247
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v6, 0x0

    .line 248
    .local v6, "methods":[Ljava/lang/reflect/Method;
    :goto_26
    if-eqz v1, :cond_16

    if-nez v7, :cond_16

    .line 249
    :try_start_2a
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v6

    .line 250
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_31
    if-ge v3, v4, :cond_47

    aget-object v5, v0, v3

    .line 251
    .local v5, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p2, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4c

    .line 252
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v8

    array-length v8, v8

    if-ne v8, v9, :cond_4c

    .line 253
    move-object v7, v5

    .line 258
    .end local v5    # "method":Ljava/lang/reflect/Method;
    :cond_47
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_4a} :catch_4f

    move-result-object v1

    goto :goto_26

    .line 250
    .restart local v5    # "method":Ljava/lang/reflect/Method;
    :cond_4c
    add-int/lit8 v3, v3, 0x1

    goto :goto_31

    .line 261
    .end local v0    # "arr$":[Ljava/lang/reflect/Method;
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "method":Ljava/lang/reflect/Method;
    .end local v6    # "methods":[Ljava/lang/reflect/Method;
    :catch_4f
    move-exception v2

    .line 262
    .local v2, "e":Ljava/lang/Exception;
    new-instance v8, Lorg/msgpack/template/builder/beans/IntrospectionException;

    invoke-virtual {v2}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 268
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_5a
    invoke-virtual {p0, v7}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setWriteMethod(Ljava/lang/reflect/Method;)V

    .line 269
    return-void
.end method

.method public setWriteMethod(Ljava/lang/reflect/Method;)V
    .registers 8
    .param p1, "setter"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 101
    if-eqz p1, :cond_47

    .line 102
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v0

    .line 103
    .local v0, "modifiers":I
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v4

    if-nez v4, :cond_18

    .line 104
    new-instance v4, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v5, "custom.beans.05"

    invoke-static {v5}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 106
    :cond_18
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    .line 107
    .local v2, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v4, v2

    const/4 v5, 0x1

    if-eq v4, v5, :cond_2c

    .line 108
    new-instance v4, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v5, "custom.beans.06"

    invoke-static {v5}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 110
    :cond_2c
    const/4 v4, 0x0

    aget-object v1, v2, v4

    .line 111
    .local v1, "parameterType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v3

    .line 112
    .local v3, "propertyType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v3, :cond_47

    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_47

    .line 113
    new-instance v4, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v5, "custom.beans.07"

    invoke-static {v5}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 116
    .end local v0    # "modifiers":I
    .end local v1    # "parameterType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v3    # "propertyType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_47
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setter:Ljava/lang/reflect/Method;

    .line 117
    return-void
.end method
