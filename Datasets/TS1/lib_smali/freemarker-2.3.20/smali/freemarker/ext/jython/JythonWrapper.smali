.class public Lfreemarker/ext/jython/JythonWrapper;
.super Ljava/lang/Object;
.source "JythonWrapper.java"

# interfaces
.implements Lfreemarker/template/ObjectWrapper;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;
    }
.end annotation


# static fields
.field public static final INSTANCE:Lfreemarker/ext/jython/JythonWrapper;

.field private static final PYOBJECT_CLASS:Ljava/lang/Class;

.field static class$org$python$core$PyObject:Ljava/lang/Class;


# instance fields
.field private attributesShadowItems:Z

.field private final modelCache:Lfreemarker/ext/util/ModelCache;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 94
    sget-object v0, Lfreemarker/ext/jython/JythonWrapper;->class$org$python$core$PyObject:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.python.core.PyObject"

    invoke-static {v0}, Lfreemarker/ext/jython/JythonWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jython/JythonWrapper;->class$org$python$core$PyObject:Ljava/lang/Class;

    :goto_c
    sput-object v0, Lfreemarker/ext/jython/JythonWrapper;->PYOBJECT_CLASS:Ljava/lang/Class;

    .line 95
    new-instance v0, Lfreemarker/ext/jython/JythonWrapper;

    invoke-direct {v0}, Lfreemarker/ext/jython/JythonWrapper;-><init>()V

    sput-object v0, Lfreemarker/ext/jython/JythonWrapper;->INSTANCE:Lfreemarker/ext/jython/JythonWrapper;

    return-void

    .line 94
    :cond_16
    sget-object v0, Lfreemarker/ext/jython/JythonWrapper;->class$org$python$core$PyObject:Ljava/lang/Class;

    goto :goto_c
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    new-instance v0, Lfreemarker/ext/jython/JythonModelCache;

    invoke-direct {v0, p0}, Lfreemarker/ext/jython/JythonModelCache;-><init>(Lfreemarker/ext/jython/JythonWrapper;)V

    iput-object v0, p0, Lfreemarker/ext/jython/JythonWrapper;->modelCache:Lfreemarker/ext/util/ModelCache;

    .line 99
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfreemarker/ext/jython/JythonWrapper;->attributesShadowItems:Z

    .line 103
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 94
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
.method isAttributesShadowItems()Z
    .registers 2

    .prologue
    .line 132
    iget-boolean v0, p0, Lfreemarker/ext/jython/JythonWrapper;->attributesShadowItems:Z

    return v0
.end method

.method public declared-synchronized setAttributesShadowItems(Z)V
    .registers 3
    .param p1, "attributesShadowItems"    # Z

    .prologue
    .line 127
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lfreemarker/ext/jython/JythonWrapper;->attributesShadowItems:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 128
    monitor-exit p0

    return-void

    .line 127
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setUseCache(Z)V
    .registers 3
    .param p1, "useCache"    # Z

    .prologue
    .line 112
    iget-object v0, p0, Lfreemarker/ext/jython/JythonWrapper;->modelCache:Lfreemarker/ext/util/ModelCache;

    invoke-virtual {v0, p1}, Lfreemarker/ext/util/ModelCache;->setUseCache(Z)V

    .line 113
    return-void
.end method

.method public unwrap(Lfreemarker/template/TemplateModel;)Lorg/python/core/PyObject;
    .registers 5
    .param p1, "model"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 180
    instance-of v1, p1, Lfreemarker/template/AdapterTemplateModel;

    if-eqz v1, :cond_11

    .line 181
    check-cast p1, Lfreemarker/template/AdapterTemplateModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    sget-object v1, Lfreemarker/ext/jython/JythonWrapper;->PYOBJECT_CLASS:Ljava/lang/Class;

    invoke-interface {p1, v1}, Lfreemarker/template/AdapterTemplateModel;->getAdaptedObject(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorg/python/core/Py;->java2py(Ljava/lang/Object;)Lorg/python/core/PyObject;

    move-result-object v1

    .line 215
    :goto_10
    return-object v1

    .line 184
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_11
    instance-of v1, p1, Lfreemarker/ext/util/WrapperTemplateModel;

    if-eqz v1, :cond_20

    .line 185
    check-cast p1, Lfreemarker/ext/util/WrapperTemplateModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {p1}, Lfreemarker/ext/util/WrapperTemplateModel;->getWrappedObject()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorg/python/core/Py;->java2py(Ljava/lang/Object;)Lorg/python/core/PyObject;

    move-result-object v1

    goto :goto_10

    .line 189
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_20
    instance-of v1, p1, Lfreemarker/template/TemplateScalarModel;

    if-eqz v1, :cond_30

    .line 191
    new-instance v1, Lorg/python/core/PyString;

    check-cast p1, Lfreemarker/template/TemplateScalarModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {p1}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/python/core/PyString;-><init>(Ljava/lang/String;)V

    goto :goto_10

    .line 195
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_30
    instance-of v1, p1, Lfreemarker/template/TemplateNumberModel;

    if-eqz v1, :cond_53

    .line 197
    check-cast p1, Lfreemarker/template/TemplateNumberModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {p1}, Lfreemarker/template/TemplateNumberModel;->getAsNumber()Ljava/lang/Number;

    move-result-object v0

    .line 198
    .local v0, "number":Ljava/lang/Number;
    instance-of v1, v0, Ljava/math/BigDecimal;

    if-eqz v1, :cond_42

    .line 200
    invoke-static {v0}, Lfreemarker/template/utility/OptimizerUtil;->optimizeNumberRepresentation(Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v0

    .line 202
    :cond_42
    instance-of v1, v0, Ljava/math/BigInteger;

    if-eqz v1, :cond_4e

    .line 207
    new-instance v1, Lorg/python/core/PyLong;

    check-cast v0, Ljava/math/BigInteger;

    .end local v0    # "number":Ljava/lang/Number;
    invoke-direct {v1, v0}, Lorg/python/core/PyLong;-><init>(Ljava/math/BigInteger;)V

    goto :goto_10

    .line 211
    .restart local v0    # "number":Ljava/lang/Number;
    :cond_4e
    invoke-static {v0}, Lorg/python/core/Py;->java2py(Ljava/lang/Object;)Lorg/python/core/PyObject;

    move-result-object v1

    goto :goto_10

    .line 215
    .end local v0    # "number":Ljava/lang/Number;
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_53
    new-instance v1, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;

    invoke-direct {v1, p0, p1}, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;-><init>(Lfreemarker/ext/jython/JythonWrapper;Lfreemarker/template/TemplateModel;)V

    goto :goto_10
.end method

.method public wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 150
    if-nez p1, :cond_4

    .line 151
    const/4 v0, 0x0

    .line 153
    :goto_3
    return-object v0

    :cond_4
    iget-object v0, p0, Lfreemarker/ext/jython/JythonWrapper;->modelCache:Lfreemarker/ext/util/ModelCache;

    invoke-virtual {v0, p1}, Lfreemarker/ext/util/ModelCache;->getInstance(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_3
.end method
