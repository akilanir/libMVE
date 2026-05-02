.class public Lorg/apache/commons/validator/ValidatorAction;
.super Ljava/lang/Object;
.source "ValidatorAction.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field static class$org$apache$commons$validator$ValidatorAction:Ljava/lang/Class; = null

.field private static final serialVersionUID:J = 0x12979e8318653e75L


# instance fields
.field private classname:Ljava/lang/String;

.field private dependencyList:Ljava/util/List;

.field private depends:Ljava/lang/String;

.field private instance:Ljava/lang/Object;

.field private javascript:Ljava/lang/String;

.field private jsFunction:Ljava/lang/String;

.field private jsFunctionName:Ljava/lang/String;

.field private transient log:Lorg/apache/commons/logging/Log;

.field private method:Ljava/lang/String;

.field private methodParameterList:Ljava/util/List;

.field private methodParams:Ljava/lang/String;

.field private msg:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private parameterClasses:[Ljava/lang/Class;

.field private validationClass:Ljava/lang/Class;

.field private validationMethod:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    sget-object v0, Lorg/apache/commons/validator/ValidatorAction;->class$org$apache$commons$validator$ValidatorAction:Ljava/lang/Class;

    if-nez v0, :cond_45

    const-string v0, "org.apache.commons.validator.ValidatorAction"

    invoke-static {v0}, Lorg/apache/commons/validator/ValidatorAction;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/ValidatorAction;->class$org$apache$commons$validator$ValidatorAction:Ljava/lang/Class;

    :goto_10
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->log:Lorg/apache/commons/logging/Log;

    .line 58
    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->name:Ljava/lang/String;

    .line 64
    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->classname:Ljava/lang/String;

    .line 69
    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->validationClass:Ljava/lang/Class;

    .line 75
    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->method:Ljava/lang/String;

    .line 80
    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->validationMethod:Ljava/lang/reflect/Method;

    .line 96
    const-string v0, "java.lang.Object,org.apache.commons.validator.ValidatorAction,org.apache.commons.validator.Field"

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParams:Ljava/lang/String;

    .line 106
    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->parameterClasses:[Ljava/lang/Class;

    .line 113
    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->depends:Ljava/lang/String;

    .line 118
    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->msg:Ljava/lang/String;

    .line 124
    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->jsFunctionName:Ljava/lang/String;

    .line 130
    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->jsFunction:Ljava/lang/String;

    .line 136
    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->javascript:Ljava/lang/String;

    .line 143
    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->instance:Ljava/lang/Object;

    .line 152
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->dependencyList:Ljava/util/List;

    .line 158
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParameterList:Ljava/util/List;

    return-void

    .line 53
    :cond_45
    sget-object v0, Lorg/apache/commons/validator/ValidatorAction;->class$org$apache$commons$validator$ValidatorAction:Ljava/lang/Class;

    goto :goto_10
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 53
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private formatJavascriptFileName()Ljava/lang/String;
    .registers 6

    .prologue
    .line 450
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->jsFunction:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 452
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->jsFunction:Ljava/lang/String;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2e

    .line 453
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorAction;->jsFunction:Ljava/lang/String;

    const/16 v3, 0x2e

    const/16 v4, 0x2f

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ".js"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 456
    :cond_2e
    return-object v0
.end method

.method private generateJsFunction()Ljava/lang/String;
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 470
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "org.apache.commons.validator.javascript"

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 473
    .local v0, "jsName":Ljava/lang/StringBuffer;
    const-string v1, ".validate"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 474
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->name:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 475
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->name:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorAction;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 477
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getClassLoader(Ljava/util/Map;)Ljava/lang/ClassLoader;
    .registers 4
    .param p1, "params"    # Ljava/util/Map;

    .prologue
    .line 765
    const-string v1, "org.apache.commons.validator.Validator"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Validator;

    .line 766
    .local v0, "v":Lorg/apache/commons/validator/Validator;
    invoke-virtual {v0}, Lorg/apache/commons/validator/Validator;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    return-object v1
.end method

.method private getLog()Lorg/apache/commons/logging/Log;
    .registers 2

    .prologue
    .line 789
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->log:Lorg/apache/commons/logging/Log;

    if-nez v0, :cond_16

    .line 790
    sget-object v0, Lorg/apache/commons/validator/ValidatorAction;->class$org$apache$commons$validator$ValidatorAction:Ljava/lang/Class;

    if-nez v0, :cond_19

    const-string v0, "org.apache.commons.validator.ValidatorAction"

    invoke-static {v0}, Lorg/apache/commons/validator/ValidatorAction;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/ValidatorAction;->class$org$apache$commons$validator$ValidatorAction:Ljava/lang/Class;

    :goto_10
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->log:Lorg/apache/commons/logging/Log;

    .line 792
    :cond_16
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->log:Lorg/apache/commons/logging/Log;

    return-object v0

    .line 790
    :cond_19
    sget-object v0, Lorg/apache/commons/validator/ValidatorAction;->class$org$apache$commons$validator$ValidatorAction:Ljava/lang/Class;

    goto :goto_10
.end method

.method private getParameterValues(Ljava/util/Map;)[Ljava/lang/Object;
    .registers 6
    .param p1, "params"    # Ljava/util/Map;

    .prologue
    .line 670
    iget-object v3, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParameterList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    new-array v2, v3, [Ljava/lang/Object;

    .line 672
    .local v2, "paramValue":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    iget-object v3, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParameterList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_22

    .line 673
    iget-object v3, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParameterList:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 674
    .local v1, "paramClassName":Ljava/lang/String;
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, v0

    .line 672
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 677
    .end local v1    # "paramClassName":Ljava/lang/String;
    :cond_22
    return-object v2
.end method

.method private getValidationClassInstance()Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    .line 685
    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorAction;->validationMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 686
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorAction;->instance:Ljava/lang/Object;

    .line 713
    :cond_f
    :goto_f
    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorAction;->instance:Ljava/lang/Object;

    return-object v2

    .line 689
    :cond_12
    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorAction;->instance:Ljava/lang/Object;

    if-nez v2, :cond_f

    .line 691
    :try_start_16
    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorAction;->validationClass:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/commons/validator/ValidatorAction;->instance:Ljava/lang/Object;
    :try_end_1e
    .catch Ljava/lang/InstantiationException; {:try_start_16 .. :try_end_1e} :catch_1f
    .catch Ljava/lang/IllegalAccessException; {:try_start_16 .. :try_end_1e} :catch_49

    goto :goto_f

    .line 692
    :catch_1f
    move-exception v0

    .line 693
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Couldn\'t create instance of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/validator/ValidatorAction;->classname:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ".  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 699
    .local v1, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/commons/validator/ValidatorException;

    invoke-direct {v2, v1}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 701
    .end local v0    # "e":Ljava/lang/InstantiationException;
    .end local v1    # "msg":Ljava/lang/String;
    :catch_49
    move-exception v0

    .line 702
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Couldn\'t create instance of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/validator/ValidatorAction;->classname:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ".  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 708
    .restart local v1    # "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/commons/validator/ValidatorException;

    invoke-direct {v2, v1}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private handleIndexedField(Lorg/apache/commons/validator/Field;I[Ljava/lang/Object;)V
    .registers 12
    .param p1, "field"    # Lorg/apache/commons/validator/Field;
    .param p2, "pos"    # I
    .param p3, "paramValues"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    .line 726
    iget-object v4, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParameterList:Ljava/util/List;

    const-string v5, "java.lang.Object"

    invoke-interface {v4, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 727
    .local v0, "beanIndex":I
    iget-object v4, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParameterList:Ljava/util/List;

    const-string v5, "org.apache.commons.validator.Field"

    invoke-interface {v4, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 729
    .local v1, "fieldIndex":I
    aget-object v4, p3, v0

    invoke-virtual {p1, v4}, Lorg/apache/commons/validator/Field;->getIndexedProperty(Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    .line 732
    .local v3, "indexedList":[Ljava/lang/Object;
    aget-object v4, v3, p2

    aput-object v4, p3, v0

    .line 736
    invoke-virtual {p1}, Lorg/apache/commons/validator/Field;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/validator/Field;

    .line 737
    .local v2, "indexedField":Lorg/apache/commons/validator/Field;
    invoke-virtual {v2}, Lorg/apache/commons/validator/Field;->getKey()Ljava/lang/String;

    move-result-object v4

    const-string v5, "[]"

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/apache/commons/validator/util/ValidatorUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/apache/commons/validator/Field;->setKey(Ljava/lang/String;)V

    .line 743
    aput-object v2, p3, v1

    .line 744
    return-void
.end method

.method private isValid(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "result"    # Ljava/lang/Object;

    .prologue
    .line 752
    instance-of v1, p1, Ljava/lang/Boolean;

    if-eqz v1, :cond_c

    move-object v0, p1

    .line 753
    check-cast v0, Ljava/lang/Boolean;

    .line 754
    .local v0, "valid":Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 756
    .end local v0    # "valid":Ljava/lang/Boolean;
    :goto_b
    return v1

    :cond_c
    if-eqz p1, :cond_10

    const/4 v1, 0x1

    goto :goto_b

    :cond_10
    const/4 v1, 0x0

    goto :goto_b
.end method

.method private javascriptAlreadyLoaded()Z
    .registers 2

    .prologue
    .line 463
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->javascript:Ljava/lang/String;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private loadParameterClasses(Ljava/lang/ClassLoader;)V
    .registers 8
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    .line 640
    iget-object v4, p0, Lorg/apache/commons/validator/ValidatorAction;->parameterClasses:[Ljava/lang/Class;

    if-eqz v4, :cond_5

    .line 658
    :goto_4
    return-void

    .line 644
    :cond_5
    iget-object v4, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParameterList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    new-array v3, v4, [Ljava/lang/Class;

    .line 646
    .local v3, "parameterClasses":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    iget-object v4, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParameterList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_32

    .line 647
    iget-object v4, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParameterList:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 650
    .local v2, "paramClassName":Ljava/lang/String;
    :try_start_1e
    invoke-virtual {p1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    aput-object v4, v3, v1
    :try_end_24
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1e .. :try_end_24} :catch_27

    .line 646
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 652
    :catch_27
    move-exception v0

    .line 653
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v4, Lorg/apache/commons/validator/ValidatorException;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 657
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    .end local v2    # "paramClassName":Ljava/lang/String;
    :cond_32
    iput-object v3, p0, Lorg/apache/commons/validator/ValidatorAction;->parameterClasses:[Ljava/lang/Class;

    goto :goto_4
.end method

.method private loadValidationClass(Ljava/lang/ClassLoader;)V
    .registers 5
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    .line 619
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->validationClass:Ljava/lang/Class;

    if-eqz v1, :cond_5

    .line 628
    :goto_4
    return-void

    .line 624
    :cond_5
    :try_start_5
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->classname:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->validationClass:Ljava/lang/Class;
    :try_end_d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_d} :catch_e

    goto :goto_4

    .line 625
    :catch_e
    move-exception v0

    .line 626
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Lorg/apache/commons/validator/ValidatorException;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private loadValidationMethod()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    .line 597
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->validationMethod:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_5

    .line 609
    :goto_4
    return-void

    .line 602
    :cond_5
    :try_start_5
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->validationClass:Ljava/lang/Class;

    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorAction;->method:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/commons/validator/ValidatorAction;->parameterClasses:[Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->validationMethod:Ljava/lang/reflect/Method;
    :try_end_11
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_11} :catch_12

    goto :goto_4

    .line 605
    :catch_12
    move-exception v0

    .line 606
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v1, Lorg/apache/commons/validator/ValidatorException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No such validation method: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private onlyReturnErrors(Ljava/util/Map;)Z
    .registers 4
    .param p1, "params"    # Ljava/util/Map;

    .prologue
    .line 774
    const-string v1, "org.apache.commons.validator.Validator"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Validator;

    .line 775
    .local v0, "v":Lorg/apache/commons/validator/Validator;
    invoke-virtual {v0}, Lorg/apache/commons/validator/Validator;->getOnlyReturnErrors()Z

    move-result v1

    return v1
.end method

.method private readJavascriptFile(Ljava/lang/String;)Ljava/lang/String;
    .registers 13
    .param p1, "javascriptFileName"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 407
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 408
    .local v1, "classLoader":Ljava/lang/ClassLoader;
    if-nez v1, :cond_13

    .line 409
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 412
    :cond_13
    invoke-virtual {v1, p1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 413
    .local v4, "is":Ljava/io/InputStream;
    if-nez v4, :cond_21

    .line 414
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 417
    :cond_21
    if-nez v4, :cond_3e

    .line 418
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "  Unable to read javascript name "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 442
    :goto_3d
    return-object v7

    .line 422
    :cond_3e
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 423
    .local v0, "buffer":Ljava/lang/StringBuffer;
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-direct {v8, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v6, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 425
    .local v6, "reader":Ljava/io/BufferedReader;
    const/4 v5, 0x0

    .line 426
    .local v5, "line":Ljava/lang/String;
    :goto_4e
    :try_start_4e
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_7a

    .line 427
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_5d
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_5d} :catch_5e
    .catchall {:try_start_4e .. :try_end_5d} :catchall_94

    goto :goto_4e

    .line 430
    :catch_5e
    move-exception v2

    .line 431
    .local v2, "e":Ljava/io/IOException;
    :try_start_5f
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v8

    const-string v9, "Error reading javascript file."

    invoke-interface {v8, v9, v2}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_68
    .catchall {:try_start_5f .. :try_end_68} :catchall_94

    .line 435
    :try_start_68
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_6b
    .catch Ljava/io/IOException; {:try_start_68 .. :try_end_6b} :catch_89

    .line 441
    .end local v2    # "e":Ljava/io/IOException;
    :goto_6b
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 442
    .local v3, "function":Ljava/lang/String;
    const-string v8, ""

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_78

    move-object v3, v7

    .end local v3    # "function":Ljava/lang/String;
    :cond_78
    move-object v7, v3

    goto :goto_3d

    .line 435
    :cond_7a
    :try_start_7a
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_7d
    .catch Ljava/io/IOException; {:try_start_7a .. :try_end_7d} :catch_7e

    goto :goto_6b

    .line 436
    :catch_7e
    move-exception v2

    .line 437
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v8

    const-string v9, "Error closing stream to javascript file."

    invoke-interface {v8, v9, v2}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_6b

    .line 436
    :catch_89
    move-exception v2

    .line 437
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v8

    const-string v9, "Error closing stream to javascript file."

    invoke-interface {v8, v9, v2}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_6b

    .line 434
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_94
    move-exception v7

    .line 435
    :try_start_95
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_98
    .catch Ljava/io/IOException; {:try_start_95 .. :try_end_98} :catch_99

    .line 438
    :goto_98
    throw v7

    .line 436
    :catch_99
    move-exception v2

    .line 437
    .restart local v2    # "e":Ljava/io/IOException;
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v8

    const-string v9, "Error closing stream to javascript file."

    invoke-interface {v8, v9, v2}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_98
.end method


# virtual methods
.method executeValidationMethod(Lorg/apache/commons/validator/Field;Ljava/util/Map;Lorg/apache/commons/validator/ValidatorResults;I)Z
    .registers 14
    .param p1, "field"    # Lorg/apache/commons/validator/Field;
    .param p2, "params"    # Ljava/util/Map;
    .param p3, "results"    # Lorg/apache/commons/validator/ValidatorResults;
    .param p4, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 526
    const-string v5, "org.apache.commons.validator.ValidatorAction"

    invoke-interface {p2, v5, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 529
    :try_start_6
    iget-object v5, p0, Lorg/apache/commons/validator/ValidatorAction;->validationMethod:Ljava/lang/reflect/Method;

    if-nez v5, :cond_19

    .line 530
    monitor-enter p0
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_b} :catch_4b

    .line 531
    :try_start_b
    invoke-direct {p0, p2}, Lorg/apache/commons/validator/ValidatorAction;->getClassLoader(Ljava/util/Map;)Ljava/lang/ClassLoader;

    move-result-object v1

    .line 532
    .local v1, "loader":Ljava/lang/ClassLoader;
    invoke-direct {p0, v1}, Lorg/apache/commons/validator/ValidatorAction;->loadValidationClass(Ljava/lang/ClassLoader;)V

    .line 533
    invoke-direct {p0, v1}, Lorg/apache/commons/validator/ValidatorAction;->loadParameterClasses(Ljava/lang/ClassLoader;)V

    .line 534
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->loadValidationMethod()V

    .line 535
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_b .. :try_end_19} :catchall_48

    .line 538
    .end local v1    # "loader":Ljava/lang/ClassLoader;
    :cond_19
    :try_start_19
    invoke-direct {p0, p2}, Lorg/apache/commons/validator/ValidatorAction;->getParameterValues(Ljava/util/Map;)[Ljava/lang/Object;

    move-result-object v2

    .line 540
    .local v2, "paramValues":[Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/apache/commons/validator/Field;->isIndexed()Z

    move-result v5

    if-eqz v5, :cond_26

    .line 541
    invoke-direct {p0, p1, p4, v2}, Lorg/apache/commons/validator/ValidatorAction;->handleIndexedField(Lorg/apache/commons/validator/Field;I[Ljava/lang/Object;)V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_26} :catch_4b

    .line 544
    :cond_26
    const/4 v3, 0x0

    .line 546
    .local v3, "result":Ljava/lang/Object;
    :try_start_27
    iget-object v5, p0, Lorg/apache/commons/validator/ValidatorAction;->validationMethod:Ljava/lang/reflect/Method;

    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->getValidationClassInstance()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v7, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_30
    .catch Ljava/lang/IllegalArgumentException; {:try_start_27 .. :try_end_30} :catch_53
    .catch Ljava/lang/IllegalAccessException; {:try_start_27 .. :try_end_30} :catch_5e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_27 .. :try_end_30} :catch_69
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_30} :catch_4b

    move-result-object v3

    .line 565
    .end local v3    # "result":Ljava/lang/Object;
    :cond_31
    :try_start_31
    invoke-direct {p0, v3}, Lorg/apache/commons/validator/ValidatorAction;->isValid(Ljava/lang/Object;)Z

    move-result v4

    .line 566
    .local v4, "valid":Z
    if-eqz v4, :cond_3f

    if-eqz v4, :cond_44

    invoke-direct {p0, p2}, Lorg/apache/commons/validator/ValidatorAction;->onlyReturnErrors(Ljava/util/Map;)Z

    move-result v5

    if-nez v5, :cond_44

    .line 567
    :cond_3f
    iget-object v5, p0, Lorg/apache/commons/validator/ValidatorAction;->name:Ljava/lang/String;

    invoke-virtual {p3, p1, v5, v4, v3}, Lorg/apache/commons/validator/ValidatorResults;->add(Lorg/apache/commons/validator/Field;Ljava/lang/String;ZLjava/lang/Object;)V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_44} :catch_4b

    .line 570
    :cond_44
    if-nez v4, :cond_ad

    move v5, v6

    .line 589
    .end local v2    # "paramValues":[Ljava/lang/Object;
    .end local v4    # "valid":Z
    :goto_47
    return v5

    .line 535
    :catchall_48
    move-exception v5

    :try_start_49
    monitor-exit p0
    :try_end_4a
    .catchall {:try_start_49 .. :try_end_4a} :catchall_48

    :try_start_4a
    throw v5
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_4b} :catch_4b

    .line 576
    :catch_4b
    move-exception v0

    .line 577
    .local v0, "e":Ljava/lang/Exception;
    instance-of v5, v0, Lorg/apache/commons/validator/ValidatorException;

    if-eqz v5, :cond_88

    .line 578
    check-cast v0, Lorg/apache/commons/validator/ValidatorException;

    .end local v0    # "e":Ljava/lang/Exception;
    throw v0

    .line 551
    .restart local v2    # "paramValues":[Ljava/lang/Object;
    .restart local v3    # "result":Ljava/lang/Object;
    :catch_53
    move-exception v0

    .line 552
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    :try_start_54
    new-instance v5, Lorg/apache/commons/validator/ValidatorException;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 553
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_5e
    move-exception v0

    .line 554
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v5, Lorg/apache/commons/validator/ValidatorException;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 555
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_69
    move-exception v0

    .line 557
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v5

    instance-of v5, v5, Ljava/lang/Exception;

    if-eqz v5, :cond_79

    .line 558
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v5

    check-cast v5, Ljava/lang/Exception;

    throw v5

    .line 560
    :cond_79
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v5

    instance-of v5, v5, Ljava/lang/Error;

    if-eqz v5, :cond_31

    .line 561
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v5

    check-cast v5, Ljava/lang/Error;

    throw v5
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_54 .. :try_end_88} :catch_4b

    .line 581
    .end local v2    # "paramValues":[Ljava/lang/Object;
    .end local v3    # "result":Ljava/lang/Object;
    .local v0, "e":Ljava/lang/Exception;
    :cond_88
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v5

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Unhandled exception thrown during validation: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 585
    iget-object v5, p0, Lorg/apache/commons/validator/ValidatorAction;->name:Ljava/lang/String;

    invoke-virtual {p3, p1, v5, v6}, Lorg/apache/commons/validator/ValidatorResults;->add(Lorg/apache/commons/validator/Field;Ljava/lang/String;Z)V

    move v5, v6

    .line 586
    goto :goto_47

    .line 589
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "paramValues":[Ljava/lang/Object;
    .restart local v4    # "valid":Z
    :cond_ad
    const/4 v5, 0x1

    goto :goto_47
.end method

.method public getClassname()Ljava/lang/String;
    .registers 2

    .prologue
    .line 181
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->classname:Ljava/lang/String;

    return-object v0
.end method

.method public getDependencyList()Ljava/util/List;
    .registers 2

    .prologue
    .line 495
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->dependencyList:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDepends()Ljava/lang/String;
    .registers 2

    .prologue
    .line 241
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->depends:Ljava/lang/String;

    return-object v0
.end method

.method public getJavascript()Ljava/lang/String;
    .registers 2

    .prologue
    .line 339
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->javascript:Ljava/lang/String;

    return-object v0
.end method

.method public getJsFunctionName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 286
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->jsFunctionName:Ljava/lang/String;

    return-object v0
.end method

.method public getMethod()Ljava/lang/String;
    .registers 2

    .prologue
    .line 197
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->method:Ljava/lang/String;

    return-object v0
.end method

.method public getMethodParams()Ljava/lang/String;
    .registers 2

    .prologue
    .line 213
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParams:Ljava/lang/String;

    return-object v0
.end method

.method public getMsg()Ljava/lang/String;
    .registers 2

    .prologue
    .line 268
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->msg:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->name:Ljava/lang/String;

    return-object v0
.end method

.method protected init()V
    .registers 1

    .prologue
    .line 359
    invoke-virtual {p0}, Lorg/apache/commons/validator/ValidatorAction;->loadJavascriptFunction()V

    .line 360
    return-void
.end method

.method public isDependency(Ljava/lang/String;)Z
    .registers 3
    .param p1, "validatorName"    # Ljava/lang/String;

    .prologue
    .line 486
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->dependencyList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected declared-synchronized loadJavascriptFunction()V
    .registers 5

    .prologue
    .line 375
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->javascriptAlreadyLoaded()Z
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_6e

    move-result v1

    if-eqz v1, :cond_9

    .line 399
    :cond_7
    :goto_7
    monitor-exit p0

    return-void

    .line 379
    :cond_9
    :try_start_9
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 380
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v1

    const-string v2, "  Loading function begun"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 383
    :cond_1c
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->jsFunction:Ljava/lang/String;

    if-nez v1, :cond_26

    .line 384
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->generateJsFunction()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->jsFunction:Ljava/lang/String;

    .line 387
    :cond_26
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->formatJavascriptFileName()Ljava/lang/String;

    move-result-object v0

    .line 389
    .local v0, "javascriptFileName":Ljava/lang/String;
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_54

    .line 390
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "  Loading js function \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 393
    :cond_54
    invoke-direct {p0, v0}, Lorg/apache/commons/validator/ValidatorAction;->readJavascriptFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->javascript:Ljava/lang/String;

    .line 395
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 396
    invoke-direct {p0}, Lorg/apache/commons/validator/ValidatorAction;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v1

    const-string v2, "  Loading javascript function completed"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V
    :try_end_6d
    .catchall {:try_start_9 .. :try_end_6d} :catchall_6e

    goto :goto_7

    .line 375
    .end local v0    # "javascriptFileName":Ljava/lang/String;
    :catchall_6e
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public setClassname(Ljava/lang/String;)V
    .registers 2
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 189
    iput-object p1, p0, Lorg/apache/commons/validator/ValidatorAction;->classname:Ljava/lang/String;

    .line 190
    return-void
.end method

.method public setDepends(Ljava/lang/String;)V
    .registers 5
    .param p1, "depends"    # Ljava/lang/String;

    .prologue
    .line 249
    iput-object p1, p0, Lorg/apache/commons/validator/ValidatorAction;->depends:Ljava/lang/String;

    .line 251
    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorAction;->dependencyList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 253
    new-instance v1, Ljava/util/StringTokenizer;

    const-string v2, ","

    invoke-direct {v1, p1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    .local v1, "st":Ljava/util/StringTokenizer;
    :cond_e
    :goto_e
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 255
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 257
    .local v0, "depend":Ljava/lang/String;
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_e

    .line 258
    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorAction;->dependencyList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 261
    .end local v0    # "depend":Ljava/lang/String;
    :cond_2a
    return-void
.end method

.method public setJavascript(Ljava/lang/String;)V
    .registers 4
    .param p1, "javascript"    # Ljava/lang/String;

    .prologue
    .line 348
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->jsFunction:Ljava/lang/String;

    if-eqz v0, :cond_c

    .line 349
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call setJavascript() after calling setJsFunction()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 352
    :cond_c
    iput-object p1, p0, Lorg/apache/commons/validator/ValidatorAction;->javascript:Ljava/lang/String;

    .line 353
    return-void
.end method

.method public setJsFunction(Ljava/lang/String;)V
    .registers 4
    .param p1, "jsFunction"    # Ljava/lang/String;

    .prologue
    .line 326
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorAction;->javascript:Ljava/lang/String;

    if-eqz v0, :cond_c

    .line 327
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot call setJsFunction() after calling setJavascript()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 330
    :cond_c
    iput-object p1, p0, Lorg/apache/commons/validator/ValidatorAction;->jsFunction:Ljava/lang/String;

    .line 331
    return-void
.end method

.method public setJsFunctionName(Ljava/lang/String;)V
    .registers 2
    .param p1, "jsFunctionName"    # Ljava/lang/String;

    .prologue
    .line 296
    iput-object p1, p0, Lorg/apache/commons/validator/ValidatorAction;->jsFunctionName:Ljava/lang/String;

    .line 297
    return-void
.end method

.method public setMethod(Ljava/lang/String;)V
    .registers 2
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 205
    iput-object p1, p0, Lorg/apache/commons/validator/ValidatorAction;->method:Ljava/lang/String;

    .line 206
    return-void
.end method

.method public setMethodParams(Ljava/lang/String;)V
    .registers 5
    .param p1, "methodParams"    # Ljava/lang/String;

    .prologue
    .line 221
    iput-object p1, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParams:Ljava/lang/String;

    .line 223
    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParameterList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 225
    new-instance v0, Ljava/util/StringTokenizer;

    const-string v2, ","

    invoke-direct {v0, p1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .local v0, "st":Ljava/util/StringTokenizer;
    :cond_e
    :goto_e
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 227
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 229
    .local v1, "value":Ljava/lang/String;
    if-eqz v1, :cond_e

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_e

    .line 230
    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorAction;->methodParameterList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 233
    .end local v1    # "value":Ljava/lang/String;
    :cond_2a
    return-void
.end method

.method public setMsg(Ljava/lang/String;)V
    .registers 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 276
    iput-object p1, p0, Lorg/apache/commons/validator/ValidatorAction;->msg:Ljava/lang/String;

    .line 277
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 173
    iput-object p1, p0, Lorg/apache/commons/validator/ValidatorAction;->name:Ljava/lang/String;

    .line 174
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 503
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "ValidatorAction: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 504
    .local v0, "results":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/commons/validator/ValidatorAction;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 505
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 507
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
