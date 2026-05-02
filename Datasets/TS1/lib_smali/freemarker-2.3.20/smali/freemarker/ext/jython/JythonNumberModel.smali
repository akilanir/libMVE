.class public Lfreemarker/ext/jython/JythonNumberModel;
.super Lfreemarker/ext/jython/JythonModel;
.source "JythonNumberModel.java"

# interfaces
.implements Lfreemarker/template/TemplateNumberModel;


# static fields
.field static final FACTORY:Lfreemarker/ext/util/ModelFactory;

.field static class$java$lang$Number:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 76
    new-instance v0, Lfreemarker/ext/jython/JythonNumberModel$1;

    invoke-direct {v0}, Lfreemarker/ext/jython/JythonNumberModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/jython/JythonNumberModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void
.end method

.method public constructor <init>(Lorg/python/core/PyObject;Lfreemarker/ext/jython/JythonWrapper;)V
    .registers 3
    .param p1, "object"    # Lorg/python/core/PyObject;
    .param p2, "wrapper"    # Lfreemarker/ext/jython/JythonWrapper;

    .prologue
    .line 87
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/jython/JythonModel;-><init>(Lorg/python/core/PyObject;Lfreemarker/ext/jython/JythonWrapper;)V

    .line 88
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 99
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
.method public getAsNumber()Ljava/lang/Number;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 99
    :try_start_0
    iget-object v3, p0, Lfreemarker/ext/jython/JythonNumberModel;->object:Lorg/python/core/PyObject;

    sget-object v2, Lfreemarker/ext/jython/JythonNumberModel;->class$java$lang$Number:Ljava/lang/Class;

    if-nez v2, :cond_28

    const-string v2, "java.lang.Number"

    invoke-static {v2}, Lfreemarker/ext/jython/JythonNumberModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/jython/JythonNumberModel;->class$java$lang$Number:Ljava/lang/Class;

    :goto_e
    invoke-virtual {v3, v2}, Lorg/python/core/PyObject;->__tojava__(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .line 100
    .local v1, "value":Ljava/lang/Object;
    if-eqz v1, :cond_18

    sget-object v2, Lorg/python/core/Py;->NoConversion:Ljava/lang/Object;

    if-ne v1, v2, :cond_2b

    .line 102
    :cond_18
    new-instance v1, Ljava/lang/Double;

    .end local v1    # "value":Ljava/lang/Object;
    iget-object v2, p0, Lfreemarker/ext/jython/JythonNumberModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v2}, Lorg/python/core/PyObject;->__float__()Lorg/python/core/PyFloat;

    move-result-object v2

    invoke-virtual {v2}, Lorg/python/core/PyFloat;->getValue()D

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/lang/Double;-><init>(D)V

    .line 104
    :goto_27
    return-object v1

    .line 99
    :cond_28
    sget-object v2, Lfreemarker/ext/jython/JythonNumberModel;->class$java$lang$Number:Ljava/lang/Class;

    goto :goto_e

    .line 104
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_2b
    check-cast v1, Ljava/lang/Number;
    :try_end_2d
    .catch Lorg/python/core/PyException; {:try_start_0 .. :try_end_2d} :catch_2e

    goto :goto_27

    .line 106
    .end local v1    # "value":Ljava/lang/Object;
    :catch_2e
    move-exception v0

    .line 108
    .local v0, "e":Lorg/python/core/PyException;
    new-instance v2, Lfreemarker/template/TemplateModelException;

    invoke-direct {v2, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v2
.end method
