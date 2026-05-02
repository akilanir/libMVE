.class Lfreemarker/core/StringBuiltins$lengthBI;
.super Lfreemarker/core/StringBuiltins$StringBuiltIn;
.source "StringBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "lengthBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 245
    invoke-direct {p0}, Lfreemarker/core/StringBuiltins$StringBuiltIn;-><init>()V

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
    .line 248
    new-instance v0, Lfreemarker/template/SimpleNumber;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    return-object v0
.end method
