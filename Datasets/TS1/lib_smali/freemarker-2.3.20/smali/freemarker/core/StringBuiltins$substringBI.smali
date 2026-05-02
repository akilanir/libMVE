.class Lfreemarker/core/StringBuiltins$substringBI;
.super Lfreemarker/core/StringBuiltins$StringBuiltIn;
.source "StringBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "substringBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 228
    invoke-direct {p0}, Lfreemarker/core/StringBuiltins$StringBuiltIn;-><init>()V

    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 230
    new-instance v0, Lfreemarker/core/StringBuiltins$substringBI$1;

    invoke-direct {v0, p0, p1}, Lfreemarker/core/StringBuiltins$substringBI$1;-><init>(Lfreemarker/core/StringBuiltins$substringBI;Ljava/lang/String;)V

    return-object v0
.end method
