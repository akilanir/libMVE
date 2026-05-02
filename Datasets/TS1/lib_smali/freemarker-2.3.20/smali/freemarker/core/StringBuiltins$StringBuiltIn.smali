.class abstract Lfreemarker/core/StringBuiltins$StringBuiltIn;
.super Lfreemarker/core/BuiltIn;
.source "StringBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "StringBuiltIn"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 83
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lfreemarker/core/StringBuiltins$StringBuiltIn;->target:Lfreemarker/core/Expression;

    invoke-virtual {v0, p1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lfreemarker/core/StringBuiltins$StringBuiltIn;->calculateResult(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method abstract calculateResult(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation
.end method
