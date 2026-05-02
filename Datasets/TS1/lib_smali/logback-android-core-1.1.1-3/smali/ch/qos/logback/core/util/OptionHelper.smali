.class public Lch/qos/logback/core/util/OptionHelper;
.super Ljava/lang/Object;


# static fields
.field static final DELIM_DEFAULT:Ljava/lang/String; = ":-"

.field static final DELIM_DEFAULT_LEN:I = 0x2

.field static final DELIM_START:Ljava/lang/String; = "${"

.field static final DELIM_START_LEN:I = 0x2

.field static final DELIM_STOP:C = '}'

.field static final DELIM_STOP_LEN:I = 0x1

.field static final _IS_UNDEFINED:Ljava/lang/String; = "_IS_UNDEFINED"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static extractDefaultReplacement(Ljava/lang/String;)[Ljava/lang/String;
    .registers 5

    const/4 v3, 0x0

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    if-nez p0, :cond_7

    :cond_6
    :goto_6
    return-object v0

    :cond_7
    aput-object p0, v0, v3

    const-string v1, ":-"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_6

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v3

    const/4 v2, 0x1

    add-int/lit8 v1, v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    goto :goto_6
.end method

.method public static getAndroidSystemProperty(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const/4 v0, 0x0

    :try_start_1
    invoke-static {}, Lch/qos/logback/core/android/SystemPropertiesProxy;->getInstance()Lch/qos/logback/core/android/SystemPropertiesProxy;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p0, v2}, Lch/qos/logback/core/android/SystemPropertiesProxy;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_9} :catch_b

    move-result-object v0

    :goto_a
    return-object v0

    :catch_b
    move-exception v1

    goto :goto_a
.end method

