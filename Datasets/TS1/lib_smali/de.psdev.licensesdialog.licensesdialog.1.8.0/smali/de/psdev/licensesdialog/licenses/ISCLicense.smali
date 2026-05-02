.class public Lde/psdev/licensesdialog/licenses/ISCLicense;
.super Lde/psdev/licensesdialog/licenses/License;
.source "ISCLicense.java"


# static fields
.field private static final serialVersionUID:J = -0x4057eda4f4693484L


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
    .line 27
    const-string v0, "ISC License"

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 47
    const-string v0, "http://opensource.org/licenses/isc-license.txt"

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 42
    const-string v0, ""

    return-object v0
.end method

.method public readFullTextFromResources(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    sget v0, Lde/psdev/licensesdialog/R$raw;->isc_full:I

    invoke-virtual {p0, p1, v0}, Lde/psdev/licensesdialog/licenses/ISCLicense;->getContent(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readSummaryTextFromResources(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    sget v0, Lde/psdev/licensesdialog/R$raw;->isc_summary:I

    invoke-virtual {p0, p1, v0}, Lde/psdev/licensesdialog/licenses/ISCLicense;->getContent(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
