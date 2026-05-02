.class Lfreemarker/core/StringBuiltins$ends_withBI$BIMethod;
.super Ljava/lang/Object;
.source "StringBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/StringBuiltins$ends_withBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BIMethod"
.end annotation


# instance fields
.field private s:Ljava/lang/String;

.field private final this$0:Lfreemarker/core/StringBuiltins$ends_withBI;


# direct methods
.method private constructor <init>(Lfreemarker/core/StringBuiltins$ends_withBI;Ljava/lang/String;)V
    .registers 3
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 389
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/StringBuiltins$ends_withBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$ends_withBI;

    .line 390
    iput-object p2, p0, Lfreemarker/core/StringBuiltins$ends_withBI$BIMethod;->s:Ljava/lang/String;

    .line 391
    return-void
.end method

.method constructor <init>(Lfreemarker/core/StringBuiltins$ends_withBI;Ljava/lang/String;Lfreemarker/core/StringBuiltins$1;)V
    .registers 4
    .param p1, "x0"    # Lfreemarker/core/StringBuiltins$ends_withBI;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Lfreemarker/core/StringBuiltins$1;

    .prologue
    .line 386
    invoke-direct {p0, p1, p2}, Lfreemarker/core/StringBuiltins$ends_withBI$BIMethod;-><init>(Lfreemarker/core/StringBuiltins$ends_withBI;Ljava/lang/String;)V

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
    .line 394
    iget-object v0, p0, Lfreemarker/core/StringBuiltins$ends_withBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$ends_withBI;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lfreemarker/core/StringBuiltins$ends_withBI;->checkMethodArgCount(Ljava/util/List;I)V

    .line 395
    iget-object v0, p0, Lfreemarker/core/StringBuiltins$ends_withBI$BIMethod;->s:Ljava/lang/String;

    iget-object v1, p0, Lfreemarker/core/StringBuiltins$ends_withBI$BIMethod;->this$0:Lfreemarker/core/StringBuiltins$ends_withBI;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lfreemarker/core/StringBuiltins$ends_withBI;->getStringMethodArg(Ljava/util/List;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    :goto_17
    return-object v0

    :cond_18
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_17
.end method
