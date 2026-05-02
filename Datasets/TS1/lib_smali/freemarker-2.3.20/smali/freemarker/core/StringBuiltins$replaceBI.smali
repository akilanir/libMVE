.class Lfreemarker/core/StringBuiltins$replaceBI;
.super Lfreemarker/core/StringBuiltins$StringBuiltIn;
.source "StringBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "replaceBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/StringBuiltins$replaceBI$BIMethod;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 402
    invoke-direct {p0}, Lfreemarker/core/StringBuiltins$StringBuiltIn;-><init>()V

    .line 408
    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 405
    new-instance v0, Lfreemarker/core/StringBuiltins$replaceBI$BIMethod;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lfreemarker/core/StringBuiltins$replaceBI$BIMethod;-><init>(Lfreemarker/core/StringBuiltins$replaceBI;Ljava/lang/String;Lfreemarker/core/StringBuiltins$1;)V

    return-object v0
.end method
