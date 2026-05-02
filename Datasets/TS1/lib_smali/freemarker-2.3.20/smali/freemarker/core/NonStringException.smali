.class public Lfreemarker/core/NonStringException;
.super Lfreemarker/core/UnexpectedTypeException;
.source "NonStringException.java"


# static fields
.field private static final DEFAULT_DESCRIPTION:Ljava/lang/String; = "Expecting string or something automatically convertible to string (number, date or boolean) value here"

.field static final TYPES_USABLE_WHERE_STRING_IS_EXPECTED:Ljava/lang/String; = "string or something automatically convertible to string (number, date or boolean)"


# direct methods
.method public constructor <init>(Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 73
    const-string v0, "Expecting string or something automatically convertible to string (number, date or boolean) value here"

    invoke-direct {p0, p1, v0}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method constructor <init>(Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .param p2, "description"    # Lfreemarker/core/_ErrorDescriptionBuilder;

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Environment;Lfreemarker/core/_ErrorDescriptionBuilder;)V

    .line 82
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
    .line 87
    const-string v0, "string or something automatically convertible to string (number, date or boolean)"

    invoke-direct {p0, p1, p2, v0, p3}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 88
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
    .line 94
    const-string v3, "string or something automatically convertible to string (number, date or boolean)"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 95
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
    .line 99
    const-string v3, "string or something automatically convertible to string (number, date or boolean)"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;[Ljava/lang/String;Lfreemarker/core/Environment;)V

    .line 100
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 77
    invoke-direct {p0, p2, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    .line 78
    return-void
.end method
