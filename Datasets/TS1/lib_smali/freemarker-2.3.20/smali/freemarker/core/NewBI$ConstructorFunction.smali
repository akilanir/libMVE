.class Lfreemarker/core/NewBI$ConstructorFunction;
.super Ljava/lang/Object;
.source "NewBI.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/NewBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ConstructorFunction"
.end annotation


# instance fields
.field private final cl:Ljava/lang/Class;

.field private final env:Lfreemarker/core/Environment;

.field private final this$0:Lfreemarker/core/NewBI;


# direct methods
.method public constructor <init>(Lfreemarker/core/NewBI;Ljava/lang/String;Lfreemarker/core/Environment;Lfreemarker/template/Template;)V
    .registers 11
    .param p2, "classname"    # Ljava/lang/String;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .param p4, "template"    # Lfreemarker/template/Template;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/NewBI$ConstructorFunction;->this$0:Lfreemarker/core/NewBI;

    .line 94
    iput-object p3, p0, Lfreemarker/core/NewBI$ConstructorFunction;->env:Lfreemarker/core/Environment;

    .line 95
    invoke-virtual {p3}, Lfreemarker/core/Environment;->getNewBuiltinClassResolver()Lfreemarker/core/TemplateClassResolver;

    move-result-object v0

    invoke-interface {v0, p2, p3, p4}, Lfreemarker/core/TemplateClassResolver;->resolve(Ljava/lang/String;Lfreemarker/core/Environment;Lfreemarker/template/Template;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/NewBI$ConstructorFunction;->cl:Ljava/lang/Class;

    .line 96
    sget-object v0, Lfreemarker/core/NewBI;->class$freemarker$template$TemplateModel:Ljava/lang/Class;

    if-nez v0, :cond_41

    const-string v0, "freemarker.template.TemplateModel"

    invoke-static {v0}, Lfreemarker/core/NewBI;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/core/NewBI;->class$freemarker$template$TemplateModel:Ljava/lang/Class;

    :goto_21
    iget-object v1, p0, Lfreemarker/core/NewBI$ConstructorFunction;->cl:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_44

    .line 97
    new-instance v0, Lfreemarker/core/_MiscTemplateException;

    new-array v1, v2, [Ljava/lang/Object;

    const-string v2, "Class "

    aput-object v2, v1, v3

    iget-object v2, p0, Lfreemarker/core/NewBI$ConstructorFunction;->cl:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    const-string v2, " does not implement freemarker.template.TemplateModel"

    aput-object v2, v1, v5

    invoke-direct {v0, p1, p3, v1}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v0

    .line 96
    :cond_41
    sget-object v0, Lfreemarker/core/NewBI;->class$freemarker$template$TemplateModel:Ljava/lang/Class;

    goto :goto_21

    .line 100
    :cond_44
    sget-object v0, Lfreemarker/core/NewBI;->BEAN_MODEL_CLASS:Ljava/lang/Class;

    iget-object v1, p0, Lfreemarker/core/NewBI$ConstructorFunction;->cl:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_62

    .line 101
    new-instance v0, Lfreemarker/core/_MiscTemplateException;

    new-array v1, v2, [Ljava/lang/Object;

    const-string v2, "Bean Models cannot be instantiated using the ?"

    aput-object v2, v1, v3

    iget-object v2, p1, Lfreemarker/core/NewBI;->key:Ljava/lang/String;

    aput-object v2, v1, v4

    const-string v2, " built-in"

    aput-object v2, v1, v5

    invoke-direct {v0, p1, p3, v1}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v0

    .line 104
    :cond_62
    sget-object v0, Lfreemarker/core/NewBI;->JYTHON_MODEL_CLASS:Ljava/lang/Class;

    if-eqz v0, :cond_84

    sget-object v0, Lfreemarker/core/NewBI;->JYTHON_MODEL_CLASS:Ljava/lang/Class;

    iget-object v1, p0, Lfreemarker/core/NewBI$ConstructorFunction;->cl:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_84

    .line 105
    new-instance v0, Lfreemarker/core/_MiscTemplateException;

    new-array v1, v2, [Ljava/lang/Object;

    const-string v2, "Jython Models cannot be instantiated using the ?"

    aput-object v2, v1, v3

    iget-object v2, p1, Lfreemarker/core/NewBI;->key:Ljava/lang/String;

    aput-object v2, v1, v4

    const-string v2, " built-in"

    aput-object v2, v1, v5

    invoke-direct {v0, p1, p3, v1}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v0

    .line 108
    :cond_84
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 5
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v2, p0, Lfreemarker/core/NewBI$ConstructorFunction;->env:Lfreemarker/core/Environment;

    invoke-virtual {v2}, Lfreemarker/core/Environment;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v1

    .line 112
    .local v1, "ow":Lfreemarker/template/ObjectWrapper;
    instance-of v2, v1, Lfreemarker/ext/beans/BeansWrapper;

    if-eqz v2, :cond_14

    check-cast v1, Lfreemarker/ext/beans/BeansWrapper;

    .end local v1    # "ow":Lfreemarker/template/ObjectWrapper;
    move-object v0, v1

    .line 116
    .local v0, "bw":Lfreemarker/ext/beans/BeansWrapper;
    :goto_d
    iget-object v2, p0, Lfreemarker/core/NewBI$ConstructorFunction;->cl:Ljava/lang/Class;

    invoke-virtual {v0, v2, p1}, Lfreemarker/ext/beans/BeansWrapper;->newInstance(Ljava/lang/Class;Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 112
    .end local v0    # "bw":Lfreemarker/ext/beans/BeansWrapper;
    .restart local v1    # "ow":Lfreemarker/template/ObjectWrapper;
    :cond_14
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->getDefaultInstance()Lfreemarker/ext/beans/BeansWrapper;

    move-result-object v0

    goto :goto_d
.end method
