.class Lfreemarker/core/DateBuiltins$iso_BI$Result;
.super Ljava/lang/Object;
.source "DateBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/DateBuiltins$iso_BI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Result"
.end annotation


# instance fields
.field private final date:Ljava/util/Date;

.field private final dateType:I

.field private final env:Lfreemarker/core/Environment;

.field private final this$0:Lfreemarker/core/DateBuiltins$iso_BI;


# direct methods
.method constructor <init>(Lfreemarker/core/DateBuiltins$iso_BI;Ljava/util/Date;ILfreemarker/core/Environment;)V
    .registers 5
    .param p2, "date"    # Ljava/util/Date;
    .param p3, "dateType"    # I
    .param p4, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->this$0:Lfreemarker/core/DateBuiltins$iso_BI;

    .line 173
    iput-object p2, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->date:Ljava/util/Date;

    .line 174
    iput p3, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->dateType:I

    .line 175
    iput-object p4, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->env:Lfreemarker/core/Environment;

    .line 176
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 15
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v12, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 179
    iget-object v0, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->this$0:Lfreemarker/core/DateBuiltins$iso_BI;

    invoke-virtual {v0, p1, v3}, Lfreemarker/core/DateBuiltins$iso_BI;->checkMethodArgCount(Ljava/util/List;I)V

    .line 181
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lfreemarker/template/TemplateModel;

    .line 184
    .local v9, "tzArgTM":Lfreemarker/template/TemplateModel;
    instance-of v0, v9, Lfreemarker/template/AdapterTemplateModel;

    if-eqz v0, :cond_5a

    move-object v0, v9

    check-cast v0, Lfreemarker/template/AdapterTemplateModel;

    sget-object v1, Lfreemarker/core/DateBuiltins;->class$java$util$TimeZone:Ljava/lang/Class;

    if-nez v1, :cond_57

    const-string v1, "java.util.TimeZone"

    invoke-static {v1}, Lfreemarker/core/DateBuiltins;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/core/DateBuiltins;->class$java$util$TimeZone:Ljava/lang/Class;

    :goto_22
    invoke-interface {v0, v1}, Lfreemarker/template/AdapterTemplateModel;->getAdaptedObject(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    .local v7, "adaptedObj":Ljava/lang/Object;
    instance-of v0, v7, Ljava/util/TimeZone;

    if-eqz v0, :cond_5a

    move-object v5, v7

    .line 189
    check-cast v5, Ljava/util/TimeZone;

    .line 206
    .end local v7    # "adaptedObj":Ljava/lang/Object;
    .end local v9    # "tzArgTM":Lfreemarker/template/TemplateModel;
    .local v5, "tzArg":Ljava/util/TimeZone;
    :goto_2d
    new-instance v11, Lfreemarker/template/SimpleScalar;

    iget-object v0, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->date:Ljava/util/Date;

    iget v1, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->dateType:I

    if-eq v1, v3, :cond_a7

    move v1, v3

    :goto_36
    iget v2, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->dateType:I

    if-eq v2, v12, :cond_a9

    move v2, v3

    :goto_3b
    iget-object v6, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->this$0:Lfreemarker/core/DateBuiltins$iso_BI;

    iget-boolean v6, v6, Lfreemarker/core/DateBuiltins$iso_BI;->showOffset:Z

    if-eqz v6, :cond_ab

    iget v6, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->dateType:I

    if-eq v6, v12, :cond_ab

    :goto_45
    iget-object v4, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->this$0:Lfreemarker/core/DateBuiltins$iso_BI;

    iget v4, v4, Lfreemarker/core/DateBuiltins$iso_BI;->accuracy:I

    iget-object v6, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->env:Lfreemarker/core/Environment;

    invoke-virtual {v6}, Lfreemarker/core/Environment;->getISOBuiltInCalendar()Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;

    move-result-object v6

    invoke-static/range {v0 .. v6}, Lfreemarker/template/utility/DateUtil;->dateToISO8601String(Ljava/util/Date;ZZZILjava/util/TimeZone;Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v11, v0}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v11

    .line 184
    .end local v5    # "tzArg":Ljava/util/TimeZone;
    .restart local v9    # "tzArgTM":Lfreemarker/template/TemplateModel;
    :cond_57
    sget-object v1, Lfreemarker/core/DateBuiltins;->class$java$util$TimeZone:Ljava/lang/Class;

    goto :goto_22

    .line 190
    :cond_5a
    instance-of v0, v9, Lfreemarker/template/TemplateScalarModel;

    if-eqz v0, :cond_89

    .line 191
    check-cast v9, Lfreemarker/template/TemplateScalarModel;

    .end local v9    # "tzArgTM":Lfreemarker/template/TemplateModel;
    invoke-static {v9, v2, v2}, Lfreemarker/core/EvalUtil;->modelToString(Lfreemarker/template/TemplateScalarModel;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v10

    .line 193
    .local v10, "tzName":Ljava/lang/String;
    :try_start_64
    invoke-static {v10}, Lfreemarker/template/utility/DateUtil;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;
    :try_end_67
    .catch Lfreemarker/template/utility/UnrecognizedTimeZoneException; {:try_start_64 .. :try_end_67} :catch_69

    move-result-object v5

    .restart local v5    # "tzArg":Ljava/util/TimeZone;
    goto :goto_2d

    .line 194
    .end local v5    # "tzArg":Ljava/util/TimeZone;
    :catch_69
    move-exception v8

    .line 195
    .local v8, "e":Lfreemarker/template/utility/UnrecognizedTimeZoneException;
    new-instance v0, Lfreemarker/core/_TemplateModelException;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "The time zone string specified for ?"

    aput-object v2, v1, v4

    iget-object v2, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->this$0:Lfreemarker/core/DateBuiltins$iso_BI;

    iget-object v2, v2, Lfreemarker/core/DateBuiltins$iso_BI;->key:Ljava/lang/String;

    aput-object v2, v1, v3

    const-string v2, "(...) is not recognized as a valid time zone name: "

    aput-object v2, v1, v12

    const/4 v2, 0x3

    new-instance v3, Lfreemarker/core/_DelayedJQuote;

    invoke-direct {v3, v10}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v0

    .line 202
    .end local v8    # "e":Lfreemarker/template/utility/UnrecognizedTimeZoneException;
    .end local v10    # "tzName":Ljava/lang/String;
    .restart local v9    # "tzArgTM":Lfreemarker/template/TemplateModel;
    :cond_89
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/DateBuiltins$iso_BI$Result;->this$0:Lfreemarker/core/DateBuiltins$iso_BI;

    iget-object v1, v1, Lfreemarker/core/DateBuiltins$iso_BI;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "string or java.util.TimeZone"

    invoke-static {v0, v4, v1, v9}, Lfreemarker/core/MessageUtil;->newMethodArgUnexpectedTypeException(Ljava/lang/String;ILjava/lang/String;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;

    move-result-object v0

    throw v0

    .end local v9    # "tzArgTM":Lfreemarker/template/TemplateModel;
    .restart local v5    # "tzArg":Ljava/util/TimeZone;
    :cond_a7
    move v1, v4

    .line 206
    goto :goto_36

    :cond_a9
    move v2, v4

    goto :goto_3b

    :cond_ab
    move v3, v4

    goto :goto_45
.end method
