.class Lfreemarker/core/StringBuiltins$index_ofBI;
.super Lfreemarker/core/BuiltIn;
.source "StringBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "index_ofBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;
    }
.end annotation


# instance fields
.field private final findLast:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 2
    .param p1, "findLast"    # Z

    .prologue
    .line 545
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    .line 546
    iput-boolean p1, p0, Lfreemarker/core/StringBuiltins$index_ofBI;->findLast:Z

    .line 547
    return-void
.end method

.method static access$900(Lfreemarker/core/StringBuiltins$index_ofBI;)Z
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/StringBuiltins$index_ofBI;

    .prologue
    .line 541
    iget-boolean v0, p0, Lfreemarker/core/StringBuiltins$index_ofBI;->findLast:Z

    return v0
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
    .line 550
    new-instance v0, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;

    iget-object v1, p0, Lfreemarker/core/StringBuiltins$index_ofBI;->target:Lfreemarker/core/Expression;

    const-string v2, "For sequences/collections (lists and such) use \"?seq_index_of\" instead."

    invoke-virtual {v1, p1, v2}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;-><init>(Lfreemarker/core/StringBuiltins$index_ofBI;Ljava/lang/String;Lfreemarker/core/StringBuiltins$1;)V

    return-object v0
.end method
