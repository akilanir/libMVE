.class abstract Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;
.super Lfreemarker/core/BuiltIn;
.source "NumericalBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/NumericalBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "NumberBuiltIn"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 77
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/core/NumericalBuiltins$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/core/NumericalBuiltins$1;

    .prologue
    .line 77
    invoke-direct {p0}, Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;-><init>()V

    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 81
    iget-object v1, p0, Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 82
    .local v0, "model":Lfreemarker/template/TemplateModel;
    iget-object v1, p0, Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, v0, p1}, Lfreemarker/core/Expression;->modelToNumber(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;->calculateResult(Ljava/lang/Number;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    return-object v1
.end method

.method abstract calculateResult(Ljava/lang/Number;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation
.end method
