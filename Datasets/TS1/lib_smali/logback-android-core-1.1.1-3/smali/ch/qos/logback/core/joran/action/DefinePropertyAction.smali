.class public Lch/qos/logback/core/joran/action/DefinePropertyAction;
.super Lch/qos/logback/core/joran/action/Action;


# instance fields
.field definer:Lch/qos/logback/core/spi/PropertyDefiner;

.field inError:Z

.field propertyName:Ljava/lang/String;

.field scope:Lch/qos/logback/core/joran/action/ActionUtil$Scope;

.field scopeStr:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/joran/action/Action;-><init>()V

    return-void
.end method


# virtual methods
.method public begin(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/ActionException;
        }
    .end annotation

    const/4 v3, 0x1

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->scopeStr:Ljava/lang/String;

    iput-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->scope:Lch/qos/logback/core/joran/action/ActionUtil$Scope;

    iput-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->propertyName:Ljava/lang/String;

    iput-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->definer:Lch/qos/logback/core/spi/PropertyDefiner;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->inError:Z

    const-string v0, "name"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->propertyName:Ljava/lang/String;

    const-string v0, "scope"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->scopeStr:Ljava/lang/String;

    iget-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->scopeStr:Ljava/lang/String;

    invoke-static {v0}, Lch/qos/logback/core/joran/action/ActionUtil;->stringToScope(Ljava/lang/String;)Lch/qos/logback/core/joran/action/ActionUtil$Scope;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->scope:Lch/qos/logback/core/joran/action/ActionUtil$Scope;

    iget-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->propertyName:Ljava/lang/String;

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_54

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Missing property name for property definer. Near ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] line "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lch/qos/logback/core/joran/action/DefinePropertyAction;->getLineNumber(Lch/qos/logback/core/joran/spi/InterpretationContext;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/DefinePropertyAction;->addError(Ljava/lang/String;)V

    iput-boolean v3, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->inError:Z

    :goto_53
    return-void

    :cond_54
    const-string v0, "class"

    invoke-interface {p3, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_87

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Missing class name for property definer. Near ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] line "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lch/qos/logback/core/joran/action/DefinePropertyAction;->getLineNumber(Lch/qos/logback/core/joran/spi/InterpretationContext;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/DefinePropertyAction;->addError(Ljava/lang/String;)V

    iput-boolean v3, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->inError:Z

    goto :goto_53

    :cond_87
    :try_start_87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "About to instantiate property definer of type ["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/DefinePropertyAction;->addInfo(Ljava/lang/String;)V

    const-class v0, Lch/qos/logback/core/spi/PropertyDefiner;

    iget-object v2, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->context:Lch/qos/logback/core/Context;

    invoke-static {v1, v0, v2}, Lch/qos/logback/core/util/OptionHelper;->instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Lch/qos/logback/core/Context;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/spi/PropertyDefiner;

    iput-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->definer:Lch/qos/logback/core/spi/PropertyDefiner;

    iget-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->definer:Lch/qos/logback/core/spi/PropertyDefiner;

    iget-object v2, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->context:Lch/qos/logback/core/Context;

    invoke-interface {v0, v2}, Lch/qos/logback/core/spi/PropertyDefiner;->setContext(Lch/qos/logback/core/Context;)V

    iget-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->definer:Lch/qos/logback/core/spi/PropertyDefiner;

    instance-of v0, v0, Lch/qos/logback/core/spi/LifeCycle;

    if-eqz v0, :cond_c3

    iget-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->definer:Lch/qos/logback/core/spi/PropertyDefiner;

    check-cast v0, Lch/qos/logback/core/spi/LifeCycle;

    invoke-interface {v0}, Lch/qos/logback/core/spi/LifeCycle;->start()V

    :cond_c3
    iget-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->definer:Lch/qos/logback/core/spi/PropertyDefiner;

    invoke-virtual {p1, v0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->pushObject(Ljava/lang/Object;)V
    :try_end_c8
    .catch Ljava/lang/Exception; {:try_start_87 .. :try_end_c8} :catch_c9

    goto :goto_53

    :catch_c9
    move-exception v0

    iput-boolean v3, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->inError:Z

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not create an PropertyDefiner of type ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lch/qos/logback/core/joran/action/DefinePropertyAction;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v1, Lch/qos/logback/core/joran/spi/ActionException;

    invoke-direct {v1, v0}, Lch/qos/logback/core/joran/spi/ActionException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public end(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;)V
    .registers 6

    iget-boolean v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->inError:Z

    if-eqz v0, :cond_5

    :cond_4
    :goto_4
    return-void

    :cond_5
    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->peekObject()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->definer:Lch/qos/logback/core/spi/PropertyDefiner;

    if-eq v0, v1, :cond_2c

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "The object at the of the stack is not the property definer for property named ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->propertyName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] pushed earlier."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/DefinePropertyAction;->addWarn(Ljava/lang/String;)V

    goto :goto_4

    :cond_2c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Popping property definer for property named ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->propertyName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] from the object stack"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/joran/action/DefinePropertyAction;->addInfo(Ljava/lang/String;)V

    invoke-virtual {p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->popObject()Ljava/lang/Object;

    iget-object v0, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->definer:Lch/qos/logback/core/spi/PropertyDefiner;

    invoke-interface {v0}, Lch/qos/logback/core/spi/PropertyDefiner;->getPropertyValue()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v1, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->propertyName:Ljava/lang/String;

    iget-object v2, p0, Lch/qos/logback/core/joran/action/DefinePropertyAction;->scope:Lch/qos/logback/core/joran/action/ActionUtil$Scope;

    invoke-static {p1, v1, v0, v2}, Lch/qos/logback/core/joran/action/ActionUtil;->setProperty(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Ljava/lang/String;Lch/qos/logback/core/joran/action/ActionUtil$Scope;)V

    goto :goto_4
.end method
