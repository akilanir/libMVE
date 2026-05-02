.class public Lfreemarker/core/_MiscTemplateException;
.super Lfreemarker/template/TemplateException;
.source "_MiscTemplateException.java"


# direct methods
.method public constructor <init>(Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "description"    # Lfreemarker/core/_ErrorDescriptionBuilder;

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Environment;Ljava/lang/String;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-direct {p0, p2, p1}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 69
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/Throwable;

    invoke-direct {p0, v0, p1, p2}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;Ljava/lang/String;)V
    .registers 5
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "description"    # Ljava/lang/String;

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 104
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    .line 89
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Expression;Ljava/lang/String;)V
    .registers 4
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 99
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Expression;Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;)V
    .registers 7
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "cause"    # Ljava/lang/Throwable;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .param p4, "description"    # Ljava/lang/String;

    .prologue
    .line 107
    new-instance v0, Lfreemarker/core/_ErrorDescriptionBuilder;

    invoke-direct {v0, p4}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Lfreemarker/core/_ErrorDescriptionBuilder;->blame(Lfreemarker/core/Expression;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, p2, p3, v0, v1}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 108
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Expression;Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "cause"    # Ljava/lang/Throwable;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .param p4, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 92
    new-instance v0, Lfreemarker/core/_ErrorDescriptionBuilder;

    invoke-direct {v0, p4}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>([Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Lfreemarker/core/_ErrorDescriptionBuilder;->blame(Lfreemarker/core/Expression;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, p2, p3, v0, v1}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 93
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 84
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    .line 85
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/_ErrorDescriptionBuilder;)V
    .registers 3
    .param p1, "description"    # Lfreemarker/core/_ErrorDescriptionBuilder;

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 20
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 21
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    const/4 v1, 0x0

    .line 39
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, p1, v1, v0}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;)V
    .registers 4
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 35
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, p1, p2, v0}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V
    .registers 5
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "description"    # Lfreemarker/core/_ErrorDescriptionBuilder;

    .prologue
    .line 58
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;)V
    .registers 4
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "description"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0, p3, p1, p2}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lfreemarker/core/Environment;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 77
    new-instance v0, Lfreemarker/core/_ErrorDescriptionBuilder;

    invoke-direct {v0, p3}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>([Ljava/lang/Object;)V

    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v0, v1}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Ljava/lang/String;)V
    .registers 4
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 31
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 73
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    .line 74
    return-void
.end method

.method public constructor <init>([Ljava/lang/Object;)V
    .registers 3
    .param p1, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 65
    const/4 v0, 0x0

    check-cast v0, Lfreemarker/core/Environment;

    invoke-direct {p0, v0, p1}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    .line 66
    return-void
.end method
