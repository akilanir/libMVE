.class Lfreemarker/core/StringBuiltins$padBI;
.super Lfreemarker/core/StringBuiltins$StringBuiltIn;
.source "StringBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "padBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/StringBuiltins$padBI$BIMethod;
    }
.end annotation


# instance fields
.field private final leftPadder:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 2
    .param p1, "leftPadder"    # Z

    .prologue
    .line 473
    invoke-direct {p0}, Lfreemarker/core/StringBuiltins$StringBuiltIn;-><init>()V

    .line 474
    iput-boolean p1, p0, Lfreemarker/core/StringBuiltins$padBI;->leftPadder:Z

    .line 475
    return-void
.end method

.method static access$600(Lfreemarker/core/StringBuiltins$padBI;)Z
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/StringBuiltins$padBI;

    .prologue
    .line 469
    iget-boolean v0, p0, Lfreemarker/core/StringBuiltins$padBI;->leftPadder:Z

    return v0
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
    .line 478
    new-instance v0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lfreemarker/core/StringBuiltins$padBI$BIMethod;-><init>(Lfreemarker/core/StringBuiltins$padBI;Ljava/lang/String;Lfreemarker/core/StringBuiltins$1;)V

    return-object v0
.end method
