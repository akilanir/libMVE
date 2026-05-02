.class Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;
.super Ljava/lang/Object;
.source "MiscellaneousBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateScalarModel;
.implements Lfreemarker/template/TemplateHashModel;
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/MiscellaneousBuiltins$stringBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NumberFormatter"
.end annotation


# instance fields
.field private cachedValue:Ljava/lang/String;

.field private final defaultFormat:Ljava/text/NumberFormat;

.field private final env:Lfreemarker/core/Environment;

.field private final number:Ljava/lang/Number;

.field private final this$0:Lfreemarker/core/MiscellaneousBuiltins$stringBI;


# direct methods
.method constructor <init>(Lfreemarker/core/MiscellaneousBuiltins$stringBI;Ljava/lang/Number;Lfreemarker/core/Environment;)V
    .registers 5
    .param p2, "number"    # Ljava/lang/Number;
    .param p3, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 192
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;->this$0:Lfreemarker/core/MiscellaneousBuiltins$stringBI;

    .line 193
    iput-object p2, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;->number:Ljava/lang/Number;

    .line 194
    iput-object p3, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;->env:Lfreemarker/core/Environment;

    .line 195
    invoke-virtual {p3}, Lfreemarker/core/Environment;->getNumberFormat()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lfreemarker/core/Environment;->getNumberFormatObject(Ljava/lang/String;)Ljava/text/NumberFormat;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;->defaultFormat:Ljava/text/NumberFormat;

    .line 196
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 4
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 212
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;->this$0:Lfreemarker/core/MiscellaneousBuiltins$stringBI;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lfreemarker/core/MiscellaneousBuiltins$stringBI;->checkMethodArgCount(Ljava/util/List;I)V

    .line 213
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 208
    new-instance v0, Lfreemarker/template/SimpleScalar;

    iget-object v1, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;->env:Lfreemarker/core/Environment;

    invoke-virtual {v1, p1}, Lfreemarker/core/Environment;->getNumberFormatObject(Ljava/lang/String;)Ljava/text/NumberFormat;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;->number:Ljava/lang/Number;

    invoke-virtual {v1, v2}, Ljava/text/NumberFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getAsString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 200
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;->cachedValue:Ljava/lang/String;

    if-nez v0, :cond_e

    .line 201
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;->defaultFormat:Ljava/text/NumberFormat;

    iget-object v1, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;->number:Ljava/lang/Number;

    invoke-virtual {v0, v1}, Ljava/text/NumberFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;->cachedValue:Ljava/lang/String;

    .line 203
    :cond_e
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$NumberFormatter;->cachedValue:Ljava/lang/String;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 218
    const/4 v0, 0x0

    return v0
.end method
