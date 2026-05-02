.class final Lfreemarker/core/TemplateClassResolver$1;
.super Ljava/lang/Object;
.source "TemplateClassResolver.java"

# interfaces
.implements Lfreemarker/core/TemplateClassResolver;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 78
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
    .line 83
    :try_start_0
    invoke-static {p1}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 84
    :catch_5
    move-exception v0

    .line 85
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Lfreemarker/core/_MiscTemplateException;

    invoke-direct {v1, v0, p2}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;)V

    throw v1
.end method
