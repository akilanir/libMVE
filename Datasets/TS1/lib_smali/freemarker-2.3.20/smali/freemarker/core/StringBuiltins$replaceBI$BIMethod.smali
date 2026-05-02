.class Lfreemarker/core/StringBuiltins$replaceBI$BIMethod;
.super Ljava/lang/Object;
.source "StringBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins$replaceBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BIMethod"
.end annotation


# instance fields
.field private s:Ljava/lang/String;

.field private final this$0:Lfreemarker/core/StringBuiltins$replaceBI;


# direct methods
.method private constructor <init>(Lfreemarker/core/StringBuiltins$replaceBI;Ljava/lang/String;)V
    .registers 3
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 411
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/StringBuiltins$replaceBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$replaceBI;

    .line 412
    iput-object p2, p0, Lfreemarker/core/StringBuiltins$replaceBI$BIMethod;->s:Ljava/lang/String;

    .line 413
    return-void
.end method

.method constructor <init>(Lfreemarker/core/StringBuiltins$replaceBI;Ljava/lang/String;Lfreemarker/core/StringBuiltins$1;)V
    .registers 4
    .param p1, "x0"    # Lfreemarker/core/StringBuiltins$replaceBI;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Lfreemarker/core/StringBuiltins$1;

    .prologue
    .line 408
    invoke-direct {p0, p1, p2}, Lfreemarker/core/StringBuiltins$replaceBI$BIMethod;-><init>(Lfreemarker/core/StringBuiltins$replaceBI;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 13
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 416
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 417
    .local v0, "argCnt":I
    iget-object v8, p0, Lfreemarker/core/StringBuiltins$replaceBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$replaceBI;

    const/4 v9, 0x3

    invoke-virtual {v8, v0, v10, v9}, Lfreemarker/core/StringBuiltins$replaceBI;->checkMethodArgCount(III)V

    .line 418
    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 419
    .local v2, "first":Ljava/lang/String;
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 422
    .local v5, "second":Ljava/lang/String;
    if-le v0, v10, :cond_47

    .line 423
    invoke-interface {p1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 424
    .local v4, "flags":Ljava/lang/String;
    const/16 v8, 0x69

    invoke-virtual {v4, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    if-ltz v8, :cond_43

    move v1, v6

    .line 425
    .local v1, "caseInsensitive":Z
    :goto_2a
    const/16 v8, 0x66

    invoke-virtual {v4, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    if-ltz v8, :cond_45

    move v3, v6

    .line 426
    .local v3, "firstOnly":Z
    :goto_33
    const/16 v6, 0x72

    invoke-virtual {v4, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ltz v6, :cond_49

    .line 427
    new-instance v6, Lfreemarker/core/_TemplateModelException;

    const-string v7, "The regular expression classes are not available."

    invoke-direct {v6, v7}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v6

    .end local v1    # "caseInsensitive":Z
    .end local v3    # "firstOnly":Z
    :cond_43
    move v1, v7

    .line 424
    goto :goto_2a

    .restart local v1    # "caseInsensitive":Z
    :cond_45
    move v3, v7

    .line 425
    goto :goto_33

    .line 431
    .end local v1    # "caseInsensitive":Z
    .end local v4    # "flags":Ljava/lang/String;
    :cond_47
    const/4 v1, 0x0

    .line 432
    .restart local v1    # "caseInsensitive":Z
    const/4 v3, 0x0

    .line 434
    .restart local v3    # "firstOnly":Z
    :cond_49
    new-instance v6, Lfreemarker/template/SimpleScalar;

    iget-object v7, p0, Lfreemarker/core/StringBuiltins$replaceBI$BIMethod;->s:Ljava/lang/String;

    invoke-static {v7, v2, v5, v1, v3}, Lfreemarker/template/utility/StringUtil;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v6
.end method
