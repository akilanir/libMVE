.class public Lfreemarker/ext/jython/JythonSequenceModel;
.super Lfreemarker/ext/jython/JythonModel;
.source "JythonSequenceModel.java"

# interfaces
.implements Lfreemarker/template/TemplateSequenceModel;
.implements Lfreemarker/template/TemplateCollectionModel;


# static fields
.field static final FACTORY:Lfreemarker/ext/util/ModelFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 77
    new-instance v0, Lfreemarker/ext/jython/JythonSequenceModel$1;

    invoke-direct {v0}, Lfreemarker/ext/jython/JythonSequenceModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/jython/JythonSequenceModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void
.end method

.method public constructor <init>(Lorg/python/core/PyObject;Lfreemarker/ext/jython/JythonWrapper;)V
    .registers 3
    .param p1, "object"    # Lorg/python/core/PyObject;
    .param p2, "wrapper"    # Lfreemarker/ext/jython/JythonWrapper;

    .prologue
    .line 88
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/jython/JythonModel;-><init>(Lorg/python/core/PyObject;Lfreemarker/ext/jython/JythonWrapper;)V

    .line 89
    return-void
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 98
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/jython/JythonSequenceModel;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    iget-object v2, p0, Lfreemarker/ext/jython/JythonSequenceModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v2, p1}, Lorg/python/core/PyObject;->__finditem__(I)Lorg/python/core/PyObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lfreemarker/ext/jython/JythonWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    :try_end_b
    .catch Lorg/python/core/PyException; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v1

    return-object v1

    .line 100
    :catch_d
    move-exception v0

    .line 102
    .local v0, "e":Lorg/python/core/PyException;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method public iterator()Lfreemarker/template/TemplateModelIterator;
    .registers 2

    .prologue
    .line 123
    new-instance v0, Lfreemarker/ext/jython/JythonSequenceModel$2;

    invoke-direct {v0, p0}, Lfreemarker/ext/jython/JythonSequenceModel$2;-><init>(Lfreemarker/ext/jython/JythonSequenceModel;)V

    return-object v0
.end method

.method public size()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 113
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/jython/JythonSequenceModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v1}, Lorg/python/core/PyObject;->__len__()I
    :try_end_5
    .catch Lorg/python/core/PyException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    return v1

    .line 115
    :catch_7
    move-exception v0

    .line 117
    .local v0, "e":Lorg/python/core/PyException;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method
