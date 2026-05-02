.class Lfreemarker/core/StringBuiltins$containsBI;
.super Lfreemarker/core/BuiltIn;
.source "StringBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "containsBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/StringBuiltins$containsBI$BIMethod;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 518
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    .line 525
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 521
    new-instance v0, Lfreemarker/core/StringBuiltins$containsBI$BIMethod;

    iget-object v1, p0, Lfreemarker/core/StringBuiltins$containsBI;->target:Lfreemarker/core/Expression;

    const-string v2, "For sequences/collections (lists and such) use \"?seq_contains\" instead."

    invoke-virtual {v1, p1, v2}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lfreemarker/core/StringBuiltins$containsBI$BIMethod;-><init>(Lfreemarker/core/StringBuiltins$containsBI;Ljava/lang/String;Lfreemarker/core/StringBuiltins$1;)V

    return-object v0
.end method
