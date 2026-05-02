.class public Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;
.super Ljava/lang/Object;
.source "BeanPropertyValueChangeClosure.java"

# interfaces
.implements Lorg/apache/commons/collections/Closure;


# instance fields
.field private ignoreNull:Z

.field private final log:Lorg/apache/commons/logging/Log;

.field private propertyName:Ljava/lang/String;

.field private propertyValue:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "propertyValue"    # Ljava/lang/Object;

    .prologue
    .line 121
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 122
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;Z)V
    .registers 6
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "propertyValue"    # Ljava/lang/Object;
    .param p3, "ignoreNull"    # Z

    .prologue
    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->log:Lorg/apache/commons/logging/Log;

    .line 140
    if-eqz p1, :cond_1c

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1c

    .line 141
    iput-object p1, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->propertyName:Ljava/lang/String;

    .line 142
    iput-object p2, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->propertyValue:Ljava/lang/Object;

    .line 143
    iput-boolean p3, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->ignoreNull:Z

    .line 147
    return-void

    .line 145
    :cond_1c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "propertyName cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public execute(Ljava/lang/Object;)V
    .registers 8
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 166
    :try_start_0
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->propertyName:Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->propertyValue:Ljava/lang/Object;

    invoke-static {p1, v3, v4}, Lorg/apache/commons/beanutils/PropertyUtils;->setProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_7} :catch_8
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_7} :catch_3d
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_7} :catch_55
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_7} :catch_6d

    .line 201
    :goto_7
    return-void

    .line 167
    :catch_8
    move-exception v0

    .line 168
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v1, "Unable to execute Closure. Null value encountered in property path..."

    .line 170
    .local v1, "errorMsg":Ljava/lang/String;
    iget-boolean v3, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->ignoreNull:Z

    if-eqz v3, :cond_28

    .line 171
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "WARNING: Unable to execute Closure. Null value encountered in property path..."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    goto :goto_7

    .line 173
    :cond_28
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Unable to execute Closure. Null value encountered in property path..."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 174
    .local v2, "iae":Ljava/lang/IllegalArgumentException;
    invoke-static {v2, v0}, Lorg/apache/commons/beanutils/BeanUtils;->initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    move-result v3

    if-nez v3, :cond_3c

    .line 175
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Unable to execute Closure. Null value encountered in property path..."

    invoke-interface {v3, v4, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 177
    :cond_3c
    throw v2

    .line 179
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .end local v1    # "errorMsg":Ljava/lang/String;
    .end local v2    # "iae":Ljava/lang/IllegalArgumentException;
    :catch_3d
    move-exception v0

    .line 180
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v1, "Unable to access the property provided."

    .line 181
    .restart local v1    # "errorMsg":Ljava/lang/String;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Unable to access the property provided."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 182
    .restart local v2    # "iae":Ljava/lang/IllegalArgumentException;
    invoke-static {v2, v0}, Lorg/apache/commons/beanutils/BeanUtils;->initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    move-result v3

    if-nez v3, :cond_54

    .line 183
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Unable to access the property provided."

    invoke-interface {v3, v4, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 185
    :cond_54
    throw v2

    .line 186
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "errorMsg":Ljava/lang/String;
    .end local v2    # "iae":Ljava/lang/IllegalArgumentException;
    :catch_55
    move-exception v0

    .line 187
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v1, "Exception occurred in property\'s getter"

    .line 188
    .restart local v1    # "errorMsg":Ljava/lang/String;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Exception occurred in property\'s getter"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 189
    .restart local v2    # "iae":Ljava/lang/IllegalArgumentException;
    invoke-static {v2, v0}, Lorg/apache/commons/beanutils/BeanUtils;->initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    move-result v3

    if-nez v3, :cond_6c

    .line 190
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Exception occurred in property\'s getter"

    invoke-interface {v3, v4, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 192
    :cond_6c
    throw v2

    .line 193
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v1    # "errorMsg":Ljava/lang/String;
    .end local v2    # "iae":Ljava/lang/IllegalArgumentException;
    :catch_6d
    move-exception v0

    .line 194
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const-string v1, "Property not found"

    .line 195
    .restart local v1    # "errorMsg":Ljava/lang/String;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Property not found"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 196
    .restart local v2    # "iae":Ljava/lang/IllegalArgumentException;
    invoke-static {v2, v0}, Lorg/apache/commons/beanutils/BeanUtils;->initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    move-result v3

    if-nez v3, :cond_84

    .line 197
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Property not found"

    invoke-interface {v3, v4, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 199
    :cond_84
    throw v2
.end method

.method public getPropertyName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 209
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->propertyName:Ljava/lang/String;

    return-object v0
.end method

.method public getPropertyValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 220
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->propertyValue:Ljava/lang/Object;

    return-object v0
.end method

.method public isIgnoreNull()Z
    .registers 2

    .prologue
    .line 237
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/BeanPropertyValueChangeClosure;->ignoreNull:Z

    return v0
.end method
