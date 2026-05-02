.class public Lfreemarker/core/NonDateException;
.super Lfreemarker/core/UnexpectedTypeException;
.source "NonDateException.java"


# direct methods
.method public constructor <init>(Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 63
    const-string v0, "Expecting date/time value here"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method constructor <init>(Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "description"    # Lfreemarker/core/_ErrorDescriptionBuilder;

    .prologue
    .line 71
    invoke-direct {p0, p1, p2}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V

    .line 72
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
    .line 77
    const-string v0, "date"

    invoke-direct {p0, p1, p2, v0, p3}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 78
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
    .line 84
    const-string v3, "date"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 85
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
    .line 89
    const-string v3, "date"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;[Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 90
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 67
    invoke-direct {p0, p2, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 68
    return-void
.end method
