.class public Lch/qos/logback/core/joran/util/PropertySetter;
.super Lch/qos/logback/core/spi/ContextAwareBase;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/joran/util/PropertySetter$1;
    }
.end annotation


# instance fields
.field protected methodDescriptors:[Lch/qos/logback/core/joran/util/MethodDescriptor;

.field protected obj:Ljava/lang/Object;

.field protected objClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field protected propertyDescriptors:[Lch/qos/logback/core/joran/util/PropertyDescriptor;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/joran/util/PropertySetter;->obj:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/joran/util/PropertySetter;->objClass:Ljava/lang/Class;

    return-void
.end method

.method private capitalizeFirstLetter(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    const/4 v2, 0x1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private computeRawAggregationType(Ljava/lang/reflect/Method;)Lch/qos/logback/core/util/AggregationType;
    .registers 3

    invoke-direct {p0, p1}, Lch/qos/logback/core/joran/util/PropertySetter;->getParameterClassForMethod(Ljava/lang/reflect/Method;)Ljava/lang/Class;

    move-result-object v0

    if-nez v0, :cond_9

    sget-object v0, Lch/qos/logback/core/util/AggregationType;->NOT_FOUND:Lch/qos/logback/core/util/AggregationType;

    :goto_8
    return-object v0

    :cond_9
    invoke-static {v0}, Lch/qos/logback/core/joran/util/StringToObjectConverter;->canBeBuiltFromSimpleString(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_12

    sget-object v0, Lch/qos/logback/core/util/AggregationType;->AS_BASIC_PROPERTY:Lch/qos/logback/core/util/AggregationType;

    goto :goto_8

    :cond_12
    sget-object v0, Lch/qos/logback/core/util/AggregationType;->AS_COMPLEX_PROPERTY:Lch/qos/logback/core/util/AggregationType;

    goto :goto_8
.end method

.method private findAdderMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 5

    invoke-direct {p0, p1}, Lch/qos/logback/core/joran/util/PropertySetter;->capitalizeFirstLetter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "add"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->getMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method

.method private findSetterMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 3

    invoke-static {p1}, Lch/qos/logback/core/joran/util/Introspector;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->getPropertyDescriptor(Ljava/lang/String;)Lch/qos/logback/core/joran/util/PropertyDescriptor;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Lch/qos/logback/core/joran/util/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method private getParameterClassForMethod(Ljava/lang/reflect/Method;)Ljava/lang/Class;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_4

    :cond_3
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    const/4 v0, 0x0

    aget-object v0, v1, v0

    goto :goto_3
.end method

.method private isSanityCheckSuccessful(Ljava/lang/String;Ljava/lang/reflect/Method;[Ljava/lang/Class;Ljava/lang/Object;)Z
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            "[",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    array-length v3, p3

    if-eq v3, v1, :cond_34

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Wrong number of parameters in setter method for property ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/joran/util/PropertySetter;->obj:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->addError(Ljava/lang/String;)V

    :goto_33
    return v0

    :cond_34
    aget-object v3, p3, v0

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_e4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "A \""

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\" object is not assignable to a \""

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget-object v3, p3, v0

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\" variable."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->addError(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The class \""

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget-object v3, p3, v0

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\" was loaded by "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->addError(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget-object v3, p3, v0

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "] whereas object of type "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->addError(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\""

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\" was loaded by ["

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->addError(Ljava/lang/String;)V

    goto/16 :goto_33

    :cond_e4
    move v0, v1

    goto/16 :goto_33
.end method

.method private isUnequivocallyInstantiable(Ljava/lang/Class;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    move-result v1

    if-eqz v1, :cond_8

    :cond_7
    :goto_7
    return v0

    :cond_8
    :try_start_8
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_b
    .catch Ljava/lang/InstantiationException; {:try_start_8 .. :try_end_b} :catch_10
    .catch Ljava/lang/IllegalAccessException; {:try_start_8 .. :try_end_b} :catch_12

    move-result-object v1

    if-eqz v1, :cond_7

    const/4 v0, 0x1

    goto :goto_7

    :catch_10
    move-exception v1

    goto :goto_7

    :catch_12
    move-exception v1

    goto :goto_7
.end method


# virtual methods
.method public addBasicProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    const/4 v4, 0x0

    if-nez p2, :cond_4

    :cond_3
    :goto_3
    return-void

    :cond_4
    invoke-direct {p0, p1}, Lch/qos/logback/core/joran/util/PropertySetter;->capitalizeFirstLetter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->findAdderMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v1

    if-nez v1, :cond_2b

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No adder for property ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->addError(Ljava/lang/String;)V

    goto :goto_3

    :cond_2b
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2, p2}, Lch/qos/logback/core/joran/util/PropertySetter;->isSanityCheckSuccessful(Ljava/lang/String;Ljava/lang/reflect/Method;[Ljava/lang/Class;Ljava/lang/Object;)Z

    const/4 v0, 0x0

    :try_start_33
    aget-object v0, v2, v0

    invoke-static {p0, p2, v0}, Lch/qos/logback/core/joran/util/StringToObjectConverter;->convertArg(Lch/qos/logback/core/spi/ContextAware;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_38
    .catch Ljava/lang/Throwable; {:try_start_33 .. :try_end_38} :catch_3f

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p0, v1, p2}, Lch/qos/logback/core/joran/util/PropertySetter;->invokeMethodWithSingleParameterOnThisObject(Ljava/lang/reflect/Method;Ljava/lang/Object;)V

    goto :goto_3

    :catch_3f
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Conversion to type ["

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget-object v2, v2, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] failed. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method public addComplexProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5

    invoke-direct {p0, p1}, Lch/qos/logback/core/joran/util/PropertySetter;->findAdderMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v0

    if-eqz v0, :cond_15

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1, p2}, Lch/qos/logback/core/joran/util/PropertySetter;->isSanityCheckSuccessful(Ljava/lang/String;Ljava/lang/reflect/Method;[Ljava/lang/Class;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    :goto_10
    return-void

    :cond_11
    invoke-virtual {p0, v0, p2}, Lch/qos/logback/core/joran/util/PropertySetter;->invokeMethodWithSingleParameterOnThisObject(Ljava/lang/reflect/Method;Ljava/lang/Object;)V

    goto :goto_10

    :cond_15
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not find method [add"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] in class ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/util/PropertySetter;->objClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->addError(Ljava/lang/String;)V

    goto :goto_10
.end method

.method public computeAggregationType(Ljava/lang/String;)Lch/qos/logback/core/util/AggregationType;
    .registers 4

    invoke-direct {p0, p1}, Lch/qos/logback/core/joran/util/PropertySetter;->findAdderMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v0

    if-eqz v0, :cond_15

    invoke-direct {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->computeRawAggregationType(Ljava/lang/reflect/Method;)Lch/qos/logback/core/util/AggregationType;

    move-result-object v0

    sget-object v1, Lch/qos/logback/core/joran/util/PropertySetter$1;->$SwitchMap$ch$qos$logback$core$util$AggregationType:[I

    invoke-virtual {v0}, Lch/qos/logback/core/util/AggregationType;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_2c

    :cond_15
    invoke-direct {p0, p1}, Lch/qos/logback/core/joran/util/PropertySetter;->findSetterMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v0

    if-eqz v0, :cond_29

    invoke-direct {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->computeRawAggregationType(Ljava/lang/reflect/Method;)Lch/qos/logback/core/util/AggregationType;

    move-result-object v0

    :goto_1f
    return-object v0

    :pswitch_20
    sget-object v0, Lch/qos/logback/core/util/AggregationType;->NOT_FOUND:Lch/qos/logback/core/util/AggregationType;

    goto :goto_1f

    :pswitch_23
    sget-object v0, Lch/qos/logback/core/util/AggregationType;->AS_BASIC_PROPERTY_COLLECTION:Lch/qos/logback/core/util/AggregationType;

    goto :goto_1f

    :pswitch_26
    sget-object v0, Lch/qos/logback/core/util/AggregationType;->AS_COMPLEX_PROPERTY_COLLECTION:Lch/qos/logback/core/util/AggregationType;

    goto :goto_1f

    :cond_29
    sget-object v0, Lch/qos/logback/core/util/AggregationType;->NOT_FOUND:Lch/qos/logback/core/util/AggregationType;

    goto :goto_1f

    :pswitch_data_2c
    .packed-switch 0x1
        :pswitch_20
        :pswitch_23
        :pswitch_26
    .end packed-switch
.end method

.method getAnnotation(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/annotation/Annotation;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/reflect/Method;",
            ")TT;"
        }
    .end annotation

    if-eqz p3, :cond_7

    invoke-virtual {p3, p2}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    :goto_6
    return-object v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method getByConcreteType(Ljava/lang/String;Ljava/lang/reflect/Method;)Ljava/lang/Class;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p2}, Lch/qos/logback/core/joran/util/PropertySetter;->getParameterClassForMethod(Ljava/lang/reflect/Method;)Ljava/lang/Class;

    move-result-object v1

    if-nez v1, :cond_8

    :cond_7
    :goto_7
    return-object v0

    :cond_8
    invoke-direct {p0, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->isUnequivocallyInstantiable(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_7

    move-object v0, v1

    goto :goto_7
.end method

.method public getClassNameViaImplicitRules(Ljava/lang/String;Lch/qos/logback/core/util/AggregationType;Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;)Ljava/lang/Class;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lch/qos/logback/core/util/AggregationType;",
            "Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/joran/util/PropertySetter;->obj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p3, v0, p1}, Lch/qos/logback/core/joran/spi/DefaultNestedComponentRegistry;->findDefaultComponentType(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_d

    :cond_c
    :goto_c
    return-object v0

    :cond_d
    invoke-virtual {p0, p1, p2}, Lch/qos/logback/core/joran/util/PropertySetter;->getRelevantMethod(Ljava/lang/String;Lch/qos/logback/core/util/AggregationType;)Ljava/lang/reflect/Method;

    move-result-object v1

    if-nez v1, :cond_15

    const/4 v0, 0x0

    goto :goto_c

    :cond_15
    invoke-virtual {p0, p1, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->getDefaultClassNameByAnnonation(Ljava/lang/String;Ljava/lang/reflect/Method;)Ljava/lang/Class;

    move-result-object v0

    if-nez v0, :cond_c

    invoke-virtual {p0, p1, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->getByConcreteType(Ljava/lang/String;Ljava/lang/reflect/Method;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_c
.end method

.method getDefaultClassNameByAnnonation(Ljava/lang/String;Ljava/lang/reflect/Method;)Ljava/lang/Class;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    const-class v0, Lch/qos/logback/core/joran/spi/DefaultClass;

    invoke-virtual {p0, p1, v0, p2}, Lch/qos/logback/core/joran/util/PropertySetter;->getAnnotation(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/spi/DefaultClass;

    if-eqz v0, :cond_f

    invoke-interface {v0}, Lch/qos/logback/core/joran/spi/DefaultClass;->value()Ljava/lang/Class;

    move-result-object v0

    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method protected getMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/joran/util/PropertySetter;->methodDescriptors:[Lch/qos/logback/core/joran/util/MethodDescriptor;

    if-nez v0, :cond_7

    invoke-virtual {p0}, Lch/qos/logback/core/joran/util/PropertySetter;->introspect()V

    :cond_7
    const/4 v0, 0x0

    :goto_8
    iget-object v1, p0, Lch/qos/logback/core/joran/util/PropertySetter;->methodDescriptors:[Lch/qos/logback/core/joran/util/MethodDescriptor;

    array-length v1, v1

    if-ge v0, v1, :cond_27

    iget-object v1, p0, Lch/qos/logback/core/joran/util/PropertySetter;->methodDescriptors:[Lch/qos/logback/core/joran/util/MethodDescriptor;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lch/qos/logback/core/joran/util/MethodDescriptor;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    iget-object v1, p0, Lch/qos/logback/core/joran/util/PropertySetter;->methodDescriptors:[Lch/qos/logback/core/joran/util/MethodDescriptor;

    aget-object v0, v1, v0

    invoke-virtual {v0}, Lch/qos/logback/core/joran/util/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    :goto_23
    return-object v0

    :cond_24
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_27
    const/4 v0, 0x0

    goto :goto_23
.end method

.method public getObj()Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/util/PropertySetter;->obj:Ljava/lang/Object;

    return-object v0
.end method

.method public getObjClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/joran/util/PropertySetter;->objClass:Ljava/lang/Class;

    return-object v0
.end method

.method protected getPropertyDescriptor(Ljava/lang/String;)Lch/qos/logback/core/joran/util/PropertyDescriptor;
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/joran/util/PropertySetter;->propertyDescriptors:[Lch/qos/logback/core/joran/util/PropertyDescriptor;

    if-nez v0, :cond_7

    invoke-virtual {p0}, Lch/qos/logback/core/joran/util/PropertySetter;->introspect()V

    :cond_7
    const/4 v0, 0x0

    :goto_8
    iget-object v1, p0, Lch/qos/logback/core/joran/util/PropertySetter;->propertyDescriptors:[Lch/qos/logback/core/joran/util/PropertyDescriptor;

    array-length v1, v1

    if-ge v0, v1, :cond_23

    iget-object v1, p0, Lch/qos/logback/core/joran/util/PropertySetter;->propertyDescriptors:[Lch/qos/logback/core/joran/util/PropertyDescriptor;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lch/qos/logback/core/joran/util/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_20

    iget-object v1, p0, Lch/qos/logback/core/joran/util/PropertySetter;->propertyDescriptors:[Lch/qos/logback/core/joran/util/PropertyDescriptor;

    aget-object v0, v1, v0

    :goto_1f
    return-object v0

    :cond_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_23
    const/4 v0, 0x0

    goto :goto_1f
.end method

.method getRelevantMethod(Ljava/lang/String;Lch/qos/logback/core/util/AggregationType;)Ljava/lang/reflect/Method;
    .registers 6

    invoke-direct {p0, p1}, Lch/qos/logback/core/joran/util/PropertySetter;->capitalizeFirstLetter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lch/qos/logback/core/util/AggregationType;->AS_COMPLEX_PROPERTY_COLLECTION:Lch/qos/logback/core/util/AggregationType;

    if-ne p2, v1, :cond_d

    invoke-direct {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->findAdderMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    sget-object v1, Lch/qos/logback/core/util/AggregationType;->AS_COMPLEX_PROPERTY:Lch/qos/logback/core/util/AggregationType;

    if-ne p2, v1, :cond_16

    invoke-direct {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->findSetterMethod(Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v0

    goto :goto_c

    :cond_16
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not allowed here"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected introspect()V
    .registers 5

    const/4 v3, 0x0

    :try_start_1
    iget-object v0, p0, Lch/qos/logback/core/joran/util/PropertySetter;->objClass:Ljava/lang/Class;

    invoke-static {v0}, Lch/qos/logback/core/joran/util/Introspector;->getPropertyDescriptors(Ljava/lang/Class;)[Lch/qos/logback/core/joran/util/PropertyDescriptor;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/joran/util/PropertySetter;->propertyDescriptors:[Lch/qos/logback/core/joran/util/PropertyDescriptor;

    iget-object v0, p0, Lch/qos/logback/core/joran/util/PropertySetter;->objClass:Ljava/lang/Class;

    invoke-static {v0}, Lch/qos/logback/core/joran/util/Introspector;->getMethodDescriptors(Ljava/lang/Class;)[Lch/qos/logback/core/joran/util/MethodDescriptor;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/joran/util/PropertySetter;->methodDescriptors:[Lch/qos/logback/core/joran/util/MethodDescriptor;
    :try_end_11
    .catch Lch/qos/logback/core/joran/util/IntrospectionException; {:try_start_1 .. :try_end_11} :catch_12

    :goto_11
    return-void

    :catch_12
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to introspect "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/joran/util/PropertySetter;->obj:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lch/qos/logback/core/joran/util/IntrospectionException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->addError(Ljava/lang/String;)V

    new-array v0, v3, [Lch/qos/logback/core/joran/util/PropertyDescriptor;

    iput-object v0, p0, Lch/qos/logback/core/joran/util/PropertySetter;->propertyDescriptors:[Lch/qos/logback/core/joran/util/PropertyDescriptor;

    new-array v0, v3, [Lch/qos/logback/core/joran/util/MethodDescriptor;

    iput-object v0, p0, Lch/qos/logback/core/joran/util/PropertySetter;->methodDescriptors:[Lch/qos/logback/core/joran/util/MethodDescriptor;

    goto :goto_11
.end method

.method invokeMethodWithSingleParameterOnThisObject(Ljava/lang/reflect/Method;Ljava/lang/Object;)V
    .registers 7

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    :try_start_4
    iget-object v0, p0, Lch/qos/logback/core/joran/util/PropertySetter;->obj:Ljava/lang/Object;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-virtual {p1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_f} :catch_10

    :goto_f
    return-void

    :catch_10
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not invoke method "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " in class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lch/qos/logback/core/joran/util/PropertySetter;->obj:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " with parameter of type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_f
.end method

.method public setComplexProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6

    invoke-static {p1}, Lch/qos/logback/core/joran/util/Introspector;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->getPropertyDescriptor(Ljava/lang/String;)Lch/qos/logback/core/joran/util/PropertyDescriptor;

    move-result-object v0

    if-nez v0, :cond_31

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Could not find PropertyDescriptor for ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/util/PropertySetter;->objClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->addWarn(Ljava/lang/String;)V

    :cond_30
    :goto_30
    return-void

    :cond_31
    invoke-virtual {v0}, Lch/qos/logback/core/joran/util/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    if-nez v0, :cond_62

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Not setter method for property ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/util/PropertySetter;->obj:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->addWarn(Ljava/lang/String;)V

    goto :goto_30

    :cond_62
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1, p2}, Lch/qos/logback/core/joran/util/PropertySetter;->isSanityCheckSuccessful(Ljava/lang/String;Ljava/lang/reflect/Method;[Ljava/lang/Class;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_30

    :try_start_6c
    invoke-virtual {p0, v0, p2}, Lch/qos/logback/core/joran/util/PropertySetter;->invokeMethodWithSingleParameterOnThisObject(Ljava/lang/reflect/Method;Ljava/lang/Object;)V
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_6c .. :try_end_6f} :catch_70

    goto :goto_30

    :catch_70
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not set component "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/joran/util/PropertySetter;->obj:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " for parent component "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/joran/util/PropertySetter;->obj:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_30
.end method

.method public setProperty(Lch/qos/logback/core/joran/util/PropertyDescriptor;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/util/PropertySetterException;
        }
    .end annotation

    const/4 v3, 0x1

    const/4 v5, 0x0

    invoke-virtual {p1}, Lch/qos/logback/core/joran/util/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    if-nez v0, :cond_27

    new-instance v0, Lch/qos/logback/core/util/PropertySetterException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No setter for property ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lch/qos/logback/core/util/PropertySetterException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_27
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    array-length v2, v1

    if-eq v2, v3, :cond_36

    new-instance v0, Lch/qos/logback/core/util/PropertySetterException;

    const-string v1, "#params for setter != 1"

    invoke-direct {v0, v1}, Lch/qos/logback/core/util/PropertySetterException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_36
    const/4 v2, 0x0

    :try_start_37
    aget-object v2, v1, v2

    invoke-static {p0, p3, v2}, Lch/qos/logback/core/joran/util/StringToObjectConverter;->convertArg(Lch/qos/logback/core/spi/ContextAware;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_3c
    .catch Ljava/lang/Throwable; {:try_start_37 .. :try_end_3c} :catch_60

    move-result-object v2

    if-nez v2, :cond_82

    new-instance v0, Lch/qos/logback/core/util/PropertySetterException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Conversion to type ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v1, v1, v5

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] failed."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lch/qos/logback/core/util/PropertySetterException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_60
    move-exception v0

    new-instance v2, Lch/qos/logback/core/util/PropertySetterException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Conversion to type ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v1, v1, v5

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "] failed. "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lch/qos/logback/core/util/PropertySetterException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :cond_82
    :try_start_82
    iget-object v1, p0, Lch/qos/logback/core/joran/util/PropertySetter;->obj:Ljava/lang/Object;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    invoke-virtual {v0, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8d
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_8d} :catch_8e

    return-void

    :catch_8e
    move-exception v0

    new-instance v1, Lch/qos/logback/core/util/PropertySetterException;

    invoke-direct {v1, v0}, Lch/qos/logback/core/util/PropertySetterException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    if-nez p2, :cond_3

    :goto_2
    return-void

    :cond_3
    invoke-static {p1}, Lch/qos/logback/core/joran/util/Introspector;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->getPropertyDescriptor(Ljava/lang/String;)Lch/qos/logback/core/joran/util/PropertyDescriptor;

    move-result-object v1

    if-nez v1, :cond_3a

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No such property ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/util/PropertySetter;->objClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/util/PropertySetter;->addWarn(Ljava/lang/String;)V

    goto :goto_2

    :cond_3a
    :try_start_3a
    invoke-virtual {p0, v1, v0, p2}, Lch/qos/logback/core/joran/util/PropertySetter;->setProperty(Lch/qos/logback/core/joran/util/PropertyDescriptor;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3d
    .catch Lch/qos/logback/core/util/PropertySetterException; {:try_start_3a .. :try_end_3d} :catch_3e

    goto :goto_2

    :catch_3e
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to set property ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "] to value \""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\". "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/core/joran/util/PropertySetter;->addWarn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2
.end method
