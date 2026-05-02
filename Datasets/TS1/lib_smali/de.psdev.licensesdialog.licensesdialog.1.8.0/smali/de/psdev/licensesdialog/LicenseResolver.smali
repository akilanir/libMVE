.class public final Lde/psdev/licensesdialog/LicenseResolver;
.super Ljava/lang/Object;
.source "LicenseResolver.java"


# static fields
.field private static final INITIAL_LICENSES_COUNT:I = 0x4

.field private static final sLicenses:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lde/psdev/licensesdialog/licenses/License;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 37
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lde/psdev/licensesdialog/LicenseResolver;->sLicenses:Ljava/util/Map;

    .line 40
    invoke-static {}, Lde/psdev/licensesdialog/LicenseResolver;->registerDefaultLicenses()V

    .line 41
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    return-void
.end method

.method public static read(Ljava/lang/String;)Lde/psdev/licensesdialog/licenses/License;
    .registers 6
    .param p0, "license"    # Ljava/lang/String;

    .prologue
    .line 74
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 75
    .local v0, "trimmedLicense":Ljava/lang/String;
    sget-object v1, Lde/psdev/licensesdialog/LicenseResolver;->sLicenses:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 76
    sget-object v1, Lde/psdev/licensesdialog/LicenseResolver;->sLicenses:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde/psdev/licensesdialog/licenses/License;

    return-object v1

    .line 78
    :cond_15
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "no such license available: %s, did you forget to register it?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static registerDefaultLicenses()V
    .registers 1

    .prologue
    .line 44
    sget-object v0, Lde/psdev/licensesdialog/LicenseResolver;->sLicenses:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 45
    new-instance v0, Lde/psdev/licensesdialog/licenses/ApacheSoftwareLicense20;

    invoke-direct {v0}, Lde/psdev/licensesdialog/licenses/ApacheSoftwareLicense20;-><init>()V

    invoke-static {v0}, Lde/psdev/licensesdialog/LicenseResolver;->registerLicense(Lde/psdev/licensesdialog/licenses/License;)V

    .line 46
    new-instance v0, Lde/psdev/licensesdialog/licenses/BSD2ClauseLicense;

    invoke-direct {v0}, Lde/psdev/licensesdialog/licenses/BSD2ClauseLicense;-><init>()V

    invoke-static {v0}, Lde/psdev/licensesdialog/LicenseResolver;->registerLicense(Lde/psdev/licensesdialog/licenses/License;)V

    .line 47
    new-instance v0, Lde/psdev/licensesdialog/licenses/BSD3ClauseLicense;

    invoke-direct {v0}, Lde/psdev/licensesdialog/licenses/BSD3ClauseLicense;-><init>()V

    invoke-static {v0}, Lde/psdev/licensesdialog/LicenseResolver;->registerLicense(Lde/psdev/licensesdialog/licenses/License;)V

    .line 48
    new-instance v0, Lde/psdev/licensesdialog/licenses/ISCLicense;

    invoke-direct {v0}, Lde/psdev/licensesdialog/licenses/ISCLicense;-><init>()V

    invoke-static {v0}, Lde/psdev/licensesdialog/LicenseResolver;->registerLicense(Lde/psdev/licensesdialog/licenses/License;)V

    .line 49
    new-instance v0, Lde/psdev/licensesdialog/licenses/MITLicense;

    invoke-direct {v0}, Lde/psdev/licensesdialog/licenses/MITLicense;-><init>()V

    invoke-static {v0}, Lde/psdev/licensesdialog/LicenseResolver;->registerLicense(Lde/psdev/licensesdialog/licenses/License;)V

    .line 50
    new-instance v0, Lde/psdev/licensesdialog/licenses/GnuLesserGeneralPublicLicense21;

    invoke-direct {v0}, Lde/psdev/licensesdialog/licenses/GnuLesserGeneralPublicLicense21;-><init>()V

    invoke-static {v0}, Lde/psdev/licensesdialog/LicenseResolver;->registerLicense(Lde/psdev/licensesdialog/licenses/License;)V

    .line 51
    new-instance v0, Lde/psdev/licensesdialog/licenses/GnuLesserGeneralPublicLicense3;

    invoke-direct {v0}, Lde/psdev/licensesdialog/licenses/GnuLesserGeneralPublicLicense3;-><init>()V

    invoke-static {v0}, Lde/psdev/licensesdialog/LicenseResolver;->registerLicense(Lde/psdev/licensesdialog/licenses/License;)V

    .line 52
    new-instance v0, Lde/psdev/licensesdialog/licenses/CreativeCommonsAttributionNoDerivs30Unported;

    invoke-direct {v0}, Lde/psdev/licensesdialog/licenses/CreativeCommonsAttributionNoDerivs30Unported;-><init>()V

    invoke-static {v0}, Lde/psdev/licensesdialog/LicenseResolver;->registerLicense(Lde/psdev/licensesdialog/licenses/License;)V

    .line 53
    new-instance v0, Lde/psdev/licensesdialog/licenses/GnuGeneralPublicLicense30;

    invoke-direct {v0}, Lde/psdev/licensesdialog/licenses/GnuGeneralPublicLicense30;-><init>()V

    invoke-static {v0}, Lde/psdev/licensesdialog/LicenseResolver;->registerLicense(Lde/psdev/licensesdialog/licenses/License;)V

    .line 54
    new-instance v0, Lde/psdev/licensesdialog/licenses/GnuGeneralPublicLicense20;

    invoke-direct {v0}, Lde/psdev/licensesdialog/licenses/GnuGeneralPublicLicense20;-><init>()V

    invoke-static {v0}, Lde/psdev/licensesdialog/LicenseResolver;->registerLicense(Lde/psdev/licensesdialog/licenses/License;)V

    .line 55
    return-void
.end method

.method public static registerLicense(Lde/psdev/licensesdialog/licenses/License;)V
    .registers 3
    .param p0, "license"    # Lde/psdev/licensesdialog/licenses/License;

    .prologue
    .line 63
    sget-object v0, Lde/psdev/licensesdialog/LicenseResolver;->sLicenses:Ljava/util/Map;

    invoke-virtual {p0}, Lde/psdev/licensesdialog/licenses/License;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    return-void
.end method
