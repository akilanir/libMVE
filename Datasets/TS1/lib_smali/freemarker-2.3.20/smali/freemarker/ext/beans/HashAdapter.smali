.class public Lfreemarker/ext/beans/HashAdapter;
.super Ljava/util/AbstractMap;
.source "HashAdapter.java"

# interfaces
.implements Lfreemarker/template/TemplateModelAdapter;


# instance fields
.field private entrySet:Ljava/util/Set;

.field private final model:Lfreemarker/template/TemplateHashModel;

.field private final wrapper:Lfreemarker/ext/beans/BeansWrapper;


# direct methods
.method constructor <init>(Lfreemarker/template/TemplateHashModel;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 3
    .param p1, "model"    # Lfreemarker/template/TemplateHashModel;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 26
    iput-object p1, p0, Lfreemarker/ext/beans/HashAdapter;->model:Lfreemarker/template/TemplateHashModel;

    .line 27
    iput-object p2, p0, Lfreemarker/ext/beans/HashAdapter;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    .line 28
    return-void
.end method

.method static access$000(Lfreemarker/ext/beans/HashAdapter;)Lfreemarker/template/TemplateHashModelEx;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/beans/HashAdapter;

    .prologue
    .line 20
    invoke-direct {p0}, Lfreemarker/ext/beans/HashAdapter;->getModelEx()Lfreemarker/template/TemplateHashModelEx;

    move-result-object v0

    return-object v0
.end method

.method static access$200(Lfreemarker/ext/beans/HashAdapter;)Lfreemarker/ext/beans/BeansWrapper;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/beans/HashAdapter;

    .prologue
    .line 20
    iget-object v0, p0, Lfreemarker/ext/beans/HashAdapter;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    return-object v0
.end method

.method private getModelEx()Lfreemarker/template/TemplateHashModelEx;
    .registers 4

    .prologue
    .line 145
    iget-object v0, p0, Lfreemarker/ext/beans/HashAdapter;->model:Lfreemarker/template/TemplateHashModel;

    instance-of v0, v0, Lfreemarker/template/TemplateHashModelEx;

    if-eqz v0, :cond_b

    .line 146
    iget-object v0, p0, Lfreemarker/ext/beans/HashAdapter;->model:Lfreemarker/template/TemplateHashModel;

    check-cast v0, Lfreemarker/template/TemplateHashModelEx;

    return-object v0

    .line 148
    :cond_b
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Operation supported only on TemplateHashModelEx. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/ext/beans/HashAdapter;->model:Lfreemarker/template/TemplateHashModel;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " does not implement it though."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lfreemarker/ext/beans/HashAdapter;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 55
    const/4 v0, 0x1

    .line 57
    :goto_7
    return v0

    :cond_8
    invoke-super {p0, p1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_7
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lfreemarker/ext/beans/HashAdapter;->entrySet:Ljava/util/Set;

    if-eqz v0, :cond_7

    .line 62
    iget-object v0, p0, Lfreemarker/ext/beans/HashAdapter;->entrySet:Ljava/util/Set;

    .line 64
    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Lfreemarker/ext/beans/HashAdapter$1;

    invoke-direct {v0, p0}, Lfreemarker/ext/beans/HashAdapter$1;-><init>(Lfreemarker/ext/beans/HashAdapter;)V

    iput-object v0, p0, Lfreemarker/ext/beans/HashAdapter;->entrySet:Ljava/util/Set;

    goto :goto_6
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 45
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/beans/HashAdapter;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    iget-object v2, p0, Lfreemarker/ext/beans/HashAdapter;->model:Lfreemarker/template/TemplateHashModel;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lfreemarker/template/TemplateHashModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    invoke-virtual {v1, v2}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;
    :try_end_f
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_f} :catch_11

    move-result-object v1

    return-object v1

    .line 47
    :catch_11
    move-exception v0

    .line 48
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getTemplateModel()Lfreemarker/template/TemplateModel;
    .registers 2

    .prologue
    .line 31
    iget-object v0, p0, Lfreemarker/ext/beans/HashAdapter;->model:Lfreemarker/template/TemplateHashModel;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 3

    .prologue
    .line 36
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/beans/HashAdapter;->model:Lfreemarker/template/TemplateHashModel;

    invoke-interface {v1}, Lfreemarker/template/TemplateHashModel;->isEmpty()Z
    :try_end_5
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    return v1

    .line 38
    :catch_7
    move-exception v0

    .line 39
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
