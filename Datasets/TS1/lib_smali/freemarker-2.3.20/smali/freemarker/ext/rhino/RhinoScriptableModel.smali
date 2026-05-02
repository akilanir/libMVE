.class public Lfreemarker/ext/rhino/RhinoScriptableModel;
.super Ljava/lang/Object;
.source "RhinoScriptableModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModelEx;
.implements Lfreemarker/template/TemplateSequenceModel;
.implements Lfreemarker/template/AdapterTemplateModel;
.implements Lfreemarker/template/TemplateScalarModel;
.implements Lfreemarker/template/TemplateBooleanModel;
.implements Lfreemarker/template/TemplateNumberModel;


# static fields
.field static final FACTORY:Lfreemarker/ext/util/ModelFactory;

.field static class$java$lang$Object:Ljava/lang/Class;


# instance fields
.field private final scriptable:Lorg/mozilla/javascript/Scriptable;

.field private final wrapper:Lfreemarker/ext/beans/BeansWrapper;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 30
    new-instance v0, Lfreemarker/ext/rhino/RhinoScriptableModel$1;

    invoke-direct {v0}, Lfreemarker/ext/rhino/RhinoScriptableModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/rhino/RhinoScriptableModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 3
    .param p1, "scriptable"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    .line 42
    iput-object p2, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    .line 43
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 119
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

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 56
    iget-object v1, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v1, p1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v0

    .line 57
    .local v0, "retval":Ljava/lang/Object;
    instance-of v1, v0, Lorg/mozilla/javascript/Function;

    if-eqz v1, :cond_16

    .line 58
    new-instance v1, Lfreemarker/ext/rhino/RhinoFunctionModel;

    check-cast v0, Lorg/mozilla/javascript/Function;

    .end local v0    # "retval":Ljava/lang/Object;
    iget-object v2, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    iget-object v3, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-direct {v1, v0, v2, v3}, Lfreemarker/ext/rhino/RhinoFunctionModel;-><init>(Lorg/mozilla/javascript/Function;Lorg/mozilla/javascript/Scriptable;Lfreemarker/ext/beans/BeansWrapper;)V

    .line 61
    :goto_15
    return-object v1

    .restart local v0    # "retval":Ljava/lang/Object;
    :cond_16
    iget-object v1, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v1, v0}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    goto :goto_15
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 46
    iget-object v1, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v1, p1}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 47
    .local v0, "retval":Ljava/lang/Object;
    instance-of v1, v0, Lorg/mozilla/javascript/Function;

    if-eqz v1, :cond_16

    .line 48
    new-instance v1, Lfreemarker/ext/rhino/RhinoFunctionModel;

    check-cast v0, Lorg/mozilla/javascript/Function;

    .end local v0    # "retval":Ljava/lang/Object;
    iget-object v2, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    iget-object v3, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-direct {v1, v0, v2, v3}, Lfreemarker/ext/rhino/RhinoFunctionModel;-><init>(Lorg/mozilla/javascript/Function;Lorg/mozilla/javascript/Scriptable;Lfreemarker/ext/beans/BeansWrapper;)V

    .line 51
    :goto_15
    return-object v1

    .restart local v0    # "retval":Ljava/lang/Object;
    :cond_16
    iget-object v1, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v1, v0}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    goto :goto_15
.end method

.method public getAdaptedObject(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p1, "hint"    # Ljava/lang/Class;

    .prologue
    .line 116
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    invoke-static {p1, v1}, Lorg/mozilla/javascript/NativeJavaObject;->coerceType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Lorg/mozilla/javascript/EvaluatorException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    .line 119
    :goto_6
    return-object v1

    .line 118
    :catch_7
    move-exception v0

    .line 119
    .local v0, "e":Lorg/mozilla/javascript/EvaluatorException;
    sget-object v1, Lfreemarker/ext/rhino/RhinoScriptableModel;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v1, :cond_1b

    const-string v1, "java.lang.Object"

    invoke-static {v1}, Lfreemarker/ext/rhino/RhinoScriptableModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/ext/rhino/RhinoScriptableModel;->class$java$lang$Object:Ljava/lang/Class;

    :goto_14
    iget-object v2, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v1, v2}, Lorg/mozilla/javascript/NativeJavaObject;->coerceType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_6

    :cond_1b
    sget-object v1, Lfreemarker/ext/rhino/RhinoScriptableModel;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_14
.end method

.method public getAsBoolean()Z
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v0}, Lorg/mozilla/javascript/Context;->toBoolean(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getAsNumber()Ljava/lang/Number;
    .registers 4

    .prologue
    .line 99
    new-instance v0, Ljava/lang/Double;

    iget-object v1, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v1}, Lorg/mozilla/javascript/Context;->toNumber(Ljava/lang/Object;)D

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    return-object v0
.end method

.method public getAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v0}, Lorg/mozilla/javascript/Context;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getScriptable()Lorg/mozilla/javascript/Scriptable;
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    return-object v0
.end method

.method getWrapper()Lfreemarker/ext/beans/BeansWrapper;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v0}, Lorg/mozilla/javascript/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    iget-object v1, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v1}, Lorg/mozilla/javascript/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateCollectionModel;

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v0}, Lorg/mozilla/javascript/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 78
    iget-object v4, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v4}, Lorg/mozilla/javascript/Scriptable;->getIds()[Ljava/lang/Object;

    move-result-object v2

    .line 79
    .local v2, "ids":[Ljava/lang/Object;
    array-length v4, v2

    new-array v3, v4, [Ljava/lang/Object;

    .line 80
    .local v3, "values":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    array-length v4, v3

    if-ge v0, v4, :cond_31

    .line 81
    aget-object v1, v2, v0

    .line 82
    .local v1, "id":Ljava/lang/Object;
    instance-of v4, v1, Ljava/lang/Number;

    if-eqz v4, :cond_24

    .line 83
    iget-object v4, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    check-cast v1, Ljava/lang/Number;

    .end local v1    # "id":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v5

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;I)Ljava/lang/Object;

    move-result-object v4

    aput-object v4, v3, v0

    .line 80
    :goto_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 87
    .restart local v1    # "id":Ljava/lang/Object;
    :cond_24
    iget-object v4, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->scriptable:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    aput-object v4, v3, v0

    goto :goto_21

    .line 91
    .end local v1    # "id":Ljava/lang/Object;
    :cond_31
    iget-object v4, p0, Lfreemarker/ext/rhino/RhinoScriptableModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v4, v3}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    check-cast v4, Lfreemarker/template/TemplateCollectionModel;

    return-object v4
.end method