.method public static getEnv(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    :goto_4
    return-object v0

    :catch_5
    move-exception v0

    const/4 v0, 0x0

    goto :goto_4
.end method

.method public static getSystemProperties()Ljava/util/Properties;
    .registers 1

    :try_start_0
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    :goto_4
    return-object v0

    :catch_5
    move-exception v0

    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    goto :goto_4
.end method

.method public static getSystemProperty(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_a

    invoke-static {p0}, Lch/qos/logback/core/util/OptionHelper;->getAndroidSystemProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_9
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v0

    :cond_a
    :goto_a
    return-object v0

    :catch_b
    move-exception v0

    const/4 v0, 0x0

    goto :goto_a
.end method

.method public static getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    :try_start_0
    invoke-static {p0, p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object p1

    :goto_4
    return-object p1

    :catch_5
    move-exception v0

    goto :goto_4
.end method

.method public static instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Lch/qos/logback/core/Context;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;",
            "Lch/qos/logback/core/Context;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/util/IncompatibleClassException;,
            Lch/qos/logback/core/util/DynamicClassLoadingException;
        }
    .end annotation

    invoke-static {p2}, Lch/qos/logback/core/util/Loader;->getClassLoaderOfObject(Ljava/lang/Object;)Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lch/qos/logback/core/util/OptionHelper;->instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/util/IncompatibleClassException;,
            Lch/qos/logback/core/util/DynamicClassLoadingException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0, v0}, Lch/qos/logback/core/util/OptionHelper;->instantiateByClassNameAndParameter(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/ClassLoader;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static instantiateByClassNameAndParameter(Ljava/lang/String;Ljava/lang/Class;Lch/qos/logback/core/Context;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;",
            "Lch/qos/logback/core/Context;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/util/IncompatibleClassException;,
            Lch/qos/logback/core/util/DynamicClassLoadingException;
        }
    .end annotation

    invoke-static {p2}, Lch/qos/logback/core/util/Loader;->getClassLoaderOfObject(Ljava/lang/Object;)Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {p0, p1, v0, p3, p4}, Lch/qos/logback/core/util/OptionHelper;->instantiateByClassNameAndParameter(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/ClassLoader;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static instantiateByClassNameAndParameter(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/ClassLoader;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/ClassLoader;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/util/IncompatibleClassException;,
            Lch/qos/logback/core/util/DynamicClassLoadingException;
        }
    .end annotation

    if-nez p0, :cond_8

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_8
    :try_start_8
    invoke-virtual {p2, p0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_1a

    new-instance v1, Lch/qos/logback/core/util/IncompatibleClassException;

    invoke-direct {v1, p1, v0}, Lch/qos/logback/core/util/IncompatibleClassException;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    throw v1
    :try_end_18
    .catch Lch/qos/logback/core/util/IncompatibleClassException; {:try_start_8 .. :try_end_18} :catch_18
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_18} :catch_36

    :catch_18
    move-exception v0

    throw v0

    :cond_1a
    if-nez p3, :cond_21

    :try_start_1c
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    :goto_20
    return-object v0

    :cond_21
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object p3, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p4, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_34
    .catch Lch/qos/logback/core/util/IncompatibleClassException; {:try_start_1c .. :try_end_34} :catch_18
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_34} :catch_36

    move-result-object v0

    goto :goto_20

    :catch_36
    move-exception v0

    new-instance v1, Lch/qos/logback/core/util/DynamicClassLoadingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to instantiate type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lch/qos/logback/core/util/DynamicClassLoadingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static isEmpty(Ljava/lang/String;)Z
    .registers 2

    if-eqz p0, :cond_a

    const-string v0, ""

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static propertyLookup(Ljava/lang/String;Lch/qos/logback/core/spi/PropertyContainer;Lch/qos/logback/core/spi/PropertyContainer;)Ljava/lang/String;
    .registers 4

    invoke-interface {p1, p0}, Lch/qos/logback/core/spi/PropertyContainer;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_c

    if-eqz p2, :cond_c

    invoke-interface {p2, p0}, Lch/qos/logback/core/spi/PropertyContainer;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_c
    if-nez v0, :cond_13

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lch/qos/logback/core/util/OptionHelper;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_13
    if-nez v0, :cond_19

    invoke-static {p0}, Lch/qos/logback/core/util/OptionHelper;->getEnv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_19
    return-object v0
.end method

.method public static setSystemProperties(Lch/qos/logback/core/spi/ContextAware;Ljava/util/Properties;)V
    .registers 5

    invoke-virtual {p1}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v0, v2}, Lch/qos/logback/core/util/OptionHelper;->setSystemProperty(Lch/qos/logback/core/spi/ContextAware;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    :cond_1c
    return-void
.end method

.method public static setSystemProperty(Lch/qos/logback/core/spi/ContextAware;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    :try_start_0
    invoke-static {p1, p2}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_3} :catch_4

    :goto_3
    return-void

    :catch_4
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to set system property ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v1, v0}, Lch/qos/logback/core/spi/ContextAware;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method public static substVars(Ljava/lang/String;Lch/qos/logback/core/spi/PropertyContainer;)Ljava/lang/String;
    .registers 3

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lch/qos/logback/core/util/OptionHelper;->substVars(Ljava/lang/String;Lch/qos/logback/core/spi/PropertyContainer;Lch/qos/logback/core/spi/PropertyContainer;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static substVars(Ljava/lang/String;Lch/qos/logback/core/spi/PropertyContainer;Lch/qos/logback/core/spi/PropertyContainer;)Ljava/lang/String;
    .registers 7

    :try_start_0
    invoke-static {p0, p1, p2}, Lch/qos/logback/core/subst/NodeToStringTransformer;->substituteVariable(Ljava/lang/String;Lch/qos/logback/core/spi/PropertyContainer;Lch/qos/logback/core/spi/PropertyContainer;)Ljava/lang/String;
    :try_end_3
    .catch Lch/qos/logback/core/spi/ScanException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    return-object v0

    :catch_5
    move-exception v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to parse input ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static toBoolean(Ljava/lang/String;Z)Z
    .registers 4

    if-nez p0, :cond_3

    :cond_2
    :goto_2
    return p1

    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    const/4 p1, 0x1

    goto :goto_2

    :cond_11
    const-string v1, "false"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 p1, 0x0

    goto :goto_2
.end method
