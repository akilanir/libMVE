.class Lfreemarker/ext/beans/SequenceAdapter;
.super Ljava/util/AbstractList;
.source "SequenceAdapter.java"

# interfaces
.implements Lfreemarker/template/TemplateModelAdapter;


# instance fields
.field private final model:Lfreemarker/template/TemplateSequenceModel;

.field private final wrapper:Lfreemarker/ext/beans/BeansWrapper;


# direct methods
.method constructor <init>(Lfreemarker/template/TemplateSequenceModel;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 3
    .param p1, "model"    # Lfreemarker/template/TemplateSequenceModel;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 19
    iput-object p1, p0, Lfreemarker/ext/beans/SequenceAdapter;->model:Lfreemarker/template/TemplateSequenceModel;

    .line 20
    iput-object p2, p0, Lfreemarker/ext/beans/SequenceAdapter;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    .line 21
    return-void
.end method


# virtual methods
.method public get(I)Ljava/lang/Object;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 38
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/beans/SequenceAdapter;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    iget-object v2, p0, Lfreemarker/ext/beans/SequenceAdapter;->model:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v2, p1}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v2

    invoke-virtual {v1, v2}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;
    :try_end_b
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v1

    return-object v1

    .line 40
    :catch_d
    move-exception v0

    .line 41
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getTemplateModel()Lfreemarker/template/TemplateModel;
    .registers 2

    .prologue
    .line 24
    iget-object v0, p0, Lfreemarker/ext/beans/SequenceAdapter;->model:Lfreemarker/template/TemplateSequenceModel;

    return-object v0
.end method

.method public size()I
    .registers 3

    .prologue
    .line 29
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/beans/SequenceAdapter;->model:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v1}, Lfreemarker/template/TemplateSequenceModel;->size()I
    :try_end_5
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    return v1

    .line 31
    :catch_7
    move-exception v0

    .line 32
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
