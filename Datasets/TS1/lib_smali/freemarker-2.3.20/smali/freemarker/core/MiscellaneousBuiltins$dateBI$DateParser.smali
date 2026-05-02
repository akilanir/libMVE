.class Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;
.super Ljava/lang/Object;
.source "MiscellaneousBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateDateModel;
.implements Lfreemarker/template/TemplateMethodModel;
.implements Lfreemarker/template/TemplateHashModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/MiscellaneousBuiltins$dateBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DateParser"
.end annotation


# instance fields
.field private cachedValue:Ljava/util/Date;

.field private final defaultFormat:Ljava/text/DateFormat;

.field private final env:Lfreemarker/core/Environment;

.field private final text:Ljava/lang/String;

.field private final this$0:Lfreemarker/core/MiscellaneousBuiltins$dateBI;


# direct methods
.method constructor <init>(Lfreemarker/core/MiscellaneousBuiltins$dateBI;Ljava/lang/String;Lfreemarker/core/Environment;)V
    .registers 5
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->this$0:Lfreemarker/core/MiscellaneousBuiltins$dateBI;

    .line 102
    iput-object p2, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->text:Ljava/lang/String;

    .line 103
    iput-object p3, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->env:Lfreemarker/core/Environment;

    .line 104
    invoke-static {p1}, Lfreemarker/core/MiscellaneousBuiltins$dateBI;->access$000(Lfreemarker/core/MiscellaneousBuiltins$dateBI;)I

    move-result v0

    invoke-virtual {p3, v0}, Lfreemarker/core/Environment;->getDateFormatObject(I)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->defaultFormat:Ljava/text/DateFormat;

    .line 105
    return-void
.end method

.method private parse(Ljava/text/DateFormat;)Ljava/util/Date;
    .registers 9
    .param p1, "df"    # Ljava/text/DateFormat;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 139
    :try_start_0
    iget-object v2, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->text:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_5
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v2

    return-object v2

    .line 141
    :catch_7
    move-exception v0

    .line 142
    .local v0, "e":Ljava/text/ParseException;
    const/4 v1, 0x0

    .line 143
    .local v1, "pattern":Ljava/lang/String;
    instance-of v2, p1, Ljava/text/SimpleDateFormat;

    if-eqz v2, :cond_13

    .line 144
    check-cast p1, Ljava/text/SimpleDateFormat;

    .end local p1    # "df":Ljava/text/DateFormat;
    invoke-virtual {p1}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v1

    .line 146
    :cond_13
    new-instance v3, Lfreemarker/core/_TemplateModelException;

    const/4 v2, 0x6

    new-array v4, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v5, "The string doesn\'t match the expected date/time format. The string to parse was: "

    aput-object v5, v4, v2

    const/4 v2, 0x1

    new-instance v5, Lfreemarker/core/_DelayedJQuote;

    iget-object v6, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->text:Ljava/lang/String;

    invoke-direct {v5, v6}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v5, v4, v2

    const/4 v2, 0x2

    const-string v5, ". "

    aput-object v5, v4, v2

    const/4 v5, 0x3

    if-eqz v1, :cond_48

    const-string v2, "The expected format was: "

    :goto_31
    aput-object v2, v4, v5

    const/4 v5, 0x4

    if-eqz v1, :cond_4b

    new-instance v2, Lfreemarker/core/_DelayedJQuote;

    invoke-direct {v2, v1}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    :goto_3b
    aput-object v2, v4, v5

    const/4 v5, 0x5

    if-eqz v1, :cond_4e

    const-string v2, ". "

    :goto_42
    aput-object v2, v4, v5

    invoke-direct {v3, v4}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v3

    :cond_48
    const-string v2, ""

    goto :goto_31

    :cond_4b
    const-string v2, ""

    goto :goto_3b

    :cond_4e
    const-string v2, ""

    goto :goto_42
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
    .line 125
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->this$0:Lfreemarker/core/MiscellaneousBuiltins$dateBI;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lfreemarker/core/MiscellaneousBuiltins$dateBI;->checkMethodArgCount(Ljava/util/List;I)V

    .line 126
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 119
    new-instance v0, Lfreemarker/template/SimpleDate;

    iget-object v1, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->env:Lfreemarker/core/Environment;

    iget-object v2, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->this$0:Lfreemarker/core/MiscellaneousBuiltins$dateBI;

    invoke-static {v2}, Lfreemarker/core/MiscellaneousBuiltins$dateBI;->access$000(Lfreemarker/core/MiscellaneousBuiltins$dateBI;)I

    move-result v2

    invoke-virtual {v1, v2, p1}, Lfreemarker/core/Environment;->getDateFormatObject(ILjava/lang/String;)Ljava/text/DateFormat;

    move-result-object v1

    invoke-direct {p0, v1}, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->parse(Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->this$0:Lfreemarker/core/MiscellaneousBuiltins$dateBI;

    invoke-static {v2}, Lfreemarker/core/MiscellaneousBuiltins$dateBI;->access$000(Lfreemarker/core/MiscellaneousBuiltins$dateBI;)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lfreemarker/template/SimpleDate;-><init>(Ljava/util/Date;I)V

    return-object v0
.end method

.method public getAsDate()Ljava/util/Date;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 108
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->cachedValue:Ljava/util/Date;

    if-nez v0, :cond_c

    .line 109
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->defaultFormat:Ljava/text/DateFormat;

    invoke-direct {p0, v0}, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->parse(Ljava/text/DateFormat;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->cachedValue:Ljava/util/Date;

    .line 111
    :cond_c
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->cachedValue:Ljava/util/Date;

    return-object v0
.end method

.method public getDateType()I
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lfreemarker/core/MiscellaneousBuiltins$dateBI$DateParser;->this$0:Lfreemarker/core/MiscellaneousBuiltins$dateBI;

    invoke-static {v0}, Lfreemarker/core/MiscellaneousBuiltins$dateBI;->access$000(Lfreemarker/core/MiscellaneousBuiltins$dateBI;)I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 131
    const/4 v0, 0x0

    return v0
.end method
