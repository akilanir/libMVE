.class Lfreemarker/core/StringBuiltins$urlBI;
.super Lfreemarker/core/StringBuiltins$StringBuiltIn;
.source "StringBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "urlBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/StringBuiltins$urlBI$urlBIResult;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 301
    invoke-direct {p0}, Lfreemarker/core/StringBuiltins$StringBuiltIn;-><init>()V

    .line 307
    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 304
    new-instance v0, Lfreemarker/core/StringBuiltins$urlBI$urlBIResult;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lfreemarker/core/StringBuiltins$urlBI$urlBIResult;-><init>(Ljava/lang/String;Lfreemarker/core/Environment;Lfreemarker/core/StringBuiltins$1;)V

    return-object v0
.end method
