.class Lfreemarker/core/StringBuiltins$numberBI;
.super Lfreemarker/core/StringBuiltins$StringBuiltIn;
.source "StringBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "numberBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 217
    invoke-direct {p0}, Lfreemarker/core/StringBuiltins$StringBuiltIn;-><init>()V

    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 221
    :try_start_0
    new-instance v1, Lfreemarker/template/SimpleNumber;

    invoke-virtual {p2}, Lfreemarker/core/Environment;->getArithmeticEngine()Lfreemarker/core/ArithmeticEngine;

    move-result-object v2

    invoke-virtual {v2, p1}, Lfreemarker/core/ArithmeticEngine;->toNumber(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V
    :try_end_d
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_d} :catch_e

    return-object v1

    .line 222
    :catch_e
    move-exception v0

    .line 223
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    invoke-static {p0, p1, p2}, Lfreemarker/core/NonNumericalException;->newMalformedNumberException(Lfreemarker/core/Expression;Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/core/NonNumericalException;

    move-result-object v1

    throw v1
.end method
