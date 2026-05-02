.class Lfreemarker/core/StringBuiltins$containsBI$BIMethod;
.super Ljava/lang/Object;
.source "StringBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins$containsBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BIMethod"
.end annotation


# instance fields
.field private final s:Ljava/lang/String;

.field private final this$0:Lfreemarker/core/StringBuiltins$containsBI;


# direct methods
.method private constructor <init>(Lfreemarker/core/StringBuiltins$containsBI;Ljava/lang/String;)V
    .registers 3
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 529
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/StringBuiltins$containsBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$containsBI;

    .line 530
    iput-object p2, p0, Lfreemarker/core/StringBuiltins$containsBI$BIMethod;->s:Ljava/lang/String;

    .line 531
    return-void
.end method

.method constructor <init>(Lfreemarker/core/StringBuiltins$containsBI;Ljava/lang/String;Lfreemarker/core/StringBuiltins$1;)V
    .registers 4
    .param p1, "x0"    # Lfreemarker/core/StringBuiltins$containsBI;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Lfreemarker/core/StringBuiltins$1;

    .prologue
    .line 525
    invoke-direct {p0, p1, p2}, Lfreemarker/core/StringBuiltins$containsBI$BIMethod;-><init>(Lfreemarker/core/StringBuiltins$containsBI;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 5
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 534
    iget-object v0, p0, Lfreemarker/core/StringBuiltins$containsBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$containsBI;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lfreemarker/core/StringBuiltins$containsBI;->checkMethodArgCount(Ljava/util/List;I)V

    .line 535
    iget-object v0, p0, Lfreemarker/core/StringBuiltins$containsBI$BIMethod;->s:Ljava/lang/String;

    iget-object v1, p0, Lfreemarker/core/StringBuiltins$containsBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$containsBI;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lfreemarker/core/StringBuiltins$containsBI;->getStringMethodArg(Ljava/util/List;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_19

    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    :goto_18
    return-object v0

    :cond_19
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_18
.end method
