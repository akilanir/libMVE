.class public Lfreemarker/core/UnexpectedTypeException;
.super Lfreemarker/template/TemplateException;
.source "UnexpectedTypeException.java"


# direct methods
.method constructor <init>(Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V
    .registers 5
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "description"    # Lfreemarker/core/_ErrorDescriptionBuilder;

    .prologue
    .line 18
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, p1, p2, v1}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 19
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Environment;Ljava/lang/String;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 14
    invoke-direct {p0, p2, p1}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 15
    return-void
.end method

.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V
    .registers 8
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;
    .param p3, "expectedType"    # Ljava/lang/String;
    .param p4, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/InvalidReferenceException;
        }
    .end annotation

    .prologue
    .line 24
    const/4 v0, 0x0

    invoke-static {p1, p2, p3, p4}, Lfreemarker/core/UnexpectedTypeException;->newDesciptionBuilder(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v0, p4, v1, v2}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 25
    return-void
.end method

.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Ljava/lang/String;Lfreemarker/core/Environment;)V
    .registers 9
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;
    .param p3, "expectedType"    # Ljava/lang/String;
    .param p4, "tip"    # Ljava/lang/String;
    .param p5, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/InvalidReferenceException;
        }
    .end annotation

    .prologue
    .line 30
    const/4 v0, 0x0

    invoke-static {p1, p2, p3, p5}, Lfreemarker/core/UnexpectedTypeException;->newDesciptionBuilder(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Lfreemarker/core/_ErrorDescriptionBuilder;->tip(Ljava/lang/String;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v0, p5, v1, v2}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 31
    return-void
.end method

.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;[Ljava/lang/String;Lfreemarker/core/Environment;)V
    .registers 9
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;
    .param p3, "expectedType"    # Ljava/lang/String;
    .param p4, "tips"    # [Ljava/lang/String;
    .param p5, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/InvalidReferenceException;
        }
    .end annotation

    .prologue
    .line 35
    const/4 v0, 0x0

    invoke-static {p1, p2, p3, p5}, Lfreemarker/core/UnexpectedTypeException;->newDesciptionBuilder(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Lfreemarker/core/_ErrorDescriptionBuilder;->tips([Ljava/lang/Object;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v0, p5, v1, v2}, Lfreemarker/template/TemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;Z)V

    .line 36
    return-void
.end method

.method private static newDesciptionBuilder(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/core/_ErrorDescriptionBuilder;
    .registers 6
    .param p0, "blamed"    # Lfreemarker/core/Expression;
    .param p1, "model"    # Lfreemarker/template/TemplateModel;
    .param p2, "expectedType"    # Ljava/lang/String;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/InvalidReferenceException;
        }
    .end annotation

    .prologue
    .line 41
    if-nez p1, :cond_7

    invoke-static {p0, p3}, Lfreemarker/core/InvalidReferenceException;->getInstance(Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;

    move-result-object v0

    throw v0

    .line 42
    :cond_7
    new-instance v0, Lfreemarker/core/_ErrorDescriptionBuilder;

    invoke-static {p2, p1}, Lfreemarker/core/UnexpectedTypeException;->unexpectedTypeErrorDescription(Ljava/lang/String;Lfreemarker/template/TemplateModel;)[Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>([Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, Lfreemarker/core/_ErrorDescriptionBuilder;->blame(Lfreemarker/core/Expression;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lfreemarker/core/_ErrorDescriptionBuilder;->showBlamer(Z)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v0

    return-object v0
.end method

.method private static unexpectedTypeErrorDescription(Ljava/lang/String;Lfreemarker/template/TemplateModel;)[Ljava/lang/Object;
    .registers 6
    .param p0, "expectedType"    # Ljava/lang/String;
    .param p1, "model"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 48
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string v2, "Expected "

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lfreemarker/core/_DelayedAOrAn;

    invoke-direct {v2, p0}, Lfreemarker/core/_DelayedAOrAn;-><init>(Ljava/lang/Object;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, ", but this evaluated to "

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Lfreemarker/core/_DelayedAOrAn;

    new-instance v3, Lfreemarker/core/_DelayedFTLTypeDescription;

    invoke-direct {v3, p1}, Lfreemarker/core/_DelayedFTLTypeDescription;-><init>(Lfreemarker/template/TemplateModel;)V

    invoke-direct {v2, v3}, Lfreemarker/core/_DelayedAOrAn;-><init>(Ljava/lang/Object;)V

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, ":"

    aput-object v2, v0, v1

    return-object v0
.end method
