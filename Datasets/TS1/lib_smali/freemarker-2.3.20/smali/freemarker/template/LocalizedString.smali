.class public abstract Lfreemarker/template/LocalizedString;
.super Ljava/lang/Object;
.source "LocalizedString.java"

# interfaces
.implements Lfreemarker/template/TemplateScalarModel;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAsString()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 30
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v0

    .line 31
    .local v0, "env":Lfreemarker/core/Environment;
    invoke-virtual {v0}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v1

    .line 32
    .local v1, "locale":Ljava/util/Locale;
    invoke-virtual {p0, v1}, Lfreemarker/template/LocalizedString;->getLocalizedString(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public abstract getLocalizedString(Ljava/util/Locale;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation
.end method
