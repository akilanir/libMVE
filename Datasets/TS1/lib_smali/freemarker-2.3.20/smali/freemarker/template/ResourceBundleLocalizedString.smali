.class public Lfreemarker/template/ResourceBundleLocalizedString;
.super Lfreemarker/template/LocalizedString;
.source "ResourceBundleLocalizedString.java"


# instance fields
.field private resourceBundleLookupKey:Ljava/lang/String;

.field private resourceKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "resourceBundleLookupKey"    # Ljava/lang/String;
    .param p2, "resourceKey"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-direct {p0}, Lfreemarker/template/LocalizedString;-><init>()V

    .line 23
    iput-object p1, p0, Lfreemarker/template/ResourceBundleLocalizedString;->resourceBundleLookupKey:Ljava/lang/String;

    .line 24
    iput-object p2, p0, Lfreemarker/template/ResourceBundleLocalizedString;->resourceKey:Ljava/lang/String;

    .line 25
    return-void
.end method


# virtual methods
.method public getLocalizedString(Ljava/util/Locale;)Ljava/lang/String;
    .registers 6
    .param p1, "locale"    # Ljava/util/Locale;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 29
    :try_start_0
    iget-object v2, p0, Lfreemarker/template/ResourceBundleLocalizedString;->resourceBundleLookupKey:Ljava/lang/String;

    invoke-static {v2, p1}, Ljava/util/ResourceBundle;->getBundle(Ljava/lang/String;Ljava/util/Locale;)Ljava/util/ResourceBundle;

    move-result-object v1

    .line 30
    .local v1, "rb":Ljava/util/ResourceBundle;
    iget-object v2, p0, Lfreemarker/template/ResourceBundleLocalizedString;->resourceKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_b
    .catch Ljava/util/MissingResourceException; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v2

    return-object v2

    .line 32
    .end local v1    # "rb":Ljava/util/ResourceBundle;
    :catch_d
    move-exception v0

    .line 33
    .local v0, "mre":Ljava/util/MissingResourceException;
    new-instance v2, Lfreemarker/template/TemplateModelException;

    const-string v3, "missing resource"

    invoke-direct {v2, v3, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2
.end method
