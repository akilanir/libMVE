.class Lfreemarker/ext/beans/CollectionAdapter;
.super Ljava/util/AbstractCollection;
.source "CollectionAdapter.java"

# interfaces
.implements Lfreemarker/template/TemplateModelAdapter;


# instance fields
.field private final model:Lfreemarker/template/TemplateCollectionModel;

.field private final wrapper:Lfreemarker/ext/beans/BeansWrapper;


# direct methods
.method constructor <init>(Lfreemarker/template/TemplateCollectionModel;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 3
    .param p1, "model"    # Lfreemarker/template/TemplateCollectionModel;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    .line 21
    iput-object p1, p0, Lfreemarker/ext/beans/CollectionAdapter;->model:Lfreemarker/template/TemplateCollectionModel;

    .line 22
    iput-object p2, p0, Lfreemarker/ext/beans/CollectionAdapter;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    .line 23
    return-void
.end method

.method static access$000(Lfreemarker/ext/beans/CollectionAdapter;)Lfreemarker/template/TemplateCollectionModel;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/beans/CollectionAdapter;

    .prologue
    .line 16
    iget-object v0, p0, Lfreemarker/ext/beans/CollectionAdapter;->model:Lfreemarker/template/TemplateCollectionModel;

    return-object v0
.end method

.method static access$100(Lfreemarker/ext/beans/CollectionAdapter;)Lfreemarker/ext/beans/BeansWrapper;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/beans/CollectionAdapter;

    .prologue
    .line 16
    iget-object v0, p0, Lfreemarker/ext/beans/CollectionAdapter;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    return-object v0
.end method


# virtual methods
.method public getTemplateModel()Lfreemarker/template/TemplateModel;
    .registers 2

    .prologue
    .line 26
    iget-object v0, p0, Lfreemarker/ext/beans/CollectionAdapter;->model:Lfreemarker/template/TemplateCollectionModel;

    return-object v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 3

    .prologue
    .line 35
    :try_start_0
    new-instance v1, Lfreemarker/ext/beans/CollectionAdapter$1;

    invoke-direct {v1, p0}, Lfreemarker/ext/beans/CollectionAdapter$1;-><init>(Lfreemarker/ext/beans/CollectionAdapter;)V
    :try_end_5
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_5} :catch_6

    return-object v1

    .line 61
    :catch_6
    move-exception v0

    .line 62
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public size()I
    .registers 2

    .prologue
    .line 30
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
