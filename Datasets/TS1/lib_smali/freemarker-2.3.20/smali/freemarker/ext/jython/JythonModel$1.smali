.class final Lfreemarker/ext/jython/JythonModel$1;
.super Ljava/lang/Object;
.source "JythonModel.java"

# interfaces
.implements Lfreemarker/ext/util/ModelFactory;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/Object;Lfreemarker/template/ObjectWrapper;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 89
    new-instance v0, Lfreemarker/ext/jython/JythonModel;

    check-cast p1, Lorg/python/core/PyObject;

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p2, Lfreemarker/ext/jython/JythonWrapper;

    .end local p2    # "wrapper":Lfreemarker/template/ObjectWrapper;
    invoke-direct {v0, p1, p2}, Lfreemarker/ext/jython/JythonModel;-><init>(Lorg/python/core/PyObject;Lfreemarker/ext/jython/JythonWrapper;)V

    return-object v0
.end method
