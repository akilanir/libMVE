.class Lfreemarker/core/DateBuiltins$iso_BI;
.super Lfreemarker/core/DateBuiltins$AbstractISOBI;
.source "DateBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/DateBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "iso_BI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/DateBuiltins$iso_BI$Result;
    }
.end annotation


# direct methods
.method constructor <init>(ZI)V
    .registers 3
    .param p1, "showOffset"    # Z
    .param p2, "accuracy"    # I

    .prologue
    .line 157
    invoke-direct {p0, p1, p2}, Lfreemarker/core/DateBuiltins$AbstractISOBI;-><init>(ZI)V

    .line 158
    return-void
.end method


# virtual methods
.method protected calculateResult(Ljava/util/Date;ILfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "dateType"    # I
    .param p3, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 163
    invoke-virtual {p0, p2}, Lfreemarker/core/DateBuiltins$iso_BI;->checkDateTypeNotUnknown(I)V

    .line 164
    new-instance v0, Lfreemarker/core/DateBuiltins$iso_BI$Result;

    invoke-direct {v0, p0, p1, p2, p3}, Lfreemarker/core/DateBuiltins$iso_BI$Result;-><init>(Lfreemarker/core/DateBuiltins$iso_BI;Ljava/util/Date;ILfreemarker/core/Environment;)V

    return-object v0
.end method
