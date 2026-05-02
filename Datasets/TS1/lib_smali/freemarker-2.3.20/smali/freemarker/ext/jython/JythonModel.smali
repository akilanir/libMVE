.class public Lfreemarker/ext/jython/JythonModel;
.super Ljava/lang/Object;
.source "JythonModel.java"

# interfaces
.implements Lfreemarker/template/TemplateBooleanModel;
.implements Lfreemarker/template/TemplateScalarModel;
.implements Lfreemarker/template/TemplateHashModel;
.implements Lfreemarker/template/TemplateMethodModelEx;
.implements Lfreemarker/template/AdapterTemplateModel;
.implements Lfreemarker/ext/util/WrapperTemplateModel;


# static fields
.field static final FACTORY:Lfreemarker/ext/util/ModelFactory;

.field static class$java$lang$Object:Ljava/lang/Class;


# instance fields
.field protected final object:Lorg/python/core/PyObject;

.field protected final wrapper:Lfreemarker/ext/jython/JythonWrapper;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 84
    new-instance v0, Lfreemarker/ext/jython/JythonModel$1;

    invoke-direct {v0}, Lfreemarker/ext/jython/JythonModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/jython/JythonModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void
.end method

.method public constructor <init>(Lorg/python/core/PyObject;Lfreemarker/ext/jython/JythonWrapper;)V
    .registers 3
    .param p1, "object"    # Lorg/python/core/PyObject;
    .param p2, "wrapper"    # Lfreemarker/ext/jython/JythonWrapper;

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput-object p1, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    .line 96
    iput-object p2, p0, Lfreemarker/ext/jython/JythonModel;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    .line 97
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 233
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
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 12
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 194
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    .line 197
    .local v5, "size":I
    packed-switch v5, :pswitch_data_62

    .line 210
    :try_start_7
    new-array v4, v5, [Lorg/python/core/PyObject;

    .line 211
    .local v4, "pyargs":[Lorg/python/core/PyObject;
    const/4 v2, 0x0

    .line 212
    .local v2, "i":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "arg":Ljava/util/Iterator;
    move v3, v2

    .end local v2    # "i":I
    .local v3, "i":I
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4e

    .line 214
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    iget-object v7, p0, Lfreemarker/ext/jython/JythonModel;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/template/TemplateModel;

    invoke-virtual {v7, v6}, Lfreemarker/ext/jython/JythonWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Lorg/python/core/PyObject;

    move-result-object v6

    aput-object v6, v4, v3

    move v3, v2

    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_f

    .line 201
    .end local v0    # "arg":Ljava/util/Iterator;
    .end local v3    # "i":I
    .end local v4    # "pyargs":[Lorg/python/core/PyObject;
    :pswitch_27
    iget-object v6, p0, Lfreemarker/ext/jython/JythonModel;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    iget-object v7, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v7}, Lorg/python/core/PyObject;->__call__()Lorg/python/core/PyObject;

    move-result-object v7

    invoke-virtual {v6, v7}, Lfreemarker/ext/jython/JythonWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v6

    .line 217
    :goto_33
    return-object v6

    .line 205
    :pswitch_34
    iget-object v7, p0, Lfreemarker/ext/jython/JythonModel;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    iget-object v8, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    iget-object v9, p0, Lfreemarker/ext/jython/JythonModel;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    const/4 v6, 0x0

    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/template/TemplateModel;

    invoke-virtual {v9, v6}, Lfreemarker/ext/jython/JythonWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Lorg/python/core/PyObject;

    move-result-object v6

    invoke-virtual {v8, v6}, Lorg/python/core/PyObject;->__call__(Lorg/python/core/PyObject;)Lorg/python/core/PyObject;

    move-result-object v6

    invoke-virtual {v7, v6}, Lfreemarker/ext/jython/JythonWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v6

    goto :goto_33

    .line 217
    .restart local v0    # "arg":Ljava/util/Iterator;
    .restart local v3    # "i":I
    .restart local v4    # "pyargs":[Lorg/python/core/PyObject;
    :cond_4e
    iget-object v6, p0, Lfreemarker/ext/jython/JythonModel;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    iget-object v7, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v7, v4}, Lorg/python/core/PyObject;->__call__([Lorg/python/core/PyObject;)Lorg/python/core/PyObject;

    move-result-object v7

    invoke-virtual {v6, v7}, Lfreemarker/ext/jython/JythonWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    :try_end_59
    .catch Lorg/python/core/PyException; {:try_start_7 .. :try_end_59} :catch_5b

    move-result-object v6

    goto :goto_33

    .line 221
    .end local v0    # "arg":Ljava/util/Iterator;
    .end local v3    # "i":I
    .end local v4    # "pyargs":[Lorg/python/core/PyObject;
    :catch_5b
    move-exception v1

    .line 223
    .local v1, "e":Lorg/python/core/PyException;
    new-instance v6, Lfreemarker/template/TemplateModelException;

    invoke-direct {v6, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v6

    .line 197
    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_27
        :pswitch_34
    .end packed-switch
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 140
    if-eqz p1, :cond_6

    .line 142
    invoke-virtual {p1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p1

    .line 145
    :cond_6
    const/4 v1, 0x0

    .line 149
    .local v1, "obj":Lorg/python/core/PyObject;
    :try_start_7
    iget-object v2, p0, Lfreemarker/ext/jython/JythonModel;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    invoke-virtual {v2}, Lfreemarker/ext/jython/JythonWrapper;->isAttributesShadowItems()Z

    move-result v2

    if-eqz v2, :cond_24

    .line 151
    iget-object v2, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v2, p1}, Lorg/python/core/PyObject;->__findattr__(Ljava/lang/String;)Lorg/python/core/PyObject;

    move-result-object v1

    .line 152
    if-nez v1, :cond_1d

    .line 154
    iget-object v2, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v2, p1}, Lorg/python/core/PyObject;->__finditem__(Ljava/lang/String;)Lorg/python/core/PyObject;
    :try_end_1c
    .catch Lorg/python/core/PyException; {:try_start_7 .. :try_end_1c} :catch_33

    move-result-object v1

    .line 171
    :cond_1d
    :goto_1d
    iget-object v2, p0, Lfreemarker/ext/jython/JythonModel;->wrapper:Lfreemarker/ext/jython/JythonWrapper;

    invoke-virtual {v2, v1}, Lfreemarker/ext/jython/JythonWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    return-object v2

    .line 159
    :cond_24
    :try_start_24
    iget-object v2, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v2, p1}, Lorg/python/core/PyObject;->__finditem__(Ljava/lang/String;)Lorg/python/core/PyObject;

    move-result-object v1

    .line 160
    if-nez v1, :cond_1d

    .line 162
    iget-object v2, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v2, p1}, Lorg/python/core/PyObject;->__findattr__(Ljava/lang/String;)Lorg/python/core/PyObject;
    :try_end_31
    .catch Lorg/python/core/PyException; {:try_start_24 .. :try_end_31} :catch_33

    move-result-object v1

    goto :goto_1d

    .line 166
    :catch_33
    move-exception v0

    .line 168
    .local v0, "e":Lorg/python/core/PyException;
    new-instance v2, Lfreemarker/template/TemplateModelException;

    invoke-direct {v2, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v2
.end method

.method public getAdaptedObject(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p1, "hint"    # Ljava/lang/Class;

    .prologue
    .line 228
    iget-object v1, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    if-nez v1, :cond_6

    .line 229
    const/4 v0, 0x0

    .line 235
    :cond_5
    :goto_5
    return-object v0

    .line 231
    :cond_6
    iget-object v1, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v1, p1}, Lorg/python/core/PyObject;->__tojava__(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 232
    .local v0, "view":Ljava/lang/Object;
    sget-object v1, Lorg/python/core/Py;->NoConversion:Ljava/lang/Object;

    if-ne v0, v1, :cond_5

    .line 233
    iget-object v2, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    sget-object v1, Lfreemarker/ext/jython/JythonModel;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v1, :cond_23

    const-string v1, "java.lang.Object"

    invoke-static {v1}, Lfreemarker/ext/jython/JythonModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/ext/jython/JythonModel;->class$java$lang$Object:Ljava/lang/Class;

    :goto_1e
    invoke-virtual {v2, v1}, Lorg/python/core/PyObject;->__tojava__(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_5

    :cond_23
    sget-object v1, Lfreemarker/ext/jython/JythonModel;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_1e
.end method

.method public getAsBoolean()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 106
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v1}, Lorg/python/core/PyObject;->__nonzero__()Z
    :try_end_5
    .catch Lorg/python/core/PyException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    return v1

    .line 108
    :catch_7
    move-exception v0

    .line 110
    .local v0, "e":Lorg/python/core/PyException;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method public getAsString()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 121
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_5
    .catch Lorg/python/core/PyException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 123
    :catch_7
    move-exception v0

    .line 125
    .local v0, "e":Lorg/python/core/PyException;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method public getWrappedObject()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 239
    iget-object v0, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v1, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    sget-object v0, Lfreemarker/ext/jython/JythonModel;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v0, :cond_19

    const-string v0, "java.lang.Object"

    invoke-static {v0}, Lfreemarker/ext/jython/JythonModel;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jython/JythonModel;->class$java$lang$Object:Ljava/lang/Class;

    :goto_14
    invoke-virtual {v1, v0}, Lorg/python/core/PyObject;->__tojava__(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_5

    :cond_19
    sget-object v0, Lfreemarker/ext/jython/JythonModel;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_14
.end method

.method public isEmpty()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 181
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/jython/JythonModel;->object:Lorg/python/core/PyObject;

    invoke-virtual {v1}, Lorg/python/core/PyObject;->__len__()I
    :try_end_5
    .catch Lorg/python/core/PyException; {:try_start_0 .. :try_end_5} :catch_c

    move-result v1

    if-nez v1, :cond_a

    const/4 v1, 0x1

    :goto_9
    return v1

    :cond_a
    const/4 v1, 0x0

    goto :goto_9

    .line 183
    :catch_c
    move-exception v0

    .line 185
    .local v0, "e":Lorg/python/core/PyException;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method
