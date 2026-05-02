.class public Lfreemarker/core/_TemplateModelException;
.super Lfreemarker/template/TemplateModelException;
.source "_TemplateModelException.java"


# direct methods
.method public constructor <init>(Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "description"    # Lfreemarker/core/_ErrorDescriptionBuilder;

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Environment;Ljava/lang/String;)V
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 27
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/Throwable;

    invoke-direct {p0, v0, p1, p2}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 65
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/Throwable;

    invoke-direct {p0, v0, p1, p2}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;Ljava/lang/String;)V
    .registers 5
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "description"    # Ljava/lang/String;

    .prologue
    .line 99
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lfreemarker/core/_TemplateModelException;-><init>(Lfreemarker/core/Expression;Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;[Ljava/lang/Object;)V
    .registers 5
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 84
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lfreemarker/core/_TemplateModelException;-><init>(Lfreemarker/core/Expression;Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    .line 85
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Expression;Ljava/lang/String;)V
    .registers 4
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 95
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lfreemarker/core/_TemplateModelException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 96
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Expression;Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;)V
    .registers 7
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "cause"    # Ljava/lang/Throwable;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .param p4, "description"    # Ljava/lang/String;

    .prologue
    .line 103
    new-instance v0, Lfreemarker/core/_ErrorDescriptionBuilder;

    invoke-direct {v0, p4}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Lfreemarker/core/_ErrorDescriptionBuilder;->blame(Lfreemarker/core/Expression;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, p2, p3, v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 104
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Expression;Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V
    .registers 7
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "cause"    # Ljava/lang/Throwable;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .param p4, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 88
    new-instance v0, Lfreemarker/core/_ErrorDescriptionBuilder;

    invoke-direct {v0, p4}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>([Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Lfreemarker/core/_ErrorDescriptionBuilder;->blame(Lfreemarker/core/Expression;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, p2, p3, v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 89
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 80
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lfreemarker/core/_TemplateModelException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    .line 81
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/_ErrorDescriptionBuilder;)V
    .registers 3
    .param p1, "description"    # Lfreemarker/core/_ErrorDescriptionBuilder;

    .prologue
    .line 46
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lfreemarker/core/_TemplateModelException;-><init>(Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    const/4 v1, 0x0

    .line 35
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, p1, v1, v0}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;)V
    .registers 4
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 31
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, p1, p2, v0}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V
    .registers 5
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "description"    # Lfreemarker/core/_ErrorDescriptionBuilder;

    .prologue
    .line 54
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;)V
    .registers 5
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "description"    # Ljava/lang/String;

    .prologue
    .line 39
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;Z)V

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 73
    new-instance v0, Lfreemarker/core/_ErrorDescriptionBuilder;

    invoke-direct {v0, p3}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>([Ljava/lang/Object;)V

    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Ljava/lang/String;)V
    .registers 4
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 23
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 24
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    .line 70
    return-void
.end method

.method public constructor <init>([Ljava/lang/Object;)V
    .registers 3
    .param p1, "descriptionParts"    # [Ljava/lang/Object;

    .prologue
    .line 61
    const/4 v0, 0x0

    check-cast v0, Lfreemarker/core/Environment;

    invoke-direct {p0, v0, p1}, Lfreemarker/core/_TemplateModelException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    .line 62
    return-void
.end method

.method static modelHasStoredNullDescription(Ljava/lang/Class;Lfreemarker/template/TemplateModel;)[Ljava/lang/Object;
    .registers 5
    .param p0, "expected"    # Ljava/lang/Class;
    .param p1, "model"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 107
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string v2, "The FreeMarker value exists, but has nothing inside it; the TemplateModel object (class: "

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, ") has returned a null instead of a "

    aput-object v2, v0, v1

    const/4 v1, 0x3

    invoke-static {p0}, Lfreemarker/template/utility/ClassUtil;->getShortClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, ". "

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "This is possibly a bug in the non-FreeMarker code that builds the data-model."

    aput-object v2, v0, v1

    return-object v0
.end method
