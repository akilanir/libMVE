.class Lfreemarker/core/StringBuiltins$splitBI$BIMethod;
.super Ljava/lang/Object;
.source "StringBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins$splitBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BIMethod"
.end annotation


# instance fields
.field private s:Ljava/lang/String;

.field private final this$0:Lfreemarker/core/StringBuiltins$splitBI;


# direct methods
.method private constructor <init>(Lfreemarker/core/StringBuiltins$splitBI;Ljava/lang/String;)V
    .registers 3
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 450
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/StringBuiltins$splitBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$splitBI;

    .line 451
    iput-object p2, p0, Lfreemarker/core/StringBuiltins$splitBI$BIMethod;->s:Ljava/lang/String;

    .line 452
    return-void
.end method

.method constructor <init>(Lfreemarker/core/StringBuiltins$splitBI;Ljava/lang/String;Lfreemarker/core/StringBuiltins$1;)V
    .registers 4
    .param p1, "x0"    # Lfreemarker/core/StringBuiltins$splitBI;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Lfreemarker/core/StringBuiltins$1;

    .prologue
    .line 447
    invoke-direct {p0, p1, p2}, Lfreemarker/core/StringBuiltins$splitBI$BIMethod;-><init>(Lfreemarker/core/StringBuiltins$splitBI;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 9
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v1, 0x1

    .line 455
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 456
    .local v0, "argCnt":I
    iget-object v4, p0, Lfreemarker/core/StringBuiltins$splitBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$splitBI;

    invoke-virtual {v4, v0, v1, v6}, Lfreemarker/core/StringBuiltins$splitBI;->checkMethodArgCount(III)V

    .line 457
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 458
    .local v3, "splitString":Ljava/lang/String;
    if-ne v0, v6, :cond_33

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object v2, v4

    .line 459
    .local v2, "flags":Ljava/lang/String;
    :goto_1b
    const/16 v4, 0x69

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-ltz v4, :cond_36

    .line 460
    .local v1, "caseInsensitive":Z
    :goto_23
    const/16 v4, 0x72

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-ltz v4, :cond_38

    .line 461
    new-instance v4, Lfreemarker/core/_TemplateModelException;

    const-string v5, "Regular expression classes not available"

    invoke-direct {v4, v5}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 458
    .end local v1    # "caseInsensitive":Z
    .end local v2    # "flags":Ljava/lang/String;
    :cond_33
    const-string v2, ""

    goto :goto_1b

    .restart local v2    # "flags":Ljava/lang/String;
    :cond_36
    move v1, v5

    .line 459
    goto :goto_23

    .line 463
    .restart local v1    # "caseInsensitive":Z
    :cond_38
    new-instance v4, Lfreemarker/core/StringArraySequence;

    iget-object v5, p0, Lfreemarker/core/StringBuiltins$splitBI$BIMethod;->s:Ljava/lang/String;

    invoke-static {v5, v3, v1}, Lfreemarker/template/utility/StringUtil;->split(Ljava/lang/String;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lfreemarker/core/StringArraySequence;-><init>([Ljava/lang/String;)V

    return-object v4
.end method
