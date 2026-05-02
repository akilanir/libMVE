.class public Lorg/apache/commons/beanutils/BeanPredicate;
.super Ljava/lang/Object;
.source "BeanPredicate.java"

# interfaces
.implements Lorg/apache/commons/collections/Predicate;


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;

.field private predicate:Lorg/apache/commons/collections/Predicate;

.field private propertyName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/apache/commons/collections/Predicate;)V
    .registers 4
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "predicate"    # Lorg/apache/commons/collections/Predicate;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/BeanPredicate;->log:Lorg/apache/commons/logging/Log;

    .line 49
    iput-object p1, p0, Lorg/apache/commons/beanutils/BeanPredicate;->propertyName:Ljava/lang/String;

    .line 50
    iput-object p2, p0, Lorg/apache/commons/beanutils/BeanPredicate;->predicate:Lorg/apache/commons/collections/Predicate;

    .line 51
    return-void
.end method


# virtual methods
.method public evaluate(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 63
    const/4 v2, 0x0

    .line 66
    .local v2, "evaluation":Z
    :try_start_1
    iget-object v4, p0, Lorg/apache/commons/beanutils/BeanPredicate;->propertyName:Ljava/lang/String;

    invoke-static {p1, v4}, Lorg/apache/commons/beanutils/PropertyUtils;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 67
    .local v3, "propValue":Ljava/lang/Object;
    iget-object v4, p0, Lorg/apache/commons/beanutils/BeanPredicate;->predicate:Lorg/apache/commons/collections/Predicate;

    invoke-interface {v4, v3}, Lorg/apache/commons/collections/Predicate;->evaluate(Ljava/lang/Object;)Z
    :try_end_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_c} :catch_e
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_c} :catch_19
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_c} :catch_2b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_c} :catch_3d

    move-result v2

    .line 86
    return v2

    .line 68
    .end local v3    # "propValue":Ljava/lang/Object;
    :catch_e
    move-exception v0

    .line 69
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v1, "Problem during evaluation."

    .line 70
    .local v1, "errorMsg":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/commons/beanutils/BeanPredicate;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "ERROR: Problem during evaluation."

    invoke-interface {v4, v5, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 71
    throw v0

    .line 72
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .end local v1    # "errorMsg":Ljava/lang/String;
    :catch_19
    move-exception v0

    .line 73
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v1, "Unable to access the property provided."

    .line 74
    .restart local v1    # "errorMsg":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/commons/beanutils/BeanPredicate;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Unable to access the property provided."

    invoke-interface {v4, v5, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 75
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Unable to access the property provided."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 76
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "errorMsg":Ljava/lang/String;
    :catch_2b
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v1, "Exception occurred in property\'s getter"

    .line 78
    .restart local v1    # "errorMsg":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/commons/beanutils/BeanPredicate;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Exception occurred in property\'s getter"

    invoke-interface {v4, v5, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 79
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Exception occurred in property\'s getter"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 80
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v1    # "errorMsg":Ljava/lang/String;
    :catch_3d
    move-exception v0

    .line 81
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const-string v1, "Property not found."

    .line 82
    .restart local v1    # "errorMsg":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/commons/beanutils/BeanPredicate;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Property not found."

    invoke-interface {v4, v5, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 83
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Property not found."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public getPredicate()Lorg/apache/commons/collections/Predicate;
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanPredicate;->predicate:Lorg/apache/commons/collections/Predicate;

    return-object v0
.end method

.method public getPropertyName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanPredicate;->propertyName:Ljava/lang/String;

    return-object v0
.end method

.method public setPredicate(Lorg/apache/commons/collections/Predicate;)V
    .registers 2
    .param p1, "predicate"    # Lorg/apache/commons/collections/Predicate;

    .prologue
    .line 122
    iput-object p1, p0, Lorg/apache/commons/beanutils/BeanPredicate;->predicate:Lorg/apache/commons/collections/Predicate;

    .line 123
    return-void
.end method

.method public setPropertyName(Ljava/lang/String;)V
    .registers 2
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lorg/apache/commons/beanutils/BeanPredicate;->propertyName:Ljava/lang/String;

    .line 105
    return-void
.end method
