.class Lfreemarker/ext/beans/HashAdapter$1$1;
.super Ljava/lang/Object;
.source "HashAdapter.java"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field private final this$1:Lfreemarker/ext/beans/HashAdapter$1;

.field private final val$i:Lfreemarker/template/TemplateModelIterator;


# direct methods
.method constructor <init>(Lfreemarker/ext/beans/HashAdapter$1;Lfreemarker/template/TemplateModelIterator;)V
    .registers 3

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/beans/HashAdapter$1$1;->this$1:Lfreemarker/ext/beans/HashAdapter$1;

    iput-object p2, p0, Lfreemarker/ext/beans/HashAdapter$1$1;->val$i:Lfreemarker/template/TemplateModelIterator;

    return-void
.end method

.method static access$300(Lfreemarker/ext/beans/HashAdapter$1$1;)Lfreemarker/ext/beans/HashAdapter$1;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/beans/HashAdapter$1$1;

    .prologue
    .line 73
    iget-object v0, p0, Lfreemarker/ext/beans/HashAdapter$1$1;->this$1:Lfreemarker/ext/beans/HashAdapter$1;

    return-object v0
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .prologue
    .line 76
    :try_start_0
    iget-object v1, p0, Lfreemarker/ext/beans/HashAdapter$1$1;->val$i:Lfreemarker/template/TemplateModelIterator;

    invoke-interface {v1}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z
    :try_end_5
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    return v1

    .line 78
    :catch_7
    move-exception v0

    .line 79
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public next()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 86
    :try_start_0
    iget-object v2, p0, Lfreemarker/ext/beans/HashAdapter$1$1;->this$1:Lfreemarker/ext/beans/HashAdapter$1;

    invoke-static {v2}, Lfreemarker/ext/beans/HashAdapter$1;->access$100(Lfreemarker/ext/beans/HashAdapter$1;)Lfreemarker/ext/beans/HashAdapter;

    move-result-object v2

    invoke-static {v2}, Lfreemarker/ext/beans/HashAdapter;->access$200(Lfreemarker/ext/beans/HashAdapter;)Lfreemarker/ext/beans/BeansWrapper;

    move-result-object v2

    iget-object v3, p0, Lfreemarker/ext/beans/HashAdapter$1$1;->val$i:Lfreemarker/template/TemplateModelIterator;

    invoke-interface {v3}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v3

    invoke-virtual {v2, v3}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;
    :try_end_13
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_13} :catch_1a

    move-result-object v1

    .line 91
    .local v1, "key":Ljava/lang/Object;
    new-instance v2, Lfreemarker/ext/beans/HashAdapter$1$1$1;

    invoke-direct {v2, p0, v1}, Lfreemarker/ext/beans/HashAdapter$1$1$1;-><init>(Lfreemarker/ext/beans/HashAdapter$1$1;Ljava/lang/Object;)V

    return-object v2

    .line 88
    .end local v1    # "key":Ljava/lang/Object;
    :catch_1a
    move-exception v0

    .line 89
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v2, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v2, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 128
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
