.class public Lcom/mikepenz/aboutlibraries/entity/License;
.super Ljava/lang/Object;
.source "License.java"


# instance fields
.field private definedName:Ljava/lang/String;

.field private licenseDescription:Ljava/lang/String;

.field private licenseName:Ljava/lang/String;

.field private licenseShortDescription:Ljava/lang/String;

.field private licenseWebsite:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "licenseName"    # Ljava/lang/String;
    .param p2, "licenseWebsite"    # Ljava/lang/String;
    .param p3, "licenseShortDescription"    # Ljava/lang/String;
    .param p4, "licenseDescription"    # Ljava/lang/String;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseName:Ljava/lang/String;

    .line 19
    iput-object p2, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseWebsite:Ljava/lang/String;

    .line 20
    iput-object p3, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseShortDescription:Ljava/lang/String;

    .line 21
    iput-object p4, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseDescription:Ljava/lang/String;

    .line 22
    return-void
.end method


# virtual methods
.method public copy()Lcom/mikepenz/aboutlibraries/entity/License;
    .registers 6

    .prologue
    .line 25
    new-instance v0, Lcom/mikepenz/aboutlibraries/entity/License;

    iget-object v1, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseName:Ljava/lang/String;

    iget-object v2, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseWebsite:Ljava/lang/String;

    iget-object v3, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseShortDescription:Ljava/lang/String;

    iget-object v4, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseDescription:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/aboutlibraries/entity/License;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getDefinedName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 29
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/License;->definedName:Ljava/lang/String;

    return-object v0
.end method

.method public getLicenseDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getLicenseName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseName:Ljava/lang/String;

    return-object v0
.end method

.method public getLicenseShortDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseShortDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getLicenseWebsite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseWebsite:Ljava/lang/String;

    return-object v0
.end method

.method public setDefinedName(Ljava/lang/String;)V
    .registers 2
    .param p1, "definedName"    # Ljava/lang/String;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/License;->definedName:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public setLicenseDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "licenseDescription"    # Ljava/lang/String;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseDescription:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public setLicenseName(Ljava/lang/String;)V
    .registers 2
    .param p1, "licenseName"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseName:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public setLicenseShortDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "licenseShortDescription"    # Ljava/lang/String;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseShortDescription:Ljava/lang/String;

    .line 58
    return-void
.end method

.method public setLicenseWebsite(Ljava/lang/String;)V
    .registers 2
    .param p1, "licenseWebsite"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/License;->licenseWebsite:Ljava/lang/String;

    .line 50
    return-void
.end method
