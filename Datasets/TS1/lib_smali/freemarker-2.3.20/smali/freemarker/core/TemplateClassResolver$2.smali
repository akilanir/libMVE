.class final Lfreemarker/core/TemplateClassResolver$2;
.super Ljava/lang/Object;
.source "TemplateClassResolver.java"

# interfaces
.implements Lfreemarker/core/TemplateClassResolver;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public resolve(Ljava/lang/String;Lfreemarker/core/Environment;Lfreemarker/template/Template;)Ljava/lang/Class;
    .registers 6
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "template"    # Lfreemarker/template/Template;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 99
    sget-object v1, Lfreemarker/core/TemplateClassResolver$4;->class$freemarker$template$utility$ObjectConstructor:Ljava/lang/Class;

    if-nez v1, :cond_39

    const-string v1, "freemarker.template.utility.ObjectConstructor"

    invoke-static {v1}, Lfreemarker/core/TemplateClassResolver$4;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/core/TemplateClassResolver$4;->class$freemarker$template$utility$ObjectConstructor:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34

    sget-object v1, Lfreemarker/core/TemplateClassResolver$4;->class$freemarker$template$utility$Execute:Ljava/lang/Class;

    if-nez v1, :cond_3c

    const-string v1, "freemarker.template.utility.Execute"

    invoke-static {v1}, Lfreemarker/core/TemplateClassResolver$4;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/core/TemplateClassResolver$4;->class$freemarker$template$utility$Execute:Ljava/lang/Class;

    :goto_22
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34

    const-string v1, "freemarker.template.utility.JythonRuntime"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 102
    :cond_34
    invoke-static {p1, p2}, Lfreemarker/core/MessageUtil;->newInstantiatingClassNotAllowedException(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateException;

    move-result-object v1

    throw v1

    .line 99
    :cond_39
    sget-object v1, Lfreemarker/core/TemplateClassResolver$4;->class$freemarker$template$utility$ObjectConstructor:Ljava/lang/Class;

    goto :goto_c

    :cond_3c
    sget-object v1, Lfreemarker/core/TemplateClassResolver$4;->class$freemarker$template$utility$Execute:Ljava/lang/Class;

    goto :goto_22

    .line 105
    :cond_3f
    :try_start_3f
    invoke-static {p1}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_42
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3f .. :try_end_42} :catch_44

    move-result-object v1

    return-object v1

    .line 106
    :catch_44
    move-exception v0

    .line 107
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Lfreemarker/core/_MiscTemplateException;

    invoke-direct {v1, v0, p2}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;)V

    throw v1
.end method
