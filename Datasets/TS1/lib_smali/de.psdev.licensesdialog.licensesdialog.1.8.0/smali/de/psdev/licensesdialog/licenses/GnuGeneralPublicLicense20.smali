.class public Lde/psdev/licensesdialog/licenses/GnuGeneralPublicLicense20;
.super Lde/psdev/licensesdialog/licenses/License;
.source "GnuGeneralPublicLicense20.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Lde/psdev/licensesdialog/licenses/License;-><init>()V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 26
    const-string v0, "GNU General Public License 2.0"

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 46
    const-string v0, "http://www.gnu.org/licenses/"

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 41
    const-string v0, "2.0"

    return-object v0
.end method

.method public readFullTextFromResources(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    sget v0, Lde/psdev/licensesdialog/R$raw;->gpl_20_full:I

    invoke-virtual {p0, p1, v0}, Lde/psdev/licensesdialog/licenses/GnuGeneralPublicLicense20;->getContent(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readSummaryTextFromResources(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    sget v0, Lde/psdev/licensesdialog/R$raw;->gpl_20_summary:I

    invoke-virtual {p0, p1, v0}, Lde/psdev/licensesdialog/licenses/GnuGeneralPublicLicense20;->getContent(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
