.class public Lfreemarker/template/TemplateModelException;
.super Lfreemarker/template/TemplateException;
.source "TemplateModelException.java"


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 68
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/lang/Exception;)V
    .registers 3
    .param p1, "cause"    # Ljava/lang/Exception;

    .prologue
    .line 86
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0, p1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 87
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 78
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 4
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Exception;

    .prologue
    .line 106
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Ljava/lang/Exception;Lfreemarker/core/Environment;)V

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 119
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lfreemarker/core/Environment;)V

    .line 120
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 97
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0, p1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 98
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V
    .registers 6
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "descriptionBuilder"    # Lfreemarker/core/_ErrorDescriptionBuilder;
    .param p4, "preventAmbiguity"    # Z

    .prologue
    .line 140
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 141
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "preventAmbiguity"    # Z

    .prologue
    .line 129
    invoke-direct {p0, p3, p1, p2}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lfreemarker/core/Environment;)V

    .line 130
    return-void
.end method
