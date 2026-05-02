.class public Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;
.super Ljava/lang/Object;
.source "BeanPropertyValueEqualsPredicate.java"

# interfaces
.implements Lorg/apache/commons/collections/Predicate;


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
    .line 151
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 152
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;Z)V
    .registers 6
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "propertyValue"    # Ljava/lang/Object;
    .param p3, "ignoreNull"    # Z

    .prologue
    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->log:Lorg/apache/commons/logging/Log;

    .line 168
    if-eqz p1, :cond_1c

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1c

    .line 169
    iput-object p1, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->propertyName:Ljava/lang/String;

    .line 170
    iput-object p2, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->propertyValue:Ljava/lang/Object;

    .line 171
    iput-boolean p3, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->ignoreNull:Z

    .line 175
    return-void

    .line 173
    :cond_1c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "propertyName cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public evaluate(Ljava/lang/Object;)Z
    .registers 9
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 197
    const/4 v2, 0x0

    .line 200
    .local v2, "evaluation":Z
    :try_start_1
    iget-object v4, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->propertyValue:Ljava/lang/Object;

    iget-object v5, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->propertyName:Ljava/lang/String;

    invoke-static {p1, v5}, Lorg/apache/commons/beanutils/PropertyUtils;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->evaluateValue(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_c} :catch_e
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_c} :catch_43
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_c} :catch_5b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_c} :catch_73

    move-result v2

    .line 237
    :goto_d
    return v2

    .line 202
    :catch_e
    move-exception v0

    .line 203
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v1, "Problem during evaluation. Null value encountered in property path..."

    .line 205
    .local v1, "errorMsg":Ljava/lang/String;
    iget-boolean v4, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->ignoreNull:Z

    if-eqz v4, :cond_2e

    .line 206
    iget-object v4, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "WARNING: Problem during evaluation. Null value encountered in property path..."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    goto :goto_d

    .line 208
    :cond_2e
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Problem during evaluation. Null value encountered in property path..."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 209
    .local v3, "iae":Ljava/lang/IllegalArgumentException;
    invoke-static {v3, v0}, Lorg/apache/commons/beanutils/BeanUtils;->initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    move-result v4

    if-nez v4, :cond_42

    .line 210
    iget-object v4, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Problem during evaluation. Null value encountered in property path..."

    invoke-interface {v4, v5, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 212
    :cond_42
    throw v3

    .line 214
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .end local v1    # "errorMsg":Ljava/lang/String;
    .end local v3    # "iae":Ljava/lang/IllegalArgumentException;
    :catch_43
    move-exception v0

    .line 215
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v1, "Unable to access the property provided."

    .line 216
    .restart local v1    # "errorMsg":Ljava/lang/String;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Unable to access the property provided."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 217
    .restart local v3    # "iae":Ljava/lang/IllegalArgumentException;
    invoke-static {v3, v0}, Lorg/apache/commons/beanutils/BeanUtils;->initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    move-result v4

    if-nez v4, :cond_5a

    .line 218
    iget-object v4, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Unable to access the property provided."

    invoke-interface {v4, v5, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 220
    :cond_5a
    throw v3

    .line 221
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "errorMsg":Ljava/lang/String;
    .end local v3    # "iae":Ljava/lang/IllegalArgumentException;
    :catch_5b
    move-exception v0

    .line 222
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v1, "Exception occurred in property\'s getter"

    .line 223
    .restart local v1    # "errorMsg":Ljava/lang/String;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Exception occurred in property\'s getter"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 224
    .restart local v3    # "iae":Ljava/lang/IllegalArgumentException;
    invoke-static {v3, v0}, Lorg/apache/commons/beanutils/BeanUtils;->initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    move-result v4

    if-nez v4, :cond_72

    .line 225
    iget-object v4, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Exception occurred in property\'s getter"

    invoke-interface {v4, v5, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 227
    :cond_72
    throw v3

    .line 228
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v1    # "errorMsg":Ljava/lang/String;
    .end local v3    # "iae":Ljava/lang/IllegalArgumentException;
    :catch_73
    move-exception v0

    .line 229
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const-string v1, "Property not found."

    .line 230
    .restart local v1    # "errorMsg":Ljava/lang/String;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Property not found."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 231
    .restart local v3    # "iae":Ljava/lang/IllegalArgumentException;
    invoke-static {v3, v0}, Lorg/apache/commons/beanutils/BeanUtils;->initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    move-result v4

    if-nez v4, :cond_8a

    .line 232
    iget-object v4, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Property not found."

    invoke-interface {v4, v5, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 234
    :cond_8a
    throw v3
.end method

.method protected evaluateValue(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "expected"    # Ljava/lang/Object;
    .param p2, "actual"    # Ljava/lang/Object;

    .prologue
    .line 249
    if-eq p1, p2, :cond_a

    if-eqz p1, :cond_c

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public getPropertyName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 260
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->propertyName:Ljava/lang/String;

    return-object v0
.end method

.method public getPropertyValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 271
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->propertyValue:Ljava/lang/Object;

    return-object v0
.end method

.method public isIgnoreNull()Z
    .registers 2

    .prologue
    .line 288
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/BeanPropertyValueEqualsPredicate;->ignoreNull:Z

    return v0
.end method
