.class public Lfreemarker/ext/beans/EnumerationModel;
.super Lfreemarker/ext/beans/BeanModel;
.source "EnumerationModel.java"

# interfaces
.implements Lfreemarker/template/TemplateModelIterator;
.implements Lfreemarker/template/TemplateCollectionModel;


# instance fields
.field private accessed:Z


# direct methods
.method public constructor <init>(Ljava/util/Enumeration;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 4
    .param p1, "enumeration"    # Ljava/util/Enumeration;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 93
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/beans/BeanModel;-><init>(Ljava/lang/Object;Lfreemarker/ext/beans/BeansWrapper;)V

    .line 81
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfreemarker/ext/beans/EnumerationModel;->accessed:Z

    .line 94
    return-void
.end method


# virtual methods
.method public getAsBoolean()Z
    .registers 2

    .prologue
    .line 143
    invoke-virtual {p0}, Lfreemarker/ext/beans/EnumerationModel;->hasNext()Z

    move-result v0

    return v0
.end method

.method public hasNext()Z
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lfreemarker/ext/beans/EnumerationModel;->object:Ljava/lang/Object;

    check-cast v0, Ljava/util/Enumeration;

    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    return v0
.end method

.method public iterator()Lfreemarker/template/TemplateModelIterator;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 102
    monitor-enter p0

    .line 103
    :try_start_1
    iget-boolean v0, p0, Lfreemarker/ext/beans/EnumerationModel;->accessed:Z

    if-eqz v0, :cond_10

    .line 104
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "This collection is stateful and can not be iterated over the second time."

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 109
    :catchall_d
    move-exception v0

    monitor-exit p0
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_d

    throw v0

    .line 108
    :cond_10
    const/4 v0, 0x1

    :try_start_11
    iput-boolean v0, p0, Lfreemarker/ext/beans/EnumerationModel;->accessed:Z

    .line 109
    monitor-exit p0
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_d

    .line 110
    return-object p0
.end method

.method public next()Lfreemarker/template/TemplateModel;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 129
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/beans/EnumerationModel;->object:Ljava/lang/Object;

    check-cast v1, Ljava/util/Enumeration;

    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lfreemarker/ext/beans/EnumerationModel;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    :try_end_b
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v1

    return-object v1

    .line 131
    :catch_d
    move-exception v0

    .line 132
    .local v0, "e":Ljava/util/NoSuchElementException;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    const-string v2, "No more elements in the enumeration."

    invoke-direct {v1, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
