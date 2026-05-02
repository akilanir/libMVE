.class Lfreemarker/core/StringBuiltins$j_stringBI;
.super Lfreemarker/core/StringBuiltins$StringBuiltIn;
.source "StringBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "j_stringBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 104
    invoke-direct {p0}, Lfreemarker/core/StringBuiltins$StringBuiltIn;-><init>()V

    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 106
    new-instance v0, Lfreemarker/template/SimpleScalar;

    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->javaStringEnc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
