.class Lfreemarker/ext/jython/JythonModelCache;
.super Lfreemarker/ext/util/ModelCache;
.source "JythonModelCache.java"


# instance fields
.field private final wrapper:Lfreemarker/ext/jython/JythonWrapper;


# direct methods
.method constructor <init>(Lfreemarker/ext/jython/JythonWrapper;)V
    .registers 2
    .param p1, "wrapper"    # Lfreemarker/ext/jython/JythonWrapper;

    .prologue
    .line 28
    invoke-direct {p0}, Lfreemarker/ext/util/ModelCache;-><init>()V

    .line 29
    iput-object p1, p0, Lfreemarker/ext/jython/JythonModelCache;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    .line 30
    return-void
.end method


# virtual methods
.method protected create(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 8
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 37
    const/4 v0, 0x0

    .line 38
    .local v0, "asHash":Z
    const/4 v1, 0x0

    .line 39
    .local v1, "asSequence":Z
    sget-object v3, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->INSTANCE:Lfreemarker/ext/jython/JythonVersionAdapter;

    .line 40
    .local v3, "versionAdapter":Lfreemarker/ext/jython/JythonVersionAdapter;
    invoke-virtual {v3, p1}, Lfreemarker/ext/jython/JythonVersionAdapter;->isPyInstance(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3b

    .line 41
    invoke-virtual {v3, p1}, Lfreemarker/ext/jython/JythonVersionAdapter;->pyInstanceToJava(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 43
    .local v2, "jobj":Ljava/lang/Object;
    instance-of v4, v2, Lfreemarker/template/TemplateModel;

    if-eqz v4, :cond_15

    .line 44
    check-cast v2, Lfreemarker/template/TemplateModel;

    .line 80
    .end local v2    # "jobj":Ljava/lang/Object;
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_14
    return-object v2

    .line 46
    .restart local v2    # "jobj":Ljava/lang/Object;
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_15
    instance-of v4, v2, Ljava/util/Map;

    if-eqz v4, :cond_1a

    .line 47
    const/4 v0, 0x1

    .line 49
    :cond_1a
    instance-of v4, v2, Ljava/util/Date;

    if-eqz v4, :cond_2b

    .line 50
    new-instance v4, Lfreemarker/ext/beans/DateModel;

    check-cast v2, Ljava/util/Date;

    .end local v2    # "jobj":Ljava/lang/Object;
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->getDefaultInstance()Lfreemarker/ext/beans/BeansWrapper;

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lfreemarker/ext/beans/DateModel;-><init>(Ljava/util/Date;Lfreemarker/ext/beans/BeansWrapper;)V

    move-object v2, v4

    goto :goto_14

    .line 52
    .restart local v2    # "jobj":Ljava/lang/Object;
    :cond_2b
    instance-of v4, v2, Ljava/util/Collection;

    if-eqz v4, :cond_3b

    .line 53
    const/4 v1, 0x1

    .line 58
    instance-of v4, v2, Ljava/util/List;

    if-nez v4, :cond_3b

    .line 59
    new-instance p1, Ljava/util/ArrayList;

    .end local p1    # "obj":Ljava/lang/Object;
    check-cast v2, Ljava/util/Collection;

    .end local v2    # "jobj":Ljava/lang/Object;
    invoke-direct {p1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 65
    :cond_3b
    instance-of v4, p1, Lorg/python/core/PyObject;

    if-nez v4, :cond_43

    .line 66
    invoke-static {p1}, Lorg/python/core/Py;->java2py(Ljava/lang/Object;)Lorg/python/core/PyObject;

    move-result-object p1

    .line 68
    :cond_43
    if-nez v0, :cond_4d

    instance-of v4, p1, Lorg/python/core/PyDictionary;

    if-nez v4, :cond_4d

    instance-of v4, p1, Lorg/python/core/PyStringMap;

    if-eqz v4, :cond_56

    .line 69
    :cond_4d
    sget-object v4, Lfreemarker/ext/jython/JythonHashModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    iget-object v5, p0, Lfreemarker/ext/jython/JythonModelCache;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    invoke-interface {v4, p1, v5}, Lfreemarker/ext/util/ModelFactory;->create(Ljava/lang/Object;Lfreemarker/template/ObjectWrapper;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    goto :goto_14

    .line 71
    :cond_56
    if-nez v1, :cond_5c

    instance-of v4, p1, Lorg/python/core/PySequence;

    if-eqz v4, :cond_65

    .line 72
    :cond_5c
    sget-object v4, Lfreemarker/ext/jython/JythonSequenceModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    iget-object v5, p0, Lfreemarker/ext/jython/JythonModelCache;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    invoke-interface {v4, p1, v5}, Lfreemarker/ext/util/ModelFactory;->create(Ljava/lang/Object;Lfreemarker/template/ObjectWrapper;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    goto :goto_14

    .line 74
    :cond_65
    instance-of v4, p1, Lorg/python/core/PyInteger;

    if-nez v4, :cond_71

    instance-of v4, p1, Lorg/python/core/PyLong;

    if-nez v4, :cond_71

    instance-of v4, p1, Lorg/python/core/PyFloat;

    if-eqz v4, :cond_7a

    .line 75
    :cond_71
    sget-object v4, Lfreemarker/ext/jython/JythonNumberModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    iget-object v5, p0, Lfreemarker/ext/jython/JythonModelCache;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    invoke-interface {v4, p1, v5}, Lfreemarker/ext/util/ModelFactory;->create(Ljava/lang/Object;Lfreemarker/template/ObjectWrapper;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    goto :goto_14

    .line 77
    :cond_7a
    instance-of v4, p1, Lorg/python/core/PyNone;

    if-eqz v4, :cond_80

    .line 78
    const/4 v2, 0x0

    goto :goto_14

    .line 80
    :cond_80
    sget-object v4, Lfreemarker/ext/jython/JythonModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    iget-object v5, p0, Lfreemarker/ext/jython/JythonModelCache;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    invoke-interface {v4, p1, v5}, Lfreemarker/ext/util/ModelFactory;->create(Ljava/lang/Object;Lfreemarker/template/ObjectWrapper;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    goto :goto_14
.end method

.method protected isCacheable(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 33
    const/4 v0, 0x1

    return v0
.end method
