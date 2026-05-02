.class Lfreemarker/ext/beans/HashAdapter$1;
.super Ljava/util/AbstractSet;
.source "HashAdapter.java"


# instance fields
.field private final this$0:Lfreemarker/ext/beans/HashAdapter;


# direct methods
.method constructor <init>(Lfreemarker/ext/beans/HashAdapter;)V
    .registers 2

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/beans/HashAdapter$1;->this$0:Lfreemarker/ext/beans/HashAdapter;

    return-void
.end method

.method static access$100(Lfreemarker/ext/beans/HashAdapter$1;)Lfreemarker/ext/beans/HashAdapter;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/beans/HashAdapter$1;

    .prologue
    .line 64
    iget-object v0, p0, Lfreemarker/ext/beans/HashAdapter$1;->this$0:Lfreemarker/ext/beans/HashAdapter;

    return-object v0
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 4

    .prologue
    .line 68
    :try_start_0
    iget-object v2, p0, Lfreemarker/ext/beans/HashAdapter$1;->this$0:Lfreemarker/ext/beans/HashAdapter;

    invoke-static {v2}, Lfreemarker/ext/beans/HashAdapter;->access$000(Lfreemarker/ext/beans/HashAdapter;)Lfreemarker/template/TemplateHashModelEx;

    move-result-object v2

    invoke-interface {v2}, Lfreemarker/template/TemplateHashModelEx;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v2

    invoke-interface {v2}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;
    :try_end_d
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_d} :catch_14

    move-result-object v1

    .line 73
    .local v1, "i":Lfreemarker/template/TemplateModelIterator;
    new-instance v2, Lfreemarker/ext/beans/HashAdapter$1$1;

    invoke-direct {v2, p0, v1}, Lfreemarker/ext/beans/HashAdapter$1$1;-><init>(Lfreemarker/ext/beans/HashAdapter$1;Lfreemarker/template/TemplateModelIterator;)V

    return-object v2

    .line 70
    .end local v1    # "i":Lfreemarker/template/TemplateModelIterator;
    :catch_14
    move-exception v0

    .line 71
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v2, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v2, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public size()I
    .registers 3

    .prologue
    .line 135
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/beans/HashAdapter$1;->this$0:Lfreemarker/ext/beans/HashAdapter;

    invoke-static {v1}, Lfreemarker/ext/beans/HashAdapter;->access$000(Lfreemarker/ext/beans/HashAdapter;)Lfreemarker/template/TemplateHashModelEx;

    move-result-object v1

    invoke-interface {v1}, Lfreemarker/template/TemplateHashModelEx;->size()I
    :try_end_9
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_9} :catch_b

    move-result v1

    return v1

    .line 137
    :catch_b
    move-exception v0

    .line 138
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
