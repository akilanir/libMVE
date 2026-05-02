.class public Lde/psdev/licensesdialog/licenses/GnuLesserGeneralPublicLicense3;
.super Lde/psdev/licensesdialog/licenses/License;
.source "GnuLesserGeneralPublicLicense3.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Lde/psdev/licensesdialog/licenses/License;-><init>()V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 28
    const-string v0, "GNU Lesser General Public License 3"

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 48
    const-string v0, "http://www.gnu.org/licenses/lgpl.html"

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    const-string v0, "3"

    return-object v0
.end method

.method public readFullTextFromResources(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    sget v0, Lde/psdev/licensesdialog/R$raw;->lgpl_3_full:I

    invoke-virtual {p0, p1, v0}, Lde/psdev/licensesdialog/licenses/GnuLesserGeneralPublicLicense3;->getContent(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readSummaryTextFromResources(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    sget v0, Lde/psdev/licensesdialog/R$raw;->lgpl_3_summary:I

    invoke-virtual {p0, p1, v0}, Lde/psdev/licensesdialog/licenses/GnuLesserGeneralPublicLicense3;->getContent(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
