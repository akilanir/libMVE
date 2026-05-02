.class Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;
.super Ljava/lang/Object;
.source "StringBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins$index_ofBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BIMethod"
.end annotation


# instance fields
.field private final s:Ljava/lang/String;

.field private final this$0:Lfreemarker/core/StringBuiltins$index_ofBI;


# direct methods
.method private constructor <init>(Lfreemarker/core/StringBuiltins$index_ofBI;Ljava/lang/String;)V
    .registers 3
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 558
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$index_ofBI;

    .line 559
    iput-object p2, p0, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;->s:Ljava/lang/String;

    .line 560
    return-void
.end method

.method constructor <init>(Lfreemarker/core/StringBuiltins$index_ofBI;Ljava/lang/String;Lfreemarker/core/StringBuiltins$1;)V
    .registers 4
    .param p1, "x0"    # Lfreemarker/core/StringBuiltins$index_ofBI;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Lfreemarker/core/StringBuiltins$1;

    .prologue
    .line 554
    invoke-direct {p0, p1, p2}, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;-><init>(Lfreemarker/core/StringBuiltins$index_ofBI;Ljava/lang/String;)V

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

    .line 563
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 564
    .local v0, "argCnt":I
    iget-object v3, p0, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$index_ofBI;

    const/4 v4, 0x2

    invoke-virtual {v3, v0, v5, v4}, Lfreemarker/core/StringBuiltins$index_ofBI;->checkMethodArgCount(III)V

    .line 565
    iget-object v3, p0, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$index_ofBI;

    const/4 v4, 0x0

    invoke-virtual {v3, p1, v4}, Lfreemarker/core/StringBuiltins$index_ofBI;->getStringMethodArg(Ljava/util/List;I)Ljava/lang/String;

    move-result-object v2

    .line 566
    .local v2, "subStr":Ljava/lang/String;
    if-le v0, v5, :cond_3a

    .line 567
    iget-object v3, p0, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$index_ofBI;

    invoke-virtual {v3, p1, v5}, Lfreemarker/core/StringBuiltins$index_ofBI;->getNumberMethodArg(Ljava/util/List;I)Ljava/lang/Number;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v1

    .line 568
    .local v1, "startIdx":I
    new-instance v4, Lfreemarker/template/SimpleNumber;

    iget-object v3, p0, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$index_ofBI;

    invoke-static {v3}, Lfreemarker/core/StringBuiltins$index_ofBI;->access$900(Lfreemarker/core/StringBuiltins$index_ofBI;)Z

    move-result v3

    if-eqz v3, :cond_33

    iget-object v3, p0, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;->s:Ljava/lang/String;

    invoke-virtual {v3, v2, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v3

    :goto_2e
    invoke-direct {v4, v3}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    move-object v3, v4

    .line 570
    .end local v1    # "startIdx":I
    :goto_32
    return-object v3

    .line 568
    .restart local v1    # "startIdx":I
    :cond_33
    iget-object v3, p0, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;->s:Ljava/lang/String;

    invoke-virtual {v3, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    goto :goto_2e

    .line 570
    .end local v1    # "startIdx":I
    :cond_3a
    new-instance v4, Lfreemarker/template/SimpleNumber;

    iget-object v3, p0, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$index_ofBI;

    invoke-static {v3}, Lfreemarker/core/StringBuiltins$index_ofBI;->access$900(Lfreemarker/core/StringBuiltins$index_ofBI;)Z

    move-result v3

    if-eqz v3, :cond_4f

    iget-object v3, p0, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;->s:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    :goto_4a
    invoke-direct {v4, v3}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    move-object v3, v4

    goto :goto_32

    :cond_4f
    iget-object v3, p0, Lfreemarker/core/StringBuiltins$index_ofBI$BIMethod;->s:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    goto :goto_4a
.end method
