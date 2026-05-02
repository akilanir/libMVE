.class public Lcom/mikepenz/aboutlibraries/entity/Library;
.super Ljava/lang/Object;
.source "Library.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/mikepenz/aboutlibraries/entity/Library;",
        ">;"
    }
.end annotation


# instance fields
.field private author:Ljava/lang/String;

.field private authorWebsite:Ljava/lang/String;

.field private classPath:Ljava/lang/String;

.field private definedName:Ljava/lang/String;

.field private internal:Z

.field private isOpenSource:Z

.field private libraryDescription:Ljava/lang/String;

.field private libraryName:Ljava/lang/String;

.field private libraryVersion:Ljava/lang/String;

.field private libraryWebsite:Ljava/lang/String;

.field private license:Lcom/mikepenz/aboutlibraries/entity/License;

.field private repositoryLink:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->definedName:Ljava/lang/String;

    .line 7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->internal:Z

    .line 9
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->author:Ljava/lang/String;

    .line 10
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->authorWebsite:Ljava/lang/String;

    .line 11
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryName:Ljava/lang/String;

    .line 12
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryDescription:Ljava/lang/String;

    .line 13
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryVersion:Ljava/lang/String;

    .line 14
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryWebsite:Ljava/lang/String;

    .line 17
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->isOpenSource:Z

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->repositoryLink:Ljava/lang/String;

    .line 20
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->classPath:Ljava/lang/String;

    .line 24
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "author"    # Ljava/lang/String;
    .param p2, "libraryName"    # Ljava/lang/String;
    .param p3, "libraryDescription"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->definedName:Ljava/lang/String;

    .line 7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->internal:Z

    .line 9
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->author:Ljava/lang/String;

    .line 10
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->authorWebsite:Ljava/lang/String;

    .line 11
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryName:Ljava/lang/String;

    .line 12
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryDescription:Ljava/lang/String;

    .line 13
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryVersion:Ljava/lang/String;

    .line 14
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryWebsite:Ljava/lang/String;

    .line 17
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->isOpenSource:Z

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->repositoryLink:Ljava/lang/String;

    .line 20
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->classPath:Ljava/lang/String;

    .line 27
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->author:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryName:Ljava/lang/String;

    .line 29
    iput-object p3, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryDescription:Ljava/lang/String;

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "author"    # Ljava/lang/String;
    .param p2, "libraryName"    # Ljava/lang/String;
    .param p3, "libraryDescription"    # Ljava/lang/String;
    .param p4, "libraryVersion"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->definedName:Ljava/lang/String;

    .line 7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->internal:Z

    .line 9
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->author:Ljava/lang/String;

    .line 10
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->authorWebsite:Ljava/lang/String;

    .line 11
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryName:Ljava/lang/String;

    .line 12
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryDescription:Ljava/lang/String;

    .line 13
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryVersion:Ljava/lang/String;

    .line 14
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryWebsite:Ljava/lang/String;

    .line 17
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->isOpenSource:Z

    .line 18
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->repositoryLink:Ljava/lang/String;

    .line 20
    const-string v0, ""

    iput-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->classPath:Ljava/lang/String;

    .line 33
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->author:Ljava/lang/String;

    .line 34
    iput-object p2, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryName:Ljava/lang/String;

    .line 35
    iput-object p3, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryDescription:Ljava/lang/String;

    .line 36
    iput-object p4, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryVersion:Ljava/lang/String;

    .line 37
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/mikepenz/aboutlibraries/entity/Library;)I
    .registers 4
    .param p1, "another"    # Lcom/mikepenz/aboutlibraries/entity/Library;

    .prologue
    .line 137
    invoke-virtual {p0}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mikepenz/aboutlibraries/entity/Library;->getLibraryName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 3
    check-cast p1, Lcom/mikepenz/aboutlibraries/entity/Library;

    invoke-virtual {p0, p1}, Lcom/mikepenz/aboutlibraries/entity/Library;->compareTo(Lcom/mikepenz/aboutlibraries/entity/Library;)I

    move-result v0

    return v0
.end method

.method public getAuthor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->author:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthorWebsite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->authorWebsite:Ljava/lang/String;

    return-object v0
.end method

.method public getClassPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->classPath:Ljava/lang/String;

    return-object v0
.end method

.method public getDefinedName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->definedName:Ljava/lang/String;

    return-object v0
.end method

.method public getLibraryDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getLibraryName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryName:Ljava/lang/String;

    return-object v0
.end method

.method public getLibraryVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getLibraryWebsite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryWebsite:Ljava/lang/String;

    return-object v0
.end method

.method public getLicense()Lcom/mikepenz/aboutlibraries/entity/License;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->license:Lcom/mikepenz/aboutlibraries/entity/License;

    return-object v0
.end method

.method public getRepositoryLink()Ljava/lang/String;
    .registers 2

    .prologue
    .line 112
    iget-object v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->repositoryLink:Ljava/lang/String;

    return-object v0
.end method

.method public isInternal()Z
    .registers 2

    .prologue
    .line 120
    iget-boolean v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->internal:Z

    return v0
.end method

.method public isOpenSource()Z
    .registers 2

    .prologue
    .line 104
    iget-boolean v0, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->isOpenSource:Z

    return v0
.end method

.method public setAuthor(Ljava/lang/String;)V
    .registers 2
    .param p1, "author"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->author:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public setAuthorWebsite(Ljava/lang/String;)V
    .registers 2
    .param p1, "authorWebsite"    # Ljava/lang/String;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->authorWebsite:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public setClassPath(Ljava/lang/String;)V
    .registers 2
    .param p1, "classPath"    # Ljava/lang/String;

    .prologue
    .line 132
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->classPath:Ljava/lang/String;

    .line 133
    return-void
.end method

.method public setDefinedName(Ljava/lang/String;)V
    .registers 2
    .param p1, "definedName"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->definedName:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public setInternal(Z)V
    .registers 2
    .param p1, "internal"    # Z

    .prologue
    .line 124
    iput-boolean p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->internal:Z

    .line 125
    return-void
.end method

.method public setLibraryDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "libraryDescription"    # Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryDescription:Ljava/lang/String;

    .line 77
    return-void
.end method

.method public setLibraryName(Ljava/lang/String;)V
    .registers 2
    .param p1, "libraryName"    # Ljava/lang/String;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryName:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public setLibraryVersion(Ljava/lang/String;)V
    .registers 2
    .param p1, "libraryVersion"    # Ljava/lang/String;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryVersion:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public setLibraryWebsite(Ljava/lang/String;)V
    .registers 2
    .param p1, "libraryWebsite"    # Ljava/lang/String;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->libraryWebsite:Ljava/lang/String;

    .line 93
    return-void
.end method

.method public setLicense(Lcom/mikepenz/aboutlibraries/entity/License;)V
    .registers 2
    .param p1, "license"    # Lcom/mikepenz/aboutlibraries/entity/License;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->license:Lcom/mikepenz/aboutlibraries/entity/License;

    .line 101
    return-void
.end method

.method public setOpenSource(Z)V
    .registers 2
    .param p1, "isOpenSource"    # Z

    .prologue
    .line 108
    iput-boolean p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->isOpenSource:Z

    .line 109
    return-void
.end method

.method public setRepositoryLink(Ljava/lang/String;)V
    .registers 2
    .param p1, "repositoryLink"    # Ljava/lang/String;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/mikepenz/aboutlibraries/entity/Library;->repositoryLink:Ljava/lang/String;

    .line 117
    return-void
.end method
