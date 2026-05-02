.class Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;
.super Lorg/python/core/PyObject;
.source "JythonWrapper.java"

# interfaces
.implements Lfreemarker/template/TemplateModelAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jython/JythonWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TemplateModelToJythonAdapter"
.end annotation


# instance fields
.field private final model:Lfreemarker/template/TemplateModel;

.field private final this$0:Lfreemarker/ext/jython/JythonWrapper;


# direct methods
.method constructor <init>(Lfreemarker/ext/jython/JythonWrapper;Lfreemarker/template/TemplateModel;)V
    .registers 3
    .param p2, "model"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 224
    invoke-direct {p0}, Lorg/python/core/PyObject;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->this$0:Lfreemarker/ext/jython/JythonWrapper;

    .line 225
    iput-object p2, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    .line 226
    return-void
.end method

.method private getModelClass()Ljava/lang/String;
    .registers 2

    .prologue
    .line 349
    iget-object v0, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    if-nez v0, :cond_7

    const-string v0, "null"

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method


# virtual methods
.method public __call__([Lorg/python/core/PyObject;[Ljava/lang/String;)Lorg/python/core/PyObject;
    .registers 9
    .param p1, "args"    # [Lorg/python/core/PyObject;
    .param p2, "keywords"    # [Ljava/lang/String;

    .prologue
    .line 276
    iget-object v4, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    instance-of v4, v4, Lfreemarker/template/TemplateMethodModel;

    if-eqz v4, :cond_48

    .line 278
    iget-object v4, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    instance-of v2, v4, Lfreemarker/template/TemplateMethodModelEx;

    .line 279
    .local v2, "isEx":Z
    new-instance v3, Ljava/util/ArrayList;

    array-length v4, p1

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 282
    .local v3, "list":Ljava/util/List;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_11
    :try_start_11
    array-length v4, p1

    if-ge v1, v4, :cond_31

    .line 284
    if-eqz v2, :cond_24

    iget-object v4, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->this$0:Lfreemarker/ext/jython/JythonWrapper;

    aget-object v5, p1, v1

    invoke-virtual {v4, v5}, Lfreemarker/ext/jython/JythonWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    :goto_1e
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 282
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 284
    :cond_24
    aget-object v4, p1, v1

    if-nez v4, :cond_2a

    const/4 v4, 0x0

    goto :goto_1e

    :cond_2a
    aget-object v4, p1, v1

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1e

    .line 292
    :cond_31
    iget-object v5, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->this$0:Lfreemarker/ext/jython/JythonWrapper;

    iget-object v4, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    check-cast v4, Lfreemarker/template/TemplateMethodModelEx;

    invoke-interface {v4, v3}, Lfreemarker/template/TemplateMethodModelEx;->exec(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lfreemarker/template/TemplateModel;

    invoke-virtual {v5, v4}, Lfreemarker/ext/jython/JythonWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Lorg/python/core/PyObject;
    :try_end_40
    .catch Lfreemarker/template/TemplateModelException; {:try_start_11 .. :try_end_40} :catch_42

    move-result-object v4

    return-object v4

    .line 294
    :catch_42
    move-exception v0

    .line 296
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    invoke-static {v0}, Lorg/python/core/Py;->JavaError(Ljava/lang/Throwable;)Lorg/python/core/PyException;

    move-result-object v4

    throw v4

    .line 299
    .end local v0    # "e":Lfreemarker/template/TemplateModelException;
    .end local v1    # "i":I
    .end local v2    # "isEx":Z
    .end local v3    # "list":Ljava/util/List;
    :cond_48
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "call of non-method model ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-direct {p0}, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->getModelClass()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/python/core/Py;->TypeError(Ljava/lang/String;)Lorg/python/core/PyException;

    move-result-object v4

    throw v4
.end method

.method public __finditem__(I)Lorg/python/core/PyObject;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 260
    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    instance-of v1, v1, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v1, :cond_1b

    .line 264
    :try_start_6
    iget-object v2, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->this$0:Lfreemarker/ext/jython/JythonWrapper;

    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    check-cast v1, Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v1, p1}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v1

    invoke-virtual {v2, v1}, Lfreemarker/ext/jython/JythonWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Lorg/python/core/PyObject;
    :try_end_13
    .catch Lfreemarker/template/TemplateModelException; {:try_start_6 .. :try_end_13} :catch_15

    move-result-object v1

    return-object v1

    .line 266
    :catch_15
    move-exception v0

    .line 268
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    invoke-static {v0}, Lorg/python/core/Py;->JavaError(Ljava/lang/Throwable;)Lorg/python/core/PyException;

    move-result-object v1

    throw v1

    .line 271
    .end local v0    # "e":Lfreemarker/template/TemplateModelException;
    :cond_1b
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "item lookup on non-sequence model ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-direct {p0}, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->getModelClass()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/python/core/Py;->TypeError(Ljava/lang/String;)Lorg/python/core/PyException;

    move-result-object v1

    throw v1
.end method

.method public __finditem__(Ljava/lang/String;)Lorg/python/core/PyObject;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 244
    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    instance-of v1, v1, Lfreemarker/template/TemplateHashModel;

    if-eqz v1, :cond_1b

    .line 248
    :try_start_6
    iget-object v2, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->this$0:Lfreemarker/ext/jython/JythonWrapper;

    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    check-cast v1, Lfreemarker/template/TemplateHashModel;

    invoke-interface {v1, p1}, Lfreemarker/template/TemplateHashModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    invoke-virtual {v2, v1}, Lfreemarker/ext/jython/JythonWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Lorg/python/core/PyObject;
    :try_end_13
    .catch Lfreemarker/template/TemplateModelException; {:try_start_6 .. :try_end_13} :catch_15

    move-result-object v1

    return-object v1

    .line 250
    :catch_15
    move-exception v0

    .line 252
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    invoke-static {v0}, Lorg/python/core/Py;->JavaError(Ljava/lang/Throwable;)Lorg/python/core/PyException;

    move-result-object v1

    throw v1

    .line 255
    .end local v0    # "e":Lfreemarker/template/TemplateModelException;
    :cond_1b
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "item lookup on non-hash model ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-direct {p0}, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->getModelClass()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/python/core/Py;->TypeError(Ljava/lang/String;)Lorg/python/core/PyException;

    move-result-object v1

    throw v1
.end method

.method public __finditem__(Lorg/python/core/PyObject;)Lorg/python/core/PyObject;
    .registers 3
    .param p1, "key"    # Lorg/python/core/PyObject;

    .prologue
    .line 235
    instance-of v0, p1, Lorg/python/core/PyInteger;

    if-eqz v0, :cond_f

    .line 237
    check-cast p1, Lorg/python/core/PyInteger;

    .end local p1    # "key":Lorg/python/core/PyObject;
    invoke-virtual {p1}, Lorg/python/core/PyInteger;->getValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->__finditem__(I)Lorg/python/core/PyObject;

    move-result-object v0

    .line 239
    :goto_e
    return-object v0

    .restart local p1    # "key":Lorg/python/core/PyObject;
    :cond_f
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->__finditem__(Ljava/lang/String;)Lorg/python/core/PyObject;

    move-result-object v0

    goto :goto_e
.end method

.method public __len__()I
    .registers 3

    .prologue
    .line 306
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    instance-of v1, v1, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v1, :cond_f

    .line 308
    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    check-cast v1, Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v1}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v1

    .line 320
    :goto_e
    return v1

    .line 310
    :cond_f
    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    instance-of v1, v1, Lfreemarker/template/TemplateHashModelEx;

    if-eqz v1, :cond_24

    .line 312
    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    check-cast v1, Lfreemarker/template/TemplateHashModelEx;

    invoke-interface {v1}, Lfreemarker/template/TemplateHashModelEx;->size()I
    :try_end_1c
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_1c} :catch_1e

    move-result v1

    goto :goto_e

    .line 315
    :catch_1e
    move-exception v0

    .line 317
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    invoke-static {v0}, Lorg/python/core/Py;->JavaError(Ljava/lang/Throwable;)Lorg/python/core/PyException;

    move-result-object v1

    throw v1

    .line 320
    .end local v0    # "e":Lfreemarker/template/TemplateModelException;
    :cond_24
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public __nonzero__()Z
    .registers 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 327
    :try_start_2
    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    instance-of v1, v1, Lfreemarker/template/TemplateBooleanModel;

    if-eqz v1, :cond_11

    .line 329
    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    check-cast v1, Lfreemarker/template/TemplateBooleanModel;

    invoke-interface {v1}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v1

    .line 344
    :goto_10
    return v1

    .line 331
    :cond_11
    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    instance-of v1, v1, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v1, :cond_25

    .line 333
    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    check-cast v1, Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v1}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v1

    if-lez v1, :cond_23

    move v1, v2

    goto :goto_10

    :cond_23
    move v1, v3

    goto :goto_10

    .line 335
    :cond_25
    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    instance-of v1, v1, Lfreemarker/template/TemplateHashModel;

    if-eqz v1, :cond_3f

    .line 337
    iget-object v1, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    check-cast v1, Lfreemarker/template/TemplateHashModelEx;

    invoke-interface {v1}, Lfreemarker/template/TemplateHashModelEx;->isEmpty()Z
    :try_end_32
    .catch Lfreemarker/template/TemplateModelException; {:try_start_2 .. :try_end_32} :catch_39

    move-result v1

    if-nez v1, :cond_37

    :goto_35
    move v1, v2

    goto :goto_10

    :cond_37
    move v2, v3

    goto :goto_35

    .line 340
    :catch_39
    move-exception v0

    .line 342
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    invoke-static {v0}, Lorg/python/core/Py;->JavaError(Ljava/lang/Throwable;)Lorg/python/core/PyException;

    move-result-object v1

    throw v1

    .end local v0    # "e":Lfreemarker/template/TemplateModelException;
    :cond_3f
    move v1, v3

    .line 344
    goto :goto_10
.end method

.method public getTemplateModel()Lfreemarker/template/TemplateModel;
    .registers 2

    .prologue
    .line 230
    iget-object v0, p0, Lfreemarker/ext/jython/JythonWrapper$TemplateModelToJythonAdapter;->model:Lfreemarker/template/TemplateModel;

    return-object v0
.end method
