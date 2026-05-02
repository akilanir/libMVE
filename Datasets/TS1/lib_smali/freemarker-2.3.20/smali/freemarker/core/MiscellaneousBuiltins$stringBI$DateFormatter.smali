.class Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;
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
    name = "DateFormatter"
.end annotation


# instance fields
.field private cachedValue:Ljava/lang/String;

.field private final date:Ljava/util/Date;

.field private final dateType:I

.field private final defaultFormat:Ljava/text/DateFormat;

.field private final env:Lfreemarker/core/Environment;

.field private final this$0:Lfreemarker/core/MiscellaneousBuiltins$stringBI;


# direct methods
.method constructor <init>(Lfreemarker/core/MiscellaneousBuiltins$stringBI;Ljava/util/Date;ILfreemarker/core/Environment;)V
    .registers 6
    .param p2, "date"    # Ljava/util/Date;
    .param p3, "dateType"    # I
    .param p4, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->this$0:Lfreemarker/core/MiscellaneousBuiltins$stringBI;

    .line 238
    iput-object p2, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->date:Ljava/util/Date;

    .line 239
    iput p3, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->dateType:I

    .line 240
    iput-object p4, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->env:Lfreemarker/core/Environment;

    .line 241
    invoke-virtual {p4, p3}, Lfreemarker/core/Environment;->getDateFormatObject(I)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->defaultFormat:Ljava/text/DateFormat;

    .line 242
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
    .line 268
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->this$0:Lfreemarker/core/MiscellaneousBuiltins$stringBI;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lfreemarker/core/MiscellaneousBuiltins$stringBI;->checkMethodArgCount(Ljava/util/List;I)V

    .line 269
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 264
    new-instance v0, Lfreemarker/template/SimpleScalar;

    iget-object v1, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->env:Lfreemarker/core/Environment;

    iget v2, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->dateType:I

    invoke-virtual {v1, v2, p1}, Lfreemarker/core/Environment;->getDateFormatObject(ILjava/lang/String;)Ljava/text/DateFormat;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->date:Ljava/util/Date;

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getAsString()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 248
    iget v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->dateType:I

    if-nez v0, :cond_17

    .line 249
    new-instance v0, Lfreemarker/core/_TemplateModelException;

    new-instance v1, Lfreemarker/core/_ErrorDescriptionBuilder;

    const-string v2, "Can\'t convert the date to string, because it isn\'t known if it\'s a date-only, time-only, or date-time value."

    invoke-direct {v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lfreemarker/core/MessageUtil;->UNKNOWN_DATE_TO_STRING_TIPS:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;->tip([Ljava/lang/Object;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/core/_TemplateModelException;-><init>(Lfreemarker/core/_ErrorDescriptionBuilder;)V

    throw v0

    .line 254
    :cond_17
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->cachedValue:Ljava/lang/String;

    if-nez v0, :cond_25

    .line 255
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->defaultFormat:Ljava/text/DateFormat;

    iget-object v1, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->date:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->cachedValue:Ljava/lang/String;

    .line 257
    :cond_25
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$stringBI$DateFormatter;->cachedValue:Ljava/lang/String;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 274
    const/4 v0, 0x0

    return v0
.end method
