.class Lfreemarker/core/StringBuiltins$padBI$BIMethod;
.super Ljava/lang/Object;
.source "StringBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins$padBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BIMethod"
.end annotation


# instance fields
.field private final s:Ljava/lang/String;

.field private final this$0:Lfreemarker/core/StringBuiltins$padBI;


# direct methods
.method private constructor <init>(Lfreemarker/core/StringBuiltins$padBI;Ljava/lang/String;)V
    .registers 3
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 485
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$padBI;

    .line 486
    iput-object p2, p0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;->s:Ljava/lang/String;

    .line 487
    return-void
.end method

.method constructor <init>(Lfreemarker/core/StringBuiltins$padBI;Ljava/lang/String;Lfreemarker/core/StringBuiltins$1;)V
    .registers 4
    .param p1, "x0"    # Lfreemarker/core/StringBuiltins$padBI;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Lfreemarker/core/StringBuiltins$1;

    .prologue
    .line 481
    invoke-direct {p0, p1, p2}, Lfreemarker/core/StringBuiltins$padBI$BIMethod;-><init>(Lfreemarker/core/StringBuiltins$padBI;Ljava/lang/String;)V

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
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 490
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 491
    .local v0, "argCnt":I
    iget-object v4, p0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$padBI;

    invoke-virtual {v4, v0, v7, v9}, Lfreemarker/core/StringBuiltins$padBI;->checkMethodArgCount(III)V

    .line 493
    iget-object v4, p0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$padBI;

    invoke-virtual {v4, p1, v8}, Lfreemarker/core/StringBuiltins$padBI;->getNumberMethodArg(Ljava/util/List;I)Ljava/lang/Number;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v3

    .line 495
    .local v3, "width":I
    if-le v0, v7, :cond_70

    .line 496
    iget-object v4, p0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$padBI;

    invoke-virtual {v4, p1, v7}, Lfreemarker/core/StringBuiltins$padBI;->getStringMethodArg(Ljava/util/List;I)Ljava/lang/String;

    move-result-object v2

    .line 498
    .local v2, "filling":Ljava/lang/String;
    :try_start_1f
    new-instance v4, Lfreemarker/template/SimpleScalar;

    iget-object v5, p0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$padBI;

    invoke-static {v5}, Lfreemarker/core/StringBuiltins$padBI;->access$600(Lfreemarker/core/StringBuiltins$padBI;)Z

    move-result v5

    if-eqz v5, :cond_33

    iget-object v5, p0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;->s:Ljava/lang/String;

    invoke-static {v5, v3, v2}, Lfreemarker/template/utility/StringUtil;->leftPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_2f
    invoke-direct {v4, v5}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    .line 512
    .end local v2    # "filling":Ljava/lang/String;
    :goto_32
    return-object v4

    .line 498
    .restart local v2    # "filling":Ljava/lang/String;
    :cond_33
    iget-object v5, p0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;->s:Ljava/lang/String;

    invoke-static {v5, v3, v2}, Lfreemarker/template/utility/StringUtil;->rightPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    :try_end_38
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1f .. :try_end_38} :catch_3a

    move-result-object v5

    goto :goto_2f

    .line 502
    :catch_3a
    move-exception v1

    .line 503
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_57

    .line 504
    new-instance v4, Lfreemarker/core/_TemplateModelException;

    new-array v5, v10, [Ljava/lang/Object;

    const-string v6, "?"

    aput-object v6, v5, v8

    iget-object v6, p0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$padBI;

    iget-object v6, v6, Lfreemarker/core/StringBuiltins$padBI;->key:Ljava/lang/String;

    aput-object v6, v5, v7

    const-string v6, "(...) argument #2 can\'t be a 0-length string."

    aput-object v6, v5, v9

    invoke-direct {v4, v5}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v4

    .line 507
    :cond_57
    new-instance v4, Lfreemarker/core/_TemplateModelException;

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "?"

    aput-object v6, v5, v8

    iget-object v6, p0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$padBI;

    iget-object v6, v6, Lfreemarker/core/StringBuiltins$padBI;->key:Ljava/lang/String;

    aput-object v6, v5, v7

    const-string v6, "(...) failed: "

    aput-object v6, v5, v9

    aput-object v1, v5, v10

    invoke-direct {v4, v1, v5}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v4

    .line 512
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    .end local v2    # "filling":Ljava/lang/String;
    :cond_70
    new-instance v5, Lfreemarker/template/SimpleScalar;

    iget-object v4, p0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$padBI;

    invoke-static {v4}, Lfreemarker/core/StringBuiltins$padBI;->access$600(Lfreemarker/core/StringBuiltins$padBI;)Z

    move-result v4

    if-eqz v4, :cond_85

    iget-object v4, p0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;->s:Ljava/lang/String;

    invoke-static {v4, v3}, Lfreemarker/template/utility/StringUtil;->leftPad(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    :goto_80
    invoke-direct {v5, v4}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    move-object v4, v5

    goto :goto_32

    :cond_85
    iget-object v4, p0, Lfreemarker/core/StringBuiltins$padBI$BIMethod;->s:Ljava/lang/String;

    invoke-static {v4, v3}, Lfreemarker/template/utility/StringUtil;->rightPad(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    goto :goto_80
.end method
