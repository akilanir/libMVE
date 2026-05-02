.class Lfreemarker/ext/beans/CollectionAdapter$1;
.super Ljava/lang/Object;
.source "CollectionAdapter.java"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field final i:Lfreemarker/template/TemplateModelIterator;

.field private final this$0:Lfreemarker/ext/beans/CollectionAdapter;


# direct methods
.method constructor <init>(Lfreemarker/ext/beans/CollectionAdapter;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/beans/CollectionAdapter$1;->this$0:Lfreemarker/ext/beans/CollectionAdapter;

    .line 36
    iget-object v0, p0, Lfreemarker/ext/beans/CollectionAdapter$1;->this$0:Lfreemarker/ext/beans/CollectionAdapter;

    invoke-static {v0}, Lfreemarker/ext/beans/CollectionAdapter;->access$000(Lfreemarker/ext/beans/CollectionAdapter;)Lfreemarker/template/TemplateCollectionModel;

    move-result-object v0

    invoke-interface {v0}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/beans/CollectionAdapter$1;->i:Lfreemarker/template/TemplateModelIterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .prologue
    .line 40
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/beans/CollectionAdapter$1;->i:Lfreemarker/template/TemplateModelIterator;

    invoke-interface {v1}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z
    :try_end_5
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    return v1

    .line 42
    :catch_7
    move-exception v0

    .line 43
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public next()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 49
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/beans/CollectionAdapter$1;->this$0:Lfreemarker/ext/beans/CollectionAdapter;

    invoke-static {v1}, Lfreemarker/ext/beans/CollectionAdapter;->access$100(Lfreemarker/ext/beans/CollectionAdapter;)Lfreemarker/ext/beans/BeansWrapper;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/ext/beans/CollectionAdapter$1;->i:Lfreemarker/template/TemplateModelIterator;

    invoke-interface {v2}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v2

    invoke-virtual {v1, v2}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;
    :try_end_f
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_f} :catch_11

    move-result-object v1

    return-object v1

    .line 51
    :catch_11
    move-exception v0

    .line 52
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 57
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
