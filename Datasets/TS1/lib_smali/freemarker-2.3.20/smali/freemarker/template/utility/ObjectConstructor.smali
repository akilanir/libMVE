.class public Lfreemarker/template/utility/ObjectConstructor;
.super Ljava/lang/Object;
.source "ObjectConstructor.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 9
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 78
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_e

    .line 79
    new-instance v5, Lfreemarker/template/TemplateModelException;

    const-string v6, "This method must have at least one argument, the name of the class to instantiate."

    invoke-direct {v5, v6}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 81
    :cond_e
    const/4 v5, 0x0

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 82
    .local v2, "classname":Ljava/lang/String;
    const/4 v1, 0x0

    .line 84
    .local v1, "cl":Ljava/lang/Class;
    :try_start_18
    invoke-static {v2}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_1b} :catch_32

    move-result-object v1

    .line 89
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->getDefaultInstance()Lfreemarker/ext/beans/BeansWrapper;

    move-result-object v0

    .line 90
    .local v0, "bw":Lfreemarker/ext/beans/BeansWrapper;
    const/4 v5, 0x1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    invoke-interface {p1, v5, v6}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v0, v1, v5}, Lfreemarker/ext/beans/BeansWrapper;->newInstance(Ljava/lang/Class;Ljava/util/List;)Ljava/lang/Object;

    move-result-object v4

    .line 91
    .local v4, "obj":Ljava/lang/Object;
    invoke-virtual {v0, v4}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v5

    return-object v5

    .line 86
    .end local v0    # "bw":Lfreemarker/ext/beans/BeansWrapper;
    .end local v4    # "obj":Ljava/lang/Object;
    :catch_32
    move-exception v3

    .line 87
    .local v3, "e":Ljava/lang/Exception;
    new-instance v5, Lfreemarker/template/TemplateModelException;

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v5
.end method
