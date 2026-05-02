.class public Lfreemarker/core/NonNumericalException;
.super Lfreemarker/core/UnexpectedTypeException;
.source "NonNumericalException.java"


# direct methods
.method public constructor <init>(Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 67
    const-string v0, "Expecting numerical value here"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V
    .registers 5
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/InvalidReferenceException;
        }
    .end annotation

    .prologue
    .line 81
    const-string v0, "number"

    invoke-direct {p0, p1, p2, v0, p3}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 82
    return-void
.end method

.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V
    .registers 11
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;
    .param p3, "tip"    # Ljava/lang/String;
    .param p4, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/InvalidReferenceException;
        }
    .end annotation

    .prologue
    .line 88
    const-string v3, "number"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 89
    return-void
.end method

.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;[Ljava/lang/String;Lfreemarker/core/Environment;)V
    .registers 11
    .param p1, "blamed"    # Lfreemarker/core/Expression;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;
    .param p3, "tips"    # [Ljava/lang/String;
    .param p4, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/InvalidReferenceException;
        }
    .end annotation

    .prologue
    .line 93
    const-string v3, "number"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;[Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 94
    return-void
.end method

.method constructor <init>(Lfreemarker/core/_ErrorDescriptionBuilder;Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "description"    # Lfreemarker/core/_ErrorDescriptionBuilder;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 75
    invoke-direct {p0, p2, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 71
    invoke-direct {p0, p2, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method static newMalformedNumberException(Lfreemarker/core/Expression;Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/core/NonNumericalException;
    .registers 8
    .param p0, "blamed"    # Lfreemarker/core/Expression;
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 98
    new-instance v0, Lfreemarker/core/NonNumericalException;

    new-instance v1, Lfreemarker/core/_ErrorDescriptionBuilder;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "Can\'t convert this string to number: "

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Lfreemarker/core/_DelayedJQuote;

    invoke-direct {v4, p1}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v4, v2, v3

    invoke-direct {v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>([Ljava/lang/Object;)V

    invoke-virtual {v1, p0}, Lfreemarker/core/_ErrorDescriptionBuilder;->blame(Lfreemarker/core/Expression;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lfreemarker/core/NonNumericalException;-><init>(Lfreemarker/core/_ErrorDescriptionBuilder;Lfreemarker/core/Environment;)V

    return-object v0
.end method
