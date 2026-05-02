.class Lfreemarker/core/NewBI;
.super Lfreemarker/core/BuiltIn;
.source "NewBI.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/NewBI$ConstructorFunction;
    }
.end annotation


# static fields
.field static final BEAN_MODEL_CLASS:Ljava/lang/Class;

.field static JYTHON_MODEL_CLASS:Ljava/lang/Class;

.field static class$freemarker$ext$beans$BeanModel:Ljava/lang/Class;

.field static class$freemarker$template$TemplateModel:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 72
    sget-object v1, Lfreemarker/core/NewBI;->class$freemarker$ext$beans$BeanModel:Ljava/lang/Class;

    if-nez v1, :cond_17

    const-string v1, "freemarker.ext.beans.BeanModel"

    invoke-static {v1}, Lfreemarker/core/NewBI;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/core/NewBI;->class$freemarker$ext$beans$BeanModel:Ljava/lang/Class;

    :goto_c
    sput-object v1, Lfreemarker/core/NewBI;->BEAN_MODEL_CLASS:Ljava/lang/Class;

    .line 76
    :try_start_e
    const-string v1, "freemarker.ext.jython.JythonModel"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/core/NewBI;->JYTHON_MODEL_CLASS:Ljava/lang/Class;
    :try_end_16
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_16} :catch_1a

    .line 80
    .local v0, "e":Ljava/lang/Throwable;
    :goto_16
    return-void

    .line 72
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_17
    sget-object v1, Lfreemarker/core/NewBI;->class$freemarker$ext$beans$BeanModel:Ljava/lang/Class;

    goto :goto_c

    .line 77
    :catch_1a
    move-exception v0

    .line 78
    .restart local v0    # "e":Ljava/lang/Throwable;
    const/4 v1, 0x0

    sput-object v1, Lfreemarker/core/NewBI;->JYTHON_MODEL_CLASS:Ljava/lang/Class;

    goto :goto_16
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 69
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    .line 88
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 72
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 85
    new-instance v0, Lfreemarker/core/NewBI$ConstructorFunction;

    iget-object v1, p0, Lfreemarker/core/NewBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/NewBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v2}, Lfreemarker/core/Expression;->getTemplate()Lfreemarker/template/Template;

    move-result-object v2

    invoke-direct {v0, p0, v1, p1, v2}, Lfreemarker/core/NewBI$ConstructorFunction;-><init>(Lfreemarker/core/NewBI;Ljava/lang/String;Lfreemarker/core/Environment;Lfreemarker/template/Template;)V

    return-object v0
.end method
