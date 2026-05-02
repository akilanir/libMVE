.class public Lfreemarker/core/_RegexBuiltins$split_reBI;
.super Lfreemarker/core/StringBuiltins$StringBuiltIn;
.source "_RegexBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/_RegexBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "split_reBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/_RegexBuiltins$split_reBI$SplitMethod;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 309
    invoke-direct {p0}, Lfreemarker/core/StringBuiltins$StringBuiltIn;-><init>()V

    .line 314
    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 311
    new-instance v0, Lfreemarker/core/_RegexBuiltins$split_reBI$SplitMethod;

    invoke-direct {v0, p0, p1}, Lfreemarker/core/_RegexBuiltins$split_reBI$SplitMethod;-><init>(Lfreemarker/core/_RegexBuiltins$split_reBI;Ljava/lang/String;)V

    return-object v0
.end method
