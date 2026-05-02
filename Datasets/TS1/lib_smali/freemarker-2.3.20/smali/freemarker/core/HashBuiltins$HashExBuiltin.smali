.class abstract Lfreemarker/core/HashBuiltins$HashExBuiltin;
.super Lfreemarker/core/BuiltIn;
.source "HashBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/HashBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "HashExBuiltin"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/core/HashBuiltins$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/core/HashBuiltins$1;

    .prologue
    .line 18
    invoke-direct {p0}, Lfreemarker/core/HashBuiltins$HashExBuiltin;-><init>()V

    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 21
    iget-object v1, p0, Lfreemarker/core/HashBuiltins$HashExBuiltin;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 22
    .local v0, "model":Lfreemarker/template/TemplateModel;
    instance-of v1, v0, Lfreemarker/template/TemplateHashModelEx;

    if-eqz v1, :cond_11

    .line 23
    check-cast v0, Lfreemarker/template/TemplateHashModelEx;

    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    invoke-virtual {p0, v0, p1}, Lfreemarker/core/HashBuiltins$HashExBuiltin;->calculateResult(Lfreemarker/template/TemplateHashModelEx;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    return-object v1

    .line 25
    .restart local v0    # "model":Lfreemarker/template/TemplateModel;
    :cond_11
    new-instance v1, Lfreemarker/core/UnexpectedTypeException;

    iget-object v2, p0, Lfreemarker/core/HashBuiltins$HashExBuiltin;->target:Lfreemarker/core/Expression;

    const-string v3, "extended hash"

    invoke-direct {v1, v2, v0, v3, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v1
.end method

.method abstract calculateResult(Lfreemarker/template/TemplateHashModelEx;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Lfreemarker/core/InvalidReferenceException;
        }
    .end annotation
.end method

.method protected newNullPropertyException(Ljava/lang/String;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;
    .registers 9
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "tm"    # Lfreemarker/template/TemplateModel;
    .param p3, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 33
    invoke-virtual {p3}, Lfreemarker/core/Environment;->getFastInvalidReferenceExceptions()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 34
    sget-object v0, Lfreemarker/core/InvalidReferenceException;->FAST_INSTANCE:Lfreemarker/core/InvalidReferenceException;

    .line 36
    :goto_8
    return-object v0

    :cond_9
    new-instance v0, Lfreemarker/core/InvalidReferenceException;

    new-instance v1, Lfreemarker/core/_ErrorDescriptionBuilder;

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "The exteneded hash (of class "

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, ") has returned null for its \""

    aput-object v4, v2, v3

    const/4 v3, 0x3

    aput-object p1, v2, v3

    const/4 v3, 0x4

    const-string v4, "\" property. This is maybe a bug. The extended hash was returned by this expression:"

    aput-object v4, v2, v3

    invoke-direct {v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>([Ljava/lang/Object;)V

    iget-object v2, p0, Lfreemarker/core/HashBuiltins$HashExBuiltin;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;->blame(Lfreemarker/core/Expression;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v1

    invoke-direct {v0, v1, p3}, Lfreemarker/core/InvalidReferenceException;-><init>(Lfreemarker/core/_ErrorDescriptionBuilder;Lfreemarker/core/Environment;)V

    goto :goto_8
.end method
