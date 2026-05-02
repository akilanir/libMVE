.class public Lfreemarker/ext/jython/JythonHashModel;
.super Lfreemarker/ext/jython/JythonModel;
.source "JythonHashModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModelEx;


# static fields
.field static final FACTORY:Lfreemarker/ext/util/ModelFactory;

.field private static final KEYS:Ljava/lang/String; = "keys"

.field private static final KEYSET:Ljava/lang/String; = "keySet"

.field private static final VALUES:Ljava/lang/String; = "values"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 88
    new-instance v0, Lfreemarker/ext/jython/JythonHashModel$1;

    invoke-direct {v0}, Lfreemarker/ext/jython/JythonHashModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/jython/JythonHashModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void
.end method

.method public constructor <init>(Lorg/python/core/PyObject;Lfreemarker/ext/jython/JythonWrapper;)V
    .registers 3
    .param p1, "object"    # Lorg/python/core/PyObject;
    .param p2, "wrapper"    # Lfreemarker/ext/jython/JythonWrapper;

    .prologue
    .line 99
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/jython/JythonModel;-><init>(Lorg/python/core/PyObject;Lfreemarker/ext/jython/JythonWrapper;)V

    .line 100
    return-void
.end method


# virtual methods
.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 125
    :try_start_0
    iget-object v2, p0, Lfreemarker/ext/jython/JythonHashModel;->object:Lorg/python/core/PyObject;

    const-string v3, "keys"

    invoke-virtual {v2, v3}, Lorg/python/core/PyObject;->__findattr__(Ljava/lang/String;)Lorg/python/core/PyObject;

    move-result-object v1

    .line 126
    .local v1, "method":Lorg/python/core/PyObject;
    if-nez v1, :cond_12

    .line 128
    iget-object v2, p0, Lfreemarker/ext/jython/JythonHashModel;->object:Lorg/python/core/PyObject;

    const-string v3, "keySet"

    invoke-virtual {v2, v3}, Lorg/python/core/PyObject;->__findattr__(Ljava/lang/String;)Lorg/python/core/PyObject;

    move-result-object v1

    .line 130
    :cond_12
    if-eqz v1, :cond_28

    .line 132
    iget-object v2, p0, Lfreemarker/ext/jython/JythonHashModel;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    invoke-virtual {v1}, Lorg/python/core/PyObject;->__call__()Lorg/python/core/PyObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lfreemarker/ext/jython/JythonWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    check-cast v2, Lfreemarker/template/TemplateCollectionModel;
    :try_end_20
    .catch Lorg/python/core/PyException; {:try_start_0 .. :try_end_20} :catch_21

    return-object v2

    .line 135
    .end local v1    # "method":Lorg/python/core/PyObject;
    :catch_21
    move-exception v0

    .line 137
    .local v0, "e":Lorg/python/core/PyException;
    new-instance v2, Lfreemarker/template/TemplateModelException;

    invoke-direct {v2, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v2

    .line 139
    .end local v0    # "e":Lorg/python/core/PyException;
    .restart local v1    # "method":Lorg/python/core/PyObject;
    :cond_28
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "\'?keys\' is not supported as there is no \'keys\' nor \'keySet\' attribute on an instance of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    sget-object v4, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->INSTANCE:Lfreemarker/ext/jython/JythonVersionAdapter;

    iget-object v5, p0, Lfreemarker/ext/jython/JythonHashModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v4, v5}, Lfreemarker/ext/jython/JythonVersionAdapter;->getPythonClassName(Lorg/python/core/PyObject;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public size()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 109
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/jython/JythonHashModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v1}, Lorg/python/core/PyObject;->__len__()I
    :try_end_5
    .catch Lorg/python/core/PyException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    return v1

    .line 111
    :catch_7
    move-exception v0

    .line 113
    .local v0, "e":Lorg/python/core/PyException;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 151
    :try_start_0
    iget-object v2, p0, Lfreemarker/ext/jython/JythonHashModel;->object:Lorg/python/core/PyObject;

    const-string v3, "values"

    invoke-virtual {v2, v3}, Lorg/python/core/PyObject;->__findattr__(Ljava/lang/String;)Lorg/python/core/PyObject;

    move-result-object v1

    .line 152
    .local v1, "method":Lorg/python/core/PyObject;
    if-eqz v1, :cond_1e

    .line 154
    iget-object v2, p0, Lfreemarker/ext/jython/JythonHashModel;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    invoke-virtual {v1}, Lorg/python/core/PyObject;->__call__()Lorg/python/core/PyObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lfreemarker/ext/jython/JythonWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    check-cast v2, Lfreemarker/template/TemplateCollectionModel;
    :try_end_16
    .catch Lorg/python/core/PyException; {:try_start_0 .. :try_end_16} :catch_17

    return-object v2

    .line 157
    .end local v1    # "method":Lorg/python/core/PyObject;
    :catch_17
    move-exception v0

    .line 159
    .local v0, "e":Lorg/python/core/PyException;
    new-instance v2, Lfreemarker/template/TemplateModelException;

    invoke-direct {v2, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v2

    .line 161
    .end local v0    # "e":Lorg/python/core/PyException;
    .restart local v1    # "method":Lorg/python/core/PyObject;
    :cond_1e
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "\'?values\' is not supported as there is no \'values\' attribute on an instance of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    sget-object v4, Lfreemarker/ext/jython/JythonVersionAdapterHolder;->INSTANCE:Lfreemarker/ext/jython/JythonVersionAdapter;

    iget-object v5, p0, Lfreemarker/ext/jython/JythonHashModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v4, v5}, Lfreemarker/ext/jython/JythonVersionAdapter;->getPythonClassName(Lorg/python/core/PyObject;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
