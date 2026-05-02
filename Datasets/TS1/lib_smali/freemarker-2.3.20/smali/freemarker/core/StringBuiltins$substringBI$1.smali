.class Lfreemarker/core/StringBuiltins$substringBI$1;
.super Ljava/lang/Object;
.source "StringBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# instance fields
.field private final this$0:Lfreemarker/core/StringBuiltins$substringBI;

.field private final val$s:Ljava/lang/String;


# direct methods
.method constructor <init>(Lfreemarker/core/StringBuiltins$substringBI;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/StringBuiltins$substringBI$1;->this$0:Lfreemarker/core/StringBuiltins$substringBI;

    iput-object p2, p0, Lfreemarker/core/StringBuiltins$substringBI$1;->val$s:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 8
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 232
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 233
    .local v0, "argCount":I
    iget-object v2, p0, Lfreemarker/core/StringBuiltins$substringBI$1;->this$0:Lfreemarker/core/StringBuiltins$substringBI;

    const/4 v3, 0x2

    invoke-virtual {v2, v0, v5, v3}, Lfreemarker/core/StringBuiltins$substringBI;->checkMethodArgCount(III)V

    .line 234
    iget-object v2, p0, Lfreemarker/core/StringBuiltins$substringBI$1;->this$0:Lfreemarker/core/StringBuiltins$substringBI;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3}, Lfreemarker/core/StringBuiltins$substringBI;->getNumberMethodArg(Ljava/util/List;I)Ljava/lang/Number;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v1

    .line 235
    .local v1, "left":I
    if-le v0, v5, :cond_2e

    .line 236
    new-instance v2, Lfreemarker/template/SimpleScalar;

    iget-object v3, p0, Lfreemarker/core/StringBuiltins$substringBI$1;->val$s:Ljava/lang/String;

    iget-object v4, p0, Lfreemarker/core/StringBuiltins$substringBI$1;->this$0:Lfreemarker/core/StringBuiltins$substringBI;

    invoke-virtual {v4, p1, v5}, Lfreemarker/core/StringBuiltins$substringBI;->getNumberMethodArg(Ljava/util/List;I)Ljava/lang/Number;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    invoke-virtual {v3, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    .line 238
    :goto_2d
    return-object v2

    :cond_2e
    new-instance v2, Lfreemarker/template/SimpleScalar;

    iget-object v3, p0, Lfreemarker/core/StringBuiltins$substringBI$1;->val$s:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    goto :goto_2d
.end method
