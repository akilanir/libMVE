.class public final Lde/psdev/licensesdialog/NoticesHtmlBuilder;
.super Ljava/lang/Object;
.source "NoticesHtmlBuilder.java"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mLicenseTextCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lde/psdev/licensesdialog/licenses/License;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mNotice:Lde/psdev/licensesdialog/model/Notice;

.field private mNotices:Lde/psdev/licensesdialog/model/Notices;

.field private mShowFullLicenseText:Z

.field private mStyle:Ljava/lang/String;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mLicenseTextCache:Ljava/util/Map;

    .line 41
    iput-object p1, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mContext:Landroid/content/Context;

    .line 42
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lde/psdev/licensesdialog/R$string;->notices_default_style:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mStyle:Ljava/lang/String;

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mShowFullLicenseText:Z

    .line 44
    return-void
.end method

.method private appendNoticeBlock(Ljava/lang/StringBuilder;Lde/psdev/licensesdialog/model/Notice;)V
    .registers 7
    .param p1, "noticesHtmlBuilder"    # Ljava/lang/StringBuilder;
    .param p2, "notice"    # Lde/psdev/licensesdialog/model/Notice;

    .prologue
    .line 93
    const-string v2, "<ul><li>"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lde/psdev/licensesdialog/model/Notice;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    invoke-virtual {p2}, Lde/psdev/licensesdialog/model/Notice;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 95
    .local v1, "currentNoticeUrl":Ljava/lang/String;
    if-eqz v1, :cond_32

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_32

    .line 96
    const-string v2, " (<a href=\""

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\">"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</a>)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    :cond_32
    const-string v2, "</li></ul>"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    const-string v2, "<pre>"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    invoke-virtual {p2}, Lde/psdev/licensesdialog/model/Notice;->getCopyright()Ljava/lang/String;

    move-result-object v0

    .line 101
    .local v0, "copyright":Ljava/lang/String;
    if-eqz v0, :cond_4b

    .line 102
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "<br/><br/>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    :cond_4b
    invoke-virtual {p2}, Lde/psdev/licensesdialog/model/Notice;->getLicense()Lde/psdev/licensesdialog/licenses/License;

    move-result-object v2

    invoke-direct {p0, v2}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->getLicenseText(Lde/psdev/licensesdialog/licenses/License;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "</pre>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    return-void
.end method

.method private appendNoticesContainerEnd(Ljava/lang/StringBuilder;)V
    .registers 3
    .param p1, "noticesHtmlBuilder"    # Ljava/lang/StringBuilder;

    .prologue
    .line 108
    const-string v0, "</body></html>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    return-void
.end method

.method private appendNoticesContainerStart(Ljava/lang/StringBuilder;)V
    .registers 4
    .param p1, "noticesHtmlBuilder"    # Ljava/lang/StringBuilder;

    .prologue
    .line 87
    const-string v0, "<!DOCTYPE html><html><head>"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "<style type=\"text/css\">"

    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mStyle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</style>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</head><body>"

    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    return-void
.end method

.method public static create(Landroid/content/Context;)Lde/psdev/licensesdialog/NoticesHtmlBuilder;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    new-instance v0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;

    invoke-direct {v0, p0}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method private getLicenseText(Lde/psdev/licensesdialog/licenses/License;)Ljava/lang/String;
    .registers 4
    .param p1, "license"    # Lde/psdev/licensesdialog/licenses/License;

    .prologue
    .line 112
    if-eqz p1, :cond_29

    .line 113
    iget-object v0, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mLicenseTextCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    .line 114
    iget-object v1, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mLicenseTextCache:Ljava/util/Map;

    iget-boolean v0, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mShowFullLicenseText:Z

    if-eqz v0, :cond_22

    iget-object v0, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v0}, Lde/psdev/licensesdialog/licenses/License;->getFullText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    :goto_16
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    :cond_19
    iget-object v0, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mLicenseTextCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 118
    :goto_21
    return-object v0

    .line 114
    :cond_22
    iget-object v0, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mContext:Landroid/content/Context;

    invoke-virtual {p1, v0}, Lde/psdev/licensesdialog/licenses/License;->getSummaryText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 118
    :cond_29
    const-string v0, ""

    goto :goto_21
.end method


# virtual methods
.method public build()Ljava/lang/String;
    .registers 5

    .prologue
    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x1f4

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 70
    .local v1, "noticesHtmlBuilder":Ljava/lang/StringBuilder;
    invoke-direct {p0, v1}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->appendNoticesContainerStart(Ljava/lang/StringBuilder;)V

    .line 71
    iget-object v2, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mNotice:Lde/psdev/licensesdialog/model/Notice;

    if-eqz v2, :cond_1b

    .line 72
    iget-object v2, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mNotice:Lde/psdev/licensesdialog/model/Notice;

    invoke-direct {p0, v1, v2}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->appendNoticeBlock(Ljava/lang/StringBuilder;Lde/psdev/licensesdialog/model/Notice;)V

    .line 80
    :cond_13
    invoke-direct {p0, v1}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->appendNoticesContainerEnd(Ljava/lang/StringBuilder;)V

    .line 81
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 73
    :cond_1b
    iget-object v2, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    if-eqz v2, :cond_39

    .line 74
    iget-object v2, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    invoke-virtual {v2}, Lde/psdev/licensesdialog/model/Notices;->getNotices()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_29
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_13

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/psdev/licensesdialog/model/Notice;

    .line 75
    .local v0, "notice":Lde/psdev/licensesdialog/model/Notice;
    invoke-direct {p0, v1, v0}, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->appendNoticeBlock(Ljava/lang/StringBuilder;Lde/psdev/licensesdialog/model/Notice;)V

    goto :goto_29

    .line 78
    .end local v0    # "notice":Lde/psdev/licensesdialog/model/Notice;
    :cond_39
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "no notice(s) set"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public setNotice(Lde/psdev/licensesdialog/model/Notice;)Lde/psdev/licensesdialog/NoticesHtmlBuilder;
    .registers 3
    .param p1, "notice"    # Lde/psdev/licensesdialog/model/Notice;

    .prologue
    .line 53
    iput-object p1, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mNotice:Lde/psdev/licensesdialog/model/Notice;

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    .line 55
    return-object p0
.end method

.method public setNotices(Lde/psdev/licensesdialog/model/Notices;)Lde/psdev/licensesdialog/NoticesHtmlBuilder;
    .registers 3
    .param p1, "notices"    # Lde/psdev/licensesdialog/model/Notices;

    .prologue
    .line 47
    iput-object p1, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mNotices:Lde/psdev/licensesdialog/model/Notices;

    .line 48
    const/4 v0, 0x0

    iput-object v0, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mNotice:Lde/psdev/licensesdialog/model/Notice;

    .line 49
    return-object p0
.end method

.method public setShowFullLicenseText(Z)Lde/psdev/licensesdialog/NoticesHtmlBuilder;
    .registers 2
    .param p1, "showFullLicenseText"    # Z

    .prologue
    .line 64
    iput-boolean p1, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mShowFullLicenseText:Z

    .line 65
    return-object p0
.end method

.method public setStyle(Ljava/lang/String;)Lde/psdev/licensesdialog/NoticesHtmlBuilder;
    .registers 2
    .param p1, "style"    # Ljava/lang/String;

    .prologue
    .line 59
    iput-object p1, p0, Lde/psdev/licensesdialog/NoticesHtmlBuilder;->mStyle:Ljava/lang/String;

    .line 60
    return-object p0
.end method
