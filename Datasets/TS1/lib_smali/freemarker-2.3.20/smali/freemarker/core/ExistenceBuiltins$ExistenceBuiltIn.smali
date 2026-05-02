.class abstract Lfreemarker/core/ExistenceBuiltins$ExistenceBuiltIn;
.super Lfreemarker/core/BuiltIn;
.source "ExistenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/ExistenceBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "ExistenceBuiltIn"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/core/ExistenceBuiltins$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/core/ExistenceBuiltins$1;

    .prologue
    .line 19
    invoke-direct {p0}, Lfreemarker/core/ExistenceBuiltins$ExistenceBuiltIn;-><init>()V

    return-void
.end method


# virtual methods
.method protected evalMaybeNonexistentTarget(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 23
    iget-object v3, p0, Lfreemarker/core/ExistenceBuiltins$ExistenceBuiltIn;->target:Lfreemarker/core/Expression;

    instance-of v3, v3, Lfreemarker/core/ParentheticalExpression;

    if-eqz v3, :cond_20

    .line 24
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    move-result v1

    .line 26
    .local v1, "lastFIRE":Z
    :try_start_b
    iget-object v3, p0, Lfreemarker/core/ExistenceBuiltins$ExistenceBuiltIn;->target:Lfreemarker/core/Expression;

    invoke-virtual {v3, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    :try_end_10
    .catch Lfreemarker/core/InvalidReferenceException; {:try_start_b .. :try_end_10} :catch_15
    .catchall {:try_start_b .. :try_end_10} :catchall_1b

    move-result-object v2

    .line 30
    .local v2, "tm":Lfreemarker/template/TemplateModel;
    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    .line 35
    .end local v1    # "lastFIRE":Z
    :goto_14
    return-object v2

    .line 27
    .end local v2    # "tm":Lfreemarker/template/TemplateModel;
    .restart local v1    # "lastFIRE":Z
    :catch_15
    move-exception v0

    .line 28
    .local v0, "ire":Lfreemarker/core/InvalidReferenceException;
    const/4 v2, 0x0

    .line 30
    .restart local v2    # "tm":Lfreemarker/template/TemplateModel;
    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    goto :goto_14

    .end local v0    # "ire":Lfreemarker/core/InvalidReferenceException;
    .end local v2    # "tm":Lfreemarker/template/TemplateModel;
    :catchall_1b
    move-exception v3

    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    throw v3

    .line 33
    .end local v1    # "lastFIRE":Z
    :cond_20
    iget-object v3, p0, Lfreemarker/core/ExistenceBuiltins$ExistenceBuiltIn;->target:Lfreemarker/core/Expression;

    invoke-virtual {v3, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    .restart local v2    # "tm":Lfreemarker/template/TemplateModel;
    goto :goto_14
.end method
