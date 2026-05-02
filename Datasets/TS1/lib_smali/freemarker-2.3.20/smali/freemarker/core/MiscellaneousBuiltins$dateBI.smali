.class Lfreemarker/core/MiscellaneousBuiltins$dateBI;
.super Lfreemarker/core/BuiltIn;
.source "MiscellaneousBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/MiscellaneousBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "dateBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;
    }
.end annotation


# instance fields
.field private final dateType:I


# direct methods
.method constructor <init>(I)V
    .registers 2
    .param p1, "dateType"    # I

    .prologue
    .line 58
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    .line 59
    iput p1, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI;->dateType:I

    .line 60
    return-void
.end method

.method static access$000(Lfreemarker/core/MiscellaneousBuiltins$dateBI;)I
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/MiscellaneousBuiltins$dateBI;

    .prologue
    .line 55
    iget v0, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI;->dateType:I

    return v0
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 11
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x3

    .line 65
    iget-object v4, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v4, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    .line 66
    .local v2, "model":Lfreemarker/template/TemplateModel;
    instance-of v4, v2, Lfreemarker/template/TemplateDateModel;

    if-eqz v4, :cond_4d

    move-object v0, v2

    .line 67
    check-cast v0, Lfreemarker/template/TemplateDateModel;

    .line 68
    .local v0, "dmodel":Lfreemarker/template/TemplateDateModel;
    invoke-interface {v0}, Lfreemarker/template/TemplateDateModel;->getDateType()I

    move-result v1

    .line 70
    .local v1, "dtype":I
    iget v4, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI;->dateType:I

    if-ne v4, v1, :cond_17

    .line 84
    .end local v0    # "dmodel":Lfreemarker/template/TemplateDateModel;
    .end local v1    # "dtype":I
    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    :goto_16
    return-object v2

    .line 74
    .restart local v0    # "dmodel":Lfreemarker/template/TemplateDateModel;
    .restart local v1    # "dtype":I
    .restart local v2    # "model":Lfreemarker/template/TemplateModel;
    :cond_17
    if-eqz v1, :cond_1b

    if-ne v1, v8, :cond_27

    .line 75
    :cond_1b
    new-instance v2, Lfreemarker/template/SimpleDate;

    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {v0}, Lfreemarker/template/TemplateDateModel;->getAsDate()Ljava/util/Date;

    move-result-object v4

    iget v5, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI;->dateType:I

    invoke-direct {v2, v4, v5}, Lfreemarker/template/SimpleDate;-><init>(Ljava/util/Date;I)V

    goto :goto_16

    .line 77
    .restart local v2    # "model":Lfreemarker/template/TemplateModel;
    :cond_27
    new-instance v4, Lfreemarker/core/_MiscTemplateException;

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "Cannot convert "

    aput-object v7, v5, v6

    const/4 v6, 0x1

    sget-object v7, Lfreemarker/template/TemplateDateModel;->TYPE_NAMES:Ljava/util/List;

    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, " into "

    aput-object v7, v5, v6

    sget-object v6, Lfreemarker/template/TemplateDateModel;->TYPE_NAMES:Ljava/util/List;

    iget v7, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI;->dateType:I

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-direct {v4, p0, v5}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v4

    .line 83
    .end local v0    # "dmodel":Lfreemarker/template/TemplateDateModel;
    .end local v1    # "dtype":I
    :cond_4d
    iget-object v4, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v4, p1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v3

    .line 84
    .local v3, "s":Ljava/lang/String;
    new-instance v2, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;

    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    invoke-direct {v2, p0, v3, p1}, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;-><init>(Lfreemarker/core/MiscellaneousBuiltins$dateBI;Ljava/lang/String;Lfreemarker/core/Environment;)V

    goto :goto_16
.end method
